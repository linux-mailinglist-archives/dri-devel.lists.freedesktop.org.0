Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F072DDF95
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052038999A;
	Fri, 18 Dec 2020 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FCF6E40A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 14:43:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8B634A0B;
 Thu, 17 Dec 2020 09:43:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 17 Dec 2020 09:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=yeupcRPWasD9DEjSfM0xTub9ka
 MjUkG2o7HbedYbq0c=; b=JJaT8sm9kJUl3gtkezl421xRCU2nkhAzkAfJPc9MjO
 ie0/31Roi90TF9sdrovliQzkIcFLphF3O3e1ep6iVDK4nTNXvrYUJsuDyxc1lkVR
 WOwqosw4kk5Ohr1ZiQvty84ExRyB7eHxPRLSvgWanGWy4U5UXTkSyUEm08YJ+Urd
 T0jFzYwROAu12C4Xp61psg/uITV2OmHSmjLn+kqM2g4mXEIrlCVO0rlvcyIS+QY8
 GFZ0arEZ1iYeFrjtoUb0KZwESzfAESBsvKsB+M2DxgHE+naUd9KAJJfigTKdn9UE
 hNDtxaGW6Sk//YegQ3RKPkrIKeJsIVijew+vAmQuHTqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yeupcRPWasD9DEjSf
 M0xTub9kaMjUkG2o7HbedYbq0c=; b=I/uYO5FTj3qKFmBMm+kojgqzLcxXRVU9V
 EbkyuRNnVI+ym6jXd+esI8IIUbgKKTRLqt5A3F3LHk3+oGuIF/CSKLD+kWhsUtbM
 jdzGI+9pH9d+hbKW45k5fJYuE1xUV+vyACC32fnMpsmnr0r8OSA2ah7Bg3VHZVa7
 MYzIUzFfPOg/QipeoA7GBe9TsRy8uvlCA+hJww069iV2FOWOEmD0Hm5V54C0Tu0t
 PvfnQdz/BUR/XXlkXOatlflVcYnJqn3dxEVE1GatvhyYTRJPeEOFgSyPsfTsGG/6
 qQFWVj0Ijt0HCx3sYvdxxB4Lijy+fb7a1Iu83aZI/akRLAOC8gUtA==
X-ME-Sender: <xms:oG7bX_8gIP6T5TDSgFbI-8wuxa8SJ9cLTSGGCNleirCVsESn_eCyew>
 <xme:oG7bX7tCXeYemsqkg918gzyTD7pzS_LQqhMfiqOXH33qrmvETRSXIBlQoVVPLfnDg
 PtSsiN4oJocICKr3YI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oG7bX9DDbYXpiVR1ZtiIcv4UgPHGBNGWC74D5wKBHAkLBEZhY_nAnA>
 <xmx:oG7bX7erTJZYl7nNsrJF0vOGV-SOXRRKigQdVk_8XMKkIdVlRndVxw>
 <xmx:oG7bX0NL4xujy7DtZSx8UyWYerO6z4VLd-ImG5BJhQ5TMWTeKeJ-lw>
 <xmx:om7bXxrqneYj5As0ldV2KyHvYTZvTFO7bD5F0ZaZ8vmLH1BnoeoGxQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A95D108005C;
 Thu, 17 Dec 2020 09:43:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm: Introduce a drm_crtc_commit_wait helper
Date: Thu, 17 Dec 2020 15:43:42 +0100
Message-Id: <20201217144342.217005-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c        | 39 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c | 61 +++++------------------------
 drivers/gpu/drm/vc4/vc4_kms.c       | 17 ++------
 include/drm/drm_atomic.h            |  2 +
 4 files changed, 54 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b2d20eb6c807..e2ab6564535c 100644
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
index ce7023e9115d..79ef992c433d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -436,6 +436,8 @@ static inline void drm_crtc_commit_put(struct drm_crtc_commit *commit)
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
