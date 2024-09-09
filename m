Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DB97130E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8425810E345;
	Mon,  9 Sep 2024 09:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5E10E345
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:14:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1snaT9-0004BL-4W; Mon, 09 Sep 2024 11:13:59 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1snaT5-006c5g-91; Mon, 09 Sep 2024 11:13:55 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <sha@pengutronix.de>) id 1snaT5-00FfJM-0X;
 Mon, 09 Sep 2024 11:13:55 +0200
Date: Mon, 9 Sep 2024 11:13:55 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Cc: detlev.casanova@collabora.com, heiko@sntech.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, mripard@kernel.org,
 sebastian.reichel@collabora.com, linux-rockchip@lists.infradead.org,
 sjoerd@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org
Subject: Re: Re: [PATCH v2 05/11] drm/rockchip: vop2: Introduce vop hardware
 version
Message-ID: <Zt68U6hnPA0KrxXB@pengutronix.de>
References: <20240904120238.3856782-1-andyshrk@163.com>
 <20240904120238.3856782-6-andyshrk@163.com>
 <ZtlZgKcDQFF_WnCn@pengutronix.de>
 <2326e2ea.8264.191c13bab93.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2326e2ea.8264.191c13bab93.Coremail.andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 05, 2024 at 04:09:58PM +0800, Andy Yan wrote:
>    Hi Sascha,
> 
>  At 2024-09-05 15:10:56, "Sascha Hauer" <s.hauer@pengutronix.de> wrote:
>  >Hi Andy,
>  >
>  >On Wed, Sep 04, 2024 at 08:02:32PM +0800, Andy Yan wrote:
>  >> From: Andy Yan <andy.yan@rock-chips.com>
>  >>
>  >> There is a version number hardcoded in the VOP VERSION_INFO
>  >> register, and the version number increments sequentially based
>  >> on the production order of the SOC.
>  >>
>  >> So using this version number to distinguish different VOP features
>  >> will simplify the code.
>  >>
>  >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>  >>
>  >> ---
>  >>
>  >> Changes in v2:
>  >> - Introduce vop hardware version
>  >>
>  >>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  7 ++++---
>  >>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 11 +++++++++++
>  >>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  3 +++
>  >>  3 files changed, 18 insertions(+), 3 deletions(-)
>  >>
>  >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>  >> index 9b269f6e576e..871d9bcd1d80 100644
>  >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>  >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>  >> @@ -13,6 +13,15 @@
>  >>  #include "rockchip_drm_drv.h"
>  >>  #include "rockchip_drm_vop.h"
>  >>
>  >> +#define VOP2_VERSION(major, minor, build)     ((major) << 24 | (minor) << 16 | (build))
>  >> +
>  >> +/* The new SOC VOP version is bigger than the old */
>  >> +#define VOP_VERSION_RK3568    VOP2_VERSION(0x40, 0x15, 0x8023)
>  >> +#define VOP_VERSION_RK3588    VOP2_VERSION(0x40, 0x17, 0x6786)
>  >> +#define VOP_VERSION_RK3528    VOP2_VERSION(0x50, 0x17, 0x1263)
>  >> +#define VOP_VERSION_RK3562    VOP2_VERSION(0x50, 0x17, 0x4350)
>  >> +#define VOP_VERSION_RK3576    VOP2_VERSION(0x50, 0x19, 0x9765)
>  >
>  >What about the RK3566? Does it have the same version code as the RK3568?
>  >
>  >This new version field replaces the soc_id mechanism we had before to
>  >99%. You keep the soc_id around just for distinguishing between RK3566
>  >and RK3568. It would be nice to fully replace it.
>  >
>  >I see that the VOP_VERSION_RK* numbers are the same as found in the
>  >VOP2_SYS_VERSION_INF registers. On the other hand you never read the
>  >value from the register which make the VOP_VERSION_RK* just arbitrary
>  >numbers. Wouldn't it be possible to make something up for RK3566, like
>  >VOP2_VERSION(0x40, 0x15, 0x8022) to get rid of the soc_id thingy?
>  Yes，RK3566 and RK3568 share the same VOP IP block， so the version code at VERSION_REGISTER is
>  the same, the difference between rk3568 and rk33566 are introduced at soc Integration。
>  So i would still like to keep the soc_id to  handle situation like this。As we always have such  cause， one
>  same IP block， but there are some subtle differences in features across different SOCs.

Fine with me. You could leave a comment in the code or commit
message that explains why we need both.

>  I have considered reading the version register directly, but I haven't found a suitable method yet.

You could check the expected version from the driver data against
the register value, but that would only be an additional sanity check.
Not sure if it's worth it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
