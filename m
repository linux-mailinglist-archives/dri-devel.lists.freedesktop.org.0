Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2583962788
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105D510E4D6;
	Wed, 28 Aug 2024 12:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="P5tneU5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2914210E030
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:44:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-429da8b5feaso73655865e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724849049; x=1725453849; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PJoy2cgS+HW0K4p2KnocRxI+9IVsCSi90PCNEOIIuJ8=;
 b=P5tneU5JYuGhvcxRnhHOYfxnNUGiCU3wRzEJ1z9onwS4xNcjRw3g5ljf2rQ8uHZdQS
 xyvzAQ1yDjvfPEnnPseskPDKIrPFQwHUgJjfKCUoiAjMRallVLm8RcdD13y7y7A62SwE
 osinJl3mtKzz+ajzgTYGsWP8qDb7XELMdJfH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849049; x=1725453849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJoy2cgS+HW0K4p2KnocRxI+9IVsCSi90PCNEOIIuJ8=;
 b=a/r3dfI7+qgl7s6bI0Z1KiCTO1flV5MQiHGt7trbFrggvQlZVU8xXCcJgxjb0bUqmb
 JXY7/oP8qy/r/s9qhcnLjtddhmC9YTfpCZhjRJyAltKXO/YzFH5MVanJ37cR6pTCWSem
 9tHYJkE5jLx3gUFKsDnnyDgHeBr4H+dykwfNenhUglTFMUvGM3sYqVhOoS2MRIwQjYf0
 nuMKCmAplY8BXYfvdlesNtZvzLOGOoyh5ddxv0Rl1Q7umTHRLnq28DERLUkucEzMCDcK
 XygeUG4tF5zsmJcJWYzoTd+6YLlqTw/ASsJ6eF79Ns9Zgg5zKc3hK70KfOQx+k3qyBGs
 naRQ==
X-Gm-Message-State: AOJu0YyxTXqeS1iYFjWHywBnLDSSTskhbdNqCBdZ+gHecAkS1ePQHi0u
 a5g20tsL25oARRFgLiG04khHK1RyrlBHGa1T/BG1GPGLTvTEV/JShaZnog7vLaAfEWQ5sakybFh
 V
X-Google-Smtp-Source: AGHT+IHu+Ym/EOCxiFAA+P0FEH5X9n6NL4h+Op9J46iU85Y8xtgIQz69/IK4Rj0aOvHw6CKRmZSolA==
X-Received: by 2002:a05:600c:816:b0:42b:892a:3296 with SMTP id
 5b1f17b1804b1-42b892a33d0mr113204905e9.37.1724849049421; 
 Wed, 28 Aug 2024 05:44:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63abe97sm20507885e9.24.2024.08.28.05.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:44:09 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:44:07 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/exynos: hdmi: use display_info for printing
 display dimensions
Message-ID: <Zs8blw9nvgv-BfzB@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <8a6fd6de1853dbc337c5c26c65268604d3e91fe2.1724348429.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a6fd6de1853dbc337c5c26c65268604d3e91fe2.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 22, 2024 at 08:42:48PM +0300, Jani Nikula wrote:
> Look up display dimensions from display_info instead of the EDID
> directly. This will be helpful for the follow-up work.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> ---
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 1e26cd4f8347..25d508b25921 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -883,6 +883,7 @@ static const struct drm_connector_funcs hdmi_connector_funcs = {
>  static int hdmi_get_modes(struct drm_connector *connector)
>  {
>  	struct hdmi_context *hdata = connector_to_hdmi(connector);
> +	const struct drm_display_info *info = &connector->display_info;
>  	struct edid *edid;
>  	int ret;
>  
> @@ -893,10 +894,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  	if (!edid)
>  		goto no_edid;
>  
> -	hdata->dvi_mode = !connector->display_info.is_hdmi;
> +	hdata->dvi_mode = !info->is_hdmi;
>  	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
> -			  edid->width_cm, edid->height_cm);
> +			  info->width_mm / 10, info->height_mm / 10);
>  
>  	drm_connector_update_edid_property(connector, edid);
>  	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
