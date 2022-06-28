Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0755C088
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701A310E114;
	Tue, 28 Jun 2022 11:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E142810EE4D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:04:06 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s14so14475025ljs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/8pU2gScmMW6polZpgp4B71BlGG/FUv4k+/v6LUH1/0=;
 b=bky/Bhn0cY13mgxukdilwlhr5+lAOlxcGYy6kAvfvTBelfCzahaGV8UvN9cqUEeN7Y
 XBLEJ3ZadScFZdMmRpm1ZR48lKzjqev39XsszP0QgThb2ib6BaEpm938emdir4nAIO8M
 7e/C+4pzw+unC5Ef+0smMPs7B6VNirDrMrOPMkntO3q97JOfHS+4nMNL35iL59PNhd6W
 t5UNdmfEPbNUQ/65Gv5Ne4wDCdyMZcnYVCZt17l/Psc2SCLhuxq1e+bx8DPIEjqXVh3E
 W71ONBZQdfp1LTwv+ScSaXWD4uv2xYmxDSAuHT4wnNZgMCT2EpraMyrwHS5pwLahAZ0I
 AEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/8pU2gScmMW6polZpgp4B71BlGG/FUv4k+/v6LUH1/0=;
 b=qS8Hc/9CB0lLIunXzOo8fSBzu/IYN7gKgLD1EY7oUwwbIl0EYY0EU8yr4VJuhKJfWO
 lFYJ5wVaJx14AJ5ng59UniXoK91QiyVXPCvcsKkRG96hnYgu3tlrtbpCWSqfdIf4c5/X
 LZPkLo11FpkoB5b0U45JnIK/I2PpvkRQsxZZvkmCyylvfWQ0lMBGsjHTekyaeB6Way2Q
 7MIslK527jSz/MnU5LL4KBPA62lnG4qg+8ZyBX57/msYXT5ViMQLUS8meIgv84+8VDbG
 iM4YPRAbBQCM6yhFmfm8JIWzRuq6SH4l9z+Vh8RmpAk2RRdiwt1Ck90MFB5+oTrjJqKu
 txLQ==
X-Gm-Message-State: AJIora+4OEYeIWs/1ZZ8FM2sVEQOySFwSRLrEDda202RZz868VQnPSbO
 TsGMNljkXjwY0IVnXjXEa24=
X-Google-Smtp-Source: AGRyM1t9+uICFWO0tG/T7UXS6lTPnI1Wc64vAYk9Ch5AqWX88peQMeamaNU0eBwE3tD3fcJyxIVoJw==
X-Received: by 2002:a2e:b891:0:b0:25a:9175:3282 with SMTP id
 r17-20020a2eb891000000b0025a91753282mr9640485ljp.78.1656414245063; 
 Tue, 28 Jun 2022 04:04:05 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05651c038d00b00258f1e0fb32sm1752156ljp.23.2022.06.28.04.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:04:04 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:04:01 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Message-ID: <20220628110401.o6jy2kuyw3hhk3yy@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
 <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
 <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
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
 Conor Dooley <Conor.Dooley@microchip.com>,
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
 linux-spi <linux-spi@vger.kernel.org>, Vinod <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 09:08:32AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Tue, Jun 28, 2022 at 8:30 AM <Conor.Dooley@microchip.com> wrote:
> > On 28/06/2022 00:29, Rob Herring wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
> > >> From: Conor Dooley <conor.dooley@microchip.com>
> > >>
> > >> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> > >> controller, but according to the documentation & devicetree it has 6
> > >> interrupts rather than the standard one. Add a custom compatible that
> > >> supports the 6 interrupt configuration which falls back to the standard
> > >> binding which is currently the one in use in the devicetree entry.
> > >

> > > But it works with only 1 interrupt?
> >
> > Seemingly...
> 
> The Linux driver uses the only first interrupt.

Folks, there v2 of this series. A more suitable and justified solution has
been given there:
Link: https://lore.kernel.org/lkml/20220627213450.ukqai4bsjzcwhnlp@mobilestation/

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
