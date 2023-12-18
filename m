Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB1817AED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2210E2AE;
	Mon, 18 Dec 2023 19:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9210E2BE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:23:43 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-780fb128627so2766285a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702927422; x=1703532222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=i0QEjs1Jg1kz4BkfgQOg0LY+rMkPfi56QP0+9ep3H8I=;
 b=IhxUcBREA8obSs+5hUuPSY9sLd8XjNV0Y2DiF0SVztI4bCpsCZCc1zmnGcycIvfz05
 y3IDbfYcC2MXypdtC7Sa7miidAShli1eqOOjo9iNlnVSCpu9xoGQUXktwjUMkC4ThhtK
 PiSLTiwevmSeORwZK8NbtLLQg4Jt/HXlR87gXlESW/fx0HkpU2BXJKLZnjbkZAvk1s20
 p1ARnC0mJgYirRUT9+ebfHNgo4Ps3KInkIGHxGiOOEmD5aSR8x7LUY7i8hENTmB46Z4b
 5hL4XjqnR/EIC0wRejehQnW0Kd/v9q5db7c6L9qxu+sGIID2yF2fGGGlE8rf+0YxP74v
 Zigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702927422; x=1703532222;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i0QEjs1Jg1kz4BkfgQOg0LY+rMkPfi56QP0+9ep3H8I=;
 b=HM8bOzfXPOukT4gSuCX+H6sg2/4HVdC+ga4des0azLUrkt1c/PTkMfUoqJvLTGsghC
 uRv2KCQNYgfHT5v+PSgrS+wgkdAHC+54RmA0DKGIwdzSaF0+aThaqgrkATJWI+YjV7XZ
 g3e9rMCKgvpyp/V3/nZ2fLI06/FFpow7hQ7Y6dSLo/3Q1nGKD2wYyAGJoKHxE5xVgS2Y
 A9R8f0oStZbFc3w6ETuB+2TTwpXChVPQjkc6zM3y+2fsOhiEOF/5TsVW1CMOAkRfY5TT
 jFRfDeUT1QQvYZBA26AIDi1SQGioiQD+qfDoFj0en6S5gSxNu405pXmVyjzcSSsm+tTg
 lmAA==
X-Gm-Message-State: AOJu0YzrBfvYapmi6hqZrxu2wDWG63m9X1kcwFy9KhZsWKAlTyu4CxB3
 eiGgwWaGtrdAUHUCly3UwPod/Ug7gqquas378T+TVhFu
X-Google-Smtp-Source: AGHT+IHH/VJngh1h4Twl3A0LIkPfDZJx2LyXecl9lddnCK5jb40U8/11sJPG9CpUb1qda/iILrQf/g==
X-Received: by 2002:a17:903:25c3:b0:1d3:b860:5a99 with SMTP id
 jc3-20020a17090325c300b001d3b8605a99mr379449plb.71.1702887720233; 
 Mon, 18 Dec 2023 00:22:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b425:da5d:c0cf:a505?
 ([2a01:e0a:982:cbb0:b425:da5d:c0cf:a505])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a170902d68300b001d2ed17751asm1034446ply.261.2023.12.18.00.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 00:21:59 -0800 (PST)
Message-ID: <8491febf-de39-4dd5-891f-fd844b83b7b4@linaro.org>
Date: Mon, 18 Dec 2023 09:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: properly refcount DT nodes in aux bridge
 drivers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/12/2023 00:59, Dmitry Baryshkov wrote:
> The aux-bridge and aux-hpd-bridge drivers didn't call of_node_get() on
> the device nodes further used for dev->of_node and platform data. When
> bridge devices are released, the reference counts are decreased,
> resulting in refcount underflow / use-after-free warnings. Get
> corresponding refcounts during AUX bridge allocation.
> 
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Fixes: 2a04739139b2 ("drm/bridge: add transparent bridge helper")
> Fixes: 26f4bac3d884 ("drm/bridge: aux-hpd: Replace of_device.h with explicit include")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c     | 2 +-
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index 49d7c2ab1ecc..54d721db0ea6 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -57,7 +57,7 @@ int drm_aux_bridge_register(struct device *parent)
>   	adev->id = ret;
>   	adev->name = "aux_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = parent->of_node;
> +	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_bridge_release;
>   
>   	ret = auxiliary_device_init(adev);
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 1999a053d59b..bb55f697a181 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -68,9 +68,9 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
>   	adev->id = ret;
>   	adev->name = "dp_hpd_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = parent->of_node;
> +	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_hpd_bridge_release;
> -	adev->dev.platform_data = np;
> +	adev->dev.platform_data = of_node_get(np);
>   
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
