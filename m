Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E31914549
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 10:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53A410E3B4;
	Mon, 24 Jun 2024 08:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a0XxrUXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0510E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:49:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42108856c33so29439585e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719218956; x=1719823756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qRHkXdLvarv+iQ4omrB/sCUIDOsvkQjA1vlU8xNHIOU=;
 b=a0XxrUXfRnYxRzcu5JAS0ehKQP3C6sNz5DBsSdzhtZuYaP4SkfHyQD5NOOmr7D1GEe
 cTpUNedU7wLaiTwQJdNE67lqttqTLdGMJ0JdGYYrA/ql+WA6PIIHTuec69aMnDq3Quid
 G8EEr4eqam4FYXxFE/QyTZKV2QQKkPlfn+2Q2StWvm9h6ut2pSYLXcimYXJm9uWfVXQ1
 aQOqsCrpLQHhIQwORsK9DAvjj2/gR096vnhPPaXxIoGrRhytQNX7TvEmPM2SwCn5s3t1
 8o2cevQGNRe0nEXRey+imdJ94QWEKIEDORA6L375dPxRg/hU3gt1RGu6GMoCfcdpNZZr
 aZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719218956; x=1719823756;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qRHkXdLvarv+iQ4omrB/sCUIDOsvkQjA1vlU8xNHIOU=;
 b=JeyO0BEgPcJ9qcJVhG89L2XONHvGs0BDxym35yPPWX6LVfc+DVnAp+FZZXCgfTFYwH
 n7s/C/I1Ey58SYi3mbBYyIjRkN5XqciOVAr1zdh3oeIXtzeraELpK4k7XC9ULkEWLgje
 4azuOPHwk+9gRbeUInD0j3utxgDhyyC/mVR5fM5vCfyhdaYNB7RhRlYVhc0ZwgM3BIBk
 GyFlIGsNHe7BLO2vUP70vV1c9Tmrj37CQPFSkrtJAZm+D+7/Ye2fHp1Wkejl3/XKzNl5
 arhN/VA0CXLg/wHiRXB293fBqB2OEAnBhkGb2DUV2xnz4B2V4zfiZLQr7kWCVyp8gcBa
 NY5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSBrkJy2qECUvyT+SWgGisJKo7ghPasL90XAg63g6lgFKbEOrOY/W2ypIthaf8dFC0l4L0hX2msYz/5VLX7LgvwOuucHpFk1TCG3jfLnUG
X-Gm-Message-State: AOJu0YzfNs5x1UMIF9qJxUlfmCZf4T2isHABwC8e2Qf7dcNGLQH4E49b
 tWXDdDOIQPTobVuZPCdH0kmkOAZPEgyarv2n/MpBuunUIIVBuZ4cx/GvByYJTG8=
X-Google-Smtp-Source: AGHT+IGu4z54nEtdCqbxfPqbNwMsgP6QHm2iowrK3TjwdkX6xGQkYLEJdq12JnpDlKFB1Yil9Zq1Ww==
X-Received: by 2002:a05:600c:470e:b0:421:79b5:6d84 with SMTP id
 5b1f17b1804b1-42489540d0fmr43312985e9.17.1719218955773; 
 Mon, 24 Jun 2024 01:49:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74?
 ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0b63b5sm165061555e9.7.2024.06.24.01.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:49:15 -0700 (PDT)
Message-ID: <d7fff0e8-6754-4bfc-b358-c557a5bd0ddb@linaro.org>
Date: Mon, 24 Jun 2024 10:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND] drm/panel: simple: Add missing display timing
 flags for KOE TX26D202VM0BWA
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, emil.l.velikov@gmail.com
References: <20240624015612.341983-1-victor.liu@nxp.com>
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
In-Reply-To: <20240624015612.341983-1-victor.liu@nxp.com>
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

On 24/06/2024 03:56, Liu Ying wrote:
> KOE TX26D202VM0BWA panel spec indicates the DE signal is active high in
> timing chart, so add DISPLAY_FLAGS_DE_HIGH flag in display timing flags.
> This aligns display_timing with panel_desc.
> 
> Fixes: 8a07052440c2 ("drm/panel: simple: Add support for KOE TX26D202VM0BWA panel")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 20e3df1c59d4..7b70606e5760 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2704,6 +2704,7 @@ static const struct display_timing koe_tx26d202vm0bwa_timing = {
>   	.vfront_porch = { 3, 5, 10 },
>   	.vback_porch = { 2, 5, 10 },
>   	.vsync_len = { 5, 5, 5 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
>   };
>   
>   static const struct panel_desc koe_tx26d202vm0bwa = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
