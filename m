Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D411FFC1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278326E43C;
	Mon, 16 Dec 2019 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBED089C0D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:51:08 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 234B35DFD79CB752036B;
 Mon, 16 Dec 2019 11:51:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Dec 2019
 11:50:59 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <narmstrong@baylibre.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] drm: meson: Remove unneeded semicolon
Date: Mon, 16 Dec 2019 11:58:21 +0800
Message-ID: <1576468701-69717-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/meson/meson_crtc.c:360:3-4: Unneeded semicolon
drivers/gpu/drm/meson/meson_plane.c:181:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/meson/meson_crtc.c  | 2 +-
 drivers/gpu/drm/meson/meson_plane.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 57ae1c1..eefefc4 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -357,7 +357,7 @@ void meson_crtc_irq(struct meson_drm *priv)
 					    MESON_CANVAS_WRAP_NONE,
 					    MESON_CANVAS_BLKMODE_LINEAR,
 					    MESON_CANVAS_ENDIAN_SWAP64);
-		};
+		}

 		writel_relaxed(priv->viu.vd1_if0_gen_reg,
 				priv->io_base + meson_crtc->viu_offset +
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index ed54322..b96fa43 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -178,7 +178,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_16 |
 					      OSD_COLOR_MATRIX_16_RGB565;
 		break;
-	};
+	}

 	/* Default scaler parameters */
 	vsc_bot_rcv_num = 0;
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
