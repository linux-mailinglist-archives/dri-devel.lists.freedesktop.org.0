Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F809F23C0
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468B910E0A2;
	Sun, 15 Dec 2024 12:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kEzEYrBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711BC10E0A2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 12:35:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33BED99F;
 Sun, 15 Dec 2024 13:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734266086;
 bh=Cw/4s1cnTdpvoGxzO73Vu8Phx08ECrq4JjmSBktXtWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kEzEYrBMorH93mkgbR+HewocUmhkfsj0+NKNtW2wApjmoIa3La8TUteD2Xg3zn41G
 R1vGtMwcVFHG04u72DKfaj0+Qc+uc9IzFiaY7dgsILW4Vk0yCY+UTY0TuwGeW3A8ga
 AyKSuaNrfjpqc/H2Uo2OpPePoj274C3Kd07j6yKA=
Date: Sun, 15 Dec 2024 14:35:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i2c: tda998x: drop support for platform_data
Message-ID: <20241215123505.GA25852@pendragon.ideasonboard.com>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-1-7817122b1d73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241215-drm-move-tda998x-v1-1-7817122b1d73@linaro.org>
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

Hi Dmitry,

Thank you for the patch.

On Sun, Dec 15, 2024 at 01:09:07PM +0200, Dmitry Baryshkov wrote:
> After the commit 0fb2970b4b6b ("drm/armada: remove non-component
> support") there are no remaining users of the struct
> tda998x_encoder_params. Drop the header and corresponding API from the
> TDA998x driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS                       |  1 -
>  drivers/gpu/drm/i2c/tda998x_drv.c | 49 ++++-----------------------------------
>  include/drm/i2c/tda998x.h         | 40 --------------------------------
>  3 files changed, 4 insertions(+), 86 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81348dbce8ca7c877bd9c2d88cb093368eca5a0a..9a23e80abf309cbd918a74683895f8dbe0507a6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16983,7 +16983,6 @@ S:	Maintained
>  T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
>  T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
>  F:	drivers/gpu/drm/i2c/tda998x_drv.c
> -F:	include/drm/i2c/tda998x.h
>  F:	include/dt-bindings/display/tda998x.h
>  K:	"nxp,tda998x"
>  
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 2160f05bbd16d2346e27365e5549b75ad26fdcb9..67480dcbbfde4da68ffaeaf20935af467d4da92a 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -21,10 +21,11 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> -#include <drm/i2c/tda998x.h>
>  
>  #include <media/cec-notifier.h>
>  
> +#include <dt-bindings/display/tda998x.h>
> +
>  #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
>  
>  enum {
> @@ -1717,10 +1718,10 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
>  		u8 ena_ap = be32_to_cpup(&port_data[2*i+1]);
>  
>  		switch (afmt) {
> -		case AFMT_I2S:
> +		case TDA998x_I2S:
>  			route = AUDIO_ROUTE_I2S;
>  			break;
> -		case AFMT_SPDIF:
> +		case TDA998x_SPDIF:
>  			route = AUDIO_ROUTE_SPDIF;
>  			break;
>  		default:
> @@ -1746,44 +1747,6 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
>  	return 0;
>  }
>  
> -static int tda998x_set_config(struct tda998x_priv *priv,
> -			      const struct tda998x_encoder_params *p)
> -{
> -	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(p->swap_a) |
> -			    (p->mirr_a ? VIP_CNTRL_0_MIRR_A : 0) |
> -			    VIP_CNTRL_0_SWAP_B(p->swap_b) |
> -			    (p->mirr_b ? VIP_CNTRL_0_MIRR_B : 0);
> -	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(p->swap_c) |
> -			    (p->mirr_c ? VIP_CNTRL_1_MIRR_C : 0) |
> -			    VIP_CNTRL_1_SWAP_D(p->swap_d) |
> -			    (p->mirr_d ? VIP_CNTRL_1_MIRR_D : 0);
> -	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(p->swap_e) |
> -			    (p->mirr_e ? VIP_CNTRL_2_MIRR_E : 0) |
> -			    VIP_CNTRL_2_SWAP_F(p->swap_f) |
> -			    (p->mirr_f ? VIP_CNTRL_2_MIRR_F : 0);
> -
> -	if (p->audio_params.format != AFMT_UNUSED) {
> -		unsigned int ratio, route;
> -		bool spdif = p->audio_params.format == AFMT_SPDIF;
> -
> -		route = AUDIO_ROUTE_I2S + spdif;
> -
> -		priv->audio.route = &tda998x_audio_route[route];
> -		priv->audio.cea = p->audio_params.cea;
> -		priv->audio.sample_rate = p->audio_params.sample_rate;
> -		memcpy(priv->audio.status, p->audio_params.status,
> -		       min(sizeof(priv->audio.status),
> -			   sizeof(p->audio_params.status)));
> -		priv->audio.ena_ap = p->audio_params.config;
> -		priv->audio.i2s_format = I2S_FORMAT_PHILIPS;
> -
> -		ratio = spdif ? 64 : p->audio_params.sample_width * 2;
> -		return tda998x_derive_cts_n(priv, &priv->audio, ratio);
> -	}
> -
> -	return 0;
> -}
> -
>  static void tda998x_destroy(struct device *dev)
>  {
>  	struct tda998x_priv *priv = dev_get_drvdata(dev);
> @@ -1982,10 +1945,6 @@ static int tda998x_create(struct device *dev)
>  		if (priv->audio_port_enable[AUDIO_ROUTE_I2S] ||
>  		    priv->audio_port_enable[AUDIO_ROUTE_SPDIF])
>  			tda998x_audio_codec_init(priv, &client->dev);
> -	} else if (dev->platform_data) {
> -		ret = tda998x_set_config(priv, dev->platform_data);
> -		if (ret)
> -			goto fail;
>  	}
>  
>  	priv->bridge.funcs = &tda998x_bridge_funcs;
> diff --git a/include/drm/i2c/tda998x.h b/include/drm/i2c/tda998x.h
> deleted file mode 100644
> index 3cb25ccbe5e68bf95ce13249f15549b7e2582281..0000000000000000000000000000000000000000
> --- a/include/drm/i2c/tda998x.h
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __DRM_I2C_TDA998X_H__
> -#define __DRM_I2C_TDA998X_H__
> -
> -#include <linux/hdmi.h>
> -#include <dt-bindings/display/tda998x.h>
> -
> -enum {
> -	AFMT_UNUSED =	0,
> -	AFMT_SPDIF =	TDA998x_SPDIF,
> -	AFMT_I2S =	TDA998x_I2S,
> -};
> -
> -struct tda998x_audio_params {
> -	u8 config;
> -	u8 format;
> -	unsigned sample_width;
> -	unsigned sample_rate;
> -	struct hdmi_audio_infoframe cea;
> -	u8 status[5];
> -};
> -
> -struct tda998x_encoder_params {
> -	u8 swap_b:3;
> -	u8 mirr_b:1;
> -	u8 swap_a:3;
> -	u8 mirr_a:1;
> -	u8 swap_d:3;
> -	u8 mirr_d:1;
> -	u8 swap_c:3;
> -	u8 mirr_c:1;
> -	u8 swap_f:3;
> -	u8 mirr_f:1;
> -	u8 swap_e:3;
> -	u8 mirr_e:1;
> -
> -	struct tda998x_audio_params audio_params;
> -};
> -
> -#endif

-- 
Regards,

Laurent Pinchart
