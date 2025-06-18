Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891ADADEE27
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E291C10E837;
	Wed, 18 Jun 2025 13:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GxhX91Wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F49C10E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:42:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so60687285e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750254176; x=1750858976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=;
 b=GxhX91Wh8CiUoA5oIAcFYU/WHThcgzK/vywu/cLFRKQSo1M2NPD/6zur2eepyW23qb
 PmldgUSgY02QjBukGCMEymXL/CW0ywtEOdCDF+rbZr/YvuuMnKN9DvfnTNsCpUT6lP6o
 U5eZfpopCBJTejmcuLxaHJHjm9rDJHQCs9OTFKwcDOfEdblJLzHxnIx4wSRN9bBVJf3C
 EyHKRRO/vlWd8KKJJP6wCrCK9kC1/fQUa4RnsCSckn5mss/yWiJjiU5PSOxJuB/Hw8je
 RAnZF5kwPGdwyWh0LsELyhMPMB+MRQdVCRHGNVaKxCEZ9h1MFL/Xmd0gj07Oua+CIGXg
 uhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254176; x=1750858976;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=;
 b=bRy73sGegcdmiH1CDCXy4jCGeEemvBEz+1eSpYyqh3LtLTr9+qJ0wRI9/zY4lJGNld
 MYTCAKtmsxVMR5zycgynNaaxBaYftYCmX9ZF3ddOTPQaefssCipKeefhxdt4gioNFtfu
 3FXQvi/rf0g4g9WwdIwrIOpYCd4lbXMAIv6MkhNqf5x+9Ifi29+D1ah5sXuYuYOnkHcQ
 CmdcWKiKKypOPd0LflBUkeWnMvuPl7PAFfbYH3bo9b3r0kCpgHkZ+onhUOEMtDSiael2
 vIG/Fvptfhluo9m98wFlCswlNluhRltarVjBY59bgxmVX3OSrIMBl1Ag+61QneNbPIj1
 ZEqA==
X-Gm-Message-State: AOJu0Yx8Z/Pjiry9zhW+Yx+cBRhvORhfj5pAqwkI6aT6D6F/caiQXLkO
 XgNSmFmtjPzZQ1dltIs4MjUBnSUlW475aDRqwqo79VT8BxULddFszM6wec1mqkG+678=
X-Gm-Gg: ASbGncuK0N9DsFGesr1kU99b0FDMvwO32pRfKPWb1rWtKZiwNg3vXaLeyc3CxXcvhqP
 U7DpbATJUxu4wWg0cUJGTtDxiagDD7tgtFE0oQbTJJktuVRE4Gvta0e4FOiA1PveFS/QdfHpRDf
 L6rDcDKc1SR5iOVGUidStmT5XvCEr/XMsuLPmRLMBzc/3eQ5YBfioHwiBdPK9IRjNZohwfzddAc
 5N0hBBmWFHnXiyVU5Bwvz1NhwYP34QN8vUiccacw1isq5l29cFF+mBHepFjTLccbSlkkq6ReGiR
 YJA0RZ0y2Af81/d1XMx9dNseKSOuqly85s5yEl3KZdIexWxnGWLWXMbRvVEsrSOIBLNOZyHJ9Bu
 okLNrbGKjQjPyKeptjc1yi206n97nB4rHm0oC
X-Google-Smtp-Source: AGHT+IFYjXSzI2dMaGAAgqsOrkzwB1KxP63uuJ7AOWNd44e2f4HlRrKeC45xFQOdkM6Iz1JDQ6qBiA==
X-Received: by 2002:a05:600c:4e02:b0:43d:ac5:11e8 with SMTP id
 5b1f17b1804b1-4533caaeb57mr147595075e9.21.1750254175671; 
 Wed, 18 Jun 2025 06:42:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a29:d3c:4dad:4edf?
 ([2a01:e0a:3d9:2080:7a29:d3c:4dad:4edf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b1bc97sm17087804f8f.68.2025.06.18.06.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 06:42:55 -0700 (PDT)
Message-ID: <87908c15-5527-46ca-8fef-481a6f3d67c8@linaro.org>
Date: Wed, 18 Jun 2025 15:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/12] drm/panel: panel-samsung-s6e88a0-ams427ap24:
 Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-4-tzimmermann@suse.de>
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
In-Reply-To: <20250618122436.379013-4-tzimmermann@suse.de>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2025 14:16, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_bool(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> index e91f50662997..b6d04f8ad561 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -8,6 +8,7 @@
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <video/mipi_display.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
