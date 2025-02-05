Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E90A282C3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 04:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2644A10E729;
	Wed,  5 Feb 2025 03:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FE6ZffZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFF710E729
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 03:19:48 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401be44b58so6729221e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 19:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738725586; x=1739330386; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cbkbGS95q8+bWdGiDPErm44A724Ht0geUTiMi7tCq8w=;
 b=FE6ZffZDVACLKTfqMWV7g2w2QihyMW6v/GypGSfnbXiORfxYBSIVUQkSO0TaOqvcAT
 K9D8kTbiC0P0KAeGh2BRakXESrw3EVEphHP/0XiMY2Ehuq2tQ9/tIUKlQJt+LVaSa8OB
 2ayv5RVw/YWPA2pj93Orih5o+pIT2IWD4PYJnwYUO865F9DLauE1hClu4WfAUtaNtfat
 JrltgPQa6VdpI07gmz6jQLZkjNYxLn64tvJbvO4m9/68xhe9VYClZDuSGdKQCy7aRU0p
 lpB1jA4lZ26o1VVNlt89pG6wuNwp0AaatiEn5KaVFfZeYLyJYpg4sVf7Ap0vXo3JDqUh
 Y3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738725586; x=1739330386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbkbGS95q8+bWdGiDPErm44A724Ht0geUTiMi7tCq8w=;
 b=bYvfQ7Ll7/FWDPuF3dAh+FdmQSBa4zSGw9SY3CYObp8xr0pLyOa3xiRGil+zdTLqoA
 oOAlVHP2P6KyF97sQL4Jh5YY8KVTwXj/rGsqQTTmC5h5gbZqe3vkoJk//y0NqpCOUIfy
 jMMC3YZeGmWZhms6pNYzib9shnGdl+REuMGwoimpwsgQtr+E9NZtB+P5bNlPCN7KuD5U
 WbvG3KM9fIKy+UUyX6d35k77ng3a5XwTSuYgg8wYc/QqkcgHKA8UELz6BMeSzB1Sp/pi
 n2STlQaDG3pQRDXQlo9Peusd3A031XPXQCAGuoGtW8N/J7+Ufwvd90rXTg9lORhissc4
 Q9pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVF+ATPASAUzLKO0QT/nm0CYMqZhll/wbogngMQi09bMX5czaYbklWhPfvCQ3lnWJjeAB9QUnLqvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1aLbw0K41cBNM+Dz7QmVPc3JUmJktljyykqBuKpIGVBj1OYs2
 oOtMH37iC/3XaZLKCLxM1x7FtjswHx7h5NOfax3uvfAB1FS4u3jyrVCF7rJKC/c=
X-Gm-Gg: ASbGncveF8PiBMEI0pLyafWdCwRlEziC/c0vC+b0wpSjSZFtZ/aA3fSY3Gxpu7a2QPq
 bWPmsO0R9N+du9kPLDfNmh7oQFfPxY8/qRZ2GenYb4/yv3xhGQdhQ2pCkZhooNNfNNbyamNpDWS
 xjVzAObcGREMIUeM+Fv1yxfWdmrKcWq9heHDpN0kghe/xqBcS65sZGJ0axd2qRBA4aWC9RBoa2G
 tfdhkJBdnGc+4B3ziavGPGTjqwb9tjBD63A35CtzZYOKIwURMOXg7D0E8jEo+BA0409bu4n1lDU
 7mwJqKF3JnTsr2/Aega5FFE6CRm+Msra7csWv6+08OsdLRjHOmzzXnzWvq5rjSkJoR2MAr0=
X-Google-Smtp-Source: AGHT+IFQaxEYR8WTMaL8TfzTtKZBrxzwSEhBdjR8KdYYZRdGHPczYQQAvfnIGP5de9L+IAXEp2+hOw==
X-Received: by 2002:a2e:a551:0:b0:302:3ff6:c8c6 with SMTP id
 38308e7fff4ca-307cf388cf4mr3014021fa.33.1738725586220; 
 Tue, 04 Feb 2025 19:19:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a306a325sm20306381fa.13.2025.02.04.19.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 19:19:44 -0800 (PST)
Date: Wed, 5 Feb 2025 05:19:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/35] drm/bridge: Pass full state to atomic_disable
Message-ID: <eaojxhsfvm6m4tz7px4dttmak3w5avn7kkuq4xrotfiftysjtl@dgso5zknraeh>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-4-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-4-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:32PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_disable hook prototype to pass
> it directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |  6 ++----
>  drivers/gpu/drm/bridge/analogix/anx7625.c           |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  2 +-
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  2 +-
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  2 +-
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 +++-----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  5 ++---
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  2 +-
>  drivers/gpu/drm/bridge/ite-it66121.c                |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  5 ++---
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  5 ++---
>  drivers/gpu/drm/bridge/panel.c                      |  3 +--
>  drivers/gpu/drm/bridge/samsung-dsim.c               |  2 +-
>  drivers/gpu/drm/bridge/sii902x.c                    |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  2 +-
>  drivers/gpu/drm/bridge/tc358767.c                   | 10 ++++------
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  3 ++-
>  drivers/gpu/drm/drm_bridge.c                        | 10 +---------
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  2 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          |  2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           |  2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                 |  2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                     |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_drm.h                     |  2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                 |  2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                 |  2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     |  2 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  2 +-
>  drivers/gpu/drm/stm/lvds.c                          |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                       |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                    |  4 +++-
>  include/drm/drm_bridge.h                            |  2 +-
>  45 files changed, 63 insertions(+), 83 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
