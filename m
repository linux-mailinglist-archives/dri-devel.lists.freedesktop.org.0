Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B0554265
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3240113547;
	Wed, 22 Jun 2022 05:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE0A10F08E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:32:37 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t25so21345689lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KVxqgQkmpuz9sfivRrmvLlkvyXCsZ/UVRlJX8Kn06s0=;
 b=baOjPn3HMnQGhZj1nBS+hjUUnJUJ+Qaef24QVnmcEHRl7vEXdUjo5QRsBfEgNpCnf1
 Jm2mGhGNtiWo638Mh2HKumHhvcYmxsqdqaKFiIY93JNSLRKOtYQlJpKBnZGURLayjob+
 /MB/FkKHC8pVilIrHz6/2s03W4EKJQLZphbVT9pgnKGGgCYWlbAKxlSPmKCXeDMSOGEz
 k4bqKGBybgmOLqK4EsPHVpmL5fxyLVBFK/CNU2l5aGa83kOmEMKiC50ivmJ883ZTIT77
 lTZMo0A50VvPHdVjC+D1Xe9WkvlxRXsvrK+2mvS5A9BpF2X8NlUaokkHL1Dw0Q1ZNI3b
 GQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KVxqgQkmpuz9sfivRrmvLlkvyXCsZ/UVRlJX8Kn06s0=;
 b=fo+CHRv3h4EPsIY4vTpZClFz5JjDsXf2keppoiNoQuc+rNP9tmS2H+nlxYQedBBRof
 oxrmFo/PKQi25eX8bgjAT88TD84tCHtCFauyjvATpoqgUNRK6q8KTKkeCjjpck2+Jvxg
 JfPArLBh5EfUQ5rt5s+DnIr4S4/Fd9OkOkDkzIBKSpnhratZazVlXUpVCgs34NS+vFVR
 qKtU1Mfk/nEgvuAEkb7BgFMESmfy2CHOVERwZFkwykNCjlQrIQp60zkg1IgmzXYtUgG/
 k7vKN/F5iVU/Qvsfcy6be5q96KTCnQU3r0nFuRwLlbxx91Jiu3ZUKSLJq5iICdvvL98z
 xWHg==
X-Gm-Message-State: AJIora/l0P+0z6UncwiUGg5A8k/8CtS7g/r6OzeWJk162EmjS3xjlnLo
 jQV3S/ivlDt2xSJhVPiqVYg=
X-Google-Smtp-Source: AGRyM1tUHbN/43UfLBdEExbn+1p4lZ6hBmumkDYlyBIRa9Zw3iDqI9SetAAfAkHiF5XrbJVvOtVraA==
X-Received: by 2002:a05:6512:2808:b0:47f:51c4:1dea with SMTP id
 cf8-20020a056512280800b0047f51c41deamr12102421lfb.390.1655803954972; 
 Tue, 21 Jun 2022 02:32:34 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a19ca55000000b00477a287438csm916926lfj.2.2022.06.21.02.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:32:34 -0700 (PDT)
Date: Tue, 21 Jun 2022 12:32:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220621093231.tytrh6fimzfxgzm2@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Mark Brown <broonie@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine <dmaengine@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert

On Tue, Jun 21, 2022 at 09:03:25AM +0200, Geert Uytterhoeven wrote:
> Hi Serge,
> 
> On Mon, Jun 20, 2022 at 10:56 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >

[...]

> > > +
> > > +        spi-rx-bus-width:
> > > +          const: 1
> > > +
> > > +        spi-tx-bus-width:
> > > +          const: 1
> >
> > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> > irrespective from the compatible string. The modern DW APB SSI
> > controllers of v.4.* and newer also support the enhanced SPI Modes too
> > (Dual, Quad and Octal). Since the IP-core version is auto-detected at
> > run-time there is no way to create a DT-schema correctly constraining
> > the Rx/Tx SPI bus widths. So let's keep the
> > compatible-string-independent "patternProperties" here but just extend
> > the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
> > properties values.
> >

> > Note the DW APB SSI/AHB SSI driver currently doesn't support the
> > enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
> > bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
> > DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
> > activated by means of the corresponding CSR. So most likely the DW AHB
> > SSI controllers need some specific setups too.
> 
> That doesn't matter here, as DT describes hardware, not software
> limitations.

Can't argue with that.) My note regarding the current DW APB SSI
driver was mainly addressed for the Canaan K210 users, since
should the SoC-based board really have the Quad Tx/Rx SPI bus
most likely the interface won't work with the full bandwidth.
So it is a good reason to perform the platform research and if
possible alter the driver accordingly.

-Sergey

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
