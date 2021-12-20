Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278647BC91
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D6210E45E;
	Tue, 21 Dec 2021 09:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CAB10E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 19:42:16 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id g2so7689329pgo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 11:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KoVlv4DwLSYaskk/NiROpawGSL9nBdwY2zIFrfhk2/c=;
 b=Mr0uD14e4FwfkZYuwJQ/bvgsHDaaBhksz+Ycp4dUFSKS+S7UiJVCKyFScEXxiE4Ikk
 44X0xErqxeF2yAXh5hoYWe69MsZBvoA1qskBru68JWeeWNacylz79TcNbUZkA1SBP37G
 Kil6RMkbEvPs70TbLlnHgzXRNryDTjOXy9kxAUoRlxUAf6E3rslFWa2/IYt/ftGx/uMB
 NHGWuAIMX2BMqfGue2lIvekLyyfPcDO3HEMvqqE+WG+wXjZti28rYAggfz/26EEfJn8b
 rJNDSGtmRU2b4DjEopLZ//6hAy85TcG/hro7UCw+CxJRDcXfPp2WpF1RwMNxxlYeIbgD
 tNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KoVlv4DwLSYaskk/NiROpawGSL9nBdwY2zIFrfhk2/c=;
 b=VHyGRl5usQlWnUb2CmV23bnXWxHGb0hz+Q/EIOqDj54AtELCUYweYjrA3tr0YQleQB
 JcULHqH8nCvVxGea8CSrTTlzkVoixvcO12IDYYKbfIBa+GJC7zjFm8KC/nCqAOw/GlNP
 uioHv9nK4kOZSdm0remcLdqYlUCVznKMXql3IjnOb0zbYNxfxPJcb+2jB3oovrnN0Rt9
 XhxuEYjkbDDSycgduE63OY3GfPKqSSlFx+qj+xSGxgCz9llcRro2icXidkvanlk+SCPV
 F/UyUjgO5W+TdkEZcvDhyB0kqr8xS5O81fxbIsisZUogFo47lbeTvjGiLRqsoG1FdpLH
 IzWw==
X-Gm-Message-State: AOAM530DLcwcsIhfZfm/S7Kn+0MfJBfMe2NA18Xbf/azSfHDr+lUAm7V
 5MKYumPrP05f3LwugubF+SdxQ179n0k=
X-Google-Smtp-Source: ABdhPJy4Hho/V/6Hec97yfxkmXMyfitPiO7PJcxVfn366LGFerPjUTAUdOJ62k38249oy1Sce12aZw==
X-Received: by 2002:a63:6c81:: with SMTP id
 h123mr16472244pgc.313.1640029336229; 
 Mon, 20 Dec 2021 11:42:16 -0800 (PST)
Received: from google.com ([2620:15c:202:201:9632:a1c4:968a:6f66])
 by smtp.gmail.com with ESMTPSA id mw8sm175904pjb.42.2021.12.20.11.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 11:42:14 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <dtor@google.com>
Date: Mon, 20 Dec 2021 11:42:12 -0800
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: Add driver for ChromeOS
 privacy-screen
Message-ID: <YcDclHaoiKX8dbXG@google.com>
References: <20211217202850.1967594-1-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217202850.1967594-1-rajatja@google.com>
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
Cc: gwendal@google.com, Thomas Zimmermann <tzimmermann@suse.de>,
 seanpaul@google.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 rajatxjain@gmail.com, dri-devel@lists.freedesktop.org, marcheau@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rajat,

On Fri, Dec 17, 2021 at 12:28:49PM -0800, Rajat Jain wrote:
> This adds the ACPI driver for the ChromeOS privacy screen that is
> present on some chromeos devices.
> 
> Note that ideally, we'd want this privacy screen driver to be probed
> BEFORE the drm probe in order to avoid a drm probe deferral:
> https://hansdegoede.livejournal.com/25948.html
> 
> In practise, I found that ACPI drivers are bound to their devices AFTER
> the drm probe on chromebooks. So on chromebooks with privacy-screen,
> this patch along with the next one in this series results in a probe
> deferral of about 250ms for i915 driver. However, it did not result in
> any user noticeable delay of splash screen in my personal experience.
> 
> In future if this probe deferral turns out to be an issue, we can
> consider turning this ACPI driver into something that is probed
> earlier than the drm drivers.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v2: * Reword the commit log
>     * Make the Kconfig into a tristate
>     * Reorder the patches in the series.
> 
>  drivers/platform/chrome/Kconfig              |   9 ++
>  drivers/platform/chrome/Makefile             |   1 +
>  drivers/platform/chrome/chromeos_priv_scrn.c | 132 +++++++++++++++++++
>  3 files changed, 142 insertions(+)
>  create mode 100644 drivers/platform/chrome/chromeos_priv_scrn.c
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index ccc23d8686e8..d1c209a45a62 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -243,6 +243,15 @@ config CROS_USBPD_NOTIFY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cros_usbpd_notify.
>  
> +config CHROMEOS_PRIVACY_SCREEN
> +	tristate "ChromeOS Privacy Screen support"
> +	depends on ACPI
> +	depends on DRM
> +	select DRM_PRIVACY_SCREEN
> +	help
> +	  This driver provides the support needed for the in-built electronic
> +	  privacy screen that is present on some ChromeOS devices.
> +
>  source "drivers/platform/chrome/wilco_ec/Kconfig"
>  
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index f901d2e43166..cfa0bb4e9e34 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -4,6 +4,7 @@
>  CFLAGS_cros_ec_trace.o:=		-I$(src)
>  
>  obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
> +obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)	+= chromeos_priv_scrn.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
>  obj-$(CONFIG_CHROMEOS_TBMC)		+= chromeos_tbmc.o
>  obj-$(CONFIG_CROS_EC)			+= cros_ec.o
> diff --git a/drivers/platform/chrome/chromeos_priv_scrn.c b/drivers/platform/chrome/chromeos_priv_scrn.c
> new file mode 100644
> index 000000000000..a4cbf5c79c2a
> --- /dev/null
> +++ b/drivers/platform/chrome/chromeos_priv_scrn.c

I think we can spare a few more characters :) chromeos_privacy_screen.c
maybe?

And also see if maybe variables in the code are not that unseemly long
even if not abbreviated?

> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + *  chromeos_priv_scrn.c - ChromeOS Privacy Screen support

I'd avoid mentioning file name as those tend to change.

> + *
> + * Copyright (C) 2022 The Chromium OS Authors

This is not correct copyright for kernel contributions. It should be
attributed to "Google LLC". Note that it is different from CrOS
userspace.

> + *
> + */
> +
> +#include <linux/acpi.h>
> +#include <drm/drm_privacy_screen_driver.h>
> +
> +/*
> + * The DSM (Define Specific Method) constants below are the agreed API with
> + * the firmware team, on how to control privacy screen using ACPI methods.
> + */
> +#define PRIV_SCRN_DSM_REVID		1	/* DSM version */
> +#define PRIV_SCRN_DSM_FN_GET_STATUS	1	/* Get privacy screen status */
> +#define PRIV_SCRN_DSM_FN_ENABLE		2	/* Enable privacy screen */
> +#define PRIV_SCRN_DSM_FN_DISABLE	3	/* Disable privacy screen */
> +
> +static const guid_t chromeos_priv_scrn_dsm_guid =
> +		    GUID_INIT(0xc7033113, 0x8720, 0x4ceb,
> +			      0x90, 0x90, 0x9d, 0x52, 0xb3, 0xe5, 0x2d, 0x73);
> +
> +static void
> +chromeos_priv_scrn_get_hw_state(struct drm_privacy_screen *drm_priv_scrn)
> +{
> +	union acpi_object *obj;
> +	acpi_handle handle;
> +	struct device *priv_scrn = drm_priv_scrn->dev.parent;

This is really bad that we need to poke into internals of
drm_privacy_screen to get to "our" device. I think there is only one
consume of the privacy screen API at the moment, the thinkpad driver, so
maybe it is not too late to change drm_privacy_screen_register() to
either accept instance of struct drm_privacy_screen (which then could be
embedded into something) or accept a void pointer to attach arbitrary
data to it, and then add drm_privacy_screen_get_drvdata() to get to that
pointer.

> +
> +	if (!priv_scrn)
> +		return;

This should not happen regardless.

> +
> +	handle = acpi_device_handle(to_acpi_device(priv_scrn));
> +	obj = acpi_evaluate_dsm(handle, &chromeos_priv_scrn_dsm_guid,
> +				PRIV_SCRN_DSM_REVID,
> +				PRIV_SCRN_DSM_FN_GET_STATUS, NULL);
> +	if (!obj) {
> +		dev_err(priv_scrn, "_DSM failed to get privacy-screen state\n");

Can we do something about it? A dedicated status? Also, can we print
ACPI-specific error?

> +		return;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_INTEGER)
> +		dev_err(priv_scrn, "Bad _DSM to get privacy-screen state\n");

Same here.

> +	else if (obj->integer.value == 1)
> +		drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> +			PRIVACY_SCREEN_ENABLED;
> +	else
> +		drm_priv_scrn->hw_state = drm_priv_scrn->sw_state =
> +			PRIVACY_SCREEN_DISABLED;
> +
> +	ACPI_FREE(obj);
> +}
> +
> +static int
> +chromeos_priv_scrn_set_sw_state(struct drm_privacy_screen *drm_priv_scrn,
> +				enum drm_privacy_screen_status state)
> +{
> +	union acpi_object *obj = NULL;
> +	acpi_handle handle;
> +	struct device *priv_scrn = drm_priv_scrn->dev.parent;
> +
> +	if (!priv_scrn)
> +		return -ENODEV;

This should not happen regardless.

> +
> +	handle = acpi_device_handle(to_acpi_device(priv_scrn));
> +
> +	if (state == PRIVACY_SCREEN_DISABLED) {
> +		obj = acpi_evaluate_dsm(handle,	&chromeos_priv_scrn_dsm_guid,
> +					PRIV_SCRN_DSM_REVID,
> +					PRIV_SCRN_DSM_FN_DISABLE, NULL);
> +	} else if (state == PRIVACY_SCREEN_ENABLED) {
> +		obj = acpi_evaluate_dsm(handle,	&chromeos_priv_scrn_dsm_guid,
> +					PRIV_SCRN_DSM_REVID,
> +					PRIV_SCRN_DSM_FN_ENABLE, NULL);
> +	} else {
> +		dev_err(priv_scrn, "Bad attempt to set privacy-screen status\n");
> +		return -EINVAL;

Print state to aid in tracking bugs?

> +	}
> +
> +	if (!obj) {
> +		dev_err(priv_scrn, "_DSM failed to set privacy-screen state\n");

Can we print ACPI-specific error?

> +		return -EIO;
> +	}
> +
> +	drm_priv_scrn->hw_state = drm_priv_scrn->sw_state = state;
> +	ACPI_FREE(obj);
> +	return 0;
> +}
> +
> +static const struct drm_privacy_screen_ops chromeos_priv_scrn_ops = {
> +	.get_hw_state = chromeos_priv_scrn_get_hw_state,
> +	.set_sw_state = chromeos_priv_scrn_set_sw_state,
> +};
> +
> +static int chromeos_priv_scrn_add(struct acpi_device *adev)
> +{
> +	struct drm_privacy_screen *drm_priv_scrn =
> +		drm_privacy_screen_register(&adev->dev, &chromeos_priv_scrn_ops);
> +
> +	if (IS_ERR(drm_priv_scrn)) {
> +		dev_err(&adev->dev, "Error registering privacy-screen\n");
> +		return PTR_ERR(drm_priv_scrn);
> +	}
> +
> +	dev_info(&adev->dev, "registered privacy-screen '%s'\n",
> +		 dev_name(&drm_priv_scrn->dev));

I don't think we need be this noisy.

> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id chromeos_priv_scrn_device_ids[] = {
> +	{"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, chromeos_priv_scrn_device_ids);
> +
> +static struct acpi_driver chromeos_priv_scrn_driver = {
> +	.name = "chromeos_priv_scrn_drvr",
> +	.class = "ChromeOS",
> +	.ids = chromeos_priv_scrn_device_ids,
> +	.ops = {
> +		.add = chromeos_priv_scrn_add,

We don't need any cleanup?

> +	},
> +};
> +
> +module_acpi_driver(chromeos_priv_scrn_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
> +MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

Thanks.

-- 
Dmitry
