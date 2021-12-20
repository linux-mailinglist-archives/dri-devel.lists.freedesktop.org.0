Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CCA47B631
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 00:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B741710E2F1;
	Mon, 20 Dec 2021 23:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00B810E2F1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 23:32:33 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id m15so10665794pgu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 15:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S1CaAMzMdUWRllGWVSSnlmygg49USGAWCyTrps8DTTk=;
 b=tAd6dpJBpXsPk/WHLBfgr2x/0A4DwP2iwzDxw9vFO3Dmh5AVSlYYOwS0MBaoXyomul
 rfZSKzZ5pCbwHqitNy10J+iFhzv8yjzPxDxazpjxcOWfvfhjpTcjlANCrZWqqAVl4yAy
 gDLRcE/CAdowqHW9IWd5J9YijL9cmBx0BjUCFd5gt6m3VHfQha+C4xaUCwYsVAoirB4q
 Dn1roAMTieemh90Xp1EcYXsAO26UfvYHdTKkLkhvRCU7GliHTbWsaputFEL+zF4Bk39D
 wlhUrY2oJVrRto+nJLQqssIQH67UiS61wKQPvSewA6XmyRroBM+vXUGFrY/w9lcQhApk
 +pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1CaAMzMdUWRllGWVSSnlmygg49USGAWCyTrps8DTTk=;
 b=Mthx1614pUb+fozlr3dUKjnozJSXNzsnhzSBsFrSU8YaXIdVxVstH2wU7+I0jRJ23M
 9Icl1E37y3y891x/+CRUVfycK8PgzuZbksb/pxQHDxzbjvY0XEmbxStvGEQ4MlZ0v8H6
 q2gs417FRePkWJL4+sT8UzDcQqq+XRWAzHbOzccKIxSml4br//or9atvTR7WQrX5q8yK
 YHgpfZQtHwAJnJisZR0/aGMjiPRbo0+pO68sPbpLN4cz0/GA1ROMknc09bBsGej0hFYg
 NbqwzymKSVmwtQ5iL/BILa76nxRzdjh/40VAYqarwsSHAE/TUFyPzlCSdIabZRw6VA0s
 4DVw==
X-Gm-Message-State: AOAM531hIKl1IYH+JzBGzzTOqrXYbvy+OcNKTpq+5ziS+R4/JRN39mZZ
 dyTFllS3wjUkx1Q2S/LHKe3wcwZQA9QGUdCRK8aSlw==
X-Google-Smtp-Source: ABdhPJxNdT2EAR8/xw/2m2mBcvGk5Ih4cPMuJwu3vdyoVcmP+UXPY+b6YU4MY6rBZPGQ/tfQ/xW5q9SMzNGQ0R529VU=
X-Received: by 2002:a63:85c8:: with SMTP id u191mr409166pgd.146.1640043152585; 
 Mon, 20 Dec 2021 15:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20211217202850.1967594-1-rajatja@google.com>
 <YcDclHaoiKX8dbXG@google.com>
 <CACK8Z6Hk0BjEVgMfQ+LuM2NjCUcQLedL0O2=XR8R2TgkX=SYdQ@mail.gmail.com>
 <YcD+v/VVWUmhvuoM@google.com>
In-Reply-To: <YcD+v/VVWUmhvuoM@google.com>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 20 Dec 2021 15:31:56 -0800
Message-ID: <CACK8Z6F+a9c=6UWgYbmCfs0j+TySuuw25T2zsdrNa0jnfVjHPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: Add driver for ChromeOS
 privacy-screen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: gwendal@google.com,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@google.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thanks for your comments. I posted a v3 that addresses most of your
comments here:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20211220222828.2625444-2-rajatja@google.com/

Please also see inline below.

On Mon, Dec 20, 2021 at 2:08 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Dec 20, 2021 at 12:21:47PM -0800, Rajat Jain wrote:
> > Hi Dmitry,
> >
> > Thanks for the review. Please see inline.
> >
> > On Mon, Dec 20, 2021 at 11:42 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Rajat,
> > >
> > > On Fri, Dec 17, 2021 at 12:28:49PM -0800, Rajat Jain wrote:
> > > > This adds the ACPI driver for the ChromeOS privacy screen that is
> > > > present on some chromeos devices.
> > > >
> > > > Note that ideally, we'd want this privacy screen driver to be probed
> > > > BEFORE the drm probe in order to avoid a drm probe deferral:
> > > > https://hansdegoede.livejournal.com/25948.html
> > > >
> > > > In practise, I found that ACPI drivers are bound to their devices AFTER
> > > > the drm probe on chromebooks. So on chromebooks with privacy-screen,
> > > > this patch along with the next one in this series results in a probe
> > > > deferral of about 250ms for i915 driver. However, it did not result in
> > > > any user noticeable delay of splash screen in my personal experience.
> > > >
> > > > In future if this probe deferral turns out to be an issue, we can
> > > > consider turning this ACPI driver into something that is probed
> > > > earlier than the drm drivers.
> > > >
> > > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > > ---
> > > > v2: * Reword the commit log
> > > >     * Make the Kconfig into a tristate
> > > >     * Reorder the patches in the series.
> > > >
> > > >  drivers/platform/chrome/Kconfig              |   9 ++
> > > >  drivers/platform/chrome/Makefile             |   1 +
> > > >  drivers/platform/chrome/chromeos_priv_scrn.c | 132 +++++++++++++++++++
> > > >  3 files changed, 142 insertions(+)
> > > >  create mode 100644 drivers/platform/chrome/chromeos_priv_scrn.c
> > > >
> > > > diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> > > > index ccc23d8686e8..d1c209a45a62 100644
> > > > --- a/drivers/platform/chrome/Kconfig
> > > > +++ b/drivers/platform/chrome/Kconfig
> > > > @@ -243,6 +243,15 @@ config CROS_USBPD_NOTIFY
> > > >         To compile this driver as a module, choose M here: the
> > > >         module will be called cros_usbpd_notify.
> > > >
> > > > +config CHROMEOS_PRIVACY_SCREEN
> > > > +     tristate "ChromeOS Privacy Screen support"
> > > > +     depends on ACPI
> > > > +     depends on DRM
> > > > +     select DRM_PRIVACY_SCREEN
> > > > +     help
> > > > +       This driver provides the support needed for the in-built electronic
> > > > +       privacy screen that is present on some ChromeOS devices.
> > > > +
> > > >  source "drivers/platform/chrome/wilco_ec/Kconfig"
> > > >
> > > >  endif # CHROMEOS_PLATFORMS
> > > > diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> > > > index f901d2e43166..cfa0bb4e9e34 100644
> > > > --- a/drivers/platform/chrome/Makefile
> > > > +++ b/drivers/platform/chrome/Makefile
> > > > @@ -4,6 +4,7 @@
> > > >  CFLAGS_cros_ec_trace.o:=             -I$(src)
> > > >
> > > >  obj-$(CONFIG_CHROMEOS_LAPTOP)                += chromeos_laptop.o
> > > > +obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)        += chromeos_priv_scrn.o
> > > >  obj-$(CONFIG_CHROMEOS_PSTORE)                += chromeos_pstore.o
> > > >  obj-$(CONFIG_CHROMEOS_TBMC)          += chromeos_tbmc.o
> > > >  obj-$(CONFIG_CROS_EC)                        += cros_ec.o
> > > > diff --git a/drivers/platform/chrome/chromeos_priv_scrn.c b/drivers/platform/chrome/chromeos_priv_scrn.c
> > > > new file mode 100644
> > > > index 000000000000..a4cbf5c79c2a
> > > > --- /dev/null
> > > > +++ b/drivers/platform/chrome/chromeos_priv_scrn.c
> > >
> > > I think we can spare a few more characters :) chromeos_privacy_screen.c
> > > maybe?

Done in v3.

> > >
> > > And also see if maybe variables in the code are not that unseemly long
> > > even if not abbreviated?

Done in v3.

> >
> > Sure, I can certainly replace "chromeos_priv_scrn" with
> > "chromeos_privacy_screen" everywhere. Some of the variables may be a
> > little long, but I think that should be OK (my main concern was
> >
> > chromeos_privacy_screen_device_ids
> > chromeos_privacy_screen_get_hw_state()
> >
> > Let me know if that doesn't sound right (in which case, I can probably
> > omit "chromeos" from the local variable and function names)
>
> Another option to go all the way into different direction, and use
> "cps_" prefix for everything. It is probably just me but combination of
> "priv" "scrn" just grates on me ;)

Done in v3.

>
> >
> > >
> > > > @@ -0,0 +1,132 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +/*
> > > > + *  chromeos_priv_scrn.c - ChromeOS Privacy Screen support
> > >
> > > I'd avoid mentioning file name as those tend to change.
> >
> > Ack, will do.

Done in v3.

> >
> > >
> > > > + *
> > > > + * Copyright (C) 2022 The Chromium OS Authors
> > >
> > > This is not correct copyright for kernel contributions. It should be
> > > attributed to "Google LLC". Note that it is different from CrOS
> > > userspace.
> > >
> >
> > Ack, will do.
Done in v3.

> >
> > > > + *
> > > > + */
> > > > +
> > > > +#include <linux/acpi.h>
> > > > +#include <drm/drm_privacy_screen_driver.h>
> > > > +
> > > > +/*
> > > > + * The DSM (Define Specific Method) constants below are the agreed API with
> > > > + * the firmware team, on how to control privacy screen using ACPI methods.
> > > > + */
> > > > +#define PRIV_SCRN_DSM_REVID          1       /* DSM version */
> > > > +#define PRIV_SCRN_DSM_FN_GET_STATUS  1       /* Get privacy screen status */
> > > > +#define PRIV_SCRN_DSM_FN_ENABLE              2       /* Enable privacy screen */
> > > > +#define PRIV_SCRN_DSM_FN_DISABLE     3       /* Disable privacy screen */
> > > > +
> > > > +static const guid_t chromeos_priv_scrn_dsm_guid =
> > > > +                 GUID_INIT(0xc7033113, 0x8720, 0x4ceb,
> > > > +                           0x90, 0x90, 0x9d, 0x52, 0xb3, 0xe5, 0x2d, 0x73);
> > > > +
> > > > +static void
> > > > +chromeos_priv_scrn_get_hw_state(struct drm_privacy_screen *drm_priv_scrn)
> > > > +{
> > > > +     union acpi_object *obj;
> > > > +     acpi_handle handle;
> > > > +     struct device *priv_scrn = drm_priv_scrn->dev.parent;
> > >
> > > This is really bad that we need to poke into internals of
> > > drm_privacy_screen to get to "our" device. I think there is only one
> > > consume of the privacy screen API at the moment, the thinkpad driver, so
> > > maybe it is not too late to change drm_privacy_screen_register() to
> > > either accept instance of struct drm_privacy_screen (which then could be
> > > embedded into something) or accept a void pointer to attach arbitrary
> > > data to it, and then add drm_privacy_screen_get_drvdata() to get to that
> > > pointer.
> > >
> >
> > Sure, ack, will do.
Done in v3.

> >
> > > > +
> > > > +     if (!priv_scrn)
> > > > +             return;
> > >
> > > This should not happen regardless.
> > >
> >
> > Sure, ack, will remove.
Done in v3.

> >
> > > > +
> > > > +     handle = acpi_device_handle(to_acpi_device(priv_scrn));
> > > > +     obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > > > +                             PRIV_SCRN_DSM_REVID,
> > > > +                             PRIV_SCRN_DSM_FN_GET_STATUS, NULL);
> > > > +     if (!obj) {
> > > > +             dev_err(priv_scrn, "_DSM failed to get privacy-screen state\n");
> > >
> > > Can we do something about it? A dedicated status? Also, can we print
> > > ACPI-specific error?
> > >
> >
> > Umm ... I don't know. We don't know anything beyond that the ACPI
> > method wasn't able to get us anything. There are no other status other
> > than the ones specified in enum drm_privacy_screen_status. Since that
> > enum was the result of almost 1.5 year of discussion between pekka,
> > Hans and other or drm mailing lists, I don't wat to change that.
>
> OK, I guess we need to chose a fine default here, probably assume
> privacy screen is inoperable/disabled.

On error conditions (both for read and write) I'd prefer that we leave
the state unchanged. The reason being that this state, the associated
state machine, as well as the semantics (who is allowed to change the
value - kernel, userspace etc, and cache / reuse the value etc, and
under what conditions etc) were very long debated before a conclusion
and agreement was reached. A value of PRIVACY_SCREEN_DISABLED_LOCKED
might mean that the user space / kernel may not attempt to change it
again (assuming the presence of physical slider switch), and the
driver is expected to notify the kernel if that switch slider changes
again. I don't understand it very well, and Chromebooks don't have
such a slider switch, so I'm hesitant to change it, especially since
it provides no real advantage in our case, and perhaps may cause
confusion.

I'm OK to change it though if you are still not convinced.

>
> >
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     if (obj->type != ACPI_TYPE_INTEGER)
> > > > +             dev_err(priv_scrn, "Bad _DSM to get privacy-screen state\n");
> > >
> > > Same here.
> >
> > Just like above, we only know that it couldn't get us what we need.
> > There isn't anything we can do.
>
> I'd force the status to disabled here as well.
>
> >
> > >
> > > > +     else if (obj->integer.value == 1)
> > > > +             drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> > > > +                     PRIVACY_SCREEN_ENABLED;
> > > > +     else
> > > > +             drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> > > > +                     PRIVACY_SCREEN_DISABLED;
> > > > +
> > > > +     ACPI_FREE(obj);
> > > > +}
> > > > +
> > > > +static int
> > > > +chromeos_priv_scrn_set_sw_state(struct drm_privacy_screen *drm_priv_scrn,
> > > > +                             enum drm_privacy_screen_status state)
> > > > +{
> > > > +     union acpi_object *obj = NULL;
> > > > +     acpi_handle handle;
> > > > +     struct device *priv_scrn = drm_priv_scrn->dev.parent;
> > > > +
> > > > +     if (!priv_scrn)
> > > > +             return -ENODEV;
> > >
> > > This should not happen regardless.
> >
> > Ack, will remove.
Done in v3


> >
> > >
> > > > +
> > > > +     handle = acpi_device_handle(to_acpi_device(priv_scrn));
> > > > +
> > > > +     if (state == PRIVACY_SCREEN_DISABLED) {
> > > > +             obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > > > +                                     PRIV_SCRN_DSM_REVID,
> > > > +                                     PRIV_SCRN_DSM_FN_DISABLE, NULL);
> > > > +     } else if (state == PRIVACY_SCREEN_ENABLED) {
> > > > +             obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > > > +                                     PRIV_SCRN_DSM_REVID,
> > > > +                                     PRIV_SCRN_DSM_FN_ENABLE, NULL);
> > > > +     } else {
> > > > +             dev_err(priv_scrn, "Bad attempt to set privacy-screen status\n");
> > > > +             return -EINVAL;
> > >
> > > Print state to aid in tracking bugs?
> >
> > Ack, will do.
Done in v3.

> >
> > >
> > > > +     }
> > > > +
> > > > +     if (!obj) {
> > > > +             dev_err(priv_scrn, "_DSM failed to set privacy-screen state\n");
> > >
> > > Can we print ACPI-specific error?
> >
> > AFAICS, we do not know what went wrong. The method gives us a NULL
> > (meaning something went wrong) or a value which means all is OK. I do
> > see that acpi_evaluate_dsm() prints something in case of failure, in
> > case that si what you were looking for..
>
> I see that acpi_evaluate_dsm() already provides diagnostic, so you can
> ignore me here.
>
> >
> > >
> > > > +             return -EIO;
> > > > +     }
> > > > +
> > > > +     drm_priv_scrn->hw_state = drm_priv_scrn->sw_state = state;
> > > > +     ACPI_FREE(obj);
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct drm_privacy_screen_ops chromeos_priv_scrn_ops = {
> > > > +     .get_hw_state = chromeos_priv_scrn_get_hw_state,
> > > > +     .set_sw_state = chromeos_priv_scrn_set_sw_state,
> > > > +};
> > > > +
> > > > +static int chromeos_priv_scrn_add(struct acpi_device *adev)
> > > > +{
> > > > +     struct drm_privacy_screen *drm_priv_scrn =
> > > > +             drm_privacy_screen_register(&adev->dev, &chromeos_priv_scrn_ops);
> > > > +
> > > > +     if (IS_ERR(drm_priv_scrn)) {
> > > > +             dev_err(&adev->dev, "Error registering privacy-screen\n");
> > > > +             return PTR_ERR(drm_priv_scrn);
> > > > +     }
> > > > +
> > > > +     dev_info(&adev->dev, "registered privacy-screen '%s'\n",
> > > > +              dev_name(&drm_priv_scrn->dev));
> > >
> > > I don't think we need be this noisy.
> > >
> >
> > This can help us track the probe deferral related bugs (and whether it
> > is too bad). Yes, we have a probe deferral with these patches.
> > Essentially I wanted these prints because they can be taken as markers
> > to determine how much delay is the probe deferral costing us.
>
> I am sure you can get boot timeline with debug initcalls option. Then
> you will see when this module was initialized vs i915.

It isn't about module initialization and / or ACPI driver registration
timeline, but rather about the timeline of chromeos_priv_scrn_add()
getting called. I did some experiments in the earlier version of my
patches where I was using subsys initcall I think, to register my
driver early on. I found that even though the ACPI driver is
registered early on (i.e. before drm probe), the
chromeos_priv_scrn_add() gets called much later (after drm probe has
already returned EPROBE_DEFER). So debugging with initcalls may not
help. I'm saying this because this probe deferral did cause me a lot
of confusion while I was working on this, and I feel such a print
would have saved time, rather than resorting to hand debugging.

Another point to consider is that this print helps monitor and bisect
vanila (golden eye) Chromium OS images for regressions - i.e. to
determine if the probe deferral delay (currently ~250ms) has regressed
beyond a certain time threshold (say >500ms and causes a noticeable
delay in the splash screen).

What do you think?

Thanks & Best Regards,

Rajat

>
> Thanks.


>
> --
> Dmitry
