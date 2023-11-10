Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8027E8439
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E486210E299;
	Fri, 10 Nov 2023 20:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425F010E299
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:41:58 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6ce344fa7e4so1449615a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648917; x=1700253717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EBl5Xv3aZC1B/CoCuf5eLNa9yKY/Gkw4iwanxopftw=;
 b=LSDThcOc9/2bhmA7kv8KkZzJo3t1d7aXRokBbTzwg+MuBqoiKc91+HVT1SuhAMFSKe
 f0JjOLHc70GItNNn6N3Kf2umBk9lTP17WSN3Y70qK67wooxIJumOfNGxxqZD0OwOO95y
 AwTTBulAmhpg4DNgQRBxpJXG33H9lfd0ZyXApvyQFLpGgSC7m7RU2Rn2GJQ5B6XYljdj
 bCtHd9ZgjFD3V7dF3Sbh4wgl1Z21/Sr5LWQ+PaHEkxqtCF6tkeIa/LABd/bxW0yPjevx
 P1qrCltOE8FXhpE5XVZC2GvQEHHwhPuyjiow0JbbepI9aiQgYs7FvaRM0RSegVkgOTN4
 ngbw==
X-Gm-Message-State: AOJu0YzW7R5FL9YfcU9ZoQze0HjgcZmmGNkZnvPo1whvoESfBpGnIWBS
 nt1bMc4goKcwJnkeL/1egg==
X-Google-Smtp-Source: AGHT+IF1/xoVIE1AxHEqioWJNWInr5h1m1P3hdrpoBOInT7vjcfYXrW2+GFkkUSryqGVJF7HdU+emA==
X-Received: by 2002:a05:6830:1302:b0:6c6:3ea5:cdbe with SMTP id
 p2-20020a056830130200b006c63ea5cdbemr259082otq.18.1699648917500; 
 Fri, 10 Nov 2023 12:41:57 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l19-20020a056830269300b006ce2fce83cbsm52548otu.25.2023.11.10.12.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:41:56 -0800 (PST)
Received: (nullmailer pid 396513 invoked by uid 1000);
 Fri, 10 Nov 2023 20:41:54 -0000
Date: Fri, 10 Nov 2023 14:41:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 09/17] dt-bindings: gpu: arm,mali-midgard: add specific
 compatibles for existing Exynos SoC
Message-ID: <169964891433.396452.11090809203947265672.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-10-krzysztof.kozlowski@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:35 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

