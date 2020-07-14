Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D521FF10
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC66E99F;
	Tue, 14 Jul 2020 20:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434C6E97D;
 Tue, 14 Jul 2020 20:58:23 +0000 (UTC)
IronPort-SDR: XtLq7h3+Vt1xEQ/YnAbsTG6wZrvueupDQDHwpWNwuf4YOrkrtQTGE1DoJGFoCwNF6ymI+DB2I6
 3Mzc6zrLDbeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="148173317"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="148173317"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:23 -0700
IronPort-SDR: du65h4vJJAJh9Bu18Of6yI0KtAWQDD4tbfO5TMYJI5T/9xCdkJL9v5hVTSund2mz6baeWiCMF3
 NWRAomYHjP+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504086"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:21 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 08/59] drm/kmb: Added mipi_dsi_host initialization
Date: Tue, 14 Jul 2020 13:56:54 -0700
Message-Id: <1594760265-11618-9-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added mipi DSI host initialization functions

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 59 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h |  4 +++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 654fae8..d82411e 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -65,12 +65,59 @@ static const struct drm_connector_funcs kmb_dsi_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 };
 
+static ssize_t kmb_dsi_host_transfer(struct mipi_dsi_host *host,
+				     const struct mipi_dsi_msg *msg)
+{
+	return 0;
+}
+
+static int kmb_dsi_host_attach(struct mipi_dsi_host *host,
+			       struct mipi_dsi_device *dev)
+{
+	return 0;
+}
+
+static int kmb_dsi_host_detach(struct mipi_dsi_host *host,
+			       struct mipi_dsi_device *dev)
+{
+	return 0;
+}
+
+static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
+	.attach = kmb_dsi_host_attach,
+	.detach = kmb_dsi_host_detach,
+	.transfer = kmb_dsi_host_transfer,
+};
+
+static struct kmb_dsi_host *kmb_dsi_host_init(struct kmb_dsi *kmb_dsi)
+{
+	struct kmb_dsi_host *host;
+	struct mipi_dsi_device *device;
+
+	host = kzalloc(sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return NULL;
+
+	host->base.ops = &kmb_dsi_host_ops;
+	host->kmb_dsi = kmb_dsi;
+
+	device = kzalloc(sizeof(*device), GFP_KERNEL);
+	if (!device) {
+		kfree(host);
+		return NULL;
+	}
+	device->host = &host->base;
+	host->device = device;
+	return host;
+}
+
 void kmb_dsi_init(struct drm_device *dev)
 {
 	struct kmb_dsi *kmb_dsi;
 	struct drm_encoder *encoder;
 	struct kmb_connector *kmb_connector;
 	struct drm_connector *connector;
+	struct kmb_dsi_host *host;
 
 	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
 	if (!kmb_dsi)
@@ -88,7 +135,19 @@ void kmb_dsi_init(struct drm_device *dev)
 	encoder = &kmb_dsi->base;
 	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
 			 "MIPI-DSI");
+
+	host = kmb_dsi_host_init(kmb_dsi);
+	if (!host) {
+		drm_encoder_cleanup(encoder);
+		kfree(kmb_dsi);
+		kfree(kmb_connector);
+	}
+
 	drm_connector_init(dev, connector, &kmb_dsi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DSI);
 	drm_connector_helper_add(connector, &kmb_dsi_connector_helper_funcs);
+
+	connector->encoder = encoder;
+	drm_connector_attach_encoder(connector, encoder);
+
 }
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 9a6b0b7..0f5da87 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -12,19 +12,23 @@
 #include "kmb_drv.h"
 
 struct kmb_connector;
+struct kmb_dsi_host;
 
 struct kmb_dsi {
 	struct drm_encoder base;
 	struct kmb_connector *attached_connector;
+	struct kmb_dsi_host *dsi_host;
 };
 
 struct kmb_dsi_host {
 	struct mipi_dsi_host base;
 	struct kmb_dsi *kmb_dsi;
+	struct mipi_dsi_device *device;
 };
 
 struct kmb_connector {
 	struct drm_connector base;
+	struct drm_encoder *encoder;
 	struct drm_display_mode *fixed_mode;
 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
