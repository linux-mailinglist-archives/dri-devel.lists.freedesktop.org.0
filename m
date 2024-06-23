Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE9913C9F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 18:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5C710E03E;
	Sun, 23 Jun 2024 16:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lu1QG+U9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2207610E03E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 16:08:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42172ed3597so20416025e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719158898; x=1719763698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=7JThiaVCOwwrTPhSIGm2vfpP5L/VE7fGS+pTVte+rxw=;
 b=lu1QG+U9w03GcnYvbPdo4N2GCNdvVZa+dmiG91O1SVffarShazz/keMuzau5U9spPj
 7No7RRZg+Ck8JM0rW/ELQIq14RKLkdc0QaQmB+kVSaoaQBABhZmdmYqPS1x4PvIurgRj
 U2g+uV1coiifp6DDuW63GB5s2n/2v+pLjTasa8vpGLGVs4Ghw2KEPiGxhvmx7mO5G49e
 gea/QJN7kvWhm4o8dWj+xLwW9CX5EcVZGvdDmvmfufIh0jMq08HSusS4N6v4DoCwz/nO
 MEfmdHgmv0fVDa+G+MIA1gyqzFUFgonvk3oSvVRyj/cllFzzzd4pDtujbk+vqMvgCdqi
 hcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719158898; x=1719763698;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7JThiaVCOwwrTPhSIGm2vfpP5L/VE7fGS+pTVte+rxw=;
 b=HJXcr4C8jwlncSlnPJwBgVRb91LPvkc6u087bgeeg5U0VZyPvuTPNO7l/dkD8lorXm
 07bKVHi5pvSO1acBKQR+DaantGFYg1QLSqJ0uTj7Tv0faDJqm9lexwO1gpjdrg+/CSkV
 KE7kvHuLqQvVbX8LsPKCdr3Zu+G26xFgg0ccDmwBzOI01nQuoVhvOPTVLyQ7wZa2/Y6D
 PfJg8VzhUwxU1EUd5wRWw+O5txkiu9agVMo7oQEFKp4Rcs1rCOLx+AQKw68FQed+ASka
 OPTlpoUDu4M6BGYzrgNGNtdhUQnF+Wbu1Q+FC/2mnVrbTJ4jK+Fw1uR83S8dyREdc7Ob
 eQBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpJnTR0x6c4UG0wW9CZ+Yu6WhdM33aVNl8GPQW0uovhV9ny+3V715LONVaVUn1h+LxS18FPc++QjmdXmG96upRFnfuSLly9OHqTn3zE9ST
X-Gm-Message-State: AOJu0YyETQ7A2xpgRaARShD7wzwqghLfsC/a2n1eEgE2M0+ied65i2cX
 27b8tSkO6OtAfRwZBnGdlJBSYFmQrvbBfn9Nrco7/CKkEVfFlmttw9Z2T92Yrss=
X-Google-Smtp-Source: AGHT+IEkyRCQyQQjUSoXKygwfsmCECJmHw5ib4QihasFfGgQiZ2NxdhkEgGWQmFXcYaDFtQQ5WCIYA==
X-Received: by 2002:a05:600c:6a11:b0:421:8234:9bb4 with SMTP id
 5b1f17b1804b1-424895fb1c5mr29449145e9.19.1719158897843; 
 Sun, 23 Jun 2024 09:08:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e59d:dab8:2290:4b4a?
 ([2a01:e0a:982:cbb0:e59d:dab8:2290:4b4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471584311sm129286875e9.0.2024.06.23.09.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 09:08:17 -0700 (PDT)
Message-ID: <8729845e-00f5-4bdd-9804-ddb76913904a@linaro.org>
Date: Sun, 23 Jun 2024 18:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>, Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240620181051.102173-1-tejasvipin76@gmail.com>
 <CAD=FV=Vpb2xy68LUT9MRi2d=Lze=5AyPjV-ff5FLW30Q6MasJQ@mail.gmail.com>
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
In-Reply-To: <CAD=FV=Vpb2xy68LUT9MRi2d=Lze=5AyPjV-ff5FLW30Q6MasJQ@mail.gmail.com>
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

On 20/06/2024 21:18, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 20, 2024 at 11:12 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
>> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
>> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
>> raydium-rm692e5 panel.
>>
>> Additionally, the error handling in rm692e5_prepare() is changed to
>> properly power the panel off in the case of a wider range of
>> initialization commands failing than before.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>> Changes in v3:
>>      - Remove extra blank line
>>      - Expanded on error handling functionality in patch notes
>>
>> Changes in v2:
>>      - Change rm692e5_on to return void and take mipi_dsi_multi_context
>>        as an argument.
>>      - Remove unnecessary warnings.
>>      - More efficient error handling in rm692e5_prepare
>>
>> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gmail.com/
>>
>> v2: https://lore.kernel.org/all/20240619033351.230929-1-tejasvipin76@gmail.com/
>> ---
>>   drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 238 ++++++++----------
>>   1 file changed, 99 insertions(+), 139 deletions(-)
> 
> Thanks! I normally let non-urgent things sit for a week or so before
> applying them, but I'll be on vacation for some of next week and the
> one after. If this is still pending when I get back then I'll try to
> apply it as I'm getting through my inbox, though I'd also be happy if
> someone else (maybe Neil?) wanted to apply it next week.

Enjoy your vacations! I'll handle it.

Thanks,
Neil

> 
> -Doug

