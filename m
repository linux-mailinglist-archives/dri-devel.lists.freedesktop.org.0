Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED98243F4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131AE10E486;
	Thu,  4 Jan 2024 14:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08210E486
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704379193;
 bh=qc3xakyHE+a32IwuTxDwyhQGwwi7DGoompf3iqlbs2o=;
 h=From:To:Cc:Subject:Date:From;
 b=5lEi+tqYFx+1gRJ81VBYBLnkv9SEtSW55qQj4yA2WZbh1Bw1+Uj+naADvOlQZXKdk
 64LF9zTsmOgSAGYrSH4zm3/Ci1iLi7Lyih36xo07kjDPs0m/kmPpaDHWZnGatIGjKY
 mkTZFSpQ1toDi3nD3+MvYPltafvsMd6HYR5QBlFREo8bNOjgBlpIZScfwLjLLX3Vkh
 PfDzq8OUdtktwHM81P4CGh+TGbJ8VCFG5w/Q/hIgv7fWszGCEUNYzrzDEcJOhxXxEe
 0UOB463luBT4cEm6iUTdBuJ8tkvG32mVHbthecbI4Colj5LQJ3U2JmCmuw+2Wwb//f
 S5C2+DyznA+Kw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 825D8378200E;
 Thu,  4 Jan 2024 14:39:53 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/rockchip: vop2: Drop superfluous include
Date: Thu,  4 Jan 2024 16:39:49 +0200
Message-ID: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rockchip_drm_fb.h header contains just a single function which is
not directly used by the VOP2 driver.  Drop the unnecessary include.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 923985d4161b..74c533292bbb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -35,7 +35,6 @@
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
-#include "rockchip_drm_fb.h"
 #include "rockchip_drm_vop2.h"
 #include "rockchip_rgb.h"
 
-- 
2.43.0

