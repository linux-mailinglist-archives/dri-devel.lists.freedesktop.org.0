Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFE7E5D86
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 19:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16B10E18F;
	Wed,  8 Nov 2023 18:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CC010E18F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 18:56:33 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1ea98ad294cso3123529fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 10:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699469792; x=1700074592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0s3leUhfdCXtqd2GQERP13Q2t1M8oOeLUmcRLyKV8Y=;
 b=sNsQkElQSJN5jDHMAoMNBykPPYMrycAczYRLzzRSotAfn49Y1s4VQJOtJaMx9q2OyE
 2BD9OQL4sgiXNje9U51Ss1EvcjYIuIT83qgxRkyIlDctI3XatlQdjIqRSXFL9NVWRPhp
 xEBHjjrfOug68PegpH8dzyHvn62Lf4CMyjU7EF1UbQAFWDABy2ISw/zfrgYTDBtppvVg
 8PzCQssPz5zFQTWLtkjG0VdOf8ZrRUoamw041hBWhkLLU1bbXcAUjiFOGb5MZxzZUXKL
 zQ+qL4qzG1M98AawyThkoMQhCq2E9htu4rnWQTK8LpX1FLTGaYBm7/w4JdXuANKhLvVv
 n6dg==
X-Gm-Message-State: AOJu0YypyLqCJvR9JpYOxHUrQxEJBrXub3KLTBxURHze3Nj/S6jHe7ZW
 VNB5TvPUUvrjRcmxbKo17A==
X-Google-Smtp-Source: AGHT+IE0mbiHvR9GjYeolkzHi9SUwOP9v8XsmJuVs9xWh9Zkn8dD1A7MBvs46KqOAxR54Xhtj5FP+A==
X-Received: by 2002:a05:6870:fe91:b0:1e9:af81:54c2 with SMTP id
 qm17-20020a056870fe9100b001e9af8154c2mr2838245oab.45.1699469792539; 
 Wed, 08 Nov 2023 10:56:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ef4-20020a0568701a8400b001efb3910402sm408267oab.0.2023.11.08.10.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 10:56:31 -0800 (PST)
Received: (nullmailer pid 2748787 invoked by uid 1000);
 Wed, 08 Nov 2023 18:56:30 -0000
Date: Wed, 8 Nov 2023 12:56:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 01/17] dt-bindings: hwinfo: samsung,exynos-chipid: add
 specific compatibles for existing SoC
Message-ID: <169946978921.2748598.1967407376619995212.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
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
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:27 +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/hwinfo/samsung,exynos-chipid.yaml  | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

