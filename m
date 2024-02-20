Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75285BE22
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAC010E423;
	Tue, 20 Feb 2024 14:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VidySOC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C410E423
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:08:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso643621666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438078; x=1709042878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DSMyX8FZ9wn9s6dszFNVxl4SdqcyAmoAGLVwPyba9iE=;
 b=VidySOC3TjeRcBsg8biwP/vt/U8oLXQ3EjnhP7GvlZXHJ6gxVbhHNgSJf3/ItHoIRe
 wukjeVYtjSyCFvvijpir04T6W1yjRvy4f9N/y3dDwJi6KhD4yrtCJcYYuN3utDP8zZTi
 8/lnShVpiPAgFkPoalMeBzaCemwEB4VjWrtdEQKeJiezPM+MufdhSD7ft4OMoTr7VDDJ
 zDuFY2TURp7CyxUwdljnTUT7kpgp0W7j4ciAsopUmgksGRNAxqW9rxf+22DM0AwzxtAB
 NsmcILWnK+5P4zdyjEmVkKqwZ2yB8jddQ87hPqUSLYklDMnLOtFpAtMd90UjUwA8ExrZ
 wX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438078; x=1709042878;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSMyX8FZ9wn9s6dszFNVxl4SdqcyAmoAGLVwPyba9iE=;
 b=xJp64ogGnJsc3M4MqEArLERUm7AlxFXAm11PoBt6VAo+NiXRwLdtjprihmHmH0pU5M
 bg0D6gJ3QOWpuymKdQglHtWbDtgg7qZoWm4AVb+yZ+rAXWnN8M5sP5F5umkxlN/wrjjx
 2sM7AL3YBXyiIWPdbiahbxr8iImqss6pDoltXI9YcBlhaRvoa9zwqpjrZ9chV9VxIwJJ
 Z4s/7L33VZ/zw5Of6d1OayDTljvMssJ8JFVlRTrSUmsGih4KIKqnuJ+QuEQfO7hn3OYM
 oyswQq7PzjFY3EkinRA9PkkpW0+QbkWJg1ACL96W4btAnLRQvk6hJff+pFEvA3PmIWtG
 zCjw==
X-Gm-Message-State: AOJu0Yzoin36Sa8wo5WV9w/11xFDwAZJ3wswBxc8PFV0t1YhQLkafl5o
 AnGADJTeZqgDd8gxo4AXLfQK/hnf37w/57UxZf8g1gXSn0KlMOKtUAfZQP6CdaA=
X-Google-Smtp-Source: AGHT+IH7KpLxnQBbQwJdCvCCTzsuWiXSt3e1ClIEjTyKYfW88fPzUAcb5CjerS4ur6N409QduSLclw==
X-Received: by 2002:a17:906:48cc:b0:a3e:6501:339d with SMTP id
 d12-20020a17090648cc00b00a3e6501339dmr4686923ejt.61.1708438078395; 
 Tue, 20 Feb 2024 06:07:58 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 vo5-20020a170907a80500b00a3d559c6113sm3974635ejc.204.2024.02.20.06.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 06:07:58 -0800 (PST)
Message-ID: <738dcf0e-57fe-4123-af83-be91d8166420@linaro.org>
Date: Tue, 20 Feb 2024 15:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] backlight: lm3630a: Initialize backlight_properties
 on init
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
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

On 20.02.2024 00:11, Luca Weiss wrote:
> The backlight_properties struct should be initialized to zero before
> using, otherwise there will be some random values in the struct.
> 
> Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index a3412c936ca2..8e275275b808 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -343,6 +343,7 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
>  	struct backlight_properties props;
>  	const char *label;
>  
> +	memset(&props, 0, sizeof(struct backlight_properties));

You can zero-initialize it instead

Konrad
