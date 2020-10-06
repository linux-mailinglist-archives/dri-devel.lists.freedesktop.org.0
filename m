Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F17285955
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20106E893;
	Wed,  7 Oct 2020 07:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8997488DFC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 09:13:17 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id j15so871907uaa.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dDgYnCSpFzq6wD68V8dBs1dGtEohkus4tfFLo0MV6k=;
 b=mMV78gRfUiTX0Fhq7sbtPeAZE51FANqXe2ffb+yEjr5QoeawgMMwQ8XSrhilmLvHtx
 sEQF9fUq5Cmu8qOzxjbqa7RQXLkqpoqkoe++HcWkcaLYHbckkwjq/ue7xT3XAD7Uwx43
 V06RGxgjHInxMdw3DBkk+/9rjGYrV+FnbFAksujQ3/k0njBC0ztFm62WAFNts1zyT9yx
 oCohLIW+tNgNLvhP4H4CyiMr4WGBCs1Zex5WjzDVN9v47A0drQeaNuCYVRG5QCA6OMto
 TQSAPGix4TPbAEDvrfDxLrnk+h7EjMNps8LmL2KLypfVwnIUdvEC6slFmF9jTy6w85lq
 wAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dDgYnCSpFzq6wD68V8dBs1dGtEohkus4tfFLo0MV6k=;
 b=ipQoiiryTAYr4j+7ayGTSv3vDbHJT12DB5D2a55FxtYk+oo53/jJchRWF6yNzEUaAe
 ytfn0C6AJyA5jO2x5ANq1gJGoP06ym+RvBjotU0F38uzLpS/Dvixfz/3kBBfr0qGsh5c
 tw5CjKCVjmHcugmpqljU8A7julrMJvqwLltquRc3AScJ06ft8DTSD2450/6xnYouyyHB
 sDhFLE6JlQ6Zyt9PeP996JujUPHTowIOiA4SUXCvw8IxlcuDy99pUSTn/tj+4UT6FwtE
 jfmW0v1V//QmnQqfLzUw4DqFU/7G5nUzfwpUcJ8Nn3KRg8Englh8jaB6SMwkD+DZfCj7
 Xu1Q==
X-Gm-Message-State: AOAM531s3M7pGePA4pvB20PVugE/gEelMu0ZN0yxUuA/Kmx6bPJJ3nau
 Yq+a/IabFJ5FkfDx68OddgfdbsAjpMWV8PdBSwrRCA==
X-Google-Smtp-Source: ABdhPJyShwqC7yW6UgNo8q98koC+vDiOR29TMFNqADEMu067y863m4dqGu1r37N7vNMGC6BIcV2u4BNvWr4WQc/Y4R4=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr2309765uae.100.1601975596602; 
 Tue, 06 Oct 2020 02:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Oct 2020 11:12:39 +0200
Message-ID: <CAPDyKFqMic9_3OBvSWrdrXonDjeC+8kjDobTunijxvL6gYDPjQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linux USB List <linux-usb@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Linux PM <linux-pm@vger.kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Oct 2020 at 20:38, Rob Herring <robh@kernel.org> wrote:
>
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
>
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
>
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml        | 2 ++
>  Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/owl-mmc.yaml           | 2 ++
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml  | 2 ++
>  Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml         | 2 ++
>  .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml  | 2 ++

For mmc:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
