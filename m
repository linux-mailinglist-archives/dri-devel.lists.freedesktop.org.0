Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FDC799C18
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 01:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791010E14C;
	Sat,  9 Sep 2023 23:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4481710E2A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 16:32:05 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50079d148aeso5132295e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1694277123; x=1694881923; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QWbjfl/Hk2RnIlFWrrwiyHEBruSksmwSJroOLaBDIVU=;
 b=bWxPsh1BbuDMs7XHtTHm6gLWwPLYuIbIiEN1VXM/yBV9HHs3rLSad9Nf7DJ7B1Uoo0
 a6D35RvAx4/O5zXdVPbuMuFe3XAaAg4giuM23itqIDkrXTQA1ShvyeoUyz4Ubvn6USs7
 dJ+cKGCAbo3hfxLTNKqvKAGCx4ldZQrsmvsDtSSKpa6wudyXyWzp5VuEkcqqLLUGwqEU
 euyQiaHWvgixsYI6GNxGOcxWmF1ux/NDg75BfnWc1S/yUH6qzpbWAG5+X7g70hBaqdSY
 cWs+/O3UKsIdc/iZ3QtMWNiuZVlkQSW9gKMgVAgwh2piVzgWwip+fIH3z9vOw9htu0mz
 7ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694277123; x=1694881923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QWbjfl/Hk2RnIlFWrrwiyHEBruSksmwSJroOLaBDIVU=;
 b=SFgx1IJMUlqXRQO3fRIElBvVM4QgFuhXAFjBSCeLP0vh8rwuV0GvHeDAxdJnmDoDq2
 rByxc7tGrBachSOE18CwOp98LSb58Hi7zq3MyVZd/zSyiAqTTEOldIXsmsEQmOtRF9V+
 T0OjgnePqdqdhWA1Mk7i8xOGpfPXOTSxqntCSo4U76LJeGxBaQsjVjSJHHlFC9+V43d2
 /qj0pFnine08nwT7UyRMtbp9eW9I54nYLxafGxo1AM4opoBL2P7g08AgJrNj26jaEdX6
 W9qiDiELceGhuy8RPnnimU4XKKRcsx2T+QmDWKTLBxFBHFzfE+BTegaUzqDdPGZPMAwT
 X09Q==
X-Gm-Message-State: AOJu0YxrS2XldURoIidk7QM1LqF55awmVDTK6RGImTEPC9Z5EUIUcAUz
 0lyCZ/MDYac08Z++Zb+b3g1UAA==
X-Google-Smtp-Source: AGHT+IE6HJLyxwxwQFrPSlfHd1gw3Q9wvTkYQGJDMz+fXr2oDA9FkHmK+u9f26Z0fQGULOWUI4pYOw==
X-Received: by 2002:a19:4f11:0:b0:500:bf56:cca6 with SMTP id
 d17-20020a194f11000000b00500bf56cca6mr3613215lfb.53.1694277123430; 
 Sat, 09 Sep 2023 09:32:03 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05640207c700b0052889d090bfsm2324360edy.79.2023.09.09.09.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 09:32:03 -0700 (PDT)
Message-ID: <7806f8d4-4bd3-e088-5a7d-2dfa8b1cc45b@tuxon.dev>
Date: Sat, 9 Sep 2023 19:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 8/8] drm: atmel-hlcdc: add support for DSI output
 formats
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230825125444.93222-1-manikandan.m@microchip.com>
 <20230825125444.93222-9-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230825125444.93222-9-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 09 Sep 2023 23:39:17 +0000
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/23 15:54, Manikandan Muralidharan wrote:
> Add support for the following DPI mode if the encoder type
> is DSI as per the XLCDC IP datasheet:
> - 16BPPCFG1
> - 16BPPCFG2
> - 16BPPCFG3
> - 18BPPCFG1
> - 18BPPCFG2
> - 24BPP
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> [durai.manickamkr@microchip.com: update output format using is_xlcdc flag]
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 123 +++++++++++++-----
>  1 file changed, 89 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index c3d0c60ba419..0d10f84c82d8 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -287,11 +287,18 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>  
>  }
>  
> -#define ATMEL_HLCDC_RGB444_OUTPUT	BIT(0)
> -#define ATMEL_HLCDC_RGB565_OUTPUT	BIT(1)
> -#define ATMEL_HLCDC_RGB666_OUTPUT	BIT(2)
> -#define ATMEL_HLCDC_RGB888_OUTPUT	BIT(3)
> -#define ATMEL_HLCDC_OUTPUT_MODE_MASK	GENMASK(3, 0)
> +#define ATMEL_HLCDC_RGB444_OUTPUT		BIT(0)
> +#define ATMEL_HLCDC_RGB565_OUTPUT		BIT(1)
> +#define ATMEL_HLCDC_RGB666_OUTPUT		BIT(2)
> +#define ATMEL_HLCDC_RGB888_OUTPUT		BIT(3)
> +#define ATMEL_HLCDC_DPI_RGB565C1_OUTPUT		BIT(4)
> +#define ATMEL_HLCDC_DPI_RGB565C2_OUTPUT		BIT(5)
> +#define ATMEL_HLCDC_DPI_RGB565C3_OUTPUT		BIT(6)
> +#define ATMEL_HLCDC_DPI_RGB666C1_OUTPUT		BIT(7)
> +#define ATMEL_HLCDC_DPI_RGB666C2_OUTPUT		BIT(8)
> +#define ATMEL_HLCDC_DPI_RGB888_OUTPUT		BIT(9)
> +#define ATMEL_HLCDC_OUTPUT_MODE_MASK		GENMASK(3, 0)
> +#define ATMEL_XLCDC_OUTPUT_MODE_MASK		GENMASK(9, 0)
>  
>  static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  {
> @@ -305,37 +312,83 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  	if (!encoder)
>  		encoder = connector->encoder;
>  
> -	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> -	case 0:
> -		break;
> -	case MEDIA_BUS_FMT_RGB444_1X12:
> -		return ATMEL_HLCDC_RGB444_OUTPUT;
> -	case MEDIA_BUS_FMT_RGB565_1X16:
> -		return ATMEL_HLCDC_RGB565_OUTPUT;
> -	case MEDIA_BUS_FMT_RGB666_1X18:
> -		return ATMEL_HLCDC_RGB666_OUTPUT;
> -	case MEDIA_BUS_FMT_RGB888_1X24:
> -		return ATMEL_HLCDC_RGB888_OUTPUT;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	for (j = 0; j < info->num_bus_formats; j++) {
> -		switch (info->bus_formats[j]) {
> -		case MEDIA_BUS_FMT_RGB444_1X12:
> -			supported_fmts |= ATMEL_HLCDC_RGB444_OUTPUT;
> +	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI) {
> +		/*
> +		 * atmel-hlcdc to support DSI formats with DSI video pipeline
> +		 * when DRM_MODE_ENCODER_DSI type is set by
> +		 * connector driver component.
> +		 */
> +		switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> +		case 0:
>  			break;
>  		case MEDIA_BUS_FMT_RGB565_1X16:
> -			supported_fmts |= ATMEL_HLCDC_RGB565_OUTPUT;
> -			break;
> +			return ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
>  		case MEDIA_BUS_FMT_RGB666_1X18:
> -			supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
> -			break;
> +			return ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +			return ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
>  		case MEDIA_BUS_FMT_RGB888_1X24:
> -			supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
> -			break;
> +			return ATMEL_HLCDC_DPI_RGB888_OUTPUT;
>  		default:
> +			return -EINVAL;
> +		}
> +
> +		for (j = 0; j < info->num_bus_formats; j++) {
> +			switch (info->bus_formats[j]) {
> +			case MEDIA_BUS_FMT_RGB565_1X16:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB666_1X18:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB888_1X24:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB888_OUTPUT;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +

blank line here.

> +	} else {
> +		switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> +		case 0:
>  			break;
> +		case MEDIA_BUS_FMT_RGB444_1X12:
> +			return ATMEL_HLCDC_RGB444_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB565_1X16:
> +			return ATMEL_HLCDC_RGB565_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB666_1X18:
> +			return ATMEL_HLCDC_RGB666_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB888_1X24:
> +			return ATMEL_HLCDC_RGB888_OUTPUT;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		for (j = 0; j < info->num_bus_formats; j++) {
> +			switch (info->bus_formats[j]) {
> +			case MEDIA_BUS_FMT_RGB444_1X12:
> +				supported_fmts |= ATMEL_HLCDC_RGB444_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB565_1X16:
> +				supported_fmts |= ATMEL_HLCDC_RGB565_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB666_1X18:
> +				supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB888_1X24:
> +				supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
> +				break;
> +			default:
> +				break;
> +			}
>  		}
>  	}
>  
> @@ -344,14 +397,16 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  
>  static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  {
> -	unsigned int output_fmts = ATMEL_HLCDC_OUTPUT_MODE_MASK;
> +	unsigned int output_fmts;
>  	struct atmel_hlcdc_crtc_state *hstate;
>  	struct drm_connector_state *cstate;
>  	struct drm_connector *connector;
> -	struct atmel_hlcdc_crtc *crtc;
> +	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
>  	int i;
> +	bool is_xlcdc = crtc->dc->desc->is_xlcdc;
>  
> -	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
> +	output_fmts = is_xlcdc ? ATMEL_XLCDC_OUTPUT_MODE_MASK :
> +		      ATMEL_HLCDC_OUTPUT_MODE_MASK;
>  
>  	for_each_new_connector_in_state(state->state, connector, cstate, i) {
>  		unsigned int supported_fmts = 0;
> @@ -372,7 +427,7 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  
>  	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
>  	hstate->output_mode = fls(output_fmts) - 1;
> -	if (crtc->dc->desc->is_xlcdc) {
> +	if (is_xlcdc) {
>  		/* check if MIPI DPI bit needs to be set */
>  		if (fls(output_fmts) > 3) {
>  			hstate->output_mode -= 4;
