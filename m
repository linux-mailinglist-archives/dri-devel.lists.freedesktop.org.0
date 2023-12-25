Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A281DD53
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 01:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DF610E027;
	Mon, 25 Dec 2023 00:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63610E027
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 00:21:16 +0000 (UTC)
Received: from i5e86193c.versanet.de ([94.134.25.60] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rHYiR-0007kx-97; Mon, 25 Dec 2023 01:21:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Avoid use regmap_reinit_cache at
 runtime
Date: Mon, 25 Dec 2023 01:21:04 +0100
Message-Id: <170346364423.2455794.3597954899361458023.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217084415.2373043-1-andyshrk@163.com>
References: <20231217084415.2373043-1-andyshrk@163.com>
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
Cc: s.hauer@pengutronix.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Dec 2023 16:44:15 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Marek Report a possible irq lock inversion dependency warning when
> commit 81a06f1d02e5 ("Revert "drm/rockchip: vop2: Use regcache_sync()
> to fix suspend/resume"") lands linux-next.
> 
> I can reproduce this warning with:
> CONFIG_PROVE_LOCKING=y
> CONFIG_DEBUG_LOCKDEP=y
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Avoid use regmap_reinit_cache at runtime
      commit: 3ee348eb36f14e9303a7e9757efb91b0bbf3f7a9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
