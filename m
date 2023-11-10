Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D807E8401
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD0B10E26C;
	Fri, 10 Nov 2023 20:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC2A10E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:38:15 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1f0820b7657so1279973fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648694; x=1700253494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nDEOGTCwLGe8/AbnY8N0ixov4mA0V6wpnOxoAqQPSK4=;
 b=WclM34DP0cp/VVapIlID5uMgdh6TG4DsrYflMNUOMBlaaO8UsIENVG+ZfFE4K1No8q
 odd/GJx0AOvW0mZE/AOOeETbgZLTkYg5sU2XQgGVqShy9Gn3wROanuRkuZdBX6gv/AXe
 ZNsvDI6OeZZnH0HQP/qNWjA9HXszr8HsfsXtRzWpHp5KoCHwxkVuMXRCX3KyAPGWPHU2
 fGfxmLuvJtSTfc7s/lckVH3ngizKXeZ7KPPqpzLKPdG8PsU2+//LeTyrRiLXpxpQ/spY
 3xtimdSZNUBLQwrMKl3Ae3bgl2X1cIou1P1f/0jGPqwzaPH7W+mGLXygzhZPkOSbUU7U
 WcpQ==
X-Gm-Message-State: AOJu0YynTZTdSbpkIVQ9HGVcxx4FpsyReYZ+6sy2VKdV0Zvxu1IfBWzz
 ccukYrgLJUv5MI/UzZhZqA==
X-Google-Smtp-Source: AGHT+IFVVQE4BI8cOz3AIQYw2pXVqurA/tQ+STytYpdzYk+6P+Wjdqy5vAj94WGd/H3Kxm+R2FQFzQ==
X-Received: by 2002:a05:6870:d1c2:b0:1ea:14eb:b741 with SMTP id
 b2-20020a056870d1c200b001ea14ebb741mr343191oac.54.1699648694529; 
 Fri, 10 Nov 2023 12:38:14 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056870a34400b001e9ce1b5e8fsm59655oak.15.2023.11.10.12.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:38:13 -0800 (PST)
Received: (nullmailer pid 390527 invoked by uid 1000);
 Fri, 10 Nov 2023 20:38:11 -0000
Date: Fri, 10 Nov 2023 14:38:11 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/17] dt-bindings: i2c: exynos5: add specific
 compatibles for existing SoC
Message-ID: <169964869116.390473.6961652258456026108.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-rtc@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:28 +0100, Krzysztof Kozlowski wrote:
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
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 10 +++++++++-
>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml    |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

