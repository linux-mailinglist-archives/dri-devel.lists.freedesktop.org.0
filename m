Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E58B026F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECB4113876;
	Wed, 24 Apr 2024 06:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FMcaEmxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABBB113876
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:51:21 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so4783733f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941479; x=1714546279; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5fhRPEnVPqfUJjDOhDV7MC9ZHHIfbOjexEAXqhIdO3Y=;
 b=FMcaEmxfCZHBBejA/+T2nXq2tHTBYvOrjUC1HGasBbx71npClIMJPQ7xvEaMQJvlk6
 GI0G+A4pIi3v0GCn7i01bsnjsBu63nul4j9wg9WXNLYMEO+i4LaVTHAm9nChOLuD0LQ6
 snY6ZTlNz7jt7JTDQFZjBFAsWUzcpNosj1tfQAuUjyNnzwFhXwlpyga4z6Zi7TlnBOP6
 oryEV/I22c47o7hrjUlDlDdldKS557Yqi3LK4ujUqsOWyKL/k/574FF5bnAICr/bB6Bo
 pdkgnhb5sUOHG+8Ec2KPteQpbCmnRqUWJJIHLSQHHDCJ26VodN2m5iwI6rfJPnH4De/e
 OLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941479; x=1714546279;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5fhRPEnVPqfUJjDOhDV7MC9ZHHIfbOjexEAXqhIdO3Y=;
 b=OLgzmqeuFSca5XOMc1wPSAkzOZPOjH9yZd/MsNDClqCO8oylyS+acocNQMgSqV8QXz
 cFo2pxMgvxT+xuKgesbMnpXJlNsTj3PBnR2zAISlVCuFH0Skhe+OM9741rwztb9moT6W
 XJfrqoIYvr2dc2QdZMohr00p15qX3FK26g9jOlH58ZbpLNiOO1sl6PbGrafCfy8cocvV
 sUKLJ+aPY7RA7Qa9ZF03UtlMnh/M9BYiOH7Llmbje66XYVFCSrcgXGTGHytVXqrAfnRc
 Zjehj5anfcM42sKuXQzUVznhqkdYWf8AMpgTfHxWBWBSW962VflfZyL1d0RskeSb9nsB
 O5Gg==
X-Gm-Message-State: AOJu0YzYcJwLEa+R/yW8Ttc/4EQqoQgbHSpnoQU55I54YKJ9kPKpoyWF
 Kj688yMdLN0cexfMWWkB7THub/wfLmKHojaNiyJIAHsd84aEz6F4yxCuCLTuRdk=
X-Google-Smtp-Source: AGHT+IER+PTkXrM2sYTgRDnw/H8j7tp/CT8JUDUe2TAwv1AXC+oqV7npD/LeU5lehsx1WtbbguW2Ag==
X-Received: by 2002:a5d:5243:0:b0:343:ba58:97c4 with SMTP id
 k3-20020a5d5243000000b00343ba5897c4mr800456wrc.10.1713941479305; 
 Tue, 23 Apr 2024 23:51:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7?
 ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
 by smtp.gmail.com with ESMTPSA id
 cs18-20020a056000089200b003437799a373sm16429555wrb.83.2024.04.23.23.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:51:18 -0700 (PDT)
Message-ID: <ec748d7c-b1cb-4ab3-88e6-b624b1f086de@linaro.org>
Date: Wed, 24 Apr 2024 08:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: jdi-fhd-r63452: make use of prepare_prev_first
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 y.oudjana@protonmail.com
References: <20240423-jdi-fix-v1-1-808970662b40@gmail.com>
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
In-Reply-To: <20240423-jdi-fix-v1-1-808970662b40@gmail.com>
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

On 23/04/2024 22:54, Barnabás Czémán wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> 
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> index 3e0a8e0d58a0..483dc88d16d8 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> @@ -247,6 +247,7 @@ static int jdi_fhd_r63452_probe(struct mipi_dsi_device *dsi)
>   
>   	drm_panel_init(&ctx->panel, dev, &jdi_fhd_r63452_panel_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
>   
>   	ret = drm_panel_of_backlight(&ctx->panel);
>   	if (ret)
> 
> ---
> base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
> change-id: 20240423-jdi-fix-986a796a3101
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
