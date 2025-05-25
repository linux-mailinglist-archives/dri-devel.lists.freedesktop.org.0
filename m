Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F85AC369E
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8ED10E1A5;
	Sun, 25 May 2025 19:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5IQ5djK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91E710E00F;
 Sun, 25 May 2025 19:40:59 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-310f3c7bd87so1117363a91.3; 
 Sun, 25 May 2025 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748202059; x=1748806859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Br+0Wl0PbsODPUn4zgvPQLLKP3q/KrHky+/TbAbWixk=;
 b=G5IQ5djKOdR8Z6XkA7dpLG2vUikV7f4qC4tYulBsyZ8ZnK9aTZ4Aa3r9wR62sJ/CxV
 yuJWoUTt9Dq6Ih30nfUHDjwTfqVra2RRlUFmWwOrPEfIToJba7dKrTADLqxXSTXEqcpt
 xvkxwf573zI6f29cu6Zu/Awg2Yn0tUNoj7tbjpdaS6qODuvYUQENIJv70X2z/XnfQ7oD
 d+/LTFQbMzIYwTxT90MU2i/GHRUCASyJrOI4xABxmGLr5suFEI3SafVUQ1YEdUD5yD6r
 TTEjjVDAbJ3ba88uMox9rfVoY/+Xo69WhoJ2T3SyjvjmPX8/m6uhnrm8uhE5WiY/RtGk
 /6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748202059; x=1748806859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Br+0Wl0PbsODPUn4zgvPQLLKP3q/KrHky+/TbAbWixk=;
 b=P/CjcZ0MNihwqLyIOD4bju2MsKXIRYETFA5oHHAKww0Q1bVQMW/XvuglQf9J7lF2jH
 YVt97aZL793Vs78oBdiueUdC6Arb3u1mVlvTOO2U55m4YKzWJEVJGydQOyEr6xx/n8nN
 CZhu+SRZzfFkzlfMpF+jUfFPsBNrER7khpUsRJPdgjtlQUlaXnx6KKGJg0c2BMh+C8BG
 vqIiICVQ1eRM/SdD2kRmALJI4VZ2BmrGzlf4V67b9JMkwMY9TQtzxzHzlSu+PhDlfoeu
 SyIPA3J3p7CppPBDtp8VVX8PtXEoiYWFls91w3oSOiPi/qQfgsf42xlO22j/c1Q3ZVqf
 5HFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7xsK47DDsAWrXF6n6bxed8k5tL44u/cEkTjU3VuDdr76nB3Q+Hz9K5Eq494pWpBw8qEF8hN61abl2@lists.freedesktop.org,
 AJvYcCWod/NGOA8Ohr+fRFMa2S6NgnPnYyvPplQJHybQFuZJ8sOwm0YqChVWImqjhUl36w3iULVmid+HbU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoux3I1A9zZdGbgmKHWWZV+LQVzBhqyWjln8VSwgMUm07frLvL
 sLjPOxA4OdTw2/jWbhp8F2A0t8f1Wly32GeIVCGVTbwalWySp/X56tQ9rgoLSO4D4wqlwJHFWaz
 np0VOj6WPSynhyqknnsjkz7CND1Yj7Ks=
X-Gm-Gg: ASbGnctyWGizW6Ju+3c8DoMo7dd9RMxux8k5oatzHWX3M9TKXyjYBbtpHdiK7NESom6
 6hoT3hiygXRAtkQxiY+8MYWKbhmlYUbVxKd2j2sg40DDQ1/PZLU85rI2voU53T11OiiFKt31po7
 CMCy1RlWuVpcpGsvIBkujt3Btcuedtc5xB
X-Google-Smtp-Source: AGHT+IFAfTw7Q87x10e7pHfNFCXN5AJjoFzo4QoiNWcxlBpqwQMj3/JLkljdETcdSPsiIvkprQGP+nytGgAVOf1nMJ4=
X-Received: by 2002:a17:90b:358c:b0:30a:4c29:4c9c with SMTP id
 98e67ed59e1d1-3110f0c9deemr7507465a91.6.1748202058538; Sun, 25 May 2025
 12:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 25 May 2025 14:40:46 -0500
X-Gm-Features: AX0GCFvNYgh6KsIliiGfmZyKK-Yn5WxJr4VGF4fWAjf3coFdcwK7wZkxIL57fcg
Message-ID: <CAHCN7xLPxmaZcOESvaU2W1gX4o1z-1A_atq4jZdrpAH5Wmht+g@mail.gmail.com>
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>,
 Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, May 9, 2025 at 8:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
>
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
>
> The patch has been applied with the explicit exclusion of bridge/panel.c,
> handled by a separate patch.
>
> After applying the semantic patch, manually fixed these issues:
>
>  - 4 drivers need ERR_CAST() instead of PTR_ERR() as the function calling
>    devm_drm_bridge_alloc() returns a pointer
>  - re-added empty lines and comments that the script had removed but that
>    should stay
>
>   @@
>   type T;
>   identifier C;
>   identifier BR;
>   expression DEV;
>   expression FUNCS;
>   @@
>   -T *C;
>   +T *C;
>    ...
>   (
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return -ENOMEM;
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   |
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return ERR_PTR(-ENOMEM);
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   )
>    ...
>   -C->BR.funcs =3D FUNCS;
>
> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com> # micro=
chip-lvds.c
> Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Detlev Casanova <detlev.casanova@collabora.com>
> Cc: Dharma Balasubiramani <dharma.b@microchip.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Janne Grunau <j@jannau.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jesse Van Gavere <jesseevg@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Vitalii Mordan <mordan@ispras.ru>
>
> Changed in v3:
> - manually replaced PTR_ERR() with ERR_CAST() in the 4 cases where the
>   return value is not int
> - manually added empty lines and comments that the spatch had removed
>   inappropriately
> - improved commit message
>
> Changed in v2:
> - added missing PTR_ERR() in the second spatch alternative
> ---
>  drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  8 ++++----
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-bridge.c                 |  8 ++++----
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  8 ++++----
>  drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  8 ++++----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  8 ++++----
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  8 ++++----

For: imx8mp-hdmi-pvi.c and adv7511_drv.c

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it66121.c                |  8 ++++----
>  drivers/gpu/drm/bridge/lontium-lt8912b.c            |  8 ++++----
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  7 +++----
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  8 ++++----
>  drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
>  drivers/gpu/drm/bridge/parade-ps8622.c              |  8 ++++----
>  drivers/gpu/drm/bridge/parade-ps8640.c              |  8 ++++----
>  drivers/gpu/drm/bridge/sii9234.c                    |  8 ++++----
>  drivers/gpu/drm/bridge/sil-sii8620.c                |  8 ++++----
>  drivers/gpu/drm/bridge/simple-bridge.c              |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
>  drivers/gpu/drm/bridge/tc358762.c                   |  8 ++++----
>  drivers/gpu/drm/bridge/tc358764.c                   |  8 ++++----
>  drivers/gpu/drm/bridge/tc358768.c                   |  8 ++++----
>  drivers/gpu/drm/bridge/tc358775.c                   |  8 ++++----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tpd12s015.c               |  8 ++++----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  8 ++++----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  |  8 ++++----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  8 ++++----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  8 ++++----
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 10 ++++++----
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           | 10 ++++++----
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 10 ++++++----
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  8 ++++----
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  8 ++++----
>  49 files changed, 201 insertions(+), 198 deletions(-)
>
> diff --git a/drivers/gpu/drm/adp/adp-mipi.c b/drivers/gpu/drm/adp/adp-mip=
i.c
> index 2b60128e2c693e9f85affff569cc57cdb6f47909..cba7d32150a98d78d07a25b18=
22dec6bf2f08f65 100644
> --- a/drivers/gpu/drm/adp/adp-mipi.c
> +++ b/drivers/gpu/drm/adp/adp-mipi.c
> @@ -229,9 +229,10 @@ static int adp_mipi_probe(struct platform_device *pd=
ev)
>  {
>         struct adp_mipi_drv_private *adp;
>
> -       adp =3D devm_kzalloc(&pdev->dev, sizeof(*adp), GFP_KERNEL);
> -       if (!adp)
> -               return -ENOMEM;
> +       adp =3D devm_drm_bridge_alloc(&pdev->dev, struct adp_mipi_drv_pri=
vate,
> +                                   bridge, &adp_dsi_bridge_funcs);
> +       if (IS_ERR(adp))
> +               return PTR_ERR(adp);
>
>         adp->mipi =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(adp->mipi)) {
> @@ -241,7 +242,6 @@ static int adp_mipi_probe(struct platform_device *pde=
v)
>
>         adp->dsi.dev =3D &pdev->dev;
>         adp->dsi.ops =3D &adp_dsi_host_ops;
> -       adp->bridge.funcs =3D &adp_dsi_bridge_funcs;
>         adp->bridge.of_node =3D pdev->dev.of_node;
>         adp->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>         dev_set_drvdata(&pdev->dev, adp);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 1257009e850c1b20184cfaea5b6a4440e75e10d7..8d7b007ea203d0d8be8f5b145=
f8531e23294dacc 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1224,9 +1224,10 @@ static int adv7511_probe(struct i2c_client *i2c)
>         if (!dev->of_node)
>                 return -EINVAL;
>
> -       adv7511 =3D devm_kzalloc(dev, sizeof(*adv7511), GFP_KERNEL);
> -       if (!adv7511)
> -               return -ENOMEM;
> +       adv7511 =3D devm_drm_bridge_alloc(dev, struct adv7511, bridge,
> +                                       &adv7511_bridge_funcs);
> +       if (IS_ERR(adv7511))
> +               return PTR_ERR(adv7511);
>
>         adv7511->i2c_main =3D i2c;
>         adv7511->powered =3D false;
> @@ -1327,7 +1328,6 @@ static int adv7511_probe(struct i2c_client *i2c)
>         if (ret)
>                 goto err_unregister_cec;
>
> -       adv7511->bridge.funcs =3D &adv7511_bridge_funcs;
>         adv7511->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID=
;
>         if (adv7511->i2c_main->irq)
>                 adv7511->bridge.ops |=3D DRM_BRIDGE_OP_HPD;
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index a83020d6576f78372056069947783a626acf64b1..ba0fc149a9e722a53da6027a8=
51bf62262ba64b2 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1193,9 +1193,10 @@ static int anx78xx_i2c_probe(struct i2c_client *cl=
ient)
>         bool found =3D false;
>         int err;
>
> -       anx78xx =3D devm_kzalloc(&client->dev, sizeof(*anx78xx), GFP_KERN=
EL);
> -       if (!anx78xx)
> -               return -ENOMEM;
> +       anx78xx =3D devm_drm_bridge_alloc(&client->dev, struct anx78xx, b=
ridge,
> +                                       &anx78xx_bridge_funcs);
> +       if (IS_ERR(anx78xx))
> +               return PTR_ERR(anx78xx);
>
>         pdata =3D &anx78xx->pdata;
>
> @@ -1306,8 +1307,6 @@ static int anx78xx_i2c_probe(struct i2c_client *cli=
ent)
>                 goto err_poweroff;
>         }
>
> -       anx78xx->bridge.funcs =3D &anx78xx_bridge_funcs;
> -
>         drm_bridge_add(&anx78xx->bridge);
>
>         /* If cable is pulled out, just poweroff and wait for HPD event *=
/
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge=
/aux-bridge.c
> index c179b86d208f70d95b41e6f2157b78f97bac4d8d..5b219e3b87b1df9fc4aaf2c8a=
6e78bac8f894628 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -109,9 +109,10 @@ static int drm_aux_bridge_probe(struct auxiliary_dev=
ice *auxdev,
>  {
>         struct drm_aux_bridge_data *data;
>
> -       data =3D devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> -       if (!data)
> -               return -ENOMEM;
> +       data =3D devm_drm_bridge_alloc(&auxdev->dev, struct drm_aux_bridg=
e_data,
> +                                    bridge, &drm_aux_bridge_funcs);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
>
>         data->dev =3D &auxdev->dev;
>         data->next_bridge =3D devm_drm_of_get_bridge(&auxdev->dev, auxdev=
->dev.of_node, 0, 0);
> @@ -119,7 +120,6 @@ static int drm_aux_bridge_probe(struct auxiliary_devi=
ce *auxdev,
>                 return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bri=
dge),
>                                      "failed to acquire drm_bridge\n");
>
> -       data->bridge.funcs =3D &drm_aux_bridge_funcs;
>         data->bridge.of_node =3D data->dev->of_node;
>
>         /* passthrough data, allow everything */
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/br=
idge/aux-hpd-bridge.c
> index b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee..3eb411f874e41b322f732649b=
d2074c5d8422566 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -171,12 +171,13 @@ static int drm_aux_hpd_bridge_probe(struct auxiliar=
y_device *auxdev,
>  {
>         struct drm_aux_hpd_bridge_data *data;
>
> -       data =3D devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> -       if (!data)
> -               return -ENOMEM;
> +       data =3D devm_drm_bridge_alloc(&auxdev->dev,
> +                                    struct drm_aux_hpd_bridge_data, brid=
ge,
> +                                    &drm_aux_hpd_bridge_funcs);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
>
>         data->dev =3D &auxdev->dev;
> -       data->bridge.funcs =3D &drm_aux_hpd_bridge_funcs;
>         data->bridge.of_node =3D dev_get_platdata(data->dev);
>         data->bridge.ops =3D DRM_BRIDGE_OP_HPD;
>         data->bridge.type =3D id->driver_data;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index b431e7efd1f0d749320ea15b6f1f5ca13fc72800..cb5f5a8c539a471290df8435d=
4c2e3ed696b38d4 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2389,9 +2389,10 @@ static int cdns_mhdp_probe(struct platform_device =
*pdev)
>         int ret;
>         int irq;
>
> -       mhdp =3D devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> -       if (!mhdp)
> -               return -ENOMEM;
> +       mhdp =3D devm_drm_bridge_alloc(dev, struct cdns_mhdp_device, brid=
ge,
> +                                    &cdns_mhdp_bridge_funcs);
> +       if (IS_ERR(mhdp))
> +               return PTR_ERR(mhdp);
>
>         clk =3D devm_clk_get_enabled(dev, NULL);
>         if (IS_ERR(clk)) {
> @@ -2481,7 +2482,6 @@ static int cdns_mhdp_probe(struct platform_device *=
pdev)
>         mhdp->display_fmt.bpc =3D 8;
>
>         mhdp->bridge.of_node =3D pdev->dev.of_node;
> -       mhdp->bridge.funcs =3D &cdns_mhdp_bridge_funcs;
>         mhdp->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>                            DRM_BRIDGE_OP_HPD;
>         mhdp->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPort;
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 634c5b0306679d2e68798c2b9013aae4491dd44c..814713c5bea97dcdc2b847d2f=
266a567ef40e981 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -691,9 +691,10 @@ static int chipone_common_probe(struct device *dev, =
struct chipone **icnr)
>         struct chipone *icn;
>         int ret;
>
> -       icn =3D devm_kzalloc(dev, sizeof(struct chipone), GFP_KERNEL);
> -       if (!icn)
> -               return -ENOMEM;
> +       icn =3D devm_drm_bridge_alloc(dev, struct chipone, bridge,
> +                                   &chipone_bridge_funcs);
> +       if (IS_ERR(icn))
> +               return PTR_ERR(icn);
>
>         icn->dev =3D dev;
>
> @@ -701,7 +702,6 @@ static int chipone_common_probe(struct device *dev, s=
truct chipone **icnr)
>         if (ret)
>                 return ret;
>
> -       icn->bridge.funcs =3D &chipone_bridge_funcs;
>         icn->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>         icn->bridge.of_node =3D dev->of_node;
>
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/b=
ridge/chrontel-ch7033.c
> index 210c45c1efd48f5b541bf73da66a169c27e110b2..ab92747933568bfba77da4521=
9e019408029f297 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -536,9 +536,10 @@ static int ch7033_probe(struct i2c_client *client)
>         unsigned int val;
>         int ret;
>
> -       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -       if (!priv)
> -               return -ENOMEM;
> +       priv =3D devm_drm_bridge_alloc(dev, struct ch7033_priv, bridge,
> +                                    &ch7033_bridge_funcs);
> +       if (IS_ERR(priv))
> +               return PTR_ERR(priv);
>
>         dev_set_drvdata(dev, priv);
>
> @@ -575,7 +576,6 @@ static int ch7033_probe(struct i2c_client *client)
>         }
>
>         INIT_LIST_HEAD(&priv->bridge.list);
> -       priv->bridge.funcs =3D &ch7033_bridge_funcs;
>         priv->bridge.of_node =3D dev->of_node;
>         drm_bridge_add(&priv->bridge);
>
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/b=
ridge/cros-ec-anx7688.c
> index c8abd9920fee956cf049bcb09827d658b7939333..a35dae9b56e247d43cac317d8=
bf1f904d5e7435e 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -103,9 +103,10 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_c=
lient *client)
>         u8 buffer[4];
>         int ret;
>
> -       anx7688 =3D devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> -       if (!anx7688)
> -               return -ENOMEM;
> +       anx7688 =3D devm_drm_bridge_alloc(dev, struct cros_ec_anx7688, br=
idge,
> +                                       &cros_ec_anx7688_bridge_funcs);
> +       if (IS_ERR(anx7688))
> +               return PTR_ERR(anx7688);
>
>         anx7688->client =3D client;
>         i2c_set_clientdata(client, anx7688);
> @@ -153,7 +154,6 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_cl=
ient *client)
>                 DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\=
n",
>                          fw_version);
>
> -       anx7688->bridge.funcs =3D &cros_ec_anx7688_bridge_funcs;
>         drm_bridge_add(&anx7688->bridge);
>
>         return 0;
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 2cb6dfc7a6d3dbdd620a35345204f8fb9cae6651..5c3cf37200bcee1db285c97e2=
b463c9355ee6acb 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -298,16 +298,15 @@ static int fsl_ldb_probe(struct platform_device *pd=
ev)
>         struct fsl_ldb *fsl_ldb;
>         int dual_link;
>
> -       fsl_ldb =3D devm_kzalloc(dev, sizeof(*fsl_ldb), GFP_KERNEL);
> -       if (!fsl_ldb)
> -               return -ENOMEM;
> +       fsl_ldb =3D devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &f=
uncs);
> +       if (IS_ERR(fsl_ldb))
> +               return PTR_ERR(fsl_ldb);
>
>         fsl_ldb->devdata =3D of_device_get_match_data(dev);
>         if (!fsl_ldb->devdata)
>                 return -EINVAL;
>
>         fsl_ldb->dev =3D &pdev->dev;
> -       fsl_ldb->bridge.funcs =3D &funcs;
>         fsl_ldb->bridge.of_node =3D dev->of_node;
>
>         fsl_ldb->clk =3D devm_clk_get(dev, "ldb");
> diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu=
/drm/bridge/imx/imx-legacy-bridge.c
> index f072c6ed39ef183b10518b43bd6d979bc89e36f9..989bc497b05071af2a92c750d=
907addcfe783858 100644
> --- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> +++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> @@ -59,9 +59,10 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct d=
evice *dev,
>         struct imx_legacy_bridge *imx_bridge;
>         int ret;
>
> -       imx_bridge =3D devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL)=
;
> -       if (!imx_bridge)
> -               return ERR_PTR(-ENOMEM);
> +       imx_bridge =3D devm_drm_bridge_alloc(dev, struct imx_legacy_bridg=
e,
> +                                          base, &imx_legacy_bridge_funcs=
);
> +       if (IS_ERR(imx_bridge))
> +               return ERR_CAST(imx_bridge);
>
>         ret =3D of_get_drm_display_mode(np,
>                                       &imx_bridge->mode,
> @@ -72,7 +73,6 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct de=
vice *dev,
>
>         imx_bridge->mode.type |=3D DRM_MODE_TYPE_DRIVER;
>
> -       imx_bridge->base.funcs =3D &imx_legacy_bridge_funcs;
>         imx_bridge->base.of_node =3D np;
>         imx_bridge->base.ops =3D DRM_BRIDGE_OP_MODES;
>         imx_bridge->base.type =3D type;
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/d=
rm/bridge/imx/imx8mp-hdmi-pvi.c
> index 8a4fd7d77a8d516b3b46f41cf07d2633d23bde12..3a6f8587a257c3ceacefbed1b=
37024289617b7c1 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -140,9 +140,10 @@ static int imx8mp_hdmi_pvi_probe(struct platform_dev=
ice *pdev)
>         struct device_node *remote;
>         struct imx8mp_hdmi_pvi *pvi;
>
> -       pvi =3D devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
> -       if (!pvi)
> -               return -ENOMEM;
> +       pvi =3D devm_drm_bridge_alloc(&pdev->dev, struct imx8mp_hdmi_pvi,
> +                                   bridge, &imx_hdmi_pvi_bridge_funcs);
> +       if (IS_ERR(pvi))
> +               return PTR_ERR(pvi);
>
>         platform_set_drvdata(pdev, pvi);
>         pvi->dev =3D &pdev->dev;
> @@ -166,7 +167,6 @@ static int imx8mp_hdmi_pvi_probe(struct platform_devi=
ce *pdev)
>         pm_runtime_enable(&pdev->dev);
>
>         /* Register the bridge. */
> -       pvi->bridge.funcs =3D &imx_hdmi_pvi_bridge_funcs;
>         pvi->bridge.of_node =3D pdev->dev.of_node;
>         pvi->bridge.timings =3D pvi->next_bridge->timings;
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gp=
u/drm/bridge/imx/imx8qxp-pixel-link.c
> index e092c9ea99b0224802919ff84b448acb53508951..e5943506981dfb8f113c94ad5=
2ddbba52e00ec3f 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -327,9 +327,10 @@ static int imx8qxp_pixel_link_bridge_probe(struct pl=
atform_device *pdev)
>         struct device_node *np =3D dev->of_node;
>         int ret;
>
> -       pl =3D devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> -       if (!pl)
> -               return -ENOMEM;
> +       pl =3D devm_drm_bridge_alloc(dev, struct imx8qxp_pixel_link, brid=
ge,
> +                                  &imx8qxp_pixel_link_bridge_funcs);
> +       if (IS_ERR(pl))
> +               return PTR_ERR(pl);
>
>         ret =3D imx_scu_get_handle(&pl->ipc_handle);
>         if (ret) {
> @@ -384,7 +385,6 @@ static int imx8qxp_pixel_link_bridge_probe(struct pla=
tform_device *pdev)
>         platform_set_drvdata(pdev, pl);
>
>         pl->bridge.driver_private =3D pl;
> -       pl->bridge.funcs =3D &imx8qxp_pixel_link_bridge_funcs;
>         pl->bridge.of_node =3D np;
>
>         drm_bridge_add(&pl->bridge);
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/d=
rm/bridge/imx/imx8qxp-pxl2dpi.c
> index da138ab51b3bd2c6ebd3780c09818891d5320092..111310acab2ce403a62a47ecb=
e9d9dd372c75ecd 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -392,9 +392,10 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platf=
orm_device *pdev)
>         struct device_node *np =3D dev->of_node;
>         int ret;
>
> -       p2d =3D devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
> -       if (!p2d)
> -               return -ENOMEM;
> +       p2d =3D devm_drm_bridge_alloc(dev, struct imx8qxp_pxl2dpi, bridge=
,
> +                                   &imx8qxp_pxl2dpi_bridge_funcs);
> +       if (IS_ERR(p2d))
> +               return PTR_ERR(p2d);
>
>         p2d->regmap =3D syscon_node_to_regmap(np->parent);
>         if (IS_ERR(p2d->regmap)) {
> @@ -441,7 +442,6 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platfo=
rm_device *pdev)
>         pm_runtime_enable(dev);
>
>         p2d->bridge.driver_private =3D p2d;
> -       p2d->bridge.funcs =3D &imx8qxp_pxl2dpi_bridge_funcs;
>         p2d->bridge.of_node =3D np;
>
>         drm_bridge_add(&p2d->bridge);
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index a3a63a977b0a8487ad38fc08e0eed08672f4d41a..c4eedf643f39e9b91efeb5a62=
14bf2fe6f2c040a 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -816,9 +816,10 @@ static int it6263_probe(struct i2c_client *client)
>         struct it6263 *it;
>         int ret;
>
> -       it =3D devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
> -       if (!it)
> -               return -ENOMEM;
> +       it =3D devm_drm_bridge_alloc(dev, struct it6263, bridge,
> +                                  &it6263_bridge_funcs);
> +       if (IS_ERR(it))
> +               return PTR_ERR(it);
>
>         it->dev =3D dev;
>         it->hdmi_i2c =3D client;
> @@ -866,7 +867,6 @@ static int it6263_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, it);
>
> -       it->bridge.funcs =3D &it6263_bridge_funcs;
>         it->bridge.of_node =3D dev->of_node;
>         /* IT6263 chip doesn't support HPD interrupt. */
>         it->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index 1383d1e21afea1acb46b7bd28860908b58832dbc..b0dc9280d870c4864d4398499=
9238e8a34bf47df 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3583,9 +3583,10 @@ static int it6505_i2c_probe(struct i2c_client *cli=
ent)
>         struct extcon_dev *extcon;
>         int err;
>
> -       it6505 =3D devm_kzalloc(&client->dev, sizeof(*it6505), GFP_KERNEL=
);
> -       if (!it6505)
> -               return -ENOMEM;
> +       it6505 =3D devm_drm_bridge_alloc(&client->dev, struct it6505, bri=
dge,
> +                                      &it6505_bridge_funcs);
> +       if (IS_ERR(it6505))
> +               return PTR_ERR(it6505);
>
>         mutex_init(&it6505->extcon_lock);
>         mutex_init(&it6505->mode_lock);
> @@ -3660,7 +3661,6 @@ static int it6505_i2c_probe(struct i2c_client *clie=
nt)
>         it6505->aux.transfer =3D it6505_aux_transfer;
>         drm_dp_aux_init(&it6505->aux);
>
> -       it6505->bridge.funcs =3D &it6505_bridge_funcs;
>         it6505->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPort;
>         it6505->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID =
|
>                              DRM_BRIDGE_OP_HPD;
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridg=
e/ite-it66121.c
> index 7b110ae532918d2d6f91ebc5f747c38e7e77dc07..6494f0842793829b7658b3303=
38767e5b38a1115 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1516,9 +1516,10 @@ static int it66121_probe(struct i2c_client *client=
)
>                 return -ENXIO;
>         }
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx =3D devm_drm_bridge_alloc(dev, struct it66121_ctx, bridge,
> +                                   &it66121_bridge_funcs);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ep =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>         if (!ep)
> @@ -1577,7 +1578,6 @@ static int it66121_probe(struct i2c_client *client)
>                 return -ENODEV;
>         }
>
> -       ctx->bridge.funcs =3D &it66121_bridge_funcs;
>         ctx->bridge.of_node =3D dev->of_node;
>         ctx->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>         ctx->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 3e49d855b3648880cea9bce5f3f04fbb6f838a45..bd83228b0f0eb49062ee84f62=
f8ae50b78bbfb0e 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -761,9 +761,10 @@ static int lt8912_probe(struct i2c_client *client)
>         int ret =3D 0;
>         struct device *dev =3D &client->dev;
>
> -       lt =3D devm_kzalloc(dev, sizeof(struct lt8912), GFP_KERNEL);
> -       if (!lt)
> -               return -ENOMEM;
> +       lt =3D devm_drm_bridge_alloc(dev, struct lt8912, bridge,
> +                                  &lt8912_bridge_funcs);
> +       if (IS_ERR(lt))
> +               return PTR_ERR(lt);
>
>         lt->dev =3D dev;
>         lt->i2c_client[0] =3D client;
> @@ -778,7 +779,6 @@ static int lt8912_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, lt);
>
> -       lt->bridge.funcs =3D &lt8912_bridge_funcs;
>         lt->bridge.of_node =3D dev->of_node;
>         lt->bridge.ops =3D (DRM_BRIDGE_OP_EDID |
>                           DRM_BRIDGE_OP_DETECT);
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/br=
idge/lontium-lt9211.c
> index 9b2dac9bd63c5afd4ffbafafdbbb1230549bc36f..399fa7eebd49cc3fe9e812517=
fc3e8ed25004086 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -727,9 +727,9 @@ static int lt9211_probe(struct i2c_client *client)
>         struct lt9211 *ctx;
>         int ret;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx =3D devm_drm_bridge_alloc(dev, struct lt9211, bridge, &lt9211=
_funcs);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ctx->dev =3D dev;
>
> @@ -755,7 +755,6 @@ static int lt9211_probe(struct i2c_client *client)
>         dev_set_drvdata(dev, ctx);
>         i2c_set_clientdata(client, ctx);
>
> -       ctx->bridge.funcs =3D &lt9211_funcs;
>         ctx->bridge.of_node =3D dev->of_node;
>         drm_bridge_add(&ctx->bridge);
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index a35a8b8ca89c2cc138a7cb4de01c796c6211d655..d6ee79c1e42771174ee01f174=
48f1a8fff70b63f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1072,9 +1072,10 @@ static int lt9611_probe(struct i2c_client *client)
>                 return -ENODEV;
>         }
>
> -       lt9611 =3D devm_kzalloc(dev, sizeof(*lt9611), GFP_KERNEL);
> -       if (!lt9611)
> -               return -ENOMEM;
> +       lt9611 =3D devm_drm_bridge_alloc(dev, struct lt9611, bridge,
> +                                      &lt9611_bridge_funcs);
> +       if (IS_ERR(lt9611))
> +               return PTR_ERR(lt9611);
>
>         lt9611->dev =3D dev;
>         lt9611->client =3D client;
> @@ -1127,7 +1128,6 @@ static int lt9611_probe(struct i2c_client *client)
>         /* Disable Audio InfoFrame, enabled by default */
>         regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO=
, 0);
>
> -       lt9611->bridge.funcs =3D &lt9611_bridge_funcs;
>         lt9611->bridge.of_node =3D client->dev.of_node;
>         lt9611->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID =
|
>                              DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge=
/lvds-codec.c
> index 1646e454e0b0b558d00f9421f15bb7084e2aa45a..e6a7147e141b64fc77dfef03a=
737ee599a0ecd10 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -118,9 +118,10 @@ static int lvds_codec_probe(struct platform_device *=
pdev)
>         u32 val;
>         int ret;
>
> -       lvds_codec =3D devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL)=
;
> -       if (!lvds_codec)
> -               return -ENOMEM;
> +       lvds_codec =3D devm_drm_bridge_alloc(dev, struct lvds_codec, brid=
ge,
> +                                          &funcs);
> +       if (IS_ERR(lvds_codec))
> +               return PTR_ERR(lvds_codec);
>
>         lvds_codec->dev =3D &pdev->dev;
>         lvds_codec->connector_type =3D (uintptr_t)of_device_get_match_dat=
a(dev);
> @@ -156,8 +157,6 @@ static int lvds_codec_probe(struct platform_device *p=
dev)
>         if (IS_ERR(lvds_codec->panel_bridge))
>                 return PTR_ERR(lvds_codec->panel_bridge);
>
> -       lvds_codec->bridge.funcs =3D &funcs;
> -
>         /*
>          * Decoder input LVDS format is a property of the decoder chip or=
 even
>          * its strapping. Handle data-mapping the same way lvds-panel doe=
s. In
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/br=
idge/microchip-lvds.c
> index 1d4ae0097df847d9f93c79eecff0c4587ae331ba..9f4ff82bc6b49010f8727da3b=
367f5a744a28edc 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -157,9 +157,10 @@ static int mchp_lvds_probe(struct platform_device *p=
dev)
>         if (!dev->of_node)
>                 return -ENODEV;
>
> -       lvds =3D devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> -       if (!lvds)
> -               return -ENOMEM;
> +       lvds =3D devm_drm_bridge_alloc(&pdev->dev, struct mchp_lvds, brid=
ge,
> +                                    &mchp_lvds_bridge_funcs);
> +       if (IS_ERR(lvds))
> +               return PTR_ERR(lvds);
>
>         lvds->dev =3D dev;
>
> @@ -192,7 +193,6 @@ static int mchp_lvds_probe(struct platform_device *pd=
ev)
>
>         lvds->bridge.of_node =3D dev->of_node;
>         lvds->bridge.type =3D DRM_MODE_CONNECTOR_LVDS;
> -       lvds->bridge.funcs =3D &mchp_lvds_bridge_funcs;
>
>         dev_set_drvdata(dev, lvds);
>         ret =3D devm_pm_runtime_enable(dev);
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nw=
l-dsi.c
> index 55912ae11f46a1d551e11f93a306a8a00ef3f7d8..2f7429b24fc20db104dec1718=
2f1119c6c75e600 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -1149,9 +1149,10 @@ static int nwl_dsi_probe(struct platform_device *p=
dev)
>         struct nwl_dsi *dsi;
>         int ret;
>
> -       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(dev, struct nwl_dsi, bridge,
> +                                   &nwl_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         dsi->dev =3D dev;
>
> @@ -1180,7 +1181,6 @@ static int nwl_dsi_probe(struct platform_device *pd=
ev)
>                 dsi->quirks =3D (uintptr_t)attr->data;
>
>         dsi->bridge.driver_private =3D dsi;
> -       dsi->bridge.funcs =3D &nwl_dsi_bridge_funcs;
>         dsi->bridge.of_node =3D dev->of_node;
>         dsi->bridge.timings =3D &nwl_dsi_timings;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bri=
dge/parade-ps8622.c
> index 8726fefc5c654e49bce029d943d241789ca4f802..f879a1df077d25d0c5121e51a=
a067f511a41a9bd 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -449,9 +449,10 @@ static int ps8622_probe(struct i2c_client *client)
>         struct drm_bridge *panel_bridge;
>         int ret;
>
> -       ps8622 =3D devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
> -       if (!ps8622)
> -               return -ENOMEM;
> +       ps8622 =3D devm_drm_bridge_alloc(dev, struct ps8622_bridge, bridg=
e,
> +                                      &ps8622_bridge_funcs);
> +       if (IS_ERR(ps8622))
> +               return PTR_ERR(ps8622);
>
>         panel_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>         if (IS_ERR(panel_bridge))
> @@ -509,7 +510,6 @@ static int ps8622_probe(struct i2c_client *client)
>                 ps8622->bl->props.brightness =3D PS8622_MAX_BRIGHTNESS;
>         }
>
> -       ps8622->bridge.funcs =3D &ps8622_bridge_funcs;
>         ps8622->bridge.type =3D DRM_MODE_CONNECTOR_LVDS;
>         ps8622->bridge.of_node =3D dev->of_node;
>         drm_bridge_add(&ps8622->bridge);
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 2422ff68c1042bd8eaa6821ff387d4faad47c550..825777a5758f67b5bdaa5f9de=
2e0e4f597f0f7a4 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -636,9 +636,10 @@ static int ps8640_probe(struct i2c_client *client)
>         int ret;
>         u32 i;
>
> -       ps_bridge =3D devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
> -       if (!ps_bridge)
> -               return -ENOMEM;
> +       ps_bridge =3D devm_drm_bridge_alloc(dev, struct ps8640, bridge,
> +                                         &ps8640_bridge_funcs);
> +       if (IS_ERR(ps_bridge))
> +               return PTR_ERR(ps_bridge);
>
>         mutex_init(&ps_bridge->aux_lock);
>
> @@ -662,7 +663,6 @@ static int ps8640_probe(struct i2c_client *client)
>         if (IS_ERR(ps_bridge->gpio_reset))
>                 return PTR_ERR(ps_bridge->gpio_reset);
>
> -       ps_bridge->bridge.funcs =3D &ps8640_bridge_funcs;
>         ps_bridge->bridge.of_node =3D dev->of_node;
>         ps_bridge->bridge.type =3D DRM_MODE_CONNECTOR_eDP;
>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/si=
i9234.c
> index cd7837c9a6e00b572a3fb65e5e0c9fa884555a73..bb1bed03eb5b7ae67f752c0d5=
93dc54131e9e370 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -888,9 +888,10 @@ static int sii9234_probe(struct i2c_client *client)
>         struct device *dev =3D &client->dev;
>         int ret;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx =3D devm_drm_bridge_alloc(dev, struct sii9234, bridge,
> +                                   &sii9234_bridge_funcs);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ctx->dev =3D dev;
>         mutex_init(&ctx->lock);
> @@ -921,7 +922,6 @@ static int sii9234_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, ctx);
>
> -       ctx->bridge.funcs =3D &sii9234_bridge_funcs;
>         ctx->bridge.of_node =3D dev->of_node;
>         drm_bridge_add(&ctx->bridge);
>
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridg=
e/sil-sii8620.c
> index 3af650dc92a1612ca88fe378319519546b79901f..9e48ad39e1cc995768d767c27=
b8116d7baa2f47e 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2291,9 +2291,10 @@ static int sii8620_probe(struct i2c_client *client=
)
>         struct sii8620 *ctx;
>         int ret;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx =3D devm_drm_bridge_alloc(dev, struct sii8620, bridge,
> +                                   &sii8620_bridge_funcs);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ctx->dev =3D dev;
>         mutex_init(&ctx->lock);
> @@ -2336,7 +2337,6 @@ static int sii8620_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, ctx);
>
> -       ctx->bridge.funcs =3D &sii8620_bridge_funcs;
>         ctx->bridge.of_node =3D dev->of_node;
>         drm_bridge_add(&ctx->bridge);
>
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bri=
dge/simple-bridge.c
> index 70db5b99e5bb84f099ec54cf62abbda53475311d..c66bd913e33ae311a98025134=
8199889ef5b99af 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -168,9 +168,10 @@ static int simple_bridge_probe(struct platform_devic=
e *pdev)
>         struct simple_bridge *sbridge;
>         struct device_node *remote;
>
> -       sbridge =3D devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL=
);
> -       if (!sbridge)
> -               return -ENOMEM;
> +       sbridge =3D devm_drm_bridge_alloc(&pdev->dev, struct simple_bridg=
e,
> +                                       bridge, &simple_bridge_bridge_fun=
cs);
> +       if (IS_ERR(sbridge))
> +               return PTR_ERR(sbridge);
>
>         sbridge->info =3D of_device_get_match_data(&pdev->dev);
>
> @@ -204,7 +205,6 @@ static int simple_bridge_probe(struct platform_device=
 *pdev)
>                                      "Unable to retrieve enable GPIO\n");
>
>         /* Register the bridge. */
> -       sbridge->bridge.funcs =3D &simple_bridge_bridge_funcs;
>         sbridge->bridge.of_node =3D pdev->dev.of_node;
>         sbridge->bridge.timings =3D sbridge->info->timings;
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..94dddaf49b3c1fa115f376e5c=
f1c2f515f2594ea 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform=
_device *pdev,
>                 return ERR_PTR(-ENODEV);
>         }
>
> -       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> -       if (!hdmi)
> -               return ERR_PTR(-ENOMEM);
> +       hdmi =3D devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
> +                                    &dw_hdmi_qp_bridge_funcs);
> +       if (IS_ERR(hdmi))
> +               return ERR_CAST(hdmi);
>
>         hdmi->dev =3D dev;
>
> @@ -1073,7 +1074,6 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_=
device *pdev,
>                 return ERR_PTR(ret);
>
>         hdmi->bridge.driver_private =3D hdmi;
> -       hdmi->bridge.funcs =3D &dw_hdmi_qp_bridge_funcs;
>         hdmi->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
>                            DRM_BRIDGE_OP_EDID |
>                            DRM_BRIDGE_OP_HDMI |
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index b08ada920a501d6a62f39581944a87019f5e5c15..c0dc0f2976b92f5a4eb2416de=
8f510ec7214e562 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -1194,9 +1194,10 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>         struct dw_mipi_dsi *dsi;
>         int ret;
>
> -       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return ERR_PTR(-ENOMEM);
> +       dsi =3D devm_drm_bridge_alloc(dev, struct dw_mipi_dsi, bridge,
> +                                   &dw_mipi_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return ERR_CAST(dsi);
>
>         dsi->dev =3D dev;
>         dsi->plat_data =3D plat_data;
> @@ -1265,7 +1266,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>         }
>
>         dsi->bridge.driver_private =3D dsi;
> -       dsi->bridge.funcs =3D &dw_mipi_dsi_bridge_funcs;
>         dsi->bridge.of_node =3D pdev->dev.of_node;
>
>         return dsi;
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu=
/drm/bridge/synopsys/dw-mipi-dsi2.c
> index c76f5f2e74d14bd372f969c6c7832aa57f80772b..fc91aca95d126ae37726ccd93=
9fdc8657151ca81 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> @@ -914,9 +914,10 @@ __dw_mipi_dsi2_probe(struct platform_device *pdev,
>         struct dw_mipi_dsi2 *dsi2;
>         int ret;
>
> -       dsi2 =3D devm_kzalloc(dev, sizeof(*dsi2), GFP_KERNEL);
> -       if (!dsi2)
> -               return ERR_PTR(-ENOMEM);
> +       dsi2 =3D devm_drm_bridge_alloc(dev, struct dw_mipi_dsi2, bridge,
> +                                    &dw_mipi_dsi2_bridge_funcs);
> +       if (IS_ERR(dsi2))
> +               return ERR_CAST(dsi2);
>
>         dsi2->dev =3D dev;
>         dsi2->plat_data =3D plat_data;
> @@ -981,7 +982,6 @@ __dw_mipi_dsi2_probe(struct platform_device *pdev,
>         }
>
>         dsi2->bridge.driver_private =3D dsi2;
> -       dsi2->bridge.funcs =3D &dw_mipi_dsi2_bridge_funcs;
>         dsi2->bridge.of_node =3D pdev->dev.of_node;
>
>         return dsi2;
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/t=
c358762.c
> index edf01476f2ef6e05ef2c144ff4467e7f6babc4c6..98df3e667d4aac48c19c82c8b=
c9e116b36a4cec8 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -265,9 +265,10 @@ static int tc358762_probe(struct mipi_dsi_device *ds=
i)
>         struct tc358762 *ctx;
>         int ret;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx =3D devm_drm_bridge_alloc(dev, struct tc358762, bridge,
> +                                   &tc358762_bridge_funcs);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         mipi_dsi_set_drvdata(dsi, ctx);
>
> @@ -288,7 +289,6 @@ static int tc358762_probe(struct mipi_dsi_device *dsi=
)
>         if (ret < 0)
>                 return ret;
>
> -       ctx->bridge.funcs =3D &tc358762_bridge_funcs;
>         ctx->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>         ctx->bridge.of_node =3D dev->of_node;
>         ctx->bridge.pre_enable_prev_first =3D true;
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/t=
c358764.c
> index 3f76c890fad9ffa50dc02f289a37378332830516..084e9d898e226ecfa618a3c91=
c0786d2f83fa51b 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -347,9 +347,10 @@ static int tc358764_probe(struct mipi_dsi_device *ds=
i)
>         struct tc358764 *ctx;
>         int ret;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(struct tc358764), GFP_KERNEL);
> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx =3D devm_drm_bridge_alloc(dev, struct tc358764, bridge,
> +                                   &tc358764_bridge_funcs);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         mipi_dsi_set_drvdata(dsi, ctx);
>
> @@ -368,7 +369,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi=
)
>         if (ret < 0)
>                 return ret;
>
> -       ctx->bridge.funcs =3D &tc358764_bridge_funcs;
>         ctx->bridge.of_node =3D dev->of_node;
>         ctx->bridge.pre_enable_prev_first =3D true;
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 063f217a17b6cf32e9793b8a96a5ac6128584098..fbdc44e162293f2f9b090bc95=
6604184a2a406b2 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -1287,9 +1287,10 @@ static int tc358768_i2c_probe(struct i2c_client *c=
lient)
>         if (!np)
>                 return -ENODEV;
>
> -       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -       if (!priv)
> -               return -ENOMEM;
> +       priv =3D devm_drm_bridge_alloc(dev, struct tc358768_priv, bridge,
> +                                    &tc358768_bridge_funcs);
> +       if (IS_ERR(priv))
> +               return PTR_ERR(priv);
>
>         dev_set_drvdata(dev, priv);
>         priv->dev =3D dev;
> @@ -1321,7 +1322,6 @@ static int tc358768_i2c_probe(struct i2c_client *cl=
ient)
>         priv->dsi_host.dev =3D dev;
>         priv->dsi_host.ops =3D &tc358768_dsi_host_ops;
>
> -       priv->bridge.funcs =3D &tc358768_bridge_funcs;
>         priv->bridge.timings =3D &default_tc358768_timings;
>         priv->bridge.of_node =3D np;
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/t=
c358775.c
> index 1b10e6ee1724ffb4bb8946f86d2f18e53428381a..366b12db0e7cbfb45b3dfc2a8=
3a7af580cfde41f 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -659,9 +659,10 @@ static int tc_probe(struct i2c_client *client)
>         struct tc_data *tc;
>         int ret;
>
> -       tc =3D devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> -       if (!tc)
> -               return -ENOMEM;
> +       tc =3D devm_drm_bridge_alloc(dev, struct tc_data, bridge,
> +                                  &tc_bridge_funcs);
> +       if (IS_ERR(tc))
> +               return PTR_ERR(tc);
>
>         tc->dev =3D dev;
>         tc->i2c =3D client;
> @@ -701,7 +702,6 @@ static int tc_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> -       tc->bridge.funcs =3D &tc_bridge_funcs;
>         tc->bridge.of_node =3D dev->of_node;
>         tc->bridge.pre_enable_prev_first =3D true;
>         drm_bridge_add(&tc->bridge);
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/brid=
ge/thc63lvd1024.c
> index e2fc78adebcf22f0d8cdb484078e37b748b776c6..2cb7cd0c060824256bbfa511f=
833cc00437d318b 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -181,9 +181,10 @@ static int thc63_probe(struct platform_device *pdev)
>         struct thc63_dev *thc63;
>         int ret;
>
> -       thc63 =3D devm_kzalloc(&pdev->dev, sizeof(*thc63), GFP_KERNEL);
> -       if (!thc63)
> -               return -ENOMEM;
> +       thc63 =3D devm_drm_bridge_alloc(&pdev->dev, struct thc63_dev, bri=
dge,
> +                                     &thc63_bridge_func);
> +       if (IS_ERR(thc63))
> +               return PTR_ERR(thc63);
>
>         thc63->dev =3D &pdev->dev;
>         platform_set_drvdata(pdev, thc63);
> @@ -208,7 +209,6 @@ static int thc63_probe(struct platform_device *pdev)
>
>         thc63->bridge.driver_private =3D thc63;
>         thc63->bridge.of_node =3D pdev->dev.of_node;
> -       thc63->bridge.funcs =3D &thc63_bridge_func;
>         thc63->bridge.timings =3D &thc63->timings;
>
>         drm_bridge_add(&thc63->bridge);
> diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridg=
e/ti-dlpc3433.c
> index 47638d1c96ec5ad999604c8c7e8839ff85936d98..b07f7c9d5890967a6db7bb01a=
9695abc809babbd 100644
> --- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
> +++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
> @@ -348,9 +348,10 @@ static int dlpc3433_probe(struct i2c_client *client)
>         struct dlpc *dlpc;
>         int ret;
>
> -       dlpc =3D devm_kzalloc(dev, sizeof(*dlpc), GFP_KERNEL);
> -       if (!dlpc)
> -               return -ENOMEM;
> +       dlpc =3D devm_drm_bridge_alloc(dev, struct dlpc, bridge,
> +                                    &dlpc_bridge_funcs);
> +       if (IS_ERR(dlpc))
> +               return PTR_ERR(dlpc);
>
>         dlpc->dev =3D dev;
>
> @@ -365,7 +366,6 @@ static int dlpc3433_probe(struct i2c_client *client)
>         dev_set_drvdata(dev, dlpc);
>         i2c_set_clientdata(client, dlpc);
>
> -       dlpc->bridge.funcs =3D &dlpc_bridge_funcs;
>         dlpc->bridge.of_node =3D dev->of_node;
>         drm_bridge_add(&dlpc->bridge);
>
> diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/=
ti-tdp158.c
> index cca75443f0121e39527a6cecf711eff2c0d507b5..27053d020df7c6fabbd5ce631=
b46c3f2358f12b2 100644
> --- a/drivers/gpu/drm/bridge/ti-tdp158.c
> +++ b/drivers/gpu/drm/bridge/ti-tdp158.c
> @@ -68,9 +68,10 @@ static int tdp158_probe(struct i2c_client *client)
>         struct tdp158 *tdp158;
>         struct device *dev =3D &client->dev;
>
> -       tdp158 =3D devm_kzalloc(dev, sizeof(*tdp158), GFP_KERNEL);
> -       if (!tdp158)
> -               return -ENOMEM;
> +       tdp158 =3D devm_drm_bridge_alloc(dev, struct tdp158, bridge,
> +                                      &tdp158_bridge_funcs);
> +       if (IS_ERR(tdp158))
> +               return PTR_ERR(tdp158);
>
>         tdp158->next =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>         if (IS_ERR(tdp158->next))
> @@ -89,7 +90,6 @@ static int tdp158_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(tdp158->enable), "enabl=
e");
>
>         tdp158->bridge.of_node =3D dev->of_node;
> -       tdp158->bridge.funcs =3D &tdp158_bridge_funcs;
>         tdp158->bridge.driver_private =3D tdp158;
>         tdp158->dev =3D dev;
>
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/=
ti-tfp410.c
> index e15d232ddbac55c6f5f966471a6c63f9c29a06c1..549e8e8edeb4f2f27d86a86fa=
0312e727380ecd9 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -341,14 +341,14 @@ static int tfp410_init(struct device *dev, bool i2c=
)
>                 return -ENXIO;
>         }
>
> -       dvi =3D devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
> -       if (!dvi)
> -               return -ENOMEM;
> +       dvi =3D devm_drm_bridge_alloc(dev, struct tfp410, bridge,
> +                                   &tfp410_bridge_funcs);
> +       if (IS_ERR(dvi))
> +               return PTR_ERR(dvi);
>
>         dvi->dev =3D dev;
>         dev_set_drvdata(dev, dvi);
>
> -       dvi->bridge.funcs =3D &tfp410_bridge_funcs;
>         dvi->bridge.of_node =3D dev->of_node;
>         dvi->bridge.timings =3D &dvi->timings;
>         dvi->bridge.type =3D DRM_MODE_CONNECTOR_DVID;
> diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/brid=
ge/ti-tpd12s015.c
> index 1c289051a5987e0aec4c286ef4c01ee1a2f9421f..0919364e80d1f69b95a99e76d=
aa915bee0b43d45 100644
> --- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
> +++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> @@ -116,13 +116,13 @@ static int tpd12s015_probe(struct platform_device *=
pdev)
>         struct gpio_desc *gpio;
>         int ret;
>
> -       tpd =3D devm_kzalloc(&pdev->dev, sizeof(*tpd), GFP_KERNEL);
> -       if (!tpd)
> -               return -ENOMEM;
> +       tpd =3D devm_drm_bridge_alloc(&pdev->dev, struct tpd12s015_device=
,
> +                                   bridge, &tpd12s015_bridge_funcs);
> +       if (IS_ERR(tpd))
> +               return PTR_ERR(tpd);
>
>         platform_set_drvdata(pdev, tpd);
>
> -       tpd->bridge.funcs =3D &tpd12s015_bridge_funcs;
>         tpd->bridge.of_node =3D pdev->dev.of_node;
>         tpd->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>         tpd->bridge.ops =3D DRM_BRIDGE_OP_DETECT;
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index b2408abb9d491bf25773d4dcc1be73c89cf208ce..bb80686a70e17dc79daa724b4=
4e781a81ce4de85 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2725,9 +2725,10 @@ static int mtk_dp_probe(struct platform_device *pd=
ev)
>         struct device *dev =3D &pdev->dev;
>         int ret;
>
> -       mtk_dp =3D devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
> -       if (!mtk_dp)
> -               return -ENOMEM;
> +       mtk_dp =3D devm_drm_bridge_alloc(dev, struct mtk_dp, bridge,
> +                                      &mtk_dp_bridge_funcs);
> +       if (IS_ERR(mtk_dp))
> +               return PTR_ERR(mtk_dp);
>
>         mtk_dp->dev =3D dev;
>         mtk_dp->data =3D (struct mtk_dp_data *)of_device_get_match_data(d=
ev);
> @@ -2785,7 +2786,6 @@ static int mtk_dp_probe(struct platform_device *pde=
v)
>         if (ret)
>                 return ret;
>
> -       mtk_dp->bridge.funcs =3D &mtk_dp_bridge_funcs;
>         mtk_dp->bridge.of_node =3D dev->of_node;
>         mtk_dp->bridge.type =3D mtk_dp->data->bridge_type;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 0f3b1ef8e497354edaf0a56e24660bf356fe01ac..9669bf4b80a14086159ae245e=
d51dd587b514bfb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1179,9 +1179,10 @@ static int mtk_dpi_probe(struct platform_device *p=
dev)
>         struct mtk_dpi *dpi;
>         int ret;
>
> -       dpi =3D devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
> -       if (!dpi)
> -               return -ENOMEM;
> +       dpi =3D devm_drm_bridge_alloc(dev, struct mtk_dpi, bridge,
> +                                   &mtk_dpi_bridge_funcs);
> +       if (IS_ERR(dpi))
> +               return PTR_ERR(dpi);
>
>         dpi->dev =3D dev;
>         dpi->conf =3D (struct mtk_dpi_conf *)of_device_get_match_data(dev=
);
> @@ -1233,7 +1234,6 @@ static int mtk_dpi_probe(struct platform_device *pd=
ev)
>
>         platform_set_drvdata(pdev, dpi);
>
> -       dpi->bridge.funcs =3D &mtk_dpi_bridge_funcs;
>         dpi->bridge.of_node =3D dev->of_node;
>         dpi->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 4fe1f38a3c4b7fcbbdbf7f6a82f66c9e2b546c02..d7726091819c4762698b41060=
b3d4d8d27940238 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1196,9 +1196,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>         int irq_num;
>         int ret;
>
> -       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
> +                                   &mtk_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         dsi->driver_data =3D of_device_get_match_data(dev);
>
> @@ -1246,7 +1247,6 @@ static int mtk_dsi_probe(struct platform_device *pd=
ev)
>
>         platform_set_drvdata(pdev, dsi);
>
> -       dsi->bridge.funcs =3D &mtk_dsi_bridge_funcs;
>         dsi->bridge.of_node =3D dev->of_node;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index c9d0c335c519d405d480ffdc2feaa5b847c0e1bb..76aecad116bad23384db438ee=
2649f5f0b31ae50 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1690,9 +1690,10 @@ static int mtk_hdmi_probe(struct platform_device *=
pdev)
>         struct device *dev =3D &pdev->dev;
>         int ret;
>
> -       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> -       if (!hdmi)
> -               return -ENOMEM;
> +       hdmi =3D devm_drm_bridge_alloc(dev, struct mtk_hdmi, bridge,
> +                                    &mtk_hdmi_bridge_funcs);
> +       if (IS_ERR(hdmi))
> +               return PTR_ERR(hdmi);
>
>         hdmi->dev =3D dev;
>         hdmi->conf =3D of_device_get_match_data(dev);
> @@ -1719,7 +1720,6 @@ static int mtk_hdmi_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to register audio driver\n")=
;
>
> -       hdmi->bridge.funcs =3D &mtk_hdmi_bridge_funcs;
>         hdmi->bridge.of_node =3D pdev->dev.of_node;
>         hdmi->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>                          | DRM_BRIDGE_OP_HPD;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm=
/meson/meson_encoder_cvbs.c
> index c9678dc68fa142882e2beb24fe81185fbdef733b..dc374bfc5951c0f13fc28f443=
25aa845ab590056 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -227,9 +227,12 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>         struct device_node *remote;
>         int ret;
>
> -       meson_encoder_cvbs =3D devm_kzalloc(priv->dev, sizeof(*meson_enco=
der_cvbs), GFP_KERNEL);
> -       if (!meson_encoder_cvbs)
> -               return -ENOMEM;
> +       meson_encoder_cvbs =3D devm_drm_bridge_alloc(priv->dev,
> +                                                  struct meson_encoder_c=
vbs,
> +                                                  bridge,
> +                                                  &meson_encoder_cvbs_br=
idge_funcs);
> +       if (IS_ERR(meson_encoder_cvbs))
> +               return PTR_ERR(meson_encoder_cvbs);
>
>         /* CVBS Connector Bridge */
>         remote =3D of_graph_get_remote_node(priv->dev->of_node, 0, 0);
> @@ -245,7 +248,6 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>                                      "Failed to find CVBS Connector bridg=
e\n");
>
>         /* CVBS Encoder Bridge */
> -       meson_encoder_cvbs->bridge.funcs =3D &meson_encoder_cvbs_bridge_f=
uncs;
>         meson_encoder_cvbs->bridge.of_node =3D priv->dev->of_node;
>         meson_encoder_cvbs->bridge.type =3D DRM_MODE_CONNECTOR_Composite;
>         meson_encoder_cvbs->bridge.ops =3D DRM_BRIDGE_OP_MODES;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/=
meson/meson_encoder_dsi.c
> index 3db518e5f95d324c218b730e0948c3dc845382bd..6c6624f9ba24a182900215d65=
b3ad7ab8aab6cf8 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -106,9 +106,12 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>         struct device_node *remote;
>         int ret;
>
> -       meson_encoder_dsi =3D devm_kzalloc(priv->dev, sizeof(*meson_encod=
er_dsi), GFP_KERNEL);
> -       if (!meson_encoder_dsi)
> -               return -ENOMEM;
> +       meson_encoder_dsi =3D devm_drm_bridge_alloc(priv->dev,
> +                                                 struct meson_encoder_ds=
i,
> +                                                 bridge,
> +                                                 &meson_encoder_dsi_brid=
ge_funcs);
> +       if (IS_ERR(meson_encoder_dsi))
> +               return PTR_ERR(meson_encoder_dsi);
>
>         /* DSI Transceiver Bridge */
>         remote =3D of_graph_get_remote_node(priv->dev->of_node, 2, 0);
> @@ -123,7 +126,6 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>                                      "Failed to find DSI transceiver brid=
ge\n");
>
>         /* DSI Encoder Bridge */
> -       meson_encoder_dsi->bridge.funcs =3D &meson_encoder_dsi_bridge_fun=
cs;
>         meson_encoder_dsi->bridge.of_node =3D priv->dev->of_node;
>         meson_encoder_dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm=
/meson/meson_encoder_hdmi.c
> index 040c04b5dff9f0d4e2875e344c076bb8ab635c76..5a0d37a257f53c22165fad1a3=
2e3c7522b8dd7f1 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -376,9 +376,12 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>         struct device_node *remote;
>         int ret;
>
> -       meson_encoder_hdmi =3D devm_kzalloc(priv->dev, sizeof(*meson_enco=
der_hdmi), GFP_KERNEL);
> -       if (!meson_encoder_hdmi)
> -               return -ENOMEM;
> +       meson_encoder_hdmi =3D devm_drm_bridge_alloc(priv->dev,
> +                                                  struct meson_encoder_h=
dmi,
> +                                                  bridge,
> +                                                  &meson_encoder_hdmi_br=
idge_funcs);
> +       if (IS_ERR(meson_encoder_hdmi))
> +               return PTR_ERR(meson_encoder_hdmi);
>
>         /* HDMI Transceiver Bridge */
>         remote =3D of_graph_get_remote_node(priv->dev->of_node, 1, 0);
> @@ -395,7 +398,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>         }
>
>         /* HDMI Encoder Bridge */
> -       meson_encoder_hdmi->bridge.funcs =3D &meson_encoder_hdmi_bridge_f=
uncs;
>         meson_encoder_hdmi->bridge.of_node =3D priv->dev->of_node;
>         meson_encoder_hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>         meson_encoder_hdmi->bridge.interlace_allowed =3D true;
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/dr=
m/renesas/rcar-du/rcar_lvds.c
> index a9145253294fcaef6bae4e1406a781f6d710d357..af58b814e5887f2e231338c1d=
87feedf4db5e754 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> @@ -878,9 +878,10 @@ static int rcar_lvds_probe(struct platform_device *p=
dev)
>         struct rcar_lvds *lvds;
>         int ret;
>
> -       lvds =3D devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> -       if (lvds =3D=3D NULL)
> -               return -ENOMEM;
> +       lvds =3D devm_drm_bridge_alloc(&pdev->dev, struct rcar_lvds, brid=
ge,
> +                                    &rcar_lvds_bridge_ops);
> +       if (IS_ERR(lvds))
> +               return PTR_ERR(lvds);
>
>         platform_set_drvdata(pdev, lvds);
>
> @@ -895,7 +896,6 @@ static int rcar_lvds_probe(struct platform_device *pd=
ev)
>         if (ret < 0)
>                 return ret;
>
> -       lvds->bridge.funcs =3D &rcar_lvds_bridge_ops;
>         lvds->bridge.of_node =3D pdev->dev.of_node;
>
>         lvds->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index dc6ab012cdb69f92a33da69638aef3fc6fdfa46c..8ba0dde8d4822794426315931=
3e184e581d9cb58 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -701,9 +701,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
ce *pdev)
>         u32 txsetr;
>         int ret;
>
> -       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct rzg2l_mipi_dsi, =
bridge,
> +                                   &rzg2l_mipi_dsi_bridge_ops);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         platform_set_drvdata(pdev, dsi);
>         dsi->dev =3D &pdev->dev;
> @@ -761,7 +762,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>         pm_runtime_put(dsi->dev);
>
>         /* Initialize the DRM bridge. */
> -       dsi->bridge.funcs =3D &rzg2l_mipi_dsi_bridge_ops;
>         dsi->bridge.of_node =3D dsi->dev->of_node;
>
>         /* Init host device */
>
> --
> 2.49.0
>
