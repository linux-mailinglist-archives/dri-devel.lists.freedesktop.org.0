Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935252EB467
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 21:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A056C6E081;
	Tue,  5 Jan 2021 20:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E677F6E081
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 20:48:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y19so1499466lfa.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 12:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=VI6nFNhOrDBsKOeartd6J0bcnx10OA5inX4UBRpL4qE=;
 b=XMzvAK1uTDP9sqD7pLv4Wz7WB5ahyaA4m6Kusb5//KKj6ORucbf4DEkHedVG2WYchx
 ww5E+S2pe/MVFqDwCWn3GDiS2f5riKTPoV75h71RVrW0K2vBiy9ckj/U7dA9PWNjyCNI
 nX5bomPKCcbVJeOgp/Cj7QeOBmzBoXkvbgT+W8lDuSsHgW8SMCpsK5rlGY82XsKP7qkx
 a29IAV41Ls1xim5un7jcVMha0ymLBu7etMhtRuauiNm4Zo6NPbxuUdxGaFB5dXcGICKr
 V9gREmCqoUjAr+3BJU51evd6QVFkDSbGIsK3A3GwKvAN8OhPsBEmC8Moy5N8LCKzSIDI
 qz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=VI6nFNhOrDBsKOeartd6J0bcnx10OA5inX4UBRpL4qE=;
 b=OBebUL/Zwi2Ana+FvxJ6CP2GWrN2L13gL7493tFmGZnV8Uu4/ZU9jJsHcfwJd09aNb
 9cVbjNSAFO8AN6OXPmh537Zy2ipd1wXCUhutN16VFN2oTFmaRcNb7fCEmuvtulGv4v6S
 8D3sQAxQ3srksdoUWLfzMRw91658ELbvQvY607QZAi2O4OJtSoaQBFusXUw0doB3quBr
 NhivZa0PEaSIccUMPNdsTeO38wu3gRYbDrsGx9ViBa1ad94ZKS+INceOKU65UNcPcaCr
 rctaP4r2kylFXepA/XgTUqth6zpc8yQVj8bmW1QrC4+DE/JDmJtTIHsCPEmO7rNGBzXK
 DMcQ==
X-Gm-Message-State: AOAM531weJiOdecMmAFwBgvLtfveM/9G+O4KUYCtGDapKWX3tMl/FB6Z
 C5TYx6j1uw75JIXJGX1AwHeaq1TljC6x5qgNiWE=
X-Google-Smtp-Source: ABdhPJxu0obS2EF+VNsGTCaRCOLzZxvocXJO+DOkx1q/eD1CrMCNDr6ayRfy6f/783TFKHGmdZ4OqMWe5HwKjoHK0HI=
X-Received: by 2002:a2e:8084:: with SMTP id i4mr635086ljg.291.1609879708350;
 Tue, 05 Jan 2021 12:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20210104230253.2805217-1-robh@kernel.org>
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 6 Jan 2021 05:47:51 +0900
Message-ID: <CAGTfZH11n8cRbrNB6XbzCydR4387d7V-gmRWou8hFFXbFBgvHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
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
Reply-To: cwchoi00@gmail.com
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree <devicetree@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, linux-gpio@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, Jan 5, 2021 at 8:03 AM Rob Herring <robh@kernel.org> wrote:
>
> DT properties which can have multiple entries need to specify what the
> entries are and define how many entries there can be. In the case of
> only a single entry, just 'maxItems: 1' is sufficient.
>
> Add the missing entry constraints. These were found with a modified
> meta-schema. Unfortunately, there are a few cases where the size
> constraints are not defined such as common bindings, so the meta-schema
> can't be part of the normal checks.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ide@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
>  .../socionext,uniphier-system-cache.yaml      |  4 ++--
>  .../bindings/ata/sata_highbank.yaml           |  1 +
>  .../bindings/clock/canaan,k210-clk.yaml       |  1 +
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   |  1 +
>  .../bindings/display/brcm,bcm2835-hdmi.yaml   |  1 +
>  .../display/panel/jdi,lt070me05000.yaml       |  1 +
>  .../display/panel/mantix,mlaf057we51-x.yaml   |  3 ++-
>  .../display/panel/novatek,nt36672a.yaml       |  1 +
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  2 +-
>  .../devicetree/bindings/eeprom/at25.yaml      |  3 +--
>  .../bindings/extcon/extcon-ptn5150.yaml       |  2 ++

For extcon part,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

(snip)

Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
