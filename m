Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8715E904E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 00:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27C810E147;
	Sat, 24 Sep 2022 22:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D210E217
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 22:22:27 +0000 (UTC)
Date: Sat, 24 Sep 2022 22:15:23 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="ogp8N9s8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1664057730; x=1664316930;
 bh=vibURvDK8C9+axigLopCKC5jQEsrmsW5ulpcMBkfZGs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=ogp8N9s8hO2Z1JgKo/5W0A0nXSZWm841x2LEGIK5ontx8mZj3iHofDM2FfcW0xXCA
 hQlBelr+s6pZsD3i5PbLgcFYDIfSMVJUjjhcYsZDs8mFyqvz7T2CIcpgLMRT794Nxu
 LTvjLCfBv2fMy9pyBBhE0KsVePuGee7jWTQvey28=
To: Nia Espera <a5b6@riseup.net>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/2] drivers: gpu: drm: remove support for sofef00 driver
 on s6e3fc2x01 panel
Message-ID: <f8a2b974-7f95-c158-5d52-3a9582fcd28c@connolly.tech>
In-Reply-To: <20220924203616.63325-3-a5b6@riseup.net>
References: <20220924203616.63325-1-a5b6@riseup.net>
 <20220924203616.63325-3-a5b6@riseup.net>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/09/2022 21:36, Nia Espera wrote:
> Removes functionality from sofef00 panel driver which allowed it to
> drive the s6e3fc2x01 panel
>
> Signed-off-by: Nia Espera <a5b6@riseup.net>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  6 +++---
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c | 18 ------------------
>   2 files changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfi=
g
> index ee62d5d8828a..62b9cb6acd05 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -547,16 +547,16 @@ config DRM_PANEL_SAMSUNG_S6E8AA0
>   =09select VIDEOMODE_HELPERS
>
>   config DRM_PANEL_SAMSUNG_SOFEF00
> -=09tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels=
"
> +=09tristate "Samsung sofef00 OnePlus 6 DSI cmd mode panel"
>   =09depends on OF
>   =09depends on DRM_MIPI_DSI
>   =09depends on BACKLIGHT_CLASS_DEVICE
>   =09select VIDEOMODE_HELPERS
>   =09help
>   =09  Say Y or M here if you want to enable support for the Samsung AMOL=
ED
> -=09  command mode panels found in the OnePlus 6/6T smartphones.
> +=09  command mode panel found in the OnePlus 6 smartphone.
>
> -=09  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
> +=09  The panel is 2280x1080@60Hz
>
>   config DRM_PANEL_SAMSUNG_S6E3FC2X01
>   =09tristate "Samsung s6e3fc2x01 OnePlus 6T DSI cmd mode panel"
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/=
drm/panel/panel-samsung-sofef00.c
> index bd02af81a4fe..68e58b9b8c5c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -181,20 +181,6 @@ static const struct drm_display_mode enchilada_panel=
_mode =3D {
>   =09.height_mm =3D 145,
>   };
>
> -static const struct drm_display_mode fajita_panel_mode =3D {
> -=09.clock =3D (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> -=09.hdisplay =3D 1080,
> -=09.hsync_start =3D 1080 + 72,
> -=09.hsync_end =3D 1080 + 72 + 16,
> -=09.htotal =3D 1080 + 72 + 16 + 36,
> -=09.vdisplay =3D 2340,
> -=09.vsync_start =3D 2340 + 32,
> -=09.vsync_end =3D 2340 + 32 + 4,
> -=09.vtotal =3D 2340 + 32 + 4 + 18,
> -=09.width_mm =3D 68,
> -=09.height_mm =3D 145,
> -};
> -
>   static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_=
connector *connector)
>   {
>   =09struct drm_display_mode *mode;
> @@ -327,10 +313,6 @@ static const struct of_device_id sofef00_panel_of_ma=
tch[] =3D {
>   =09=09.compatible =3D "samsung,sofef00",
>   =09=09.data =3D &enchilada_panel_mode,
>   =09},
> -=09{ // OnePlus 6T / fajita
> -=09=09.compatible =3D "samsung,s6e3fc2x01",
> -=09=09.data =3D &fajita_panel_mode,
> -=09},
>   =09{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);
> --
> 2.37.3
>

--
Kind Regards,
Caleb

