Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8947B44A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 21:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3311130E4;
	Mon, 20 Dec 2021 20:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8B21130E4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 20:22:24 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id v11so6525582pfu.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 12:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q0HhvW2n02tF8/ynU33kcPDZcVwWPc3PWXyhIh59T0E=;
 b=iEbWGcizaLs3vvRAoBsy7d01ZQeUSGPx4a7X45f/oYBpx9qxodW7z2VDXV/JwgcLNX
 6zuBYFhlHaLp5wb+RRHsZR6jy0mwOB5OoITIfwzWN2bNVo/4k3rcDXJM1QJLVjxgQTY5
 f19i8sNDV2NKuSdaC7hI2THvYSne8fcspeLBK4dFx7/yHPpIxZsrG9LKjjStUz0dHnLD
 wYtXOfoQ/RnZt9zc0B843lfitwFjjY3Fjlsxt4XhXjOdTryGJ5YfH3ii4GtKdu1SBG0g
 Oh5pzy7e4ygQvYjEZ72X+BWfi3VhNUb+D6ATraT8f+M1Ix9aZb6u0tDLYtT6KjvQJ2tr
 2hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0HhvW2n02tF8/ynU33kcPDZcVwWPc3PWXyhIh59T0E=;
 b=0T7oxgm7vG+nnUzWO4Mk6FNutl68NpyBwzPHJfomQdbPOIWmtO5WSPXxotON9zNJHX
 kgdDi+tbfYH5C58HwpTgPg/yaDVgBm/LnhnbjhYxDeq9Zu+iLKTg4vAKGqGlFc4obSIp
 em8kQ9S/vYmb3KTGxCT/CVhCiMUxGtjNCFPsK0L1NyyI5cXAEFHiQLuzfZ3/lUpgPuR9
 LofMGNyyC3yM69VEpYv+2zlFC2CvTsmpVCtrrsbAoiMxprI36P7Y0cUjAPX3k3/pycbI
 mj9Pq2TePHIFLjGT4t5lbtnfMPNUXbRRKn4ArDRsljvwyEnCE+LkNe1KD5NGvUEfvykA
 HwTw==
X-Gm-Message-State: AOAM531Lnn1kftwwpWgbnO77Mqcpz0HxPB887rSL6e7KqErYuem8yhpt
 EflR5rPTxOqyKyeXINQ7m0CBL5PbphHcfzYl5a+7OFgQRa1D1w==
X-Google-Smtp-Source: ABdhPJxpQ2c457ZVktjKornpP5Yex3ExG0dpU7qRc0KDswjIFdJmNaSgJ7XzWlQFM9W5DQPk3rtoEi4dbcSt4OPNohY=
X-Received: by 2002:a05:6a00:1ad1:b0:49f:ccd7:e57a with SMTP id
 f17-20020a056a001ad100b0049fccd7e57amr18089595pfv.78.1640031743787; Mon, 20
 Dec 2021 12:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20211217202850.1967594-1-rajatja@google.com>
 <YcDclHaoiKX8dbXG@google.com>
In-Reply-To: <YcDclHaoiKX8dbXG@google.com>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 20 Dec 2021 12:21:47 -0800
Message-ID: <CACK8Z6Hk0BjEVgMfQ+LuM2NjCUcQLedL0O2=XR8R2TgkX=SYdQ@mail.gmail.com>
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

Thanks for the review. Please see inline.

On Mon, Dec 20, 2021 at 11:42 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rajat,
>
> On Fri, Dec 17, 2021 at 12:28:49PM -0800, Rajat Jain wrote:
> > This adds the ACPI driver for the ChromeOS privacy screen that is
> > present on some chromeos devices.
> >
> > Note that ideally, we'd want this privacy screen driver to be probed
> > BEFORE the drm probe in order to avoid a drm probe deferral:
> > https://hansdegoede.livejournal.com/25948.html
> >
> > In practise, I found that ACPI drivers are bound to their devices AFTER
> > the drm probe on chromebooks. So on chromebooks with privacy-screen,
> > this patch along with the next one in this series results in a probe
> > deferral of about 250ms for i915 driver. However, it did not result in
> > any user noticeable delay of splash screen in my personal experience.
> >
> > In future if this probe deferral turns out to be an issue, we can
> > consider turning this ACPI driver into something that is probed
> > earlier than the drm drivers.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v2: * Reword the commit log
> >     * Make the Kconfig into a tristate
> >     * Reorder the patches in the series.
> >
> >  drivers/platform/chrome/Kconfig              |   9 ++
> >  drivers/platform/chrome/Makefile             |   1 +
> >  drivers/platform/chrome/chromeos_priv_scrn.c | 132 +++++++++++++++++++
> >  3 files changed, 142 insertions(+)
> >  create mode 100644 drivers/platform/chrome/chromeos_priv_scrn.c
> >
> > diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> > index ccc23d8686e8..d1c209a45a62 100644
> > --- a/drivers/platform/chrome/Kconfig
> > +++ b/drivers/platform/chrome/Kconfig
> > @@ -243,6 +243,15 @@ config CROS_USBPD_NOTIFY
> >         To compile this driver as a module, choose M here: the
> >         module will be called cros_usbpd_notify.
> >
> > +config CHROMEOS_PRIVACY_SCREEN
> > +     tristate "ChromeOS Privacy Screen support"
> > +     depends on ACPI
> > +     depends on DRM
> > +     select DRM_PRIVACY_SCREEN
> > +     help
> > +       This driver provides the support needed for the in-built electronic
> > +       privacy screen that is present on some ChromeOS devices.
> > +
> >  source "drivers/platform/chrome/wilco_ec/Kconfig"
> >
> >  endif # CHROMEOS_PLATFORMS
> > diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> > index f901d2e43166..cfa0bb4e9e34 100644
> > --- a/drivers/platform/chrome/Makefile
> > +++ b/drivers/platform/chrome/Makefile
> > @@ -4,6 +4,7 @@
> >  CFLAGS_cros_ec_trace.o:=             -I$(src)
> >
> >  obj-$(CONFIG_CHROMEOS_LAPTOP)                += chromeos_laptop.o
> > +obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)        += chromeos_priv_scrn.o
> >  obj-$(CONFIG_CHROMEOS_PSTORE)                += chromeos_pstore.o
> >  obj-$(CONFIG_CHROMEOS_TBMC)          += chromeos_tbmc.o
> >  obj-$(CONFIG_CROS_EC)                        += cros_ec.o
> > diff --git a/drivers/platform/chrome/chromeos_priv_scrn.c b/drivers/platform/chrome/chromeos_priv_scrn.c
> > new file mode 100644
> > index 000000000000..a4cbf5c79c2a
> > --- /dev/null
> > +++ b/drivers/platform/chrome/chromeos_priv_scrn.c
>
> I think we can spare a few more characters :) chromeos_privacy_screen.c
> maybe?
>
> And also see if maybe variables in the code are not that unseemly long
> even if not abbreviated?

Sure, I can certainly replace "chromeos_priv_scrn" with
"chromeos_privacy_screen" everywhere. Some of the variables may be a
little long, but I think that should be OK (my main concern was

chromeos_privacy_screen_device_ids
chromeos_privacy_screen_get_hw_state()

Let me know if that doesn't sound right (in which case, I can probably
omit "chromeos" from the local variable and function names)

>
> > @@ -0,0 +1,132 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + *  chromeos_priv_scrn.c - ChromeOS Privacy Screen support
>
> I'd avoid mentioning file name as those tend to change.

Ack, will do.

>
> > + *
> > + * Copyright (C) 2022 The Chromium OS Authors
>
> This is not correct copyright for kernel contributions. It should be
> attributed to "Google LLC". Note that it is different from CrOS
> userspace.
>

Ack, will do.

> > + *
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <drm/drm_privacy_screen_driver.h>
> > +
> > +/*
> > + * The DSM (Define Specific Method) constants below are the agreed API with
> > + * the firmware team, on how to control privacy screen using ACPI methods.
> > + */
> > +#define PRIV_SCRN_DSM_REVID          1       /* DSM version */
> > +#define PRIV_SCRN_DSM_FN_GET_STATUS  1       /* Get privacy screen status */
> > +#define PRIV_SCRN_DSM_FN_ENABLE              2       /* Enable privacy screen */
> > +#define PRIV_SCRN_DSM_FN_DISABLE     3       /* Disable privacy screen */
> > +
> > +static const guid_t chromeos_priv_scrn_dsm_guid =
> > +                 GUID_INIT(0xc7033113, 0x8720, 0x4ceb,
> > +                           0x90, 0x90, 0x9d, 0x52, 0xb3, 0xe5, 0x2d, 0x73);
> > +
> > +static void
> > +chromeos_priv_scrn_get_hw_state(struct drm_privacy_screen *drm_priv_scrn)
> > +{
> > +     union acpi_object *obj;
> > +     acpi_handle handle;
> > +     struct device *priv_scrn = drm_priv_scrn->dev.parent;
>
> This is really bad that we need to poke into internals of
> drm_privacy_screen to get to "our" device. I think there is only one
> consume of the privacy screen API at the moment, the thinkpad driver, so
> maybe it is not too late to change drm_privacy_screen_register() to
> either accept instance of struct drm_privacy_screen (which then could be
> embedded into something) or accept a void pointer to attach arbitrary
> data to it, and then add drm_privacy_screen_get_drvdata() to get to that
> pointer.
>

Sure, ack, will do.

> > +
> > +     if (!priv_scrn)
> > +             return;
>
> This should not happen regardless.
>

Sure, ack, will remove.

> > +
> > +     handle = acpi_device_handle(to_acpi_device(priv_scrn));
> > +     obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > +                             PRIV_SCRN_DSM_REVID,
> > +                             PRIV_SCRN_DSM_FN_GET_STATUS, NULL);
> > +     if (!obj) {
> > +             dev_err(priv_scrn, "_DSM failed to get privacy-screen state\n");
>
> Can we do something about it? A dedicated status? Also, can we print
> ACPI-specific error?
>

Umm ... I don't know. We don't know anything beyond that the ACPI
method wasn't able to get us anything. There are no other status other
than the ones specified in enum drm_privacy_screen_status. Since that
enum was the result of almost 1.5 year of discussion between pekka,
Hans and other or drm mailing lists, I don't wat to change that.

> > +             return;
> > +     }
> > +
> > +     if (obj->type != ACPI_TYPE_INTEGER)
> > +             dev_err(priv_scrn, "Bad _DSM to get privacy-screen state\n");
>
> Same here.

Just like above, we only know that it couldn't get us what we need.
There isn't anything we can do.

>
> > +     else if (obj->integer.value == 1)
> > +             drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> > +                     PRIVACY_SCREEN_ENABLED;
> > +     else
> > +             drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> > +                     PRIVACY_SCREEN_DISABLED;
> > +
> > +     ACPI_FREE(obj);
> > +}
> > +
> > +static int
> > +chromeos_priv_scrn_set_sw_state(struct drm_privacy_screen *drm_priv_scrn,
> > +                             enum drm_privacy_screen_status state)
> > +{
> > +     union acpi_object *obj = NULL;
> > +     acpi_handle handle;
> > +     struct device *priv_scrn = drm_priv_scrn->dev.parent;
> > +
> > +     if (!priv_scrn)
> > +             return -ENODEV;
>
> This should not happen regardless.

Ack, will remove.

>
> > +
> > +     handle = acpi_device_handle(to_acpi_device(priv_scrn));
> > +
> > +     if (state == PRIVACY_SCREEN_DISABLED) {
> > +             obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > +                                     PRIV_SCRN_DSM_REVID,
> > +                                     PRIV_SCRN_DSM_FN_DISABLE, NULL);
> > +     } else if (state == PRIVACY_SCREEN_ENABLED) {
> > +             obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> > +                                     PRIV_SCRN_DSM_REVID,
> > +                                     PRIV_SCRN_DSM_FN_ENABLE, NULL);
> > +     } else {
> > +             dev_err(priv_scrn, "Bad attempt to set privacy-screen status\n");
> > +             return -EINVAL;
>
> Print state to aid in tracking bugs?

Ack, will do.

>
> > +     }
> > +
> > +     if (!obj) {
> > +             dev_err(priv_scrn, "_DSM failed to set privacy-screen state\n");
>
> Can we print ACPI-specific error?

AFAICS, we do not know what went wrong. The method gives us a NULL
(meaning something went wrong) or a value which means all is OK. I do
see that acpi_evaluate_dsm() prints something in case of failure, in
case that si what you were looking for..

>
> > +             return -EIO;
> > +     }
> > +
> > +     drm_priv_scrn->hw_state = drm_priv_scrn->sw_state = state;
> > +     ACPI_FREE(obj);
> > +     return 0;
> > +}
> > +
> > +static const struct drm_privacy_screen_ops chromeos_priv_scrn_ops = {
> > +     .get_hw_state = chromeos_priv_scrn_get_hw_state,
> > +     .set_sw_state = chromeos_priv_scrn_set_sw_state,
> > +};
> > +
> > +static int chromeos_priv_scrn_add(struct acpi_device *adev)
> > +{
> > +     struct drm_privacy_screen *drm_priv_scrn =
> > +             drm_privacy_screen_register(&adev->dev, &chromeos_priv_scrn_ops);
> > +
> > +     if (IS_ERR(drm_priv_scrn)) {
> > +             dev_err(&adev->dev, "Error registering privacy-screen\n");
> > +             return PTR_ERR(drm_priv_scrn);
> > +     }
> > +
> > +     dev_info(&adev->dev, "registered privacy-screen '%s'\n",
> > +              dev_name(&drm_priv_scrn->dev));
>
> I don't think we need be this noisy.
>

This can help us track the probe deferral related bugs (and whether it
is too bad). Yes, we have a probe deferral with these patches.
Essentially I wanted these prints because they can be taken as markers
to determine how much delay is the probe deferral costing us.

> > +
> > +     return 0;
> > +}
> > +
> > +static const struct acpi_device_id chromeos_priv_scrn_device_ids[] = {
> > +     {"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, chromeos_priv_scrn_device_ids);
> > +
> > +static struct acpi_driver chromeos_priv_scrn_driver = {
> > +     .name = "chromeos_priv_scrn_drvr",
> > +     .class = "ChromeOS",
> > +     .ids = chromeos_priv_scrn_device_ids,
> > +     .ops = {
> > +             .add = chromeos_priv_scrn_add,
>
> We don't need any cleanup?
>

Ack, will do.

> > +     },
> > +};
> > +
> > +module_acpi_driver(chromeos_priv_scrn_driver);
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
> > +MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");
> > --
> > 2.34.1.307.g9b7440fafd-goog
> >
>
> Thanks.
>
> --
> Dmitry
