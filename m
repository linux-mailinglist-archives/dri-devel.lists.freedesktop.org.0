Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF4458A59
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 09:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD12E6E1D2;
	Mon, 22 Nov 2021 08:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E2C6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 08:10:15 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mp4Oz-0003KK-S0; Mon, 22 Nov 2021 09:10:13 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mp4Ou-0005pL-HP; Mon, 22 Nov 2021 09:10:08 +0100
Date: Mon, 22 Nov 2021 09:10:08 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
Message-ID: <20211122081008.GR6556@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <73c57643-a0db-e7e7-174d-3cb6a978d98a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73c57643-a0db-e7e7-174d-3cb6a978d98a@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:45:58 up 277 days, 11:09, 111 users,  load average: 0.11, 0.10,
 0.09
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Mon, Nov 22, 2021 at 12:18:47AM +0100, Alex Bee wrote:
> Hi Sascha,
> 
> Am 17.11.21 um 15:33 schrieb Sascha Hauer:
> > This series adds initial graphics support for the Rockchip RK356[68]
> > SoCs.  Graphics support is based around the VOP2 controller which
> > replaces the VOP controller found on earlier Rockchip SoCs. The driver
> > has been tested with HDMI support included in this series and MIPI-DSI
> > which is not included because it needs some more work. The driver is
> > taken from the downstream Rockchip kernel and heavily polished, most non
> > standard features have been removed for now. I tested the driver with
> > the libdrm modetest utility and also with weston with both pixman and
> > panfrost driver support. Michael Riesch reported the driver to work on
> > the RK3566 as well, but device tree support for this SoC is not yet
> > included in this series.
> >
> > The HDMI changes are based on patches from Benjamin Gaignard, but
> > modified a bit as I found out that the HDMI port on the RK3568 only
> > needs one additional clock, not two. Also I added regulator support
> > which is needed to get the HDMI up on the rk3568-EVB board.
> >
> > All review and testing feedback welcome
> 
> 
> thanks for working on that - it's very (very,very) much appreciated.
> 
> It took me some time to figure it out: It seems rk3568-iommu driver s
> broken - I did only get "white noise" when using it alongside vop
> (similar like it was reported here before). However: removing the
> iommu-property from vop makes it working for me with HDMI output on
> quartz64 as well. Could you check if you have the iommu driver in kernel
> enabled if it works for you, if the property is present in DT? (I used
> 5.16-rc1 + this series + [0]).

I have the iommu driver enabled and it works for me. I get this during
boot:

[0.263287] rockchip-vop2 fe040000.vop: Adding to iommu group 0

So I expect it is indeed used.

> Also vop mmu seems to have the
> power-domain missing in your series (same as downstream) - however
> adding that doesn't help much currently.

Probably the power domain gets enabled anyway when the VOP is activated,
so adding it to the iommu won't help anything. Nevertheless it seems
correct to add the property, I'll do so in the next round.

> As a sidenote: I verfied this with using Ezequiel's vpu addtion for
> RK356x: It did only work when removing the iommu there as well (getting
> tons of page faults otherwise) - so iommu driver really seems to broken,
> at least for RK3566. (Or I'm a missing a option in kernel config, which
> wasn't required for the older iommu version?)

I don't think so. I started from defconfig and disabled other
architectures and unneeded drivers, but I did not enable anything
specific to iommu.

>  
> But as reported before: For HDMI this does currently only work for pixel
> clock rates, which are integer-divisable with hpll clock rate (which is
> the hardcoded parent of vop0's dclk)
> As discussed in Benjamin's initial submission of the addition of
> RK3568's hdmi controller [1] same as with RK3288's and RK3399's hdmi phy
> needs a reference clock (it's called vpll there) which needs to get
> switched before the vop switches the mode (since phy rate switching is
> done before) - it's HPLL in case of RK356x. For whatever reason it's
> called "ref" for RK356x only downstream [2] - so you should add another
> clock "vpll" (renaming it to "ref" for _ALL_ SoCs which have it would be
> a _GREAT_ idea) which is <&pmucru PLL_HPLL>.

Yeah, a consumer clock should be named after the usage in the consumer,
not after the provider name. I also stumbled over this and naming it
"ref" makes much more sense. We'll likely have to keep supporting "vpll"
as well for compatibility to old device trees.

> What brings us to the "real" clock problem and the reason, why
> non-integer divisable pixel clock rates are not possible ATM: This is a
> long standing issue for RK3288 and RK3399 as well (and one of the main
> reasons why 4k modes are not possible for those older SoCs currently):
> Upstream all PLL rates are controlled with those PLL rate tables in the
> clock driver and they have to be _exactly_ defined as they are used
> (HDMI sinks are very picky).
> You will not see any additional rates downstream for RK3568: they have a
> mechanism there to automatically calculate the PLL settings if the rate
> doesn't exist in these tables (IIRC this was submitted upstream also:
> but it was rejected/ignored by maintainers).

Looks like we have to try harder to get it upstream. Do you have a
pointer to this patch?

> As a quick hackarround (for
> testing): You could use this table [3] we are using in LibreElec for
> RK3399 to get 4k modes working and assign it to HPLL in RK3568's clock
> driver (I tested it and it works great). It might be possible to just
> add those rates (some also without frac dividers) to the common PLL
> table for RK3568.

Thanks for noting. This could also explain why currently only 1080p is
working.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
