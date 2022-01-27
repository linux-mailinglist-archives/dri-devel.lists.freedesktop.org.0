Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09D49E002
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710B10E8BD;
	Thu, 27 Jan 2022 11:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427F210E4D9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:00:13 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nD2Vf-0001FG-CL; Thu, 27 Jan 2022 12:00:11 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nD2Vd-0005aU-8V; Thu, 27 Jan 2022 12:00:09 +0100
Date: Thu, 27 Jan 2022 12:00:09 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 27/27] drm: rockchip: Add VOP2 driver
Message-ID: <20220127110009.GK23490@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-28-s.hauer@pengutronix.de>
 <6588D77C-D3CB-4FB0-8B00-5EDD6ABD6923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6588D77C-D3CB-4FB0-8B00-5EDD6ABD6923@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:50:02 up 47 days, 19:35, 82 users,  load average: 0.37, 0.46, 0.32
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 10:17:13AM +0100, Piotr Oniszczuk wrote:
> Sascha,
> 
> FYI 
> small report regarding 4k modes support in v4:
> 
> -on rk3399 it gives me 4k screen where right vertical 1/3 part of screen is garbage
> -on rk3566 my samsung 4k monitor has black screen and cycle of OSD msgs: HDMI2 connected; HDMI2 disconnected; ....

Same here on my rk3568, also with a samsung monitor. Was it 4k@60Hz or
4k@30Hz? If the former, could you give 4k@30Hz a try? That mode works
well here.

> 
> I would suggest split v4 into 2 separated series:

Yeah, splitting up the series makes sense. At the moment I have it all
in one series to ease others testing it.

Sascha

> 
> -VOP2 support
> -HDMI 4k modes support
> 
> BTW: getting well working 4k HDMI modes on rk3399 was real story for me.
> There is many different series of patches to address this - but all have some subtle issues for me (i.e. 4k HDMI modes works but i.e. Qt is failing with DRM atomic commits in EGLFS)
> I developed well working [1] giving me reliable 4k on rk3399 (including working Qt DRM drawing in EGLFS mode) 
> Maybe it will be somehow helpful to get 4k modes solution for rk3566 _and_ rk3399 (on single kernel binary)?
> 
> [1] https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-5.16/files/0730-drm-rockchip-add-4k-videomodes-support.patch

At least there are patches in it that I have in my series as well and
keep popping up everywhere like "drm/rockchip: dw_hdmi: Use
auto-generated tables" and "drm/rockchip: dw_hdmi: Set cur_ctr to 0
always"

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
