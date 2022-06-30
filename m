Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABF35621ED
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 20:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB0212A7C2;
	Thu, 30 Jun 2022 18:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C33B12A7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 18:22:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBDC61063;
 Thu, 30 Jun 2022 11:22:39 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6993F5A1;
 Thu, 30 Jun 2022 11:22:33 -0700 (PDT)
Date: Thu, 30 Jun 2022 19:21:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Message-ID: <20220630182122.j7m32mh3xmxwatga@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
 <20220630175318.g2zmu6ek7l5iakve@bogus>
 <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
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
Cc: Niklas.Cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, palmer@dabbelt.com, dmaengine@vger.kernel.org,
 masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 06:01:09PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/06/2022 18:53, Sudeep Holla wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
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
> > 
> >> So I tested your series on top of v5.19-rc4 +
> >> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
> >> spi-peripheral-props.yaml") cherry-picked,
> >> (in order to avoid conflicts when applying your series,)
> >> and the board was working as intended, no warnings or RCU stalls.
> >>
> > 
> > If possible can you give this branch[1] a try where my changes are and doesn't
> > have any other changes from -next. Sorry to bother you.
> > 
> > Conor seem to have issue with this commit[2], so if you get issues try to
> > check if [3] works.
> 
> FWIW, my problems with that are not on canaan hw.

I understand that, just helps to eliminate and see what are the possible
issues.

-- 
Regards,
Sudeep
