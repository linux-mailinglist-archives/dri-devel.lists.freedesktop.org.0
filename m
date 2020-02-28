Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA217410A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 21:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43CD6F4C7;
	Fri, 28 Feb 2020 20:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EAA6F4C7;
 Fri, 28 Feb 2020 20:34:55 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D0F8C8046E;
 Fri, 28 Feb 2020 21:34:51 +0100 (CET)
Date: Fri, 28 Feb 2020 21:34:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 47/51] drm/mipi-dbi: Move drm_mode_config_init into mipi
 library
Message-ID: <20200228203450.GD22966@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-48-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-48-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=-VAfIpHNAAAA:8 a=WZHNqt2aAAAA:8
 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=0xE26-vk7-I09ZJC9B0A:9
 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22 a=AjGcO6oz07-iQ99wixmX:22
 a=srlwD-8ojaedGGhPAyx8:22 a=PrHl9onO2p7xFKlKy1af:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:15:18PM +0100, Daniel Vetter wrote:
> 7/7 drivers agree that's the right choice, let's do this.
> =

> This avoids duplicating the same old error checking code over all 7
> drivers, which is the motivation here.
> =

> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Tested-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: David Lechner <david@lechnology.com>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c  | 4 ++++
>  drivers/gpu/drm/tiny/hx8357d.c  | 2 --
>  drivers/gpu/drm/tiny/ili9225.c  | 2 --
>  drivers/gpu/drm/tiny/ili9341.c  | 2 --
>  drivers/gpu/drm/tiny/ili9486.c  | 2 --
>  drivers/gpu/drm/tiny/mi0283qt.c | 2 --
>  drivers/gpu/drm/tiny/st7586.c   | 2 --
>  drivers/gpu/drm/tiny/st7735r.c  | 2 --
>  8 files changed, 4 insertions(+), 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_db=
i.c
> index a678e07508d4..9de1586659be 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -510,6 +510,10 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_d=
ev *dbidev,
>  	if (!dbidev->dbi.command)
>  		return -EINVAL;
>  =

> +	ret =3D drm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
>  	dbidev->tx_buf =3D devm_kmalloc(drm->dev, tx_buf_size, GFP_KERNEL);
>  	if (!dbidev->tx_buf)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357=
d.c
> index 42bc5dadcb1c..c88b84366dc5 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -239,8 +239,6 @@ static int hx8357d_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	dc =3D devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
>  	if (IS_ERR(dc)) {
>  		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili922=
5.c
> index aae88dc5b3f7..fa998a16026c 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -390,8 +390,6 @@ static int ili9225_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	dbi->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(dbi->reset)) {
>  		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili934=
1.c
> index 7d40cb4ff72b..945e15169866 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -197,8 +197,6 @@ static int ili9341_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	dbi->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(dbi->reset)) {
>  		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili948=
6.c
> index 7d735fc67498..38d293cf5377 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -211,8 +211,6 @@ static int ili9486_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	dbi->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(dbi->reset)) {
>  		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi028=
3qt.c
> index 8555a56bce8c..b8c973bc2347 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -201,8 +201,6 @@ static int mi0283qt_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	dbi->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(dbi->reset)) {
>  		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index 427c2561f5f4..1f1a576be93c 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -331,8 +331,6 @@ static int st7586_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	bufsize =3D (st7586_mode.vdisplay + 2) / 3 * st7586_mode.hdisplay;
>  =

>  	dbi->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735=
r.c
> index b447235c3d47..0f48a5a2d3d7 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -212,8 +212,6 @@ static int st7735r_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, dbidev);
>  =

> -	drm_mode_config_init(drm);
> -
>  	dbi->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(dbi->reset)) {
>  		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
