Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2E3AAF74
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 11:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E76E8C9;
	Thu, 17 Jun 2021 09:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30F6E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 09:15:02 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id j8so2626770vsd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NiiU6fiVLbE4syulfvGQUEnbQNZvmtFPXY1KRGZ4VKs=;
 b=tspUddDmWP1nXGb8dYzDapkXukDhtaQZ8yVoZQOykE4MszNmnQ2Jc7pAu3v7qBcemT
 UyLs98rU9nEy8e3wRIJkxsl8g3L8Eb/AvQODxlfCIA8Y+SqSVtbG2msAYvDIZFEizfbY
 20UD8As6h7+oRqO/LBfp1JKzos5qS4bIZn22juJCAEEZOMhbhqM1f/S6KCbcFkkK35Tr
 P7laFgsJQmqhNYip+ALRHKPPvbOtIHBYtRpZR/hgm9hpO06Ne5Y1MzvmGVRytTLSpocX
 +CLKqhQk6OUYMP0R+b/JJQ4/QkH+6e5JGgp8Hm8OfSHuZ6CIo4hVwTpj+jWWd51a3cq+
 7N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NiiU6fiVLbE4syulfvGQUEnbQNZvmtFPXY1KRGZ4VKs=;
 b=ifA+aFKUWPE3yeyj4KGymGzFQoKNBqMeTB7XcyoZvF/S/kfXeDCD5jGzp9rGjBL4mA
 cwsQf0ix3bl8poNscdMkC/vMFLPyvIWwxyKfJChWVSXewErpKv9fv6WLufW1MpVGGG7z
 mx32ZYg1e4co0hrkEEeFjmUSzGFnSYTNiZRNi2mh9staZa3UWak1r9FDzgEY073advmg
 DhVRidPFnSdsspd+4YabtoLYec/jL2WH/KEAlb6gAqdr1suiPKOSzMw7+2XoXSmqpva8
 iC+2Zid6hLF2MQI2qUh3TNXVhgYgZLUl78f4w0BQH5kYO8x/NGxax/rPijdtPt9At9af
 kTFg==
X-Gm-Message-State: AOAM533ASiNCSeGKvZfy/nV+/IRCZY0Ueg394lun0DKggMZ+thCAc/ny
 c8p+xo8WxwQCVkFBb+LisJRX/zd6rsiiOw9HKJqU7A==
X-Google-Smtp-Source: ABdhPJyDDRUn2syWiuy8XigFtL3iDYKz59Ub/6ekAvgFfmAY9tRuxX/nulbHrrDC8J99+RHvCUQeMQ9XnjKDaURJSR4=
X-Received: by 2002:a05:6102:2159:: with SMTP id
 h25mr3349328vsg.19.1623921301368; 
 Thu, 17 Jun 2021 02:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 17 Jun 2021 11:14:25 +0200
Message-ID: <CAPDyKFrY4UOO5CbZ8Bj7AH2+3Wo1PRpUv+Zs96tub=MzGuGrrQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Linux PCI <linux-pci@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, DTML <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-watchdog@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, linux-can@vger.kernel.org,
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
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Jun 2021 at 21:15, Rob Herring <robh@kernel.org> wrote:
>
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
>
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Vivien Didelot <vivien.didelot@gmail.com>
> Cc: Vladimir Oltean <olteanv@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # for MMC

[...]

Kind regards
Uffe
