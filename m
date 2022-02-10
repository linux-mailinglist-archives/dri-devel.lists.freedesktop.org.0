Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB74B0EEA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 14:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7F10E869;
	Thu, 10 Feb 2022 13:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73D510E869
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 13:38:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nI9e7-0002X5-78; Thu, 10 Feb 2022 14:38:03 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nI9e3-00033k-5d; Thu, 10 Feb 2022 14:37:59 +0100
Date: Thu, 10 Feb 2022 14:37:59 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v5 19/23] arm64: dts: rockchip: rk3568-evb: Enable VOP2
 and hdmi
Message-ID: <20220210133759.GZ18637@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-20-s.hauer@pengutronix.de>
 <3492afbf-b9fc-d5f5-6f7a-2157442d8209@gmail.com>
 <20220210114746.GX18637@pengutronix.de>
 <2fa2e53d-da1c-6957-33ed-f3e9806347cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa2e53d-da1c-6957-33ed-f3e9806347cf@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:33:40 up 61 days, 22:19, 81 users,  load average: 0.13, 0.24, 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 02:15:17PM +0100, Johan Jonker wrote:
> 
> 
> On 2/10/22 12:47, Sascha Hauer wrote:
> > On Thu, Feb 10, 2022 at 01:10:32AM +0100, Johan Jonker wrote:
> >> Hi Sascha,
> >>
> >> Something with port and endpoint gives notifications.
> >> Somehow with the conversion of rockchip,dw-hdmi.txt to YAML not all SoC
> >> options were checked/covered (see rk3328 and rk3568).
> >>
> >> Allow multiple vop:
> >> port or
> >> port@0
> >> 1x vop -> endpoint
> >>
> >> 2x vop -> endpoint@0
> >>        -> endpoint@1
> >>
> >> Also allow for connector:
> >> (not all existing DT have this yet)
> >> port@1
> >>       -> endpoint
> >>
> >> See also at graph.yaml
> > 
> > Ok, let me see if I get this right. The HDMI can either have one or two
> > ports. It has one when the HDMI connector is not described in the device
> > tree and two when it is. Also the first (or only) port can have one or
> > two endpoints. It has one endpoint when the SoC has a single VOP and two
> > endpoints when the SoC has two VOPs.
> > 
> > It's been a painful morning because my YAML knowledge is fairly limited,
> > but here's what I came up with:
> > 
> >   ports:
> >     $ref: /schemas/graph.yaml#/properties/ports
> >     unevaluatedProperties: false
> >     patternProperties:
> >       "^port(@0)?$":
> >         $ref: /schemas/graph.yaml#/properties/port
> >         description: Input of the DWC HDMI TX
> >         properties:
> >           endpoint:
> >             description: Connection to the VOP
> >           endpoint@0:
> >             description: Connection to the VOPB
> >           endpoint@1:
> >             description: Connection to the VOPL
> >     properties:
> >       port@1:
> >         $ref: /schemas/graph.yaml#/properties/port
> >         description: Output of the DWC HDMI TX
> > 
> > Does this look sane to you? With this a make dtbs_check on this binding
> > doesn't generate warnings anymore, and even better it does generate
> > warnings when I add some wrong nodes/properties to the dts files.
> 
> Hi,
> 
> Send a patch to rob+dt and he will let you know... ;)

;)

> 
> Also could you test the ARM branch as well just for sure with:
> ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make  dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

That works fine except for iahb and isfr clocks in the wrong order in
arch/arm/boot/dts/rk322x.dtsi.

> 
> Could you group your serie a bit:
> dt-bindings
> drm patches
> dts changes

That's the order I originally had. Heiko asked me to put the
bindings, dts changes and driver patches together dor each topic.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
