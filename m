Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0E8B2467
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130411A4F0;
	Thu, 25 Apr 2024 14:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CFC11A4F7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:52:08 +0000 (UTC)
Received: from i5e861d82.versanet.de ([94.134.29.130] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s00S1-0003Vg-2q; Thu, 25 Apr 2024 16:51:53 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/1] drm/rockchip: vop2: Fix the port mux of VP2
Date: Thu, 25 Apr 2024 16:51:52 +0200
Message-ID: <3237003.e9J7NaK4W3@diego>
In-Reply-To: <20240422101905.32703-2-andyshrk@163.com>
References: <20240422101905.32703-1-andyshrk@163.com>
 <20240422101905.32703-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Montag, 22. April 2024, 12:19:05 CEST schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The port mux of VP2 should be RK3568_OVL_PORT_SET__PORT2_MUX.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

on a rk3588 with VP3 connected to a DSI display
Tested-by: Heiko Stuebner <heiko@sntech.de>



