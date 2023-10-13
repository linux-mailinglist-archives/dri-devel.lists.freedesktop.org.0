Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF17C8596
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9202110E5EF;
	Fri, 13 Oct 2023 12:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F56E10E5EF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7vbeS
 vE0+nN2xFlJ3s3DLsu1/gcvjE/n2nTDWrgjPuE=; b=FC5AdfUNLhVoQrOx26FMf
 CGTpGLBYqK0M+Jir08Ek+AJSS2iD0jRUkUd0lgcmRRbVK7MomO/xr+WInqAYjPt1
 a1c3prmYEcvISqE6ieLKYIqRbqWH1OAP8ZnlnE9HVfor6IeEZtKClK9ZcFIKgWBg
 OcKl01sfWd3vQ1vsqi4ths=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wD3_xxKNillelXIAQ--.30261S2;
 Fri, 13 Oct 2023 20:21:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH v2 4/4] drm/rockchip: rename windows format for vop2
Date: Fri, 13 Oct 2023 20:21:29 +0800
Message-Id: <20231013122129.1594307-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013122001.1594009-1-andyshrk@163.com>
References: <20231013122001.1594009-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_xxKNillelXIAQ--.30261S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1xKF43Kr1xGF15GryUKFg_yoWrCF1xpa
 9F9rnxuF45uF45Wr1UJayUZr4rC3ZIka1a9wn5G3Z7KF43KF9rXr1UKas8CryDKFy8Ar1U
 Ar4aqryUZr47tFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jk18PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEBAIXl8YLt0+AwAAsf
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
index 05aee588e8c9..574cb013639e 100644
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
@@ -51,7 +51,7 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
 	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
 };
 
-static const uint32_t formats_win_lite[] = {
+static const uint32_t formats_smart[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
@@ -150,8 +150,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
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
@@ -162,8 +162,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
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
@@ -175,8 +175,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
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
@@ -188,8 +188,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
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
@@ -202,8 +202,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
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
@@ -217,8 +217,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
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

