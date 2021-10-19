Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5E433E33
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A616E1C0;
	Tue, 19 Oct 2021 18:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECF46E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnaUbSMO+LYIg5Y2X9e9yQqffg8wNmT7x8wTZvq/XI5hk7Owq1MWc6gten8FoI627cjcMeRhWcXyc67q8nKPxO8SSgWME7uFXF0+qYuPDZICRbgfeV0FFuMJutExCQL/HoyqJFZHI5g1zfp+JMJVDkjoKxKdIfYZhph8qbcvAmj/akhG3cyObLs0BxdxhZTugPeyp4l3gMEBG6Wn75pbZ//9eyJZtEJSI8B6DXmHGUWqn/ljYZu1Cx2NSlUQCmrjqbufbRg1j65bMUB2fis3UxStGwzYbm453JWOD2xwoqjV5pODFuIM5Jnd3ORiZKqD/q2t5oKRn4XKyRCzr+/KKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVgJ8C258PC7rD+BIdhsr47aKUxzh7n4WfYvv8r1j+Q=;
 b=kHMQJMxitwirzpli9PjwCe6vSOXVHykUcgrAm/7Sw7Yd/LrKMphUsdxHXC5B5Fu9nSAsr0DdjM7L3jYNNG0W7N08Sr5zdi04RVArUiZnLqINbsg9HAl/l7Ey4yiXR7laReam+YLxiVcHuI3o/lyaSA+7QjkwRLmc+nLWi0AjZXlQCE+7y3jA40GhO7ZT9+ssqK3SyvfPeTkozaCoykidA3pJGmZBoRvJ4eJFPHVPKhFcpH/ThuAv5JnVA5b07NXLg9EPCf/nOat7VvAveJ/tFJVc37JnHo8o3wp8En1k4ORgELzveitGlLK2+oO/P6zL5EZm4S2HA3pin/P6WMxpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVgJ8C258PC7rD+BIdhsr47aKUxzh7n4WfYvv8r1j+Q=;
 b=xkGlA2JF3jacuEwIs3jlwVxF5ApxtrYGUzk76oMeAzqtt2V/oO12Be20YRM3dhLWDV9qmqUh3YLz0T46o3m71hBOZKUp7UPTFvZdGY3aEao/edJSpgv+sxZLlZk7qR6ay0di+yh6SNBpXrwPr6kMiLsLCmvrE6ckZzyozpYA9P8=
Received: from MWHPR18CA0027.namprd18.prod.outlook.com (2603:10b6:320:31::13)
 by BN8PR12MB3380.namprd12.prod.outlook.com (2603:10b6:408:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 18:12:32 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::c1) by MWHPR18CA0027.outlook.office365.com
 (2603:10b6:320:31::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 18:12:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 18:12:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 13:12:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 11:12:30 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 13:12:29 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>
Subject: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
Date: Tue, 19 Oct 2021 14:12:22 -0400
Message-ID: <20211019181223.263270-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14cf626a-0c3c-4e60-0290-08d9932c04ab
X-MS-TrafficTypeDiagnostic: BN8PR12MB3380:
X-Microsoft-Antispam-PRVS: <BN8PR12MB338031C12DF74FB29ABCD31CF9BD9@BN8PR12MB3380.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:13;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +l+TNky/hfcmPIfQPAqDdoCwT1fmXtJ5XQfBLm1ZiBlOwkv0GG2duVchdWTdA5BUU39Q4TNZ/PLx28h5DuNsRe+1JoU+Zahy08qcUy4pjJwZs/V4V6iZ5YEPWbag12D+HOai6/q/SZMdGLn4+jZks85vkZy9rDHGDMxrUIgkU5fCByrU/cKYtPURjN2mLtb0YhE/jB6oVGwk8htASYCFdYkEIFrJV0nNPA84fjQqZUv6wJjv160g1hUoejmL8IWSTuJ8KYVrAhfJnl3rGK3cYZUyoDWBlILgSQjkC6xIX6FpSCGP+RaLPUzrmVDIv2g6sNb+5q6pr4pvheso+p64YLGym1kvuWRC0en2gy+S4v59Le8uqWMzdrDdm3FMWSBA1RZTTtEwqOkLWyzrie1Wdq95+dNOGFCa932LMrzMxF9io1o8Z90B2V/TdfgCspdiE9Ff7vmeHURlpNFKoh7yLzDvVbmqjIkNEj8e5LVrzGFpQDMNNqGlF+xphLivdzAx3ieRmCCs6Aaf65oZ93lxbwwZK8pgVxe69hsa336QdT0q7QIudEpfgr+wCn3S6kvqIiMyDq0LOacZgtnPKU9ldEsKF9XGzx5EYPiYFXNgocnz9UtpKke4ub0ljPGicTewzToZruH8NAHtNr0NlQFscswqU0jQ7QJa//XOrCcQ9Q5w5ZDf482EjEm7ZxfSRJZnDOHze+lU2ZNRl9MqlO/GcNZmgIWfdGBMPMCiLjk/0XI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(6666004)(2906002)(426003)(316002)(8936002)(26005)(508600001)(1076003)(336012)(110136005)(2616005)(70206006)(36860700001)(70586007)(47076005)(54906003)(83380400001)(81166007)(186003)(356005)(5660300002)(4326008)(36756003)(82310400003)(30864003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:12:31.4087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cf626a-0c3c-4e60-0290-08d9932c04ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3380
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 280 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  19 ++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   7 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  13 +
 5 files changed, 333 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8be04be19124..935a50d6e933 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2354,6 +2354,11 @@ static enum surface_update_type check_update_surfaces_for_stream(
 		if (stream_update->dsc_config)
 			su_flags->bits.dsc_changed = 1;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		if (stream_update->mst_bw_update)
+			su_flags->bits.mst_bw = 1;
+#endif
+
 		if (su_flags->raw != 0)
 			overall_type = UPDATE_TYPE_FULL;
 
@@ -2731,6 +2736,15 @@ static void commit_planes_do_stream_update(struct dc *dc,
 			if (stream_update->dsc_config)
 				dp_update_dsc_config(pipe_ctx);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+			if (stream_update->mst_bw_update) {
+				if (stream_update->mst_bw_update->is_increase)
+					dc_link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+				else
+					dc_link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+			}
+#endif
+
 			if (stream_update->pending_test_pattern) {
 				dc_link_dp_set_test_pattern(stream->link,
 					stream->test_pattern.type,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index e5d6cbd7ea78..b23972b6a27c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3232,6 +3232,9 @@ static struct fixed31_32 get_pbn_from_timing(struct pipe_ctx *pipe_ctx)
 static void update_mst_stream_alloc_table(
 	struct dc_link *link,
 	struct stream_encoder *stream_enc,
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
+#endif
 	const struct dp_mst_stream_allocation_table *proposed_table)
 {
 	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
@@ -3267,6 +3270,9 @@ static void update_mst_stream_alloc_table(
 			work_table[i].slot_count =
 				proposed_table->stream_allocations[i].slot_count;
 			work_table[i].stream_enc = stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+			work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
+#endif
 		}
 	}
 
@@ -3389,6 +3395,10 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->link;
 	struct link_encoder *link_encoder = NULL;
 	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
+	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
+#endif
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
@@ -3416,7 +3426,14 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		&proposed_table,
 		true)) {
 		update_mst_stream_alloc_table(
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+					link,
+					pipe_ctx->stream_res.stream_enc,
+					pipe_ctx->stream_res.hpo_dp_stream_enc,
+					&proposed_table);
+#else
 					link, pipe_ctx->stream_res.stream_enc, &proposed_table);
+#endif
 	}
 	else
 		DC_LOG_WARNING("Failed to update"
@@ -3430,6 +3447,20 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 			link->mst_stream_alloc_table.stream_count);
 
 	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#else
 		DC_LOG_MST("stream_enc[%d]: %p      "
 		"stream[%d].vcp_id: %d      "
 		"stream[%d].slot_count: %d\n",
@@ -3439,14 +3470,30 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
 		i,
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#endif
 	}
 
 	ASSERT(proposed_table.stream_count > 0);
 
 	/* program DP source TX for payload */
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->update_stream_allocation_table(
+				hpo_dp_link_encoder,
+				&link->mst_stream_alloc_table);
+		break;
+	}
+#else
 	link_encoder->funcs->update_mst_stream_allocation_table(
 		link_encoder,
 		&link->mst_stream_alloc_table);
+#endif
 
 	/* send down message */
 	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
@@ -3469,13 +3516,188 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	pbn = get_pbn_from_timing(pipe_ctx);
 	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		stream_encoder->funcs->set_throttled_vcp_size(
+			stream_encoder,
+			avg_time_slots_per_mtp);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
+				hpo_dp_link_encoder,
+				hpo_dp_stream_encoder->inst,
+				avg_time_slots_per_mtp);
+		break;
+	}
+#else
 	stream_encoder->funcs->set_throttled_vcp_size(
 		stream_encoder,
 		avg_time_slots_per_mtp);
+#endif
+
+	return DC_OK;
+
+}
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	struct link_encoder *link_encoder = link->link_enc;
+	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+	struct dp_mst_stream_allocation_table proposed_table = {0};
+	uint8_t i;
+	enum act_return_status ret;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* decrease throttled vcp size */
+	pbn_per_slot = get_pbn_per_slot(stream);
+	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	stream_encoder->funcs->set_throttled_vcp_size(
+				stream_encoder,
+				avg_time_slots_per_mtp);
+
+	/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
+	dm_helpers_dp_mst_send_payload_allocation(
+			stream->ctx,
+			stream,
+			true);
+
+	/* notify immediate branch device table update */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+			stream->ctx,
+			stream,
+			&proposed_table,
+			true)) {
+		/* update mst stream allocation table software state */
+		update_mst_stream_alloc_table(
+				link,
+				pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&proposed_table);
+	} else {
+		DC_LOG_WARNING("Failed to update"
+				"MST allocation table for"
+				"pipe idx:%d\n",
+				pipe_ctx->pipe_idx);
+	}
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+				"stream[%d].vcp_id: %d      "
+				"stream[%d].slot_count: %d\n",
+				i,
+				(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* update mst stream allocation table hardware state */
+	link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+
+	/* poll for immediate branch device ACT handled */
+	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
 
 	return DC_OK;
+}
+
+enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	struct link_encoder *link_encoder = link->link_enc;
+	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+	struct dp_mst_stream_allocation_table proposed_table = {0};
+	uint8_t i;
+	enum act_return_status ret;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* notify immediate branch device table update */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+				stream->ctx,
+				stream,
+				&proposed_table,
+				true)) {
+		/* update mst stream allocation table software state */
+		update_mst_stream_alloc_table(
+				link,
+				pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&proposed_table);
+	}
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+				"stream[%d].vcp_id: %d      "
+				"stream[%d].slot_count: %d\n",
+				i,
+				(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* update mst stream allocation table hardware state */
+	link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+
+	/* poll for immediate branch device ACT handled */
+	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
+
+	if (ret != ACT_LINK_LOST) {
+		/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
+		dm_helpers_dp_mst_send_payload_allocation(
+				stream->ctx,
+				stream,
+				true);
+	}
+
+	/* increase throttled vcp size */
+	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
+	pbn_per_slot = get_pbn_per_slot(stream);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	stream_encoder->funcs->set_throttled_vcp_size(
+				stream_encoder,
+				avg_time_slots_per_mtp);
 
+	return DC_OK;
 }
+#endif
 
 static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
@@ -3483,6 +3705,10 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->link;
 	struct link_encoder *link_encoder = NULL;
 	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
+	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
+#endif
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
 	int i;
@@ -3504,9 +3730,25 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	 */
 
 	/* slot X.Y */
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		stream_encoder->funcs->set_throttled_vcp_size(
+			stream_encoder,
+			avg_time_slots_per_mtp);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
+				hpo_dp_link_encoder,
+				hpo_dp_stream_encoder->inst,
+				avg_time_slots_per_mtp);
+		break;
+	}
+#else
 	stream_encoder->funcs->set_throttled_vcp_size(
 		stream_encoder,
 		avg_time_slots_per_mtp);
+#endif
 
 	/* TODO: which component is responsible for remove payload table? */
 	if (mst_mode) {
@@ -3516,8 +3758,16 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 				&proposed_table,
 				false)) {
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+			update_mst_stream_alloc_table(
+						link,
+						pipe_ctx->stream_res.stream_enc,
+						pipe_ctx->stream_res.hpo_dp_stream_enc,
+						&proposed_table);
+#else
 			update_mst_stream_alloc_table(
 				link, pipe_ctx->stream_res.stream_enc, &proposed_table);
+#endif
 		}
 		else {
 				DC_LOG_WARNING("Failed to update"
@@ -3533,6 +3783,20 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 			link->mst_stream_alloc_table.stream_count);
 
 	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#else
 		DC_LOG_MST("stream_enc[%d]: %p      "
 		"stream[%d].vcp_id: %d      "
 		"stream[%d].slot_count: %d\n",
@@ -3542,11 +3806,27 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
 		i,
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#endif
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->update_stream_allocation_table(
+				hpo_dp_link_encoder,
+				&link->mst_stream_alloc_table);
+		break;
+	}
+#else
 	link_encoder->funcs->update_mst_stream_allocation_table(
 		link_encoder,
 		&link->mst_stream_alloc_table);
+#endif
 
 	if (mst_mode) {
 		dm_helpers_dp_mst_poll_for_allocation_change_trigger(
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 296b0defcd1c..bb96e4e9ccfc 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -5993,6 +5993,25 @@ enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings
 }
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link)
+{
+	struct dc_link_settings link_settings = {0};
+
+	if (!dc_is_dp_signal(link->connector_signal))
+		return DP_UNKNOWN_ENCODING;
+
+	if (link->preferred_link_setting.lane_count !=
+			LANE_COUNT_UNKNOWN &&
+			link->preferred_link_setting.link_rate !=
+					LINK_RATE_UNKNOWN) {
+		link_settings = link->preferred_link_setting;
+	} else {
+		decide_mst_link_settings(link, &link_settings);
+	}
+
+	return dp_get_link_encoding_format(&link_settings);
+}
+
 // TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
 static void get_lane_status(
 	struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index a73d64b1fd33..08815310d85b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -295,6 +295,10 @@ enum dc_detect_reason {
 bool dc_link_detect(struct dc_link *dc_link, enum dc_detect_reason reason);
 bool dc_link_get_hpd_state(struct dc_link *dc_link);
 enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx);
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+#endif
 
 /* Notify DC about DP RX Interrupt (aka Short Pulse Interrupt).
  * Return:
@@ -424,4 +428,7 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
 bool dc_link_is_fec_supported(const struct dc_link *link);
 bool dc_link_should_enable_fec(const struct dc_link *link);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link);
+#endif
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index b8ebc1f09538..e37c4a10bfd5 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -115,6 +115,13 @@ struct periodic_interrupt_config {
 	int lines_offset;
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+struct dc_mst_stream_bw_update {
+	bool is_increase; // is bandwidth reduced or increased
+	uint32_t mst_stream_bw; // new mst bandwidth in kbps
+};
+#endif
+
 union stream_update_flags {
 	struct {
 		uint32_t scaling:1;
@@ -125,6 +132,9 @@ union stream_update_flags {
 		uint32_t gamut_remap:1;
 		uint32_t wb_update:1;
 		uint32_t dsc_changed : 1;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		uint32_t mst_bw : 1;
+#endif
 	} bits;
 
 	uint32_t raw;
@@ -278,6 +288,9 @@ struct dc_stream_update {
 
 	struct dc_writeback_update *wb_update;
 	struct dc_dsc_config *dsc_config;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct dc_mst_stream_bw_update *mst_bw_update;
+#endif
 	struct dc_transfer_func *func_shaper;
 	struct dc_3dlut *lut3d_func;
 
-- 
2.25.1

