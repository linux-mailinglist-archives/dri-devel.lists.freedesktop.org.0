Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FF56B613
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705CF1137A6;
	Fri,  8 Jul 2022 09:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8449113814
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 724703200980;
 Fri,  8 Jul 2022 05:57:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274256; x=1657360656; bh=ua
 S0XZsCG3qedAVjXruTJjURV7bIyOdbyhb8SqormTY=; b=qsfjrOxVcYy3XcVTTm
 k23cR4r1BijCSsL88EjQOpz0fL8FbuZgNzrXz8Mbxm266FuNAeaoZGevBGDERWyi
 jMyoaGVqMxVpLwPQyAG0q0joJ+A/EDf7ozVdFJK7iZKkWoCKY01VtuQw2EVd4bfJ
 qoK96qj8B9BchVrhuvEQxKqlmBLzmbJb43YIHZGLxyqw5LtzXMSpLjRHo6thOENy
 TUDLNj5UBXul9R46czBQFRY69SMJ0A2Wzow4DcTXQOuRqzZBrncvjkRWm4122mCi
 P8WQOFmXMoLd0n7Z6SEWyaAd3zTJDbab22PmHaUMrf5UeXBUQvObjjUtLVeQShFr
 UAJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274256; x=1657360656; bh=uaS0XZsCG3qed
 AVjXruTJjURV7bIyOdbyhb8SqormTY=; b=Cp+h7rS5I+q4XjmpXPqDI+0q03Dlp
 welF6qiu+x713pv3glwjUB5y31/U391GNtW3+KYNBGevwEl+NYNEyRxbPrSWgNg4
 jyDYsLbT6tLGEMhCO30HTh1ZzACyZy8FKQ3qW8wxXl8qavTYHd4VnBXyCIuCBXhJ
 D9iMZp2AoAfpMarhlkv5tYDNUmJLz+abvumcVo6ALjRGTu0YSES79tRNfDce5TnN
 umqW0Dy3Ld3iZFH/jI+H9KJtXM/gwSIKTwBzEJUhr6j7JsbSpQwXHN1Lt2/+2IaB
 +oLmyQPeTJhbz5GOxbdkEDwv3xyfbpwlLMFMZwtu3tmgtzC+xWwWCVCNg==
X-ME-Sender: <xms:kP_HYlG_vE9j4w71hS3EKH-7f4W_99QlcEAyEO4Ix_j9HDot1zLhOw>
 <xme:kP_HYqVX4mtlda_uXxU4ZShDzyup2meDbN0IpJWati3gtQ8iZFBPko-Ox2GCXZwg6
 4cp3-6VW-LcLlaQTjQ>
X-ME-Received: <xmr:kP_HYnLnmSPGJVG43u_4WEWh992cSBdu_C1xBtq8M8mZs1oskIO35OCPn5iuszm1rD7vgZpcrrtQZ5Tcicw_L3yg7b57G8fvL7oyh90>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kP_HYrFjc-xilQcN3DB5CAZBRgiVhnj8oPVqxHuOz5E9knmisJFvqA>
 <xmx:kP_HYrU8IvpNqNsnBGu0vKB2CGn2WOXbYMeqHMdBugkkezEhme_xGA>
 <xmx:kP_HYmMT4bAsZ16C-3uMQU34S_nOSDMebne4IJPAKPgWdn12rfxFuQ>
 <xmx:kP_HYhdWZYPAgrfdfOp8OcDEkGcmKm51lbg8BG7gs2pXVLb6ECnTZw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 09/69] drm/connector: Introduce drmm_connector_init
Date: Fri,  8 Jul 2022 11:56:07 +0200
Message-Id: <20220708095707.257937-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike other DRM entities, there's no helper to create a DRM-managed
initialisation of a connector.

Let's create an helper to initialise a connector that would be passed as an
argument, and handle the cleanup through a DRM-managed action.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 60 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index dfd170273f5c..e3142c8142b3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -26,6 +26,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
@@ -340,6 +341,10 @@ static int __drm_connector_init(struct drm_device *dev,
  * should call drm_connector_cleanup() and free the connector structure.
  * The connector structure should not be allocated with devm_kzalloc().
  *
+ * Note: consider using drmm_connector_init() instead of
+ * drm_connector_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -372,6 +377,10 @@ EXPORT_SYMBOL(drm_connector_init);
  *
  * Ensures that the ddc field of the connector is correctly set.
  *
+ * Note: consider using drmm_connector_init() instead of
+ * drm_connector_init_with_ddc() to let the DRM managed resource
+ * infrastructure take care of cleanup and deallocation.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -388,6 +397,57 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
+static void drm_connector_cleanup_action(struct drm_device *dev,
+					 void *ptr)
+{
+	struct drm_connector *connector = ptr;
+
+	drm_connector_cleanup(connector);
+}
+
+/**
+ * drmm_connector_init - Init a preallocated connector
+ * @dev: DRM device
+ * @connector: the connector to init
+ * @funcs: callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated connector. Connectors should be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_init(struct drm_device *dev,
+			struct drm_connector *connector,
+			const struct drm_connector_funcs *funcs,
+			int connector_type,
+			struct i2c_adapter *ddc)
+{
+	int ret;
+
+	if (drm_WARN_ON(dev, funcs && funcs->destroy))
+		return -EINVAL;
+
+	ret = __drm_connector_init(dev, connector, funcs, connector_type, NULL);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drm_connector_cleanup_action,
+				       connector);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_connector_init);
+
 /**
  * drm_connector_attach_edid_property - attach edid property.
  * @connector: the connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a1705d6b3fba..2c6fa746efac 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1677,6 +1677,11 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				const struct drm_connector_funcs *funcs,
 				int connector_type,
 				struct i2c_adapter *ddc);
+int drmm_connector_init(struct drm_device *dev,
+			struct drm_connector *connector,
+			const struct drm_connector_funcs *funcs,
+			int connector_type,
+			struct i2c_adapter *ddc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
-- 
2.36.1

