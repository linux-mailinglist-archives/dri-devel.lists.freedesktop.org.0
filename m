Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8327E1E5BF6
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 11:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17C66E4C7;
	Thu, 28 May 2020 09:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E716E4C7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 09:34:34 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jeEvo-00056R-NH; Thu, 28 May 2020 11:34:32 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jeEvn-0003dN-SM; Thu, 28 May 2020 11:34:31 +0200
Date: Thu, 28 May 2020 11:34:31 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/imx: imx-ldb: Remove the leftover
 LVDS_BIT_MAP_SPWG/JEIDA enums
Message-ID: <20200528093431.x7tfwiw6glzr5tck@pengutronix.de>
References: <1589268078-19905-1-git-send-email-victor.liu@nxp.com>
 <e46c78dfddbc76a1e677f3ee6cc9d3816f67edc3.camel@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e46c78dfddbc76a1e677f3ee6cc9d3816f67edc3.camel@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:32:59 up 195 days, 51 min, 196 users, load average: 0.50, 0.27, 
 0.13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

pls check [1], I already send patches for it. Those stuck because we
need to verify Philipp's proposal.

[1] https://www.spinics.net/lists/arm-kernel/msg789309.html

Regards,
  Marco

On 20-05-28 10:55, Liu Ying wrote:
> Gentle ping...
> 
> On Tue, 2020-05-12 at 15:21 +0800, Liu Ying wrote:
> > No one is using the LVDS_BIT_MAP_SPWG/JEIDA enums since a previous
> > commit which changes the imx_ldb_bit_mappings[] array definition,
> > so let's remove them.
> > 
> > Fixes: 5e501ed7253b ("drm/imx: imx-ldb: allow to determine bus format
> > from the connected panel")
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/imx/imx-ldb.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-
> > ldb.c
> > index 4da22a9..19a00eb 100644
> > --- a/drivers/gpu/drm/imx/imx-ldb.c
> > +++ b/drivers/gpu/drm/imx/imx-ldb.c
> > @@ -477,11 +477,6 @@ static int imx_ldb_register(struct drm_device
> > *drm,
> >  	return 0;
> >  }
> >  
> > -enum {
> > -	LVDS_BIT_MAP_SPWG,
> > -	LVDS_BIT_MAP_JEIDA
> > -};
> > -
> >  struct imx_ldb_bit_mapping {
> >  	u32 bus_format;
> >  	u32 datawidth;
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
