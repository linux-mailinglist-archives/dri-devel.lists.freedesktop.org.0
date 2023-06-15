Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA47313A3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0310E4A1;
	Thu, 15 Jun 2023 09:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F4510E4A4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:23:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C46B2891;
 Thu, 15 Jun 2023 11:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686820960;
 bh=mNdaQXh9jAr6C4bAiPVDZwZZnVIc9TVp7LHdiC9DdY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q0BNG8MPag0lN46PEPCAdkWdLLfFFVdpsvXChwHzNZ7t/Jnr1WHDSXKbqMkeWzpZL
 Yz+mfnr6+AjG1fEg5iyFRaImE4/6+DMJt61S2M11qQD2KhhoIMap9ILrgco61tR0qj
 VzgeEw0c/Sz+auhF8kcreVgtyGtknUicDo/gcQM4=
Date: Thu, 15 Jun 2023 12:23:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230615092312.GF741@pendragon.ideasonboard.com>
References: <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
 <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
 <CAMuHMdX4QxmFJi3q61ByOFG38KgcGMxPQMeXyPA3r1D9098BMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX4QxmFJi3q61ByOFG38KgcGMxPQMeXyPA3r1D9098BMg@mail.gmail.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:07:39AM +0200, Geert Uytterhoeven wrote:
> On Wed, Jun 14, 2023 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jun 13, 2023 at 6:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > On Tue, Jun 13, 2023 at 12:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > > > API On Mon, Jun 12, 2023 at 10:43 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > > > > > > Perhaps we should first think through what an ancillary device
> > > > > > > > really is.  My understanding is that it is used to talk to
> > > > > > > > secondary addresses of a multi-address I2C slave device.
> > > > > > >
> > > > > > > As I mentioned somewhere before, this is not the case. Ancillary
> > > > > > > devices are when one *driver* handles more than one address.
> > > > > > > Everything else has been handled differently in the past (for  all
> > > > > > > the uses I am aware of).
> > > > > > >
> > > > > > > Yet, I have another idea which is so simple that I wonder if it
> > > > > > > maybe has already been discussed so far?
> > > > > > >
> > > > > > > * have two regs in the bindings
> > > > > > > * use the second reg with i2c_new_client_device to instantiate the
> > > > > > >   RTC sibling. 'struct i2c_board_info', which is one parameter, should
> > > > > > >   have enough options to pass data, e.g it has a software_node.
> > > > > > >
> > > > > > > Should work or did I miss something here?
> > > > > >
> > > > > > That should work, mostly (i2c_new_dummy_device() also calls
> > > > > > i2c_new_client_device()).  And as i2c_board_info has an of_node
> > > > > > member (something I had missed before!), the new I2C device can
> > > > > > access the clocks in the DT node using the standard way.
> > > > >
> > > > > Looks like, I cannot assign of_node member like below as it results in
> > > > > pinctrl failure[1] during device bind.
> > > > >
> > > > > info.of_node = client->dev.of_node;
> > > > >
> > > > > [1]
> > > > > pinctrl-rzg2l 11030000.pinctrl: pin P43_0 already requested by 3-0012;
> > > > > cannot claim for 3-006f pinctrl-rzg2l 11030000.pinctrl: pin-344
> > > > > (3-006f) status -22 pinctrl-rzg2l 11030000.pinctrl: could not request
> > > > > pin 344 (P43_0) from group pmic  on device pinctrl-rzg2l
> > > > > raa215300 3-006f: Error applying setting, reverse things back
> > > >
> > > > Where do you have a reference to pin P43_0 in your DT?
> > >
> > > The reference to pin P43_0 is added in the PMIC node.
> > >
> > > I have done modification on my board to test PMIC INT# on RZ/G2L SMARC EVK
> > > by wiring R83 on SoM module and PMOD0 PIN7.
> > >
> > > > The last versions you posted did not have any pinctrl properties?
> > >
> > > By default, PMIC_INT# is not populated RZ/G2L SMARC EVK, so I haven't added
> > > Support for PMIC_INT# for the patches posted till date.
> > >
> > > Yesterday I checked with HW people, is there a way to enable PMIC_INT#
> > > and they told me to do the above HW modification.
> > >
> > > Today I found this issue, with this modified HW and PMIC INT# enabled on the DT,
> > > while assigning of_node of PMIC with info.of_node. It is just a coincidence.
> >
> > IC.
> >
> > So you now have two Linux devices pointing to the same DT node,
> > causing pinctrl issues...
> 
> So don't set info.of_node? ;-)
> 
> Without of_node, devm_clk_get() and friends falls back to registered
> clkdevs. So you could call clk_register_clkdev() from within the
> PMIC driver, and can keep on using devm_clk_get_optional() in the
> ISL1208 driver.

Seriously, how many hacks are we piling ? :-)

> If that fails, there's also software_node.properties, or even the good
> old platform_data...

-- 
Regards,

Laurent Pinchart
