Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA98800EA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0185110FB97;
	Tue, 19 Mar 2024 15:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jLyRABCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF110FB97
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:44:53 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso83516561fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863091; x=1711467891; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=vymDjNLjvaRHPRI0ysrYSCFub92dsHFOn0kEUS3MiAI=;
 b=jLyRABCa02ffcHHua5/M+MvfHov7TwihwaWs31rX+hgJvIewo3lCUQdCczisQRAhOP
 HEHb0TSdldOE6CT906hoY1hzXppd5S5TyVSmCT0lGMkCH+HcI7wF9t4Fo3riV1nhe2Qw
 W55wRmeXkstpcYH3R/ZDeMo5xA+E+TbiEPTG+jULhrKoQdJuyH3aC04jR+wKpWasgTFp
 iNNfmsYT6rk2aZtyqgAxuGswNonOp03HL8v8/2jRMqfytsnEuTiVHkAO8EcS/GnwC0Pt
 G4kyKRcTXLkWn0VNmCWOOL833B82+LHqh40WiSY/3Reqo+d+WW5EJ4EvucUcr/rjXBa1
 qXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863091; x=1711467891;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vymDjNLjvaRHPRI0ysrYSCFub92dsHFOn0kEUS3MiAI=;
 b=tm4myeYov67SRodWzGzj15R4NfOSlhaCWg9iLaBxuh6P62OG3kwdEdZ+/IXpswR2yB
 GWGE3WI8wRMYpNNBdelNZlmxKOkf6NKYnj8hdqO7tpUK+z4FNHFXu/8bTwRmxceLeZUL
 Ra9g20KvV4BuLto4IO0/i8fMu4LC7I9nIzr5dcnebktkkh6LvWO21nAjBsovcPw81Bh5
 5mYeAUGaM0WwD+Ol5Fq98z9C56dym3xPdrNNy5V6ikqThD2Jamn6PZcjYFRjjTQ0NAX8
 V69FT6bVVEjZGx+yWISRLyXFohfYad6dTQiv3ENj4dz1PVXthUUf6cWqzKwAQw8rAcmg
 tOGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6/kGKLAJkxVhRZ1rGZFaJsXiWDHcxLvdSis1bju2eLnl4lPO77QDcT5yevLAD76gK5Z2ulFvfpk3b/PU+0v3vRVOKm5W8M0usIDTcm8pd
X-Gm-Message-State: AOJu0YyOrWi+m08R6FfL9gK0zrqAqYzd5m6GEXDSzmp9iMsJpv9inzQL
 rolphjtHZTMh7lkHOSMiSLVflwY7eYduXA83RV2tMZTWHE8GxiBxze6i4NZlKD4=
X-Google-Smtp-Source: AGHT+IHgq02ECA/yoPkPu6GsVj4CMMoM0lbz7lLE4XBKQ4XefteONEA+Ei8w4Oub31hbYedifx3ksA==
X-Received: by 2002:a05:651c:333:b0:2d4:5a99:8b73 with SMTP id
 b19-20020a05651c033300b002d45a998b73mr9112178ljp.38.1710863091122; 
 Tue, 19 Mar 2024 08:44:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2fcf:6f16:3b3b:da8e?
 ([2a01:e0a:982:cbb0:2fcf:6f16:3b3b:da8e])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c470f00b004128fa77216sm22013345wmo.1.2024.03.19.08.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:44:50 -0700 (PDT)
Message-ID: <42fba6af-d7da-4954-9e89-9137144f7428@linaro.org>
Date: Tue, 19 Mar 2024 16:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Content-Language: en-US, fr
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
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
In-Reply-To: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
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

On 18/03/2024 17:06, Laurent Pinchart wrote:
> Commit 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use
> of_graph_get_remote_node()") simplified the thc63lvd1024 driver by
> replacing hand-rolled code with a helper function. While doing so, it
> created an error code path at probe time without any error message,
> potentially causing probe issues that get annoying to debug. Fix it by
> adding an error message.
> 
> Fixes: 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/bridge/thc63lvd1024.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index 5f99f9724081..674efc489e3a 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -125,8 +125,11 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>   
>   	remote = of_graph_get_remote_node(thc63->dev->of_node,
>   					  THC63_RGB_OUT0, -1);
> -	if (!remote)
> +	if (!remote) {
> +		dev_err(thc63->dev, "No remote endpoint for port@%u\n",
> +			THC63_RGB_OUT0);
>   		return -ENODEV;
> +	}
>   
>   	thc63->next = of_drm_find_bridge(remote);
>   	of_node_put(remote);
> 
> base-commit: 00084f0c01bf3a2591d007010b196e048281c455

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
