Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D51D6438
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 23:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39CB6E27A;
	Sat, 16 May 2020 21:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A5B6E26F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:23:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21215645-1500050 
 for multiple; Sat, 16 May 2020 22:23:34 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm: Match drm_dp_send_clear_payload_id_table definition
 to declaration
Date: Sat, 16 May 2020 22:23:30 +0100
Message-Id: <20200516212330.13633-4-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200516212330.13633-1-chris@chris-wilson.co.uk>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/drm_dp_mst_topology.c:2898:6: warning: symbol 'drm_dp_send_clear_payload_id_table' was not declared. Should it be static?
drivers/gpu/drm/drm_dp_mst_topology.c:5451:37: warning: missing braces around initializer
drivers/gpu/drm/drm_dp_mst_topology.c:5451:37: warning: missing braces around initializer

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 70455e304a26..1bdf3cfeeebb 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2895,8 +2895,9 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	return ret < 0 ? ret : changed;
 }
 
-void drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
-					struct drm_dp_mst_branch *mstb)
+static void
+drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
+				   struct drm_dp_mst_branch *mstb)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
 	int ret;
@@ -5448,7 +5449,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
 	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = { 0 };
+	struct drm_dp_desc desc = {};
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
