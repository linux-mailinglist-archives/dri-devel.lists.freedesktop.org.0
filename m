Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28AA1CED6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 22:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1510E265;
	Sun, 26 Jan 2025 21:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WGy1dS7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969CB10E48E
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 21:46:37 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30615661f98so39615751fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737927995; x=1738532795; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lHr7hxWtGMJ3mRhxERq1ZK8TNjSfR6/lC4QQnZilmzA=;
 b=WGy1dS7U39RpM2EAngaQEK5AK7NerrSBQz8nTddCqLlqL3sRhOtsYyz3SQAA0oO9b6
 DUVsx8h5oLhIYp/v6gT5yHRtue/w2PMPAvz0HbHAnjQCLr8ZMkI3iolFg2t1hTPHIpXl
 gCf11c51ObBsqck9Wj2XBT8RvYMs+QJisrp1EIvCmstjobwoLGTDRQjrwx+emIXv4lqh
 vxFyeGfF9meL1Ig2unjRejh6I+aHvR8WV84kG5UN5YHEuD4a9THWEqXUBqz1S/zCydRh
 duCWhF2NemFmcucLKTdxdTO7xYL7d/xRYSephB5NBq5goKp0QfxBttm1lfZ6tdCMCxIp
 4ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737927995; x=1738532795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHr7hxWtGMJ3mRhxERq1ZK8TNjSfR6/lC4QQnZilmzA=;
 b=f5iaqoVSlDVFWFTlSBJthYuFm47DDTCDIsu/7+diaxbdV3Jly5dHIS/sh7jHe63R2/
 TSZ/5yhjPbji7g1aAZXXixKd57M8t3JcrsSfajjsA3du/tT1/FvHVoNk24r7RNgukXDj
 LIe9p9X5iv5FCktzsuDvxTQMmD9xmLgKLsp6uLM/2eN6+eIK/tYJAxeJX0cos5l356mS
 jSRIV8V6SYp1oblj08yF7laqQ9aKU7cDG99O+PDLZvig+kv0C1TaVUvvyB09+MYztPcG
 4pvCIfr25KK5QaSnGGM8yE+/zSrHqHqd93VCU5E3hxbUEl1RYg6vxRM3Hj24otkiHz1C
 bIuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4UlJ+gYyK6OwWyP7bTlKmSqpSYBVTE5jGZK6tJwMHQLDHrI5yLvzVth7RViPs14Ze4rp1WVN/0Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWsc+dyA4E95XXOKszeBOhXIp2pP/mW+8wGjosRuhWrM4sCIT9
 4YRu2hJcXQ83ZCGx/sBZc3tX5so6NQSvv73s3FqQnJJA1l/JXej6YNNI4I02014=
X-Gm-Gg: ASbGnctA7E96SfkCf+xG7OEPRwh8LtusYww/jz5GgvZyQBBfoweNgPcLF4ONwi9nnnC
 Cszwasecj7Zcq8QG8zarg+lfKOGbFWKj9sTGKQi8lKbjPc9+ZmXHp6e5/dL5O5pzReRuQj5cxPz
 ABIFD6CwGsZebAg6CDoipFJEfRD4k1K0rimLC38UnD7zi+ndlz1M1D+v7wQlp7SW481AyyynMzx
 A9rG9DFIaMAEhTq3Mv4bg+R0TCkz2t0l1FWiwyEFnqtppGNpStGv91iV+wncqqKri37kzFDeB61
 kQQqvaPUMNK7XrKekHC2T38Co0sgqcxV9kwuF382nHc1lbS+gIsMHqtbQyig
X-Google-Smtp-Source: AGHT+IESsYCAPgo0W+Hb9Tr1b501G11+w7GQY2BAqSBcwgrPEO43NhLTVS5Ex65K2qlg7b63CPAuRA==
X-Received: by 2002:a05:6512:b24:b0:540:2a92:7daa with SMTP id
 2adb3069b0e04-5439c282032mr12609106e87.42.1737927994923; 
 Sun, 26 Jan 2025 13:46:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822f95asm1060677e87.85.2025.01.26.13.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 13:46:34 -0800 (PST)
Date: Sun, 26 Jan 2025 23:46:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Jyri Sarha <jsarha@ti.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Fedor Pchelkin <pchelkin@ispras.ru>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH] gpu: cdns-mhdp8546: fix call balance of mhdp->clk
 handling routines
Message-ID: <jlednbhsqwqc7pbnifqm64xn4cyk45roxvdjrun3a5pwq5dsfo@jez2c445jl4c>
References: <20250124170009.2075175-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124170009.2075175-1-mordan@ispras.ru>
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

On Fri, Jan 24, 2025 at 08:00:09PM +0300, Vitalii Mordan wrote:
> If the clock mhdp->clk was not enabled in cdns_mhdp_probe(), it should not
> be disabled in any path.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d081850e3c03..3e923bcfb0bf 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2504,7 +2504,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  
>  	mhdp->info = of_device_get_match_data(dev);
>  
> -	clk_prepare_enable(clk);
> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clk\n");
> +		return ret;
> +	}

I think this should be switch to devm_clk_get_enabled, removing the
extra clk_prepare_enable(), error handling, etc.

>  
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_resume_and_get(dev);
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
