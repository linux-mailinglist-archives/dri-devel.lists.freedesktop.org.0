Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD917B7F9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEABD6EC8A;
	Fri,  6 Mar 2020 08:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8A26EC54
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 03:27:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so638254ljp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 19:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gHB8pqib2S8EX6dGxoGL3fsksSX+3LObQT7Yk94+vMs=;
 b=KS9q4m3biU+vs0SPnuKzkrDkK7BlMsalOQoqam2tJwCtGKLOWhHrQ/fppZdbmlkTB9
 G4oapdgJaFU6Mg+nQECTi13PwddA5si+9yZAX/07DcFt+HMv2DOccMF51x6T1d2hL7+i
 YcsPaujIpywMuktjBgVQMNtOEJXlbhHIkRoFvLg0QHYONzSszDmvIw0b5PNK4TBqRQmi
 Y6EmvuEVxRx27JbUr4KY7Z3+6W3ujdJYtu+1Wf0hk8KurorfjK0lS4hwXPKet0zYDcg5
 8WEVgvZuyHepmeDGKJ741Ey4oEYOkybOv1IZqntIjhONOBzWbV+SUc+2BsV1rPgBhry2
 DwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHB8pqib2S8EX6dGxoGL3fsksSX+3LObQT7Yk94+vMs=;
 b=LbZJ1o9cU+KSlAR704/9JfAp2QLsRAK1L/oc4cuMqvG+UZd+OyEuECXRjrCabTcElG
 o6Eb5hXvx98N0CUsv2uRdoKI1yCmOkrMeCRqPeOG1QcMt4K/LsdBtJaLzQkqh4dYleud
 zvrjLNczBbhku0CQFKBFTKiaeDqqVbZkowNiZcBQ2oPhZZjMVeUBVbd01tPOxyR08k8b
 BmNwU79XhPPE1F/k7s16wb+1cly7kw5HAckPj2G7V2qJ9RqCcj7uPTo+mqS8uOTVIBqv
 b+7wFlQObE+klBXY67Gxwoa8TJo39Il6VGglVKOEvw2J6K6TIVIsoVFC6GpuJYSZlsss
 pHXw==
X-Gm-Message-State: ANhLgQ2QnAIy1AMVzY98C2v28LCRxyte0jc3JZLz2FeZ3m9zO8YYJPqt
 nWK6DSvwo8uzmSTsYodBWd1zgDFL+wFbt//FFE86UQ==
X-Google-Smtp-Source: ADFU+vuoQVr56RR0ECd3iys8NXTFKB5BD4fVGqtSSx6+qrBc+FXqTlY19nI2H9lM9bE8nj3mL9NaX/msRXSYVkaasgY=
X-Received: by 2002:a2e:8745:: with SMTP id q5mr701967ljj.120.1583465270159;
 Thu, 05 Mar 2020 19:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20200305012338.219746-1-rajatja@google.com>
 <20200305012338.219746-3-rajatja@google.com>
 <87o8tbnnqa.fsf@intel.com>
In-Reply-To: <87o8tbnnqa.fsf@intel.com>
From: Rajat Jain <rajatja@google.com>
Date: Thu, 5 Mar 2020 19:27:13 -0800
Message-ID: <CACK8Z6HRB9q1KeborGr7V-0Qp0AApHV6gBTkc6xD5NokH8gr0w@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/i915: Lookup and attach ACPI device node for
 connectors
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Mark Pearson <mpearson@lenovo.com>, Tomoki Maruichi <maruichit@lenovo.com>,
 Jesse Barnes <jsbarnes@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 intel-gfx@lists.freedesktop.org, Mat King <mathewk@google.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@denx.de>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 5, 2020 at 1:41 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Wed, 04 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
> > Lookup and attach ACPI nodes for intel connectors. The lookup is done
> > in compliance with ACPI Spec 6.3
> > https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> > (Ref: Pages 1119 - 1123).
> >
> > This can be useful for any connector specific platform properties. (This
> > will be used for privacy screen in next patch).
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v6: Addressed minor comments from Jani at
> >     https://lkml.org/lkml/2020/1/24/1143
> >      - local variable renamed.
> >      - used drm_dbg_kms()
> >      - used acpi_device_handle()
> >      - Used opaque type acpi_handle instead of void*
> > v5: same as v4
> > v4: Same as v3
> > v3: fold the code into existing acpi_device_id_update() function
> > v2: formed by splitting the original patch into ACPI lookup, and privacy
> >     screen property. Also move it into i915 now that I found existing code
> >     in i915 that can be re-used.
> >
> >  drivers/gpu/drm/i915/display/intel_acpi.c     | 24 +++++++++++++++++++
> >  .../drm/i915/display/intel_display_types.h    |  5 ++++
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +++
> >  3 files changed, 32 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > index 3e6831cca4ac1..870c1ad98df92 100644
> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > @@ -222,11 +222,22 @@ static u32 acpi_display_type(struct intel_connector *connector)
> >       return display_type;
> >  }
> >
> > +/*
> > + * Ref: ACPI Spec 6.3
> > + * https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> > + * Pages 1119 - 1123 describe, what I believe, a standard way of
> > + * identifying / addressing "display panels" in the ACPI. It provides
> > + * a way for the ACPI to define devices for the display panels attached
> > + * to the system. It thus provides a way for the BIOS to export any panel
> > + * specific properties to the system via ACPI (like device trees).
> > + */
> >  void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
> >  {
> >       struct drm_device *dev = &dev_priv->drm;
> >       struct intel_connector *connector;
> >       struct drm_connector_list_iter conn_iter;
> > +     struct acpi_device *conn_dev;
> > +     u64 conn_addr;
> >       u8 display_index[16] = {};
> >
> >       /* Populate the ACPI IDs for all connectors for a given drm_device */
> > @@ -242,6 +253,19 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
> >               device_id |= display_index[type]++ << ACPI_DISPLAY_INDEX_SHIFT;
> >
> >               connector->acpi_device_id = device_id;
> > +
> > +             /* Build the _ADR to look for */
> > +             conn_addr = device_id | ACPI_DEVICE_ID_SCHEME |
> > +                             ACPI_BIOS_CAN_DETECT;
> > +
> > +             drm_dbg_kms(dev, "Checking connector ACPI node at _ADR=%llX\n",
> > +                         conn_addr);
> > +
> > +             /* Look up the connector device, under the PCI device */
> > +             conn_dev = acpi_find_child_device(
> > +                                     ACPI_COMPANION(&dev->pdev->dev),
> > +                                     conn_addr, false);
> > +             connector->acpi_handle = acpi_device_handle(conn_dev);
> >       }
> >       drm_connector_list_iter_end(&conn_iter);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 5e00e611f077f..d70612cc1ba2a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -411,9 +411,14 @@ struct intel_connector {
> >        */
> >       struct intel_encoder *encoder;
> >
> > +#ifdef CONFIG_ACPI
> >       /* ACPI device id for ACPI and driver cooperation */
> >       u32 acpi_device_id;
> >
> > +     /* ACPI handle corresponding to this connector display, if found */
> > +     acpi_handle acpi_handle;
> > +#endif
> > +
> >       /* Reads out the current hw, returning true if the connector is enabled
> >        * and active (i.e. dpms ON state). */
> >       bool (*get_hw_state)(struct intel_connector *);
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 0a417cd2af2bc..171821113d362 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -44,6 +44,7 @@
> >  #include "i915_debugfs.h"
> >  #include "i915_drv.h"
> >  #include "i915_trace.h"
> > +#include "intel_acpi.h"
> >  #include "intel_atomic.h"
> >  #include "intel_audio.h"
> >  #include "intel_connector.h"
> > @@ -6868,6 +6869,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
> >
> >               connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
> >
> > +             /* Lookup the ACPI node corresponding to the connector */
> > +             intel_acpi_device_id_update(dev_priv);
>
> I find this part problematic.
>
> Normally, we call the function at probe via i915_driver_register() ->
> intel_opregion_register() -> intel_opregion_resume() ->
> intel_didl_outputs() -> intel_acpi_device_id_update(). It gets called
> *once* at probe, after we have all the outputs (and thus connectors)
> figured out.
>
> This in turn calls it for every DP connector, before we even have all
> connectors registered. But it also re-iterates the previously handled
> connectors again and again.
>
> The problem, of course, is that you'll need connector->acpi_handle to
> figure out whether the feature is present and whether the property is
> needed. Figuring out acpi_handle also requires
> connector->acpi_device_id.
>
> It's a bit of a catch-22.
>
> I think the options are:
>
> 1) See if we can postpone creating and attaching properties to connector
> ->late_register hook. (I didn't have the time to look into it yet, at
> all.)

Apparently not. The drm core doesn't like to add properties in
late_register() callback. I just tried it and get this warning:

[    1.223163] WARNING: CPU: 2 PID: 1 at
drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xab/0xaf
....
<snip>
.....
[    1.223540] Call Trace:
[    1.223540]  drm_property_create+0xcc/0x155
[    1.223540]  drm_property_create_enum+0x26/0x79
[    1.223540]  intel_attach_privacy_screen_property+0x3a/0x5d
[    1.223540]  intel_dp_connector_register+0x6a/0xa8
[    1.223540]  drm_connector_register+0x61/0xaa
[    1.223540]  drm_connector_register_all+0x46/0x8b
[    1.223540]  drm_modeset_register_all+0x3e/0x67
[    1.223540]  drm_dev_register+0x124/0x187
[    1.223540]  i915_driver_probe+0xa18/0xda0
[    1.223540]  i915_pci_probe+0x145/0x168

>
> 2) Provide a way to populate connector->acpi_device_id and
> connector->acpi_handle on a per-connector basis. At least the device id
> remains constant for the lifetime of the drm_device

Are you confirming that the connector->acpi_device_id remains constant
for the lifetime of the drm_device, as calculated in
intel_acpi_device_id_update()?  Even in the face of external displays
(monitors) being connected and disconnected during the lifetime of the
system? If so, then I think we can have a solution.

> (why do we keep
> updating it at every resume?!) but can we be sure ->acpi_handle does
> too? (I don't really know my way around ACPI.)

I don't understand why this was being updated on every resume in that
case (this existed even before my patchset). I believe we do not need
it. Yes, the ->acpi_handle will not change if the ->acpi_device_id
does not change. I believe the way forward should then be to populate
connector->acpi_device_id and connector->acpi_handle ONE TIME at the
time of connector init (and not update it on every resume). Does this
sound ok?

I can write the code up and send as my next patch iteration.

Thanks,

Rajat

>



> >       }
> >  }
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
