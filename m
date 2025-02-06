Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6357A2A14C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E969A10E450;
	Thu,  6 Feb 2025 06:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CPKIGk+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96B3E10E43F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Aj3p5
 YEkL2Je1AnEdaQQ2QACpF4/wWQgDcT/1GT+BA4=; b=CPKIGk+Plw5na6v3mt06O
 2UPPckbUxCBkKaVYL6zoa0SQqfUhdHKAPa2EcwoKac0jqWrJy+sznRkESXi9Hxf8
 qUKArOqp1fDINFe9fGtr/bZyqYlFPR7agtltexLen63GU8y38UyFyseBebraW4pZ
 Yp7LSvPi1V7AbYx0KlRJPA=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wD3fyNsWqRnb3bDKQ--.52146S4; 
 Thu, 06 Feb 2025 14:45:06 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v13 02/13] drm/rockchip: vop2: Rename TRANSFORM_OFFSET to
 TRANSFORM_OFFS
Date: Thu,  6 Feb 2025 14:44:30 +0800
Message-ID: <20250206064457.11396-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3fyNsWqRnb3bDKQ--.52146S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWxKw4rJw15Jr18uw17Wrg_yoWrCr18pr
 W3JayDWF4UKFs2gFWkAr15AF48Xan2y3yfGa9xJrnIqFyaga4DWwnFka4UJr4Uta4I9FZ2
 q3saqrW7urW3tr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYtC7UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRnrXmekUdSnkAAAs0
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

From: Andy Yan <andy.yan@rock-chips.com>

This help avoid "exceeds 100 columns" warning from checkpatch

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 03248ac4ba4a..5ee8a7b86d0b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1517,7 +1517,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
-		vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFSET, transform_offset);
+		vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFS, transform_offset);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_OFFSET, ((src->x1 >> 16) | src->y1));
 		vop2_win_write(win, VOP2_WIN_AFBC_DSP_OFFSET, (dest->x1 | (dest->y1 << 16)));
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_VIR_WIDTH, stride);
@@ -1528,7 +1528,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	} else {
 		if (vop2_cluster_window(win)) {
 			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 0);
-			vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFSET, 0);
+			vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFS, 0);
 		}
 
 		vop2_win_write(win, VOP2_WIN_YRGB_VIR, DIV_ROUND_UP(fb->pitches[0], 4));
@@ -3420,7 +3420,7 @@ static const struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_AFBC_TILE_NUM] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 16, 31),
 	[VOP2_WIN_AFBC_PIC_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_OFFSET, 0, 31),
 	[VOP2_WIN_AFBC_DSP_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_DSP_OFFSET, 0, 31),
-	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET, 0, 31),
+	[VOP2_WIN_AFBC_TRANSFORM_OFFS] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFS, 0, 31),
 	[VOP2_WIN_AFBC_ROTATE_90] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 0, 0),
 	[VOP2_WIN_AFBC_ROTATE_270] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 1, 1),
 	[VOP2_WIN_XMIRROR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 2, 2),
@@ -3519,7 +3519,7 @@ static const struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_AFBC_PIC_OFFSET] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_PIC_SIZE] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_DSP_OFFSET] = { .reg = 0xffffffff },
-	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_TRANSFORM_OFFS] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_HDR_PTR] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_HALF_BLOCK_EN] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_ROTATE_270] = { .reg = 0xffffffff },
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 29cc7fb8f6d8..8510140b0869 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -118,7 +118,7 @@ enum vop2_win_regs {
 	VOP2_WIN_AFBC_PIC_OFFSET,
 	VOP2_WIN_AFBC_PIC_SIZE,
 	VOP2_WIN_AFBC_DSP_OFFSET,
-	VOP2_WIN_AFBC_TRANSFORM_OFFSET,
+	VOP2_WIN_AFBC_TRANSFORM_OFFS,
 	VOP2_WIN_AFBC_HDR_PTR,
 	VOP2_WIN_AFBC_HALF_BLOCK_EN,
 	VOP2_WIN_AFBC_ROTATE_270,
@@ -335,7 +335,7 @@ enum dst_factor_mode {
 #define RK3568_CLUSTER_WIN_DSP_INFO		0x24
 #define RK3568_CLUSTER_WIN_DSP_ST		0x28
 #define RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB	0x30
-#define RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET	0x3C
+#define RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFS	0x3C
 #define RK3568_CLUSTER_WIN_AFBCD_OUTPUT_CTRL	0x50
 #define RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE	0x54
 #define RK3568_CLUSTER_WIN_AFBCD_HDR_PTR	0x58
-- 
2.34.1

