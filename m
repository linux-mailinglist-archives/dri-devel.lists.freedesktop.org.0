Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA27CD875
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD20010E3CC;
	Wed, 18 Oct 2023 09:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id D039510E3CC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=UE5ny
 2U845hUveTADk37Szj4xJgI4fIwTqY/gMa46xs=; b=oWHm7TY+QbdPJUn6JyF47
 0Xwow6Um67Hj/tjh4DW0dc0usDyNBeR2+ZUwsTN/hxqab6mYxkFXUUSYXUfeg/et
 V/PnezSF2JiAjQbgGISPa1ky8b8PVk/akTgKYO/a0Xom22dMqXSe7Vcz7YdnZGcg
 R4IrFIdA1KKseuepecNakA=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wDnj5TMqC9lLxuJAw--.4745S2; 
 Wed, 18 Oct 2023 17:43:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jonas@kwiboo.se
Subject: [PATCH v3 4/4] drm/rockchip: rename windows format for vop2
Date: Wed, 18 Oct 2023 17:43:39 +0800
Message-Id: <20231018094339.2476142-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018094122.2475668-1-andyshrk@163.com>
References: <20231018094122.2475668-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnj5TMqC9lLxuJAw--.4745S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1xKF43Kr4xJF47JF47Arb_yoWrCF1xpa
 9F9rnxuF4ruF45Wr1UJayUZr4rC3ZIk3ya9wn5G3Z7KF43KF9rXr1UKas8Cr1DKa48Ar1U
 Jr4aqryUZr47tFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSzuAUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiTAsNXmI0bm1figACsW
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

formats_win_full_10bit is for cluster window,
formats_win_full_10bit_yuyv is for rk356x esmart, rk3588 esmart window
will support more format.
formats_win_lite is for smart window.

Rename it based the windows type may let meaning is clearer

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 30 ++++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index bcc224624a26..fdb48571efce 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -15,7 +15,7 @@
 
 #include "rockchip_drm_vop2.h"
 
-static const uint32_t formats_win_full_10bit[] = {
+static const uint32_t formats_cluster[] = {
 	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_XBGR2101010,
@@ -34,7 +34,7 @@ static const uint32_t formats_win_full_10bit[] = {
 	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
 };
 
-static const uint32_t formats_win_full_10bit_yuyv[] = {
+static const uint32_t formats_rk356x_esmart[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
@@ -54,7 +54,7 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
 	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
 };
 
-static const uint32_t formats_win_lite[] = {
+static const uint32_t formats_smart[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
@@ -153,8 +153,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.name = "Smart0-win0",
 		.phys_id = ROCKCHIP_VOP2_SMART0,
 		.base = 0x1c00,
-		.formats = formats_win_lite,
-		.nformats = ARRAY_SIZE(formats_win_lite),
+		.formats = formats_smart,
+		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
 		.layer_sel_id = 3,
 		.supported_rotations = DRM_MODE_REFLECT_Y,
@@ -165,8 +165,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	}, {
 		.name = "Smart1-win0",
 		.phys_id = ROCKCHIP_VOP2_SMART1,
-		.formats = formats_win_lite,
-		.nformats = ARRAY_SIZE(formats_win_lite),
+		.formats = formats_smart,
+		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1e00,
 		.layer_sel_id = 7,
@@ -178,8 +178,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	}, {
 		.name = "Esmart1-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART1,
-		.formats = formats_win_full_10bit_yuyv,
-		.nformats = ARRAY_SIZE(formats_win_full_10bit_yuyv),
+		.formats = formats_rk356x_esmart,
+		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1a00,
 		.layer_sel_id = 6,
@@ -191,8 +191,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	}, {
 		.name = "Esmart0-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART0,
-		.formats = formats_win_full_10bit_yuyv,
-		.nformats = ARRAY_SIZE(formats_win_full_10bit_yuyv),
+		.formats = formats_rk356x_esmart,
+		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1800,
 		.layer_sel_id = 2,
@@ -205,8 +205,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.name = "Cluster0-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
 		.base = 0x1000,
-		.formats = formats_win_full_10bit,
-		.nformats = ARRAY_SIZE(formats_win_full_10bit),
+		.formats = formats_cluster,
+		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
 		.layer_sel_id = 0,
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
@@ -220,8 +220,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.name = "Cluster1-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
 		.base = 0x1200,
-		.formats = formats_win_full_10bit,
-		.nformats = ARRAY_SIZE(formats_win_full_10bit),
+		.formats = formats_cluster,
+		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
 		.layer_sel_id = 1,
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
-- 
2.34.1

