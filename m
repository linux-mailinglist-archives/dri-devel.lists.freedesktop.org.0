Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51072C555
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7CB10E233;
	Mon, 12 Jun 2023 13:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDEA10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:02:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55540C4C;
 Mon, 12 Jun 2023 15:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686574901;
 bh=myI2OsDKPlAivJwq8XHEp21SionS1U4YLnRbxXj2LGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEvpQz3C+gVmmfjX1TWlXKZadMDfgm7VXB+hbeXpYCo/EwWR8ziagLTg7r1u2qAM7
 eGV8lH3OnJtndQCZyYybiXS9leMtWb+SgKqU9fd0WU8NTKZatD5cwCE8oYOEH877Kn
 iS4L85ifZlV5qrB+6pQyzXNHIW2edRov0Y3Y3nJk=
Date: Mon, 12 Jun 2023 16:02:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230612130210.GB23921@pendragon.ideasonboard.com>
References: <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
 <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
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

On Mon, Jun 12, 2023 at 02:44:33PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jun 12, 2023 at 2:23 PM Laurent Pinchart wrote:
> > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > Hi All,
> > >
> > > How do we proceed here between [1] and [2]?
> > >
> > > DT-Maintainers suggestion:
> > > [1]
> > > raa215300: pmic@12 {
> > >       compatible = "renesas,raa215300";
> > >       reg = <0x12>, <0x6f>;
> > >       reg-names = "main", "rtc";
> > >
> > >       clocks = <&x2>;
> > >       clock-names = "xin";
> > >       /* Add Optional shared IRQ resource and share it to child and handle it both in parent and child */
> > > };
> > >
> > > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > > [2]
> > >       raa215300: pmic @12 {
> > >               compatible = "renesas,raa215300";
> > >               reg = <0x12>;
> > >
> > >               /* Add Optional shared IRQ */
> > >               renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> > >       };
> > >
> > >       rtc_raa215300: rtc@6f {
> > >               compatible = "renesas,raa215300-isl1208";
> >
> > Make this
> >
> >                 compatible = "renesas,raa215300-isl1208", "isil,isl1208";
> 
> "renesas,raa215300-rtc", "isil,isl1208".
> 
> However, that would suggest the RAA215300 RTC can be treated as
> an ISL1208, which is not true for all revisions...

It depends. If we add a renesas,invert-xtoscb DT property, then it
becomes true for all revisions.

> > Btw, it would be nice to convert
> > Documentation/devicetree/bindings/rtc/isil,isl1208.txt to YAML.
> 
> Hey, look at patch 2 in this series ;-)

-- 
Regards,

Laurent Pinchart
