Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1E77B8CA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F7910E1D4;
	Mon, 14 Aug 2023 12:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137DA10E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:38:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so30238815e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692016732; x=1692621532;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Bu4ri/TAHb9fiLZLiO4fZJEClWVz9W6Mt3bHz/FHGa4=;
 b=vbgYoAcW9DSA+ZZJcp9LE0KGpkiZXjuz63TcQH2hRZIAFqHrg6ii4D1RLtN1splMEj
 LMejNosab/HaUqPVnYD7ZvDGQ5a/84FeAI57n1NWSJZJ4ND6RoOFxU20DD0GYQhmqi9k
 zUk3g9qMfPD2EJhuS3M9ZLlh8lbwZlpUJFjlMFeYU8kZI3z3DahC/nqC/EFnsO688yCM
 UlE4+p0YnfV4exNl/miYprInofiXhHAzme5LrnMozFrdOPOBUsxI+NxuyTzFx8KVyadw
 9h/Z8DUcfwzmqq/2rHcU0xV71zc+gJY0rPxFkjER23+cUjmM8NW2f0l8fD9OtJW598ps
 v8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692016732; x=1692621532;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Bu4ri/TAHb9fiLZLiO4fZJEClWVz9W6Mt3bHz/FHGa4=;
 b=Ui6kabMYqNdjsDrdEUoQAYffUAwrBnk2jDbrscIf/2V720RVmfDuwq0PtWuZ1ry3Fc
 CICQPcnBEh9EuKm9QB8eDEcbs6DjmWfzZwXgAPrCouyS3fntYjj3biBqudZl4QNRw0hl
 pTIQ29iYUJeII9VMhaTmAz9nhXSo8v+1BJURHUiXO5tO8CQg5SYcoZVfX8rGKWVjOP6V
 rxE13E3ACGmcXfCBukMrRmVmUWjJnBlHQSqO+zPe28ed1U/SVM4d48DPdYvrpQ1WSlUz
 hBAuzijSRxicy45pcucsSuMuNtZFeDZfkygnrH+JHBvboPpRMJZCp9FOu40YRDtKIpFn
 Q0Rg==
X-Gm-Message-State: AOJu0YzVNPIQzVRGhIKMNupopBH3yGrvC+kYFF7E+8LGc9Y9xn2k3ZVD
 0vDzwcWenlVByAxUYf2MgAwzNA==
X-Google-Smtp-Source: AGHT+IHbjvyjeMbQM1a8YXZiIwipoNXt26AwQZf3kk0r6paE0Mvn7H5ToUvouknFcdOoEyhR5dHRRg==
X-Received: by 2002:a5d:664c:0:b0:317:dd94:d38b with SMTP id
 f12-20020a5d664c000000b00317dd94d38bmr10687162wrw.10.1692016732531; 
 Mon, 14 Aug 2023 05:38:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a1cf70e000000b003fe24441e23sm14193823wmh.24.2023.08.14.05.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 05:38:52 -0700 (PDT)
Message-ID: <0df7954c-6520-43bb-9246-c4a5a40b202b@linaro.org>
Date: Mon, 14 Aug 2023 14:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
References: <20230804151010.834990-1-luca.ceresoli@bootlin.com>
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
In-Reply-To: <20230804151010.834990-1-luca.ceresoli@bootlin.com>
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2023 17:10, Luca Ceresoli wrote:
> This panel has been implemented in commit 225213f24c79 ("drm/panel-simple:
> Add Innolux G156HCE-L01 panel entry") with a higher clock than the typical
> one mentioned on the documentation to avoid flickering on the unit
> tested. Testing on a different unit shows that the panel actually works
> with the intended 70.93 MHz clock and even lower frequencies so the
> flickering is likely caused either by a defective unit or by other
> different components such as the bridge.
> 
> Fixes: 225213f24c79 ("drm/panel-simple: Add Innolux G156HCE-L01 panel entry")

This is the wrong sha, it should be eae7488814b5

Neil

> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 56854f78441e..ec3a73bbfe30 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2379,7 +2379,7 @@ static const struct panel_desc innolux_g121x1_l03 = {
>   };
>   
>   static const struct display_timing innolux_g156hce_l01_timings = {
> -	.pixelclock = { 120000000, 144000000, 150000000 },
> +	.pixelclock = { 120000000, 141860000, 150000000 },
>   	.hactive = { 1920, 1920, 1920 },
>   	.hfront_porch = { 80, 90, 100 },
>   	.hback_porch = { 80, 90, 100 },

