Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78083430C79
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 23:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423336E40D;
	Sun, 17 Oct 2021 21:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE25F6E40D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 21:52:43 +0000 (UTC)
Received: from p508fd4f7.dip0.t-ipconnect.de ([80.143.212.247]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mcE56-0004w2-Eg; Sun, 17 Oct 2021 23:52:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Thomas Hebb <tommyhebb@gmail.com>,
 aleksandr.o.makarov@gmail.com, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Fix Rockchip MIPI DSI display init timeouts
Date: Sun, 17 Oct 2021 23:52:34 +0200
Message-Id: <163450753815.562592.9456022037085526003.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928213552.1001939-1-briannorris@chromium.org>
References: <20210928213552.1001939-1-briannorris@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Sep 2021 14:35:48 -0700, Brian Norris wrote:
> The Rockchip DSI driver has had a number of bugs over time and has
> usually only worked by chance. A number of users have noticed that
> things regressed with commit 43c2de1002d2 ("drm/rockchip: dsi: move all
> lane config except LCDC mux to bind()"), although it was fixing several
> real issues of its own that had been present forever in the upstream
> driver (but notably, not in the downstream/BSP driver).
> 
> [...]

Applied, thanks!

[1/4] drm/rockchip: dsi: Hold pm-runtime across bind/unbind
      commit: 514db871922f103886ad4d221cf406b4fcc5e74a
[2/4] drm/rockchip: dsi: Reconfigure hardware on resume()
      commit: e584cdc1549932f87a2707b56bc588cfac5d89e0
[3/4] drm/rockchip: dsi: Fix unbalanced clock on probe error
      commit: 251888398753924059f3bb247a44153a2853137f
[4/4] drm/rockchip: dsi: Disable PLL clock on bind error
      commit: 5a614570172e1c9f59035d259dd735acd4f1c01b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
