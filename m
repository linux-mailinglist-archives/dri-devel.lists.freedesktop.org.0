Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB926923C97
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468EB10E5C5;
	Tue,  2 Jul 2024 11:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ErUyE8LS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361910E5C5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 11:41:19 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52e7145c63cso4440153e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719920477; x=1720525277; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kQVFB1Ory94czUgWNWBlgE/4b9Cm7QVvjGoDYPQAvFo=;
 b=ErUyE8LS3e3PlZunLL9Ri9m2tPgpjV01Uerifyl7u8aBpZ/w9/wPT/oSPEsmLKszuw
 M9LxMhrjc0qCQBPtYSRcRctOb8HzZae2xweziarLchISb0U1OUwD/rXDLDCCFqu6n72v
 LaFlC3C5xvR69mr9tLd6LTGOHFc14aBG/UwkuGDtg9w+7uV6DZAo5lB+Z0mnn38dqa+G
 w8s52KWBfuSLq9zPstMQjwumj8quubAW/UHUork0jcCJDs71lwvS3EmdbdA7Y7/Q3LrI
 QUJR1TUc7D3A6v5cOnOtT4eICJMob39l3N27B+lf6CtoKOcWyr75fcIAMFElkMF3Bskh
 L5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719920477; x=1720525277;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQVFB1Ory94czUgWNWBlgE/4b9Cm7QVvjGoDYPQAvFo=;
 b=iuowuHS+bVkLYgLE/Klc7QcOe3oO7FYkGuDuP6lLdgrEKGsQE1k8yqTc+k4sxFV3S0
 gjIaERFdQ1r7qdmnjFGeVZcXW2qqA73JIy4ivM461xYQHxrmtfrYdpnw0VMNFH4Pw9DA
 xuJ8SvlQGWttgvfiJj+6agM4FLpR2ISniU1rlpYxa7G+yBXamVmbGCGdhJBhnmZ1V2Ee
 we8ddgNWXwjQhcz9XiPZvZZNsbA/bMEvuJ/HXdeYHTeWXuZQ/t9MlMnsU4jGTyInrC/w
 MoL7DU/94oNkyojq5+m2VxvsW9b4KF7XF1Gj50R7XCK1smWt5UH9hUj6GroVYlPjicVR
 xtvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVNvFmlDqPQx4MpTPriUavR0VV7w3qJNstquHOqQcOHozD+XyPWUZriyTwmAphUVWT/4GlYsql6hZva2yWWfmbegPaxmoKhCXWL+JxG5oi
X-Gm-Message-State: AOJu0Yw3Hp6jYkwKi0H2H3sC6Am4ltE8qtR8on04sZnVLU0yY4/yxMKr
 R3CvrJsCGPJvfzFvk2fOTq+4J4LpY/x9Yo3s1GZEIPaZ9ZKy/Yh+hbt7DTv8LH8CgMrMIBECI9l
 LBdM=
X-Google-Smtp-Source: AGHT+IFqRDyr09Nd7VDWumaaV4++hDJsHKTRvx5HWWdlWqBKX6NlFxjkCBaAtoRxcjfUWhxGiOhj5A==
X-Received: by 2002:a19:e017:0:b0:52c:81ba:aeba with SMTP id
 2adb3069b0e04-52e8259ff12mr1988718e87.14.1719920477367; 
 Tue, 02 Jul 2024 04:41:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2f8b5sm1774583e87.233.2024.07.02.04.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:41:17 -0700 (PDT)
Date: Tue, 2 Jul 2024 14:41:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] drm/bridge: Silence error messages upon probe
 deferral
Message-ID: <5f2qg7cidl6rchculjzw52sfadwoprcptkhz2ikvo43kyny42s@o2ejrvqg7xjg>
References: <20240628115131.2903251-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628115131.2903251-1-alexander.stein@ew.tq-group.com>
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

On Fri, Jun 28, 2024 at 01:51:30PM GMT, Alexander Stein wrote:
> When -EPROBE_DEFER is returned do not raise an error, but silently return
> this error instead. Fixes error like this:
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>   /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>   /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> ---
> Changes in v4:
> * Rebased to next-20240628
> 
>  drivers/gpu/drm/drm_bridge.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d44f055dbe3e7..3e72dfd941577 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -353,8 +353,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	bridge->encoder = NULL;
>  	list_del(&bridge->chain_node);
>  
> -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> -		  bridge->of_node, encoder->name, ret);
> +	if (ret != -EPROBE_DEFER)
> +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> +			  bridge->of_node, encoder->name, ret);

Maybe?

else
   dev_err_probe(encoder->dev->dev, -EPROBE_DEFER, "failed to attach...\n");

>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
