Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3C991D20
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 10:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3561910E05B;
	Sun,  6 Oct 2024 08:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PNQy/73G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2E10E05B
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 08:14:19 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c883459b19so4112445a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 01:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728202458; x=1728807258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z3T5Hjfmtymv+/wWpF42wQYfRxK2aZeO3+nu4Wywvmc=;
 b=PNQy/73GfMyRjvjDcBC0v1LZ1mWrmnQMSMm9dhp1UjSXeBHVRGK2xgfdS0/fM6wjE4
 b7P3hPQV3igBPrFPgAB7uu5BiXHmZYJdZgYETMW36kCNHfjebDXQcZiSFoePxKjsUuiT
 WwH1wTrZye7j2DGoYrpYWM9KijvdRuIB2gOPeAh6r6G9Ug9FIJ+uCt4hjpxWFHkdrrjE
 efrTRqrBDLES0uIsMaOCa4snoLpNjDWTG3Mj6G746YMtxohm1tT/ZrXfmYNG5NlbwaTH
 5TtIVbQVipkmg2I+nS7Bl40Wbg05jRuPkSZobMFHFaCAuareynnyFrLO+nwSxeT61TbB
 lc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728202458; x=1728807258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3T5Hjfmtymv+/wWpF42wQYfRxK2aZeO3+nu4Wywvmc=;
 b=dgppJWSVAiPJ8Z/2hs8JDogWsWXangbY2N23OO7e4CQI0Z2/vLZeq28+OWvXB8RJWd
 45KihUeO97Wksi+T390OruIsN2R9c2jqcRxO4/nqQfWHERTW2r8/D3KrIpNf/qTc6jCg
 wCltOq64Ooi5ApTkx4wB4v0p0uDXBnZ7k5w9fH8PMS0TzfX6vxC1EeUg6PxWI5ekhwdH
 /Gl4Ybn8794TdEjplb1N9MZMvdzd22LzzIc6BX//SGY1vTlpadqjnq+a/I+CzjdPVwhf
 OOEzmfcFKpxe61TsDyKFhyCMRvyde46BtsUTEltXyjgiRwgQrpuP6ubvxy3g+r2L/63Z
 gSzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmFl6O0RP92yfLAI9r0btNZZJ+NpJYhjTy7drMgnG2CHJR501dfX2jObYs0u7sYg9fSi8gVYO9M1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKnK03pVgIGpP7qp75/nQsPXs+/Nt8/T8ss5FnBY2TvP6iYmwj
 nKW0mDwb4aVHcPg56zgRaDlGfv+KStNyFoHDyzSirv4JfVBRdgin
X-Google-Smtp-Source: AGHT+IHG1K1x0pP5Pn8L1WV8joKe+lZYAKwFgKNtSe3mpghD65+PEFtH7oYtHcRa9CsMIs3wXr0lwg==
X-Received: by 2002:a17:906:fe4d:b0:a90:1300:e613 with SMTP id
 a640c23a62f3a-a991c077ddbmr851592366b.55.1728202457375; 
 Sun, 06 Oct 2024 01:14:17 -0700 (PDT)
Received: from [10.32.3.23] ([95.183.227.32]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994a1464a1sm80746066b.106.2024.10.06.01.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 01:14:15 -0700 (PDT)
Message-ID: <61891c81-3172-4bca-a660-88518e051f9c@gmail.com>
Date: Sun, 6 Oct 2024 11:14:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yassine Oudjana <y.oudjana@protonmail.com>

On 05/10/2024 12:52 pm, Jason-JH.Lin wrote:
> If the constant alpha always set, the SoCs that is not supported the
> ignore alpha bit will still use constant alpha. That will break the
> original constant alpha setting of XRGB foramt for blend_modes
> unsupported SoCs, such as MT8173.
> 
> Make the constatnt alpha only set when setting has_alpha or supported
> blend_modes SoC to fix the downgrade issue.
> 
> Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 28 +++++++++++++++----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 703cd3f6c6d3..de3addd89442 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -494,19 +494,25 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   
>   	con = mtk_ovl_fmt_convert(ovl, state);
>   	if (state->base.fb) {
> -		con |= OVL_CON_AEN;
> -		con |= state->base.alpha & OVL_CON_ALPHA;
> +		/*
> +		 * For blend_modes supported SoCs, always set constant alpha.
> +		 * For blend_modes unsupported SoCs, set constant alpha when has_alpha is set.
> +		 */
> +		if (ovl->data->blend_modes || state->base.fb->format->has_alpha) {
> +			con |= OVL_CON_AEN;
> +			con |= state->base.alpha & OVL_CON_ALPHA;
> +		}
> +
> +		/*
> +		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
> +		 * for XRGB format, otherwise OVL will still read the value from memory.
> +		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
> +		 * affect the result. Therefore we use !has_alpha as the condition.
> +		 */
> +		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
> +			ignore_pixel_alpha = OVL_CONST_BLEND;
>   	}
>   
> -	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
> -	 * can be ignored, or OVL will still read the value from memory.
> -	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
> -	 * affect the result. Therefore we use !has_alpha as the condition.
> -	 */
> -	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
> -	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
> -		ignore_pixel_alpha = OVL_CONST_BLEND;
> -
>   	if (pending->rotation & DRM_MODE_REFLECT_Y) {
>   		con |= OVL_CON_VIRT_FLIP;
>   		addr += (pending->height - 1) * pending->pitch;

