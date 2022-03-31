Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2C4ED552
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4319B10EE54;
	Thu, 31 Mar 2022 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1332A10EE54
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:18:20 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nZq0Y-0004iA-3i; Thu, 31 Mar 2022 10:18:18 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nZq0V-0008Bi-59; Thu, 31 Mar 2022 10:18:15 +0200
Date: Thu, 31 Mar 2022 10:18:15 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v9 20/23] drm/rockchip: Make VOP driver optional
Message-ID: <20220331081815.GF4012@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <20220328151116.2034635-21-s.hauer@pengutronix.de>
 <274a12a9-61f1-7d6a-e89c-52237621930b@rock-chips.com>
 <20220330063913.GW12181@pengutronix.de>
 <9619ce71-db59-d6cd-c254-2b67122fa245@rock-chips.com>
 <20220331070614.GD4012@pengutronix.de>
 <eebd2731-f18b-af1c-b0b9-09df669f5a3c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eebd2731-f18b-af1c-b0b9-09df669f5a3c@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:11:42 up 20:41, 46 users,  load average: 0.12, 0.17, 0.21
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
 Kever Yang <Kever.yang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 03:20:37PM +0800, Andy Yan wrote:
> Hi Sascha:
> 
> On 3/31/22 15:06, Sascha Hauer wrote:
> > On Wed, Mar 30, 2022 at 08:50:09PM +0800, Andy Yan wrote:
> > > Hi Sascha:
> > > 
> > > On 3/30/22 14:39, Sascha Hauer wrote:
> > > > Hi Andy,
> > > > 
> > > > On Tue, Mar 29, 2022 at 07:56:27PM +0800, Andy Yan wrote:
> > > > > Hi Sascha:
> > > > > 
> > > > > On 3/28/22 23:11, Sascha Hauer wrote:
> > > > > > With upcoming VOP2 support VOP won't be the only choice anymore, so make
> > > > > > the VOP driver optional.
> > > > > > 
> > > > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > > ---
> > > > > >     drivers/gpu/drm/rockchip/Kconfig            | 8 ++++++++
> > > > > >     drivers/gpu/drm/rockchip/Makefile           | 3 ++-
> > > > > >     drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
> > > > > >     3 files changed, 11 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> > > > > > index fa5cfda4e90e3..7d22e2997a571 100644
> > > > > > --- a/drivers/gpu/drm/rockchip/Kconfig
> > > > > > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > > > > > @@ -23,8 +23,16 @@ config DRM_ROCKCHIP
> > > > > >     if DRM_ROCKCHIP
> > > > > > +config ROCKCHIP_VOP
> > > > > > +	bool "Rockchip VOP driver"
> > > > > > +	default y
> > > > > > +	help
> > > > > > +	  This selects support for the VOP driver. You should enable it
> > > > > > +	  on all older SoCs up to RK3399.
> > > > That reminds me that I wanted to rephrase this. Will change in next
> > > > round.
> > > > 
> > > > > > +
> > > > > >     config ROCKCHIP_ANALOGIX_DP
> > > > > >     	bool "Rockchip specific extensions for Analogix DP driver"
> > > > > > +	depends on ROCKCHIP_VOP
> > > > > Aanlogix dp is also on vop2 base soc such as  rk356x and rk3588.
> > BTW I just looked at the downstream driver. Here we have the same
> > situation that the analogix dp driver calls rockchip_drm_wait_vact_end()
> > which is implemented in the VOP driver, so when the analogix dp driver
> > is actually used on a VOP2 SoC then it is either used in a way that
> > rockchip_drm_wait_vact_end() will never be called or it explodes in all
> > colours.
> > 
> > > > I added the dependency because analogix_dp-rockchip.c calls
> > > > rockchip_drm_wait_vact_end() which is implemented in the VOP driver,
> > > > so this driver currenty can't work with the VOP2 driver and can't
> > > > be linked without the VOP driver being present.
> > > > I'll add a few words to the commit message.
> > > 
> > > Maybe a better direction is move rockchip_drm_wait_vact_end from the VOP
> > > driver to rockchip_drm_drv.c
> > I am not sure if that's really worth it. Yes, the direction might be the
> > right one, but I would really prefer when somebody does the change who
> > can test and confirm that the analogix dp really works with VOP2 in the
> > end.
> 
> If follow this point, the current DW_MIPI also has not been tested for
> confirm that it
> 
> can really work with VOP2, so you should also make it depends on
> ROCKCHIP_VOP.

Well at least I have patches here which make DW_MIPI work with VOP2 ;)

What about the others, like LVDS and RGB?
> 
> I think the current solution is just a workaround to make your patch pass
> the kernel compile

Indeed.

I agree that it would be good to add a note somewhere which outputs
work with the VOP2 driver (currently only HDMI), but I wonder if Kconfig
dependencies is the right place for it, because only people who deliberately
disable VOP support will see this information.
Maybe we should rather add it to the Kconfig help text?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
