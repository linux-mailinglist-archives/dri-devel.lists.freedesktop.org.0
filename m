Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18A7794CD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DD710E6BC;
	Fri, 11 Aug 2023 16:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F095110E6BC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:37:50 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9a2033978so33683411fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771869; x=1692376669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NND7NF45Mat5445hBe3XsfwCjYWL+emdbSloqhpsh0A=;
 b=sHAdkddqvt7TXqcvI+FxmzyRmaggkP/CEV0glQCnbdrvzSm4hbBmWp6ucVO8KkHzr5
 IPuuC0541NikOM/+8miJQVzX3KenSslyr0uWWE2PQxuKFrBw0lB6qgJo2K8YHna0Vabv
 8ELqptldZn/C6jQLdGxfkCOtJtKIwTS91aCMHhr6UR4UNymwpv3Uu3qlqjJ9zVlLvaXb
 6r4VOJ6AUX/bqM7c6eDvPFrR8ExzXRmasCSSCXWfx0V5BPVEDQRT/lckBElZbYK3b0Cw
 hjDMZMcGwuLf2bufZdW/EwX3rax5GqyY5GNVghwDqX9gzwu4m1s9LIr/ojJg0RZ2H4iA
 n3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771869; x=1692376669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NND7NF45Mat5445hBe3XsfwCjYWL+emdbSloqhpsh0A=;
 b=QWwgbjIjdo7Pkd4coF4lIuEKl9qgO5Ba6PGx+aJd/CU+GR+3gOHAAo+a3oo3fNEdaA
 gNFf7mH6QXJrFkZdma7OugHbCXLM2vAByt3DR4Ty0mteA/a/iwrZTg2SoMWVP4aAPn90
 z9+Snc1t5y29p7EuSeLAr5QR2xoqQ7x3crJJjt66N7AoVvVh7VOgRiV1WPTHk7CbVNO0
 KIbXmzqAzz/r5WFAu6rS9ANQshV0fNOyJ1nMa/yIXpE//jZwIXmCDKUIPs6nMKYcZJf4
 3We3pD5L3Yvq2+DK1UHu9wE+/udSPwl7JMRbZQ8T4yC0gR88L7IQ0wPZzdhCFrzMSlGh
 VXaA==
X-Gm-Message-State: AOJu0YxnnTRw/mGyE24rWpsI96E9Aot3xXz8Dl6v1DTlWPBmdO2VIt0I
 V2CPaCSgilNVnxRt9NbCEc0=
X-Google-Smtp-Source: AGHT+IFbF4bS8FC62q3qOlDdEVetuIuL9kWgw/JG6SdeoUSPdhQ5dIuzJEweXfoaWFSnZ3V/uygvZg==
X-Received: by 2002:a2e:8790:0:b0:2b9:cd79:8f94 with SMTP id
 n16-20020a2e8790000000b002b9cd798f94mr2050058lji.39.1691771868889; 
 Fri, 11 Aug 2023 09:37:48 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 u8-20020a2e9b08000000b002b6ef2fca66sm946383lji.41.2023.08.11.09.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:37:48 -0700 (PDT)
Message-ID: <81238735-3727-451c-acc0-703bba7ecff5@gmail.com>
Date: Fri, 11 Aug 2023 19:39:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/bridge: tc358768: Attempt to fix DSI horizontal
 timings
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-10-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-10-1afd44b7826b@ideasonboard.com>
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
> The DSI horizontal timing calculations done by the driver seem to often
> lead to underflows or overflows, depending on the videomode.
> 
> There are two main things the current driver doesn't seem to get right:
> DSI HSW and HFP, and VSDly. However, even following Toshiba's
> documentation it seems we don't always get a working display.
> 
> This patch attempts to fix the horizontal timings for DSI event mode, and
> on a system with a DSI->HDMI encoder, a lot of standard HDMI modes now
> seem to work. The work relies on Toshiba's documentation, but also quite
> a bit on empirical testing.
> 
> This also adds timing related debug prints to make it easier to improve
> on this later.
> 
> The DSI pulse mode has only been tested with a fixed-resolution panel,
> which limits the testing of different modes on DSI pulse mode. However,
> as the VSDly calculation also affects pulse mode, so this might cause a
> regression.

If my memory serves me right we only had this used in a sinlge, static
configuration and again, it might be mentioned in a comment somewhere?

Nice work!

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 211 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 183 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index dc2241c18dde..ea19de5509ed 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -9,6 +9,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> @@ -157,6 +158,7 @@ struct tc358768_priv {
>  	u32 frs;	/* PLL Freqency range for HSCK (post divider) */
>  
>  	u32 dsiclk;	/* pll_clk / 2 */
> +	u32 pclk;	/* incoming pclk rate */
>  };
>  
>  static inline struct tc358768_priv *dsi_host_to_tc358768(struct mipi_dsi_host
> @@ -380,6 +382,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
>  	priv->prd = best_prd;
>  	priv->frs = frs;
>  	priv->dsiclk = best_pll / 2;
> +	priv->pclk = mode->clock * 1000;
>  
>  	return 0;
>  }
> @@ -638,6 +641,28 @@ static u32 tc358768_ps_to_ns(u32 ps)
>  	return ps / 1000;
>  }
>  
> +static u32 tc358768_dpi_to_ns(u32 val, u32 pclk)
> +{
> +	return (u32)div_u64((u64)val * NANO, pclk);
> +}
> +
> +/* Convert value in DPI pixel clock units to DSI byte count */
> +static u32 tc358768_dpi_to_dsi_bytes(struct tc358768_priv *priv, u32 val)
> +{
> +	u64 m = (u64)val * priv->dsiclk / 4 * priv->dsi_lanes;
> +	u64 n = priv->pclk;
> +
> +	return (u32)div_u64(m + n - 1, n);
> +}
> +
> +static u32 tc358768_dsi_bytes_to_ns(struct tc358768_priv *priv, u32 val)
> +{
> +	u64 m = (u64)val * NANO;
> +	u64 n = priv->dsiclk / 4 * priv->dsi_lanes;
> +
> +	return (u32)div_u64(m, n);
> +}
> +
>  static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  {
>  	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
> @@ -647,11 +672,19 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	s32 raw_val;
>  	const struct drm_display_mode *mode;
>  	u32 hsbyteclk_ps, dsiclk_ps, ui_ps;
> -	u32 dsiclk, hsbyteclk, video_start;
> -	const u32 internal_delay = 40;
> +	u32 dsiclk, hsbyteclk;
>  	int ret, i;
>  	struct videomode vm;
>  	struct device *dev = priv->dev;
> +	/* In pixelclock units */
> +	u32 dpi_htot, dpi_data_start;
> +	/* In byte units */
> +	u32 dsi_dpi_htot, dsi_dpi_data_start;
> +	u32 dsi_hsw, dsi_hbp, dsi_hact, dsi_hfp;
> +	const u32 dsi_hss = 4; /* HSS is a short packet (4 bytes) */
> +	/* In hsbyteclk units */
> +	u32 dsi_vsdly;
> +	const u32 internal_dly = 40;
>  
>  	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
>  		dev_warn_once(dev, "Non-continuous mode unimplemented, falling back to continuous\n");
> @@ -686,27 +719,23 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	case MIPI_DSI_FMT_RGB888:
>  		val |= (0x3 << 4);
>  		hact = vm.hactive * 3;
> -		video_start = (vm.hsync_len + vm.hback_porch) * 3;
>  		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
>  		break;
>  	case MIPI_DSI_FMT_RGB666:
>  		val |= (0x4 << 4);
>  		hact = vm.hactive * 3;
> -		video_start = (vm.hsync_len + vm.hback_porch) * 3;
>  		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
>  		break;
>  
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  		val |= (0x4 << 4) | BIT(3);
>  		hact = vm.hactive * 18 / 8;
> -		video_start = (vm.hsync_len + vm.hback_porch) * 18 / 8;
>  		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
>  		break;
>  
>  	case MIPI_DSI_FMT_RGB565:
>  		val |= (0x5 << 4);
>  		hact = vm.hactive * 2;
> -		video_start = (vm.hsync_len + vm.hback_porch) * 2;
>  		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
>  		break;
>  	default:
> @@ -716,9 +745,150 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		return;
>  	}
>  
> +	/*
> +	 * There are three important things to make TC358768 work correctly,
> +	 * which are not trivial to manage:
> +	 *
> +	 * 1. Keep the DPI line-time and the DSI line-time as close to each
> +	 *    other as possible.
> +	 * 2. TC358768 goes to LP mode after each line's active area. The DSI
> +	 *    HFP period has to be long enough for entering and exiting LP mode.
> +	 *    But it is not clear how to calculate this.
> +	 * 3. VSDly (video start delay) has to be long enough to ensure that the
> +	 *    DSI TX does not start transmitting util we have started receiving
> +	 *    pixel data from the DPI input. It is not clear how to calculate
> +	 *    this either.
> +	 */
> +
> +	dpi_htot = vm.hactive + vm.hfront_porch + vm.hsync_len + vm.hback_porch;
> +	dpi_data_start = vm.hsync_len + vm.hback_porch;
> +
> +	dev_dbg(dev, "dpi horiz timing (pclk): %u + %u + %u + %u = %u\n",
> +		vm.hsync_len, vm.hback_porch, vm.hactive, vm.hfront_porch,
> +		dpi_htot);
> +
> +	dev_dbg(dev, "dpi horiz timing (ns): %u + %u + %u + %u = %u\n",
> +		tc358768_dpi_to_ns(vm.hsync_len, vm.pixelclock),
> +		tc358768_dpi_to_ns(vm.hback_porch, vm.pixelclock),
> +		tc358768_dpi_to_ns(vm.hactive, vm.pixelclock),
> +		tc358768_dpi_to_ns(vm.hfront_porch, vm.pixelclock),
> +		tc358768_dpi_to_ns(dpi_htot, vm.pixelclock));
> +
> +	dev_dbg(dev, "dpi data start (ns): %u + %u = %u\n",
> +		tc358768_dpi_to_ns(vm.hsync_len, vm.pixelclock),
> +		tc358768_dpi_to_ns(vm.hback_porch, vm.pixelclock),
> +		tc358768_dpi_to_ns(dpi_data_start, vm.pixelclock));
> +
> +	dsi_dpi_htot = tc358768_dpi_to_dsi_bytes(priv, dpi_htot);
> +	dsi_dpi_data_start = tc358768_dpi_to_dsi_bytes(priv, dpi_data_start);
> +
> +	if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
> +		dsi_hsw = tc358768_dpi_to_dsi_bytes(priv, vm.hsync_len);
> +		dsi_hbp = tc358768_dpi_to_dsi_bytes(priv, vm.hback_porch);
> +	} else {
> +		/* HBP is included in HSW in event mode */
> +		dsi_hbp = 0;
> +		dsi_hsw = tc358768_dpi_to_dsi_bytes(priv,
> +			vm.hsync_len + vm.hback_porch);
> +
> +		/*
> +		 * The pixel packet includes the actual pixel data, and:
> +		 * DSI packet header = 4 bytes
> +		 * DCS code = 1 byte
> +		 * DSI packet footer = 2 bytes
> +		 */
> +		dsi_hact = hact + 4 + 1 + 2;
> +
> +		dsi_hfp = dsi_dpi_htot - dsi_hact - dsi_hsw - dsi_hss;
> +
> +		/*
> +		 * Here we should check if HFP is long enough for entering LP
> +		 * and exiting LP, but it's not clear how to calculate that.
> +		 * Instead, this is a naive algorithm that just adjusts the HFP
> +		 * and HSW so that HFP is (at least) roughly 2/3 of the total
> +		 * blanking time.
> +		 */
> +		if (dsi_hfp < (dsi_hfp + dsi_hsw + dsi_hss) * 2 / 3) {
> +			u32 old_hfp = dsi_hfp;
> +			u32 old_hsw = dsi_hsw;
> +			u32 tot = dsi_hfp + dsi_hsw + dsi_hss;
> +
> +			dsi_hsw = tot / 3;
> +
> +			/*
> +			 * Seems like sometimes HSW has to be divisible by num-lanes, but
> +			 * not always...
> +			 */
> +			dsi_hsw = roundup(dsi_hsw, priv->dsi_lanes);
> +
> +			dsi_hfp = dsi_dpi_htot - dsi_hact - dsi_hsw - dsi_hss;
> +
> +			dev_dbg(dev,
> +				"hfp too short, adjusting dsi hfp and dsi hsw from %u, %u to %u, %u\n",
> +				old_hfp, old_hsw, dsi_hfp, dsi_hsw);
> +		}
> +
> +		dev_dbg(dev,
> +			"dsi horiz timing (bytes): %u, %u + %u + %u + %u = %u\n",
> +			dsi_hss, dsi_hsw, dsi_hbp, dsi_hact, dsi_hfp,
> +			dsi_hss + dsi_hsw + dsi_hbp + dsi_hact + dsi_hfp);
> +
> +		dev_dbg(dev, "dsi horiz timing (ns): %u + %u + %u + %u + %u = %u\n",
> +			tc358768_dsi_bytes_to_ns(priv, dsi_hss),
> +			tc358768_dsi_bytes_to_ns(priv, dsi_hsw),
> +			tc358768_dsi_bytes_to_ns(priv, dsi_hbp),
> +			tc358768_dsi_bytes_to_ns(priv, dsi_hact),
> +			tc358768_dsi_bytes_to_ns(priv, dsi_hfp),
> +			tc358768_dsi_bytes_to_ns(priv, dsi_hss + dsi_hsw + dsi_hbp + dsi_hact + dsi_hfp));
> +	}
> +
> +	/* VSDly calculation */
> +
> +	/* Start with the HW internal delay */
> +	dsi_vsdly = internal_dly;
> +
> +	/* Convert to byte units as the other variables are in byte units */
> +	dsi_vsdly *= priv->dsi_lanes;
> +
> +	/* Do we need more delay, in addition to the internal? */
> +	if (dsi_dpi_data_start > dsi_vsdly + dsi_hss + dsi_hsw + dsi_hbp) {
> +		dsi_vsdly = dsi_dpi_data_start - dsi_hss - dsi_hsw - dsi_hbp;
> +		dsi_vsdly = roundup(dsi_vsdly, priv->dsi_lanes);
> +	}
> +
> +	dev_dbg(dev, "dsi data start (bytes) %u + %u + %u + %u = %u\n",
> +		dsi_vsdly, dsi_hss, dsi_hsw, dsi_hbp,
> +		dsi_vsdly + dsi_hss + dsi_hsw + dsi_hbp);
> +
> +	dev_dbg(dev, "dsi data start (ns) %u + %u + %u + %u = %u\n",
> +		tc358768_dsi_bytes_to_ns(priv, dsi_vsdly),
> +		tc358768_dsi_bytes_to_ns(priv, dsi_hss),
> +		tc358768_dsi_bytes_to_ns(priv, dsi_hsw),
> +		tc358768_dsi_bytes_to_ns(priv, dsi_hbp),
> +		tc358768_dsi_bytes_to_ns(priv, dsi_vsdly + dsi_hss + dsi_hsw + dsi_hbp));
> +
> +	/* Convert back to hsbyteclk */
> +	dsi_vsdly /= priv->dsi_lanes;
> +
> +	/*
> +	 * The docs say that there is an internal delay of 40 cycles.
> +	 * However, we get underflows if we follow that rule. If we
> +	 * instead ignore the internal delay, things work. So either
> +	 * the docs are wrong or the calculations are wrong.
> +	 *
> +	 * As a temporary fix, add the internal delay here, to counter
> +	 * the subtraction when writing the register.
> +	 */
> +	dsi_vsdly += internal_dly;
> +
> +	/* Clamp to the register max */
> +	if (dsi_vsdly - internal_dly > 0x3ff) {
> +		dev_warn(dev, "VSDly too high, underflows likely\n");
> +		dsi_vsdly = 0x3ff + internal_dly;
> +	}
> +
>  	/* VSDly[9:0] */
> -	video_start = max(video_start, internal_delay + 1) - internal_delay;
> -	tc358768_write(priv, TC358768_VSDLY, video_start);
> +	tc358768_write(priv, TC358768_VSDLY, dsi_vsdly - internal_dly);
>  
>  	tc358768_write(priv, TC358768_DATAFMT, val);
>  	tc358768_write(priv, TC358768_DSITX_DT, data_type);
> @@ -826,18 +996,6 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  		/* vbp */
>  		tc358768_write(priv, TC358768_DSI_VBPR, vm.vback_porch);
> -
> -		/* hsw * byteclk * ndl / pclk */
> -		val = (u32)div_u64(vm.hsync_len *
> -				   (u64)hsbyteclk * priv->dsi_lanes,
> -				   vm.pixelclock);
> -		tc358768_write(priv, TC358768_DSI_HSW, val);
> -
> -		/* hbp * byteclk * ndl / pclk */
> -		val = (u32)div_u64(vm.hback_porch *
> -				   (u64)hsbyteclk * priv->dsi_lanes,
> -				   vm.pixelclock);
> -		tc358768_write(priv, TC358768_DSI_HBPR, val);
>  	} else {
>  		/* Set event mode */
>  		tc358768_write(priv, TC358768_DSI_EVENT, 1);
> @@ -851,16 +1009,13 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  		/* vbp (not used in event mode) */
>  		tc358768_write(priv, TC358768_DSI_VBPR, 0);
> +	}
>  
> -		/* (hsw + hbp) * byteclk * ndl / pclk */
> -		val = (u32)div_u64((vm.hsync_len + vm.hback_porch) *
> -				   (u64)hsbyteclk * priv->dsi_lanes,
> -				   vm.pixelclock);
> -		tc358768_write(priv, TC358768_DSI_HSW, val);
> +	/* hsw (bytes) */
> +	tc358768_write(priv, TC358768_DSI_HSW, dsi_hsw);
>  
> -		/* hbp (not used in event mode) */
> -		tc358768_write(priv, TC358768_DSI_HBPR, 0);
> -	}
> +	/* hbp (bytes) */
> +	tc358768_write(priv, TC358768_DSI_HBPR, dsi_hbp);
>  
>  	/* hact (bytes) */
>  	tc358768_write(priv, TC358768_DSI_HACT, hact);
> 

-- 
Péter
