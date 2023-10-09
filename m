Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4657BD5F5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DBA10E234;
	Mon,  9 Oct 2023 08:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A70C10E234
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:58:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso5094954e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696841935; x=1697446735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9OSDrrtdkYzSOjc15RRB/i7ba92vOhZ4Yf+0LV3PLJE=;
 b=EdQ/NaY650Fy+kkxZWQDYiHJA3qLNQNoYbWEqA60n7KTSxRqcoRgmefh02cHiI91Zk
 6TYLtKmjov6vUsaV2dx4hmYlx1REQQhkL/HRNdve+8txRIcjxHyFz1b1uqfRUpRBQVee
 dz00wuhrRNk7EVfTxUeWw3a7xDvSoD4AEfFAwBuzNe5W9ibEvHnN/lm6zkWcpFNYqrlT
 D9gy5Ira8nYh/QM7G/X0JYWKgJ7N8XoLUPdX14DsJv1Z8b/zx4LDBG/D0jwgr9yreSgC
 JcccCq4yLdZTl0p7m2JdtVXmbm+FVGTNcFSZgdutt8EcjCH4hV7UpqKAHpTwf+Sz2PSl
 z8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696841935; x=1697446735;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9OSDrrtdkYzSOjc15RRB/i7ba92vOhZ4Yf+0LV3PLJE=;
 b=RoKN+aMl6c8ilnLAg7riLMoQF8tttj0r0wpNEY0188FB1Ivi10pw0bF2OudMtrbj4V
 aOpG95Ew5y2ObqlmOVK+5OGDXo5+L/7qOGZkHqe+Cb64B1g1Mq0d4Gwg38WmtHlyO7Pb
 c3xq4M/Xwk4GIOXDZCoQNNP2E4rfuOFl5k09mO4N+4OpfpG20bcGQNHDi648vn8Kwa//
 jP4qolvnFR4Ib+nM5uwggP3MoHYVI21KzAAgQQaqgqjLVgYjnY3qVdyJApWgt6xrF9AX
 TUnG+2+CX5HhDVcn/GFlV5D1QqD8dWyJcVvQzRfIhGPPSQYrkzPJVlmeuTGEAmAwjW3g
 0eoA==
X-Gm-Message-State: AOJu0YwItXtJDTm8fkAeMnWk9MzfPUiS/hz29YRxj3JDmKXFj/oF/Iaz
 QmlkXEH5ccIsZBdtvajvx//gSw==
X-Google-Smtp-Source: AGHT+IErJTIkiQ/LbfX+yT/EhIeprQXGMkESqWV/lrzKa6Xofkw2DC7A6Hz1B6wtuHynkRnV3leNHA==
X-Received: by 2002:a19:f516:0:b0:4fe:19ef:8791 with SMTP id
 j22-20020a19f516000000b004fe19ef8791mr11302811lfb.38.1696841935377; 
 Mon, 09 Oct 2023 01:58:55 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003fefe70ec9csm12771157wmj.10.2023.10.09.01.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 01:58:54 -0700 (PDT)
Message-ID: <ea0e3550-83ca-4006-819a-64780589d687@linaro.org>
Date: Mon, 9 Oct 2023 10:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
Content-Language: en-US, fr
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20231008223315.279215-1-marex@denx.de>
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
In-Reply-To: <20231008223315.279215-1-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 00:33, Marek Vasut wrote:
> Add missing .bus_flags = DRM_BUS_FLAG_DE_HIGH to this panel description,
> ones which match both the datasheet and the panel display_timing flags .
> 
> Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 44c11c418cd56..8e4ea15f0e1e5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2318,6 +2318,7 @@ static const struct panel_desc innolux_g101ice_l01 = {
>   		.disable = 200,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
