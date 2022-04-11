Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D444FC105
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC210E33C;
	Mon, 11 Apr 2022 15:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C50710E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:37:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 r206-20020a1c44d7000000b0038ccb70e239so4844569wma.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZEd2NUfggsD7hgjY8ZW9Vk2tNqqVUG6JADb5kDnjH9Y=;
 b=ZOQvmS/wEUkvWeynt1+EWEaVA+W9eMPHyQEiaRq21gFbWomCufcS8tUyh7ZQPu5LwP
 eUJ1WFpwyr9Yaqft68B8Nm/C+PGGHXUuTmGoF51iyzkF3siGBMH+JbPuJgnjBYZUQ0rk
 Rcab+BNrqtIDRdL1aduuV/rJWLG6C3gqZxMSNqkBpLnMkCujJoCI1LqQFlAqfyYnWPkC
 bvWQ6Pmc5eLqexEdzFrdr3CkHrDmtXhkSU7mjU3BvZHz1uqWYGghCI2eTSdTnMfEAzTC
 H/xVAOBg32rRcMvl5vxvcfb3LXbU80yq1DS9PzCV7iURoVOOuLaKzCbcU5eq/IECPn71
 8chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZEd2NUfggsD7hgjY8ZW9Vk2tNqqVUG6JADb5kDnjH9Y=;
 b=twYGaibhDtISxV6bJ/3gjri4RtHZ5I+lLLouBk88Xf1EWzQCDxXTML8QDtFAZ37bLU
 33rNxfAnfYRQHc/QyS1uP8zcR5URQiRd/fCMZUZdKjjgVHP6/+QR2IXAHJDKHe2DT3I3
 bUXXBNZsdS+hcIo2CXhenIeL+oHA4v+eUoVxRkA14HE3JgvjPIjGFIi+4D0HEbViBNL3
 IL1o4JKHlsDtEfeW17cjF7Pt6c4A5em8I6jWK8yXG7NCxewG4SSSlvhaA8AVpR1nido7
 lyf4STIOD2McaUKRlNRWBgAPQyDiICE7dO++7FLc6+3ygnQA1bsGB3pbVm/WBilRl/3C
 0tNA==
X-Gm-Message-State: AOAM530/0+Vm7IOiErbLwNnlvaDx4XXOqjJ2cNDNCddYT2U0eAo19Eyn
 hI38qpd9iTlxe4Tc5/QMlmQ=
X-Google-Smtp-Source: ABdhPJy/BzuwObXpGrBkuPP/B+nIiUKgXHozXUMEVJpsQ9JEfJdCGxcjcG2VRWPpqzSHJ8PxH0l9YA==
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id
 z3-20020a7bc7c3000000b00389cbf1fadfmr30248265wmk.147.1649691471387; 
 Mon, 11 Apr 2022 08:37:51 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0037bdfa1665asm22528252wmj.18.2022.04.11.08.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:37:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 03/10] drm/sun4i: Remove obsolete references to PHYS_OFFSET
Date: Mon, 11 Apr 2022 17:37:49 +0200
Message-ID: <3167527.44csPzL39Z@kista>
In-Reply-To: <20220411043423.37333-4-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 11. april 2022 ob 06:34:15 CEST je Samuel Holland napisal(a):
> commit b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a
> central place") added a platform device notifier that sets the DMA
> offset for all of the display engine frontend and backend devices.
> 
> The code applying the offset to DMA buffer physical addresses was then
> removed from the backend driver in commit 756668ba682e ("drm/sun4i:
> backend: Remove the MBUS quirks"), but the code subtracting PHYS_OFFSET
> was left in the frontend driver.
> 
> As a result, the offset was applied twice in the frontend driver. This
> likely went unnoticed because it only affects specific configurations
> (scaling or certain pixel formats) where the frontend is used, on boards
> with both one of these older SoCs and more than 1 GB of DRAM.
> 
> In addition, the references to PHYS_OFFSET prevent compiling the driver
> on architectures where PHYS_OFFSET is not defined.
> 
> Fixes: b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central 
place")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Good catch! Actually, people complained about non-working display on 
Cubietruck IIRC, which has 2 GB of RAM.

Did you test this on HW?

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/sun4i_frontend.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/
sun4i_frontend.c
> index 56ae38389db0..462fae73eae9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
> @@ -222,13 +222,11 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend 
*frontend,
>  
>  	/* Set the physical address of the buffer in memory */
>  	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
> -	paddr -= PHYS_OFFSET;
>  	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &paddr);
>  	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, paddr);
>  
>  	if (fb->format->num_planes > 1) {
>  		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 2 : 
1);
> -		paddr -= PHYS_OFFSET;
>  		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n", 
&paddr);
>  		regmap_write(frontend->regs, 
SUN4I_FRONTEND_BUF_ADDR1_REG,
>  			     paddr);
> @@ -236,7 +234,6 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend 
*frontend,
>  
>  	if (fb->format->num_planes > 2) {
>  		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 1 : 
2);
> -		paddr -= PHYS_OFFSET;
>  		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n", 
&paddr);
>  		regmap_write(frontend->regs, 
SUN4I_FRONTEND_BUF_ADDR2_REG,
>  			     paddr);
> -- 
> 2.35.1
> 
> 


