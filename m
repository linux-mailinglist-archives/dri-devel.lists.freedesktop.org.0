Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3CA6E40C8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00D710E03C;
	Mon, 17 Apr 2023 07:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7210E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:25:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso1708757wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681716343; x=1684308343;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=n0rYTVHyfzk+AA90RB4PaE12jLu1c91LlkhqdOS7gNE=;
 b=Kp/WSvkWKkwRp+/+SYbAsGFQuhyJPQc3J386vLUGGqbwLRTDFaDd25Dnte13hGoJmF
 CUlrlbuy/kKMaRjEIlhVd7aCO3OzVd33KvSjOuI7gsJLvCayCRIq1FcHgHlHwRqpiZ6u
 /KI1myVLSWo4DsPGPEkFxToNi8vg+/pjmkwQgDY5awRepMFwO3r4w7qN2brAhEhF/p7o
 lIosi4UaAbbxzWMsbnzVkUr2Y1nInKPNNANjahgIxyJn5zZWwAIqJPB1xzw7NFHpt8Mx
 +St0bVgNPpyymuU+TeF0ixlp0iNXEvOq4oicav9+5FDrX6oLUzRAiPXSqR+MIkYes5Dx
 dmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716343; x=1684308343;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0rYTVHyfzk+AA90RB4PaE12jLu1c91LlkhqdOS7gNE=;
 b=WGEvadrPZM32jfDHtpW1uiDBtMBdMfBa6ptzeHlENQE6WdIe2NbTLCCZbD/x4URKmz
 fALTU+h9fUQtRm0HFEU3WISfvSgcud4Vgi3t6O6HCxyc17mUH+4P3HwNa6pB7oR5XwNU
 ZbgiH6Bj/YUZ0xeRoCWyoKSxN7EhXvq6HJaJ2OPJeVPYiel6xhDVrrn5uolFvwPSG+sv
 l7rYmR9vgr7YMI28cK8vibsgwN0vdXMP8TXIgIHTmHYYgUur/1H2O5NZs2q2NK/ogJMJ
 gX+pzpdhd9IfhjkhT0NyH9nMGbdh8xLn90ts1L9i4wb7vfJBi5agEBcetl/nIte7acF1
 ApTA==
X-Gm-Message-State: AAQBX9fNGYUtH/PVxjIX0BPdD6cyNa4w2WK89yAw5GqcLsXBxZspQvnN
 8IKKRvYRHqSwoTX7lNVBfpxHhA==
X-Google-Smtp-Source: AKy350YCTkjsvhIS77+h9VbIlJpno1ZUgjI0eD3gJS4kb3pm0Yr4qV5xUKScfdJ4ESLvXfQxOOlMlw==
X-Received: by 2002:a05:600c:2904:b0:3ee:3df6:e411 with SMTP id
 i4-20020a05600c290400b003ee3df6e411mr9570199wmd.28.1681716343086; 
 Mon, 17 Apr 2023 00:25:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91?
 ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b003f173419e7asm2778180wml.43.2023.04.17.00.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:25:42 -0700 (PDT)
Message-ID: <ea9f27a2-ce75-01a9-3758-0fe0bfcd1e5e@linaro.org>
Date: Mon, 17 Apr 2023 09:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: novatek-nt35950: Improve error handling
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2023 13:00, Konrad Dybcio wrote:
> In a very peculiar case when probing and registering with the secondary
> DSI host succeeds, but the OF backlight or DSI attachment fails, the
> primary DSI device is automatically cleaned up, but the secondary one
> is not, leading to -EEXIST when the driver core tries to handle
> -EPROBE_DEFER.
> 
> Unregister the DSI1 device manually on failure to prevent that.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index abf752b36a52..7498fc6258bb 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -585,8 +585,11 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>   		       DRM_MODE_CONNECTOR_DSI);
>   
>   	ret = drm_panel_of_backlight(&nt->panel);
> -	if (ret)
> +	if (ret) {
> +		mipi_dsi_device_unregister(nt->dsi[1]);
> +
>   		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +	}
>   
>   	drm_panel_add(&nt->panel);
>   
> @@ -602,6 +605,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>   
>   		ret = mipi_dsi_attach(nt->dsi[i]);
>   		if (ret < 0) {
> +			/* If we fail to attach to either host, we're done */
> +			mipi_dsi_device_unregister(nt->dsi[1]);
> +
>   			return dev_err_probe(dev, ret,
>   					     "Cannot attach to DSI%d host.\n", i);
>   		}
> 
> ---
> base-commit: 035ba5f9cf511b9299fd9c9d0688ef930d33c886
> change-id: 20230415-konrad-longbois-next-847d57abb4d2
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
