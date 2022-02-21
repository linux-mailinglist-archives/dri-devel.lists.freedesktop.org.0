Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD24BD928
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599CE10E336;
	Mon, 21 Feb 2022 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876910E336
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:44:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nM6Az-0005yH-Ah; Mon, 21 Feb 2022 11:44:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nM6At-000P4c-Mq; Mon, 21 Feb 2022 11:44:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nM6As-004a8j-5E; Mon, 21 Feb 2022 11:44:10 +0100
Date: Mon, 21 Feb 2022 11:44:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
Message-ID: <20220221104406.q65kdxunhelyi27v@pengutronix.de>
References: <20210514100142.1182997-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fo7jxdx5d4fj6bzu"
Content-Disposition: inline
In-Reply-To: <20210514100142.1182997-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 intel-gfx@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, nouveau@lists.freedesktop.org,
 Tian Tao <tiantao6@hisilicon.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fo7jxdx5d4fj6bzu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 14, 2021 at 12:01:42PM +0200, Uwe Kleine-K=F6nig wrote:
> While working on a drm driver that doesn't need the i2c algobit stuff I
> noticed that DRM selects this code even tough only 8 drivers actually use
> it. While also only some drivers use i2c, keep the select for I2C for the
> next cleanup patch. Still prepare this already by also selecting I2C for
> the individual drivers.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This patch is already old but the issue is still valid and the patch
even still applies to today's Linus' master branch.

I didn't receive any human feedback. If you consider this patch
worthwile I can recheck if it's still correct as is or needs adaption.

Best regards
Uwe

> ---
>  drivers/gpu/drm/Kconfig                 | 5 ++++-
>  drivers/gpu/drm/ast/Kconfig             | 2 ++
>  drivers/gpu/drm/gma500/Kconfig          | 2 ++
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
>  drivers/gpu/drm/i915/Kconfig            | 2 ++
>  drivers/gpu/drm/mgag200/Kconfig         | 2 ++
>  drivers/gpu/drm/nouveau/Kconfig         | 2 ++
>  7 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..351ea617c498 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -12,7 +12,6 @@ menuconfig DRM
>  	select HDMI
>  	select FB_CMDLINE
>  	select I2C
> -	select I2C_ALGOBIT
>  	select DMA_SHARED_BUFFER
>  	select SYNC_FILE
>  # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
> @@ -233,6 +232,8 @@ config DRM_RADEON
>          select DRM_KMS_HELPER
>          select DRM_TTM
>  	select DRM_TTM_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	select POWER_SUPPLY
>  	select HWMON
>  	select BACKLIGHT_CLASS_DEVICE
> @@ -254,6 +255,8 @@ config DRM_AMDGPU
>  	select DRM_SCHED
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	select POWER_SUPPLY
>  	select HWMON
>  	select BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
> index fbcf2f45cef5..bcc25decd485 100644
> --- a/drivers/gpu/drm/ast/Kconfig
> +++ b/drivers/gpu/drm/ast/Kconfig
> @@ -6,6 +6,8 @@ config DRM_AST
>  	select DRM_VRAM_HELPER
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	help
>  	 Say yes for experimental AST GPU driver. Do not enable
>  	 this driver without having a working -modesetting,
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kcon=
fig
> index 0cff20265f97..e26c3a24955d 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -3,6 +3,8 @@ config DRM_GMA500
>  	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
>  	depends on DRM && PCI && X86 && MMU
>  	select DRM_KMS_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
>  	select ACPI_VIDEO if ACPI
>  	select BACKLIGHT_CLASS_DEVICE if ACPI
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hi=
silicon/hibmc/Kconfig
> index 43943e980203..ac8c42dc79f6 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -6,6 +6,8 @@ config DRM_HISI_HIBMC
>  	select DRM_VRAM_HELPER
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	help
>  	  Choose this option if you have a Hisilicon Hibmc soc chipset.
>  	  If M is selected the module will be called hibmc-drm.
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 69f57ca9c68d..b3bb6f7cfbbc 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -13,6 +13,8 @@ config DRM_I915
>  	select DRM_PANEL
>  	select DRM_MIPI_DSI
>  	select RELAY
> +	select I2C
> +	select I2C_ALGOBIT
>  	select IRQ_WORK
>  	# i915 depends on ACPI_VIDEO when ACPI is enabled
>  	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kc=
onfig
> index eec59658a938..b28c5e4828f4 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -4,6 +4,8 @@ config DRM_MGAG200
>  	depends on DRM && PCI && MMU
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	help
>  	 This is a KMS driver for Matrox G200 chips. It supports the original
>  	 MGA G200 desktop chips and the server variants. It requires 0.3.0
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kc=
onfig
> index 9436310d0854..8823f0b24c73 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -7,6 +7,8 @@ config DRM_NOUVEAU
>  	select DRM_KMS_HELPER
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
> +	select I2C
> +	select I2C_ALGOBIT
>  	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
>  	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
>  	select X86_PLATFORM_DEVICES if ACPI && X86
>=20
> base-commit: 315d99318179b9cd5077ccc9f7f26a164c9fa998
> --=20
> 2.30.2
>=20
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fo7jxdx5d4fj6bzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmITbPMACgkQwfwUeK3K
7An5cgf/a9YGvJyV58Jivjfe2u2Dl/jKZ1+fArYpC3h0O76yBGqkT1CnEpgOaFJl
hjxWBIe+EwewKUcegjXnB58iNQmpH7tRet0BVfXluqLVQxKwgU7aFfiEJ9Hh81ua
epDFlbF3BUbVrrc3kXnTCoZTN6fOobAKDkU5SB8yEIR/85kbdQddGdSZtCE+FzBR
LIJPwaXafALQx9KQAsezXk3vOAm7wW1g602U24rVOLdM7GkPP4hhW0ygGrFzocBB
XkcuYGZGuZZNCcOCHSClhj7uA56suoSfZUK1at8PoGt2nBXT9oDP7MhSWIqjT/m1
43OTRW7a4MxzLRhTcwiiQJawYBvh7w==
=xsnb
-----END PGP SIGNATURE-----

--fo7jxdx5d4fj6bzu--
