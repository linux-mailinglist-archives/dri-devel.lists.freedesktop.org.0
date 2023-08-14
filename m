Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DD77BA72
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7A910E1FD;
	Mon, 14 Aug 2023 13:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610C710E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:45:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e5747so25309105e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692020714; x=1692625514;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3CmEyfz1jWIQ5IhZiEaKR2s5qY0fQprGT7huYk4tAQ4=;
 b=QgQc42jdAHcfsZ0FLmnX8kGceJ4z201dEzcr+70aJV4YlTgNE7MVEko7aIwOg/o2e3
 LzbbD40DxLjzgnIMfzotrKDjtYBXUmQamdQRRZs12SxrvXKUX/KJQfjsNwKSZKMa7yXA
 RcR2bc06ErvBfiiD8jPhNzjTvtVLEbH5m9hxwPng9TBpWadugNe8aomIVu/Uai3OaJc4
 GnLxBjA1T6egCgRhY8+5nG54ldhvR4K2McGq7lm/j8/TgathkusgxWwaDY0O3Kouj+X5
 XC+XTbVnUdC2VmHTGOVRVMTJFypmKFre1cQZcdBfopg00Bq22uHCPWiNGB7Mn/Vowptv
 M5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692020714; x=1692625514;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3CmEyfz1jWIQ5IhZiEaKR2s5qY0fQprGT7huYk4tAQ4=;
 b=ZiYE2R6DYnG7jQDun6fn8z/XhPgYk3BwGh6v0OZcyAWUuxMR0xlhSTG20BBAC+f9hw
 qmyKKkLD7ct/lMA3rq1vkrFF2v1MxMIvcrDcYQvOd6fOvuE1Ip3nolWatmmSTomaBh79
 RXo3Pas5yhm7BxdVn1kl7A7dyFDfnBV/NcDrkcaDPhwae6q8VqDriq7ethL1rUrgbuDK
 xRdg72BUhjPzvswlgrKsN+GKgPcnlwj62DjrWaRElbBYYbX7bJ3VGXR9ZL2cF/ijow89
 /LsOYo2wcoh9uoejmy6xlbWSrJOCxsDoMwtECfo6tXtXfiyXRavris8/+d9GJLmJSFoR
 +PWw==
X-Gm-Message-State: AOJu0YxC+DaSzeUSoo4tUNQDJjizEJ6lCwcc+KWSM0PLsn07j//cFKDX
 g1g3lbouSyf5bUR/MpoaKb8KH58o85NdeZbwRnp+SQ==
X-Google-Smtp-Source: AGHT+IHB7cXjVGMV2W2hqL0+4tyTcRtrmWFouKhydREi+RRH+AEYMIHClr/erJUJcCbujQGgQjxu1g==
X-Received: by 2002:a05:600c:252:b0:3fc:6e8:d675 with SMTP id
 18-20020a05600c025200b003fc06e8d675mr7314101wmj.13.1692020713762; 
 Mon, 14 Aug 2023 06:45:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adfe9ca000000b00317909f9985sm14289227wrn.113.2023.08.14.06.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 06:45:13 -0700 (PDT)
Message-ID: <549974ea-0d27-4797-aba1-1dbe62fc9df4@linaro.org>
Date: Mon, 14 Aug 2023 15:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Content-Language: en-US, fr
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
References: <20230814134024.397739-1-luca.ceresoli@bootlin.com>
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
In-Reply-To: <20230814134024.397739-1-luca.ceresoli@bootlin.com>
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

Hi,

On 14/08/2023 15:40, Luca Ceresoli wrote:
> This panel has been implemented in commit 225213f24c79 ("drm/panel-simple:
> Add Innolux G156HCE-L01 panel entry") with a higher clock than the typical
> one mentioned on the documentation to avoid flickering on the unit
> tested. Testing on a different unit shows that the panel actually works
> with the intended 70.93 MHz clock and even lower frequencies so the
> flickering is likely caused either by a defective unit or by other
> different components such as the bridge.
> 
> Fixes: eae7488814b5 ("drm/panel-simple: Add Innolux G156HCE-L01 panel entry")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Marek Vasut <marex@denx.de> # MX8MM with LT9211
> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> ---
> 
> Changed in v2:
>   - fix commit hash in "Fixes:" line
>   - add tested/reviewed by Marek
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 701013b3ad13..a1bbc7f11e83 100644
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

I'll apply once drm-misc-next-fixes is aligned on the last drm-misc-next tag
for v6.6.

Thanks,
Neil
