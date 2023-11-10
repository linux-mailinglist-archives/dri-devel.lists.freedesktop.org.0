Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCC7E8431
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E361C10E298;
	Fri, 10 Nov 2023 20:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5717110E298
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:41:27 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-1eb39505ba4so1391558fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648886; x=1700253686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBHIKLn/Yt1i+AZlSPolEYBWZ3bHmDQq+CYq1w7SUZQ=;
 b=uI6ozaS18aQHNbz08Ozf63DciZ2IYivlztMSs384dfe1cBhApXuB9T2t347h5BuAxz
 rwBaSG1DbTH5dN0kGljpUpS3XAq4lfn7t17BrWGbCGQ1+Uir/ehPdClj6tTtfGvKrfMX
 JtlmKN0A61M8DGVft0XzyDOxi9UnP58bANCkX/ef5HS0jF0iv3yZrBFBUlU0mFVi42ce
 +x6/4kWfc4B6zJnyqLo3uvKDapBUEU7+2vJ+ZO+R46yaFAfiZiFThVH19R9JPNPBVBWn
 2ymUAw0eDz0BbIyjGSfmE86Stq/vCVsJ4yjChNGKMlhykptIXnEQjZOj8Vfxqiqd0CLT
 d/RA==
X-Gm-Message-State: AOJu0Yx7QyH9cjiaxD05Yt3E8/+a9O6tyW6WmuSseGiF57K5dfcVlIO1
 aniWUtO7MMjs/0+Q2NwJJw==
X-Google-Smtp-Source: AGHT+IGWPDVMk2FcTLN+vtGTQRj0d3U/p0JEK8eP2bUHcv7B2jUR734/Xzt7iQNmomOefFQYy76Dcw==
X-Received: by 2002:a05:6870:d07:b0:1ef:b16f:d294 with SMTP id
 mk7-20020a0568700d0700b001efb16fd294mr347134oab.38.1699648886590; 
 Fri, 10 Nov 2023 12:41:26 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 zl25-20020a0568716d9900b001cc9bc7b569sm59526oab.27.2023.11.10.12.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:41:26 -0800 (PST)
Received: (nullmailer pid 395677 invoked by uid 1000);
 Fri, 10 Nov 2023 20:41:24 -0000
Date: Fri, 10 Nov 2023 14:41:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 08/17] dt-bindings: samsung: exynos-pmu: add specific
 compatibles for existing SoC
Message-ID: <169964888359.395618.988473791083039735.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
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
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-rtc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org,
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


On Wed, 08 Nov 2023 11:43:34 +0100, Krzysztof Kozlowski wrote:
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
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

