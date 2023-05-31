Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E07717F46
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 13:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE71310E4B1;
	Wed, 31 May 2023 11:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166BE10E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 11:55:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so4210518f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685534150; x=1688126150;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WEd36hy3ThKcCMH7ZROUO7i+4T8Tnu5cbXYxxpHoTZ4=;
 b=HjcxddE0x6MCnxfyBMOC8XOYj6XdEjqr/ESEz9M5yOwpl4YJnPdYHvvV1iqIf3v21E
 O9ewxMjGP7NGtBImWjcISEUrHrio3Df39lB+Cqnmtp5B79ddpZXtXaD5GlsqmArbUBlD
 cCRJk8hnW+Le5/VATO8eqvi8km/jw3x43GUGivLxu8ziY5DzV3pJBce7bZnv4+U9U/7/
 JrB56aFQdMRyP18ac2OjG/VKp1d6mGkc9dA3KW7fRBDyxRQIiMv4M7Mlt8tN5YJqWlFE
 Cgnd7NG5SIlBkYR23/fdurP7Y+irjhmM9aDCnSNeP6JSEef+q4nLMap55fEYOeeTsbGM
 6QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685534150; x=1688126150;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEd36hy3ThKcCMH7ZROUO7i+4T8Tnu5cbXYxxpHoTZ4=;
 b=b9JrpuPOvP6956F2DpXOxM3tQqERQ1Qd0zTjlSgLDbeAdJZENTQNP34aQ9ss//jE91
 PBo2ijBDKu+33z/haIxgiwtnMfAleG1KiOIWu8LkJsxNma+UKmgTU66SGtpLn5Pzyt+a
 rcaaHMFBeVY4Z5EzvX9rCjlEL486Tw9CRgdKEGPiU2ntGC43iaQIjwgzsfs8q4NrLffu
 MShSXV9iYts05hhBnqtLh92v29rh2Zat80qjG/16c4UAMMyU1aenkTVPE/3ebkBTWFcJ
 RdMpa1iSdd71KsH98cZaXUGw85IQy4QxTUtKu5+hUdoeBpv2HTeJ9Ck0/XXvfiWMr2av
 6SvQ==
X-Gm-Message-State: AC+VfDxPnB4KGDI73m9TQbAIikdtN1Qc4Loe9F9yU9lL9YFB5QL9Xxdw
 /fZReJsNzSRaLzymT97BIzwWYw==
X-Google-Smtp-Source: ACHHUZ6kI8X8NP8AILCSybWYqTSH9EIv2i0NCD4qX88A8syY5ugQq66sKeWBuq74lTYGATWVWvPxRA==
X-Received: by 2002:a5d:448b:0:b0:306:3e96:6c5f with SMTP id
 j11-20020a5d448b000000b003063e966c5fmr4104805wrq.15.1685534149989; 
 Wed, 31 May 2023 04:55:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779?
 ([2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a5d558e000000b0030903371ef9sm6562204wrv.22.2023.05.31.04.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 04:55:49 -0700 (PDT)
Message-ID: <f7ef5cda-9372-17ed-89db-2f857b4d5971@linaro.org>
Date: Wed, 31 May 2023 13:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] gpu: drm/panel: Optimize the workflow of s6d7aa0_lock
To: Lu Hongfei <luhongfei@vivo.com>, Artur Weber <aweber.kernel@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230531110717.36896-1-luhongfei@vivo.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230531110717.36896-1-luhongfei@vivo.com>
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 31/05/2023 13:07, Lu Hongfei wrote:
> This patch optimized s6d7aa0_lock's workflow.
> Once mipi_dsi_dcs_write_seq failed, s6d7aa0_lock return immediately
> and no further actions will be taken.
> 
> Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 30 ++++++++++++++-----
>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..f98df32d1c55
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -69,15 +69,29 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>   	int ret = 0;
>   
>   	if (lock) {
> -		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> -		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
> -		if (ctx->desc->use_passwd3)
> -			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
> +		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> +		if (ret < 0)
> +			return ret;

mipi_dsi_dcs_write_seq() is a macro that already calls "return ret" on error,
so this is wrong, and there's nothing wrong with the currently upstream driver.

Neil

> +		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
> +		if (ret < 0)
> +			return ret;
> +		if (ctx->desc->use_passwd3) {
> +			ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
> +			if (ret < 0)
> +				return ret;
> +		}
>   	} else {
> -		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
> -		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
> -		if (ctx->desc->use_passwd3)
> -			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
> +		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
> +		if (ret < 0)
> +			return ret;
> +		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
> +		if (ret < 0)
> +			return ret;
> +		if (ctx->desc->use_passwd3) {
> +			ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
> +			if (ret < 0)
> +				return ret;
> +		}
>   	}
>   
>   	return ret;

