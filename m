Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27924A10338
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEF910E210;
	Tue, 14 Jan 2025 09:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JIoQuhPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505510E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:44:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so54519985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 01:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736847856; x=1737452656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=dvdDzI0+QAZcMVq4vHT+3PeGIs3aadbqB663qDJpMpY=;
 b=JIoQuhPtvjlnvC2QelQMm1T6N5IeYTiDkXviUvUoXAOtGEaFcG6O9+7zOTBjvuJcsx
 82L3Jf9FwnhrRPoXyU92SnZKoFAx91rkh+R/hIMIcD9nxK9DPWacoqtxJo3Vn6plIhn4
 ZC3UgGR1bAzKRJ2STut15uVCg4t2LXJ65e6+vozcEzMvZNDSVHcotclsDPZM0xzcUQDb
 3brqBbVrJkKc+7Z9MCWtBys/tKacjfuWxYho4gO8qIL2YhHFat1BeJcFjwjIrQZdhHVJ
 hnK9SlwYGOnTtIL8UZZoLW9cbh5RP5d16W7tjCqO7QauH/0X+2ENOS9VCrXG2APwcMLY
 mMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736847856; x=1737452656;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dvdDzI0+QAZcMVq4vHT+3PeGIs3aadbqB663qDJpMpY=;
 b=cuCtz9oaB57V6plwBUJsdV+VmYRPSXB98o9bijnKgLjBxC5XmFTFpY1uejyZsfjSWR
 ydG5yH7pUT/EX25jVX2HumVHjok9KFtnm5U5qgGteX66fFnb44mbfMR92V4hIP5CkvBj
 vlnQNoGBH5Pt43dMDasG9GTOWbPszCw5gO/HeiQoqD1ut24Lv4teVRABes44OMyQrjHo
 FpyKsK8LIG61n2lPszxldNJsCCk0PwrS1hYZQW2EcKJepFpxQ4DzbNi4lLXwmUsIBHj0
 bgY0HgjjG+Xl33PLo/Kginzu/hvFT1rF1Jik4nXB2iJp3vDr5H+0Dh72U5k5Rkrd9dU1
 4DEA==
X-Gm-Message-State: AOJu0YySi9PcFUUtbQYallGjEoxOT7ZGx8tPunXc4JrJEqq0no7cJliv
 eFDRZb1YkxzxvZqnN0XUocxOcfzTCEmJCviPMR1OIIGz1Dqa+zzytV4hiXSBUtA=
X-Gm-Gg: ASbGncsukkXXOHJKhh7szaZ9c1r3vQvAPNIHXpQCzIVDI0Cdat/QUH8Wp1cx539BS7d
 aCm/uMFKcg3y0mUvwStfiaKrzDG2S7c792qMzOQhSn0XVlY5Qu/BVbwi6D2D8a4cZXVi36aQI93
 vedYRS5/GhpLe/GPPcAIuSF+JfvjczqIaHFCZaytTDtYwU8hMOxtvSTovZyskcfbT3GEHRjMGfB
 kGiB9CycZQVdyHE2e/56juIxGVjPixIYxY85YCT+n17o2FX5xG+zhuuVxLvp+n88xNOO86nh3od
 u7EmWz45SIWB7FMZvMJByWQoaECCwlKJRQ==
X-Google-Smtp-Source: AGHT+IGEMQzRSU5vsVP1Q6F049dN1Km/Z8NDSTMgd2TrWtE0LlgsHlOnh+81l0FN2f++K7l1tOQrvA==
X-Received: by 2002:a05:600c:a0a:b0:434:ff30:a159 with SMTP id
 5b1f17b1804b1-436e255ded6mr233292645e9.0.1736847855823; 
 Tue, 14 Jan 2025 01:44:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5df:aa69:5642:11b5?
 ([2a01:e0a:982:cbb0:a5df:aa69:5642:11b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc0babsm203233435e9.14.2025.01.14.01.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 01:44:15 -0800 (PST)
Message-ID: <3688ad34-86a2-4762-86ee-cbac8c3b9aa7@linaro.org>
Date: Tue, 14 Jan 2025 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add DataImage FG080016DNCWAG03
 driver support
To: Jonas Rebmann <jre@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20250109-panel-dataimage_fg080016dncwag-v1-0-0465603f6669@pengutronix.de>
 <20250109-panel-dataimage_fg080016dncwag-v1-2-0465603f6669@pengutronix.de>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250109-panel-dataimage_fg080016dncwag-v1-2-0465603f6669@pengutronix.de>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2025 12:34, Jonas Rebmann wrote:
> Add DataImage FG080016DNCWAG03 8" 640x480 TFT LCD panel support.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 222c170dde8be261e98ff41168ef8a3a42c167c8..14d4cf235036cfd662bf16cb794ea2454d6fd2b2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1734,6 +1734,31 @@ static const struct panel_desc dataimage_fg040346dsswbg04 = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing dataimage_fg080016dncwag03_timing = {
> +	.pixelclock = { 24000000, 25000000, 32500000 },
> +	.hactive = { 640, 640, 640 },
> +	.hfront_porch = { 64, 70, 115 },
> +	.hback_porch =  { 64, 70, 115 },
> +	.hsync_len = { 20, 20, 20 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 8, 12, 30 },
> +	.vback_porch =  { 8, 13, 31 },
> +	.vsync_len = { 20, 20, 20 },
> +};
> +
> +static const struct panel_desc dataimage_fg080016dncwag03 = {
> +	.timings = &dataimage_fg080016dncwag03_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct display_timing dataimage_fg1001l0dsswmg01_timing = {
>   	.pixelclock = { 68900000, 71110000, 73400000 },
>   	.hactive = { 1280, 1280, 1280 },
> @@ -4731,6 +4756,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "dataimage,fg040346dsswbg04",
>   		.data = &dataimage_fg040346dsswbg04,
> +	}, {
> +		.compatible = "dataimage,fg080016dncwag03",
> +		.data = &dataimage_fg080016dncwag03,
>   	}, {
>   		.compatible = "dataimage,fg1001l0dsswmg01",
>   		.data = &dataimage_fg1001l0dsswmg01,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
