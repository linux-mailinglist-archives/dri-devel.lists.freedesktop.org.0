Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112242F2982
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA56E03E;
	Tue, 12 Jan 2021 07:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9B6E077
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:44:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B39455C0068;
 Mon, 11 Jan 2021 03:44:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 03:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=SN9avihQu08uWyAj/8L97S+4m/
 5ua0vSb9nzFBd+gE0=; b=VDyCUWcSd0t962KEogxwBUhRV7kIrKNlxrDPM3IISB
 /x9w3Q65nqi4aO6FaqSf0SkhNomCi+RLEitYIrgyHe5ynquLSWa+ddB7OxOJfM4v
 Q4O5ByITcvr1THhxm56jAXCfQwFiMlXuzwt9XkYzcU4kncU6yW7IxXWqM33APqsn
 gixcpRahxn2VkEuH09XnfC7eKBMmusKEBgHgUeScegWpxv8rz4zr+zCFgzo/BcDW
 50VGaK+dAE7iwAgNTXunSlOXtfTTFRqVcWWu3bPKzCOfbqLFZmfgCjnCmt1Dmdv+
 cfR94xXlGpGXy5eHIH9wicKBzMhG31Ng8KsgYRuwm1zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SN9avihQu08uWyAj/
 8L97S+4m/5ua0vSb9nzFBd+gE0=; b=LHfE357h/BXxi9lZrqAY5suLo9Hn62mJQ
 krRfbwM6mzDIcvOUungxoVgc5LjAtKvM2bfNwzjcIfNfpGDnRxAbxzozsew0XsIZ
 lboCkrTHWabSWampuN8WjY2x+zWBXqBmNCGu9MOegZ+UVQT72sDwxpe/NLnGUWEO
 8vNwW4VSnpAbURVPDYTJSZBlvlq2PtincEm+P7u8CElR584Xf/eLSw94ABetim8C
 l4hRg+PswLPDgw7IWnCvweDcyiqhKpgygnlQb7GcN6voy29C9yIUrny7QMi7NXet
 nWUCt/AhC7D8xbeyN6Ivy50N7VI+Q4cOFAItsgAzuoQXBuLBGt0tQ==
X-ME-Sender: <xms:3A_8X-liefcCO6etQERms-_kF9CsEPPncWkr1S6KU_K4BAQMoRsjQw>
 <xme:3A_8X12PTvL2Z30Jsb30MYZ1182mLcz78Rzs1c_ipOBUV9YNWg56wN9KuAz2yhy0v
 gu4NBUy7TEEdJu-At8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehtddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
 geenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3A_8X8rwXIe3QA0tlpaI04bimwoJnIVcwdHIF0EVhksHkpotfQQ8qw>
 <xmx:3A_8XyluA47dkim94W00zUF4wkQSjHQ2F3pZqHxRyObsJzxQn99oUQ>
 <xmx:3A_8X82BfuRUxzHE8vS1p_YTM-QvLUsPlcpEUoS6-8rBRVn1D2W3pQ>
 <xmx:3Q_8X_SloCBDyIuHiMv9WdRkRMIIpg1rVm6y-xDesSxrKSkjsWhbOw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3689024005B;
 Mon, 11 Jan 2021 03:44:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2] drm: Introduce a drm_crtc_commit_wait helper
Date: Mon, 11 Jan 2021 09:44:01 +0100
Message-Id: <20210111084401.117152-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's currently four users of the same logic to wait for a commit to
be flipped: three for the CRTCs, connectors and planes in
drm_atomic_helper_wait_for_dependencies, and one in vc4.

Let's consolidate this a bit to avoid any code duplication.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Added a note in struct drm_crtc_commit documentation to look at the
    new function
---
 drivers/gpu/drm/drm_atomic.c        | 39 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c | 61 +++++------------------------
 drivers/gpu/drm/vc4/vc4_kms.c       | 17 ++------
 include/drm/drm_atomic.h            |  4 ++
 4 files changed, 56 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index dda60051854b..b1efa9322be2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -52,6 +52,45 @@ void __drm_crtc_commit_free(struct kref *kref)
 }
 EXPORT_SYMBOL(__drm_crtc_commit_free);
 
+/**
+ * drm_crtc_commit_wait - Waits for a commit to complete
+ * @commit: &drm_crtc_commit to wait for
+ *
+ * Waits for a given &drm_crtc_commit to be programmed into the
+ * hardware and flipped to.
+ *
+ * Returns:
+ *
+ * 0 on success, a negative error code otherwise.
+ */
+int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
+{
+	unsigned long timeout = 10 * HZ;
+	int ret;
+
+	if (!commit)
+		return 0;
+
+	ret = wait_for_completion_timeout(&commit->hw_done, timeout);
+	if (!ret) {
+		DRM_ERROR("hw_done timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	/*
+	 * Currently no support for overwriting flips, hence
+	 * stall for previous one to execute completely.
+	 */
+	ret = wait_for_completion_timeout(&commit->flip_done, timeout);
+	if (!ret) {
+		DRM_ERROR("flip_done timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_commit_wait);
+
 /**
  * drm_atomic_state_default_release -
  * release memory initialized by drm_atomic_state_init
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index a84dc427cf82..9fa3f97223a1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2202,70 +2202,27 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
 	struct drm_plane_state *old_plane_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *old_conn_state;
-	struct drm_crtc_commit *commit;
 	int i;
 	long ret;
 
 	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
-		commit = old_crtc_state->commit;
-
-		if (!commit)
-			continue;
-
-		ret = wait_for_completion_timeout(&commit->hw_done,
-						  10*HZ);
-		if (ret == 0)
-			DRM_ERROR("[CRTC:%d:%s] hw_done timed out\n",
-				  crtc->base.id, crtc->name);
-
-		/* Currently no support for overwriting flips, hence
-		 * stall for previous one to execute completely. */
-		ret = wait_for_completion_timeout(&commit->flip_done,
-						  10*HZ);
-		if (ret == 0)
-			DRM_ERROR("[CRTC:%d:%s] flip_done timed out\n",
+		ret = drm_crtc_commit_wait(old_crtc_state->commit);
+		if (ret)
+			DRM_ERROR("[CRTC:%d:%s] commit wait timed out\n",
 				  crtc->base.id, crtc->name);
 	}
 
 	for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
-		commit = old_conn_state->commit;
-
-		if (!commit)
-			continue;
-
-		ret = wait_for_completion_timeout(&commit->hw_done,
-						  10*HZ);
-		if (ret == 0)
-			DRM_ERROR("[CONNECTOR:%d:%s] hw_done timed out\n",
-				  conn->base.id, conn->name);
-
-		/* Currently no support for overwriting flips, hence
-		 * stall for previous one to execute completely. */
-		ret = wait_for_completion_timeout(&commit->flip_done,
-						  10*HZ);
-		if (ret == 0)
-			DRM_ERROR("[CONNECTOR:%d:%s] flip_done timed out\n",
+		ret = drm_crtc_commit_wait(old_conn_state->commit);
+		if (ret)
+			DRM_ERROR("[CONNECTOR:%d:%s] commit wait timed out\n",
 				  conn->base.id, conn->name);
 	}
 
 	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
-		commit = old_plane_state->commit;
-
-		if (!commit)
-			continue;
-
-		ret = wait_for_completion_timeout(&commit->hw_done,
-						  10*HZ);
-		if (ret == 0)
-			DRM_ERROR("[PLANE:%d:%s] hw_done timed out\n",
-				  plane->base.id, plane->name);
-
-		/* Currently no support for overwriting flips, hence
-		 * stall for previous one to execute completely. */
-		ret = wait_for_completion_timeout(&commit->flip_done,
-						  10*HZ);
-		if (ret == 0)
-			DRM_ERROR("[PLANE:%d:%s] flip_done timed out\n",
+		ret = drm_crtc_commit_wait(old_plane_state->commit);
+		if (ret)
+			DRM_ERROR("[PLANE:%d:%s] commit wait timed out\n",
 				  plane->base.id, plane->name);
 	}
 }
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f09254c2497d..bb5529a7a9c2 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -363,9 +363,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		struct vc4_crtc_state *vc4_crtc_state =
 			to_vc4_crtc_state(old_crtc_state);
-		struct drm_crtc_commit *commit;
 		unsigned int channel = vc4_crtc_state->assigned_channel;
-		unsigned long done;
+		int ret;
 
 		if (channel == VC4_HVS_CHANNEL_DISABLED)
 			continue;
@@ -373,17 +372,9 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		if (!old_hvs_state->fifo_state[channel].in_use)
 			continue;
 
-		commit = old_hvs_state->fifo_state[i].pending_commit;
-		if (!commit)
-			continue;
-
-		done = wait_for_completion_timeout(&commit->hw_done, 10 * HZ);
-		if (!done)
-			drm_err(dev, "Timed out waiting for hw_done\n");
-
-		done = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
-		if (!done)
-			drm_err(dev, "Timed out waiting for flip_done\n");
+		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
+		if (ret)
+			drm_err(dev, "Timed out waiting for commit\n");
 	}
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index ce7023e9115d..ac5a28eff2c8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -66,6 +66,8 @@
  *
  * For an implementation of how to use this look at
  * drm_atomic_helper_setup_commit() from the atomic helper library.
+ *
+ * See also drm_crtc_commit_wait().
  */
 struct drm_crtc_commit {
 	/**
@@ -436,6 +438,8 @@ static inline void drm_crtc_commit_put(struct drm_crtc_commit *commit)
 	kref_put(&commit->ref, __drm_crtc_commit_free);
 }
 
+int drm_crtc_commit_wait(struct drm_crtc_commit *commit);
+
 struct drm_atomic_state * __must_check
 drm_atomic_state_alloc(struct drm_device *dev);
 void drm_atomic_state_clear(struct drm_atomic_state *state);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
