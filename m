Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30D47BC93
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9606A10E545;
	Tue, 21 Dec 2021 09:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365A10FAE3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 22:08:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 x1-20020a17090a2b0100b001b103e48cfaso674145pjc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E4sisNPn775VRDqqvJeTohz0oBTi8F8Lv6HK2mPSDMw=;
 b=FWRG9P40ECkALD8VjK1VwGX1Z1ID+wPZCe2m1GhfOprQ3SXV9u+MMnx0kXmSL90Ro2
 HWTiMSw61Rw4MWCUhYj0simFBZuJFEV1Ce+QgzvVjbau+ZhTgmyCHlAzKhVgGV+YbdCE
 7cc4jeesxJq6oDoDDN4Wpp0NbPEicB1ubZWwV5WjOLuC2OYJiV4pZ3Xvu3PGNzsEZVmN
 K6KvD/spueGkdipgWaTaSdeomAgPCwmykh4vjS0PfE6pv4ckQmGwLw2kvVWTkmfHXprZ
 CTghU/yt62S5As4L02jS3MlkaLuKHRuzzOY1m2/Tuz4j30zWSbVq7okdsA1nsFv/CHIB
 ZYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E4sisNPn775VRDqqvJeTohz0oBTi8F8Lv6HK2mPSDMw=;
 b=V+Sl6CafG4kecEwAnfrxtPbsJyYOIjy24AGllzb0KCCVhu30JUfKyZUDbA0Si9Rx39
 lLvecnqpfHoPB/bTOGl+zifE3P5ET0rp6ks1eqkt8rKlh/Yj+kLVy8VcW+ueQxPVv+Nk
 qOmNZNUlJcovuRoiV4VLy9sIEQRtw/4UDaJWJuPCyd7AVKVLo7dWlk4fh6vnJUvpFpNP
 JT/X7RZtgCYP7U17j7lsQzuUnhzPigG69hDYN60MC2cTRkuP01eNJulcoCdQVoV61E2f
 UoYaFWC/rfK6wwGbwhyI9bloaDS6++snFt0sH4bxi6t+7/xO8P3F1rUK/TPy+6kvS2aX
 XQSw==
X-Gm-Message-State: AOAM530kQBFoKX8p1EeJZymNe44hXKIsehXoWp8SK2myDaEix6enAi4G
 pk15QtSF61RXP33CGTmWtEQ=
X-Google-Smtp-Source: ABdhPJxNUoBMFLcYHJgZIK0JGESxcra75Kj2zbG3vxFDPIyud7PYyZa3ralCJmBtzvfUaEfNGi3fVw==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr266662pjb.107.1640038083047; 
 Mon, 20 Dec 2021 14:08:03 -0800 (PST)
Received: from google.com ([2620:15c:202:201:9632:a1c4:968a:6f66])
 by smtp.gmail.com with ESMTPSA id c2sm4196485pge.23.2021.12.20.14.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 14:08:02 -0800 (PST)
Date: Mon, 20 Dec 2021 14:07:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: Add driver for ChromeOS
 privacy-screen
Message-ID: <YcD+v/VVWUmhvuoM@google.com>
References: <20211217202850.1967594-1-rajatja@google.com>
 <YcDclHaoiKX8dbXG@google.com>
 <CACK8Z6Hk0BjEVgMfQ+LuM2NjCUcQLedL0O2=XR8R2TgkX=SYdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACK8Z6Hk0BjEVgMfQ+LuM2NjCUcQLedL0O2=XR8R2TgkX=SYdQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 21 Dec 2021 09:09:51 +0000
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
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@google.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 12:21:47PM -0800, Rajat Jain wrote:
> Hi Dmitry,
> 
> Thanks for the review. Please see inline.
> 
> On Mon, Dec 20, 2021 at 11:42 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Rajat,
> >
> > On Fri, Dec 17, 2021 at 12:28:49PM -0800, Rajat Jain wrote:
> > > This adds the ACPI driver for the ChromeOS privacy screen that is
> > > present on some chromeos devices.
> > >
> > > Note that ideally, we'd want this privacy screen driver to be probed
> > > BEFORE the drm probe in order to avoid a drm probe deferral:
> > > https://hansdegoede.livejournal.com/25948.html
> > >
> > > In practise, I found that ACPI drivers are bound to their devices AFTER
> > > the drm probe on chromebooks. So on chromebooks with privacy-screen,
> > > this patch along with the next one in this series results in a probe
> > > deferral of about 250ms for i915 driver. However, it did not result in
> > > any user noticeable delay of splash screen in my personal experience.
> > >
> > > In future if this probe deferral turns out to be an issue, we can
> > > consider turning this ACPI driver into something that is probed
> > > earlier than the drm drivers.
> > >
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > ---
> > > v2: * Reword the commit log
> > >     * Make the Kconfig into a tristate
> > >     * Reorder the patches in the series.
> > >
> > >  drivers/platform/chrome/Kconfig              |   9 ++
> > >  drivers/platform/chrome/Makefile             |   1 +
> > >  drivers/platform/chrome/chromeos_priv_scrn.c | 132 +++++++++++++++++++
> > >  3 files changed, 142 insertions(+)
> > >  create mode 100644 drivers/platform/chrome/chromeos_priv_scrn.c
> > >
> > > diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> > > index ccc23d8686e8..d1c209a45a62 100644
> > > --- a/drivers/platform/chrome/Kconfig
> > > +++ b/drivers/platform/chrome/Kconfig
> > > @@ -243,6 +243,15 @@ config CROS_USBPD_NOTIFY
> > >         To compile this driver as a module, choose M here: the
> > >         module will be called cros_usbpd_notify.
> > >
> > > +config CHROMEOS_PRIVACY_SCREEN
> > > +     tristate "ChromeOS Privacy Screen support"
> > > +     depends on ACPI
> > > +     depends on DRM
> > > +     select DRM_PRIVACY_SCREEN
> > > +     help
> > > +       This driver provides the support needed for the in-built electronic
> > > +       privacy screen that is present on some ChromeOS devices.
> > > +
> > >  source "drivers/platform/chrome/wilco_ec/Kconfig"
> > >
> > >  endif # CHROMEOS_PLATFORMS
> > > diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> > > index f901d2e43166..cfa0bb4e9e34 100644
> > > --- a/drivers/platform/chrome/Makefile
> > > +++ b/drivers/platform/chrome/Makefile
> > > @@ -4,6 +4,7 @@
> > >  CFLAGS_cros_ec_trace.o:=             -I$(src)
> > >
> > >  obj-$(CONFIG_CHROMEOS_LAPTOP)                += chromeos_laptop.o
> > > +obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)        += chromeos_priv_scrn.o
> > >  obj-$(CONFIG_CHROMEOS_PSTORE)                += chromeos_pstore.o
> > >  obj-$(CONFIG_CHROMEOS_TBMC)          += chromeos_tbmc.o
> > >  obj-$(CONFIG_CROS_EC)                        += cros_ec.o
> > > diff --git a/drivers/platform/chrome/chromeos_priv_scrn.c b/drivers/platform/chrome/chromeos_priv_scrn.c
> > > new file mode 100644
> > > index 000000000000..a4cbf5c79c2a
> > > --- /dev/null
> > > +++ b/drivers/platform/chrome/chromeos_priv_scrn.c
> >
> > I think we can spare a few more characters :) chromeos_privacy_screen.c
> > maybe?
> >
> > And also see if maybe variables in the code are not that unseemly long
> > even if not abbreviated?
> 
> Sure, I can certainly replace "chromeos_priv_scrn" with
> "chromeos_privacy_screen" everywhere. Some of the variables may be a
> little long, but I think that should be OK (my main concern was
> 
> chromeos_privacy_screen_device_ids
> chromeos_privacy_screen_get_hw_state()
> 
> Let me know if that doesn't sound right (in which case, I can probably
> omit "chromeos" from the local variable and function names)

Another option to go all the way into different direction, and use
"cps_" prefix for everything. It is probably just me but combination of
"priv" "scrn" just grates on me ;)

> 
> >
> > > @@ -0,0 +1,132 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +/*
> > > + *  chromeos_priv_scrn.c - ChromeOS Privacy Screen support
> >
> > I'd avoid mentioning file name as those tend to change.
> 
> Ack, will do.
> 
> >
> > > + *
> > > + * Copyright (C) 2022 The Chromium OS Authors
> >
> > This is not correct copyright for kernel contributions. It should be
> > attributed to "Google LLC". Note that it is different from CrOS
> > userspace.
> >
> 
> Ack, will do.
> 
> > > + *
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <drm/drm_privacy_screen_driver.h>
> > > +
> > > +/*
> > > + * The DSM (Define Specific Method) constants below are the agreed API with
> > > + * the firmware team, on how to control privacy screen using ACPI methods.
> > > + */
> > > +#define PRIV_SCRN_DSM_REVID          1       /* DSM version */
> > > +#define PRIV_SCRN_DSM_FN_GET_STATUS  1       /* Get privacy screen status */
> > > +#define PRIV_SCRN_DSM_FN_ENABLE              2       /* Enable privacy screen */
> > > +#define PRIV_SCRN_DSM_FN_DISABLE     3       /* Disable privacy screen */
> > > +
> > > +static const guid_t chromeos_priv_scrn_dsm_guid =
> > > +                 GUID_INIT(0xc7033113, 0x8720, 0x4ceb,
> > > +                           0x90, 0x90, 0x9d, 0x52, 0xb3, 0xe5, 0x2d, 0x73);
> > > +
> > > +static void
> > > +chromeos_priv_scrn_get_hw_state(struct drm_privacy_screen *drm_priv_scrn)
> > > +{
> > > +     union acpi_object *obj;
> > > +     acpi_handle handle;
> > > +     struct device *priv_scrn = drm_priv_scrn->dev.parent;
> >
> > This is really bad that we need to poke into internals of
> > drm_privacy_screen to get to "our" device. I think there is only one
> > consume of the privacy screen API at the moment, the thinkpad driver, so
> > maybe it is not too late to change drm_privacy_screen_register() to
> > either accept instance of struct drm_privacy_screen (which then could be
> > embedded into something) or accept a void pointer to attach arbitrary
> > data to it, and then add drm_privacy_screen_get_drvdata() to get to that
> > pointer.
> >
> 
> Sure, ack, will do.
> 
> > > +
> > > +     if (!priv_scrn)
> > > +             return;
> >
> > This should not happen regardless.
> >
> 
> Sure, ack, will remove.
> 
> > > +
> > > +     handle = acpi_device_handle(to_acpi_device(priv_scrn));
> > > +     obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > > +                             PRIV_SCRN_DSM_REVID,
> > > +                             PRIV_SCRN_DSM_FN_GET_STATUS, NULL);
> > > +     if (!obj) {
> > > +             dev_err(priv_scrn, "_DSM failed to get privacy-screen state\n");
> >
> > Can we do something about it? A dedicated status? Also, can we print
> > ACPI-specific error?
> >
> 
> Umm ... I don't know. We don't know anything beyond that the ACPI
> method wasn't able to get us anything. There are no other status other
> than the ones specified in enum drm_privacy_screen_status. Since that
> enum was the result of almost 1.5 year of discussion between pekka,
> Hans and other or drm mailing lists, I don't wat to change that.

OK, I guess we need to chose a fine default here, probably assume
privacy screen is inoperable/disabled.

> 
> > > +             return;
> > > +     }
> > > +
> > > +     if (obj->type != ACPI_TYPE_INTEGER)
> > > +             dev_err(priv_scrn, "Bad _DSM to get privacy-screen state\n");
> >
> > Same here.
> 
> Just like above, we only know that it couldn't get us what we need.
> There isn't anything we can do.

I'd force the status to disabled here as well.

> 
> >
> > > +     else if (obj->integer.value == 1)
> > > +             drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> > > +                     PRIVACY_SCREEN_ENABLED;
> > > +     else
> > > +             drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> > > +                     PRIVACY_SCREEN_DISABLED;
> > > +
> > > +     ACPI_FREE(obj);
> > > +}
> > > +
> > > +static int
> > > +chromeos_priv_scrn_set_sw_state(struct drm_privacy_screen *drm_priv_scrn,
> > > +                             enum drm_privacy_screen_status state)
> > > +{
> > > +     union acpi_object *obj = NULL;
> > > +     acpi_handle handle;
> > > +     struct device *priv_scrn = drm_priv_scrn->dev.parent;
> > > +
> > > +     if (!priv_scrn)
> > > +             return -ENODEV;
> >
> > This should not happen regardless.
> 
> Ack, will remove.
> 
> >
> > > +
> > > +     handle = acpi_device_handle(to_acpi_device(priv_scrn));
> > > +
> > > +     if (state == PRIVACY_SCREEN_DISABLED) {
> > > +             obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > > +                                     PRIV_SCRN_DSM_REVID,
> > > +                                     PRIV_SCRN_DSM_FN_DISABLE, NULL);
> > > +     } else if (state == PRIVACY_SCREEN_ENABLED) {
> > > +             obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > > +                                     PRIV_SCRN_DSM_REVID,
> > > +                                     PRIV_SCRN_DSM_FN_ENABLE, NULL);
> > > +     } else {
> > > +             dev_err(priv_scrn, "Bad attempt to set privacy-screen status\n");
> > > +             return -EINVAL;
> >
> > Print state to aid in tracking bugs?
> 
> Ack, will do.
> 
> >
> > > +     }
> > > +
> > > +     if (!obj) {
> > > +             dev_err(priv_scrn, "_DSM failed to set privacy-screen state\n");
> >
> > Can we print ACPI-specific error?
> 
> AFAICS, we do not know what went wrong. The method gives us a NULL
> (meaning something went wrong) or a value which means all is OK. I do
> see that acpi_evaluate_dsm() prints something in case of failure, in
> case that si what you were looking for..

I see that acpi_evaluate_dsm() already provides diagnostic, so you can
ignore me here.

> 
> >
> > > +             return -EIO;
> > > +     }
> > > +
> > > +     drm_priv_scrn->hw_state = drm_priv_scrn->sw_state = state;
> > > +     ACPI_FREE(obj);
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct drm_privacy_screen_ops chromeos_priv_scrn_ops = {
> > > +     .get_hw_state = chromeos_priv_scrn_get_hw_state,
> > > +     .set_sw_state = chromeos_priv_scrn_set_sw_state,
> > > +};
> > > +
> > > +static int chromeos_priv_scrn_add(struct acpi_device *adev)
> > > +{
> > > +     struct drm_privacy_screen *drm_priv_scrn =
> > > +             drm_privacy_screen_register(&adev->dev, &chromeos_priv_scrn_ops);
> > > +
> > > +     if (IS_ERR(drm_priv_scrn)) {
> > > +             dev_err(&adev->dev, "Error registering privacy-screen\n");
> > > +             return PTR_ERR(drm_priv_scrn);
> > > +     }
> > > +
> > > +     dev_info(&adev->dev, "registered privacy-screen '%s'\n",
> > > +              dev_name(&drm_priv_scrn->dev));
> >
> > I don't think we need be this noisy.
> >
> 
> This can help us track the probe deferral related bugs (and whether it
> is too bad). Yes, we have a probe deferral with these patches.
> Essentially I wanted these prints because they can be taken as markers
> to determine how much delay is the probe deferral costing us.

I am sure you can get boot timeline with debug initcalls option. Then
you will see when this module was initialized vs i915.

Thanks.

-- 
Dmitry
