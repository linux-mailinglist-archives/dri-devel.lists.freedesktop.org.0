Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C553955B99F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F4811A514;
	Mon, 27 Jun 2022 12:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968B11A502
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:55:35 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 14261660178D;
 Mon, 27 Jun 2022 13:55:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656334533;
 bh=ifdpDVxFAJ7x6mxjxCa3kTl2O13CzEnu51wJDDLj6yY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RyIN62IlNGKr46nFhj1YIqMhkUGQA5IpK/U7l43Krbqfr1kdu0XwcBrWz/6/2uwvx
 SKOWM6L2frNS1rf/I1Bl2/V14E6B2P34q/WCw4ZiIZWUJJtLK2Dqgm3IIZHo2/2a9I
 BUNNlbpAaT6821/KUUXllBkfX8H3dKMtFWfMQlNE6O4GPj94f+aMBwCoEejB/0muHR
 a55UMYRUGRXWBdpe95SIRu13607xv7YY/qQXnQw70/T0dZnL1nDtgI2E6YobpgXWMT
 AiiX+KvNvYjxJfBdz85+RVYBnM7/fqY/MifNQmUTJl922YDOAZaaVm1o/uLKtcj7n7
 Syo3ePm5kq9qQ==
Message-ID: <7f565036-df78-a4e7-db5e-259115daaf79@collabora.com>
Date: Mon, 27 Jun 2022 14:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/bridge: add it6505 driver read config from dt property
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20220623093154.52701-1-allen.chen@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220623093154.52701-1-allen.chen@ite.com.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Pin-yen Lin <treapking@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/06/22 11:31, allen ha scritto:
> From: allen chen <allen.chen@ite.com.tw>
> 
> add read max-lane and max-pixel-clock from dt property
> 
> Signed-off-by: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Hello Allen,

as Sam also pointed out, please fix your S-o-b email: it has to match with the
author one.

Anyway, you're adding devicetree properties, so this implies that you should
also change the dt-bindings documentation for this driver... and also, I have
some more comments, check below:

> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 35 ++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 4b673c4792d77..c9121d4635a52 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -436,6 +436,8 @@ struct it6505 {
>   	bool powered;
>   	bool hpd_state;
>   	u32 afe_setting;
> +	u32 max_dpi_pixel_clock;
> +	u32 max_lane_count;
>   	enum hdcp_state hdcp_status;
>   	struct delayed_work hdcp_work;
>   	struct work_struct hdcp_wait_ksv_list;
> @@ -1466,7 +1468,8 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
>   	it6505->lane_count = link->num_lanes;
>   	DRM_DEV_DEBUG_DRIVER(dev, "Sink support %d lanes training",
>   			     it6505->lane_count);
> -	it6505->lane_count = min_t(int, it6505->lane_count, MAX_LANE_COUNT);
> +	it6505->lane_count = min_t(int, it6505->lane_count,
> +				   it6505->max_lane_count);
>   
>   	it6505->branch_device = drm_dp_is_branch(it6505->dpcd);
>   	DRM_DEV_DEBUG_DRIVER(dev, "Sink %sbranch device",
> @@ -2895,7 +2898,7 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
>   	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>   		return MODE_NO_INTERLACE;
>   
> -	if (mode->clock > DPI_PIXEL_CLK_MAX)
> +	if (mode->clock > it6505->max_dpi_pixel_clock)
>   		return MODE_CLOCK_HIGH;
>   
>   	it6505->video_info.clock = mode->clock;
> @@ -3057,6 +3060,8 @@ static void it6505_parse_dt(struct it6505 *it6505)
>   {
>   	struct device *dev = &it6505->client->dev;
>   	u32 *afe_setting = &it6505->afe_setting;
> +	u32 *max_lane_count = &it6505->max_lane_count;
> +	u32 *max_dpi_pixel_clock = &it6505->max_dpi_pixel_clock;
>   
>   	it6505->lane_swap_disabled =
>   		device_property_read_bool(dev, "no-laneswap");
> @@ -3072,7 +3077,31 @@ static void it6505_parse_dt(struct it6505 *it6505)
>   	} else {
>   		*afe_setting = 0;
>   	}
> -	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %d", *afe_setting);
> +
> +	if (device_property_read_u32(dev, "max-lane-count",

Please use the standard property "data-lanes" from video-interfaces.yaml.

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

What about "max-pixel-clock-khz" or "max-pixel-clock-hz"?


Regards,
Angelo
