Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49734B4FD
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 08:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC596E0DE;
	Sat, 27 Mar 2021 07:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7486E32F;
 Sat, 27 Mar 2021 07:28:25 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 4E03A9800E6;
 Sat, 27 Mar 2021 15:28:20 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Aric Cyr <aric.cyr@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Jacky Liao <ziyu.liao@amd.com>,
 Wan Jiabing <wanjiabing@vivo.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amd: display: dc: struct dc_state is declared twice
Date: Sat, 27 Mar 2021 15:28:05 +0800
Message-Id: <20210327072807.1486517-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQxgaGUwZGR5PTxgZVkpNSk1DSEtKS0tMSUNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzY6Dgw4ND8NCjMLMgs6FA4U
 Ik5PFCJVSlVKTUpNQ0hLSktKSk9IVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFPTEhPNwY+
X-HM-Tid: 0a78729574b0d992kuws4e03a9800e6
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
Cc: kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct dc_state has been declared at 273rd line.
Remove the duplicate.
Delete duplicate blank lines.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 18ed0d3f247e..dc667298ab5b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -234,7 +234,6 @@ struct dc_static_screen_params {
 	unsigned int num_frames;
 };
 
-
 /* Surface update type is used by dc_update_surfaces_and_stream
  * The update type is determined at the very beginning of the function based
  * on parameters passed in and decides how much programming (or updating) is
@@ -272,7 +271,6 @@ struct dc;
 struct dc_plane_state;
 struct dc_state;
 
-
 struct dc_cap_funcs {
 	bool (*get_dcc_compression_cap)(const struct dc *dc,
 			const struct dc_dcc_surface_param *input,
@@ -281,7 +279,6 @@ struct dc_cap_funcs {
 
 struct link_training_settings;
 
-
 /* Structure to hold configuration flags set by dm at dc creation. */
 struct dc_config {
 	bool gpu_vm_support;
@@ -581,7 +578,6 @@ struct dc_bounding_box_overrides {
 	int min_dcfclk_mhz;
 };
 
-struct dc_state;
 struct resource_pool;
 struct dce_hwseq;
 struct gpu_info_soc_bounding_box_v1_0;
@@ -757,7 +753,6 @@ enum dc_transfer_func_predefined {
 	TRANSFER_FUNCTION_GAMMA26
 };
 
-
 struct dc_transfer_func {
 	struct kref refcount;
 	enum dc_transfer_func_type type;
@@ -770,7 +765,6 @@ struct dc_transfer_func {
 	};
 };
 
-
 union dc_3dlut_state {
 	struct {
 		uint32_t initialized:1;		/*if 3dlut is went through color module for initialization */
@@ -784,7 +778,6 @@ union dc_3dlut_state {
 	uint32_t raw;
 };
 
-
 struct dc_3dlut {
 	struct kref refcount;
 	struct tetrahedral_params lut_3d;
@@ -1014,7 +1007,6 @@ enum dc_status dc_validate_global_state(
 		struct dc_state *new_ctx,
 		bool fast_validate);
 
-
 void dc_resource_state_construct(
 		const struct dc *dc,
 		struct dc_state *dst_ctx);
@@ -1167,7 +1159,6 @@ struct dc_container_id {
 	unsigned short productCode;
 };
 
-
 struct dc_sink_dsc_caps {
 	// 'true' if these are virtual DPCD's DSC caps (immediately upstream of sink in MST topology),
 	// 'false' if they are sink's DSC caps
@@ -1229,7 +1220,6 @@ struct dc_cursor {
 	struct dc_cursor_attributes attributes;
 };
 
-
 /*******************************************************************************
  * Interrupt interfaces
  ******************************************************************************/
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
