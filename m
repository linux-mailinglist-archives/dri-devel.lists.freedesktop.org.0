Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A523C8AD536
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9BB10F7A7;
	Mon, 22 Apr 2024 19:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X/xwG0p1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972B10F7A7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:51:45 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2db7c6b5598so64108051fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815504; x=1714420304; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=geu7O3+m3HJ/3o9N5bHvMzVI9k+cw0GEArJbMvVCgjk=;
 b=X/xwG0p1Fapek6Q6E2vGtEd7hBLCRiYUp0GusxG4gZNpINk8Z/5x6qftn94JFBRDDj
 PFxKaoqs/dsx0Ga7RG80kFe2S8mX+kslY1+islfsBe/UDwNitSQA3ql5D1CPQGlvtq38
 Upl4Clb0pcAuTHeNiXFTc7iu3yx4/nxGjckEFmf4YkMgS/lpolMDSywqpFh2um8cRbJ8
 vTW+E2Q+LzAgGgY3z4HWBBD3IGDDLxGX4dRK80Wl6B9PaLnrUCgCx7AG0+Gozu3H58vB
 KHSd4HGAjobsfA/oYAL12y1e7Nsv/ziV/DcoKwHr/HRw8LiH9JyaAEP8Mut+0nMP/nEH
 mDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815504; x=1714420304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geu7O3+m3HJ/3o9N5bHvMzVI9k+cw0GEArJbMvVCgjk=;
 b=LnqZiNszny4M6ztmwXhZVEwui1RToNsmctO+HIuB8stjWn2crLlBoI1Xte2JdBvEvN
 6lW5/8LxCiBg+DWKbkdM2YHh+CbHeWlmL3X85juG8fzCQYZ10CF5EII9I424e3PQMhz4
 rf/AX7odHVl0DEJaYo7Y4Dl607ygJljnRgl5RG1eOyjojcr1iK/g5FjQsrj++yIeB5RU
 2JDcUyXlkVQtdn8LpNVNmtB41AsKpSunx+q+59KuohMG1mNyUOvArosy3ZQ1qq0JecDx
 YmpLLIp1S3JENxLoDBq7nd0YZiDR+EfI91CcPTbhWuv5Ti9Ek1KpwWRc2MZI/FnNakpx
 GHug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2cFyYc4ihcJuyDq1Fe3n0yS3l2tBF/CcCLF+1l2549vKdv3uJIrLCfUF6XZliN7OCo1WH78ueIp3L715PRSWG3clZ+HWc4M2zexiY2RD0
X-Gm-Message-State: AOJu0YxE4Wy0AN92Seitv9awqgEBd4Obu2IPFf9KsprYmMmV50Caw/xU
 TYYyZ0gTCo/KsyHvJKZUAV8uOW4FXolyE/0Y8WNt7EIDLEPl77dT+967F4qJP7M=
X-Google-Smtp-Source: AGHT+IFBToLOpSsjPI8pjqEB5XqsvUzOWG8mujF7Bwog8+VxvvQHLSw7DikZG1Z+rLu3IV4Obwe7Jw==
X-Received: by 2002:a2e:9ccb:0:b0:2d6:d351:78ae with SMTP id
 g11-20020a2e9ccb000000b002d6d35178aemr7467468ljj.29.1713815503853; 
 Mon, 22 Apr 2024 12:51:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a2e9c43000000b002dcb831d958sm1317363ljj.56.2024.04.22.12.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:51:43 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:51:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] drm/bridge: Allow using fwnode API to get the
 next bridge
Message-ID: <xsfrnucued63q2amv7betkvgks6bhssubhjcryghkcloytixj4@ukmak4xwyjtg>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-2-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-2-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 03:18:55AM +0800, Sui Jingfeng wrote:
> Currently, the various display bridge drivers rely on OF infrastructures
> to works very well, yet there are platforms and/or devices absence of 'OF'
> support. Such as virtual display drivers, USB display apapters and ACPI
> based systems etc.
> 
> Add fwnode based helpers to fill the niche, this allows part of the display
> bridge drivers to work across systems. As the fwnode API has wider coverage
> than DT counterpart and the fwnode graphs are compatible with the OF graph,
> so the provided helpers can be used on all systems in theory. Assumed that
> the system has valid fwnode graphs established before drm bridge drivers
> are probed, and there has fwnode assigned to involved drm bridge instance.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/drm_bridge.c | 74 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     | 16 ++++++++
>  2 files changed, 90 insertions(+)
> 

[skipped]

> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4baca0d9107b..a3f5d12a308c 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -26,6 +26,7 @@
>  #include <linux/ctype.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_encoder.h>
> @@ -721,6 +722,8 @@ struct drm_bridge {
>  	struct list_head chain_node;
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> +	/** @fwnode: fwnode pointer to the bridge */
> +	struct fwnode_handle *fwnode;

My comment is still the same: plese replace of_node with fwnode. It is
more intrusive, however it will lower the possible confusion if the
driver sets both of_node and fwnode. Also it will remove the necessity
for helpers like drm_bridge_set_node().

>  	/** @list: to keep track of all added bridges */
>  	struct list_head list;
>  	/**
> @@ -788,6 +791,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous,
>  		      enum drm_bridge_attach_flags flags);
>  
> +static inline void
> +drm_bridge_set_node(struct drm_bridge *bridge, struct fwnode_handle *fwnode)
> +{
> +	bridge->fwnode = fwnode;
> +	bridge->of_node = to_of_node(fwnode);
> +}
> +
>  #ifdef CONFIG_OF
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  #else
> @@ -797,6 +807,12 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  }
>  #endif
>  
> +struct drm_bridge *
> +drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode);
> +
> +struct drm_bridge *
> +drm_bridge_find_next_bridge_by_fwnode(struct fwnode_handle *fwnode, u32 port);
> +
>  /**
>   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>   * @bridge: bridge object
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
