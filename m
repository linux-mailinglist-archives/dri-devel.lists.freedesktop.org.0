Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA577B8C0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2041310E02A;
	Mon, 14 Aug 2023 12:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8FA10E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:37:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe8a1591c8so27889465e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692016627; x=1692621427;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TlIvr0fkgWj9OH257CwsuYbd1YZEKyLG860533ceSYA=;
 b=KWpnHkUGIjX/ReVnPDLgqaJ3BXFhG8B9m+jVtQzG5WOj+0jzaUW6VvUmafIBrS98J5
 hWlZVHb//Rgu3vR/vIR62pSEOXY4ndfKUVWlAYEuYdA7BrMElTuoKgmgOrHBwTBTv1Un
 0VV4DEFssVE/kDCHHz6wShmLCmKZK4679Equx7/vI4B6k6FCaSiO1NX+jhFGDmjyb5Lh
 Q2kAbUdeaQG217j6P2UaVND54x6A0KgnFin8vBv5s8w3xEhl5TdWvd5WlQXs7cGyS0/e
 i2CWa25bq60RNac59LxHBmxtAjBpaVINP2z0gdIHgh3N/xD2dGzSDfEmZYr4K/6W2eCT
 /Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692016627; x=1692621427;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TlIvr0fkgWj9OH257CwsuYbd1YZEKyLG860533ceSYA=;
 b=ToEYsY82c5s1QnjAm1hG1UTkfACF1/xsRqBF/iOKxir2cn0nHu1UaFaH7LeeHOWLE4
 te48PYhcujauG+wQVVdlqE8Cn4yANb/7BpTcxU2ktn9Xy5YHY7im+QeifNk9bYSCG2Vd
 Qcffe9TCcy6VPl61NwAdt7kuosr0Ps77sQR3l4ymVgRH+TjV509RwcRcsTHsnII2eKdB
 XOewlEuOqx0gDjAZ4Z68OmLTHfBzIkryz2zOgEPi0nQDjUFRKdW2L8tekqBpow8ORAO/
 SvN55e2Ls80GCGFOQnxg+3NCKpdnDwoKs74ynxCjuqcc8FRq32indrF1DfTKvERn9pPW
 oRtw==
X-Gm-Message-State: AOJu0Yw5wTtW6BTi0jXiP9E8FhPrCrPysSadQY8Wt9qiwqQMBVcu/l5i
 RorAeshz3DgU8TPLDf3QEpoNgA==
X-Google-Smtp-Source: AGHT+IFKxsiuL2vos6RnrXgQD29lDjWBiZF8TyS1r+pay2gx1GycmMCpzqqjliBrXMt+vMRRkJcusg==
X-Received: by 2002:a7b:c7ca:0:b0:3fe:1b67:db7e with SMTP id
 z10-20020a7bc7ca000000b003fe1b67db7emr7925038wmk.18.1692016627285; 
 Mon, 14 Aug 2023 05:37:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a7bcd89000000b003fba6a0c881sm17088850wmj.43.2023.08.14.05.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 05:37:06 -0700 (PDT)
Message-ID: <7047fbf4-fe47-4f4b-8129-8ad25eddf350@linaro.org>
Date: Mon, 14 Aug 2023 14:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Fix AUO G121EAN01 panel timings
 according to the docs
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
References: <20230804151239.835216-1-luca.ceresoli@bootlin.com>
Content-Language: en-US
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
In-Reply-To: <20230804151239.835216-1-luca.ceresoli@bootlin.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2023 17:12, Luca Ceresoli wrote:
> Commit 03e909acd95a ("drm/panel: simple: Add support for AUO G121EAN01.4
> panel") added support for this panel model, but the timings it implements
> are very different from what the datasheet describes. I checked both the
> G121EAN01.0 datasheet from [0] and the G121EAN01.4 one from [1] and they
> all have the same timings: for example the LVDS clock typical value is 74.4
> MHz, not 66.7 MHz as implemented.
> 
> Replace the timings with the ones from the documentation. These timings
> have been tested and the clock frequencies verified with an oscilloscope to
> ensure they are correct.
> 
> Also use struct display_timing instead of struct drm_display_mode in order
> to also specify the minimum and maximum values.
> 
> [0] https://embedded.avnet.com/product/g121ean01-0/
> [1] https://embedded.avnet.com/product/g121ean01-4/
> 
> Fixes: 03e909acd95a ("drm/panel: simple: Add support for AUO G121EAN01.4 panel")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 701013b3ad13..56854f78441e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -999,21 +999,21 @@ static const struct panel_desc auo_g104sn02 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> -static const struct drm_display_mode auo_g121ean01_mode = {
> -	.clock = 66700,
> -	.hdisplay = 1280,
> -	.hsync_start = 1280 + 58,
> -	.hsync_end = 1280 + 58 + 8,
> -	.htotal = 1280 + 58 + 8 + 70,
> -	.vdisplay = 800,
> -	.vsync_start = 800 + 6,
> -	.vsync_end = 800 + 6 + 4,
> -	.vtotal = 800 + 6 + 4 + 10,
> +static const struct display_timing auo_g121ean01_timing = {
> +	.pixelclock = { 60000000, 74400000, 90000000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 20, 50, 100 },
> +	.hback_porch = { 20, 50, 100 },
> +	.hsync_len = { 30, 100, 200 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 2, 10, 25 },
> +	.vback_porch = { 2, 10, 25 },
> +	.vsync_len = { 4, 18, 50 },
>   };
>   
>   static const struct panel_desc auo_g121ean01 = {
> -	.modes = &auo_g121ean01_mode,
> -	.num_modes = 1,
> +	.timings = &auo_g121ean01_timing,
> +	.num_timings = 1,
>   	.bpc = 8,
>   	.size = {
>   		.width = 261,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
