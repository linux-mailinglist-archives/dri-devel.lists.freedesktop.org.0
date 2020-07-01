Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB601210FF5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079046E93E;
	Wed,  1 Jul 2020 16:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBE46E93E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 2397BFB03;
 Wed,  1 Jul 2020 18:00:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8AYZPjmMaMW; Wed,  1 Jul 2020 18:00:31 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 7583D40972; Wed,  1 Jul 2020 18:00:31 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:00:31 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 04/13] drm/panel: rocktech-jh057n00900: Rename the
 driver to st7703
Message-ID: <20200701160031.GC174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-5-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-5-megous@megous.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Wed, Jul 01, 2020 at 12:31:17PM +0200, Ondrej Jirman wrote:
> This rename is done so that the driver matches the name of the
> display controller and in preparation for adding support for more
> panels to the driver.
> =

> This is just a basic file rename, with no code changes.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =

> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                 | 26 +++++++++----------
>  drivers/gpu/drm/panel/Makefile                |  2 +-
>  ...-jh057n00900.c =3D> panel-sitronix-st7703.c} |  0
>  3 files changed, 14 insertions(+), 14 deletions(-)
>  rename drivers/gpu/drm/panel/{panel-rocktech-jh057n00900.c =3D> panel-si=
tronix-st7703.c} (100%)
> =

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 39055c1f0e2f..de2f2a452be5 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -283,19 +283,6 @@ config DRM_PANEL_RAYDIUM_RM68200
>  	  Say Y here if you want to enable support for Raydium RM68200
>  	  720x1280 DSI video mode panel.
>  =

> -config DRM_PANEL_ROCKTECH_JH057N00900
> -	tristate "Rocktech JH057N00900 MIPI touchscreen panel"
> -	depends on OF
> -	depends on DRM_MIPI_DSI
> -	depends on BACKLIGHT_CLASS_DEVICE
> -	help
> -	  Say Y here if you want to enable support for Rocktech JH057N00900
> -	  MIPI DSI panel as e.g. used in the Librem 5 devkit. It has a
> -	  resolution of 720x1440 pixels, a built in backlight and touch
> -	  controller.
> -	  Touch input support is provided by the goodix driver and needs to be
> -	  selected separately.
> -
>  config DRM_PANEL_RONBO_RB070D30
>  	tristate "Ronbo Electronics RB070D30 panel"
>  	depends on OF
> @@ -395,6 +382,19 @@ config DRM_PANEL_SITRONIX_ST7701
>  	  ST7701 controller for 480X864 LCD panels with MIPI/RGB/SPI
>  	  system interfaces.
>  =

> +config DRM_PANEL_SITRONIX_ST7703
> +	tristate "Sitronix ST7703 based MIPI touchscreen panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Sitronix ST7703 based
> +	  panels, souch as Rocktech JH057N00900 MIPI DSI panel as e.g. used in
> +	  the Librem 5 devkit. It has a resolution of 720x1440 pixels, a built
> +	  in backlight and touch controller.
> +	  Touch input support is provided by the goodix driver and needs to be
> +	  selected separately.
> +
>  config DRM_PANEL_SITRONIX_ST7789V
>  	tristate "Sitronix ST7789V panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index de74f282c433..e45ceac6286f 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -27,7 +27,6 @@ obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) +=3D pan=
el-panasonic-vvx10f034n00.o
>  obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) +=3D panel-raspberrypi-t=
ouchscreen.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) +=3D panel-raydium-rm67191.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) +=3D panel-raydium-rm68200.o
> -obj-$(CONFIG_DRM_PANEL_ROCKTECH_JH057N00900) +=3D panel-rocktech-jh057n0=
0900.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) +=3D panel-ronbo-rb070d30.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-samsung-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) +=3D panel-samsung-s6d16d0.o
> @@ -41,6 +40,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sh=
arp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) +=3D panel-sharp-ls037v7dw01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le01.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) +=3D panel-sitronix-st7701.o
> +obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) +=3D panel-sitronix-st7703.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7789v.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) +=3D panel-sony-acx424akp.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) +=3D panel-sony-acx565akm.o
> diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers=
/gpu/drm/panel/panel-sitronix-st7703.c
> similarity index 100%
> rename from drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> rename to drivers/gpu/drm/panel/panel-sitronix-st7703.c
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
