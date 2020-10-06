Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6C2847B0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9054C892F1;
	Tue,  6 Oct 2020 07:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3D6892F1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 07:43:34 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id d16so1768123oos.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 00:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LzRJVHcc4AOcRIg5DtD/82Z3g3zvHdupm81fE1K+lIM=;
 b=jUYi6D95xZFs7sTKZImIfFJfY1tI78Q0y1uEqg1CFrzDR6fMnaq/oployCueWFlmT2
 Tu9zNLF+UXhwL4QGEKaN0ASfJMAvnTjY7wjoVoDq9aK4g6dIJwtgZ6uBPVp05VeD4uAF
 ZPYNTr3zY7VKnyPeUD2XiAeqaOCg7hTnOzY6CK0smBr5mSLeZLLk7R0mDZvXFpIXbGly
 5plKixQa4cI8UhBzTnZN+qhUKvkyBZKSVJyxEDCuBXf6qh/GwsYOVL8meZXLFtQy+vdd
 LiaGFjVH1otCxE25VkT+NB7Ab8Ha3ifPJyBQXkEMf+XiyVYAcDRYjIQX5jwhC2b6vcxD
 aqWQ==
X-Gm-Message-State: AOAM531HvzYH58I9KdZeKbw4RRl8LSBo+zCxsxHLLooMezBJj6KDpWbm
 6rvkw1IwKaTfYjDeYZFgF/yJ0nx6r3gqr7xg3pk=
X-Google-Smtp-Source: ABdhPJyU6RRQM46ugWdopDgtkhgi7iGduwzWS1jU+uDheEg5pvon8IztULtlGUyDWuzb6A77GTJ3kgcTOraYuvM5h0M=
X-Received: by 2002:a4a:4f17:: with SMTP id c23mr2343959oob.11.1601970213208; 
 Tue, 06 Oct 2020 00:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Oct 2020 09:43:22 +0200
Message-ID: <CAMuHMdVfNE_vLgmCEH7-cat_OasxxZ958WMDUmaFi8PbbEvbaA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To: Rob Herring <robh@kernel.org>
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
 USB list <linux-usb@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Linux PM list <linux-pm@vger.kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Richard Weinberger <richard@nod.at>,
 dmaengine <dmaengine@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 8:39 PM Rob Herring <robh@kernel.org> wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/bus/simple-pm-bus.yaml     | 2 ++

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
