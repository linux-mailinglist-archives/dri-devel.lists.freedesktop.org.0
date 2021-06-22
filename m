Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB53AFEEF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF846E41A;
	Tue, 22 Jun 2021 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D766E41A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:17:41 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id x12so3648710vsp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 01:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0hVMlLFV5eIwzuXXBEJWEV7FxMfuDBGtQwv1PuAfDc=;
 b=iYHVkaLaq2rTrqTStvN12EG/Q6YntXS4khLZGjwrfjqx7zgRxplhLEbd2P6c2ujka0
 n+e1W+UDSj4FyIHVQasEdZm1lw0g/7RtMaZkitdpuy3yfAIBdP2sr+0vvMN2dF3Pg2fT
 OvPDBvylGcRKhTiAJVICHBOqh+bQnGGxJ1v+3HYkxWO9VSGTP54SbbovHFw3Pd4FNHIR
 eqsjp591+3lvt3QDkq1NmMmIcoVVNVc1I5/9nfiehzvNH1nmZWET+gcWvjhiSRJk5TOa
 pBBMB8e22jWh7yEBDN49pdYhEukMJTymtS7+px//5AgouqFBgmnQYfh7NF/LpQJkmMPJ
 ceqQ==
X-Gm-Message-State: AOAM531ZQN5V7GQoC5E76EB9AS+Mti5IlBCN0kLkVaKZPiuApOACZt3J
 gVunOQ+4FcOqHgYO2n7w75SHXRfDFSIJI19Mtl8=
X-Google-Smtp-Source: ABdhPJz3clw2O8tsVFk5F4OGcaBfo9Z8eHqvoF8LwYXAPGollSTCOREHx1S0f08A9nsiznMjaM5G5srL4UVXlJSotsU=
X-Received: by 2002:a05:6102:2011:: with SMTP id
 p17mr21421376vsr.40.1624349860512; 
 Tue, 22 Jun 2021 01:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Jun 2021 10:17:28 +0200
Message-ID: <CAMuHMdUGXu8yj3JWKwM8mt7axkrzGMiowC1t0PHrbpxRCBME3w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-phy@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dmaengine <dmaengine@vger.kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, Jun 15, 2021 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
>
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.

> Signed-off-by: Rob Herring <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -46,7 +46,6 @@ properties:
>
>    clocks:
>      minItems: 3
> -    maxItems: 5
>      items:
>        - description: GMAC main clock
>        - description: MAC TX clock

While resolving the conflict with commit fea99822914039c6
("dt-bindings: net: document ptp_ref clk in dwmac") in soc/for-next,
I noticed the following construct for clock-names:

  clock-names:
    minItems: 3
    maxItems: 6
    contains:
      enum:
        - stmmaceth
        - mac-clk-tx
        - mac-clk-rx
        - ethstp
        - eth-ck
        - ptp_ref

Should this use items instead of enum, and drop maxItems, or is this
a valid construct to support specifying the clocks in random order?
If the latter, it does mean that the order of clock-names may not
match the order of the clock descriptions.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
