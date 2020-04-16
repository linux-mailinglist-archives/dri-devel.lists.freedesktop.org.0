Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF141ABACB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 10:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5D86EB24;
	Thu, 16 Apr 2020 08:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E656EB24
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:07:14 +0000 (UTC)
Received: from localhost (unknown [223.235.195.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69F85206E9;
 Thu, 16 Apr 2020 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587024434;
 bh=6kwbxJH2RDveXqsZesbfmy1W3FzqE56YVY6CxJmBpFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O1d6NWlKFfnyKMYlp3FSfoZyP6WL58llnMOPAcukWE4NK15IAgUmTc9Oy1CJfBrQJ
 FzFh77ntmk81ok6QNhBa7Fsxt0mRWxySPBmmQLISyBFjZXKruM2zAQoNUgGwtCZMXr
 hATzQxclu6p7VFesf/GI28sOVbjEiU4zdOe4G2WA=
Date: Thu, 16 Apr 2020 13:37:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416080710.GI72691@vkoul-mobl>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
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
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/altera.yaml       |  6 +-
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   |  2 +-
>  .../devicetree/bindings/arm/bitmain.yaml      |  2 +-
>  .../devicetree/bindings/arm/nxp/lpc32xx.yaml  |  9 ++-
>  .../bindings/arm/socionext/uniphier.yaml      | 26 ++++----
>  .../bindings/arm/stm32/st,mlahb.yaml          |  2 +-
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   |  6 +-
>  .../bindings/ata/faraday,ftide010.yaml        |  4 +-
>  .../bindings/bus/allwinner,sun8i-a23-rsb.yaml |  4 +-
>  .../clock/allwinner,sun4i-a10-gates-clk.yaml  |  8 +--
>  .../devicetree/bindings/clock/fsl,plldig.yaml | 17 +++--
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 16 ++---
>  .../bindings/connector/usb-connector.yaml     |  6 +-
>  .../crypto/allwinner,sun4i-a10-crypto.yaml    | 14 ++--
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 16 ++---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   |  2 +-
>  .../display/allwinner,sun4i-a10-hdmi.yaml     | 40 ++++++------
>  .../display/allwinner,sun4i-a10-tcon.yaml     | 58 ++++++++---------
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 28 ++++----
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 10 +--
>  .../bindings/display/bridge/lvds-codec.yaml   | 18 +++---
>  .../display/panel/sony,acx424akp.yaml         |  2 +-
>  .../display/panel/xinpeng,xpp055c272.yaml     |  4 +-
>  .../bindings/display/renesas,cmm.yaml         | 16 ++---
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  8 +--

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
