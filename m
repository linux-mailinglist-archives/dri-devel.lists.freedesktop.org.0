Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10A7E848A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809D010E29E;
	Fri, 10 Nov 2023 20:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7DF10E29E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:43:37 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6ce532451c7so1342894a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649017; x=1700253817;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JelqBtasuctrFq8aA1lg5BQxbworEzE8yTnhOMjZkc=;
 b=v8wJmC90TkCA9g4oiCqzOcNo4vR7SvXXm/6EHr1CzZwCXcHCbZqA0JOpdM70/KtuSh
 n4mxea/bBsZNbWSIOIQh93xXCkf4LLtfSrRZ4gE2uJndUlt+fnqHr+6p/yUfKzbZfdY+
 9aGVfJimCr7uAFaxVf2cBIPxAJPZE5SsEoGo3bSlpEMev7Dj51ecYfUbE1yrmt79aCxz
 2PJs8DWuVMkHtclGq9TFsyCC99pbaFOHkayhrSRRSzeGoIpUz0StoblZob0p67WMcua2
 ifPfZKbr1bCIj8FRvh4Hx78UwUWEj8hCXyzL5LR+bG2W53FUJy4AcgJywVsiVqfIw40F
 6Y9A==
X-Gm-Message-State: AOJu0Yw4VRlU/AzpIwZAGb7U9yTK6bSvNIlytTWUkvOhnnbIXfSbCuNR
 Xtd+YYRsBHxa+iUSAAqMAw==
X-Google-Smtp-Source: AGHT+IHvxcWxE9DKzdafhiZ3HFcZS9N0tFj/iDRHQnxnirdx157d/x13I8sAnvTh754BbGSMSLyN9Q==
X-Received: by 2002:a05:6830:3492:b0:6b8:dc53:9efd with SMTP id
 c18-20020a056830349200b006b8dc539efdmr345339otu.3.1699649017102; 
 Fri, 10 Nov 2023 12:43:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l19-20020a056830269300b006ce2fce83cbsm52941otu.25.2023.11.10.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:43:36 -0800 (PST)
Received: (nullmailer pid 399226 invoked by uid 1000);
 Fri, 10 Nov 2023 20:43:34 -0000
Date: Fri, 10 Nov 2023 14:43:34 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 12/17] dt-bindings: pwm: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964901433.399188.3619478168082919994.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
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
Cc: alsa-devel@alsa-project.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-pwm@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:38 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

