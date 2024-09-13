Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04EF977A91
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE3610E1D9;
	Fri, 13 Sep 2024 08:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IXHuINX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633E10E1D9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:04:56 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42bbffe38e6so14913035e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214695; x=1726819495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tN0f5KnLz0Fgv6Uw4PEqovbRdCu6k+vdYOILHvBPqH8=;
 b=IXHuINX54WuTN9TQtsfQTt/zdG+99bPKKpKv5Wg9kv1S2oo3vsds3cKtcLcA+fhars
 3xI3A03Iiqauow7jLfvP1+kdsoypfKm+ZPROXuBuP6e+UUaQF4WXGicOgo9VH+VyOSoW
 lLiA6Lk6yKyTxKmsyhovMINMBUbIt9jYwHr513eIU/e793kjjT1djvY322BkQh9lijiq
 L6fYn+K6UhHsC0J6hPRR8z5MgOIfLXcqVgLV8blx3/lj/QQwL86951wfp7ooEDqFNITJ
 YFjtQw7C1wRd2GzS7y7nNNiUDCmcK8WJA6lMVgCSGM1hkvcVeOFdcWZ2iZhAD77oRcA0
 MS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214695; x=1726819495;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tN0f5KnLz0Fgv6Uw4PEqovbRdCu6k+vdYOILHvBPqH8=;
 b=HbVPfrcimRz0pIzxnINF8JAuc0/6gs8ePxKyfcXSIqVIot5hVHwbYSGefPRKBTmBdD
 sHk37Ra4pfSvt/PvSyVhpQ+OI3tepncjBAd1lDXbLfZZCQ2xQoJgebG0CRER4wsvNDDn
 dfT0DHT2ENFtagb9Ocwrk6IdP63FRLr0Jm5Q+HlEhFr/nsMMO22Qe7Uasy0gsVih8AXy
 e+/XHecQ2KDqEFaF1OUyw6wvpMnUsAglTo2JUsmVGA42XrZRItNRf7KpBPLWTm4GztjH
 8XoKUAdMkc8OYgdCw3qJl37iEAimwpWekSqcPJoBQ2Nnw+hqFQoi1Lrt7Np9ejy5aBcn
 2vFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKLCh5Z4VAx3/eUww+CJ5z65HdiUwHHnl0DY9FeMRNIm1rUPVaKmtrCJIc3QUW1AyTxMjhDbqW7TU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzckYt5vu1yl2ECq7u2OKtpFXyQzK9tVTOyFiWl0HSxg1/RES+D
 VfPyOoXqUeJII4oyPUwlVaw9L9Cz/uatTFGhN0YNL1cCJX60ImqMG4AJ2rIRyDY=
X-Google-Smtp-Source: AGHT+IE+/EPYZj8Jxd7YCIShYfXbXYbbomxByU1YjyiDIlF9V+tx4J8IWT7k674TkMxeicqzdjvskg==
X-Received: by 2002:a05:600c:3b1d:b0:42a:a6aa:4135 with SMTP id
 5b1f17b1804b1-42cdb53fab7mr35348055e9.20.1726214694972; 
 Fri, 13 Sep 2024 01:04:54 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b181ecasm14927755e9.43.2024.09.13.01.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 01:04:54 -0700 (PDT)
Message-ID: <b28e86f1-3730-4739-9499-24bed32c16b9@linaro.org>
Date: Fri, 13 Sep 2024 10:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 04/10] drm: bridge: dw_hdmi: Use passed mode instead of
 stored previous_mode
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Christopher Obbard <chris.obbard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <20240908132823.3308029-5-jonas@kwiboo.se>
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
In-Reply-To: <20240908132823.3308029-5-jonas@kwiboo.se>
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

On 08/09/2024 15:28, Jonas Karlman wrote:
> Use the passed mode instead of mixing use of passed mode and the stored
> previous_mode. The passed mode is currenly always the previous_mode.
> 
> Also fix a small typo and add a variable to help shorten a code line.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: Update commit message, s/type/typo/
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 5b67640b1d0a..87fb6fd5cffd 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2240,6 +2240,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
>   			 const struct drm_connector *connector,
>   			 const struct drm_display_mode *mode)
>   {
> +	const struct drm_display_info *display = &connector->display_info;
>   	int ret;
>   
>   	hdmi_disable_overflow_interrupts(hdmi);
> @@ -2285,12 +2286,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
>   	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;
>   
>   	/* HDMI Initialization Step B.1 */
> -	hdmi_av_composer(hdmi, &connector->display_info, mode);
> +	hdmi_av_composer(hdmi, display, mode);
>   
> -	/* HDMI Initializateion Step B.2 */
> -	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
> -				  &connector->display_info,
> -				  &hdmi->previous_mode);
> +	/* HDMI Initialization Step B.2 */
> +	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data, display, mode);
>   	if (ret)
>   		return ret;
>   	hdmi->phy.enabled = true;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
