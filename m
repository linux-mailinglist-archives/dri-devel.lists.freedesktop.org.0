Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48216A9F4DC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 17:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED86D10E5B7;
	Mon, 28 Apr 2025 15:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CqPkcvUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF03910E5B6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 15:45:25 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6fda22908d9so37277677b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1745855125; x=1746459925;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
 b=CqPkcvUKAMslTCDK6F6MAsHYGkpy7KFr9MxVWAErQnKsmkDPNO69rAncYXCIwAn3BW
 bZYU/t15pVMWmDu4spd4w/wlgQ+lBTD0Nautpdm/OcCkoqnmtqpDgF4Q3zhtvrdL0cx9
 XhTEvBCGHFVAd230Xck0tWQUhqRzBwAxYAxs1Qmj6vP8vWSjs9XMJt5EM2gOvmfV5Mx6
 4YkXSXsev/1hpLq77mcQVxzHc2lQhPpDSrhaX/xc5c6qemn/Ucsqf82FU+BGvtGGvcft
 mcwN7hj0jBxc3VZ67spzMNOoOwYI68ogVlRLbZcW20hBx2trP+io+g/cQt6HXYXvbiMo
 Usow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745855125; x=1746459925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
 b=OsIiZk5SSRLlw8NAPeVOxktmNu4bzNHMNg81lmaNCwowcooz89E08KtiJVlvPOOUv+
 /AwDqmjW6s8UMXG2WiHw3H29jve32JAHM8c+G7n4CqWQrJTK8MbTacsqd6nm+z931l73
 K0oxHQqELBhmGo6ds6xpYrn2sA5i0npT5kqek1IYvSfXS4BtXl4u0ieszehxCoyp1z//
 7dxk9WCKWHZbd+8Rep7TdZJvN8OC2lmJ/lQOurgUwmX2uENYEmjjxaYK8AraDlZ1bc1k
 9Dmq6X30El0eiSV/QlR9etOlRzNjm4w559UP4up2THfAQTiWb1kGDHCuhThmn//9V6hF
 Akug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0DgdXDAHLYPE5P9tjRilmy7MQZj4EaquxZylwdEz/QKzEf1/BZ6mgYVxOgsoTQXy1T5zeUQDePwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC4ei401Swf+HRYjlia0bYjrt5gJ33BWX9UKxCJcZhFBMeFfR0
 c9NiYyRVlaBfIUHAmTI3qVXbowR+a+GiufL8xR/u+Pete2LAqJmghXsfjGd097rUqHvYeehR7u7
 tSy9pQnJ5/Uo3rADRYQuZ4mLgbUhD6c5xqjYM4w==
X-Gm-Gg: ASbGncuOBGtG3yzylWqja7h6sTiV2WU9ruajKhOqoYmrU92wslOAqEcL+TUYIuSNBKw
 YZmRkHp86dX9LGjPrrotectCPgfH3zy4oqYZ/OjycxdEQWvRALg/t9GIlBgiSyZSzyjb+ehVHvX
 +pB4Yd6UB41XzRPS5ESvP1sgb7H3Fo4/3x6W13SNGbiRVqVbKY1uELcXK3EYazSKQ=
X-Google-Smtp-Source: AGHT+IEF9MSlc844cuGTIRN/jaSQKExcmjeU1UeJwf54mw2x30vI+iBpqqWrdgOqbrjU+FD8mBfkUxmgGRAbgf2Y+6M=
X-Received: by 2002:a05:6902:2701:b0:e72:d88e:7a9a with SMTP id
 3f1490d57ef6-e73500e777emr136870276.45.1745855124717; Mon, 28 Apr 2025
 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 16:45:08 +0100
X-Gm-Features: ATxdqUF8zRJ18UCRRqpYogjOFDok1I-AvafpDPPJcxH-STXodhofR9H1CLM8tQg
Message-ID: <CAPY8ntDwK0DZ6sThryDRBUgjTb+muNHtRNp+LohTs6+FWeB5TQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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

On Thu, 24 Apr 2025 at 20:01, Luca Ceresoli <luca.ceresoli@bootlin.com> wro=
te:
>
> This is the new API for allocating DRM bridges.
>
> This driver already implements refcounting of the struct vc4_dsi, which
> embeds struct drm_bridge. Now this is a duplicate of the refcounting
> implemented by the DRM bridge core, so convert the vc4_dsi_get/put() call=
s
> into drm_bridge_get/put() calls and get rid of the driver-specific
> refcounting implementation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks.

> ---
>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> Changed in v2:
> - fix error code checking
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 34 +++++-----------------------------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index efc6f6078b026764c59cfb2a33b28a88b7018c3a..458e5d9879645f18bcbcaeeb7=
1b5f1038f9581da 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -552,8 +552,6 @@ struct vc4_dsi {
>         struct vc4_encoder encoder;
>         struct mipi_dsi_host dsi_host;
>
> -       struct kref kref;
> -
>         struct platform_device *pdev;
>
>         struct drm_bridge *out_bridge;
> @@ -1622,29 +1620,11 @@ static void vc4_dsi_dma_chan_release(void *ptr)
>         dsi->reg_dma_chan =3D NULL;
>  }
>
> -static void vc4_dsi_release(struct kref *kref)
> -{
> -       struct vc4_dsi *dsi =3D
> -               container_of(kref, struct vc4_dsi, kref);
> -
> -       kfree(dsi);
> -}
> -
> -static void vc4_dsi_get(struct vc4_dsi *dsi)
> -{
> -       kref_get(&dsi->kref);
> -}
> -
> -static void vc4_dsi_put(struct vc4_dsi *dsi)
> -{
> -       kref_put(&dsi->kref, &vc4_dsi_release);
> -}
> -
>  static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
>  {
>         struct vc4_dsi *dsi =3D ptr;
>
> -       vc4_dsi_put(dsi);
> +       drm_bridge_put(&dsi->bridge);
>  }
>
>  static int vc4_dsi_bind(struct device *dev, struct device *master, void =
*data)
> @@ -1655,7 +1635,7 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
>         struct drm_encoder *encoder =3D &dsi->encoder.base;
>         int ret;
>
> -       vc4_dsi_get(dsi);
> +       drm_bridge_get(&dsi->bridge);
>
>         ret =3D drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi=
);
>         if (ret)
> @@ -1810,15 +1790,12 @@ static int vc4_dsi_dev_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct vc4_dsi *dsi;
>
> -       dsi =3D kzalloc(sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge,=
 &vc4_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>         dev_set_drvdata(dev, dsi);
>
> -       kref_init(&dsi->kref);
> -
>         dsi->pdev =3D pdev;
> -       dsi->bridge.funcs =3D &vc4_dsi_bridge_funcs;
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node =3D dev->of_node;
>  #endif
> @@ -1836,7 +1813,6 @@ static void vc4_dsi_dev_remove(struct platform_devi=
ce *pdev)
>         struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
>
>         mipi_dsi_host_unregister(&dsi->dsi_host);
> -       vc4_dsi_put(dsi);
>  }
>
>  struct platform_driver vc4_dsi_driver =3D {
>
> --
> 2.49.0
>
