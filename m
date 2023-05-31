Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFAA718209
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD2510E1A6;
	Wed, 31 May 2023 13:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B976A10E1A6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:37:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126205251136.34.openmobile.ne.jp
 [126.205.251.136])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77CD47F5;
 Wed, 31 May 2023 15:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685540206;
 bh=w7lhf4pqoBdHAL5bnCELqUSHKihCPYIdl1knpofvpWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ppI5NFfD1GMtk9DtUm0oNVMn5Xp/QdC3CJ8e1gCVxtvw0/lb2ICBG5DvCMZFnV4ew
 NX57GbSCY2EA3Kdo2MYIjqFj+3zz+uQvrQScq08z3KJ60arf64BtJlGuejvOgb5BWh
 8p82Wx+HNiJt33NnSq+FwZPLJNujQzxoi/iUZXrE=
Date: Wed, 31 May 2023 16:37:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230531133706.GI27043@pendragon.ideasonboard.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Alessandro Zummo <a.zummo@towertech.it>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, May 31, 2023 at 02:51:48PM +0200, Geert Uytterhoeven wrote:
> On Wed, May 31, 2023 at 10:59 AM Laurent Pinchart wrote:
> > On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > And why do you need this ?
> > >
> > > As per Krzysztof [2],
> > >
> > > The DT schema allows multiple addresses for children. But we lack
> > > implementation of parent child relationship, As parent owns the resources.
> > > Child device needs to parse parent node to get some resource
> > > like clocks.
> > >
> > > [2] https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB556F5FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com/
> >
> > The I2C ancillary clients are not meant to be handled by separate
> > drivers. You're supposed to have one device node in DT, which causes the
> > I2C core to instantiate a main i2c_client, and bind it to one driver.
> > That driver then uses i2c_new_ancillary_device() to create other
> > i2c_client instances for the secondary I2C addresses. Those i2c_client
> > instances are not bound to a separate driver, so there should be no code
> > that needs to look at the parent for resources.
> 
> In Biju's particular use case, the i2c device responds to two addresses,
> which is the standard i2c ancillary use case.  However, what's special
> is that the second instance is a derivative of an existing i2c device
> with an existing Linux driver.  Hence the desire to make the existing
> driver match against the second instance, which requires these changes
> to i2c_new_ancillary_device().
> 
> As some resources are shared (knowledge about the clocks), splitting
> this in two distinct devices in DT (which is what Biju's initial patch
> series did) would need phandles to link both nodes together.
> 
> Do you have a better idea how to represent this?

MFD ? Otherwise, I'll delegate that to Wolfram, I've spent enough time
on this patch series I'm afraid :-)

> Wolfram: time to chime in ;-)

-- 
Regards,

Laurent Pinchart
