Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7983946CD
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 20:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0B66E52A;
	Fri, 28 May 2021 18:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765E06E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 18:09:57 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lmgve-0006Ve-Pv; Fri, 28 May 2021 20:09:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Nickey Yang <nickey.yang@rock-chips.com>, Thomas Hebb <tommyhebb@gmail.com>
Subject: Re: [RESEND PATCH] drm/rockchip: dsi: move all lane config except
 LCDC mux to bind()
Date: Fri, 28 May 2021 20:09:44 +0200
Message-Id: <162222530163.2887132.15086890641493370565.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <55fe7f3454d8c91dc3837ba5aa741d4a0e67378f.1618797813.git.tommyhebb@gmail.com>
References: <55fe7f3454d8c91dc3837ba5aa741d4a0e67378f.1618797813.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 18 Apr 2021 19:04:10 -0700, Thomas Hebb wrote:
> When we first enable the DSI encoder, we currently program some per-chip
> configuration that we look up in rk3399_chip_data based on the device
> tree compatible we match. This data configures various parameters of the
> MIPI lanes, including on RK3399 whether DSI1 is slaved to DSI0 in a
> dual-mode configuration. It also selects which LCDC (i.e. VOP) to scan
> out from.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: dsi: move all lane config except LCDC mux to bind()
      commit: 43c2de1002d2b70fb5941fa14e97a34e3dc214d4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
