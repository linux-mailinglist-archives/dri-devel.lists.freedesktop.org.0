Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E17E8419
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6DC10E284;
	Fri, 10 Nov 2023 20:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB91C10E284
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:40:03 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6cd0a8bc6dcso1399364a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648803; x=1700253603;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIUKFeCBp8QWWYNKFRJyz0CogaqLBpf4Mvy06PqKugo=;
 b=rWGcRDHlYIDJE5ewNQD93g1i2gJ7ca7MYTv4s71eACk5EWu/FyTPE14YyU769xZbZn
 HIpKCxW5FIfSnRjwHqwWD7EPpBJoz2+pvNEB5+fIg43S9i8/THysYue4FKUKaTyx67MN
 C6qRcZv2H7lMBskSKcK+i+H/iKk6LEhwjRcesG1rcoQziijGFNFdjMtyx7oyjvXnBUWh
 Xh40rTG570lHM1NXM9KZKhUT2+X6iomOpW61MTOrwTCm4j3B8kdgGOHpqgoYsv0THw37
 NaRZmsy7qTcH4MSy2n2+0CIwacJBD4pIg15+ZohfvgzuVOk8m75Q/umrB5ZwBeXrdkOH
 TyJw==
X-Gm-Message-State: AOJu0YwTo2zee+HjI3VIUa4um0/KIhaflptQFnW0xr2braFXHiMGQNMt
 Vv2j/OXSgs5trg5KhchdMA==
X-Google-Smtp-Source: AGHT+IHRxgqmlIcaZxA+uUtss7i4GqToCENI8qvZ/6FLZfO0lFbqJf5Tp34OcuHctKTILzporo4hUw==
X-Received: by 2002:a05:6830:2644:b0:6ba:865b:ca72 with SMTP id
 f4-20020a056830264400b006ba865bca72mr207172otu.31.1699648803023; 
 Fri, 10 Nov 2023 12:40:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 do2-20020a0568300e0200b006d64467c68asm46743otb.77.2023.11.10.12.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:40:02 -0800 (PST)
Received: (nullmailer pid 393449 invoked by uid 1000);
 Fri, 10 Nov 2023 20:40:00 -0000
Date: Fri, 10 Nov 2023 14:40:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964880016.393384.2296633788360305234.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-sound@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:31 +0100, Krzysztof Kozlowski wrote:
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
>  .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 ++++++++++++-------
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 ++-
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

