Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BD86AF8B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 13:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8710E2CD;
	Wed, 28 Feb 2024 12:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WgoiWr74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117E210E2CD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:54:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-412a14299a4so30442195e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709124893; x=1709729693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+RAj/KK7dEjz8bgaOsKcLgi/tPAyQZi+gf3TKTy/NLU=;
 b=WgoiWr74KeuTVx35juqli2xUCFqKuHwYpJTJ97tOJ9VfGAf+ohOTCbdc2tRM5lIhlh
 A5vmRC8Qwu7O1dFfbic2RL7RmnYbTrM0di/6iXoe63yjRI7uieP5Yc1R3yejR1F+6Wya
 xLYRP3C2epH6isjmgmouZ8sJAr2RCeupRGntunpArGN0WUccLq1DG/tdm25+k0Ox0PVS
 ZxV4jr9WHaEwCSyT5QDIQgtq5ZQXH7qPLrbUViYgyXwXOCrtp5ZabXYnX0TvCSQfk6SS
 dpTWh+fBxvv8QNuJpTY36aCu6JqMUyoYT/d3m1eDLWader0tkot0+6pIXHkZk5zlQ+NG
 LcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709124893; x=1709729693;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+RAj/KK7dEjz8bgaOsKcLgi/tPAyQZi+gf3TKTy/NLU=;
 b=TJ8ferSTlgIJp5cDfT4pZt9bQkqyXAlsi+5BFnHM2B8PLj0fqYxH9WgCbixi7qNAOb
 XEDd3S3xlG2prp7qC5hICiMzrwLBE9yj9DFMnwfFkhr9l72cp7m6kw2vHpih66jkJgBs
 MlJpGllDAKcZIY/a67J9Y5v4RIIJFLy0MQyH/oQ/SZaTP/n92BEGTzRMsui9pceMqrif
 /GmI5K67H7YxxSVa/tbx2vYjA3KJ8jlEDjzZMjnyoloZEJECXmJWcGNkxmohhRq0r+0E
 uc7pxM26i3X9s11AMPk0Ops5kHhDVM7WM8oLxFlXFcieiQ/4p5DtjHtGpYI6a0+1hUp2
 iWAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt+9TzIzJXcxz48dMTDqdnO5HUQ3y1I9Q28F6W9YJlki1McCGdOKN+Y4xMtSJDkfXFzF9VUYGqVMOHupWstvquz2pbAVN/GcHmelu5/5gE
X-Gm-Message-State: AOJu0Yxv28zTsMtIpOo2SmNxMCphnLGbg/Arkim/9SVRr4/dUBOIQiTo
 4QuOyRoD044whGPiCZElyIhbWDHglPTLAb5Xudqf1+SSyoS4qsjaHAACe/al50U=
X-Google-Smtp-Source: AGHT+IFMzbMGgoH9g1ccJ1mdNl36iNZ8CY42LjZoxm5rOsW/s79QjgdnRVy5p4+++83bDeRlVc4JHQ==
X-Received: by 2002:a05:600c:4f86:b0:412:8814:9885 with SMTP id
 n6-20020a05600c4f8600b0041288149885mr9891784wmq.4.1709124892925; 
 Wed, 28 Feb 2024 04:54:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb?
 ([2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b00412b62f6e35sm1260350wmg.15.2024.02.28.04.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 04:54:52 -0800 (PST)
Message-ID: <34f1f7ae-39bf-4a27-882e-bb972c4e958f@linaro.org>
Date: Wed, 28 Feb 2024 13:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Don't log an error when DSI host
 can't be found
Content-Language: en-US, fr
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <rfoss@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240226-anx7625-defer-log-no-dsi-host-v1-1-242b1af31884@collabora.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240226-anx7625-defer-log-no-dsi-host-v1-1-242b1af31884@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2024 22:20, Nícolas F. R. A. Prado wrote:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Fixes: 269332997a16 ("drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host was not found")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 29d91493b101..4ee5614a2623 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2076,10 +2076,8 @@ static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
>   	};
>   
>   	host = of_find_mipi_dsi_host_by_node(ctx->pdata.mipi_host_node);
> -	if (!host) {
> -		DRM_DEV_ERROR(dev, "fail to find dsi host.\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!host)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "fail to find dsi host.\n");
>   
>   	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
>   	if (IS_ERR(dsi)) {
> 
> ---
> base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
> change-id: 20240226-anx7625-defer-log-no-dsi-host-c3f9ccbcb287
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
