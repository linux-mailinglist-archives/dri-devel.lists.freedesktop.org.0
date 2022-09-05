Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A55AD13A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81110E308;
	Mon,  5 Sep 2022 11:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EF410E303
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:13:45 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id c6so3833383qvn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7iAktJHc3w6rPsnzClYi6h63eWPfDzaVzHqTBIckRp4=;
 b=R7t2Qcp1lBflY1vcWSAvFGDpL1wm70fCepnWH+zrAbiof4E0R0r6MaodmK99KC/uqU
 lkRNi47VWEdS1Mh0Cq7rMIeuWmncJJ2cOty+OFE/rSCBYVUer1tDhNIt1xJajNoN+pha
 9hYFjgcUDhUv9vg4Rsjx4Td0f/j+c8XAElCdXPkz1XbyGCnZFSRjvecB8Dt/V/2ytwns
 pr0+QJCk5ml5PiGLXoq+OBMZT8nSbzyKkmBD4jlfWYYC6/a2AVD44sThrAdLIlOLbLDI
 BjJuCJ4ppbMAAjAsrBVEK+NW8M6uu3+DQvsU1sl/6kNwDh7BxhDa793GpPoaKD+rDvK/
 /Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7iAktJHc3w6rPsnzClYi6h63eWPfDzaVzHqTBIckRp4=;
 b=4NWesSV01njI+Aa4loHJpuBgHLrVL2QbGyTb6bbOlMmHSPI3PHeZ43qM4XP5QOMd3r
 WtDwZsKDsJJOVF8rpYEAn4Yx5CNn4ZvRZZ7+yy93glvd8yj5Tn6tK6yBgyfU1oQ7fkc1
 OQT4BZpXQ77o+zPnT5n6XSHeeXn6fGPMwMkIn8Ia9+9jG1TzPilJ+H50qfxgB/36ql0N
 hsJiCemXIBlDOka6u9J2sXkIht79BVeOk8+gAJ6NTt2wZf2HgxpusyEj0j3CG3XwPogb
 UpkWtfgZKnxEwkg40trTcqRkTPgxTZbZXuGGrRT7j58vDXgwFX52qZkHmpgwpQsH+et6
 lCVw==
X-Gm-Message-State: ACgBeo1y8K8kvYE2XU9nbDpfrzQ/bd7hh/MrzrRRyQDSt2slszh8ZS27
 fcmUPn4y17IZ+u6MQU4f9s3j9WGwyLtI0CbGWXk=
X-Google-Smtp-Source: AA6agR7NrRmeK1sjqt1ZjgVXwez7kxeuRCTCLwTPPcAUxaHLOiRLXkVvjX6xUtf8npwaMKmSjSHhnRIt4pJmIe7SA1s=
X-Received: by 2002:a05:6214:19cf:b0:4a9:4241:2399 with SMTP id
 j15-20020a05621419cf00b004a942412399mr1093930qvc.64.1662376424240; Mon, 05
 Sep 2022 04:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 14:13:08 +0300
Message-ID: <CAHp75Vc5cEs6mPSL1fkHBT2hw-CbmbELFwkEGvwxkrdEVF2K_Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] Get rid of [devm_]gpiod_get_from_of_node()
 public APIs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit. We can do that by switching drivers
> to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> the door to augmenting device tree and ACPI information through secondary
> software properties (once we teach gpiolib how to handle those).
>
> I hope that relevant maintainers will take patches through their trees and
> then we could merge the last one some time after -rc1.

I'm in favour of the series, but some comments would be good to be addressed.

-- 
With Best Regards,
Andy Shevchenko
