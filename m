Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43B72C3ED
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8752E10E0DB;
	Mon, 12 Jun 2023 12:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E916B10E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:23:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22F25CE6;
 Mon, 12 Jun 2023 14:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686572604;
 bh=hpC6jgskSjhuflLKhaAosF/2jwgfmyRmgp9DDTKm7gA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=krCRu1Q9RMBomgt2gKUw0gD6Mk1WFF+BTKKTWl5XnqKBlcwXc74hTdOrqX3RaBpDC
 KYUWoPQ4wS27YInW1GuKFp3J719t0PQE3dUZEFAG5gagB7pvlp44LocGOzkN4yj6J8
 YqevKy5RXkCI2dU55OLU5g4iGWIxOmhiwESmVhBU=
Date: Mon, 12 Jun 2023 15:23:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230612122353.GA22391@pendragon.ideasonboard.com>
References: <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> Hi All,
> 
> How do we proceed here between [1] and [2]?
> 
> DT-Maintainers suggestion:
> [1]
> raa215300: pmic@12 {
> 	compatible = "renesas,raa215300";
> 	reg = <0x12>, <0x6f>;
> 	reg-names = "main", "rtc";
> 
> 	clocks = <&x2>;
> 	clock-names = "xin";
> 	/* Add Optional shared IRQ resource and share it to child and handle it both in parent and child */
> };
> 
> Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> [2]
> 	raa215300: pmic @12 {
> 		compatible = "renesas,raa215300";
> 		reg = <0x12>;
> 		
> 		/* Add Optional shared IRQ */
> 		renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> 	};
> 
> 	rtc_raa215300: rtc@6f {
> 		compatible = "renesas,raa215300-isl1208";

Make this

 		compatible = "renesas,raa215300-isl1208", "isil,isl1208";

Btw, it would be nice to convert
Documentation/devicetree/bindings/rtc/isil,isl1208.txt to YAML.

> 		reg = <0x6f>;
> 
> 		/* Add Optional shared IRQ */
> 		clocks = <&x2>;
> 		clock-names = "xin";
> 		renesas,raa215300-pmic = <&pmic>; /* Parse the handle to get PMIC version to check Oscillator bit is inverted or not */

This isn't nice. I would instead add a renesas,invert-xtoscb boolean
property. If you don't want different DT sources for different revisions
of the PMIC, one option is to perform the auto-detection in the boot
loader and update the DT dynamically there.

> 	};



> > -----Original Message-----
> > From: Biju Das
> > Sent: Thursday, June 8, 2023 1:57 PM
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Wolfram Sang <wsa@kernel.org>; Geert Uytterhoeven <geert@linux-
> > m68k.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Rob
> > Herring <robh+dt@kernel.org>; Andrzej Hajda <andrzej.hajda@intel.com>;
> > Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss
> > <rfoss@kernel.org>; David Airlie <airlied@gmail.com>; Daniel Vetter
> > <daniel@ffwll.ch>; Kieran Bingham <kieran.bingham@ideasonboard.com>;
> > Mauro Carvalho Chehab <mchehab@kernel.org>; Hans Verkuil <hverkuil-
> > cisco@xs4all.nl>; Alessandro Zummo <a.zummo@towertech.it>; Alexandre
> > Belloni <alexandre.belloni@bootlin.com>; Jonas Karlman <jonas@kwiboo.se>;
> > Jernej Skrabec <jernej.skrabec@gmail.com>; Uwe Kleine-König <u.kleine-
> > koenig@pengutronix.de>; Corey Minyard <cminyard@mvista.com>; Marek Behún
> > <kabel@kernel.org>; Jiasheng Jiang <jiasheng@iscas.ac.cn>; Antonio Borneo
> > <antonio.borneo@foss.st.com>; Abhinav Kumar <quic_abhinavk@quicinc.com>;
> > Ahmad Fatoum <a.fatoum@pengutronix.de>; dri-devel@lists.freedesktop.org;
> > linux-i2c@vger.kernel.org; linux-media@vger.kernel.org; Geert
> > Uytterhoeven <geert+renesas@glider.be>; Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org; Mark
> > Brown <broonie@kernel.org>
> > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > 
> > Hi Laurent,
> > 
> > Thanks for the feedback.
> > 
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > API
> > >
> > > Hi Biju,
> > >
> > > On Thu, Jun 08, 2023 at 11:00:19AM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > i2c_new_ancillary_device API On Thu, Jun 08, 2023 at 06:41:35AM+0000, Biju Das wrote:
> > > > > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance
> > > > > > > i2c_new_ancillary_device API
> > > > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > > > > i2c_new_ancillary_device API
> > > > > > > >
> > > > > > > > Hi all,
> > > > > > > >
> > > > > > > > sorry for not being able to chime in earlier.
> > > > > > > >
> > > > > > > > > In Biju's particular use case, the i2c device responds to
> > > > > > > > > two addresses, which is the standard i2c ancillary use case.
> > > > > > > > > However, what's special
> > > > > > > >
> > > > > > > > Not quite. ancillary is used when a *driver* needs to take
> > > > > > > > care of two addresses. We already have devices bundling two
> > > > > > > > features into the same chip. I recall at least RTC + EEPROM
> > > > > > > > somewhere. And so far, we have been handling this by
> > > > > > > > creating two nodes in DT and have proper binding docs.
> > > > > > > > I think this is cleaner. First, you can see in DT already
> > > > > > > > what the compound device really consists of. In this case,
> > > > > > > > which RTC and RTC driver is exactly needed. Second, the code
> > > > > > > > added here adds complexity to the I2C core with another
> > > > > > > > layer of inderection for dummy devices.
> > > > > > >
> > > > > > > FYI, please see [1] and [2]
> > > > > > >
> > > > > > > As per DT maintainers, most of PMICs are described with one
> > > > > > > node, even though RTC is on separate address. According to
> > > > > > > them the DT schema allows multiple addresses for children.
> > > > > > > But currently we lacks implementation for that. The
> > > > > > > enhancement to this API allows that.
> > > > > > >
> > > > > > > > > As some resources are shared (knowledge about the clocks),
> > > > > > > > > splitting this in two distinct devices in DT (which is
> > > > > > > > > what Biju's initial patch series did) would need phandles
> > > > > > > > > to link both nodes together.
> > > > > > > > >
> > > > > > > > > Do you have a better idea how to represent this?
> > > > > > > >
> > > > > > > > Not sure if I understood this chip correctly, but maybe: The
> > > > > > > > PMIC driver exposes a clock gate which can be consumed by
> > > > > > > > the RTC driver?
> > > > > >
> > > > > > Let me give me some details of this PMIC chip.
> > > > > >
> > > > > > PMIC device has 2 addresses "0x12:- PMIC" , "0x6f"- rtc.
> > > > > >
> > > > > > It has XIN, XOUT, INT# pins and a register for firmware revisions.
> > > > >
> > > > > Is the firmware revision register accessed through address 0x12
> > > > > (PMIC) or 0x6f (RTC) ?
> > > >
> > > > 0x12(PMIC).
> > > >
> > > > > > Based on the system design,
> > > > > >
> > > > > > If XIN and XOUT is connected to external crystal, Internal
> > > > > > oscillator is enabled for RTC. In this case we need to set the
> > > > > > oscillator bit to "0".
> > > > > >
> > > > > > If XIN is connected to external clock source, Internal
> > > > > > oscillator is disabled for RTC. In this case we need to set the
> > > > > > oscillator bit to "1".
> > > > >
> > > > > Same here, which address is the oscillator bit accessed through ?
> > > >
> > > > RTC (0x6F)--> to set oscillator bit.
> > >
> > > And does the PMIC part depend on the oscillator bit being set
> > > correctly, or is that used for the RTC only ?
> > 
> > PMIC part does not. It is used only in RTC.
> > 
> > Based on PMIC revision, we need to set the oscillator bit in RTC block
> > for PMIC rev a0 and rest of the PMIC chips.
> > 
> > On PMIC rev0, oscillator bit is inverted.
> > 
> > > > > > If XIN and XOUT not connected RTC operation not possible.
> > > > > >
> > > > > > IRQ# (optional) functionality is shared between PMIC and RTC.
> > > > > > (PMIC fault for various bucks/LDOs/WDT/OTP/NVM and alarm condition).
> > > > >
> > > > > IRQs can be shared between multiple devices so this shouldn't be a
> > > > > problem.
> > > >
> > > > OK. How do we represent this IRQ in DT?
> > >
> > > You can simply reference the same IRQ from the interrupts property of
> > > different DT nodes.
> > >
> > > > > > The board, I have doesn't populate IRQ# pin. If needed some
> > > > > > customers can populate IRQ# pin and use it for PMIC fault and
> > > > > > RTC alarm.
> > > > > >
> > > > > > Also, currently my board has PMIC rev a0 where oscillator bit is
> > > > > > inverted and internal oscillator is enabled (ie: XIN and XOUT is
> > > > > > connected to external crystal)

-- 
Regards,

Laurent Pinchart
