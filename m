Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED48BE2D1
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B211F10F48D;
	Tue,  7 May 2024 12:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EIfa3BFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32C610F48D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 582466175A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DB9C4DDE0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715086733;
 bh=+hGg4qJDHV0B5+Y62ZMujf1YD6LV4XIoRUVLjY5kbsc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EIfa3BFzDTxGczLQ4qb1a96ang/r1jtgT5FplzImnP0KsP1TRT/nm1b8/ZLAwwQZo
 0UOM78jL/zRasAzjUzsmktrhJp2eiNnJHtIg67xSqA/HUW8IaZnmK5cNyOM7eXgBNc
 xFRen+/2D4Zl9wEes2MiaFQ/kKNac9L9+tPLwVn6UXCT+XRa6QY8VrB1RCSTzxg7fR
 NHUl3ynjz4BP1rkexDt1CFBLA11tImG4iaID7dAUAqg2EWiJpanol/WpjyP5j7HjFu
 ix4GwfyMHW8BTnNMQIlXZSFM63lbOMLcEuLg2l+Qxg8Awd9oYj0fGaDEe4/psXk6e3
 nahqA2rZjq5Dw==
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-de46b113a5dso3169591276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 05:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUwVKZoNxObp8qFFeG0SllktDx8DcYfJ2qP3qEOFnxCRsM9MylYtd0tkD0qdI+H3dosfnOF0Api0y/7NkMXKRUb2+IWe9EV0EMFCT+MoVne
X-Gm-Message-State: AOJu0Yyh8CpWxBdBebvsna2knkPYBe0PlTzVzHV7ADDEnT3omIY6g0iM
 toDEyPHJJRSYLINM/vFV+hulfZIwLQk/kMxvCWsg1F0edYoAaNMY/LGiy3cFBhIP9Rm4YDs6Waq
 tF6GY400lyLLJT+wjJ6CeWZVK83PLG/lUR/2WJA==
X-Google-Smtp-Source: AGHT+IGQ2BfLofpB2AbRmieIGAXSi684XtRW+H0VYOvLNhCMBmRejOoJpoRwFu6oTub3kA5Aplxvy0YO49unxPveVlc=
X-Received: by 2002:a25:dc8e:0:b0:dda:a550:4e92 with SMTP id
 y136-20020a25dc8e000000b00ddaa5504e92mr13570401ybe.46.1715086733004; Tue, 07
 May 2024 05:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-6-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-6-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:58:42 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7uwn_TsVU5be6S=hnLyRCCBCaGPtLYYSkkfjV7v9GFYw@mail.gmail.com>
Message-ID: <CAN6tsi7uwn_TsVU5be6S=hnLyRCCBCaGPtLYYSkkfjV7v9GFYw@mail.gmail.com>
Subject: Re: [PATCH 05/14] drm/bridge: analogix_dp: remove unused
 analogix_dp_remove
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
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

On Fri, May 3, 2024 at 5:13=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Now that the clock is handled dynamically through
> analogix_dp_resume/suspend and it isn't statically enabled in the
> driver probe routine, there is no need for the remove function anymore.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 3 ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 9 +--------
>  include/drm/bridge/analogix_dp.h                   | 1 -
>  4 files changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9e3308257586..9f1dfa6f2175 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1813,11 +1813,6 @@ void analogix_dp_unbind(struct analogix_dp_device =
*dp)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>
> -void analogix_dp_remove(struct analogix_dp_device *dp)
> -{
> -}
> -EXPORT_SYMBOL_GPL(analogix_dp_remove);
> -
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
>         struct analogix_dp_device *dp =3D to_dp(connector);
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 30c8750187ad..097f8c4617de 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -251,10 +251,7 @@ static int exynos_dp_probe(struct platform_device *p=
dev)
>
>  static void exynos_dp_remove(struct platform_device *pdev)
>  {
> -       struct exynos_dp_device *dp =3D platform_get_drvdata(pdev);
> -
>         component_del(&pdev->dev, &exynos_dp_ops);
> -       analogix_dp_remove(dp->adp);
>  }
>
>  static int exynos_dp_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 8214265f1497..362c7951ca4a 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -414,21 +414,14 @@ static int rockchip_dp_probe(struct platform_device=
 *pdev)
>
>         ret =3D component_add(dev, &rockchip_dp_component_ops);
>         if (ret)
> -               goto err_dp_remove;
> +               return ret;
>
>         return 0;
> -
> -err_dp_remove:
> -       analogix_dp_remove(dp->adp);
> -       return ret;
>  }
>
>  static void rockchip_dp_remove(struct platform_device *pdev)
>  {
> -       struct rockchip_dp_device *dp =3D platform_get_drvdata(pdev);
> -
>         component_del(&pdev->dev, &rockchip_dp_component_ops);
> -       analogix_dp_remove(dp->adp);
>  }
>
>  static int rockchip_dp_suspend(struct device *dev)
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index 8709b6a74c0f..6002c5666031 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -44,7 +44,6 @@ struct analogix_dp_device *
>  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat=
_data);
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *d=
rm_dev);
>  void analogix_dp_unbind(struct analogix_dp_device *dp);
> -void analogix_dp_remove(struct analogix_dp_device *dp);
>
>  int analogix_dp_start_crc(struct drm_connector *connector);
>  int analogix_dp_stop_crc(struct drm_connector *connector);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
