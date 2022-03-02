Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CA34CA093
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910210F2BC;
	Wed,  2 Mar 2022 09:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324C510F2C8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:23:30 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nPLCh-00046V-OS; Wed, 02 Mar 2022 10:23:27 +0100
Message-ID: <85af7c5dfa120903a22e5e704e3bddd87830033c.camel@pengutronix.de>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>
Date: Wed, 02 Mar 2022 10:23:25 +0100
In-Reply-To: <b655f565-43b2-4e42-953e-d6efa02f0219@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
 <b655f565-43b2-4e42-953e-d6efa02f0219@denx.de>
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 02.03.2022 um 03:54 +0100 schrieb Marek Vasut:
> On 3/1/22 14:18, Lucas Stach wrote:
> > Am Dienstag, dem 01.03.2022 um 07:03 -0600 schrieb Adam Ford:
> > > On Tue, Mar 1, 2022 at 5:05 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > 
> > > > Am Dienstag, dem 01.03.2022 um 11:19 +0100 schrieb Marek Vasut:
> > > > > On 3/1/22 11:04, Lucas Stach wrote:
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > Given the two totally different IPs, I don't see bugs of IP control
> > > > > > > logics should be fixed for both drivers. Naturally, the two would
> > > > > > > diverge due to different HWs. Looking at Patch 9/9, it basically
> > > > > > > squashes code to control LCDIFv3 into the mxsfb drm driver with
> > > > > > > 'if/else' checks(barely no common control code), which is hard to
> > > > > > > maintain and not able to achieve good scalability for both 'LCDIFv3'
> > > > > > > and 'LCDIF'.
> > > > > > 
> > > > > > I tend to agree with Liu here. Writing a DRM driver isn't that much
> > > > > > boilerplate anymore with all the helpers we have available in the
> > > > > > framework today.
> > > > > 
> > > > > I did write a separate driver for this IP before I spent time merging
> > > > > them into single driver, that's when I realized a single driver is much
> > > > > better and discarded the separate driver idea.
> > > > > 
> > > > > > The IP is so different from the currently supported LCDIF controllers
> > > > > > that I think trying to support this one in the existing driver actually
> > > > > > increases the chances to break something when modifying the driver in
> > > > > > the future. Not everyone is able to test all LCDIF versions. My vote is
> > > > > > on having a separate driver for the i.MX8MP LCDIF.
> > > > > 
> > > > > If you look at both controllers, it is clear it is still the LCDIF
> > > > > behind, even the CSC that is bolted on would suggest that.
> > > > 
> > > > Yes, but from a driver PoV what you care about is not really the
> > > > hardware blocks used to implement something, but the programming model,
> > > > i.e. the register interface exposed to software.
> > > > 
> > > > > 
> > > > > I am also not happy when I look at the amount of duplication a separate
> > > > > driver would create, it will be some 50% of the code that would be just
> > > > > duplicated.
> > > > > 
> > > > Yea, the duplicated code is still significant, as the HW itself is so
> > > > simple. However, if you find yourself in the situation where basically
> > > > every actual register access in the driver ends up being in a "if (some
> > > > HW rev) ... " clause, i still think it would be better to have a
> > > > separate driver, as the programming interface is just different.
> > > 
> > > I tend to agree with Marek on this one.  We have an instance where the
> > > blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
> > > but different enough where each SoC has it's own set of tables and
> > > some checks.   Lucas created the framework, and others adapted it for
> > > various SoC's.  If there really is nearly 50% common code for the
> > > LCDIF, why not either leave the driver as one or split the common code
> > > into its own driver like lcdif-common and then have smaller drivers
> > > that handle their specific variations.
> > 
> > I don't know exactly how the standalone driver looks like, but I guess
> > the overlap is not really in any real HW specific parts, but the common
> > DRM boilerplate, so there isn't much point in creating a common lcdif
> > driver.
> 
> The mxsfb currently has 1280 LoC as of patch 8/9 of this series. Of 
> that, there is some 400 LoC which are specific to old LCDIF and this 
> patch adds 380 LoC for the new LCDIF. So that's 800 LoC or ~60% of 
> shared boilerplate that would be duplicated .

That is probably ignoring the fact that the 8MP LCDIF does not support
any overlays, so it could use the drm_simple_display_pipe
infrastructure to reduce the needed boilerplate.
> 
> > As you brought up the blk-ctrl as an example: I'm all for supporting
> > slightly different hardware in the same driver, as long as the HW
> > interface is close enough. But then I also opted for a separate 8MP
> > blk-ctrl driver for those blk-ctrls that differ significantly from the
> > others, as I think it would make the common driver unmaintainable
> > trying to support all the different variants in one driver.
> 
> But then you also need to maintain two sets of boilerplate, they 
> diverge, and that is not good.

I don't think that there is much chance for bugs going unfixed due to
divergence in the boilerplate, especially if you use the simple pipe
framework to handle most of that stuff for you, which gives you a lot
of code sharing with other simple DRM drivers.

Regards,
Lucas


