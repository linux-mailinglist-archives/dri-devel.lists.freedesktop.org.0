Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D080C8C3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A07010E3CE;
	Mon, 11 Dec 2023 11:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39AF310E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jaCFF
 RYW1gcoVC7lj3FNE34bxdlQ4CgwuijOqt2bS5E=; b=JXaYKzrzUTfJna4l5VyGL
 PMT2Etkp0xt+K1o7Wo0pjce0naQaXkAQ2qfsM58g1Q81vqD6vypcDXZW06SLKNHa
 Fe1kZTo6gGeuDGTyc3K2ngrzSMeAprELK2i3VAIjIoc/3L/HY+yO6nt9stDfHrIv
 mLGc/UVrtpkDBCHRxSdeac=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3v2qk+XZlaEolAA--.4231S2; 
 Mon, 11 Dec 2023 19:59:35 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v5 13/16] drm/rockchip: vop2: rename VOP_FEATURE_OUTPUT_10BIT
 to VOP2_VP_FEATURE_OUTPUT_10BIT
Date: Mon, 11 Dec 2023 19:59:31 +0800
Message-Id: <20231211115931.1785495-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211115547.1784587-1-andyshrk@163.com>
References: <20231211115547.1784587-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v2qk+XZlaEolAA--.4231S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF48CF4UCw4DAry7WFy3Jwb_yoW5uFW8pa
 9xAryjvrW8Cr4aqw4DXFZxZFs0y3ZrCayIka17K3W7JFy3Kr1DWFsF9a48Ar9xJry7uFWa
 krsrX34UJF42qr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jw4SOUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAhDXmVOA44qLgAAsf
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

VOP2 has multiple independent video ports with different
feature, so rename VOP_FEATURE_OUTPUT_10BIT to
VOP2_VP_FEATURE_OUTPUT_10BIT for more clearly meaning.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index edca7723335f..2b996f1a25ad 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1995,7 +1995,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 
 	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
-	    !(vp_data->feature & VOP_FEATURE_OUTPUT_10BIT))
+	    !(vp_data->feature & VOP2_VP_FEATURE_OUTPUT_10BIT))
 		out_mode = ROCKCHIP_OUT_MODE_P888;
 	else
 		out_mode = vcstate->output_mode;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 2763e54350a9..615a16196aff 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -11,7 +11,7 @@
 #include <drm/drm_modes.h>
 #include "rockchip_drm_vop.h"
 
-#define VOP_FEATURE_OUTPUT_10BIT        BIT(0)
+#define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)
 
 #define VOP2_FEATURE_HAS_SYS_GRF	BIT(0)
 #define VOP2_FEATURE_HAS_VO0_GRF	BIT(1)
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 275d265891db..48170694ac6b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -136,7 +136,7 @@ static const uint64_t format_modifiers_afbc[] = {
 static const struct vop2_video_port_data rk3568_vop_video_ports[] = {
 	{
 		.id = 0,
-		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 9 * 9 * 9,
 		.max_output = { 4096, 2304 },
@@ -263,7 +263,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
 	{
 		.id = 0,
-		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 9 * 9 * 9, /* 9x9x9 */
 		.max_output = { 4096, 2304 },
@@ -272,7 +272,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
 		.offset = 0xc00,
 	}, {
 		.id = 1,
-		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 729, /* 9x9x9 */
 		.max_output = { 4096, 2304 },
@@ -280,7 +280,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
 		.offset = 0xd00,
 	}, {
 		.id = 2,
-		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 17 * 17 * 17, /* 17x17x17 */
 		.max_output = { 4096, 2304 },
-- 
2.34.1

