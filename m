Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E826DA2B994
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6787010EA0E;
	Fri,  7 Feb 2025 03:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jR8TdUtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33CA10EA0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:17:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5440d5aae5cso1752455e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 19:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738898266; x=1739503066; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=;
 b=jR8TdUtVMiYs2aqlzL2LcZmPyXtoHC7wtnYeA4XZ3ykzeTACJHaLBbrNhshpIu14cx
 6cWS2sNsyK0OKCuSp11ywXKvnsJ4BnPSuOmj2KgzlQYuGw2EvuzwUgkXloZpPz3oL0fx
 MB+of9yanUvRJ9ZKm5F/LhR3hEudUx29ZQyJdR6s1tRVoxvZ5JJrDm/ZpPz0NXpYNSJE
 P3CRrNwJ09+IBw0U/fvcB+cnCUWSgb6fq7CEF1qk4THAefBoDkThZpq3PFfT69H3d0Ly
 5JD8vk6NXeYJ7RSdD99b3E9aOydGqNmgzW/+JljJ8oqWP10vTagm6y9RWx1111iZ/CQU
 /5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738898266; x=1739503066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=;
 b=MCJPkVupT+q6mg/cV4TFkZ0gRNeRVE0rJGx1B+sCDiMbxdHFZVm5JWpqc0vkpF8tE9
 tP9KzPDeeNEWYqevJCD1o7ZXVpROtAPZfhZfLP+9tmjePYvdftAQnW3VuM1/lI6ZP3qW
 DvmVYy+IFkUuaiklfBoHW4Y0lpgLoEIPiqQAwhYVfmbdP21shzyu+CyFdmJalUnvYcer
 ULnsTxqmyTiRwRlgIhEZ2JVSFiAoxHueCsNn7FBfPe64vgtT7jKLzvTIb0EuEqP64Zr6
 +Z0RCyGizL+QknQP6qfbNY+s3io7i/DeQxLb5E961W4akVBcHqBC5zRtuh7GXOMVMQU0
 iWBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjsA8DRndd3GNAdudZpy21yX61d6vSbS/WFiP2G27rgsAaXKmx4P/OITFvnFlSBr9oBw3AHsfp1p8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz111mrHjpukrDVQwx2N2i0IP4BHRAtvOghbwHJ9fEo6TOmKvXA
 Z+qd93etVJUpodWjO6FBGkPHjjkL6wlMO1TohVUpxl8cYmGJdrhUYHB8Dc/xk3U=
X-Gm-Gg: ASbGncuMdQ+b/ZyMZPK5Gqkmmnk0VFMfoJa4Q5VTypsrPox+u7pCL/3jbWodnHzDO6L
 dzZfIKeglU4yaUv3BjoOCE0utO/Um+Nwv/4C9SYO1tbrVZTnO2BZxqHtVfQdUTW0ZfnzrizQIoV
 2Fu6pDMN+iKrrG/ZYwrpHq5ZisyKMGaXJLsgTIsJiZKOjpsbNhmEnvyrKJEu8n+Po/1LvtnAimP
 n3LbAZOCukl4bX0VyL/paFbS5dtkkx6Itmttl95u3mao09OPkNxv+2leF6mB1zUStTU3ww9aR6v
 /BczLCwTeT3Qqr4u0v8s2QH38u2d10n+X+TPQrBl3qwHaIU000ROSpd5NHKAm1qvYT38pes=
X-Google-Smtp-Source: AGHT+IGFRWR3LZSENTzR1jrQjMzeY7hexf5uTv34xRfQ9DibP0IYIH3nm+4A52IVjL038EoBPPmYtg==
X-Received: by 2002:a05:6512:2105:b0:53e:ca48:776e with SMTP id
 2adb3069b0e04-54414b043d3mr248350e87.36.1738898266070; 
 Thu, 06 Feb 2025 19:17:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54410603876sm310371e87.211.2025.02.06.19.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 19:17:44 -0800 (PST)
Date: Fri, 7 Feb 2025 05:17:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:
> Add a devm/drmm action to these functions so the bridge reference is
> dropped automatically when the caller is removed.

I think the get() should go to the underlying of_drm_bridge_find() function.

Also it really feels like it's an overkill to keep the wrappers. After
getting bridge being handled by the panel code would it be possible to
drop all of them? Then this patch might introduce one new devm_
function? Or are drmm_ functions actually being used to store data in
the drmm-managed memory?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f694b32ca59cb91c32846bc00b43360df41cc1ad..497ec06dfcb05ab5dee8ea5e8f1eafb9c2807612 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  
> @@ -1459,6 +1460,13 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
>  	return ret;
>  }
>  
> +static void devm_drm_bridge_put_void(void *data)
> +{
> +	struct drm_bridge *bridge = (struct drm_bridge *)data;
> +
> +	drm_bridge_put(bridge);
> +}
> +
>  /**
>   * devm_drm_of_get_bridge - Return next bridge in the chain
>   * @dev: device to tie the bridge lifetime to
> @@ -1469,6 +1477,10 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
>   * Given a DT node's port and endpoint number, finds the connected node
>   * and returns the associated bridge if any.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by devres when @dev is removed.
> + *
>   * Returns a pointer to the bridge if successful, or an error pointer
>   * otherwise.
>   */
> @@ -1483,6 +1495,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> @@ -1497,6 +1513,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
>   * graph link search is not enough, e.g. for drivers that need to support
>   * panels described only as subnodes.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by devres when @dev is removed.
> + *
>   * RETURNS:
>   * A pointer to the bridge if successful, or an error pointer otherwise.
>   */
> @@ -1513,10 +1533,21 @@ struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
>  	if (!bridge)
>  		return ERR_PTR(-ENODEV);
>  
> +	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
>  
> +static void drmm_bridge_put_void(struct drm_device *drm, void *ptr)
> +{
> +	struct drm_bridge *bridge = ptr;
> +
> +	drm_bridge_put(bridge);
> +}
> +
>  /**
>   * drmm_of_get_bridge - Return next bridge in the chain
>   * @drm: device to tie the bridge lifetime to
> @@ -1527,6 +1558,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
>   * Given a DT node's port and endpoint number, finds the connected node
>   * and returns the associated bridge if any.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by drmm when @dev is removed.
> + *
>   * Returns a drmm managed pointer to the bridge if successful, or an error
>   * pointer otherwise.
>   */
> @@ -1541,6 +1576,10 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = drmm_add_action_or_reset(drm, drmm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(drmm_of_get_bridge);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
