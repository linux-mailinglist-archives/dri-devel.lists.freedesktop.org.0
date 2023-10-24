Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777007D4CDC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0F210E314;
	Tue, 24 Oct 2023 09:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D1610E314
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:48:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qvE1m-0004r2-97; Tue, 24 Oct 2023 11:48:46 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1qvE1i-003ulF-5o; Tue, 24 Oct 2023 11:48:42 +0200
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qvE1i-00G6Og-39; Tue, 24 Oct 2023 11:48:42 +0200
Date: Tue, 24 Oct 2023 11:48:42 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v3 0/4] Add more format for vop2 driver
Message-ID: <20231024094842.GW3359458@pengutronix.de>
References: <20231018094122.2475668-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018094122.2475668-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jonas@kwiboo.se, sjoerd.simons@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 05:41:22PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> This is a preparation for the upcoming support for rk3588 vop.
> 
> Patch 1 make the bpp calculation covery more format
> Patch 2 remove formats that are unsupported by cluster windows
> Patch 3 add more formats
> Patch 4 is a format table rename
> 
> And I drop two patches that have applied by Heiko[0]
> [0]https://patchwork.kernel.org/project/linux-rockchip/cover/20231013122001.1594009-1-andyshrk@163.com/
> 
> Changes in v3:
> - add a bpp calculation function
> - split patch 
> - add format check and convert
> 
> Andy Yan (4):
>   drm/rockchip: fix vop format bpp calculation
>   drm/rockchip: remove the unsupported format of vop2 cluster window
>   drm/rockchip: Add more format supported by vop2
>   drm/rockchip: rename windows format for vop2

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
