Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B418E539
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 23:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD506E22D;
	Sat, 21 Mar 2020 22:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.sdf.org (mx.sdf.org [205.166.94.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78986E21C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 22:30:00 +0000 (UTC)
Received: from sdf.org (IDENT:coypu@sdf.lonestar.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 02LMTxu5012511
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO)
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 22:30:00 GMT
Received: (from coypu@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 02LMTxuK024003
 for dri-devel@lists.freedesktop.org; Sat, 21 Mar 2020 22:29:59 GMT
Date: Sat, 21 Mar 2020 22:29:59 +0000
From: Maya Rashish <coypu@sdf.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: make build_clear_payload_id_table return void
Message-ID: <20200321222959.GA1053@SDF.ORG>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing uses the always-0 return value.

Signed-off-by: Maya Rashish <coypu@sdf.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 4b255e25e4a1..398da29ba1bd 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1060,13 +1060,12 @@ static void build_link_address(struct drm_dp_sideband_msg_tx *msg)
 	drm_dp_encode_sideband_req(&req, msg);
 }
 
-static int build_clear_payload_id_table(struct drm_dp_sideband_msg_tx *msg)
+static void build_clear_payload_id_table(struct drm_dp_sideband_msg_tx *msg)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
 	req.req_type = DP_CLEAR_PAYLOAD_ID_TABLE;
 	drm_dp_encode_sideband_req(&req, msg);
-	return 0;
 }
 
 static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
