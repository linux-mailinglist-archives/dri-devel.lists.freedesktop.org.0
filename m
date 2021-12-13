Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D469472ADA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 12:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F8110E809;
	Mon, 13 Dec 2021 11:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E6310E809
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 11:08:25 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mwjBv-0002cG-6X; Mon, 13 Dec 2021 12:08:23 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mwjBr-0006po-V0; Mon, 13 Dec 2021 12:08:19 +0100
Date: Mon, 13 Dec 2021 12:08:19 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 07/18] dt-bindings: display: rockchip: dw-hdmi: Allow
 "ref" as clock name
Message-ID: <20211213110819.GB6003@pengutronix.de>
References: <20211208151230.3695378-1-s.hauer@pengutronix.de>
 <20211208151230.3695378-8-s.hauer@pengutronix.de>
 <3032544.f5MXlUzpl7@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3032544.f5MXlUzpl7@phil>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:07:30 up 2 days, 19:53, 56 users, load average: 0.19, 0.24, 0.18
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

On Sun, Dec 12, 2021 at 11:09:24PM +0100, Heiko Stuebner wrote:
> Am Mittwoch, 8. Dezember 2021, 16:12:19 CET schrieb Sascha Hauer:
> > "vpll" is a misnomer. A clock input to a device should be named after
> > the usage in the device, not after the clock that drives it. On the
> > rk3568 the same clock is driven by the HPLL.
> > To fix that, this patch renames the vpll clock to ref clock.  The clock
> > name "vpll" is left for compatibility to old device trees.
> 
> Can't we just say that the binding only takes the "ref" name, but
> the code still allows "vpll".
> 
> I think I remember Rob suggesting something similar in the past.
> 
> I don't think that we need to keep the binding(-validation)
> compatible with old devicetrees, but the kernel itself should stay
> compatible.

Sounds reasonable. I'll also add a patch changing the in-tree users next
round.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
