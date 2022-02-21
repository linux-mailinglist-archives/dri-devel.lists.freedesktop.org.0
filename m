Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBB4BD8B5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8F7112CCE;
	Mon, 21 Feb 2022 09:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF98112CCD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:53:39 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nM5Nx-0007Rt-Vf; Mon, 21 Feb 2022 10:53:37 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nM5Nu-0006XB-4c; Mon, 21 Feb 2022 10:53:34 +0100
Date: Mon, 21 Feb 2022 10:53:34 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v6 17/23] arm64: dts: rockchip: rk356x: Add HDMI nodes
Message-ID: <20220221095334.GC18637@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-18-s.hauer@pengutronix.de>
 <trinity-1fb35fb4-c954-46bc-ae87-02d5df121a01-1645433668183@3c-app-gmx-bs60>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-1fb35fb4-c954-46bc-ae87-02d5df121a01-1645433668183@3c-app-gmx-bs60>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:52:17 up 72 days, 18:37, 85 users,  load average: 0.08, 0.21, 0.25
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

On Mon, Feb 21, 2022 at 09:54:28AM +0100, Frank Wunderlich wrote:
> Hi
> 
> > Gesendet: Donnerstag, 17. Februar 2022 um 09:29 Uhr
> > Von: "Sascha Hauer" <s.hauer@pengutronix.de>
> 
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -10,7 +10,6 @@
> >  #include <dt-bindings/pinctrl/rockchip.h>
> >  #include <dt-bindings/power/rk3568-power.h>
> >  #include <dt-bindings/soc/rockchip,boot-mode.h>
> > -#include <dt-bindings/soc/rockchip,vop2.h>
> 
> why dropping this after adding in part 16?
> 
> >  #include <dt-bindings/thermal/thermal.h>
> 
> it looks like you moved this to board includes...imho this should stay
> in the rk356x.dtsi, because compilation will fail if a board without
> the vop2 (and missing the include) is derived from rk356x.dtsi.

I dropped adding the include from Patch 16. The include is not needed by
rk356x.dtsi. When a board without vop2 support is added then it won't
need the include either.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
