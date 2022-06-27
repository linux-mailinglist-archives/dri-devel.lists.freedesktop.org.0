Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB355B97A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2AB10EC81;
	Mon, 27 Jun 2022 12:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3728310EC81
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:18:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q9so12790350wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1g17xM8gnJx00whU//iJuDwTqW1vNMfdEO12lxgIMRg=;
 b=nnRWhRQQn7M0KwLCecW+Y+EkDq9bIjiupyRwyOtlwv8MrNFBuARr4zHKZSKrIsTIJ3
 0gVSH/b6ge/jCVktMQDQ9QJX+6tNNIRN2Q/t/GUu+KI1gIxGwHNo1WhQnFKh8HiSn/X7
 T9D3s0EQPQHzZgXuF2Z8RgB64TURRpe8MnzR8VF+xLoTuDZUpN1v3nXW1GmVcbNvzJWO
 EI6NRPO7CBAKwlqTVeEdrnJn5pTXP6yzTXLbxSZ3AdWKHH6s6ZEKXdHUDRpzyqTh0l5l
 B3vZkhEahSCbwj8OTzKuyLIElzg+4OYLundvzQmrZ8/Na3/9XU2mD6yo5y6mawwpE/E2
 CItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1g17xM8gnJx00whU//iJuDwTqW1vNMfdEO12lxgIMRg=;
 b=ceCnkiMSqQBzNeY+q2SVeExJwypmRmnIMflFeY8oDRYu9jDXqwnt51yDyMFHLAJHpK
 cv9802cqHZCGxWYSMkn64BbBO9Sn57nOMXxL8akFZ1n+4sx/EWdnkR9x1sE3+K4+tXJJ
 G+7GXFc8bA6Z+p+I9JJ/7TEddftZoM9PcgoYkbJpnRl56q+n876Fis5IsMItZUW6d6Jh
 PNuhc/AcX/bvL79Br5EEnidpdNti/YVLPY68qHRESJXW2obhANYceyo1s/oIQKzeOVpz
 k2YCUuKGgofn7oDxzH3F5mZiyT8W8C3AZUnLVdRFUKaD3Up0xvyolzf8OY6VhOmMbt2B
 Q4gQ==
X-Gm-Message-State: AJIora/dO07uibHXL+a3ZN8BGM0hrER52aBXLFhIIPQdb7oVsADsz3r8
 APpSqtVHHEyxeIyV0Q5igHofdQ==
X-Google-Smtp-Source: AGRyM1u4TP5LCca8253ru9d3GMUu8AESPz11A5pMqCmyN2YYdwnSPSoviXwuo6a+AgFlUTtD0v38Tg==
X-Received: by 2002:a5d:69cd:0:b0:21b:a9a2:e6e2 with SMTP id
 s13-20020a5d69cd000000b0021ba9a2e6e2mr12114876wrw.332.1656332338290; 
 Mon, 27 Jun 2022 05:18:58 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c?
 ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
 by smtp.gmail.com with ESMTPSA id
 ay4-20020a05600c1e0400b003a047dccfffsm5564078wmb.42.2022.06.27.05.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 05:18:57 -0700 (PDT)
Message-ID: <19a3fd3b-ec9a-6b8e-5a79-46ff13f8f4e5@baylibre.com>
Date: Mon, 27 Jun 2022 14:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/bridge: add it6505 driver read config from dt property
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20220627054038.18600-1-allen.chen@ite.com.tw>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220627054038.18600-1-allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2022 07:40, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> add read max-lane and max-pixel-clock from dt property

Those 2 properties should be documented first in the DT bindings.

Neil

> 
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
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
>   }
>   
>   static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,

