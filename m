Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452B13FE425
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05676E311;
	Wed,  1 Sep 2021 20:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9306E311
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:39:16 +0000 (UTC)
Date: Wed, 01 Sep 2021 21:39:02 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 08/16] MIPS: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Linus W
 <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar
 <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Message-Id: <21WRYQ.3FG7R58QMYBX2@crapouillou.net>
In-Reply-To: <20210901131531.v3.8.Ic7a6e3f8dd4760a302c91320843be5a00206bd63@changeid>
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.8.Ic7a6e3f8dd4760a302c91320843be5a00206bd63@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

Le mer., sept. 1 2021 at 13:19:26 -0700, Douglas Anderson=20
<dianders@chromium.org> a =E9crit :
> In the patch ("drm/panel-simple-edp: Split eDP panels out of
> panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> give everyone who had the old driver enabled the new driver too. If
> folks want to opt-out of one or the other they always can later.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> (no changes since v1)
>=20
>  arch/mips/configs/qi_lb60_defconfig | 1 +
>  arch/mips/configs/rs90_defconfig    | 1 +

The SoCs on these two boards don't support eDP, you can drop this patch.

Cheers,
-Paul

>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/mips/configs/qi_lb60_defconfig=20
> b/arch/mips/configs/qi_lb60_defconfig
> index b4448d0876d5..3e99e223ea02 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -72,6 +72,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
>  CONFIG_DRM=3Dy
>  CONFIG_DRM_FBDEV_OVERALLOC=3D200
>  CONFIG_DRM_PANEL_SIMPLE=3Dy
> +CONFIG_DRM_PANEL_SIMPLE_EDP=3Dy
>  CONFIG_DRM_INGENIC=3Dy
>  CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>  # CONFIG_VGA_CONSOLE is not set
> diff --git a/arch/mips/configs/rs90_defconfig=20
> b/arch/mips/configs/rs90_defconfig
> index 7ce3b814fdc8..42b4f621cbfa 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -94,6 +94,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
>  CONFIG_DRM=3Dy
>  CONFIG_DRM_FBDEV_OVERALLOC=3D300
>  CONFIG_DRM_PANEL_SIMPLE=3Dy
> +CONFIG_DRM_PANEL_SIMPLE_EDP=3Dy
>  CONFIG_DRM_INGENIC=3Dy
>  CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>  CONFIG_BACKLIGHT_PWM=3Dy
> --
> 2.33.0.259.gc128427fd7-goog
>=20


