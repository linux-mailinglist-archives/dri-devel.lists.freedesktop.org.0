Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C159F400
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B53710E223;
	Wed, 24 Aug 2022 07:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C9F10E223
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 07:10:25 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oQkWt-0001pu-7m; Wed, 24 Aug 2022 09:10:23 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oQkWs-0007nA-I0; Wed, 24 Aug 2022 09:10:22 +0200
Date: Wed, 24 Aug 2022 09:10:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 0/2] drm/rockchip: dw_hdmi: Add 4k@30 support
Message-ID: <20220824071022.GP17485@pengutronix.de>
References: <20220822152017.1523679-1-s.hauer@pengutronix.de>
 <ef70b8b7-c1ff-a6b9-077b-83ea48c66c24@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef70b8b7-c1ff-a6b9-077b-83ea48c66c24@wolfvision.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
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
Cc: kernel@pengutronix.de,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 07:43:03AM +0200, Michael Riesch wrote:
> Hi Sascha,
> 
> Can you Cc: linux-rockchip list to get more feedback?

Yes, will do that next time.

> 
> On 8/22/22 17:20, Sascha Hauer wrote:
> > This series adds support for 4k@30 to the rockchip HDMI controller. This
> > has been tested on a rk3568 rock3a board. It should be possible to add
> > 4k@60 support the same way, but it doesn't work for me, so let's add
> > 4k@30 as a first step.
> > 
> > Sascha
> > 
> > Sascha Hauer (2):
> >   drm/rockchip: dw_hdmi: relax mode_valid hook
> >   drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
> 
> Great stuff, thanks!
> 
> On a Radxa ROCK3 Model A with a HP 27f 4k monitor
> 
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
