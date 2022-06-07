Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91721540F9D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6996E10F105;
	Tue,  7 Jun 2022 19:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D676D10F152
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654629082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0L+WDYL2ErSdyIk/wXgdKER6Al4H5aQXP9OvHKSvcc=;
 b=b9iporWIpBSTk8rlrIUd2y+y9yVBwSNvSu23aIGF39NR8YbN3tU7HuR/g7QQjWr/9iLqYu
 n89axuo08hcjef2HBWSrRcjhuYLnHtvLcK3A2ArMUDmywTvIc1/7OkiGxWzEN210WtJZrC
 0mSLUxtJ+tGb6r49Btb34Waj3bE1+YU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-MIxpZrunMi6TN_cVveYaAQ-1; Tue, 07 Jun 2022 15:11:16 -0400
X-MC-Unique: MIxpZrunMi6TN_cVveYaAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE1183816860;
 Tue,  7 Jun 2022 19:08:34 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 870224126336;
 Tue,  7 Jun 2022 19:07:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RFC 01/18] drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
Date: Tue,  7 Jun 2022 15:06:58 -0400
Message-Id: <20220607190715.1331124-2-lyude@redhat.com>
In-Reply-To: <20220607190715.1331124-1-lyude@redhat.com>
References: <20220607190715.1331124-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 Wenjing Liu <wenjing.liu@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Hung <alex.hung@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 "Shen, George" <George.Shen@amd.com>, Leo Li <sunpeng.li@amd.com>,
 jinzh <jinzh@github.amd.com>, "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just to make this more clear to outside contributors that these are
DC-specific structs, as this also threw me into a loop a number of times
before I figured out the purpose of this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 ++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_link.c         | 10 +++++-----
 drivers/gpu/drm/amd/display/dc/dm_helpers.h           |  4 ++--
 .../gpu/drm/amd/display/include/link_service_types.h  | 11 ++++++++---
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 7c799ddc1d27..1bd70d306c22 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -153,9 +153,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	return result;
 }
 
-static void get_payload_table(
-		struct amdgpu_dm_connector *aconnector,
-		struct dp_mst_stream_allocation_table *proposed_table)
+static void get_payload_table(struct amdgpu_dm_connector *aconnector,
+			      struct dc_dp_mst_stream_allocation_table *proposed_table)
 {
 	int i;
 	struct drm_dp_mst_topology_mgr *mst_mgr =
@@ -177,7 +176,7 @@ static void get_payload_table(
 			mst_mgr->payloads[i].payload_state ==
 					DP_PAYLOAD_REMOTE) {
 
-			struct dp_mst_stream_allocation *sa =
+			struct dc_dp_mst_stream_allocation *sa =
 					&proposed_table->stream_allocations[
 						proposed_table->stream_count];
 
@@ -201,7 +200,7 @@ void dm_helpers_dp_update_branch_info(
 bool dm_helpers_dp_mst_write_payload_allocation_table(
 		struct dc_context *ctx,
 		const struct dc_stream_state *stream,
-		struct dp_mst_stream_allocation_table *proposed_table,
+		struct dc_dp_mst_stream_allocation_table *proposed_table,
 		bool enable)
 {
 	struct amdgpu_dm_connector *aconnector;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index a789ea8af27f..db0f5158a0c2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3424,7 +3424,7 @@ static void update_mst_stream_alloc_table(
 	struct dc_link *link,
 	struct stream_encoder *stream_enc,
 	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
-	const struct dp_mst_stream_allocation_table *proposed_table)
+	const struct dc_dp_mst_stream_allocation_table *proposed_table)
 {
 	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
 	struct link_mst_stream_allocation *dc_alloc;
@@ -3586,7 +3586,7 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
 	struct fixed31_32 pbn_per_slot;
@@ -3691,7 +3691,7 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
 	struct fixed31_32 pbn_per_slot;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
 	enum act_return_status ret;
 	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
@@ -3779,7 +3779,7 @@ enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t
 	struct fixed31_32 pbn;
 	struct fixed31_32 pbn_per_slot;
 	struct link_encoder *link_encoder = link->link_enc;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
 	enum act_return_status ret;
 	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
@@ -3855,7 +3855,7 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
 	int i;
 	bool mst_mode = (link->type == dc_connection_mst_branch);
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index fb6a2d7b6470..8173f4b80424 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -33,7 +33,7 @@
 #include "dc_types.h"
 #include "dc.h"
 
-struct dp_mst_stream_allocation_table;
+struct dc_dp_mst_stream_allocation_table;
 struct aux_payload;
 enum aux_return_code_type;
 
@@ -77,7 +77,7 @@ void dm_helpers_dp_update_branch_info(
 bool dm_helpers_dp_mst_write_payload_allocation_table(
 		struct dc_context *ctx,
 		const struct dc_stream_state *stream,
-		struct dp_mst_stream_allocation_table *proposed_table,
+		struct dc_dp_mst_stream_allocation_table *proposed_table,
 		bool enable);
 
 /*
diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
index 447a56286dd0..91bffc5bf52c 100644
--- a/drivers/gpu/drm/amd/display/include/link_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
@@ -245,8 +245,13 @@ union dpcd_training_lane_set {
 };
 
 
+/* AMD's copy of various payload data for MST. We have two copies of the payload table (one in DRM,
+ * one in DC) since DRM's MST helpers can't be accessed here. This stream allocation table should
+ * _ONLY_ be filled out from DM and then passed to DC, do NOT use these for _any_ kind of atomic
+ * state calculations in DM, or you will break something.
+ */
 /* DP MST stream allocation (payload bandwidth number) */
-struct dp_mst_stream_allocation {
+struct dc_dp_mst_stream_allocation {
 	uint8_t vcp_id;
 	/* number of slots required for the DP stream in
 	 * transport packet */
@@ -254,11 +259,11 @@ struct dp_mst_stream_allocation {
 };
 
 /* DP MST stream allocation table */
-struct dp_mst_stream_allocation_table {
+struct dc_dp_mst_stream_allocation_table {
 	/* number of DP video streams */
 	int stream_count;
 	/* array of stream allocations */
-	struct dp_mst_stream_allocation stream_allocations[MAX_CONTROLLER_NUM];
+	struct dc_dp_mst_stream_allocation stream_allocations[MAX_CONTROLLER_NUM];
 };
 
 #endif /*__DAL_LINK_SERVICE_TYPES_H__*/
-- 
2.35.3

