Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11156325E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E71112317;
	Fri,  1 Jul 2022 11:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A29CB112C47
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 11:14:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE8FA1424;
 Fri,  1 Jul 2022 04:14:18 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551EF3F66F;
 Fri,  1 Jul 2022 04:14:13 -0700 (PDT)
Date: Fri, 1 Jul 2022 12:14:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Message-ID: <20220701111410.mzfgmdabzmfubygm@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
 <20220630175318.g2zmu6ek7l5iakve@bogus>
 <f228057b-7c17-e536-ce6f-6597e263f06d@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f228057b-7c17-e536-ce6f-6597e263f06d@opensource.wdc.com>
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>,
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
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 06:16:14AM +0900, Damien Le Moal wrote:
> On 7/1/22 02:53, Sudeep Holla wrote:
> > On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
> >> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> >>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>
> >>> Hey all,
> >>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> >>> based boards. To make keeping it that way a little easier, I changed the
> >>> Canaan devicetree Makefile so that it would build all of the devicetrees
> >>> in the directory if SOC_CANAAN.
> >>>
> >>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> >>> action. Since I sent v1, I tried to buy some since it's cheap - but could
> >>> out of the limited stockists none seemed to want to deliver to Ireland :(
> >>> I based the series on next-20220617.
> >>>
> >>
> >> I first tried to apply your series on top of next-20220630,
> >> but was greeted by a bunch of different warnings on boot,
> >> including endless RCU stall warnings.
> >> However, even when booting next-20220630 without your patches,
> >> I got the same warnings and RCU stall.
> >>
> > 
> > Is it possible to share the boot logs please ?
> > Conor is having issues with my arch_topology/cacheinfo updates in -next.
> > I would like to know if your issue is related to that or not ?
> 
> FYI, I see rcu warnings on boot on my dual-socket 8-cores Xeon system, but
> the same kernel does not have the rcu warnings with an AMD Epyc single
> socket 16-cores box.

And any chances of seeing the logs ?

-- 
Regards,
Sudeep
