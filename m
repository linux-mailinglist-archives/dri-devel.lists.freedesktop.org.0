Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40641ABACF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 10:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD406EB26;
	Thu, 16 Apr 2020 08:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824C16EB25
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:07:38 +0000 (UTC)
Received: from localhost (unknown [223.235.195.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D38A206B9;
 Thu, 16 Apr 2020 08:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587024458;
 bh=+AtB2qrsVxt1QWCAagtuBV0iMzA+FqM4hoS9ArXVBXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2SDVAHMhpWjl2KgmMtDeMa4mCSN5E7syFhtD6nl+7e+uOtdm92iHSJh7of/HWeSKy
 HDPx9eDy3/ziMPBERearhYxolH1rzEwouN2J1vLT/RYfJAdCvbbfyQVciDd7LjXhj3
 Rm7XEVuyXLSwCmFC9enIFNjzAhrkqZPWIGTVc9wk=
Date: Thu, 16 Apr 2020 13:37:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416080734.GJ72691@vkoul-mobl>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15-04-20, 19:55, Rob Herring wrote:
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
> 
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/cpus.yaml         |  81 +++---
>  .../devicetree/bindings/arm/l2c2x0.yaml       |  87 +++---
>  .../devicetree/bindings/arm/psci.yaml         |  15 +-
>  .../bindings/arm/samsung/exynos-chipid.yaml   |   5 +-
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   5 +-
>  .../bindings/clock/fixed-factor-clock.yaml    |   5 +-
>  .../bindings/connector/usb-connector.yaml     |  28 +-
>  .../bindings/crypto/st,stm32-hash.yaml        |   9 +-
>  .../allwinner,sun4i-a10-display-engine.yaml   |   7 +-
>  .../display/allwinner,sun4i-a10-tcon.yaml     |   5 +-
>  .../bindings/display/panel/panel-common.yaml  |   5 +-
>  .../devicetree/bindings/dma/dma-common.yaml   |   3 +-
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  18 +-

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
