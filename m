Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D678FDE9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 14:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9D010E1B0;
	Fri,  1 Sep 2023 12:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195E910E1B0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 12:59:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so20026205e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693573174; x=1694177974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=N1OixA/DzZJDLAfPgb6GOqk+Nq/ho6spafYJiFqeikk=;
 b=ZVOu5Lj2+6FvCxFMSK4drxasli+wLILlSPXkXQc5O7LPdDn1JV20Howevvytganzux
 9H42O81dP5lxbL3jO+2+13tw3dEhDsUQjl9R7dZGlcXM2+wxZ4hPEfTsAuuZ1XEAidG2
 p6v/FtG0ozdwbFQZgUiz+8BJcH90qvsixmSgS8ZhyhSEeZULYuezLPalsnrNd1/Xm6DA
 9XST13DslkI9rEhc+m7+wU+0n6f/Eg/dlN9Q7LH8IysAMFHscpY9VJjSYJik5qaLa2MV
 rACP3NGvxq729lLH/Gmd612wQndcwK5p523eyLOq/gIZdd/EmevSFfD5PIffTRmUOD8r
 zsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693573174; x=1694177974;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N1OixA/DzZJDLAfPgb6GOqk+Nq/ho6spafYJiFqeikk=;
 b=MPpMuUlWrIl0Iz3TKO+w3Z19ye+btaAVB+Ap99rc3kwZKu17ZGOXV/Y0kDi/lt4l1g
 H8psHlgrEpRrPvFE/nyDVc6hGn/hbqRGfqkIYQjOf6qQMoqQUeBHT5pW1Zwlj7gY0k8R
 sg6Tb/sr/H6z2vnkKK+qix3mS2ZUzzTLJH7Tccb0lIwVm3hq7VhLTu2TIKNlpdL7EUP8
 CJHWBbVf8EdhFCPKeWok810tJZ9CUVUmjF0zOBprybK81ylXpkpyVnAxuKZ4UO4bS+27
 AgutnTWeJY2oOR7jZiGG6wUGjKzF+t4cueweQ9JDMgTcvQqthQJ7GwKojIGrMAlauLFh
 eXWg==
X-Gm-Message-State: AOJu0Yw6WVZ33ght5vlGXnBPuloozgmeFPT+wzbNKT6kVFpHkKDmteoZ
 IyOjg+iEyWOOEY7ZLjRXP+nxKg==
X-Google-Smtp-Source: AGHT+IHxSewTU6hFkzAFO0bORDvuyOVT12MExZQwyZ0kjOXLTHosgWXWqNFQgNbT4IUSp4J6SzGfhg==
X-Received: by 2002:a5d:452c:0:b0:317:393f:8633 with SMTP id
 j12-20020a5d452c000000b00317393f8633mr1802216wra.58.1693573174232; 
 Fri, 01 Sep 2023 05:59:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3703:9105:daa9:3af3?
 ([2a01:e0a:982:cbb0:3703:9105:daa9:3af3])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a05600c0ada00b00401c944b7adsm7892942wmr.26.2023.09.01.05.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 05:59:33 -0700 (PDT)
Message-ID: <25fb0b08-15ef-4a73-a991-30bd4920514c@linaro.org>
Date: Fri, 1 Sep 2023 14:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Add Jessica as a reviewer for drm/panel
To: Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
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
In-Reply-To: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
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
Cc: dmitry.baryshkov@linaro.org, sam@ravnborg.org,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2023 00:57, Jessica Zhang wrote:
> As I participate more actively in the drm/panel subsystem, I would
> like to get notified about new changes in this area.
> 
> Since I have contributed and continue to contribute to drm/panel,
> add myself as a reviewer for the DRM panel drivers to help the review
> process
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 60ecad7576ff..797c1823d420 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7096,6 +7096,7 @@ F:	include/drm/gpu_scheduler.h
>   
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
> +R:	Jessica Zhang <quic_jesszhan@quicinc.com>
>   R:	Sam Ravnborg <sam@ravnborg.org>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained

You're welcome !

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
