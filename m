Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956627E8487
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0505710E29A;
	Fri, 10 Nov 2023 20:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2676610E29A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:43:21 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso1283082fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649000; x=1700253800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNaUrVj08NBtZOvpIGNqsCz93eA7N7P0VcAZpJigNHA=;
 b=tJ79I+Nwjo8MFBth27wbHWfyTUqXLuC8msu+ZWeXNg+WJ4cmv057RNh9QpE3+MhoFg
 +rQkgtJdkaASAhONrkHMyPvQYlnIodJ72rIaKNxODxNwlxzj8aGF5QPgbnkcGPY5/MiH
 KaurPh9Ulu9JusnhP7r+TKMdvQS6g5U1K83zbIl7YqvNQlGjXi1T87AvykANqKxWPq4Z
 qIvXzZhNwTImOM/hI4B3V7tupLQ/364qjtub0TDyFNKXl6/VXcuRd2oWr3CvUNdxp2ND
 qoozvUXtLWvXefhU+HgEqZNl2QHtG4NJb5vZhkAgwO9n/QJLzbHaTgQI0zwWwsbcTjqD
 Qt0w==
X-Gm-Message-State: AOJu0YzN7I8UWEXGdagbhiTTMFnYRCplYXzlvfilaT0S9/9B6TGawLIC
 9YIw4kgGn8/KV9Dpp0QglQ==
X-Google-Smtp-Source: AGHT+IGuCIrvtFv3ALEU5ciLcJTT36N1k9uB2xQVwrMFf1+eMSPG74AQUVS8heVBUqI66wOHlKeqbA==
X-Received: by 2002:a05:6871:551:b0:1dc:9714:e2b3 with SMTP id
 t17-20020a056871055100b001dc9714e2b3mr423099oal.7.1699649000334; 
 Fri, 10 Nov 2023 12:43:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l22-20020a056870d4d600b001efc94cc21bsm57823oai.58.2023.11.10.12.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:43:19 -0800 (PST)
Received: (nullmailer pid 398686 invoked by uid 1000);
 Fri, 10 Nov 2023 20:43:17 -0000
Date: Fri, 10 Nov 2023 14:43:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <169964899705.398637.5382830943719270282.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:37 +0100, Krzysztof Kozlowski wrote:
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
>  .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
>  .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

