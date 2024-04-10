Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BA89EE2A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 11:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B4210E16C;
	Wed, 10 Apr 2024 09:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="adhKJtF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D5210E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 09:07:44 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516b6e75dc3so8260231e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712740062; x=1713344862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=duc/Dbl/Cjtaq4jKQcJqe623WLKfFna/k+1G9vHqsrQ=;
 b=adhKJtF/xYd0xrihiILtGKqGQi4Sya8pAOo5ORbd5q5WD8yjNzUBGnul359+HITham
 XR7f/ZZZRbu2+TtMiTJr5NZwWmdzBygYMrqM/PiqJMzuckKRBIgSdb1wQgyJv4c7C4e9
 OUTwWiWDwLWmbYoLKRdWdtHPtLLQxNpSVAe6/aexfGtaBHv/yb3ERTji2WoRQ1jVv6RE
 x/9gXZ0Lt+zAgw2yjarxhtcsUWTABb2gj3XFLHYuJtMx9Vdi9i5tgfHYyrMt9t6KtwSP
 6wWzHNrpPUMIuNo9SVKr0BJvIBWfiLqzQb9Vtr+o250mQ5AteLZYXE47Tzrao6gLCE6H
 WWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712740062; x=1713344862;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=duc/Dbl/Cjtaq4jKQcJqe623WLKfFna/k+1G9vHqsrQ=;
 b=UY4FsS2qpmKVFvxqHELGVI/GRK8KtDxrIBb36yb1n16rqDUHsadRSo+KimyaepwiaP
 8Ej16FdP1H4Pohbn9smFSdoyODOt4DDOlFULPThITsYOa27/U+5QHud5vyum4LkIPKNH
 T7xdwcsOJo29I8v7PD1aYUPAP6uzCMIHeZODg8cFfM+7zj4hBxOYnzYcPIzXwL4GDvC+
 +MgXPwSWh1hnXR+CQT6/QaRPd3Xo2Xl/asHbpuW4Qp4eDEDo6RLOs4eukpQg6gWhQNaE
 aKwp1gL0sS0pR9JrhuyMhFYxc+2zjZjuDCj6wTTRhTNbsHE1MhAw8ZSaS+e1iGwcdw8P
 /Upw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrcDvDMFq0fnP1NRombNRZSi4jTEB/G6A7OUlq4ddGZV8OSOeG5HUXhoNLM9N63J4ujKPd1IP7srY5q8dPpl9mjrK3rOmtqxqQ3JvdLY/L
X-Gm-Message-State: AOJu0YwOTWFOwoZD7UA7jpPc25uYNxanhpfKZKvf4XsxzvQz3Rq0wmrZ
 i1RRjqipDQU6DlLibhDydKwRZmaQV79w7IKQZo+a98PFlh28jBDzfruOIoOTWcWS3GypfBBwITk
 Kuv8=
X-Google-Smtp-Source: AGHT+IHqleKIYdgSYtADyybe6lUqcvkPzHpFY5eWWUAxhHp90xeEfjgOqjhY3Bz8AM9gVtHxMt4Cyw==
X-Received: by 2002:a05:6512:554:b0:516:d097:8c32 with SMTP id
 h20-20020a056512055400b00516d0978c32mr1157497lfl.18.1712740062261; 
 Wed, 10 Apr 2024 02:07:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7b0c:6cd:4afa:674b?
 ([2a01:e0a:982:cbb0:7b0c:6cd:4afa:674b])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adff807000000b00343d6c7240fsm13293822wrp.35.2024.04.10.02.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 02:07:41 -0700 (PDT)
Message-ID: <67aaaea4-089c-4de5-8070-57e6a7134362@linaro.org>
Date: Wed, 10 Apr 2024 11:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] drm: use capital "OR" for multiple licenses in SPDX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240410082200.44966-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240410082200.44966-1-krzysztof.kozlowski@linaro.org>
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

On 10/04/2024 10:22, Krzysztof Kozlowski wrote:
> Documentation/process/license-rules.rst expects the SPDX identifier
> syntax for multiple licenses to use capital "OR".  Correct it to keep
> consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Resend...
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/drm_client.c        | 2 +-
>   drivers/gpu/drm/drm_format_helper.c | 2 +-
>   include/drm/drm_client.h            | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 77fe217aeaf3..d8e3427ae205 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0 or MIT
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>   /*
>    * Copyright 2018 Noralf Trønnes
>    */
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b1be458ed4dd..2348135fb6c0 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0 or MIT
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>   /*
>    * Copyright (C) 2016 Noralf Trønnes
>    *
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bc0e66f9c425..1b907709115e 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>   
>   #ifndef _DRM_CLIENT_H_
>   #define _DRM_CLIENT_H_

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I think we'll need maxime or thomas ack to apply this via drm-misc-next

Neil
