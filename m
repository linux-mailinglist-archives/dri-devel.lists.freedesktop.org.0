Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33366BE317
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF06C10EE62;
	Fri, 17 Mar 2023 08:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8910EE4A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:22:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD1666220B;
 Fri, 17 Mar 2023 08:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF67C433AC;
 Fri, 17 Mar 2023 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041360;
 bh=TTXOACgLSQFnl4K1HvxAX3eNv0Oie4ZJ9D8WDA/I0Ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbD0bEafKOg+j81tmm9Cs2kmYjZ+XVHsanpQgZrPzJWe0ONoNQ9NtO0x7Pco0BuU/
 Rv8xi9Hngx/nWLVZeIkZsogasnZY4948QlPJYzZ3VcSPlG1DV4gllutdIQpQCCsggO
 IbqBDpWtF6sxu4FGUfqFdCZnSALNX3FASec4leYPY7go9rZr14YBLbJKyMxGDE0SiT
 7s024WSOz+rx37noj6aplaBm0mEHkE0r3DF/d8hWbSklFkg/9VbW38Lk7F+sqJnSfU
 r1PICp7gwWbp94aJAmx0tIGIgEuBL7MV8ig6qrXOo+vFV7oOFF+VP/sREO5oLpve+x
 azsMVmQbaNr7A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/37] drm/tegra/dc: Remove set but unused variable 'state'
Date: Fri, 17 Mar 2023 08:16:50 +0000
Message-Id: <20230317081718.2650744-10-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/tegra/dc.c: In function ‘tegra_crtc_calculate_memory_bandwidth’:
 drivers/gpu/drm/tegra/dc.c:2384:38: warning: variable ‘old_state’ set but not used [-Wunused-but-set-variable]

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/tegra/dc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a67453cee8832..cafa1720026cc 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2381,7 +2381,6 @@ static int tegra_crtc_calculate_memory_bandwidth(struct drm_crtc *crtc,
 	const struct tegra_plane_state *tegra_state;
 	const struct drm_plane_state *plane_state;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	const struct drm_crtc_state *old_state;
 	struct drm_crtc_state *new_state;
 	struct tegra_plane *tegra;
 	struct drm_plane *plane;
@@ -2396,7 +2395,6 @@ static int tegra_crtc_calculate_memory_bandwidth(struct drm_crtc *crtc,
 		return 0;
 
 	new_state = drm_atomic_get_new_crtc_state(state, crtc);
-	old_state = drm_atomic_get_old_crtc_state(state, crtc);
 
 	/*
 	 * For overlapping planes pixel's data is fetched for each plane at
-- 
2.40.0.rc1.284.g88254d51c5-goog

