Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29076565AF0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10C010E853;
	Mon,  4 Jul 2022 16:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9768910E027
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 11:11:43 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o7xVi-00047D-JN; Sun, 03 Jul 2022 13:11:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/rockchip: Fix an error handling path
 rockchip_dp_probe()
Date: Sun,  3 Jul 2022 13:11:27 +0200
Message-Id: <165684667536.1187961.10202917102569434363.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <b719d9061bb97eb85145fbd3c5e63f4549f2e13e.1655572071.git.christophe.jaillet@wanadoo.fr>
References: <b719d9061bb97eb85145fbd3c5e63f4549f2e13e.1655572071.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Jun 2022 19:08:05 +0200, Christophe JAILLET wrote:
> Should component_add() fail, we should call analogix_dp_remove() in the
> error handling path, as already done in the remove function.

Applied, thanks!

[1/1] drm/rockchip: Fix an error handling path rockchip_dp_probe()
      commit: 5074376822fe99fa4ce344b851c5016d00c0444f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
