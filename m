Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709209FE5E0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95510E131;
	Mon, 30 Dec 2024 12:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M4fzWxJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8777A10E131
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:38:34 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso155251966b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735562253; x=1736167053; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=;
 b=M4fzWxJjINloMA+Q9JFscQE6XG8173gTaldcpoguTwYD7sS8dh9FLv2E9R0MVPwHlV
 xjudULHB3aYzzmTZ/2j3yme43wJOpaN5i1Cw6/4VFSwC39g0ITZgXeoG40c9wqRyflYK
 1vqME482B+2EBdXDCvzFagLfFBMxVFXUpBt7uf7fUitFRgI54ZBC7j2LhQUc7TJAC4WG
 DSjSjTNM1RX/nWs80PMSJU58IhkMWHwVVKmWnMCArF4h/VeaBRk8PG1n3rVKXyZFckfG
 ZJBiNU+3C07o4mBFwnOQJBuE6DeTqsmxCzBW9QypdidCNAfvL00rBCXZIU7hRIy148rT
 NgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735562253; x=1736167053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=;
 b=Z3NQrSuUiR7G7MzzvQ8nPmLD/f+eJvmlJGW5ttLD3MnW0GKuFeggeBQNBJzXmI6ip8
 zdzpclG9+xfpki61bSmE6qXGj6la54GdyuHrfP+NARhDaS5GohIx6xvhx7HZ5oiDigfB
 FNsgBuU2fBvqDgLvfzH1T3VuEDimvxU5E8JcW4AK0dnMgObiopjTnHLjDFHZTA7pt5Co
 wxwq9aNVk6TU8HtN7t68mdWiFrVc6jyLULZCxtai4VaL5HvdEuw6EdOYTmJte0a8tZrN
 qoND9HT3D/pjAfsldNENx1Jz8rohxqIzwyqOpyAwM1jnN1jFHRYOkYmJioHMY05pa8N+
 SPIQ==
X-Gm-Message-State: AOJu0YyojcUaTHZ0Y2jngsnf27S8ic1n7oqVQ8FSGyC3W8LiTyXAiKc9
 ewzGInzvz+UNfxz3riYFFrDP85IfVRuJH1/rblySno9sUJb/9NwRdUMNMW+kv2PPzCcRAfLbsY3
 K
X-Gm-Gg: ASbGncvT0Zx7heKxBDgmgS/malVPx7lTiK/5g9zcoHbmVmN1mVxyHLDIcJQwc6OvatM
 wdcvOLweS4bTKiUk1YlHqs3LPgoJCgbTHd2yBhkoTzYvCCWZkIR5l8RWtnuuSuxxo/+gYuobkdI
 Uj/Av66tST8o6Qsf0Qi3vN+eZkTmNIM86RXJjmvVPviTpOl/i8uaeTgRdNBE3rTwuEWtwkX3mOD
 o/MeQSHQ3e/jCFsv8gd1Y3nIbtkp/O/57ptB3xb8Lh1IJVvVYVikOTn40KQYsUTvoYkGDVCzKQq
 fOIdmcPZLf3ylfohehYU5lu1ezjjC61b1P7x
X-Google-Smtp-Source: AGHT+IHnMCZF1zu8nJTtjEUT7Ed/kcm++NEx7SYSKZGed7mcIjxQVIqgMQ+VgW8ijFMQzuCRlvCpHQ==
X-Received: by 2002:a05:651c:2229:b0:2ff:a7c1:8c55 with SMTP id
 38308e7fff4ca-304685f51f9mr159543341fa.28.1735561859482; 
 Mon, 30 Dec 2024 04:30:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b069ef9sm34662771fa.91.2024.12.30.04.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:30:59 -0800 (PST)
Date: Mon, 30 Dec 2024 14:30:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v8 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <ircgfhci3wmpahpxflmsbsxpahafqj6y5v56llezazaarbzppf@njzxhahie7xx>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-11-victor.liu@nxp.com>
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

On Mon, Dec 30, 2024 at 10:11:58AM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> drivers are components to be aggregated by a master registered in
> the upcoming DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * Get CF/ED/FL/FW/LB device instance numbers through register start addresses
>   of the devices, instead of compatible strings. (Dmitry)
> * s/shdld/shdload/ for ED IRQs. (Dmitry)
> * Add dc_pe_post_bind(), to avoid dependency on the component helper's way of
>   implementing component binding order. (Dmitry)
> * Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel(). (Dmitry)
> * Drop lb_links[] and dc_fetchunit_all_fracs[] arrays. (Dmitry)
> 
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>   (kernel test robot)
> 
> v5:
> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
> * Fix commit message to state that pixel engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>   stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> 
>  drivers/gpu/drm/imx/dc/Makefile |   3 +-
>  drivers/gpu/drm/imx/dc/dc-cf.c  | 172 +++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |   6 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |  22 +++
>  drivers/gpu/drm/imx/dc/dc-ed.c  | 288 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fl.c  | 185 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.c  | 258 +++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.h  | 129 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fw.c  | 222 ++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-lb.c  | 325 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.c  | 158 ++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.h  | 101 ++++++++++
>  12 files changed, 1868 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
