Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E722A79C44
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB94310E913;
	Thu,  3 Apr 2025 06:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=etehtsea.me header.i=@etehtsea.me header.b="Uo3OR+Nq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Wed, 02 Apr 2025 12:26:05 UTC
Received: from qs51p00im-qukt01072501.me.com (qs51p00im-qukt01072501.me.com
 [17.57.155.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B967510E76B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
 bh=UDIrHcYIoyN93xyBUHPd0mE9UKaxEII7s+AYKJoKWvI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=Uo3OR+NqbiCLIuBVuyl/RwKrQeSMuLhm3kKsPg/42yAfzWvgyJ/laNHPNY7y0la6r
 Dkk0O/obsMldX5RjmCiEY1IZUFjJgylTNOmbJjVkgVScBrgZOBraLelo2z9My/Oi4T
 dFikx2ZviaB4h+30YxM98EEa/+VRi6jzaP15gjLlhPp5XqxChZ3ZKiaGXT+2rjlovz
 TEAcArME+9U/bfXx5INNtAMOjmmipn3KX4W1k116I6IL1AXO6S7eImXOuGGlIEIcCO
 G0PeGAt0jua8VofKw0jGOBT2h4wjuW6ygoj2DgvTwcBC3Y/EeqTT5GMMV47idaScHf
 H4WJ4AGyTiGVg==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01072501.me.com (Postfix) with ESMTPSA id
 B7CE844022A; Wed,  2 Apr 2025 12:20:32 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: dri-devel@lists.freedesktop.org
Cc: Konstantin Shabanov <mail@etehtsea.me>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] (drm/rockchip): Consistently use rk3399 registers consts
Date: Wed,  2 Apr 2025 12:20:13 +0000
Message-ID: <20250402122013.19778-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mw285uzx6vnbb6nXuD4uJUBI_cXrn2MK
X-Proofpoint-ORIG-GUID: Mw285uzx6vnbb6nXuD4uJUBI_cXrn2MK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=8 malwarescore=0
 phishscore=0
 suspectscore=0 spamscore=8 bulkscore=0 mlxlogscore=105 mlxscore=8
 clxscore=1030 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504020078
X-Mailman-Approved-At: Thu, 03 Apr 2025 06:45:44 +0000
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

As rk3399 has its own registers definitions, update related structs to
use them.
There are no changes in behaviour as updated constants values are the
same for rk3288/rk3368/rk3399 chips.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 94 ++++++++++-----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 4e2099d86517..d1f788763318 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -906,21 +906,21 @@ static const struct vop_data rk3366_vop = {
 
 static const struct vop_output rk3399_output = {
 	.dp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
-	.rgb_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 19),
-	.hdmi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 23),
-	.edp_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 27),
-	.mipi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 31),
+	.rgb_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
+	.hdmi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 23),
+	.edp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 27),
+	.mipi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 31),
 	.dp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
-	.rgb_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 16),
-	.hdmi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 20),
-	.edp_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 24),
-	.mipi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 28),
+	.rgb_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
+	.hdmi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 20),
+	.edp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 24),
+	.mipi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 28),
 	.dp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 11),
-	.rgb_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 12),
-	.hdmi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 13),
-	.edp_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 14),
-	.mipi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 15),
-	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
+	.rgb_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 12),
+	.hdmi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 13),
+	.edp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 14),
+	.mipi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 15),
+	.mipi_dual_channel_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 3),
 };
 
 static const struct vop_common rk3399_common = {
@@ -975,23 +975,23 @@ static const struct vop_win_phy rk3399_win0_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full_afbc,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };
 
 static const struct vop_win_phy rk3399_win1_data = {
@@ -999,23 +999,23 @@ static const struct vop_win_phy rk3399_win1_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };
 
 /*

base-commit: 6b60c282330c46954be9ae1d33cd5c7e5acb315c
-- 
2.48.1

