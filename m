Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8644CA7B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 21:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E94E6E0D1;
	Wed, 10 Nov 2021 20:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2026E0D1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 20:20:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t30so6040181wra.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8N5zck2lZ73SkM2NQ11BK2t2B+PlRhdbOumhV63HC0=;
 b=qKFvJ0mRzS4onF9aP8HHoue6h98f/odyPmuXAAZhMkapdkqBL9h0Md4lh/FGwrkXuV
 n8JHRLvMxTIzM5QN+SlzNAWr1ocp1bZgTo9qcotLoxaEO1e2supJ1irdbW8JRM/RyYeu
 QUpOpI/0pKHwGvbkzQZ7+6qeNyuaORPzTewNfiip6lxqo255Kvtut7I83qebCkbl8RMX
 MmnWKkIC+cz0IwYa9JHGs1hV9qOwDLs1RD/KWhzq9IG5kYa82gBPRQmMgnc2LWeE6u64
 AcpkSzfIcm3ETlDl/08zG2wcwPqJ+kK/uVFXkWe1XkW30fUQrPlAz0CqjareIg3cNCTs
 4TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8N5zck2lZ73SkM2NQ11BK2t2B+PlRhdbOumhV63HC0=;
 b=v+RK2hDXstqSq2wN8SXIxXJA5epQkj9diSlDk6GS9oJ4AjkjNKRcfBOx6bJRNOCgHw
 nSLR97uFuEQzGwQ4F6aSnqx9CmlGfSTu9Pzu8Rxa2JpFuIm5OtDwVlhU8Bc1u2lqPq3H
 y2lkDI7lFE0KexhbvtfGUTeG+x+2/nUEpDAlEgYYiiK06KGqRo+vVxh4eFOQHU9A5/Mx
 YMH/TmLpS0DM6Wkgf69d6l/lb1W7Pfdj7FehuxsIBnYgz592lB1EUOu1/CfAiYdf9agN
 ymy6AKQYs+u5uX+PhD6w5yu6oooPJIZ0bJg3vt3sTMVm4K7mhen2yyTwRL0qu0B8pO28
 cEIg==
X-Gm-Message-State: AOAM530EeuWybhumaBVDtgUCX67YkMEBwXOJp/J4nQKYyixMVWYTFfld
 qkzGxxHLv73xT4z3+ma3+o0=
X-Google-Smtp-Source: ABdhPJzftTRU6i59iGtVuByIAKaTeVB7dAcPFzpVU6OM08HJx1k+5MKpS/V+oIDwsKi1KY00XkkYhw==
X-Received: by 2002:a5d:5244:: with SMTP id k4mr2220805wrc.77.1636575647926;
 Wed, 10 Nov 2021 12:20:47 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id x13sm931574wrr.47.2021.11.10.12.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 12:20:47 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Fix RGB to YUV color space
 conversion
Date: Wed, 10 Nov 2021 21:20:46 +0100
Message-ID: <12887538.uLZWGnKmhe@kista>
In-Reply-To: <20211106130044.63483-1-knaerzche@gmail.com>
References: <20211106130044.63483-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Alex Bee <knaerzche@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

Dne sobota, 06. november 2021 ob 14:00:44 CET je Alex Bee napisal(a):
> As per CEA-861 quantization range is always limited in case of YUV
> output - indepentently which CEA mode it is or if it is an DMT mode.
> 
> This is already correctly setup in HDMI AVI inforame, but we always do
> a RGB to YUV conversion which doesn't consider that RGB input can be
> full range as well.
> That leads to incorrect colors for all CEA modes except mode 1 for HDMI
> and always for DVI.
> 
> To fix this, provide additional csc coefficents for converting from RGB
> full range to EITU601/EITU709 limited range and rename the existing
> arrays to clarify their meaning.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 24 +++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/
bridge/synopsys/dw-hdmi.c
> index 62ae63565d3a..1cba08b70091 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -80,13 +80,25 @@ static const u16 csc_coeff_rgb_out_eitu709[3][4] = {
>  	{ 0x2000, 0x0000, 0x3b61, 0x7e25 }
>  };
>  
> -static const u16 csc_coeff_rgb_in_eitu601[3][4] = {
> +static const u16 csc_coeff_rgb_full_in_eitu601[3][4] = {

I would rather move "full" and "limited" to the end, since RGB always has full 
range and we want YUV to have full or limited range.

Just one observation - no other matrix sets bit 15 in any coefficient, but yours 
do. I can't see anywhere documented if bit 15 is ignored or not. Can you try 
with it set to 0? If it still works, I would set it to 0 for consistency.

Best regards,
Jernej

> +	{ 0x2044, 0x106f, 0x0644, 0x0040 },
> +	{ 0xe677, 0x1c1c, 0xfd46, 0x0200 },
> +	{ 0xed60, 0xf685, 0x1c1c, 0x0200 }
> +};
> +
> +static const u16 csc_coeff_rgb_limited_in_eitu601[3][4] = {
>  	{ 0x2591, 0x1322, 0x074b, 0x0000 },
>  	{ 0x6535, 0x2000, 0x7acc, 0x0200 },
>  	{ 0x6acd, 0x7534, 0x2000, 0x0200 }
>  };
>  
> -static const u16 csc_coeff_rgb_in_eitu709[3][4] = {
> +static const u16 csc_coeff_rgb_full_in_eitu709[3][4] = {
> +	{ 0x2750, 0x0baf, 0x03f8, 0x0040 },
> +	{ 0xe677, 0x1c1c, 0xfd6d, 0x0200 },
> +	{ 0xea55, 0xf98f, 0x1c1c, 0x0200 }
> +};
> +
> +static const u16 csc_coeff_rgb_limted_in_eitu709[3][4] = {
>  	{ 0x2dc5, 0x0d9b, 0x049e, 0x0000 },
>  	{ 0x62f0, 0x2000, 0x7d11, 0x0200 },
>  	{ 0x6756, 0x78ab, 0x2000, 0x0200 }
> @@ -1023,9 +1035,13 @@ static void dw_hdmi_update_csc_coeffs(struct dw_hdmi 
*hdmi)
>  			csc_coeff = &csc_coeff_rgb_out_eitu709;
>  	} else if (is_input_rgb && !is_output_rgb) {
>  		if (hdmi->hdmi_data.enc_out_encoding == 
V4L2_YCBCR_ENC_601)
> -			csc_coeff = &csc_coeff_rgb_in_eitu601;
> +			csc_coeff = hdmi->hdmi_data.rgb_limited_range
> +				? &csc_coeff_rgb_limited_in_eitu601
> +				: &csc_coeff_rgb_full_in_eitu601;
>  		else
> -			csc_coeff = &csc_coeff_rgb_in_eitu709;
> +			csc_coeff = hdmi->hdmi_data.rgb_limited_range
> +				? &csc_coeff_rgb_limted_in_eitu709
> +				: &csc_coeff_rgb_full_in_eitu709;
>  		csc_scale = 0;
>  	} else if (is_input_rgb && is_output_rgb &&
>  		   hdmi->hdmi_data.rgb_limited_range) {
> 
> base-commit: 89636a06fa2ee7826a19c39c19a9bc99ab9340a9
> -- 
> 2.30.2
> 
> 


