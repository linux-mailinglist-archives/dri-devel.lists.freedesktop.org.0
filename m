Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC63487CD2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 20:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC3110E836;
	Fri,  7 Jan 2022 19:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBA210E780
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 19:09:47 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso7247939pjg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 11:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jfjvDB6LUaGUvAQo5uC+/7zxwbMwe1SuYJU99FPfVdk=;
 b=b6AqX+kydpm+M86sdPz9aN4afAm3VxvZ3qn2Dt9GF7tioeR9IvzWrdmMGlrh1mfBHp
 21FWCFsee4z0S7zxwVSsiFEKx4dwHZOc1P0nh1sZR90qpYEClmSgmZR58rxWF8zVD5Ol
 eLqyxJhii5aUSjKwaL93rUsb1KEfYz0bkHaeIAArOHRgsI7B9ny/9cariUFTgPkL03Yv
 MBw4t5v41Gv3O2LdwsSor/EX1uygxCOBImGSVQBD2dDwpi1AM1Vp3+7gGsXAIyoxaVlP
 tMjYjcA31yqwjP+9WIYIykM1tDyZgJ80bb6oydIvboaN4zgnj0n5kB0lgFKg2TwRsok1
 8JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jfjvDB6LUaGUvAQo5uC+/7zxwbMwe1SuYJU99FPfVdk=;
 b=oV5VmxPHMiak3L/+DLkQzlQ7dIwe2cuaVOeh/i25uX3F9lPUxLEvlmXHtS0/+dHeZe
 9CEwr5eYF6ywXrQe1H7YWOudkv6juZlrCPpWCOcqqGulNX8BK3q1SzIXCXAk5I83JiCz
 pC0wHcm4HLxfdcwqSNO0SBPp3T7zKwaEFu5Qk71y9T/iQp8mwl2yw7Bou6cMmtXwW6ZF
 2hMWMFbQEHQxktxQmV7rUdB1lK5dcc5tz+A8axw8xY54+7tqFfwkF4wiAmuJp7K8klTc
 z/J4GJqm/l3qRjEf98Yhezd9ucRmElpJYnE5rKwaHbxsps6eWNLgO0Oz08w/3Zr5yDNE
 Rn1Q==
X-Gm-Message-State: AOAM532kP84j4vz5jkP25BJuLFYxwVQCj03lvWjHUvMkzIklzPwfEUSq
 3AvEQEiQn7VhenWgAmXzuOd9uw==
X-Google-Smtp-Source: ABdhPJwLKWH92J+CqroTRj+Oyv8Kz+mU24reg3iaQCNZCm3a7sywYpn5YaOPkJa7bMqbUH2uSSWzig==
X-Received: by 2002:a17:90b:143:: with SMTP id
 em3mr15052095pjb.23.1641582586962; 
 Fri, 07 Jan 2022 11:09:46 -0800 (PST)
Received: from google.com ([2620:15c:202:201:823f:348a:42f3:2b11])
 by smtp.gmail.com with ESMTPSA id c19sm4174453pfl.118.2022.01.07.11.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:09:46 -0800 (PST)
Date: Fri, 7 Jan 2022 11:09:39 -0800
From: Benson Leung <bleung@google.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v5 2/3] platform/chrome: Add driver for ChromeOS
 privacy-screen
Message-ID: <YdiP8zPHgM5XAvsN@google.com>
References: <20220107190208.95479-1-rajatja@google.com>
 <20220107190208.95479-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Qn5xF3c+Hpu80EQa"
Content-Disposition: inline
In-Reply-To: <20220107190208.95479-2-rajatja@google.com>
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
Cc: gwendal@google.com, marcheu@google.com,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@google.com,
 ibm-acpi-devel@lists.sourceforge.net, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dtor@google.com,
 dri-devel@lists.freedesktop.org, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Qn5xF3c+Hpu80EQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rajat,


On Fri, Jan 07, 2022 at 11:02:07AM -0800, Rajat Jain wrote:
> This adds the ACPI driver for the ChromeOS privacy screen that is
> present on some chromeos devices.
>=20
> Note that ideally, we'd want this privacy screen driver to be probed
> BEFORE the drm probe in order to avoid a drm probe deferral:
> https://hansdegoede.livejournal.com/25948.html
>=20
> In practise, I found that ACPI drivers are bound to their devices AFTER
> the drm probe on chromebooks. So on chromebooks with privacy-screen,
> this patch along with the other one in this series results in a probe
> deferral of about 250ms for i915 driver. However, it did not result in
> any user noticeable delay of splash screen in my personal experience.
>=20
> In future if this probe deferral turns out to be an issue, we can
> consider turning this ACPI driver into something that is probed
> earlier than the drm drivers.
>=20
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-By: Benson Leung <bleung@chromium.org>

Hi Hans,

Could you take this patch? This new driver in platform/chrome depends on
the drm/drm_privacy_screen_driver.h header in your tree.

Thanks!

> ---
> v5: * Add blank line, 2 more vowels to the driver name as per comments
>     * Add Dmitry's "Reviewed by"
> v4: Same as v3 (No changes)
> v3: * Renamed everything chromeos_priv_scrn_* to chromeos_privacy_screen_*
>      (and added line breaks to accommodate longer names within 80 chars)
>     * Cleanup / Added few comments
>     * Use the newly added drm_privacy_screen_get_drvdata()
>     * Provide the cleanup function chromeos_privacy_screen_remove()
> v2: * Reword the commit log
>     * Make the Kconfig into a tristate
>     * Reorder the patches in the series.
>=20
>  drivers/platform/chrome/Kconfig               |  11 ++
>  drivers/platform/chrome/Makefile              |   1 +
>  .../platform/chrome/chromeos_privacy_screen.c | 153 ++++++++++++++++++
>  3 files changed, 165 insertions(+)
>  create mode 100644 drivers/platform/chrome/chromeos_privacy_screen.c
>=20
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kc=
onfig
> index ccc23d8686e8..75e93efd669f 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -243,6 +243,17 @@ config CROS_USBPD_NOTIFY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cros_usbpd_notify.
> =20
> +config CHROMEOS_PRIVACY_SCREEN
> +	tristate "ChromeOS Privacy Screen support"
> +	depends on ACPI
> +	depends on DRM
> +	select DRM_PRIVACY_SCREEN
> +	help
> +	  This driver provides the support needed for the in-built electronic
> +	  privacy screen that is present on some ChromeOS devices. When enabled,
> +	  this should probably always be built into the kernel to avoid or
> +	  minimize drm probe deferral.
> +
>  source "drivers/platform/chrome/wilco_ec/Kconfig"
> =20
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/M=
akefile
> index f901d2e43166..5d4be9735d9d 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -4,6 +4,7 @@
>  CFLAGS_cros_ec_trace.o:=3D		-I$(src)
> =20
>  obj-$(CONFIG_CHROMEOS_LAPTOP)		+=3D chromeos_laptop.o
> +obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)	+=3D chromeos_privacy_screen.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)		+=3D chromeos_pstore.o
>  obj-$(CONFIG_CHROMEOS_TBMC)		+=3D chromeos_tbmc.o
>  obj-$(CONFIG_CROS_EC)			+=3D cros_ec.o
> diff --git a/drivers/platform/chrome/chromeos_privacy_screen.c b/drivers/=
platform/chrome/chromeos_privacy_screen.c
> new file mode 100644
> index 000000000000..77e9f5ee8e33
> --- /dev/null
> +++ b/drivers/platform/chrome/chromeos_privacy_screen.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + *  ChromeOS Privacy Screen support
> + *
> + * Copyright (C) 2022 Google LLC
> + *
> + * This is the Chromeos privacy screen provider, present on certain chro=
mebooks,
> + * represented by a GOOG0010 device in the ACPI. This ACPI device, if pr=
esent,
> + * will cause the i915 drm driver to probe defer until this driver regis=
ters
> + * the privacy-screen.
> + */
> +
> +#include <linux/acpi.h>
> +#include <drm/drm_privacy_screen_driver.h>
> +
> +/*
> + * The DSM (Device Specific Method) constants below are the agreed API w=
ith
> + * the firmware team, on how to control privacy screen using ACPI method=
s.
> + */
> +#define PRIV_SCRN_DSM_REVID		1	/* DSM version */
> +#define PRIV_SCRN_DSM_FN_GET_STATUS	1	/* Get privacy screen status */
> +#define PRIV_SCRN_DSM_FN_ENABLE		2	/* Enable privacy screen */
> +#define PRIV_SCRN_DSM_FN_DISABLE	3	/* Disable privacy screen */
> +
> +static const guid_t chromeos_privacy_screen_dsm_guid =3D
> +		    GUID_INIT(0xc7033113, 0x8720, 0x4ceb,
> +			      0x90, 0x90, 0x9d, 0x52, 0xb3, 0xe5, 0x2d, 0x73);
> +
> +static void
> +chromeos_privacy_screen_get_hw_state(struct drm_privacy_screen
> +				     *drm_privacy_screen)
> +{
> +	union acpi_object *obj;
> +	acpi_handle handle;
> +	struct device *privacy_screen =3D
> +		drm_privacy_screen_get_drvdata(drm_privacy_screen);
> +
> +	handle =3D acpi_device_handle(to_acpi_device(privacy_screen));
> +	obj =3D acpi_evaluate_dsm(handle, &chromeos_privacy_screen_dsm_guid,
> +				PRIV_SCRN_DSM_REVID,
> +				PRIV_SCRN_DSM_FN_GET_STATUS, NULL);
> +	if (!obj) {
> +		dev_err(privacy_screen,
> +			"_DSM failed to get privacy-screen state\n");
> +		return;
> +	}
> +
> +	if (obj->type !=3D ACPI_TYPE_INTEGER)
> +		dev_err(privacy_screen,
> +			"Bad _DSM to get privacy-screen state\n");
> +	else if (obj->integer.value =3D=3D 1)
> +		drm_privacy_screen->hw_state =3D drm_privacy_screen->sw_state =3D
> +			PRIVACY_SCREEN_ENABLED;
> +	else
> +		drm_privacy_screen->hw_state =3D drm_privacy_screen->sw_state =3D
> +			PRIVACY_SCREEN_DISABLED;
> +
> +	ACPI_FREE(obj);
> +}
> +
> +static int
> +chromeos_privacy_screen_set_sw_state(struct drm_privacy_screen
> +				     *drm_privacy_screen,
> +				     enum drm_privacy_screen_status state)
> +{
> +	union acpi_object *obj =3D NULL;
> +	acpi_handle handle;
> +	struct device *privacy_screen =3D
> +		drm_privacy_screen_get_drvdata(drm_privacy_screen);
> +
> +	handle =3D acpi_device_handle(to_acpi_device(privacy_screen));
> +
> +	if (state =3D=3D PRIVACY_SCREEN_DISABLED) {
> +		obj =3D acpi_evaluate_dsm(handle,
> +					&chromeos_privacy_screen_dsm_guid,
> +					PRIV_SCRN_DSM_REVID,
> +					PRIV_SCRN_DSM_FN_DISABLE, NULL);
> +	} else if (state =3D=3D PRIVACY_SCREEN_ENABLED) {
> +		obj =3D acpi_evaluate_dsm(handle,
> +					&chromeos_privacy_screen_dsm_guid,
> +					PRIV_SCRN_DSM_REVID,
> +					PRIV_SCRN_DSM_FN_ENABLE, NULL);
> +	} else {
> +		dev_err(privacy_screen,
> +			"Bad attempt to set privacy-screen status to %u\n",
> +			state);
> +		return -EINVAL;
> +	}
> +
> +	if (!obj) {
> +		dev_err(privacy_screen,
> +			"_DSM failed to set privacy-screen state\n");
> +		return -EIO;
> +	}
> +
> +	drm_privacy_screen->hw_state =3D drm_privacy_screen->sw_state =3D state;
> +	ACPI_FREE(obj);
> +	return 0;
> +}
> +
> +static const struct drm_privacy_screen_ops chromeos_privacy_screen_ops =
=3D {
> +	.get_hw_state =3D chromeos_privacy_screen_get_hw_state,
> +	.set_sw_state =3D chromeos_privacy_screen_set_sw_state,
> +};
> +
> +static int chromeos_privacy_screen_add(struct acpi_device *adev)
> +{
> +	struct drm_privacy_screen *drm_privacy_screen =3D
> +		drm_privacy_screen_register(&adev->dev,
> +					    &chromeos_privacy_screen_ops,
> +					    &adev->dev);
> +
> +	if (IS_ERR(drm_privacy_screen)) {
> +		dev_err(&adev->dev, "Error registering privacy-screen\n");
> +		return PTR_ERR(drm_privacy_screen);
> +	}
> +
> +	adev->driver_data =3D drm_privacy_screen;
> +	dev_info(&adev->dev, "registered privacy-screen '%s'\n",
> +		 dev_name(&drm_privacy_screen->dev));
> +
> +	return 0;
> +}
> +
> +static int chromeos_privacy_screen_remove(struct acpi_device *adev)
> +{
> +	struct drm_privacy_screen *drm_privacy_screen =3D	acpi_driver_data(adev=
);
> +
> +	drm_privacy_screen_unregister(drm_privacy_screen);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id chromeos_privacy_screen_device_ids[] =
=3D {
> +	{"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, chromeos_privacy_screen_device_ids);
> +
> +static struct acpi_driver chromeos_privacy_screen_driver =3D {
> +	.name =3D "chromeos_privacy_screen_driver",
> +	.class =3D "ChromeOS",
> +	.ids =3D chromeos_privacy_screen_device_ids,
> +	.ops =3D {
> +		.add =3D chromeos_privacy_screen_add,
> +		.remove =3D chromeos_privacy_screen_remove,
> +	},
> +};
> +
> +module_acpi_driver(chromeos_privacy_screen_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
> +MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");
> --=20
> 2.34.1.575.g55b058a8bb-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--Qn5xF3c+Hpu80EQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYdiP8wAKCRBzbaomhzOw
wrPtAQDWY6LxjaP+hjlbFvWHyp62Z5zH/NXbjBZ16wQYdzBP5wEAmDgvohz5vdRt
1cX0V5wjBcL2+niXGiaaWrQsHVE18AM=
=0p4J
-----END PGP SIGNATURE-----

--Qn5xF3c+Hpu80EQa--
