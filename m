Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046627E8422
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BBB10E295;
	Fri, 10 Nov 2023 20:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D6010E295
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:40:53 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1efb9571b13so1413350fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648853; x=1700253653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0iJFdRqfvLTCqUgEC28fOOuQc4nEg1ExrvWS4swH3k=;
 b=UHHj3GzvebM8nMpjCo3E07/ziBf76zJ/xq6bLIdykh40VacQAbwSX5Z/MXd96B9CjT
 exR5E8qvNCEO7LlkO11pDYfhVgfa1lmq1SubmT026fLZXeEmJDcdu7gqLUE60HPWPEM/
 Je7qdIW18xey2fCyNnAs8+LNR8mR9vFyjZKiKU0y2U4IdpUf7JVVQOoEEKgmcw+ulDmZ
 acVS/jdZspNYMx0exkfVWNwPKqRhrSzErhhQMJInXi/ZmdUY0YV8wX2iIh7KLDDgDFjI
 xPzhMvbLISNyl+ZFU5gy4Bh7LOlw7beUHvd6YPnj3YGNBRCmFI/5VUPmOGRfTOq5x2Ro
 5maA==
X-Gm-Message-State: AOJu0YxKo1XsP1KJsT+YaDV6Nxapjypxa+vrIkYBfj+1w+GY1EDo3LrW
 ZUu6edw/T6PwXRmdJ6EjvUhx3o19+A==
X-Google-Smtp-Source: AGHT+IHiBM+Pj8rwIjD5f5ElWq7IEopHChL5V1l1hLXxoRScz48VE6f3ZULiu1sG34gKSMusYsFlGQ==
X-Received: by 2002:a05:6871:4105:b0:1e9:8e22:24c6 with SMTP id
 la5-20020a056871410500b001e98e2224c6mr331624oab.44.1699648852849; 
 Fri, 10 Nov 2023 12:40:52 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y22-20020a056870725600b001ea4324364csm61318oaf.12.2023.11.10.12.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:40:52 -0800 (PST)
Received: (nullmailer pid 394724 invoked by uid 1000);
 Fri, 10 Nov 2023 20:40:50 -0000
Date: Fri, 10 Nov 2023 14:40:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 06/17] dt-bindings: rtc: s3c-rtc: add specific
 compatibles for existing SoC
Message-ID: <169964885014.394659.16948497259010559308.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-7-krzysztof.kozlowski@linaro.org>
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-sound@vger.kernel.org,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:32 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

