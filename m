Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA84284774
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59B56E3F4;
	Tue,  6 Oct 2020 07:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0E26E3F4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 07:37:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i12so5581481ota.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 00:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+YGZEZXCDlVSYcoSNcJ9v6pHT8JdkLtCN5s+E2ToaQ=;
 b=nciorO2Bb3dZVMoomEdg1TSxuWODO+rom8lrKhrdF3yCTSnOYvSjQTZ6a7wnGCToDL
 Za0ikysFRVqV4ubCRpRNehXXJKsvYho0qPfV1fXaSQhiJ2uriLIIe/Ml9lBVyWiJEDur
 xVAjBufu/Sl+8fn1eYSVCnZbg1vJ8h0lnGRZ9CTTZIxQq/wrrX3xpTMWcfNk61Gh4BLL
 vEQkH7GveuzTrjAyvDJT/7ISQryHxnNqFP2CXv12tiBEMRlf0Cs+1GkTnUG5EWao/Osp
 a53pI7tEoMaIyfkmVpCZrfH5Ti3lXFJWsNLnzP03gkX2qBEi440AtyalCUsqHp+ZPa0J
 xAsQ==
X-Gm-Message-State: AOAM533ZXdlKs4XGwecMvHL9dSwP53/rUGbPUekE4kR4bYRP7DGujbbS
 A6gVqUEHr3/Gcy2FLIrmERBVhkRI66YqROeGYMM=
X-Google-Smtp-Source: ABdhPJz2bCZlgB6we6A9AWlaXsOI2O+CwxUcnmKhPrIVPza5tGmo+mK6C98Ugzjy2W9HQnh3L0gpSmpM+xs5ujOFQMY=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr2082078otc.145.1601969875043; 
 Tue, 06 Oct 2020 00:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Oct 2020 09:37:43 +0200
Message-ID: <CAMuHMdXjBSzbs4yAPJ-XUTBRZWKN61hO8vQ1-nGN5nAo7JnV-w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Linux PM list <linux-pm@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Richard Weinberger <richard@nod.at>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Marc Zyngier <maz@kernel.org>, dmaengine <dmaengine@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Oct 5, 2020 at 8:39 PM Rob Herring <robh@kernel.org> wrote:
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

Thanks for your patch!

>  Documentation/devicetree/bindings/bus/renesas,bsc.yaml       | 2 ++
>  .../bindings/memory-controllers/renesas,rpc-if.yaml          | 2 ++
>  Documentation/devicetree/bindings/net/renesas,ether.yaml     | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,hscif.yaml  | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,sci.yaml    | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml   | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,scifa.yaml  | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,scifb.yaml  | 2 ++
>  Documentation/devicetree/bindings/spi/renesas,hspi.yaml      | 2 ++
>  Documentation/devicetree/bindings/spi/renesas,rspi.yaml      | 2 ++
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 ++

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> @@ -85,6 +85,8 @@ required:
>    - clocks
>    - pinctrl-0
>
> +unevaluatedProperties: false

This one has received an "additionalProperties: false" in commit
41506bff84f1563e ("dt-bindings: net: renesas, ether: Improve schema validation")
in net-next, which you probably want to remove.

> +
>  examples:
>    # Lager board
>    - |

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
