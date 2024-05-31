Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC48D5AA8
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 08:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8C010E48C;
	Fri, 31 May 2024 06:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a9vPbV08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5583010E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 06:44:16 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-794ab4480beso127072785a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717137855; x=1717742655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WteAddZLnp8bETRCun3ApBx6Mpqh0h4gKChcJ1Oa+dE=;
 b=a9vPbV08v3QwJIr9E8le5UQuMhJDV4UXp7hwFzgaxdn1TicE12L54KeKufGLS9u6Lg
 PvGn9mhwsaFwGHqalxdgQ3l+zeme6E9ZpRCfqNu4L2KdBEd9FhLT17IdaSp+cfrJhQDz
 yOtqB86nzBz2+TgbuSPR5RR6noGhvrXa/1pTwqOHn/OSRdzpRSnFDxTfa7tjrHLMYRNp
 tfIkVIBu0Jxvbn9oJjr47rWvmm+e87y5ylmucmTMRGv5eB4dWWOWYf//fyVcOGm4dNBB
 LFcDuGdGIVlgTamC/Dcx4UTxAlVC1nPOjVvqzzEzZ16YmNdc3R71qYckHYuLe6GnSYPH
 tKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717137855; x=1717742655;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WteAddZLnp8bETRCun3ApBx6Mpqh0h4gKChcJ1Oa+dE=;
 b=j983SeExkB5Cdc5sfa3FTByG8vyK/gsMlGVVtUgMWbhjuNOue2+fGQ82ZX3IkP/RP3
 MpGJ4Tot55ZzYz5SMZ86tj4Fx8ZdeM0aGoVRLjA+bXe6Ovc1MGZ5rbxZNb6aQzM4i9pi
 rHQ6rQWoh16VtC7R9lzJap3eBRKwv/T+N6ND+2dphCvdIh5KeDw2hQuZz+KS0u7w3cYX
 j34Jh2Au+UPwtC6/x5LQIclGslkikGjEKzeWEoh8dP79hHuEVUF0t4rmicw9m/4dyqb2
 PnwE3bQrKFPyyKEHML7FQTo0KXHxZtk1EvAFpbYSFtzv9pR1Q+SQ2cqzF4Ri/BYMzRSl
 rYcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/NuGzWWhlIixX9/aXfDFZmRT8cLVantEZwePgdddScdQRRSRYFespASv7W0nCCScbTAspD5Ys2gIWZz6JWVI4sDuOr1uWOweRTII1dU95
X-Gm-Message-State: AOJu0YwZMx1ApTXvtIcqz+GsLu3Uc4nexS6MSub6chzB2pnhFkef0VQZ
 AwfvJVSzSW/BetyKC9M64x9audz7tEbhMBpOulwp9Zz3Nuuw0DWUll5YUOfvaMZ80vSZ7B7f8gi
 +
X-Google-Smtp-Source: AGHT+IGE7L4G70bpZ65rrQauv1KKQiw1CNXFY1DCsUIH1cqySIw5MWkdX6qxIa7rEipLRMlnbCZi9w==
X-Received: by 2002:a05:6214:2c02:b0:6ae:d66c:40d5 with SMTP id
 6a1803df08f44-6aed66c41camr4627046d6.36.1717137854723; 
 Thu, 30 May 2024 23:44:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4c4:ddb9:e2c0:9701?
 ([2a01:e0a:982:cbb0:4c4:ddb9:e2c0:9701])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4b4065a1sm4449466d6.94.2024.05.30.23.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 23:44:14 -0700 (PDT)
Message-ID: <0adf0403-8e52-45f2-8877-c3221938b714@linaro.org>
Date: Fri, 31 May 2024 08:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: drm: Drop sam as panel reviewer
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20240530211402.GA1660596@ravnborg.org>
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
In-Reply-To: <20240530211402.GA1660596@ravnborg.org>
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

Hi Sam,

On 30/05/2024 23:14, Sam Ravnborg wrote:
> Drop myself as reviewer of panel patches, to reflect the reality.

Thanks for all your work on panel reviewing!

> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac285040578e..38978699bef5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7567,7 +7567,6 @@ F:	include/drm/gpu_scheduler.h
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
>   R:	Jessica Zhang <quic_jesszhan@quicinc.com>
> -R:	Sam Ravnborg <sam@ravnborg.org>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
