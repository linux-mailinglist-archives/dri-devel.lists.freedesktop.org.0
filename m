Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3D7E8442
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E962210E10B;
	Fri, 10 Nov 2023 20:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B385810E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:42:51 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3b3e13fc1f7so1412083b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648971; x=1700253771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYRGPcRyh2b3fkqQmyXc07beY1rNkEkbKXxns94N0UA=;
 b=q4+lIOi2rLLqGhHlVOITSnX/6TcdG4FFzNKNTMSQhXuLFWVpEnJMTap7Kx1UTT4qWu
 LYv05gTykzyHNdAhqnPdrrTo+Xo1U6muUtXSp7eSwPBwUqx9kiEZ4nGQHUpmTpKsmB7z
 YG21JVotZv4uJRCSDJzcyjhZ+6ezftc177nowmzj5NPQzt5qmEQrw7hv+sE1VKeYL6wX
 +nRU4q67fXImw20D6pqNqBUh17IbUDCgFhBkXpw5JvAxyu1fKHK9JkuRYVsaKlXYp2OL
 VKm2vD+sA+o7Ie2WDVoG6EIiAj8mzaIuUG7qmt15u3ZlpjrqTVv9d1Z4j+dSMG0YgA3X
 6Ndg==
X-Gm-Message-State: AOJu0Yzw9XW0i+GOiCmVekN7hKxv7i8rgM5C4dFjZvE0LcGS0wq3UKbe
 296PT4xHzP23EyURcfAIOw==
X-Google-Smtp-Source: AGHT+IEbpkkUwMS8m0HRQeTKdMYwXj4e9rjshafhVsgnG4tRletjT6wKTUFDB5opO1qLTOQnh19aYQ==
X-Received: by 2002:a05:6808:23cb:b0:3b6:d617:a6f7 with SMTP id
 bq11-20020a05680823cb00b003b6d617a6f7mr539897oib.3.1699648970928; 
 Fri, 10 Nov 2023 12:42:50 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x26-20020a54401a000000b003b2e3e0284fsm42223oie.53.2023.11.10.12.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:42:50 -0800 (PST)
Received: (nullmailer pid 397808 invoked by uid 1000);
 Fri, 10 Nov 2023 20:42:48 -0000
Date: Fri, 10 Nov 2023 14:42:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 10/17] dt-bindings: iio: samsung, exynos-adc: add specific
 compatibles for existing SoC
Message-ID: <169964896802.397769.16770997428730838541.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-rtc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:36 +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

