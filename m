Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C956485BE4E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB9410E43A;
	Tue, 20 Feb 2024 14:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qJ2m+mlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1710E436
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:12:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33d73642accso80956f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438332; x=1709043132; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VlCI9F854lrsWDUIN6PG7zZ3hJeSzAbz00+8LmilWc8=;
 b=qJ2m+mlrxrDYG12c8oOzmEZonlAlSU7GtZyx1aqpd2R6j3dRsUVkZpQJ1EoLJhHcHs
 LWcTcuP/yHurXn20KKW61959VGP3XXPdQXC/+L2rmnzMNUx6Ee7yokinTqdsO/aHZwkG
 4Euuv5Q2cojd8F0DtADFBuYuBfxtA6L6v15U75/DDPLereDRxam8PdDiSuy5BkWR3ZP3
 OZ/JspdK/gwecfsG22MoDVd3ZoKSJP02QTp4hSYz+aYG2VUn0aYtnZdzJBT5irC9TKC4
 9yXGQ/f7LZULNlbZdB3TfGpqBongr8sqsG8owF6Oe5b5UZoC8yhkLCIpYgVxAfu6K4jV
 h45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438332; x=1709043132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VlCI9F854lrsWDUIN6PG7zZ3hJeSzAbz00+8LmilWc8=;
 b=pB6gJF3piicClNQ0KyFNrC1EJKI1uWwewkHHRW740d2Ur7AqY75CcnqhXTo/PMkZEP
 TOfVn+2E4MKQRAT1GpOrndgHX45oaGB1RPFoafzBSs+LcaNJtjPzwuWe672XrQYobinX
 PM4rffkyP6QaT3B+Hn0fmgOl0jidbmdrX9nDKiiHKzMhX2QO0M6hDxRCOJvBJMMm+46L
 0Qwp9dIbsL2x3L+yKVNvUo6AR8C2Pt6PZjB/Ft9ySg+Jux3x9oRh3goLVYALLDQ518sg
 AyIZVGIWiqztUG51bnrEI8JTqt99TmTg7grH7WS3bqgsOf2r5480wRICkqQvc7awNyHi
 6Z/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsdqai+7tLOXcHc6jvKFud1supRPdZi9XMGu82IjSJqI11N1eL2x1/IQh4DzXwb7ZtJVOJM/xQvWMO0lpM4bYMRHGEvD6iiORpp9WsXsXV
X-Gm-Message-State: AOJu0Yy5AF4BiH1/Cg77fpYaRXeLkQW4IImts0ccYFzJPihhbZ7LBacx
 sMP1yx3t3rJUU6rnDwVLSJtOrDxA6kQ/0hVBNywsW06o93eGSsdEDwrv5nBOQ4w=
X-Google-Smtp-Source: AGHT+IHoWaPYXgMjU6PeB2yk8TgKT2tZQUeUz9ykPdB+ZXJLtJWkH3ETMuOSkIOY4HbiE/fpQppbBg==
X-Received: by 2002:adf:ec44:0:b0:33d:3ceb:5308 with SMTP id
 w4-20020adfec44000000b0033d3ceb5308mr4607368wrn.42.1708438332431; 
 Tue, 20 Feb 2024 06:12:12 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a5d5a05000000b0033d60ab6bc8sm4662665wrb.50.2024.02.20.06.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:12:12 -0800 (PST)
Date: Tue, 20 Feb 2024 14:12:10 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
Message-ID: <20240220141210.GG6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-4-9ca62f7e4a33@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-lm3630a-fixups-v1-4-9ca62f7e4a33@z3ntu.xyz>
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

On Tue, Feb 20, 2024 at 12:11:22AM +0100, Luca Weiss wrote:
> Connect the panel with the backlight nodes so that the backlight can be
> turned off when the display is blanked.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> index 4aaae8537a3f..8eaa5b162815 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -182,7 +182,7 @@ &blsp2_i2c5 {
>  	status = "okay";
>  	clock-frequency = <355000>;
>
> -	led-controller@38 {
> +	backlight: led-controller@38 {

Again... a minor nit regarding existing problems but this node doesn't
follow the generic naming recommendations:
https://devicetree-specification.readthedocs.io/en/stable/devicetree-basics.html#generic-names-recommendation


Daniel.
