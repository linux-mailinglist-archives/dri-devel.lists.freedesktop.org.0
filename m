Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BACDE751B7C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C985B10E630;
	Thu, 13 Jul 2023 08:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7128510E632
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-0005rA-Tn; Thu, 13 Jul 2023 10:24:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-00E4jX-8M; Thu, 13 Jul 2023 10:24:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-004Vh8-Jf; Thu, 13 Jul 2023 10:24:22 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 07/17] drm/dp_mst_topology_mgr: Rename struct
 drm_dp_mst_topology_mgr::dev to drm
Date: Thu, 13 Jul 2023 10:23:58 +0200
Message-Id: <20230713082408.2266984-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=37061;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=zk8aZ4k7F8T548oEdS8x2h0Y5gQZOKVhx7iOUuO7q4s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SPEk5jtgSsycKWeB80OYqhLSLTkR89CRGhO
 Ya7amkyyhOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0jwAKCRCPgPtYfRL+
 TiHzB/wLD4u2IPcZmrcftxvTsYYWX1GJHa2LvSsszeEocXUXcI8S3aC+Wx7EMoFiMs6fLjCbkmI
 K0g9cODRETqSB8DRJnoi+DqNVmOkFMGByCTvSAIG52VeAlK2x+wvQmRJfdaI+g7hiRfteFHQolE
 kzdeFbyKFH7qVgb+63RaJQ/j/xcIVFCdIRpiLNvcwk6nDiOJV+UyoTGwRxSKqappCy2qXeFPcnI
 YVVowo/zJvpvRENu8zCQnAIPEApP8/5BLWdLva1zfTwTZEEpz4FH2OCCpIr+kaNVr5S0ygwq/VJ
 gPkgIdw1DRm5II/EzhvWdo6VWWZmJ/bqWvoNy6yfQg5xXwBO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 249 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 include/drm/display/drm_dp_mst_helper.h       |   4 +-
 5 files changed, 163 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 485a3991820f..ce694e9ed5a3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6261,7 +6261,7 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 	 * Call only if mst_mgr was initialized before since it's not done
 	 * for all connector types.
 	 */
-	if (aconnector->mst_mgr.dev)
+	if (aconnector->mst_mgr.drm)
 		drm_dp_mst_topology_mgr_destroy(&aconnector->mst_mgr);
 
 	if (aconnector->bl_idx != -1) {
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 5070670b29b5..d4e6a01bb281 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -307,7 +307,8 @@ static bool drm_dp_decode_sideband_msg_hdr(const struct drm_dp_mst_topology_mgr
 	crc4 = drm_dp_msg_header_crc4(buf, (len * 2) - 1);
 
 	if ((crc4 & 0xf) != (buf[len - 1] & 0xf)) {
-		drm_dbg_kms(mgr->dev, "crc4 mismatch 0x%x 0x%x\n", crc4, buf[len - 1]);
+		drm_dbg_kms(mgr->drm, "crc4 mismatch 0x%x 0x%x\n", crc4,
+			    buf[len - 1]);
 		return false;
 	}
 
@@ -1059,7 +1060,7 @@ static bool drm_dp_sideband_parse_reply(const struct drm_dp_mst_topology_mgr *mg
 	case DP_QUERY_STREAM_ENC_STATUS:
 		return drm_dp_sideband_parse_query_stream_enc_status(raw, msg);
 	default:
-		drm_err(mgr->dev, "Got unknown reply 0x%02x (%s)\n",
+		drm_err(mgr->drm, "Got unknown reply 0x%02x (%s)\n",
 			msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
 		return false;
 	}
@@ -1090,7 +1091,8 @@ drm_dp_sideband_parse_connection_status_notify(const struct drm_dp_mst_topology_
 	idx++;
 	return true;
 fail_len:
-	drm_dbg_kms(mgr->dev, "connection status reply parse length fail %d %d\n",
+	drm_dbg_kms(mgr->drm,
+		    "connection status reply parse length fail %d %d\n",
 		    idx, raw->curlen);
 	return false;
 }
@@ -1115,7 +1117,9 @@ static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
 	idx++;
 	return true;
 fail_len:
-	drm_dbg_kms(mgr->dev, "resource status reply parse length fail %d %d\n", idx, raw->curlen);
+	drm_dbg_kms(mgr->drm,
+		    "resource status reply parse length fail %d %d\n", idx,
+		    raw->curlen);
 	return false;
 }
 
@@ -1132,7 +1136,7 @@ static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
 	case DP_RESOURCE_STATUS_NOTIFY:
 		return drm_dp_sideband_parse_resource_status_notify(mgr, raw, msg);
 	default:
-		drm_err(mgr->dev, "Got unknown request 0x%02x (%s)\n",
+		drm_err(mgr->drm, "Got unknown request 0x%02x (%s)\n",
 			msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
 		return false;
 	}
@@ -1291,7 +1295,7 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 			goto out;
 		}
 	} else {
-		drm_dbg_kms(mgr->dev, "timedout msg send %p %d %d\n",
+		drm_dbg_kms(mgr->drm, "timedout msg send %p %d %d\n",
 			    txmsg, txmsg->state, txmsg->seqno);
 
 		/* dump some state */
@@ -1446,7 +1450,8 @@ static void
 drm_dp_mst_get_mstb_malloc(struct drm_dp_mst_branch *mstb)
 {
 	kref_get(&mstb->malloc_kref);
-	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->malloc_kref));
+	drm_dbg(mstb->mgr->drm, "mstb %p (%d)\n", mstb,
+		kref_read(&mstb->malloc_kref));
 }
 
 /**
@@ -1463,7 +1468,8 @@ drm_dp_mst_get_mstb_malloc(struct drm_dp_mst_branch *mstb)
 static void
 drm_dp_mst_put_mstb_malloc(struct drm_dp_mst_branch *mstb)
 {
-	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->malloc_kref) - 1);
+	drm_dbg(mstb->mgr->drm, "mstb %p (%d)\n", mstb,
+		kref_read(&mstb->malloc_kref) - 1);
 	kref_put(&mstb->malloc_kref, drm_dp_free_mst_branch_device);
 }
 
@@ -1497,7 +1503,8 @@ void
 drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port)
 {
 	kref_get(&port->malloc_kref);
-	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->malloc_kref));
+	drm_dbg(port->mgr->drm, "port %p (%d)\n", port,
+		kref_read(&port->malloc_kref));
 }
 EXPORT_SYMBOL(drm_dp_mst_get_port_malloc);
 
@@ -1514,7 +1521,8 @@ EXPORT_SYMBOL(drm_dp_mst_get_port_malloc);
 void
 drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port)
 {
-	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->malloc_kref) - 1);
+	drm_dbg(port->mgr->drm, "port %p (%d)\n", port,
+		kref_read(&port->malloc_kref) - 1);
 	kref_put(&port->malloc_kref, drm_dp_free_mst_port);
 }
 EXPORT_SYMBOL(drm_dp_mst_put_port_malloc);
@@ -1750,7 +1758,8 @@ drm_dp_mst_topology_try_get_mstb(struct drm_dp_mst_branch *mstb)
 	topology_ref_history_lock(mstb->mgr);
 	ret = kref_get_unless_zero(&mstb->topology_kref);
 	if (ret) {
-		drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref));
+		drm_dbg(mstb->mgr->drm, "mstb %p (%d)\n", mstb,
+			kref_read(&mstb->topology_kref));
 		save_mstb_topology_ref(mstb, DRM_DP_MST_TOPOLOGY_REF_GET);
 	}
 
@@ -1780,7 +1789,8 @@ static void drm_dp_mst_topology_get_mstb(struct drm_dp_mst_branch *mstb)
 	save_mstb_topology_ref(mstb, DRM_DP_MST_TOPOLOGY_REF_GET);
 	WARN_ON(kref_read(&mstb->topology_kref) == 0);
 	kref_get(&mstb->topology_kref);
-	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref));
+	drm_dbg(mstb->mgr->drm, "mstb %p (%d)\n", mstb,
+		kref_read(&mstb->topology_kref));
 
 	topology_ref_history_unlock(mstb->mgr);
 }
@@ -1802,7 +1812,8 @@ drm_dp_mst_topology_put_mstb(struct drm_dp_mst_branch *mstb)
 {
 	topology_ref_history_lock(mstb->mgr);
 
-	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref) - 1);
+	drm_dbg(mstb->mgr->drm, "mstb %p (%d)\n", mstb,
+		kref_read(&mstb->topology_kref) - 1);
 	save_mstb_topology_ref(mstb, DRM_DP_MST_TOPOLOGY_REF_PUT);
 
 	topology_ref_history_unlock(mstb->mgr);
@@ -1865,7 +1876,8 @@ drm_dp_mst_topology_try_get_port(struct drm_dp_mst_port *port)
 	topology_ref_history_lock(port->mgr);
 	ret = kref_get_unless_zero(&port->topology_kref);
 	if (ret) {
-		drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->topology_kref));
+		drm_dbg(port->mgr->drm, "port %p (%d)\n", port,
+			kref_read(&port->topology_kref));
 		save_port_topology_ref(port, DRM_DP_MST_TOPOLOGY_REF_GET);
 	}
 
@@ -1892,7 +1904,8 @@ static void drm_dp_mst_topology_get_port(struct drm_dp_mst_port *port)
 
 	WARN_ON(kref_read(&port->topology_kref) == 0);
 	kref_get(&port->topology_kref);
-	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->topology_kref));
+	drm_dbg(port->mgr->drm, "port %p (%d)\n", port,
+		kref_read(&port->topology_kref));
 	save_port_topology_ref(port, DRM_DP_MST_TOPOLOGY_REF_GET);
 
 	topology_ref_history_unlock(port->mgr);
@@ -1913,7 +1926,8 @@ static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
 {
 	topology_ref_history_lock(port->mgr);
 
-	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->topology_kref) - 1);
+	drm_dbg(port->mgr->drm, "port %p (%d)\n", port,
+		kref_read(&port->topology_kref) - 1);
 	save_port_topology_ref(port, DRM_DP_MST_TOPOLOGY_REF_PUT);
 
 	topology_ref_history_unlock(port->mgr);
@@ -2098,7 +2112,9 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 			mstb = drm_dp_add_mst_branch_device(lct, rad);
 			if (!mstb) {
 				ret = -ENOMEM;
-				drm_err(mgr->dev, "Failed to create MSTB for port %p", port);
+				drm_err(mgr->drm,
+					"Failed to create MSTB for port %p",
+					port);
 				goto out;
 			}
 
@@ -2228,7 +2244,7 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port)
 {
-	drm_dbg_kms(port->mgr->dev, "registering %s remote bus for %s\n",
+	drm_dbg_kms(port->mgr->drm, "registering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 
 	port->aux.dev = connector->kdev;
@@ -2248,7 +2264,7 @@ EXPORT_SYMBOL(drm_dp_mst_connector_late_register);
 void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 					   struct drm_dp_mst_port *port)
 {
-	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
+	drm_dbg_kms(port->mgr->drm, "unregistering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
 }
@@ -2279,7 +2295,8 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	return;
 
 error:
-	drm_err(mgr->dev, "Failed to create connector for port %p: %d\n", port, ret);
+	drm_err(mgr->drm, "Failed to create connector for port %p: %d\n",
+		port, ret);
 }
 
 /*
@@ -2513,7 +2530,8 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 	if (ret == 1) {
 		dowork = true;
 	} else if (ret < 0) {
-		drm_err(mgr->dev, "Failed to change PDT for port %p: %d\n", port, ret);
+		drm_err(mgr->drm, "Failed to change PDT for port %p: %d\n",
+			port, ret);
 		dowork = false;
 	}
 
@@ -2549,7 +2567,7 @@ static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_
 			if (port->port_num == port_num) {
 				mstb = port->mstb;
 				if (!mstb) {
-					drm_err(mgr->dev,
+					drm_err(mgr->drm,
 						"failed to lookup MSTB with lct %d, rad %02x\n",
 						lct, rad[0]);
 					goto out;
@@ -2645,7 +2663,7 @@ static void drm_dp_mst_link_probe_work(struct work_struct *work)
 {
 	struct drm_dp_mst_topology_mgr *mgr =
 		container_of(work, struct drm_dp_mst_topology_mgr, work);
-	struct drm_device *dev = mgr->dev;
+	struct drm_device *dev = mgr->drm;
 	struct drm_dp_mst_branch *mstb;
 	int ret;
 	bool clear_payload_id_table;
@@ -2739,7 +2757,8 @@ static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
 				retries++;
 				goto retry;
 			}
-			drm_dbg_kms(mgr->dev, "failed to dpcd write %d %d\n", tosend, ret);
+			drm_dbg_kms(mgr->drm, "failed to dpcd write %d %d\n",
+				    tosend, ret);
 
 			return -EIO;
 		}
@@ -2854,7 +2873,7 @@ static void process_single_down_tx_qlock(struct drm_dp_mst_topology_mgr *mgr)
 				 struct drm_dp_sideband_msg_tx, next);
 	ret = process_single_tx_qlock(mgr, txmsg, false);
 	if (ret < 0) {
-		drm_dbg_kms(mgr->dev, "failed to send msg in q %d\n", ret);
+		drm_dbg_kms(mgr->drm, "failed to send msg in q %d\n", ret);
 		list_del(&txmsg->next);
 		txmsg->state = DRM_DP_SIDEBAND_TX_TIMEOUT;
 		wake_up_all(&mgr->tx_waitq);
@@ -2887,7 +2906,7 @@ drm_dp_dump_link_address(const struct drm_dp_mst_topology_mgr *mgr,
 
 	for (i = 0; i < reply->nports; i++) {
 		port_reply = &reply->ports[i];
-		drm_dbg_kms(mgr->dev,
+		drm_dbg_kms(mgr->drm,
 			    "port %d: input %d, pdt: %d, pn: %d, dpcd_rev: %02x, mcs: %d, ddps: %d, ldps %d, sdp %d/%d\n",
 			    i,
 			    port_reply->input_port,
@@ -2924,17 +2943,18 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	/* FIXME: Actually do some real error handling here */
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
 	if (ret <= 0) {
-		drm_err(mgr->dev, "Sending link address failed with %d\n", ret);
+		drm_err(mgr->drm, "Sending link address failed with %d\n",
+			ret);
 		goto out;
 	}
 	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-		drm_err(mgr->dev, "link address NAK received\n");
+		drm_err(mgr->drm, "link address NAK received\n");
 		ret = -EIO;
 		goto out;
 	}
 
 	reply = &txmsg->reply.u.link_addr;
-	drm_dbg_kms(mgr->dev, "link address reply: %d\n", reply->nports);
+	drm_dbg_kms(mgr->drm, "link address reply: %d\n", reply->nports);
 	drm_dp_dump_link_address(mgr, reply);
 
 	ret = drm_dp_check_mstb_guid(mstb, reply->guid);
@@ -2942,13 +2962,13 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 		char buf[64];
 
 		drm_dp_mst_rad_to_str(mstb->rad, mstb->lct, buf, sizeof(buf));
-		drm_err(mgr->dev, "GUID check on %s failed: %d\n", buf, ret);
+		drm_err(mgr->drm, "GUID check on %s failed: %d\n", buf, ret);
 		goto out;
 	}
 
 	for (i = 0; i < reply->nports; i++) {
 		port_mask |= BIT(reply->ports[i].port_number);
-		ret = drm_dp_mst_handle_link_address_port(mstb, mgr->dev,
+		ret = drm_dp_mst_handle_link_address_port(mstb, mgr->drm,
 							  &reply->ports[i]);
 		if (ret == 1)
 			changed = true;
@@ -2966,7 +2986,8 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 		if (port_mask & BIT(port->port_num))
 			continue;
 
-		drm_dbg_kms(mgr->dev, "port %d was not in link address, removing\n",
+		drm_dbg_kms(mgr->drm,
+			    "port %d was not in link address, removing\n",
 			    port->port_num);
 		list_del(&port->next);
 		drm_dp_mst_topology_put_port(port);
@@ -2999,7 +3020,7 @@ drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
 	if (ret > 0 && txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
-		drm_dbg_kms(mgr->dev, "clear payload table id nak received\n");
+		drm_dbg_kms(mgr->drm, "clear payload table id nak received\n");
 
 	kfree(txmsg);
 }
@@ -3028,12 +3049,14 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 		path_res = &txmsg->reply.u.path_resources;
 
 		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-			drm_dbg_kms(mgr->dev, "enum path resources nak received\n");
+			drm_dbg_kms(mgr->drm,
+				    "enum path resources nak received\n");
 		} else {
 			if (port->port_num != path_res->port_number)
 				DRM_ERROR("got incorrect port in response\n");
 
-			drm_dbg_kms(mgr->dev, "enum path resources %d: %d %d\n",
+			drm_dbg_kms(mgr->drm,
+				    "enum path resources %d: %d %d\n",
 				    path_res->port_number,
 				    path_res->full_payload_bw_number,
 				    path_res->avail_payload_bw_number);
@@ -3238,7 +3261,8 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
 	if (ret < 0) {
 		goto out;
 	} else if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-		drm_dbg_kms(mgr->dev, "query encryption status nak received\n");
+		drm_dbg_kms(mgr->drm,
+			    "query encryption status nak received\n");
 		ret = -ENXIO;
 		goto out;
 	}
@@ -3280,7 +3304,7 @@ static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
 					struct drm_dp_mst_topology_state *mst_state,
 					struct drm_dp_mst_atomic_payload *payload)
 {
-	drm_dbg_kms(mgr->dev, "\n");
+	drm_dbg_kms(mgr->drm, "\n");
 
 	/* it's okay for these to fail */
 	drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
@@ -3310,7 +3334,7 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 
 	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
 	if (!port) {
-		drm_dbg_kms(mgr->dev,
+		drm_dbg_kms(mgr->drm,
 			    "VCPI %d for port %p not in topology, not creating a payload\n",
 			    payload->vcpi, payload->port);
 		payload->vc_start_slot = -1;
@@ -3325,7 +3349,8 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 	ret = drm_dp_create_payload_step1(mgr, payload);
 	drm_dp_mst_topology_put_port(port);
 	if (ret < 0) {
-		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
+		drm_warn(mgr->drm,
+			 "Failed to create MST payload for port %p: %d\n",
 			 payload->port, ret);
 		payload->vc_start_slot = -1;
 		return ret;
@@ -3368,7 +3393,8 @@ void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
 	if (send_remove)
 		drm_dp_destroy_payload_step1(mgr, mst_state, new_payload);
 	else
-		drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, not sending remove\n",
+		drm_dbg_kms(mgr->drm,
+			    "Payload for VCPI %d not in topology, not sending remove\n",
 			    new_payload->vcpi);
 
 	list_for_each_entry(pos, &mst_state->payloads, next) {
@@ -3413,10 +3439,12 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 	ret = drm_dp_create_payload_step2(mgr, payload);
 	if (ret < 0) {
 		if (!payload->delete)
-			drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
+			drm_err(mgr->drm,
+				"Step 2 of creating MST payload for %p failed: %d\n",
 				payload->port, ret);
 		else
-			drm_dbg_kms(mgr->dev, "Step 2 of removing MST payload for %p failed: %d\n",
+			drm_dbg_kms(mgr->drm,
+				    "Step 2 of removing MST payload for %p failed: %d\n",
 				    payload->port, ret);
 	}
 
@@ -3452,7 +3480,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 		goto fail_free;
 
 	if (txmsg->reply.reply_type == 1) {
-		drm_dbg_kms(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
+		drm_dbg_kms(mgr->drm,
+			    "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
 			    mstb, port->port_num, offset, size);
 		ret = -EIO;
 		goto fail_free;
@@ -3559,7 +3588,8 @@ int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count)
 {
 	if (link_rate == 0 || link_lane_count == 0)
-		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
+		drm_dbg_kms(mgr->drm,
+			    "invalid link rate/lane count: (%d / %d)\n",
 			    link_rate, link_lane_count);
 
 	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
@@ -3614,7 +3644,8 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		/* get dpcd info */
 		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
 		if (ret < 0) {
-			drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret %d\n",
+			drm_dbg_kms(mgr->drm,
+				    "%s: failed to read DPCD, ret %d\n",
 				    mgr->aux->name, ret);
 			goto out_unlock;
 		}
@@ -3734,7 +3765,8 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		goto out_fail;
 
 	if (drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd) < 0) {
-		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->drm,
+			    "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
@@ -3743,20 +3775,23 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 				 DP_UP_REQ_EN |
 				 DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
-		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->drm,
+			    "mst write failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	/* Some hubs forget their guids after they resume */
 	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
 	if (ret != 16) {
-		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->drm,
+			    "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	ret = drm_dp_check_mstb_guid(mgr->mst_primary, guid);
 	if (ret) {
-		drm_dbg_kms(mgr->dev, "check mstb failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->drm,
+			    "check mstb failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
@@ -3769,7 +3804,7 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 	mutex_unlock(&mgr->lock);
 
 	if (sync) {
-		drm_dbg_kms(mgr->dev,
+		drm_dbg_kms(mgr->drm,
 			    "Waiting for link probe work to finish re-syncing topology...\n");
 		flush_work(&mgr->work);
 	}
@@ -3803,7 +3838,8 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
 	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
 	if (ret != len) {
-		drm_dbg_kms(mgr->dev, "failed to read DPCD down rep %d %d\n", len, ret);
+		drm_dbg_kms(mgr->drm, "failed to read DPCD down rep %d %d\n",
+			    len, ret);
 		return false;
 	}
 
@@ -3811,7 +3847,7 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	if (ret == false) {
 		print_hex_dump(KERN_DEBUG, "failed hdr", DUMP_PREFIX_NONE, 16,
 			       1, replyblock, len, false);
-		drm_dbg_kms(mgr->dev, "ERROR: failed header\n");
+		drm_dbg_kms(mgr->drm, "ERROR: failed header\n");
 		return false;
 	}
 
@@ -3819,20 +3855,24 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		/* Caller is responsible for giving back this reference */
 		*mstb = drm_dp_get_mst_branch_device(mgr, hdr.lct, hdr.rad);
 		if (!*mstb) {
-			drm_dbg_kms(mgr->dev, "Got MST reply from unknown device %d\n", hdr.lct);
+			drm_dbg_kms(mgr->drm,
+				    "Got MST reply from unknown device %d\n",
+				    hdr.lct);
 			return false;
 		}
 	}
 
 	if (!drm_dp_sideband_msg_set_header(msg, &hdr, hdrlen)) {
-		drm_dbg_kms(mgr->dev, "sideband msg set header failed %d\n", replyblock[0]);
+		drm_dbg_kms(mgr->drm, "sideband msg set header failed %d\n",
+			    replyblock[0]);
 		return false;
 	}
 
 	replylen = min(msg->curchunk_len, (u8)(len - hdrlen));
 	ret = drm_dp_sideband_append_payload(msg, replyblock + hdrlen, replylen);
 	if (!ret) {
-		drm_dbg_kms(mgr->dev, "sideband msg build failed %d\n", replyblock[0]);
+		drm_dbg_kms(mgr->drm, "sideband msg build failed %d\n",
+			    replyblock[0]);
 		return false;
 	}
 
@@ -3843,14 +3883,16 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		ret = drm_dp_dpcd_read(mgr->aux, basereg + curreply,
 				    replyblock, len);
 		if (ret != len) {
-			drm_dbg_kms(mgr->dev, "failed to read a chunk (len %d, ret %d)\n",
+			drm_dbg_kms(mgr->drm,
+				    "failed to read a chunk (len %d, ret %d)\n",
 				    len, ret);
 			return false;
 		}
 
 		ret = drm_dp_sideband_append_payload(msg, replyblock, len);
 		if (!ret) {
-			drm_dbg_kms(mgr->dev, "failed to build sideband msg\n");
+			drm_dbg_kms(mgr->drm,
+				    "failed to build sideband msg\n");
 			return false;
 		}
 
@@ -3884,7 +3926,8 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 		struct drm_dp_sideband_msg_hdr *hdr;
 
 		hdr = &msg->initial_hdr;
-		drm_dbg_kms(mgr->dev, "Got MST reply with no msg %p %d %d %02x %02x\n",
+		drm_dbg_kms(mgr->drm,
+			    "Got MST reply with no msg %p %d %d %02x %02x\n",
 			    mstb, hdr->seqno, hdr->lct, hdr->rad[0], msg->msg[0]);
 		goto out_clear_reply;
 	}
@@ -3892,7 +3935,7 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_sideband_parse_reply(mgr, msg, &txmsg->reply);
 
 	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-		drm_dbg_kms(mgr->dev,
+		drm_dbg_kms(mgr->drm,
 			    "Got NAK reply: req 0x%02x (%s), reason 0x%02x (%s), nak data 0x%02x\n",
 			    txmsg->reply.req_type,
 			    drm_dp_mst_req_type_str(txmsg->reply.req_type),
@@ -3946,7 +3989,9 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	}
 
 	if (!mstb) {
-		drm_dbg_kms(mgr->dev, "Got MST reply from unknown device %d\n", hdr->lct);
+		drm_dbg_kms(mgr->drm,
+			    "Got MST reply from unknown device %d\n",
+			    hdr->lct);
 		return false;
 	}
 
@@ -3990,7 +4035,7 @@ static void drm_dp_mst_up_req_work(struct work_struct *work)
 	mutex_unlock(&mgr->probe_lock);
 
 	if (send_hotplug)
-		drm_kms_helper_hotplug_event(mgr->dev);
+		drm_kms_helper_hotplug_event(mgr->drm);
 }
 
 static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
@@ -4013,7 +4058,8 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 
 	if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
 	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
-		drm_dbg_kms(mgr->dev, "Received unknown up req type, ignoring: %x\n",
+		drm_dbg_kms(mgr->drm,
+			    "Received unknown up req type, ignoring: %x\n",
 			    up_req->msg.req_type);
 		kfree(up_req);
 		goto out;
@@ -4026,7 +4072,8 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		const struct drm_dp_connection_status_notify *conn_stat =
 			&up_req->msg.u.conn_stat;
 
-		drm_dbg_kms(mgr->dev, "Got CSN: pn: %d ldps:%d ddps: %d mcs: %d ip: %d pdt: %d\n",
+		drm_dbg_kms(mgr->drm,
+			    "Got CSN: pn: %d ldps:%d ddps: %d mcs: %d ip: %d pdt: %d\n",
 			    conn_stat->port_number,
 			    conn_stat->legacy_device_plug_status,
 			    conn_stat->displayport_device_plug_status,
@@ -4037,7 +4084,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		const struct drm_dp_resource_status_notify *res_stat =
 			&up_req->msg.u.resource_stat;
 
-		drm_dbg_kms(mgr->dev, "Got RSN: pn: %d avail_pbn %d\n",
+		drm_dbg_kms(mgr->drm, "Got RSN: pn: %d avail_pbn %d\n",
 			    res_stat->port_number,
 			    res_stat->available_pbn);
 	}
@@ -4303,8 +4350,8 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 		 * releasing and allocating the same timeslot allocation,
 		 * which is an error
 		 */
-		if (drm_WARN_ON(mgr->dev, payload->delete)) {
-			drm_err(mgr->dev,
+		if (drm_WARN_ON(mgr->drm, payload->delete)) {
+			drm_err(mgr->drm,
 				"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
 				port);
 			return -EINVAL;
@@ -4313,10 +4360,12 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 
 	req_slots = DIV_ROUND_UP(pbn, topology_state->pbn_div);
 
-	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d\n",
+	drm_dbg_atomic(mgr->drm,
+		       "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d\n",
 		       port->connector->base.id, port->connector->name,
 		       port, prev_slots, req_slots);
-	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
+	drm_dbg_atomic(mgr->drm,
+		       "[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
 		       port->connector->base.id, port->connector->name,
 		       port, prev_bw, pbn);
 
@@ -4402,7 +4451,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 
 	payload = drm_atomic_get_mst_payload_state(topology_state, port);
 	if (WARN_ON(!payload)) {
-		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\n",
+		drm_err(mgr->drm,
+			"No payload for [MST PORT:%p] found in mst state %p\n",
 			port, &topology_state->base);
 		return -EINVAL;
 	}
@@ -4410,7 +4460,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	if (new_conn_state->crtc)
 		return 0;
 
-	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
+	drm_dbg_atomic(mgr->drm, "[MST PORT:%p] TU %d -> 0\n", port,
+		       payload->time_slots);
 	if (!payload->delete) {
 		payload->pbn = 0;
 		payload->delete = true;
@@ -4609,14 +4660,16 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_dpcd_write(mgr->aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
 	if (ret != 3) {
-		drm_dbg_kms(mgr->dev, "failed to write payload allocation %d\n", ret);
+		drm_dbg_kms(mgr->drm,
+			    "failed to write payload allocation %d\n", ret);
 		goto fail;
 	}
 
 retry:
 	ret = drm_dp_dpcd_readb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
 	if (ret < 0) {
-		drm_dbg_kms(mgr->dev, "failed to read payload table status %d\n", ret);
+		drm_dbg_kms(mgr->drm,
+			    "failed to read payload table status %d\n", ret);
 		goto fail;
 	}
 
@@ -4626,7 +4679,8 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 			usleep_range(10000, 20000);
 			goto retry;
 		}
-		drm_dbg_kms(mgr->dev, "status not set after read payload table status %d\n",
+		drm_dbg_kms(mgr->drm,
+			    "status not set after read payload table status %d\n",
 			    status);
 		ret = -EINVAL;
 		goto fail;
@@ -4674,7 +4728,8 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
 				 200, timeout_ms * USEC_PER_MSEC);
 	if (ret < 0 && status >= 0) {
-		drm_err(mgr->dev, "Failed to get ACT after %dms, last status: %02x\n",
+		drm_err(mgr->drm,
+			"Failed to get ACT after %dms, last status: %02x\n",
 			timeout_ms, status);
 		return -EINVAL;
 	} else if (status < 0) {
@@ -4682,7 +4737,9 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 		 * Failure here isn't unexpected - the hub may have
 		 * just been unplugged
 		 */
-		drm_dbg_kms(mgr->dev, "Failed to read payload table status: %d\n", status);
+		drm_dbg_kms(mgr->drm,
+			    "Failed to read payload table status: %d\n",
+			    status);
 		return status;
 	}
 
@@ -5019,7 +5076,7 @@ static void drm_dp_delayed_destroy_work(struct work_struct *work)
 	} while (go_again);
 
 	if (send_hotplug)
-		drm_kms_helper_hotplug_event(mgr->dev);
+		drm_kms_helper_hotplug_event(mgr->drm);
 }
 
 static struct drm_private_state *
@@ -5130,11 +5187,12 @@ drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
 		return 0;
 
 	if (mstb->port_parent)
-		drm_dbg_atomic(mstb->mgr->dev,
+		drm_dbg_atomic(mstb->mgr->drm,
 			       "[MSTB:%p] [MST PORT:%p] Checking bandwidth limits on [MSTB:%p]\n",
 			       mstb->port_parent->parent, mstb->port_parent, mstb);
 	else
-		drm_dbg_atomic(mstb->mgr->dev, "[MSTB:%p] Checking bandwidth limits\n", mstb);
+		drm_dbg_atomic(mstb->mgr->drm,
+			       "[MSTB:%p] Checking bandwidth limits\n", mstb);
 
 	list_for_each_entry(port, &mstb->ports, next) {
 		ret = drm_dp_mst_atomic_check_port_bw_limit(port, state);
@@ -5167,7 +5225,7 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 		 * the branch device still reports it as attached (PDT != NONE).
 		 */
 		if (!port->full_pbn) {
-			drm_dbg_atomic(port->mgr->dev,
+			drm_dbg_atomic(port->mgr->drm,
 				       "[MSTB:%p] [MST PORT:%p] no BW available for the port\n",
 				       port->parent, port);
 			return -EINVAL;
@@ -5182,13 +5240,14 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 	}
 
 	if (pbn_used > port->full_pbn) {
-		drm_dbg_atomic(port->mgr->dev,
+		drm_dbg_atomic(port->mgr->drm,
 			       "[MSTB:%p] [MST PORT:%p] required PBN of %d exceeds port limit of %d\n",
 			       port->parent, port, pbn_used, port->full_pbn);
 		return -ENOSPC;
 	}
 
-	drm_dbg_atomic(port->mgr->dev, "[MSTB:%p] [MST PORT:%p] uses %d out of %d PBN\n",
+	drm_dbg_atomic(port->mgr->drm,
+		       "[MSTB:%p] [MST PORT:%p] uses %d out of %d PBN\n",
 		       port->parent, port, pbn_used, port->full_pbn);
 
 	return pbn_used;
@@ -5204,24 +5263,26 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struct drm_dp_mst_topology_mgr *mgr
 	list_for_each_entry(payload, &mst_state->payloads, next) {
 		/* Releasing payloads is always OK-even if the port is gone */
 		if (payload->delete) {
-			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] releases all time slots\n",
+			drm_dbg_atomic(mgr->drm,
+				       "[MST PORT:%p] releases all time slots\n",
 				       payload->port);
 			continue;
 		}
 
-		drm_dbg_atomic(mgr->dev, "[MST PORT:%p] requires %d time slots\n",
+		drm_dbg_atomic(mgr->drm,
+			       "[MST PORT:%p] requires %d time slots\n",
 			       payload->port, payload->time_slots);
 
 		avail_slots -= payload->time_slots;
 		if (avail_slots < 0) {
-			drm_dbg_atomic(mgr->dev,
+			drm_dbg_atomic(mgr->drm,
 				       "[MST PORT:%p] not enough time slots in mst state %p (avail=%d)\n",
 				       payload->port, mst_state, avail_slots + payload->time_slots);
 			return -ENOSPC;
 		}
 
 		if (++payload_count > mgr->max_payloads) {
-			drm_dbg_atomic(mgr->dev,
+			drm_dbg_atomic(mgr->drm,
 				       "[MST MGR:%p] state %p has too many payloads (max=%d)\n",
 				       mgr, mst_state, mgr->max_payloads);
 			return -EINVAL;
@@ -5230,7 +5291,8 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struct drm_dp_mst_topology_mgr *mgr
 		/* Assign a VCPI */
 		if (!payload->vcpi) {
 			payload->vcpi = ffz(mst_state->payload_mask) + 1;
-			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] assigned VCPI #%d\n",
+			drm_dbg_atomic(mgr->drm,
+				       "[MST PORT:%p] assigned VCPI #%d\n",
 				       payload->port, payload->vcpi);
 			mst_state->payload_mask |= BIT(payload->vcpi - 1);
 		}
@@ -5239,7 +5301,8 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struct drm_dp_mst_topology_mgr *mgr
 	if (!payload_count)
 		mst_state->pbn_div = 0;
 
-	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p TU pbn_div=%d avail=%d used=%d\n",
+	drm_dbg_atomic(mgr->drm,
+		       "[MST MGR:%p] mst state %p TU pbn_div=%d avail=%d used=%d\n",
 		       mgr, mst_state, mst_state->pbn_div, avail_slots,
 		       mst_state->total_avail_slots - avail_slots);
 
@@ -5298,7 +5361,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);
 
-		drm_dbg_atomic(mgr->dev, "[MST MGR:%p] Setting mode_changed flag on CRTC %p\n",
+		drm_dbg_atomic(mgr->drm,
+			       "[MST MGR:%p] Setting mode_changed flag on CRTC %p\n",
 			       mgr, crtc);
 
 		crtc_state->mode_changed = true;
@@ -5532,7 +5596,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	INIT_WORK(&mgr->delayed_destroy_work, drm_dp_delayed_destroy_work);
 	INIT_WORK(&mgr->up_req_work, drm_dp_mst_up_req_work);
 	init_waitqueue_head(&mgr->tx_waitq);
-	mgr->dev = dev;
+	mgr->drm = dev;
 	mgr->aux = aux;
 	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
 	mgr->max_payloads = max_payloads;
@@ -5569,7 +5633,7 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr)
 		destroy_workqueue(mgr->delayed_destroy_wq);
 		mgr->delayed_destroy_wq = NULL;
 	}
-	mgr->dev = NULL;
+	mgr->drm = NULL;
 	mgr->aux = NULL;
 	drm_atomic_private_obj_fini(&mgr->base);
 	mgr->funcs = NULL;
@@ -5733,7 +5797,8 @@ static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter,
 	} else if (remote_i2c_write_ok(msgs, num)) {
 		ret = drm_dp_mst_i2c_write(mstb, port, msgs, num);
 	} else {
-		drm_dbg_kms(mgr->dev, "Unsupported I2C transaction for MST device\n");
+		drm_dbg_kms(mgr->drm,
+			    "Unsupported I2C transaction for MST device\n");
 		ret = -EIO;
 	}
 
@@ -5763,7 +5828,7 @@ static const struct i2c_algorithm drm_dp_mst_i2c_algo = {
 static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_aux *aux = &port->aux;
-	struct device *parent_dev = port->mgr->dev->dev;
+	struct device *parent_dev = port->mgr->drm->dev;
 
 	aux->ddc.algo = &drm_dp_mst_i2c_algo;
 	aux->ddc.algo_data = aux;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b7cc69e5c2c3..31a1ac69dbcf 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -46,11 +46,11 @@ static int intel_conn_to_vcpi(struct drm_atomic_state *state,
 	drm_modeset_lock(&mgr->base.lock, state->acquire_ctx);
 	mst_state = to_drm_dp_mst_topology_state(mgr->base.state);
 	payload = drm_atomic_get_mst_payload_state(mst_state, connector->port);
-	if (drm_WARN_ON(mgr->dev, !payload))
+	if (drm_WARN_ON(mgr->drm, !payload))
 		goto out;
 
 	vcpi = payload->vcpi;
-	if (drm_WARN_ON(mgr->dev, vcpi < 0)) {
+	if (drm_WARN_ON(mgr->drm, vcpi < 0)) {
 		vcpi = 0;
 		goto out;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8c04b5f554ea..a6f6319c92b1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1463,7 +1463,7 @@ nv50_mstm_init(struct nouveau_encoder *outp, bool runtime)
 	mutex_unlock(&outp->dp.hpd_irq_lock);
 
 	if (ret == -1)
-		drm_kms_helper_hotplug_event(mstm->mgr.dev);
+		drm_kms_helper_hotplug_event(mstm->mgr.drm);
 }
 
 static void
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index ed5c9660563c..40fa95c7b07c 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -626,9 +626,9 @@ struct drm_dp_mst_topology_mgr {
 	struct drm_private_obj base;
 
 	/**
-	 * @dev: device pointer for adding i2c devices etc.
+	 * @drm: device pointer for adding i2c devices etc.
 	 */
-	struct drm_device *dev;
+	struct drm_device *drm;
 	/**
 	 * @cbs: callbacks for connector addition and destruction.
 	 */
-- 
2.39.2

