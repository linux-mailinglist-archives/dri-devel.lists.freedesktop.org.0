Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9277A3A8
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 00:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE93310E03A;
	Sat, 12 Aug 2023 22:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961BD10E03A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Aug 2023 22:28:31 +0000 (UTC)
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qUx5r-0002QJ-4H; Sun, 13 Aug 2023 00:28:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 0/5] drm/rockchip: Fix crtc duplicate state and crtc
 reset funcs
Date: Sun, 13 Aug 2023 00:28:21 +0200
Message-Id: <169187928908.3734147.12874056475289998677.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621223311.2239547-1-jonas@kwiboo.se>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jun 2023 22:33:15 +0000 (UTC), Jonas Karlman wrote:
> This series fixes a reset of state in duplicate state crtc funcs for VOP
> driver, a possible crash and ensure crtc reset helper is called in VOP2
> driver.
> 
> Patch 1 use kmemdup instead of kzalloc to duplicate the crtc state.
> Patch 2 change to use crtc and plane cleanup helpers directly.
> Patch 3 adds a null guard for allocation failure.
> Patch 4 adds a crash guard for empty crtc state.
> Patch 5 adds a missing call to crtc reset helper.
> 
> [...]

Applied, thanks!

[1/5] drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
      commit: 13fc28804bf10ca0b7bce3efbba95c534836d7ca
[2/5] drm/rockchip: vop: Use cleanup helper directly as destroy funcs
      commit: 800f7c332df7cd9614c416fd005a6bb53f96f13c
[3/5] drm/rockchip: vop: Fix call to crtc reset helper
      commit: 5aacd290837828c089a83ac9795c74c4c9e2c923
[4/5] drm/rockchip: vop2: Don't crash for invalid duplicate_state
      commit: 342f7e4967d02b0ec263b15916304fc54841b608
[5/5] drm/rockchip: vop2: Add missing call to crtc reset helper
      commit: 4d49d87b3606369c6e29b9d051892ee1a6fc4e75

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
