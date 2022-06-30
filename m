Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364BC562189
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEBD113F25;
	Thu, 30 Jun 2022 17:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A164E11BCDF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:54:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DEB31063;
 Thu, 30 Jun 2022 10:54:35 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713CA3F5A1;
 Thu, 30 Jun 2022 10:54:29 -0700 (PDT)
Date: Thu, 30 Jun 2022 18:53:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Message-ID: <20220630175318.g2zmu6ek7l5iakve@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr3PKR0Uj1bE5Y6O@x1-carbon>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hey all,
> > This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> > based boards. To make keeping it that way a little easier, I changed the
> > Canaan devicetree Makefile so that it would build all of the devicetrees
> > in the directory if SOC_CANAAN.
> > 
> > I *DO NOT* have any Canaan hardware so I have not tested any of this in
> > action. Since I sent v1, I tried to buy some since it's cheap - but could
> > out of the limited stockists none seemed to want to deliver to Ireland :(
> > I based the series on next-20220617.
> > 
> 
> I first tried to apply your series on top of next-20220630,
> but was greeted by a bunch of different warnings on boot,
> including endless RCU stall warnings.
> However, even when booting next-20220630 without your patches,
> I got the same warnings and RCU stall.
>

Is it possible to share the boot logs please ?
Conor is having issues with my arch_topology/cacheinfo updates in -next.
I would like to know if your issue is related to that or not ?

> So I tested your series on top of v5.19-rc4 +
> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
> spi-peripheral-props.yaml") cherry-picked,
> (in order to avoid conflicts when applying your series,)
> and the board was working as intended, no warnings or RCU stalls.
>

If possible can you give this branch[1] a try where my changes are and doesn't
have any other changes from -next. Sorry to bother you.

Conor seem to have issue with this commit[2], so if you get issues try to
check if [3] works.

Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/c/ae85abf284e7
[2] https://git.kernel.org/sudeep.holla/c/155bd845d17b
[3] https://git.kernel.org/sudeep.holla/c/009297d29faa
