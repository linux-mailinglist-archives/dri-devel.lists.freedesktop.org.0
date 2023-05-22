Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320E70B843
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6310E27F;
	Mon, 22 May 2023 09:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C0E10E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:01:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3667675f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684746088; x=1687338088;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oh7mdsuOL7H7gOrXFRel5Jq/6EKWLVhMC8a5/8h8WZo=;
 b=HLp85cy8rppc/poFiFPivVgWVSJETEatbW3RUzyalnjapNdcR1TZLQWG6nmqWras1a
 WziaQA/t0fQEQzUeZANlXUzGtKHqJQv54xHTcD5Lj1FirkzjbhMD7zQl9G5zzNmXEyaJ
 QAi4egNtZw6NbhUXLFR7hHFpYhC4DyMnEH0ZEPKJJ/9djnyrHb+h/KOxz4Us9GgjzOxe
 C6TF5ouSZDy/0hBfkZrjfhVz0xmBRAwDyabdprfcnw34gdxSIt5db0ChSW/hJlS0g6Qh
 AjZhqPWWRYVL0mcvTvtizvwbVvJ7n02sGWu6TJxHtPfBzqMIJCoYb9izmSPIMFyO3dQX
 liCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684746088; x=1687338088;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oh7mdsuOL7H7gOrXFRel5Jq/6EKWLVhMC8a5/8h8WZo=;
 b=ci6jwibQEC/AF1JAcng37ZHjQowaacI6R+sNrwc0bXqel6eU3hZLb4z9o15reWnKJH
 nu59Cd4L3zkkRf9WoS4LoGjnA2K/u6egF8G4r8qLnFnUqMXkbHrkmSg0F90mUx0hLTtN
 E8Nol/B/AfYotKbBIHGKvGIwSWVqK6IiYXkAauaav+EhCw3nqyKGD7UAm5qE3k7xhjxb
 wNbhuqQyIYWqgSg2jqcK87hP6n1Hh/0zc1nycisE8qqB5uLk6F7vf9S9qnpukgAXvpKN
 rcv+rH97m5Hwom610oNb1CLOsx6MwG+cpZY6Qn4v6GajXH16ITOgv1a31oq6zLto10qH
 rOVw==
X-Gm-Message-State: AC+VfDy1mwrHJ7/SW/5aUNq1E/tsp7CDa/DM6dQJOhTlrvk/iIq6biFB
 uDnFYPr1DgoCB7p98QYP71F0Zw==
X-Google-Smtp-Source: ACHHUZ4tSDVVpYCjEIBTjilRMO6W9tA8i/VqvF0ipfGxgq2yBbZSmlHIEMyxKj2YJMU2g29qmHcmPQ==
X-Received: by 2002:adf:fc43:0:b0:307:839a:335e with SMTP id
 e3-20020adffc43000000b00307839a335emr6254283wrs.44.1684746088328; 
 Mon, 22 May 2023 02:01:28 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adfe48a000000b002fed865c55esm6993892wrm.56.2023.05.22.02.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 02:01:27 -0700 (PDT)
Message-ID: <7c1a7897-48ee-f991-314e-3a88c51bbcc9@linaro.org>
Date: Mon, 22 May 2023 11:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 01/10] drm/panel: Clean up SOFEF00 config dependencies
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Caleb Connolly <caleb@connolly.tech>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-1-541c341d6bee@somainline.org>
Organization: Linaro Developer Services
In-Reply-To: <20230521-drm-panels-sony-v1-1-541c341d6bee@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2023 23:23, Marijn Suijten wrote:
> As per the config name this Display IC features a DSI command-mode
> interface (or the command to switch to video mode is not
> known/documented) and does not use any of the video-mode helper
> utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
> uses devm_gpiod_get() and related functions from GPIOLIB.
> 
> Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2b9d6db7860ba..67ef898d133f2 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -608,10 +608,10 @@ config DRM_PANEL_SAMSUNG_S6E8AA0
>   
>   config DRM_PANEL_SAMSUNG_SOFEF00
>   	tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select VIDEOMODE_HELPERS
>   	help
>   	  Say Y or M here if you want to enable support for the Samsung AMOLED
>   	  command mode panels found in the OnePlus 6/6T smartphones.
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
