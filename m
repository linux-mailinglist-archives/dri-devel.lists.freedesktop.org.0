Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246E779454
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1A410E6B6;
	Fri, 11 Aug 2023 16:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310710E6B6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:24:39 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so3840933e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771078; x=1692375878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAbWJt7VYJZGb0oGJLZpXmL9Pg/Akce6I5YlnCbDdyQ=;
 b=aRrYJz8d5a5QwsSiJmRKAxgPPv6BSTNLZCK5XP2vev2u1XU7FVBaHn7B88YPZgdJBZ
 YlEQ17K7ymZaAR0wlgGOUhnPZvqnspOocaQhuqcLx9uLGgmxEoXo7HQbw0aTaBX0w3Zb
 XmMfrbBxszQzcoeRnJK+pPlgdNMEJX07Mh6Th+i0wrylCNWmZwrBOtG51WQ9v/2Q7EaU
 aH5Ky7PHIF+1gaI44Jyv+Ks/YNhn8IKjCrptpZQyFXxqGYk5CdUJ6DBClB1od7AsEiti
 MLGw70erkPOOTtfDOZ329UPusEs94y4/KVwVGcrijEw9NSvZVy74hg8aJlyUIFliWWq0
 Iamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771078; x=1692375878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAbWJt7VYJZGb0oGJLZpXmL9Pg/Akce6I5YlnCbDdyQ=;
 b=g2KNagqQZaVEX0mjMj3JkCUtGYkgQG6yoYCIvnOy2YMnFO5jKKlv8NalJRCALJwqRK
 rVpwqtxi74DpAkRobnU5E2kygWVJsa2n0gFmIK2CYR/GenkPQvDGStE8m4o+Gy6F82SY
 2/x7X5rzlZzI2V9aI55qZMvqiXTaNrrgHrRpiY6NFDe8b3XFUjTTikfLq+lJ9vHp90+M
 Rn3/4Vn/ngyQZdAuNNdroJwpXRNWw79lPkIxN+GgQBFupE2okq6XHqa6DUdFtW5nFucA
 f5HaQfDy+TTGPzak3UCLGvkaJlxGVAYXVJx/eL+PPqrEA1fJ0AUq156Rec+ahbLmTwSh
 +ZEA==
X-Gm-Message-State: AOJu0Yyw1nRvcRKP0EOBeOcIUXT1l8cwcvZlrt3iNLGiBPYwo2d/hbFX
 qv/jHRkKb/qnk9LZg8YxoKg=
X-Google-Smtp-Source: AGHT+IHHMbS4s6/fha5oRksXj7wM/uqwtsEzCvucfz9dORGMVqMCWoCVpT6Le3zAlSqejE7QrgnmMA==
X-Received: by 2002:a05:6512:3089:b0:4fe:17a8:bee5 with SMTP id
 z9-20020a056512308900b004fe17a8bee5mr933959lfd.31.1691771077544; 
 Fri, 11 Aug 2023 09:24:37 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 v7-20020ac25587000000b004fe3229e584sm768475lfg.270.2023.08.11.09.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:24:37 -0700 (PDT)
Message-ID: <1df8fff3-9ba0-49cb-80e4-03f0cef57f9b@gmail.com>
Date: Fri, 11 Aug 2023 19:26:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] drm/bridge: tc358768: Use struct videomode
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-4-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-4-1afd44b7826b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/08/2023 13:44, Tomi Valkeinen wrote:
> The TC358768 documentation uses HFP, HBP, etc. values to deal with the
> video mode, while the driver currently uses the DRM display mode
> (htotal, hsync_start, etc).
> 
> Change the driver to convert the DRM display mode to struct videomode,
> which then allows us to use the same units the documentation uses. This
> makes it much easier to work on the code when using the TC358768
> documentation as a reference.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 45 +++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index d5831a1236e9..9b633038af33 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -650,6 +650,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	u32 dsiclk, dsibclk, video_start;
>  	const u32 internal_delay = 40;
>  	int ret, i;
> +	struct videomode vm;
>  
>  	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
>  		dev_warn_once(priv->dev, "Non-continuous mode unimplemented, falling back to continuous\n");
> @@ -673,6 +674,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		return;
>  	}
>  
> +	drm_display_mode_to_videomode(mode, &vm);
> +
>  	dsiclk = priv->dsiclk;
>  	dsibclk = dsiclk / 4;
>  
> @@ -681,28 +684,28 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	switch (dsi_dev->format) {
>  	case MIPI_DSI_FMT_RGB888:
>  		val |= (0x3 << 4);
> -		hact = mode->hdisplay * 3;
> -		video_start = (mode->htotal - mode->hsync_start) * 3;
> +		hact = vm.hactive * 3;
> +		video_start = (vm.hsync_len + vm.hback_porch) * 3;
>  		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
>  		break;
>  	case MIPI_DSI_FMT_RGB666:
>  		val |= (0x4 << 4);
> -		hact = mode->hdisplay * 3;
> -		video_start = (mode->htotal - mode->hsync_start) * 3;
> +		hact = vm.hactive * 3;
> +		video_start = (vm.hsync_len + vm.hback_porch) * 3;
>  		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
>  		break;
>  
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  		val |= (0x4 << 4) | BIT(3);
> -		hact = mode->hdisplay * 18 / 8;
> -		video_start = (mode->htotal - mode->hsync_start) * 18 / 8;
> +		hact = vm.hactive * 18 / 8;
> +		video_start = (vm.hsync_len + vm.hback_porch) * 18 / 8;
>  		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
>  		break;
>  
>  	case MIPI_DSI_FMT_RGB565:
>  		val |= (0x5 << 4);
> -		hact = mode->hdisplay * 2;
> -		video_start = (mode->htotal - mode->hsync_start) * 2;
> +		hact = vm.hactive * 2;
> +		video_start = (vm.hsync_len + vm.hback_porch) * 2;
>  		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
>  		break;
>  	default:
> @@ -814,43 +817,43 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		tc358768_write(priv, TC358768_DSI_EVENT, 0);
>  
>  		/* vact */
> -		tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
> +		tc358768_write(priv, TC358768_DSI_VACT, vm.vactive);
>  
>  		/* vsw */
> -		tc358768_write(priv, TC358768_DSI_VSW,
> -			       mode->vsync_end - mode->vsync_start);
> +		tc358768_write(priv, TC358768_DSI_VSW, vm.vsync_len);
> +
>  		/* vbp */
> -		tc358768_write(priv, TC358768_DSI_VBPR,
> -			       mode->vtotal - mode->vsync_end);
> +		tc358768_write(priv, TC358768_DSI_VBPR, vm.vback_porch);
>  
>  		/* hsw * byteclk * ndl / pclk */
> -		val = (u32)div_u64((mode->hsync_end - mode->hsync_start) *
> +		val = (u32)div_u64(vm.hsync_len *
>  				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> -				   mode->clock * 1000);
> +				   vm.pixelclock);
>  		tc358768_write(priv, TC358768_DSI_HSW, val);
>  
>  		/* hbp * byteclk * ndl / pclk */
> -		val = (u32)div_u64((mode->htotal - mode->hsync_end) *
> +		val = (u32)div_u64(vm.hback_porch *
>  				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> -				   mode->clock * 1000);
> +				   vm.pixelclock);
>  		tc358768_write(priv, TC358768_DSI_HBPR, val);
>  	} else {
>  		/* Set event mode */
>  		tc358768_write(priv, TC358768_DSI_EVENT, 1);
>  
>  		/* vact */
> -		tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
> +		tc358768_write(priv, TC358768_DSI_VACT, vm.vactive);
>  
>  		/* vsw (+ vbp) */
>  		tc358768_write(priv, TC358768_DSI_VSW,
> -			       mode->vtotal - mode->vsync_start);
> +			       vm.vsync_len + vm.vback_porch);
> +
>  		/* vbp (not used in event mode) */
>  		tc358768_write(priv, TC358768_DSI_VBPR, 0);
>  
>  		/* (hsw + hbp) * byteclk * ndl / pclk */
> -		val = (u32)div_u64((mode->htotal - mode->hsync_start) *
> +		val = (u32)div_u64((vm.hsync_len + vm.hback_porch) *
>  				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> -				   mode->clock * 1000);
> +				   vm.pixelclock);
>  		tc358768_write(priv, TC358768_DSI_HSW, val);
>  
>  		/* hbp (not used in event mode) */
> 

-- 
Péter
