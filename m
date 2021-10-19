Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5B4340F2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8250589F43;
	Tue, 19 Oct 2021 21:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8757E89F01
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:58:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so5862462wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ws77StmGP8OqTFmlkQUufLolF3RfQn4nI0VMLqEcX8s=;
 b=dGZQ8Q3orJrTzIZ4Gs9rn9dr9PAu9PCjkmUK5Lr6UkhpNzYMcMd3020nPpiG6Sqqpy
 iLRrSxDSXQ7kSYllOPk2BtvQUGsDdBHD7NGzfb5c2CazkxrvtoLOMJXxZabDfp9dJ33y
 Nc6l+vslIYyFBqsf5MjBRyT1WWM8BbqdLViNK1jE0RWT9LaZ+QLmNI1goCpLxyjClx5q
 BHWHbXcWTtSRVC5h7zAbVkeTp5sxkU/JgDJP/NlgaeLhv5fT3vRPg7iwOgHc91kIXC5y
 UrXcfWoKPWR5+n9loBQ6PqrQbibvW07GBRJNMSRCw72SB0r9diQgYYeWronJNwIqWDmB
 vHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ws77StmGP8OqTFmlkQUufLolF3RfQn4nI0VMLqEcX8s=;
 b=Qzbj7+tyhVmMnuzAECtFeNj3tgRVWXu6b3JijI1/fBAOvwapz6sheBAwAMNrKgE2SJ
 UHoZk6q40lpkrPsHT7DFoNf19m/MMo0hauKUHpobz95qFkMueLyxzbgv/5P4KAKJSmSP
 mtCkkf1Xpelg30/k8tjSJmoOVdE29z3+tbOHV3jGGUiqehL5woQZFxeY72qU+xSq84sZ
 iRhWrUat4AZCp9uzeDoGCf00T8yYsQabMnhtpvCPYrEEd+oMtAB4MSH7MPYGuTfEwPAF
 8ITeKrmEQxlTl6lImejznr0eGAltFsd13Hf9EPoGq58lB+ua9BNqcZvlhyATp8CgUwwp
 G0kw==
X-Gm-Message-State: AOAM533aPphJ5V5bD5Z4I0L2xxiqikmGTgar0K7RLpH/307KsR/rFUob
 OEyW7gcb5ZzAYdldYVH0pYU=
X-Google-Smtp-Source: ABdhPJxlnImj2nZarYrS7pboEsot76oZv/a0I0DfIZ6Yn6Tqye98tM7z2na6Er6vRQMM1xsYYiNxOg==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr45716779wrb.124.1634680732995; 
 Tue, 19 Oct 2021 14:58:52 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id s3sm178540wrm.40.2021.10.19.14.58.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:58:52 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
 Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH v2 1/3] drm/rockchip: define gamma registers for RK3399
Date: Tue, 19 Oct 2021 22:58:41 +0100
Message-Id: <20211019215843.42718-2-sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211019215843.42718-1-sigmaris@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP on RK3399 has a different approach from previous versions for
setting a gamma lookup table, using an update_gamma_lut register. As
this differs from RK3288, give RK3399 its own set of "common" register
definitions.

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
---

Changes from v1: no changes in this patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  2 ++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 24 +++++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 857d97cdc67c..14179e89bd21 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -99,6 +99,8 @@ struct vop_common {
 	struct vop_reg dither_down_en;
 	struct vop_reg dither_up;
 	struct vop_reg dsp_lut_en;
+	struct vop_reg update_gamma_lut;
+	struct vop_reg lut_buffer_index;
 	struct vop_reg gate_en;
 	struct vop_reg mmu_en;
 	struct vop_reg out_mode;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index ca7cc82125cb..bfb7e130f09b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -865,6 +865,24 @@ static const struct vop_output rk3399_output = {
 	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
 };
 
+static const struct vop_common rk3399_common = {
+	.standby = VOP_REG_SYNC(RK3399_SYS_CTRL, 0x1, 22),
+	.gate_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 23),
+	.mmu_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 20),
+	.dither_down_sel = VOP_REG(RK3399_DSP_CTRL1, 0x1, 4),
+	.dither_down_mode = VOP_REG(RK3399_DSP_CTRL1, 0x1, 3),
+	.dither_down_en = VOP_REG(RK3399_DSP_CTRL1, 0x1, 2),
+	.pre_dither_down = VOP_REG(RK3399_DSP_CTRL1, 0x1, 1),
+	.dither_up = VOP_REG(RK3399_DSP_CTRL1, 0x1, 6),
+	.dsp_lut_en = VOP_REG(RK3399_DSP_CTRL1, 0x1, 0),
+	.update_gamma_lut = VOP_REG(RK3399_DSP_CTRL1, 0x1, 7),
+	.lut_buffer_index = VOP_REG(RK3399_DBG_POST_REG1, 0x1, 1),
+	.data_blank = VOP_REG(RK3399_DSP_CTRL0, 0x1, 19),
+	.dsp_blank = VOP_REG(RK3399_DSP_CTRL0, 0x3, 18),
+	.out_mode = VOP_REG(RK3399_DSP_CTRL0, 0xf, 0),
+	.cfg_done = VOP_REG_SYNC(RK3399_REG_CFG_DONE, 0x1, 0),
+};
+
 static const struct vop_yuv2yuv_phy rk3399_yuv2yuv_win01_data = {
 	.y2r_coefficients = {
 		VOP_REG(RK3399_WIN0_YUV2YUV_Y2R + 0, 0xffff, 0),
@@ -944,7 +962,7 @@ static const struct vop_data rk3399_vop_big = {
 	.version = VOP_VERSION(3, 5),
 	.feature = VOP_FEATURE_OUTPUT_RGB10,
 	.intr = &rk3366_vop_intr,
-	.common = &rk3288_common,
+	.common = &rk3399_common,
 	.modeset = &rk3288_modeset,
 	.output = &rk3399_output,
 	.afbc = &rk3399_vop_afbc,
@@ -952,6 +970,7 @@ static const struct vop_data rk3399_vop_big = {
 	.win = rk3399_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3399_vop_win_data),
 	.win_yuv2yuv = rk3399_vop_big_win_yuv2yuv_data,
+	.lut_size = 1024,
 };
 
 static const struct vop_win_data rk3399_vop_lit_win_data[] = {
@@ -970,13 +989,14 @@ static const struct vop_win_yuv2yuv_data rk3399_vop_lit_win_yuv2yuv_data[] = {
 static const struct vop_data rk3399_vop_lit = {
 	.version = VOP_VERSION(3, 6),
 	.intr = &rk3366_vop_intr,
-	.common = &rk3288_common,
+	.common = &rk3399_common,
 	.modeset = &rk3288_modeset,
 	.output = &rk3399_output,
 	.misc = &rk3368_misc,
 	.win = rk3399_vop_lit_win_data,
 	.win_size = ARRAY_SIZE(rk3399_vop_lit_win_data),
 	.win_yuv2yuv = rk3399_vop_lit_win_yuv2yuv_data,
+	.lut_size = 256,
 };
 
 static const struct vop_win_data rk3228_vop_win_data[] = {
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
index 0b3cd65ba5c1..406e981c75bd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
@@ -628,6 +628,7 @@
 #define RK3399_YUV2YUV_WIN			0x02c0
 #define RK3399_YUV2YUV_POST			0x02c4
 #define RK3399_AUTO_GATING_EN			0x02cc
+#define RK3399_DBG_POST_REG1			0x036c
 #define RK3399_WIN0_CSC_COE			0x03a0
 #define RK3399_WIN1_CSC_COE			0x03c0
 #define RK3399_WIN2_CSC_COE			0x03e0
-- 
2.24.3 (Apple Git-128)

