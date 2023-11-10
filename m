Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E677E8409
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8802E10E273;
	Fri, 10 Nov 2023 20:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E6010E273
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:39:12 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3b2ec5ee2e4so1427696b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648751; x=1700253551;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yS2DPG1f2BOqV0lB92Cpsm9LSSGSaVSlz4hVTLG41TM=;
 b=exsP7W+vB8LZ0zSigK5ONONg/qIXEx3fIvGY8XPxEf/u5MxSCsrPnRNFhKq8LxwbF7
 OWFlTzJ4eEfEltB2T96sPkJ1WAFZkYMnhXAkI85pfhaawymPyBCdQx/JId8p01l9gHAY
 +zWL2u26qCKTaUjKbDpQNiyVOArA9841UYX7gcD1oXUdk9iHHMl9N0lsNeb9lnD8f9xK
 bDfdY96y5ezZvEKbqqdbL9v5vQ72ZfODZLL6027fpTQRmIspj7r9uwpHTigJgiPHzjQ8
 LCHe+DOtM4fM7V04paYSFhD7awkPBHfbI4PqoBCypbjHiQEdbI1uUkUdOPK6HP/JTkBH
 8IPw==
X-Gm-Message-State: AOJu0YxmQi7PZy9rdW8y2lFYj1nP/3wOpUv30NTGT+H751qpKjtZKpE4
 ZPIz+BPWwdWmT2CcLpJyTg==
X-Google-Smtp-Source: AGHT+IE11yxoIUKi4thNm7Iyj/ixtWImO1W2Hn7ItLPU3Js0ofchT4UxunydV7s77gbgBpIQEqwLTQ==
X-Received: by 2002:a05:6808:14c:b0:3b6:c4dd:be83 with SMTP id
 h12-20020a056808014c00b003b6c4ddbe83mr464930oie.52.1699648751176; 
 Fri, 10 Nov 2023 12:39:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a9-20020a05680804c900b003b29c2f50f0sm43947oie.18.2023.11.10.12.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:39:10 -0800 (PST)
Received: (nullmailer pid 391980 invoked by uid 1000);
 Fri, 10 Nov 2023 20:39:08 -0000
Date: Fri, 10 Nov 2023 14:39:08 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add
 specific compatibles for existing SoC
Message-ID: <20231110203908.GA391217-robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 11:43:29AM +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
