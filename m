Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343A546225
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DCB11A01D;
	Fri, 10 Jun 2022 09:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39CE1124FA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0ED755C012A;
 Fri, 10 Jun 2022 05:29:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853383; x=1654939783; bh=1N
 DObChxJ723XBSGqxIL8U/8+Tfc6xe57gj6S2V/Ccw=; b=JhQrgvaLXXFoe715LF
 tgcVkhHmmNOjz1IF3vPJB0W/ucLZOM2uxBjH9ntXyW+rW1B1LFfpILD8gc/Sh7MS
 xPMHuo0Y+nzZC65qitnxEt0xrBg+HAn6PY6Anl2Kb6f99/HgRe99eg0uiwDGKVUv
 6H8vBtMdlOn0YNIxv3nnaRSGxP4J46vXPGQogDIP0YOrmUCVvy84o22DhjT3JYNr
 ug6t+fw2p7om1dnKPhD/4HL64wmdE3q1otKDPuFjsErUy2TKn6EJvEs1iYjLKIE4
 OAkOVIBMJlmQ03kt7QmCy9v2ypRKFaXX7l2Xci1PXdIL/LMAC64OAu1lJnPH0m0U
 9aTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853383; x=1654939783; bh=1NDObChxJ723X
 BSGqxIL8U/8+Tfc6xe57gj6S2V/Ccw=; b=w+Hdx6RKC807dJZYm49eihiIf2tsH
 v7li+7P2Kh9KHl8up69sNz74tY+MX0J/1vFFRuEmK7pBdKmIppnrasnYDlUM8E+l
 t/z8R9V0A5focRnGFmBGSLde2Tt14bEzANid/eOiOsDSyN8zps42aVCmTk+QZvM/
 MWCyv2hAxeQR297tNK4rU5x7ur8OfhF244v1u2SJ5rvfXvMInHpga4RZ++ko8JFa
 Zjf+bVrri7z+cXVkCj88YWZZEw48UhaUgrjEke8R37Ofr9rObmQREq/Nax5uY70J
 JmednjEgo/ElxJrht4rTioDoYXLkY30S96X/11QlZkkgFRoYXjjCA3Vvg==
X-ME-Sender: <xms:Bg-jYk6kAFjQkT7c3rs-aSJcOoEWlY0U6-uouyzC46Aeqcay6AtpSA>
 <xme:Bg-jYl4lwm_jgNQvym6U0v6r3EZaixXaeJjIU-qI8LrCIu-twy4ZBWVgrJ3EZH0El
 Wtx_RacHCAbqqcHoNg>
X-ME-Received: <xmr:Bg-jYje1RPGZoFMnEMZl7796OIrYgzsFSO0iKCApJVxkhuxT36rJhJv9Dyh_OXtBAg3GrfDwkvbD8xxeUVqAFU12v5yCZyyRzzC0X90>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Bw-jYpL-p3ps1zoYJ5HPsK5aTrzUscL5XRvs9HxID78_sMtyr1FmPQ>
 <xmx:Bw-jYoJUGq_O5iOozV25IILylJ84uTR07ZIFW_Z0e9zXm-djHxnVWg>
 <xmx:Bw-jYqxj4VpZwzgFnEZgQ4AvelZ-QQAN_8q_v9Elbkpe76MPrOkmoA>
 <xmx:Bw-jYtHObYWIux6FpvJpcXHCXxhVQy8mIm4bnk59cFlfx45GcYL-TQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/64] drm/writeback: Introduce drmm_writeback_connector_init
Date: Fri, 10 Jun 2022 11:28:28 +0200
Message-Id: <20220610092924.754942-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's create a DRM-managed variant of drmm_writeback_connector_init that
will take care of an action of the encoder and connector cleanup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_writeback.c | 136 ++++++++++++++++++++++++--------
 include/drm/drm_writeback.h     |   5 ++
 2 files changed, 108 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dccf4504f1bb..0b00921f3379 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -149,32 +149,27 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats)
+typedef int (*encoder_init_t)(struct drm_device *dev,
+			      struct drm_encoder *encoder,
+			      const struct drm_encoder_funcs *funcs,
+			      int encoder_type,
+			      const char *name, ...);
+
+typedef int (*connector_init_t)(struct drm_device *dev,
+				struct drm_connector *connector,
+				const struct drm_connector_funcs *funcs,
+				int connector_type);
+
+static int writeback_init(struct drm_device *dev,
+			  struct drm_writeback_connector *wb_connector,
+			  connector_init_t conn_init,
+			  void (*conn_destroy)(struct drm_connector *connector),
+			  encoder_init_t enc_init,
+			  void (*enc_destroy)(struct drm_encoder *encoder),
+			  const struct drm_connector_funcs *con_funcs,
+			  const struct drm_encoder_funcs *enc_funcs,
+			  const struct drm_encoder_helper_funcs *enc_helper_funcs,
+			  const u32 *formats, int n_formats)
 {
 	struct drm_property_blob *blob;
 	struct drm_connector *connector = &wb_connector->base;
@@ -190,16 +185,16 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		return PTR_ERR(blob);
 
 	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = enc_init(dev, &wb_connector->encoder,
+		       enc_funcs,
+		       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		goto fail;
 
 	connector->interlace_allowed = 0;
 
-	ret = drm_connector_init(dev, connector, con_funcs,
-				 DRM_MODE_CONNECTOR_WRITEBACK);
+	ret = conn_init(dev, connector, con_funcs,
+			DRM_MODE_CONNECTOR_WRITEBACK);
 	if (ret)
 		goto connector_fail;
 
@@ -231,15 +226,90 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	return 0;
 
 attach_fail:
-	drm_connector_cleanup(connector);
+	if (conn_destroy)
+		conn_destroy(connector);
 connector_fail:
-	drm_encoder_cleanup(&wb_connector->encoder);
+	if (enc_destroy)
+		enc_destroy(&wb_connector->encoder);
 fail:
 	drm_property_blob_put(blob);
 	return ret;
 }
+
+/**
+ * drm_writeback_connector_init - Initialize a writeback connector and its properties
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values. It will also create an internal encoder associated with the
+ * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
+ * the encoder helper.
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
+				 const u32 *formats, int n_formats)
+{
+	return writeback_init(dev, wb_connector,
+			      drm_connector_init, drm_connector_cleanup,
+			      drm_encoder_init, drm_encoder_cleanup,
+			      con_funcs,
+			      &drm_writeback_encoder_funcs, enc_helper_funcs,
+			      formats, n_formats);
+}
 EXPORT_SYMBOL(drm_writeback_connector_init);
 
+/**
+ * drmm_writeback_connector_init - Initialize a writeback connector and its properties
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values. It will also create an internal encoder associated with the
+ * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
+ * the encoder helper.
+ *
+ * The writeback connector is DRM-managed and won't need any cleanup.
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drmm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
+				 const u32 *formats, int n_formats)
+{
+	return writeback_init(dev, wb_connector,
+			      drmm_connector_init, NULL,
+			      drmm_encoder_init, NULL,
+			      con_funcs,
+			      NULL, enc_helper_funcs,
+			      formats, n_formats);
+}
+EXPORT_SYMBOL(drmm_writeback_connector_init);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 9697d2714d2a..cc259ae44734 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -151,6 +151,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const struct drm_connector_funcs *con_funcs,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
 				 const u32 *formats, int n_formats);
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  const struct drm_encoder_helper_funcs *enc_helper_funcs,
+				  const u32 *formats, int n_formats);
 
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
-- 
2.36.1

