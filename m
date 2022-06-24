Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B155A090
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D3910F241;
	Fri, 24 Jun 2022 18:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB6310F241
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=VNymKOoqcg3pGTMnfjGRMvDmuCkOCa01F2ZxFC/A6/w=;
 b=W96F2JjHh8CDcsJSZvfKw5C4AGufkvTf+lF8ecT/ZguDNkCJCdIVF/3xcGS5qEXVtkVKA+clvSb0S
 42vavh7CYg9GA9awDHJ9ZUcBaRdc0zunoMdqlPhe/wNWpr/tExfuiI0IXK9Kyk5TvlucCdPw3gg8XE
 eFs7+Pgbbgp6uvmyp7I7MMJdr9THlvG5vj3w0JypQqGumcyxf41cgser+QdAF0wZ8XDzfQz8SzHJaY
 vhv7P74zi1icGvbX2N9ISNw5L84gmWd0AOLdtXm57v+vtw9wfRYGIJUxmfvIYNdcBr0LHBUgs4XK0C
 7p9ztRCzhQRwHFtzPrRyYVFRbpDey5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=VNymKOoqcg3pGTMnfjGRMvDmuCkOCa01F2ZxFC/A6/w=;
 b=1b5J72DSnPYK8nZWg70GlTAiNPwhCRsGn6Xj/QYy6JxRwSLhHbirlBE7WXSYi3R1NhtqiwNoZMBMG
 dxYuiu9AQ==
X-HalOne-Cookie: c7b4917d86e3993e0abb9103ff3df1cade167dbb
X-HalOne-ID: ee825b54-f3e8-11ec-8233-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id ee825b54-f3e8-11ec-8233-d0431ea8bb10;
 Fri, 24 Jun 2022 18:10:30 +0000 (UTC)
Date: Fri, 24 Jun 2022 20:10:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH] drm/bridge: add it6505 driver read config from dt property
Message-ID: <YrX+FOAycejw8wV0@ravnborg.org>
References: <20220623093154.52701-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623093154.52701-1-allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Pin-yen Lin <treapking@google.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi allen.

On Thu, Jun 23, 2022 at 05:31:54PM +0800, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> add read max-lane and max-pixel-clock from dt property
> 
> Signed-off-by: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
Can you fix so your s-o-b mail and author mail matches?
As it is now an error is flagged as they do not match.

	Sam

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 35 ++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 4b673c4792d77..c9121d4635a52 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -436,6 +436,8 @@ struct it6505 {
>  	bool powered;
>  	bool hpd_state;
>  	u32 afe_setting;
> +	u32 max_dpi_pixel_clock;
> +	u32 max_lane_count;
>  	enum hdcp_state hdcp_status;
>  	struct delayed_work hdcp_work;
>  	struct work_struct hdcp_wait_ksv_list;
> @@ -1466,7 +1468,8 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
>  	it6505->lane_count = link->num_lanes;
>  	DRM_DEV_DEBUG_DRIVER(dev, "Sink support %d lanes training",
>  			     it6505->lane_count);
> -	it6505->lane_count = min_t(int, it6505->lane_count, MAX_LANE_COUNT);
> +	it6505->lane_count = min_t(int, it6505->lane_count,
> +				   it6505->max_lane_count);
>  
>  	it6505->branch_device = drm_dp_is_branch(it6505->dpcd);
>  	DRM_DEV_DEBUG_DRIVER(dev, "Sink %sbranch device",
> @@ -2895,7 +2898,7 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		return MODE_NO_INTERLACE;
>  
> -	if (mode->clock > DPI_PIXEL_CLK_MAX)
> +	if (mode->clock > it6505->max_dpi_pixel_clock)
>  		return MODE_CLOCK_HIGH;
>  
>  	it6505->video_info.clock = mode->clock;
> @@ -3057,6 +3060,8 @@ static void it6505_parse_dt(struct it6505 *it6505)
>  {
>  	struct device *dev = &it6505->client->dev;
>  	u32 *afe_setting = &it6505->afe_setting;
> +	u32 *max_lane_count = &it6505->max_lane_count;
> +	u32 *max_dpi_pixel_clock = &it6505->max_dpi_pixel_clock;
>  
>  	it6505->lane_swap_disabled =
>  		device_property_read_bool(dev, "no-laneswap");
> @@ -3072,7 +3077,31 @@ static void it6505_parse_dt(struct it6505 *it6505)
>  	} else {
>  		*afe_setting = 0;
>  	}
> -	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %d", *afe_setting);
> +
> +	if (device_property_read_u32(dev, "max-lane-count",
> +				     max_lane_count) == 0) {
> +		if (*max_lane_count > 4 || *max_lane_count == 3) {
> +			dev_err(dev, "max lane count error, use default");
> +			*max_lane_count = MAX_LANE_COUNT;
> +		}
> +	} else {
> +		*max_lane_count = MAX_LANE_COUNT;
> +	}
> +
> +	if (device_property_read_u32(dev, "max-dpi-pixel-clock",
> +				     max_dpi_pixel_clock) == 0) {
> +		if (*max_dpi_pixel_clock > 297000) {
> +			dev_err(dev, "max pixel clock error, use default");
> +			*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
> +		}
> +	} else {
> +		*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
> +	}
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %u, max_lane_count: %u",
> +			     it6505->afe_setting, it6505->max_lane_count);
> +	DRM_DEV_DEBUG_DRIVER(dev, "using max_dpi_pixel_clock: %u kHz",
> +			     it6505->max_dpi_pixel_clock);
>  }
>  
>  static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
> -- 
> 2.25.1
