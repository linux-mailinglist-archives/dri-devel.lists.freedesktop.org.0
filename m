Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C07E8429
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FE110E296;
	Fri, 10 Nov 2023 20:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB47B10E296
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:41:12 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1e9c9d181d6so1421484fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648872; x=1700253672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sBu9jdlI8BmMP2EXqok2V/jfQ0F843VqKLKqoYajCbY=;
 b=BbYHCZ6LNHbEQr/Lm6RK61xBaNNvsNfyXDtCMiKdnOcomryiOAOyc8e3KBq7lGaq1z
 ArTeMrhZ5PmzyhPzmDcJQHbAr0ZvsrNYP4VpPexVJwwBz+qb0O29nCKO058hcHOYpzgy
 nVjVsohCara0QAoSb538AaiJ5sxU/jAB8MVor2IkvowGyszGjDdHR0SFRfBqzok3UIw6
 JQ0MATViaCTC85nWDNtrqfmqM+aNg4gwXnIwGo9FxLMAdlVm5QWHEXtd9RD3g7kaOAuV
 ZPJJ+DawMkXnU5b2VMTqJkqKrsHddNXwIPD1p4ajxDDEQs1cyeJBm6myiYtYEmhLIxVt
 zB8g==
X-Gm-Message-State: AOJu0Yybye5Q7lulauIbsMP+gG6R0aQl760HAF18Dnw4SJCL7Z+sCwdw
 jclf3JNI+iAv3B7RCUx+2Q==
X-Google-Smtp-Source: AGHT+IE7LNnk5DWomU2D9t+1ZTG+6ik+KpyphzRkzXtQujj9+w3A1KWUmfC2t3Snd6+6Q7shaSdaiw==
X-Received: by 2002:a05:6870:c986:b0:1d5:40df:8fb1 with SMTP id
 hi6-20020a056870c98600b001d540df8fb1mr335335oab.19.1699648871913; 
 Fri, 10 Nov 2023 12:41:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 mo37-20020a056871322500b001cd1a628c40sm57032oac.52.2023.11.10.12.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:41:11 -0800 (PST)
Received: (nullmailer pid 395219 invoked by uid 1000);
 Fri, 10 Nov 2023 20:41:09 -0000
Date: Fri, 10 Nov 2023 14:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 07/17] dt-bindings: serial: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964886893.395180.18336203725841457804.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:33 +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Re-shuffle also the entries in compatibles, so the one-compatible-enum
> is the first.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../devicetree/bindings/serial/samsung_uart.yaml   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

