Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B272580D9F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87EA11BFAD;
	Tue, 26 Jul 2022 07:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB1C11B60F;
 Tue, 26 Jul 2022 07:27:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUIMKR_1658820445; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUIMKR_1658820445) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:27:28 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 16/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:51 +0800
Message-Id: <20220726072555.91323-16-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
References: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

smatch warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:51 dml32_rq_dlg_get_rq_reg() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:68 dml32_rq_dlg_get_rq_reg() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:220 dml32_rq_dlg_get_dlg_reg() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:224 dml32_rq_dlg_get_dlg_reg() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:235 dml32_rq_dlg_get_dlg_reg() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:240 dml32_rq_dlg_get_dlg_reg() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../dc/dml/dcn32/display_rq_dlg_calc_32.c     | 81 +++++++++----------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
index 269bdfc4bc40..a1276f6b9581 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
@@ -48,9 +48,9 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
 {
 	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
 	bool dual_plane = is_dual_plane((enum source_format_class) (src->source_format));
-    double stored_swath_l_bytes;
-    double stored_swath_c_bytes;
-    bool is_phantom_pipe;
+	double stored_swath_l_bytes;
+	double stored_swath_c_bytes;
+	bool is_phantom_pipe;
 	uint32_t pixel_chunk_bytes = 0;
 	uint32_t min_pixel_chunk_bytes = 0;
 	uint32_t meta_chunk_bytes = 0;
@@ -65,9 +65,9 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
 	uint32_t p1_dpte_group_bytes = 0;
 	uint32_t p1_mpte_group_bytes = 0;
 
-    unsigned int detile_buf_size_in_bytes;
-    unsigned int detile_buf_plane1_addr;
-    unsigned int pte_row_height_linear;
+	unsigned int detile_buf_size_in_bytes;
+	unsigned int detile_buf_plane1_addr;
+	unsigned int pte_row_height_linear;
 
 	memset(rq_regs, 0, sizeof(*rq_regs));
 
@@ -217,52 +217,51 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	double refcyc_per_req_delivery_cur0 = 0.;
 	double refcyc_per_req_delivery_pre_c = 0.;
 	double refcyc_per_req_delivery_c = 0.;
-    double refcyc_per_req_delivery_pre_l;
-    double refcyc_per_req_delivery_l;
+	double refcyc_per_req_delivery_pre_l;
+	double refcyc_per_req_delivery_l;
 	double refcyc_per_line_delivery_pre_c = 0.;
 	double refcyc_per_line_delivery_c = 0.;
-    double refcyc_per_line_delivery_pre_l;
-    double refcyc_per_line_delivery_l;
-    double min_ttu_vblank;
-    double vratio_pre_l;
-    double vratio_pre_c;
-    unsigned int min_dst_y_next_start;
+	double refcyc_per_line_delivery_pre_l;
+	double refcyc_per_line_delivery_l;
+	double min_ttu_vblank;
+	double vratio_pre_l;
+	double vratio_pre_c;
+	unsigned int min_dst_y_next_start;
 	unsigned int htotal = dst->htotal;
 	unsigned int hblank_end = dst->hblank_end;
 	unsigned int vblank_end = dst->vblank_end;
 	bool interlaced = dst->interlaced;
 	double pclk_freq_in_mhz = dst->pixel_rate_mhz;
-    unsigned int vready_after_vcount0;
+	unsigned int vready_after_vcount0;
 	double refclk_freq_in_mhz = clks->refclk_mhz;
 	double ref_freq_to_pix_freq = refclk_freq_in_mhz / pclk_freq_in_mhz;
 	bool dual_plane = 0;
 	unsigned int pipe_index_in_combine[DC__NUM_PIPES__MAX];
-    int unsigned dst_x_after_scaler;
-    int unsigned dst_y_after_scaler;
-    double dst_y_prefetch;
-    double dst_y_per_vm_vblank;
-    double dst_y_per_row_vblank;
-    double dst_y_per_vm_flip;
-    double dst_y_per_row_flip;
-    double max_dst_y_per_vm_vblank = 32.0;
-    double max_dst_y_per_row_vblank = 16.0;
-
-    double dst_y_per_pte_row_nom_l;
-    double dst_y_per_pte_row_nom_c;
-    double dst_y_per_meta_row_nom_l;
-    double dst_y_per_meta_row_nom_c;
-    double refcyc_per_pte_group_nom_l;
-    double refcyc_per_pte_group_nom_c;
-    double refcyc_per_pte_group_vblank_l;
-    double refcyc_per_pte_group_vblank_c;
-    double refcyc_per_pte_group_flip_l; 
-    double refcyc_per_pte_group_flip_c; 
-    double refcyc_per_meta_chunk_nom_l;
-    double refcyc_per_meta_chunk_nom_c;
-    double refcyc_per_meta_chunk_vblank_l;
-    double refcyc_per_meta_chunk_vblank_c;
-    double refcyc_per_meta_chunk_flip_l;
-    double refcyc_per_meta_chunk_flip_c;
+	unsigned int dst_x_after_scaler;
+	unsigned int dst_y_after_scaler;
+	double dst_y_prefetch;
+	double dst_y_per_vm_vblank;
+	double dst_y_per_row_vblank;
+	double dst_y_per_vm_flip;
+	double dst_y_per_row_flip;
+	double max_dst_y_per_vm_vblank = 32.0;
+	double max_dst_y_per_row_vblank = 16.0;
+	double dst_y_per_pte_row_nom_l;
+	double dst_y_per_pte_row_nom_c;
+	double dst_y_per_meta_row_nom_l;
+	double dst_y_per_meta_row_nom_c;
+	double refcyc_per_pte_group_nom_l;
+	double refcyc_per_pte_group_nom_c;
+	double refcyc_per_pte_group_vblank_l;
+	double refcyc_per_pte_group_vblank_c;
+	double refcyc_per_pte_group_flip_l;
+	double refcyc_per_pte_group_flip_c;
+	double refcyc_per_meta_chunk_nom_l;
+	double refcyc_per_meta_chunk_nom_c;
+	double refcyc_per_meta_chunk_vblank_l;
+	double refcyc_per_meta_chunk_vblank_c;
+	double refcyc_per_meta_chunk_flip_l;
+	double refcyc_per_meta_chunk_flip_c;
 
 	memset(dlg_regs, 0, sizeof(*dlg_regs));
 	memset(ttu_regs, 0, sizeof(*ttu_regs));
-- 
2.20.1.7.g153144c

