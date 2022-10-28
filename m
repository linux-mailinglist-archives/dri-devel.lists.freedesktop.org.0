Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B1610712
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 03:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D1010E041;
	Fri, 28 Oct 2022 01:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDB810E041
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 01:06:36 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 78so3423915pgb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 18:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eouvp87d3Uwj62ptbIwj2FltIDQrDKmm7rl+pdi32U0=;
 b=nQ7weogHhMIC9v9rAl3TVZ1zfLs3IGvA3QKHPCFBZ+KojUNUj5TChT+OvOY12ityd8
 VbE20EYGCMWZidXQ0mA4iREKWBtYaSnvAUNEf/MGSFONDmzlPI+MR4CrUM9ksmAsrDKt
 cj+aWdebIPLIeH6IbKuwGrCytZHTwYkz2OUKYh4KijicqkVXtFp7vt0bi0LKmFm6i4xU
 q4LDtjxwFqoNAonlD9dnY2gWjZ01CSB3ruJJV2hDr7cYI/uKy5RyQ+vTowUxUWeVa6zy
 zJdma15Tr6xjC12xRbPs+cXXQMqUWSrtgiCQqqToh1CNrevC/C1rFj6Z+ww6/oTseywE
 yduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eouvp87d3Uwj62ptbIwj2FltIDQrDKmm7rl+pdi32U0=;
 b=Tq41NEnys3gucMzGB9o9tIxQJR5OrR9tjfoKzkhGzHJzh+6AajBYvZGvGGdz0RM1Wk
 vXzDZTcWHirxcxafM1MfPlXAfnBFU9HyGStJFFlw9lnlfViWN80lEW9QCsIya4EOEWSn
 9dfZgk3DvKiHm6eV9mUJgC0anGe4hqXwDub7OGbJhJotnaemPDVO8mZAYM2h+tvFFdvx
 XFJQhTVwoKUDRx6YdAwnwQQci9Zau9AH2CZnGwmTntvmWBI6y7fRwFj2UCA+z0i4msfo
 d5+bI+sZzQEyewmaNunOFnzI+m7ekclN2g+bv6hz10Yx+YEdRNivRouaB++D008T93G9
 CElg==
X-Gm-Message-State: ACrzQf3RtgRu2vVZXesGROQLz92h76rIQnO09Or8yFBzdQXbZGme7cn7
 W90vQPoF9fw4s9sKqBj+SUg=
X-Google-Smtp-Source: AMsMyM71t2M2+k7329f4iPqjn+WDD27m67jwDQ968XupuMJUSxT0+/ISWLqKZwmQAQWuSE8GPvBuVA==
X-Received: by 2002:a63:1917:0:b0:43c:1471:52b7 with SMTP id
 z23-20020a631917000000b0043c147152b7mr43836410pgl.522.1666919195743; 
 Thu, 27 Oct 2022 18:06:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea9a:801b:ed52:2db1])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902e21300b0017f57787a4asm1747996plb.229.2022.10.27.18.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 18:06:35 -0700 (PDT)
Date: Thu, 27 Oct 2022 18:06:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: (subset) [PATCH v1 00/11] Get rid of
 [devm_]gpiod_get_from_of_node() public APIs
Message-ID: <Y1srFi6mJGl5/3gi@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Guenter Roeck <linux@roeck-us.net>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lorenzo,

On Thu, Oct 27, 2022 at 03:38:11PM +0200, Lorenzo Pieralisi wrote:
> On Sun, 4 Sep 2022 23:30:52 -0700, Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit. We can do that by switching drivers
> > to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> > the door to augmenting device tree and ACPI information through secondary
> > software properties (once we teach gpiolib how to handle those).
> > 
> > I hope that relevant maintainers will take patches through their trees and
> > then we could merge the last one some time after -rc1.
> > 
> > [...]
> 
> Applied to pci/tegra, thanks!
> 
> [01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
>         https://git.kernel.org/lpieralisi/pci/c/16e3f4077965

Any chance you could also pick up

 [06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
 (20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com)

 - Pali Rohár has acked it.

Thanks!

-- 
Dmitry
