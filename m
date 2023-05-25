Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 743877107AD
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2961F10E7B2;
	Thu, 25 May 2023 08:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383AC10E7B2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:36:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-309550263e0so1751020f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685003787; x=1687595787;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=n3dgMxXDod8W5xFRkfrc3GHYIe7IJtWHOb1qHkVrSyw=;
 b=rAJr00uhitvg08RQiF4/r2qsuN54ed2qIy+jhMamu7WC+7DYjaVW38dSSK1ISlVYuv
 6A/z3EOKu/EPeDsga1H+cbaD08hWHaMazOLKcPDRmpRLY0IaVV+qAT2UjceMthQJ8huZ
 aaPBjtPUkpL6vAmnm2CICrShG7kQRnwmzn4zJvRgzlWPsMMA/KXre+5BSSCagb4f7m3z
 P9wvqV3my11UDuiug3DQg+sxf9PNuirNezxB4co6FLAgAsPpeZqcA/Bv/iHQdB7/40bu
 9kz9SoUv/oRNLmJvuuwV/BWANlSSV35QI/rlc1A/y6fIU3ILm0sNkvBivC26ukuQvqdh
 oPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685003787; x=1687595787;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3dgMxXDod8W5xFRkfrc3GHYIe7IJtWHOb1qHkVrSyw=;
 b=OzzLowyVB+MrtVdUMEKXEc630dbukSPYrXrtz/d7WaxDwKCDbBpD3LfbrdHN9IKRKa
 lOZlkzP344SxXcLnF20hxeiSfB3O8GBxKWzim+cemfLthj1Dd8wp5BL/rJkbvwSYDta3
 p222/DCafVxXq9IJxHInn8ukTKrLbqMdq0skM/3CRSd3OP3eShrVtEuCSNsn1Iq5xVFr
 jHKx3anJF2DPODttSMwdzhUWALm5UhaIu1HglsTGVjMnqVNVGe7b5v6+IhqGh97yqWR2
 Q+pROKxjSQCmviFeIaZfukAFOkthPUnEUeRqIPy8VPcwNKypPMzqaFKYVssUrULISbEh
 cpBw==
X-Gm-Message-State: AC+VfDz5jKGQ+dpjbo4ty3quQ3pT/kbR8DIIqmBjsyeZSVGfd9pescpc
 gDjmiBxawp7/0cL3LPItFgSq/g==
X-Google-Smtp-Source: ACHHUZ5nkq7EAYlDZowugr1Hfy9OT67waP2J4z6G+ddNE5NGUnlczveGmFzKp2JfbMx57X46VnG+Cw==
X-Received: by 2002:a5d:4b03:0:b0:30a:8c0b:3209 with SMTP id
 v3-20020a5d4b03000000b0030a8c0b3209mr1682351wrq.9.1685003787201; 
 Thu, 25 May 2023 01:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6?
 ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a7bcd88000000b003f6038faa19sm4812494wmj.19.2023.05.25.01.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 01:36:26 -0700 (PDT)
Message-ID: <5c5910e0-8a55-416f-e1fe-2a1b223558f5@linaro.org>
Date: Thu, 25 May 2023 10:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1684931026.git.geert+renesas@glider.be>
 <244d9471e0ed248ff2dea8ded3a5384a1c51904b.1684931026.git.geert+renesas@glider.be>
Organization: Linaro Developer Services
In-Reply-To: <244d9471e0ed248ff2dea8ded3a5384a1c51904b.1684931026.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/05/2023 14:32, Geert Uytterhoeven wrote:
> Add support for the Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD panel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5778824dffd47a31..467117c0b2c9d463 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -778,6 +778,36 @@ static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
>   	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
>   };
>   
> +static const struct display_timing ampire_am_800480l1tmqw_t00h_timing = {
> +	.pixelclock = { 29930000, 33260000, 36590000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 1, 40, 168 },
> +	.hback_porch = { 88, 88, 88 },
> +	.hsync_len = { 1, 128, 128 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 1, 35, 37 },
> +	.vback_porch = { 8, 8, 8 },
> +	.vsync_len = { 1, 2, 2 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc ampire_am_800480l1tmqw_t00h = {
> +	.timings = &ampire_am_800480l1tmqw_t00h_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 111,
> +		.height = 67,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct panel_desc ampire_am800480r3tmqwa1h = {
>   	.modes = &ampire_am800480r3tmqwa1h_mode,
>   	.num_modes = 1,
> @@ -3993,6 +4023,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "ampire,am-480272h3tmqw-t01h",
>   		.data = &ampire_am_480272h3tmqw_t01h,
> +	}, {
> +		.compatible = "ampire,am-800480l1tmqw-t00h",
> +		.data = &ampire_am_800480l1tmqw_t00h,
>   	}, {
>   		.compatible = "ampire,am800480r3tmqwa1h",
>   		.data = &ampire_am800480r3tmqwa1h,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
