Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6BC52E9AE
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 12:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7110EBF1;
	Fri, 20 May 2022 10:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0778010EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 10:12:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nrzc4-0000H5-3g; Fri, 20 May 2022 12:12:04 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nrzc0-0002U7-J6; Fri, 20 May 2022 12:12:00 +0200
Date: Fri, 20 May 2022 12:12:00 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v11 00/24] drm/rockchip: RK356x VOP2 support
Message-ID: <20220520101200.GI25578@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <23894515.EfDdHjke4D@phil>
 <CAO_Mup+SCgeK9rBjYqnnOpJWUNXyJdXV9pjWXqi571sznS9-LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_Mup+SCgeK9rBjYqnnOpJWUNXyJdXV9pjWXqi571sznS9-LA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:08:21 up 50 days, 22:38, 54 users,  load average: 0.12, 0.18, 0.16
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

Hi Maya,

On Fri, May 20, 2022 at 12:02:33PM +0200, Maya Matuszczyk wrote:
> Hello,
> 
> wt., 17 maj 2022 o 20:28 Heiko Stuebner <heiko@sntech.de> napisał(a):
> >
> > Am Freitag, 22. April 2022, 09:28:17 CEST schrieb Sascha Hauer:
> > > It's v11 time. There's only one small change to v10. Discussion seems to
> > > have settled now. Is there anything left that prevents the series from
> > > being merged? I'd really like to have it in during the next merge
> > > window.
> > >
> > > This series still depends on:
> > > drm/rockchip: Refactor IOMMU initialisation (https://lists.freedesktop.org/archives/dri-devel/2022-April/349548.html)
> > > arm64: dts: rockchip: add basic dts for the radxa rock3 model a
> > >
> > > Sascha
> >
> > I've now picked up everything except the hdmi-rate stuff in some way.
> > The driver changes will go into 5.19 and the DT-changes into 5.20.
> >
> > I'll now move the series out of my focus and would expect further
> > hdmi rate voodoo to start a new series :-) .
> >
> > Thanks to all involved for working on this.
> > Heiko
> 
> What do I need besides this patch series, mentioned before IOMMU refactor,
> and DTS changes for MIPI-DSI support on RK356x?
> I'm working on mainline kernel support for a a RK3566 board with
> a DSI display.

Apart from these patches you'll need updates for the DSI. I've pushed
these once to
https://git.pengutronix.de/cgit/sha/linux/log/?h=rockchip-vop2-mipi
Particularly I think you need:

383ff250345f0 drm: rockchip: dw-mipi-dsi: Call host attach from probe
e79a16ead833d dw-mipi-dsi-rockchip: increase bandwidth
ac400bdd8d0cb drm: rockchip: dw-mipi-dsi-rockchip: Add rk3568 support
b6b7fabbc9fe2 drm: panel-simple: Add init sequence support
3c13a030e92f3 arm64: dts: rockchip: rk3568-evb: Add Display support
3433935a31675 arm64: dts: rockchip: rk356x: Add dsi nodes

I'm not sure how well these fit onto the current state. I'll likely
update the branch when the VOP2 has hit mainline after the next merge
window. I have no plans currently to upstream the DSI bits though.

Regards,
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
