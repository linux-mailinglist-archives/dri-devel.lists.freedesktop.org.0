Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444554C88DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 11:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44F910E5B7;
	Tue,  1 Mar 2022 10:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A5910E5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 10:04:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nOzMg-0000j8-4y; Tue, 01 Mar 2022 11:04:18 +0100
Message-ID: <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Lucas Stach <l.stach@pengutronix.de>
To: Liu Ying <victor.liu@oss.nxp.com>, Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 01 Mar 2022 11:04:16 +0100
In-Reply-To: <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek, hi Liu,

Am Dienstag, dem 01.03.2022 um 10:44 +0800 schrieb Liu Ying:
> On Mon, 2022-02-28 at 16:34 +0100, Marek Vasut wrote:
> > On 2/28/22 09:18, Liu Ying wrote:
> > 
> > Hi,
> 
> Hi,
> 
> > 
> > > > > On Mon, 2022-02-28 at 01:45 +0100, Marek Vasut wrote:
> > > > > > Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> > > > > > and is completely different from the LCDIFv3 found in i.MX23 in that it
> > > > > 
> > > > > In i.MX23 reference manual, there is no LCDIFv3 found, but only LCDIF.
> > > > 
> > > > See i.MX23 HW_LCDIF_VERSION MAJOR=0x3 , that's LCDIF V3 . MX28 has LCDIF
> > > > V4 .
> > > 
> > > Ok, got it now. AFAIK, the SoC design team calls i.MX8MP display
> > > controller as 'LCDIFv3'. Those in other SoCs are called 'LCDIF'.  There
> > > is not even a register in i.MX8MP display controller to decribe the
> > > version.
> > 
> > We also don't have a version register on MX6SX and we call it LCDIF V6 
> > in the driver. The naming scheme is confusing.
> 
> It looks ok for the current mxsfb drm driver to use its own version
> tracking mechanism to distinguish kinda small difference across LCDIF
> variants.  However, LCDIFv3 in i.MX8mp is a totally different IP, which
> does not apply to the tracking mechanism.
> 
> > 
> > > > > > has a completely scrambled register layout compared to all previous LCDIF
> > > > > 
> > > > > It looks like no single register of i.MX8MP LCDIFv3 overlaps with
> > > > > registers in other i.MX2x/6x/7x/8x LCDIFs. The LCDIFv3 block diagram is
> > > > > totally different from the LCDIF block diagram, according to the SoC
> > > > > reference manuals. LCDIFv3 supports SHADOW_EN bit to update horizontal
> > > > > and vertical size of graphic, position of graphic on the panel, address
> > > > > of graphic in memory and color formats or color palettes, which is not
> > > > > supported by LCDIF and impacts display driver control mechanism
> > > > > considerably. LCDIF supports DOTCLK interface, MPU interface and VSYNC
> > > > > interface, while LCDIFv3 only supports parallel output as a counterpart
> > > > > of the DOTCLK interface.
> > > > > 
> > > > > Generally speaking, LCDIFv3 is just a new display IP which happens to
> > > > > have the word 'LCDIF' in its name.  Although both of LCDIFv3 and LCDIF
> > > > > are display controllers for scanning out frames onto display devices, I
> > > > > don't think they are in one family.
> > > > > 
> > > > > So, LCDIFv3 deserves a new separate dt-binding, IMO.
> > > > 
> > > > It seems to me a lot of those bits just map to their previous
> > > > equivalents in older LCDIF, others were dropped, so this is some sort of
> > > > new LCDIF mutation, is it not ?
> > > 
> > > I say 'LCDIFv3' and 'LCDIF' are totally two IPs, if I compare the names
> > > of registers and the names of register bits .
> > > 
> > > > I am aware NXP has a separate driver in its downstream, but I'm not
> > > > convinced the duplication of boilerplate code by introducing a separate
> > > > driver for what looks like another LCDIF variant is the right approach.
> > > 
> > > Hmmm, given the two IPs, I think there should be separate drivers.
> > >   With one single driver, there would be too many 'if/else' checks to
> > > separate the logics for the IPs, just like Patch 9/9 does.  The
> > > boilerplate code to do things like registering a drm device is
> > > acceptable, IMO.
> > > 
> > > Aside from that, with separate drivers, we don't have to test too many
> > > SoCs if we only want to touch either 'LCDIFv3' or 'LCDIF'.
> > 
> > But then, with two drivers, you also might miss fixes which get applied 
> > to one driver and not the other, eventually the two drivers will diverge 
> > and that's not good.
> 
> Given the two totally different IPs, I don't see bugs of IP control
> logics should be fixed for both drivers. Naturally, the two would
> diverge due to different HWs. Looking at Patch 9/9, it basically
> squashes code to control LCDIFv3 into the mxsfb drm driver with
> 'if/else' checks(barely no common control code), which is hard to
> maintain and not able to achieve good scalability for both 'LCDIFv3'
> and 'LCDIF'.

I tend to agree with Liu here. Writing a DRM driver isn't that much
boilerplate anymore with all the helpers we have available in the
framework today.

The IP is so different from the currently supported LCDIF controllers
that I think trying to support this one in the existing driver actually
increases the chances to break something when modifying the driver in
the future. Not everyone is able to test all LCDIF versions. My vote is
on having a separate driver for the i.MX8MP LCDIF.

Regards,
Lucas

