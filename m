Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2976E2DD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B5B10E5C3;
	Thu,  3 Aug 2023 08:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9DA10E5C3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:24:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe0e34f498so1179196e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691051042; x=1691655842;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BikPyTGH8XLj6oQEB7BPtvNK4WnLaRDN13nGKi1oJVE=;
 b=ywwTs5Kqvxv83Q7qPOkeqWFTGbjtrD1R6w3fe+5R7nOvTt/KYcZism+o9vzivegeB2
 WCDMZMyOkxNKKUDk7R5ERntZdCAXdVGm22EfBEKdQpVp7M/8VDsgTHQaf6J5Wdkz9I63
 PQweH5xtDxJ8pSo0SXQb8NFiM5VulxUAHc57jiui4Lf8MVBh6SXNtVTG91KUxnWnEr61
 9RXmAuhuBA6KUwsXiSJ5QSvPqxsm5pWo1qtsq4DRXNq4uxMPTp9t+QPGkA+DfQgNBLnL
 ceN7xdT+BfDjXQ4vaHezQpMcydzjO+XumDW+cL0KS8Y9gO+HOpclgDOKVxhAmifaw3Ab
 v4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051042; x=1691655842;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BikPyTGH8XLj6oQEB7BPtvNK4WnLaRDN13nGKi1oJVE=;
 b=dazHvfq/DunxgjaQCqkrNdkEfirhm9RNDLc4Trauy/Kh5YkprGtgwx78Uuk0C4oleq
 d0N6B07XOeoeEtj2GX8ONVbBckEcovIExiX+se7HE/OI0B8+MtcZw0QU4/rAdMZsq3vk
 gQ9UDKIWpxeeuyB2nQWPv6r4Xr15wXaK12lhEdxpV3sulXK4d0PQeODHrMhIAqLdCcZX
 gLZ2CCIe6ccDufBf/iuamz+OlthmiGYx3Gud+ToM/ZCRyh+0HTlBm8RezcHtuGIeUpPj
 8ROYstmjgfvUzceDjmxDjD2NDpeUNUvtCI6+76pQnmznQjHEpT8sAoTFYUwWHM891Yhn
 8oTw==
X-Gm-Message-State: ABy/qLYa8bCLhmPQFD9szldgpV0+uZp21T7urDl4LbZvf4l0B4ZFrpBX
 60Rjtt0E2EnCTux7T7hUqVZoAA==
X-Google-Smtp-Source: APBJJlHTwBcuPhSakdCRp9/vWlM5s5wrAYYWoVvWTE4OGDGvANTqN1xGPLxkVk74cmRbnARSxV70KQ==
X-Received: by 2002:a19:6908:0:b0:4f8:4512:c846 with SMTP id
 e8-20020a196908000000b004f84512c846mr5762501lfc.49.1691051041583; 
 Thu, 03 Aug 2023 01:24:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966?
 ([2a01:e0a:982:cbb0:8656:583:d034:d966])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a5d404c000000b0031411b7087dsm21247295wrp.20.2023.08.03.01.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 01:24:01 -0700 (PDT)
Message-ID: <89fafd52-32b3-76fb-c4de-53c721c2dc3d@linaro.org>
Date: Thu, 3 Aug 2023 10:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-simple: Add Innolux G156HCE-L01 panel entry
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20230731210258.256152-1-marex@denx.de>
 <20230731210258.256152-2-marex@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <20230731210258.256152-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/07/2023 23:02, Marek Vasut wrote:
> Add support for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
> dual-link LVDS TFT panel. Documentation is available at [1].
> The middle frequency is tuned slightly upward from 70.93 MHz
> to 72 MHz, otherwise the panel shows slight flicker.
> 
> [1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G156HCE-L01_Rev.C3_Datasheet.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 396a22177c674..417dd69054fc1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2377,6 +2377,37 @@ static const struct panel_desc innolux_g121x1_l03 = {
>   	},
>   };
>   
> +static const struct display_timing innolux_g156hce_l01_timings = {
> +	.pixelclock = { 120000000, 144000000, 150000000 },
> +	.hactive = { 1920, 1920, 1920 },
> +	.hfront_porch = { 80, 90, 100 },
> +	.hback_porch = { 80, 90, 100 },
> +	.hsync_len = { 20, 30, 30 },
> +	.vactive = { 1080, 1080, 1080 },
> +	.vfront_porch = { 3, 10, 20 },
> +	.vback_porch = { 3, 10, 20 },
> +	.vsync_len = { 4, 10, 10 },
> +};
> +
> +static const struct panel_desc innolux_g156hce_l01 = {
> +	.timings = &innolux_g156hce_l01_timings,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 344,
> +		.height = 194,
> +	},
> +	.delay = {
> +		.prepare = 1,		/* T1+T2 */
> +		.enable = 450,		/* T5 */
> +		.disable = 200,		/* T6 */
> +		.unprepare = 10,	/* T3+T7 */
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode innolux_n156bge_l21_mode = {
>   	.clock = 69300,
>   	.hdisplay = 1366,
> @@ -4243,6 +4274,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "innolux,g121x1-l03",
>   		.data = &innolux_g121x1_l03,
> +	}, {
> +		.compatible = "innolux,g156hce-l01",
> +		.data = &innolux_g156hce_l01,
>   	}, {
>   		.compatible = "innolux,n156bge-l21",
>   		.data = &innolux_n156bge_l21,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
