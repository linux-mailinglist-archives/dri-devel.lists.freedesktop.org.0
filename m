Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F691528B9A
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 19:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429110E2BF;
	Mon, 16 May 2022 17:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981710E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 17:08:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nqeD4-0005c8-R7; Mon, 16 May 2022 19:08:42 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nqeD2-0004CX-Bh; Mon, 16 May 2022 19:08:40 +0200
Date: Mon, 16 May 2022 19:08:40 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: rockchip: make reg-names
 mandatory for VOP2
Message-ID: <20220516170840.GO25578@pengutronix.de>
References: <20220511082109.1110043-1-s.hauer@pengutronix.de>
 <20220511082109.1110043-2-s.hauer@pengutronix.de>
 <20220516151226.GA2653888-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516151226.GA2653888-robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:07:40 up 47 days,  5:37, 74 users,  load average: 0.02, 0.12, 0.14
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
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Heiko,

On Mon, May 16, 2022 at 10:12:26AM -0500, Rob Herring wrote:
> On Wed, 11 May 2022 10:21:07 +0200, Sascha Hauer wrote:
> > The VOP2 driver relies on reg-names properties, but these are not
> > documented. Add the missing documentation, make reg-names mandatory
> > and increase minItems to 2 as always both register spaces are needed.

Could you drop the minItems part while applying? That is no longer
correct.

Sascha

> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > 
> > Notes:
> >     Changes since v1:
> >     - Drop minItems
> >     - Add reg-names properties to example
> > 
> >  .../bindings/display/rockchip/rockchip-vop2.yaml          | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
