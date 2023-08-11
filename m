Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094007794A2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155810E6BA;
	Fri, 11 Aug 2023 16:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9889810E6BA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:31:31 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe0d5f719dso3586165e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771490; x=1692376290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r8uFOCFWoIw9ACS18H+F4QWh9HyvhOjBsah+besZY/I=;
 b=F3fAV2/z+9CrNSQq3ATl8MG6jx4ZwW2ObXCU8/gzqpl5Sg/cpNa2RuLHbYLXXjhrhA
 /v/eGzuDHCmQgrdP41mcF4GBcBXeXpIhhtqjw+NZTf3vAvErOwxf6OoqHGGFbiSq6rTy
 kcf5ySGyt59JqAPcjaopjpRRrWdSfmU5jxbmenSeRYOuBCMc5e2vj6kK9x/Y9M//dqQy
 ZUCxkCygMA9XcyFVPRpZqG7Xrjx6iPWRphGBUzAQJQ8FzkKM2Lbr54KfRROPvC1ThE/o
 SDiY0p/TdSWHqEWzBsOfyzDADEErua+qeKSXTkY8wsLWUqyeJzyOLwCTYSeDgFgcsHRQ
 LBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771490; x=1692376290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8uFOCFWoIw9ACS18H+F4QWh9HyvhOjBsah+besZY/I=;
 b=DjMeF17BY5oWxL/MU2qMsbeDiePbFtUBrS1Ut+9JD0Hf33H2Hd0YKLnEQ/GeQfquGX
 bSGpwb4Ct9PZoRBPf6cc2/tuyChhUabuqNHOr7pMlaZLLMUYg205886HVambKUz61/MA
 jRRbqz4wtymBS46vi6CKrLCdEJTwV8XYXhUuv7Ubl3SaP3y1ng+o6O5Z5HhcOvEDapNr
 nqrldfC5/6EqHBzRcyUxr5nHYRItg3vObkJUpGuI52wcKDjlOFtPmhwfokcNJj4y2OyR
 qVaGT9uvutywhGNI+OP6Yh2+EJJJsYpiBqA7gqiIj9GN9cWemtGmvsoUgTJje7yvlOoy
 yT5A==
X-Gm-Message-State: AOJu0YyZqzuDSskSe7QCkC7N3qLdcv3a+lSDGKRKJadFnmhciLoHYltP
 /CTxcZlXg8553zUGMQHyDNQ=
X-Google-Smtp-Source: AGHT+IHz/xQIxnfzzP0umPqGe8ntIvfd6ExwjDdzAFWfB53jE3WHV4EP8N+0CVQJ2gOxnhcP1p6lRQ==
X-Received: by 2002:ac2:4896:0:b0:4fb:bef0:948e with SMTP id
 x22-20020ac24896000000b004fbbef0948emr1596090lfc.5.1691771489486; 
 Fri, 11 Aug 2023 09:31:29 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 a5-20020a19f805000000b004fb9536bc99sm778839lff.169.2023.08.11.09.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:31:29 -0700 (PDT)
Message-ID: <ce4ed95d-b556-4d1b-84f0-d00c6294ba15@gmail.com>
Date: Fri, 11 Aug 2023 19:33:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/bridge: tc358768: Rename dsibclk to hsbyteclk
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-7-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-7-1afd44b7826b@ideasonboard.com>
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
> The Toshiba documentation talks about HSByteClk when referring to the
> DSI HS byte clock, whereas the driver uses 'dsibclk' name. Also, in a
> few places the driver calculates the byte clock from the DSI clock, even
> if the byte clock is already available in a variable.

If you say so ;)
I don't have access to the documentation anymore.

> 
> To align the driver with the documentation, change the 'dsibclk'
> variable to 'hsbyteclk'. This also make it easier to visually separate
> 'dsibclk' and 'dsiclk' variables.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 48 +++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 3266c08d9bf1..db45b4a982c0 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -604,7 +604,7 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
>  
>  	dev_dbg(priv->dev, "PLL: refclk %lu, fbd %u, prd %u, frs %u\n",
>  		clk_get_rate(priv->refclk), fbd, prd, frs);
> -	dev_dbg(priv->dev, "PLL: pll_clk: %u, DSIClk %u, DSIByteClk %u\n",
> +	dev_dbg(priv->dev, "PLL: pll_clk: %u, DSIClk %u, HSByteClk %u\n",
>  		priv->dsiclk * 2, priv->dsiclk, priv->dsiclk / 4);
>  	dev_dbg(priv->dev, "PLL: pclk %u (panel: %u)\n",
>  		tc358768_pll_to_pclk(priv, priv->dsiclk * 2),
> @@ -646,8 +646,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	u32 val, val2, lptxcnt, hact, data_type;
>  	s32 raw_val;
>  	const struct drm_display_mode *mode;
> -	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk;
> -	u32 dsiclk, dsibclk, video_start;
> +	u32 hsbyteclk_nsk, dsiclk_nsk, ui_nsk;
> +	u32 dsiclk, hsbyteclk, video_start;
>  	const u32 internal_delay = 40;
>  	int ret, i;
>  	struct videomode vm;
> @@ -678,7 +678,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	drm_display_mode_to_videomode(mode, &vm);
>  
>  	dsiclk = priv->dsiclk;
> -	dsibclk = dsiclk / 4;
> +	hsbyteclk = dsiclk / 4;
>  
>  	/* Data Format Control Register */
>  	val = BIT(2) | BIT(1) | BIT(0); /* rdswap_en | dsitx_en | txdt_en */
> @@ -730,67 +730,67 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		tc358768_write(priv, TC358768_D0W_CNTRL + i * 4, 0x0000);
>  
>  	/* DSI Timings */
> -	dsibclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION,
> -				  dsibclk);
> +	hsbyteclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION,
> +				  hsbyteclk);
>  	dsiclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION, dsiclk);
>  	ui_nsk = dsiclk_nsk / 2;
>  	dev_dbg(dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
>  	dev_dbg(dev, "ui_nsk: %u\n", ui_nsk);
> -	dev_dbg(dev, "dsibclk_nsk: %u\n", dsibclk_nsk);
> +	dev_dbg(dev, "hsbyteclk_nsk: %u\n", hsbyteclk_nsk);
>  
>  	/* LP11 > 100us for D-PHY Rx Init */
> -	val = tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(100 * 1000, hsbyteclk_nsk) - 1;
>  	dev_dbg(dev, "LINEINITCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_LINEINITCNT, val);
>  
>  	/* LPTimeCnt > 50ns */
> -	val = tc358768_ns_to_cnt(50, dsibclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(50, hsbyteclk_nsk) - 1;
>  	lptxcnt = val;
>  	dev_dbg(dev, "LPTXTIMECNT: %u\n", val);
>  	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
>  
>  	/* 38ns < TCLK_PREPARE < 95ns */
> -	val = tc358768_ns_to_cnt(65, dsibclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(65, hsbyteclk_nsk) - 1;
>  	dev_dbg(dev, "TCLK_PREPARECNT %u\n", val);
>  	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
>  	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
> -				  dsibclk_nsk) - 2;
> +				  hsbyteclk_nsk) - 2;
>  	dev_dbg(dev, "TCLK_ZEROCNT %u\n", val2);
>  	val |= val2 << 8;
>  	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
>  
>  	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
> -	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), dsibclk_nsk) - 5;
> +	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), hsbyteclk_nsk) - 5;
>  	val = clamp(raw_val, 0, 127);
>  	dev_dbg(dev, "TCLK_TRAILCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
>  
>  	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
>  	val = 50 + tc358768_to_ns(4 * ui_nsk);
> -	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) - 1;
>  	dev_dbg(dev, "THS_PREPARECNT %u\n", val);
>  	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
> -	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), dsibclk_nsk) - 10;
> +	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), hsbyteclk_nsk) - 10;
>  	val2 = clamp(raw_val, 0, 127);
>  	dev_dbg(dev, "THS_ZEROCNT %u\n", val2);
>  	val |= val2 << 8;
>  	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
>  
>  	/* TWAKEUP > 1ms in lptxcnt steps */
> -	val = tc358768_ns_to_cnt(1020000, dsibclk_nsk);
> +	val = tc358768_ns_to_cnt(1020000, hsbyteclk_nsk);
>  	val = val / (lptxcnt + 1) - 1;
>  	dev_dbg(dev, "TWAKEUP: %u\n", val);
>  	tc358768_write(priv, TC358768_TWAKEUP, val);
>  
>  	/* TCLK_POSTCNT > 60ns + 52*UI */
>  	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
> -				 dsibclk_nsk) - 3;
> +				 hsbyteclk_nsk) - 3;
>  	dev_dbg(dev, "TCLK_POSTCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
>  
>  	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
>  	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
> -				     dsibclk_nsk) - 4;
> +				     hsbyteclk_nsk) - 4;
>  	val = clamp(raw_val, 0, 15);
>  	dev_dbg(dev, "THS_TRAILCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
> @@ -804,11 +804,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
>  
>  	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
> -	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
> -	val = tc358768_ns_to_cnt(val, dsibclk_nsk) / 4 - 1;
> +	val = tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk * 4);
> +	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) / 4 - 1;
>  	dev_dbg(dev, "TXTAGOCNT: %u\n", val);
> -	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
> -				  dsibclk_nsk) - 2;
> +	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk),
> +				  hsbyteclk_nsk) - 2;
>  	dev_dbg(dev, "RXTASURECNT: %u\n", val2);
>  	val = val << 16 | val2;
>  	tc358768_write(priv, TC358768_BTACNTRL1, val);
> @@ -831,13 +831,13 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  		/* hsw * byteclk * ndl / pclk */
>  		val = (u32)div_u64(vm.hsync_len *
> -				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> +				   (u64)hsbyteclk * priv->dsi_lanes,
>  				   vm.pixelclock);
>  		tc358768_write(priv, TC358768_DSI_HSW, val);
>  
>  		/* hbp * byteclk * ndl / pclk */
>  		val = (u32)div_u64(vm.hback_porch *
> -				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> +				   (u64)hsbyteclk * priv->dsi_lanes,
>  				   vm.pixelclock);
>  		tc358768_write(priv, TC358768_DSI_HBPR, val);
>  	} else {
> @@ -856,7 +856,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  		/* (hsw + hbp) * byteclk * ndl / pclk */
>  		val = (u32)div_u64((vm.hsync_len + vm.hback_porch) *
> -				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> +				   (u64)hsbyteclk * priv->dsi_lanes,
>  				   vm.pixelclock);
>  		tc358768_write(priv, TC358768_DSI_HSW, val);
>  
> 

-- 
Péter
