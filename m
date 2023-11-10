Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D803C7E8412
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2627310E283;
	Fri, 10 Nov 2023 20:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141BB10E283
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:39:41 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6ce29d1db6eso1710095a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648780; x=1700253580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2mpCZw6APjzuy5DVtlkGaasSgeytmGTQ3T7Ai89NIc=;
 b=Li1av2Xnf5od6LBrQxYoX/1MTnLQFoc2yuvl2fLWocfWnFgwJT1jsYV8DkWBcLLK2a
 Sd0MR09AwxtujIcK8SpImVbOoQDulmKz4sVgaBPeM7TP22et7MR50mBwY1R5foRzLeg7
 amYvEAxG+fj9QNzpv2k0jWex3Z49aS0knHcek/4OAPmw+eOFUMsyOVQp7WHQbKA89/a/
 Z0A5poE88WOsqOY7OEtQDbPEZM3lLKCdSnGA+29wvB+p7/8SiCLsHXKgWlz7NmYX91xE
 m2zwoE2q9egUVHIIcVOdOYD37lU+unR50D/8fIg6PXKe14XiZ2vXLsrMzHkA5ypNYEhJ
 f0ag==
X-Gm-Message-State: AOJu0Yw9HeuXDWivUCG7CZJXakVqRjk6AUG7cWIT9KjZM/llKUM/SFEa
 i4oxQzoC75Ix1eTCVNn/sw==
X-Google-Smtp-Source: AGHT+IFDEevgxfWBbNoBxZy5wpEh6g0d1RAursubSv3B8D6mEOOuHNqGY4vD4lMK2cqLkNv2mYVlyQ==
X-Received: by 2002:a9d:73d0:0:b0:6d6:5175:50c9 with SMTP id
 m16-20020a9d73d0000000b006d6517550c9mr157442otk.6.1699648780318; 
 Fri, 10 Nov 2023 12:39:40 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i15-20020a056830450f00b006ce2b90d0cesm51017otv.24.2023.11.10.12.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:39:39 -0800 (PST)
Received: (nullmailer pid 392734 invoked by uid 1000);
 Fri, 10 Nov 2023 20:39:37 -0000
Date: Fri, 10 Nov 2023 14:39:37 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatibles for existing SoC
Message-ID: <169964877627.392672.14874068087701843483.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
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
 Alim Akhtar <alim.akhtar@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:30 +0100, Krzysztof Kozlowski wrote:
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
> While re-indenting the first enum, put also axis,artpec8-dw-mshc in
> alphabetical order.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

