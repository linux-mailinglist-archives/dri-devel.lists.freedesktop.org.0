Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13655149661
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97136E881;
	Sat, 25 Jan 2020 15:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEB172BB3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 20:23:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id t23so2018375lfk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eibpFJ/dL/po7h/5lUN6b9t7vGqoq6edRosDwybFErA=;
 b=THXVTwkodkl4NV0lthJq64T8BkB+kb+ffvrbOIIER8YxEvQBCT2o/7LDw2RGVsJRL2
 uXOqDAz/tYlhLLwyQPSbMtBDwZfl9wCyed52H+MSR+Bhx3i7TtCEQ5VJU92oS91V0RFM
 ZV5jHG9CroKc3T7vN4hYoBeavgcbdaIhntw1I43u67p8jWEleo+IoYekee0/fKj5k0q5
 j7pVKy/aHd/X5lwcOmIBtCfUfiW1DfPSHtSfw5MX86ChFkP7YXD5BEfd29Jxxk9IAv24
 S4NJIPiBbOExUxqQNGmNrCJhRl4iIoj27x5+BxRyuAPtp8XZPn0qsKyzOjcH1s/aC3Lz
 SQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eibpFJ/dL/po7h/5lUN6b9t7vGqoq6edRosDwybFErA=;
 b=lnGxpgCbcy3Xdjo8Hwam8X87yswM2nN5pa2XTQnzkyjE2iI1YvKiZ0odQqClEVP3Wj
 48ICbIlW1meKJXL5qmeO7MwWx5hADAfQUJy9zRqZdz49xZtR3E+s4STTEgRuE5KH+K77
 DOETVOJifvMfcdSIvcKQ0zZ5d31HpzQwVsBFzpe/RgkZFjblMtqb33TaY0OOWWlRgaHe
 ma5Fb2INlOwOQBRz1TL+0RhYopN4zV8qv+gBRLF1faoHMcWDIC3ePcG51JNsLoVxEPIp
 UYILv9csxQ6RG3CZTfAiZrJrT/3DLE06jeFVXaePGsRjksSR3LhEbglC1WixKCg5wdHE
 BxAg==
X-Gm-Message-State: APjAAAWsG7QM0bIl2UvLvAIlKv5keqPH1yE6ykwrcigH5rVRppndXjBc
 GfeGxFxViLHuMKtHg4JLeU9qzrdTT3572fsb2hBD9A==
X-Google-Smtp-Source: APXvYqxuuu1/zxYUm5WDAcBoC5BQJSb6/tHB3M19FeY/I611GVLHEkCovpovRlvKoQIBXafdXuc2bwrDj8ePsYYTNKk=
X-Received: by 2002:a19:4208:: with SMTP id p8mr2257984lfa.160.1579897417530; 
 Fri, 24 Jan 2020 12:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20191220200353.252399-1-rajatja@google.com>
 <20191220200353.252399-2-rajatja@google.com>
 <87v9p1gk4z.fsf@intel.com>
In-Reply-To: <87v9p1gk4z.fsf@intel.com>
From: Rajat Jain <rajatja@google.com>
Date: Fri, 24 Jan 2020 12:23:00 -0800
Message-ID: <CACK8Z6GN1tXj+a3HHgyVKzTcgYBB+v8gpLCqh+YgTU0tS5b-OA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/i915: Lookup and attach ACPI device node for
 connectors
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Jesse Barnes <jsbarnes@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 intel-gfx@lists.freedesktop.org, Mat King <mathewk@google.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

Thank you for the review. Please see inline.

On Fri, Jan 24, 2020 at 3:37 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 20 Dec 2019, Rajat Jain <rajatja@google.com> wrote:
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
> > v5: same as v4
> > v4: Same as v3
> > v3: fold the code into existing acpi_device_id_update() function
> > v2: formed by splitting the original patch into ACPI lookup, and privacy
> >     screen property. Also move it into i915 now that I found existing code
> >     in i915 that can be re-used.
> >
> >  drivers/gpu/drm/i915/display/intel_acpi.c     | 24 +++++++++++++++++++
> >  .../drm/i915/display/intel_display_types.h    |  3 +++
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +++
> >  3 files changed, 30 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > index e21fb14d5e07..101a56c08996 100644
> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > @@ -222,11 +222,23 @@ static u32 acpi_display_type(struct intel_connector *connector)
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
> >       struct drm_device *drm_dev = &dev_priv->drm;
> >       struct intel_connector *connector;
> >       struct drm_connector_list_iter conn_iter;
> > +     struct device *dev = &drm_dev->pdev->dev;
>
> Hmm, already pushed patch 1 with the unfortunate "drm_dev" local. We use
> "dev" for struct drm_device * and almost never use struct device.

Sorry, I did not know. I'll send an independent fixup patch for patch
1 on top of drm-intel-next-queued (or let me know if you want to
handle it). I will also change this patch to rename the variable.

>
> > +     struct acpi_device *conn_dev;
> > +     u64 conn_addr;
> >       u8 display_index[16] = {};
> >
> >       /* Populate the ACPI IDs for all connectors for a given drm_device */
> > @@ -242,6 +254,18 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
> >               device_id |= display_index[type]++ << ACPI_DISPLAY_INDEX_SHIFT;
> >
> >               connector->acpi_device_id = device_id;
> > +
> > +             /* Build the _ADR to look for */
> > +             conn_addr = device_id | ACPI_DEVICE_ID_SCHEME |
> > +                             ACPI_BIOS_CAN_DETECT;
> > +
> > +             DRM_DEV_INFO(dev, "Checking connector ACPI node at _ADR=%llX\n",
> > +                          conn_addr);
>
> This is more than a little verbose. One line of INFO level dmesg for
> every connector at boot and at resume.
>
> Please use the new drm_dbg_kms() macro for this.

Will do.

>
> > +
> > +             /* Look up the connector device, under the PCI device */
> > +             conn_dev = acpi_find_child_device(ACPI_COMPANION(dev),
> > +                                               conn_addr, false);
> > +             connector->acpi_handle = conn_dev ? conn_dev->handle : NULL;
>
> acpi_device_handle(conn_dev)
>

Will do.


> >       }
> >       drm_connector_list_iter_end(&conn_iter);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 1a7334dbe802..0a4a04116091 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -407,6 +407,9 @@ struct intel_connector {
> >       /* ACPI device id for ACPI and driver cooperation */
> >       u32 acpi_device_id;
> >
> > +     /* ACPI handle corresponding to this connector display, if found */
> > +     void *acpi_handle;
> > +
>
> The type is acpi_handle. It's none of our business to know what the
> underlying type is.

Will do.

>
> >       /* Reads out the current hw, returning true if the connector is enabled
> >        * and active (i.e. dpms ON state). */
> >       bool (*get_hw_state)(struct intel_connector *);
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index b05b2191b919..93cece8e2516 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -45,6 +45,7 @@
> >  #include "i915_debugfs.h"
> >  #include "i915_drv.h"
> >  #include "i915_trace.h"
> > +#include "intel_acpi.h"
> >  #include "intel_atomic.h"
> >  #include "intel_audio.h"
> >  #include "intel_connector.h"
> > @@ -6623,6 +6624,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
> >
> >               connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
> >
> > +             /* Lookup the ACPI node corresponding to the connector */
> > +             intel_acpi_device_id_update(dev_priv);
>
> Auch, this is problematic. It iterates all connectors, for every DP
> connector being added. In the middle of registering all connectors.
>
> From the POV of this patch alone, this is also unnecessary. This gets
> called via intel_opregion_register() after all connectors have been
> registered.
>
> I am aware it's not enough for your next patch, because it will need the
> acpi handle right here.
>
> I'm wondering if we need to maintain display_index[] in struct
> drm_i915_private, and update that as connectors get added instead of all
> at once in the end.

Sure, I can do that.

> connector->acpi_device_id never changes, does it,
> even though we keep updating it?

This is the part I am not so sure about - I hypothesized that theory
because of the current behavior in code (i.e. it is getting updated in
intel_opregion_resume() path). May be it does not change, I was not
sure, so I did not want to create any regression in the intel_opregion
code that I did not understand. I tried on my system and as far as I
could experiment, I did not see it changing. Please let me know if you
would like me to change my code to:

1) Maintain drm_i915_private->display_index[] and update it as
connectors are added.
2) Remove the code to update it on every resume and while registering
the connector.

Thanks & Best Regards,

Rajat

>
> BR,
> Jani.
>
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
