Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637CC55E5AB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 17:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FB3113255;
	Tue, 28 Jun 2022 15:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB055113255
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 15:26:05 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id s17so13206375iob.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wVoUetZ5S/GqO2CHeSuZD5HjqLM10h5uZxs1HR13hfg=;
 b=P/a3tKYAubROiXNXkFsv39+y6s47F4pirzbYJO4pY2aNh+DsW/YRl37YQw8wKxrZLY
 fksOsB3OUkWgobaFThf38HMyv9GA8eCL1JfuZLSAnoIu7n+r8I4KhiLUZoCkdwleiFln
 JqTxOqREbt8WpkHQbQFS9PTpIIYpn0mGqenCvMg13CG+kaPbWLmmiObcrmx7wD0Cmf2s
 MFPlbRfpWPqTHMNn9g2PyZuz9W1ADZB9T3nlM24ewLv5oBcbDvChyjlGgWjNUePOhHd1
 +PtBd7osQjCFFEUJ8bJTuOwwmuE894ax6iHHCPRwvo/QUVGFo8PFjyELqEDY74O829P3
 wdUA==
X-Gm-Message-State: AJIora/MQhIHsollA7pWHs7LEK0t3RQLrgMHMU5aaXkTeJ7iMOtyTCrK
 vEA5PFTOFFqz15Pg59p06g==
X-Google-Smtp-Source: AGRyM1u30z6rjSQP/yfjddK3j5eb9UHQa30g9hrzhKsueFxERdQlxns3zeN/rJtosCIDlaE+/J+6ew==
X-Received: by 2002:a05:6638:14c3:b0:331:8153:e5b with SMTP id
 l3-20020a05663814c300b0033181530e5bmr11835574jak.114.1656429965253; 
 Tue, 28 Jun 2022 08:26:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a6bd814000000b006751347e61bsm5482552iob.27.2022.06.28.08.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:26:04 -0700 (PDT)
Received: (nullmailer pid 491422 invoked by uid 1000);
 Tue, 28 Jun 2022 15:26:01 -0000
Date: Tue, 28 Jun 2022 09:26:01 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v2 04/16] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220628152601.GA465684-robh@kernel.org>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-5-mail@conchuod.ie>
 <20220627202149.624eu7w2gzw7jchd@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627202149.624eu7w2gzw7jchd@mobilestation>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <mail@conchuod.ie>, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Heng Sia <jee.heng.sia@intel.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 11:21:49PM +0300, Serge Semin wrote:
> On Mon, Jun 27, 2022 at 08:39:52PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> > Canaan k210 is wired up for a width of 4.
> > Quoting Serge:
> > The modern DW APB SSI controllers of v.4.* and newer also support the
> > enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> > version is auto-detected at run-time there is no way to create a
> > DT-schema correctly constraining the Rx/Tx SPI bus widths.
> > /endquote
> > 
> > As such, drop the restriction on only supporting a bus width of 1.
> > 
> > Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Serge, I dropped your R-b when I swapped to the default
> > property since it changed the enum.
> > ---
> >  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > index e25d44c218f2..0a43d6e0ef91 100644
> > --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > @@ -143,12 +143,6 @@ patternProperties:
> >          minimum: 0
> >          maximum: 3
> >  
> 
> > -      spi-rx-bus-width:
> > -        const: 1
> > -
> > -      spi-tx-bus-width:
> > -        const: 1
> > -
> 
> My comment was:
> > > > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> > >
> > > 8 too? sure.
> Then Rob said:
> > Then no constraints needed because the common definition already has
> > this presumably.
> 
> IMO preserving the device-specific constraints even if they match the
> generic ones has some maintainability benefits. What if you get to
> discover a new HW which supports Hexal mode? 

x16? Wouldn't we be back to parallel NOR and the problems with parallel 
buses?

> Then you would have
> needed to update the common schema constraints. But that would have
> caused permitting the unsupported bus-mode for all the schemas, which
> isn't correct. So as I see it the explicit bus-width enumeration would
> be ok to have here. But I'll leave it for Rob to make a final
> decision.

Assuming a new width does appear, it's just a matter of time before the 
DW block has a new rev supporting it too, so there's 2 places to update. 
Also, a given platform may pinout less than the block supports, so you 
can't ever be 100% sure an out of range value is in a DT.

But either way is okay with me. If you do keep constraints, you only 
need 'maximum: 8'.

Acked-by: Rob Herring <robh@kernel.org>

Rob
