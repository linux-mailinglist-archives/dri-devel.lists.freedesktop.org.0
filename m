Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4767794AD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8903810E6B9;
	Fri, 11 Aug 2023 16:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4172110E6B9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:32:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so3338184e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771556; x=1692376356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FrfL56TyCY4na0T3YX6sx+B3cz9RIWCnEOQz7EOwBTE=;
 b=iEUBp0Oj4Z81wOm7lX02dtEWmQEi8P1CdQTGEMOje3nQrogXihjHZ/fHeyG4S55O1s
 gefin8lNJg78sW2/zuLBaW2xQJnscYCKHOTTTK/45xmPLnng2MOxBDlwJY2PU5/OAAFq
 QDTD8lfhUDNTaeecGE+CGt8B0qiYh6oUTJYoKGxj8cwPvZmAGmdnzYXHZeI1ISjxEC1m
 nK/j4R5yXOgEr+2VjTk6hu8+W/ziNt6cwbhuelF690YmrlSo6NTyLFkOA75puV3jmEiE
 p3761MHvixjIjIdDbKIYFSI9nG+L1ZqvWdyDiG0tN/pd4/k+MaboIr9Akt10XuLX2GuO
 XUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771556; x=1692376356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FrfL56TyCY4na0T3YX6sx+B3cz9RIWCnEOQz7EOwBTE=;
 b=UC+M9XtOurpQIG2TyEgjiqTTdxTOo8M9To+IM84KMkOGp9vdw0KdPDTg2t86PdL5Fw
 kOhDLBjEQrAFPfCJ8yPertbuPxnfYzSfSM91m5iml62GXL9wYXmzIJM11k+jcaxUq169
 sKlxdHGePldIbWiEfNbfCxZuePfJvkVQCzqJO8E3grFme/UOtLHNxUXT8wlNnn54mSs7
 Lt8Mj/7O1sVimj+qlkjgkNinpMjAwa5DonDGWzL0M37+Wg+9S0Gndeif9fVbzBpjksu9
 +wIIlNLCrmcNq+/DpfjH38qD84gOsOJ093NM4Ecr/tTwG1WTh2IpFVC1F/mqEve+4S7v
 mXLw==
X-Gm-Message-State: AOJu0Yy+lHg2nRGu6AWT9mPp7yC9IkPyve3fvCdLFrEQv04kCabiqZ+F
 ju53RUniHT7VGYnE2DWnr1U=
X-Google-Smtp-Source: AGHT+IGqCyZ/rxE07VJDtBD0SAhiMMNBA3228HIx/5IZEAVy9RJypT8jxl2RkdKijLrs9MAMB8CwHA==
X-Received: by 2002:a05:6512:10d4:b0:4fe:25bc:71f5 with SMTP id
 k20-20020a05651210d400b004fe25bc71f5mr2088012lfg.11.1691771556162; 
 Fri, 11 Aug 2023 09:32:36 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 a5-20020a19f805000000b004fb9536bc99sm778839lff.169.2023.08.11.09.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:32:35 -0700 (PDT)
Message-ID: <e42c3362-ece3-4070-b237-c4f4e8185408@gmail.com>
Date: Fri, 11 Aug 2023 19:34:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/bridge: tc358768: Clean up clock period code
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-8-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-8-1afd44b7826b@ideasonboard.com>
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
> The driver defines TC358768_PRECISION as 1000, and uses "nsk" to refer
> to clock periods. The original author does not remember where all this
> came from.

I can confirm this!

> Effectively the driver is using picoseconds as the unit for
> clock periods, yet referring to them by "nsk".
> 
> Clean this up by just saying the periods are in picoseconds.

Thanks,

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 60 +++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index db45b4a982c0..9411b0fb471e 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -15,6 +15,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/units.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> @@ -627,15 +628,14 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
>  	return tc358768_clear_error(priv);
>  }
>  
> -#define TC358768_PRECISION	1000
> -static u32 tc358768_ns_to_cnt(u32 ns, u32 period_nsk)
> +static u32 tc358768_ns_to_cnt(u32 ns, u32 period_ps)
>  {
> -	return (ns * TC358768_PRECISION + period_nsk) / period_nsk;
> +	return (ns * 1000 + period_ps) / period_ps;
>  }
>  
> -static u32 tc358768_to_ns(u32 nsk)
> +static u32 tc358768_ps_to_ns(u32 ps)
>  {
> -	return (nsk / TC358768_PRECISION);
> +	return ps / 1000;
>  }
>  
>  static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
> @@ -646,7 +646,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	u32 val, val2, lptxcnt, hact, data_type;
>  	s32 raw_val;
>  	const struct drm_display_mode *mode;
> -	u32 hsbyteclk_nsk, dsiclk_nsk, ui_nsk;
> +	u32 hsbyteclk_ps, dsiclk_ps, ui_ps;
>  	u32 dsiclk, hsbyteclk, video_start;
>  	const u32 internal_delay = 40;
>  	int ret, i;
> @@ -730,67 +730,65 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		tc358768_write(priv, TC358768_D0W_CNTRL + i * 4, 0x0000);
>  
>  	/* DSI Timings */
> -	hsbyteclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION,
> -				  hsbyteclk);
> -	dsiclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION, dsiclk);
> -	ui_nsk = dsiclk_nsk / 2;
> -	dev_dbg(dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
> -	dev_dbg(dev, "ui_nsk: %u\n", ui_nsk);
> -	dev_dbg(dev, "hsbyteclk_nsk: %u\n", hsbyteclk_nsk);
> +	hsbyteclk_ps = (u32)div_u64(PICO, hsbyteclk);
> +	dsiclk_ps = (u32)div_u64(PICO, dsiclk);
> +	ui_ps = dsiclk_ps / 2;
> +	dev_dbg(dev, "dsiclk: %u ps, ui %u ps, hsbyteclk %u ps\n", dsiclk_ps,
> +		ui_ps, hsbyteclk_ps);
>  
>  	/* LP11 > 100us for D-PHY Rx Init */
> -	val = tc358768_ns_to_cnt(100 * 1000, hsbyteclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(100 * 1000, hsbyteclk_ps) - 1;
>  	dev_dbg(dev, "LINEINITCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_LINEINITCNT, val);
>  
>  	/* LPTimeCnt > 50ns */
> -	val = tc358768_ns_to_cnt(50, hsbyteclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(50, hsbyteclk_ps) - 1;
>  	lptxcnt = val;
>  	dev_dbg(dev, "LPTXTIMECNT: %u\n", val);
>  	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
>  
>  	/* 38ns < TCLK_PREPARE < 95ns */
> -	val = tc358768_ns_to_cnt(65, hsbyteclk_nsk) - 1;
> +	val = tc358768_ns_to_cnt(65, hsbyteclk_ps) - 1;
>  	dev_dbg(dev, "TCLK_PREPARECNT %u\n", val);
>  	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
> -	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
> -				  hsbyteclk_nsk) - 2;
> +	val2 = tc358768_ns_to_cnt(300 - tc358768_ps_to_ns(2 * ui_ps),
> +				  hsbyteclk_ps) - 2;
>  	dev_dbg(dev, "TCLK_ZEROCNT %u\n", val2);
>  	val |= val2 << 8;
>  	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
>  
>  	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
> -	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), hsbyteclk_nsk) - 5;
> +	raw_val = tc358768_ns_to_cnt(60 + tc358768_ps_to_ns(2 * ui_ps), hsbyteclk_ps) - 5;
>  	val = clamp(raw_val, 0, 127);
>  	dev_dbg(dev, "TCLK_TRAILCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
>  
>  	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
> -	val = 50 + tc358768_to_ns(4 * ui_nsk);
> -	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) - 1;
> +	val = 50 + tc358768_ps_to_ns(4 * ui_ps);
> +	val = tc358768_ns_to_cnt(val, hsbyteclk_ps) - 1;
>  	dev_dbg(dev, "THS_PREPARECNT %u\n", val);
>  	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
> -	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), hsbyteclk_nsk) - 10;
> +	raw_val = tc358768_ns_to_cnt(145 - tc358768_ps_to_ns(3 * ui_ps), hsbyteclk_ps) - 10;
>  	val2 = clamp(raw_val, 0, 127);
>  	dev_dbg(dev, "THS_ZEROCNT %u\n", val2);
>  	val |= val2 << 8;
>  	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
>  
>  	/* TWAKEUP > 1ms in lptxcnt steps */
> -	val = tc358768_ns_to_cnt(1020000, hsbyteclk_nsk);
> +	val = tc358768_ns_to_cnt(1020000, hsbyteclk_ps);
>  	val = val / (lptxcnt + 1) - 1;
>  	dev_dbg(dev, "TWAKEUP: %u\n", val);
>  	tc358768_write(priv, TC358768_TWAKEUP, val);
>  
>  	/* TCLK_POSTCNT > 60ns + 52*UI */
> -	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
> -				 hsbyteclk_nsk) - 3;
> +	val = tc358768_ns_to_cnt(60 + tc358768_ps_to_ns(52 * ui_ps),
> +				 hsbyteclk_ps) - 3;
>  	dev_dbg(dev, "TCLK_POSTCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
>  
>  	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
> -	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
> -				     hsbyteclk_nsk) - 4;
> +	raw_val = tc358768_ns_to_cnt(60 + tc358768_ps_to_ns(18 * ui_ps),
> +				     hsbyteclk_ps) - 4;
>  	val = clamp(raw_val, 0, 15);
>  	dev_dbg(dev, "THS_TRAILCNT: %u\n", val);
>  	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
> @@ -804,11 +802,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
>  
>  	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
> -	val = tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk * 4);
> -	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) / 4 - 1;
> +	val = tc358768_ps_to_ns((lptxcnt + 1) * hsbyteclk_ps * 4);
> +	val = tc358768_ns_to_cnt(val, hsbyteclk_ps) / 4 - 1;
>  	dev_dbg(dev, "TXTAGOCNT: %u\n", val);
> -	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk),
> -				  hsbyteclk_nsk) - 2;
> +	val2 = tc358768_ns_to_cnt(tc358768_ps_to_ns((lptxcnt + 1) * hsbyteclk_ps),
> +				  hsbyteclk_ps) - 2;
>  	dev_dbg(dev, "RXTASURECNT: %u\n", val2);
>  	val = val << 16 | val2;
>  	tc358768_write(priv, TC358768_BTACNTRL1, val);
> 

-- 
Péter
