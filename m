Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CEA35C618
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4E6E55E;
	Mon, 12 Apr 2021 12:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AFB6E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:21:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z1so14805352edb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IwBxglF+iN+OFUDTNg+emf1SfZYsVOLjYrDjF4LE0F4=;
 b=jCzBywVopnhF1mSPdpmOzIrgIU4KUb+iWPFuobsxnANfwyyiVcoLs+NOj+e1SurkTs
 +ltUytF7W9pA0UJDDSc/mtxkR8hvTeUVZzsiqK96aoTFYHrR+ke2zvtoZLwvjLcqxyAf
 wwEwSkOUh9T7Ew9tcQtVhE8m00coPV2L2USpbQx31gaeV4QTZnla5ao7Y0ksunF9LNA3
 sPEXb1B8Vl/+9ZGst2zE74SCyjz14+PtOZ5uEXEh24J7l7n1V9q/fB1FZWODUo1pCyWY
 sQ8U1tlFwNQSDYNjpfBNdtjbMyakgRGyclpS6HP7tid/Z365EyfqD++1D5FVdg+Hpw0s
 jYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IwBxglF+iN+OFUDTNg+emf1SfZYsVOLjYrDjF4LE0F4=;
 b=KDEnPc81D4Gx5ioDWf1xsqtwqNr2vxMXXVRayRe60xJw+u7HCKLdYICEHCvsgDyroo
 glLhqr+BJBOyhjblAnEhIrZ0iu8BOoDRlszMUQm6Ulo6lW3+PxZPgG34cSxbg5+2Qx2p
 kuWPM2cRyiLWfjrAWprQy8EO6jo9DWXUyShXXZs4lAxCEdCdfc1Q/J5SPvwBfoO0Jif7
 erZfuRD6aSBF0AYWwlypT55MINFpCF8Ybnambi7HZJdxsai2YQPrF/n7i8xQdGwxAh5a
 SpRKDm9NGcAWfzNoTqS1RevnGH+X8GVU2ArQcX73a8DgA4MuckB4L4dS0ddB6CrvdRIh
 LPEg==
X-Gm-Message-State: AOAM5304A13OQ5EVJCXPWuwwUdVs+X/vEeNGU32EAalNEzFUgQ2QeIEU
 qvBrl3Mi2MRJ1rqSS309O+crWdg0yTJ8Pot0
X-Google-Smtp-Source: ABdhPJzS7vLk0dDuapkR7+L2zxeWMUWLhiEJ2ABtm4qhto0Y7QDFHiKUabQT4npuhPYayU2HHAJkJw==
X-Received: by 2002:aa7:d78a:: with SMTP id s10mr28534045edq.226.1618230067832; 
 Mon, 12 Apr 2021 05:21:07 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id ck29sm6408191edb.47.2021.04.12.05.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:21:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>,
 "Melissa Wen" <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH 2/2] gpu: drm: Correct comments format
Date: Mon, 12 Apr 2021 14:20:56 +0200
Message-Id: <20210412122056.28351-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412122056.28351-1-fmdefrancesco@gmail.com>
References: <20210412122056.28351-1-fmdefrancesco@gmail.com>
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Corrected comments format in accordance to the Linux style guides.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 32 +++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cd748ff61162..bc3487964fb5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1018,8 +1018,10 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
-		/* Shut down everything that's in the changeset and currently
-		 * still on. So need to check the old, saved state. */
+		/*
+		 * Shut down everything that's in the changeset and currently
+		 * still on. So need to check the old, saved state.
+		 */
 		if (!old_conn_state->crtc)
 			continue;
 
@@ -1409,7 +1411,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
  * @dev: DRM device
  * @state: atomic state object with old state structures
  * @pre_swap: If true, do an interruptible wait, and @state is the new state.
- * 	Otherwise @state is the old state.
+ *	Otherwise @state is the old state.
  *
  * For implicit sync, driver should fish the exclusive fence out from the
  * incoming fb's and stash it in the drm_plane_state.  This is called after
@@ -1953,8 +1955,10 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 	list_for_each_entry(commit, &crtc->commit_list, commit_entry) {
 		if (i == 0) {
 			completed = try_wait_for_completion(&commit->flip_done);
-			/* Userspace is not allowed to get ahead of the previous
-			 * commit with nonblocking ones. */
+			/*
+			 * Userspace is not allowed to get ahead of the previous
+			 * commit with nonblocking ones.
+			 */
 			if (!completed && nonblock) {
 				spin_unlock(&crtc->commit_lock);
 				DRM_DEBUG_ATOMIC("[CRTC:%d:%s] busy with a previous commit\n",
@@ -2103,9 +2107,11 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		if (ret)
 			return ret;
 
-		/* Drivers only send out events when at least either current or
+		/*
+		 * Drivers only send out events when at least either current or
 		 * new CRTC state is active. Complete right away if everything
-		 * stays off. */
+		 * stays off.
+		 */
 		if (!old_crtc_state->active && !new_crtc_state->active) {
 			complete_all(&commit->flip_done);
 			continue;
@@ -2137,8 +2143,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 	}
 
 	for_each_oldnew_connector_in_state(state, conn, old_conn_state, new_conn_state, i) {
-		/* Userspace is not allowed to get ahead of the previous
-		 * commit with nonblocking ones. */
+		/*
+		 * Userspace is not allowed to get ahead of the previous
+		 * commit with nonblocking ones.
+		 */
 		if (nonblock && old_conn_state->commit &&
 		    !try_wait_for_completion(&old_conn_state->commit->flip_done)) {
 			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] busy with a previous commit\n",
@@ -2156,8 +2164,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 	}
 
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
-		/* Userspace is not allowed to get ahead of the previous
-		 * commit with nonblocking ones. */
+		/*
+		 * Userspace is not allowed to get ahead of the previous
+		 * commit with nonblocking ones.
+		 */
 		if (nonblock && old_plane_state->commit &&
 		    !try_wait_for_completion(&old_plane_state->commit->flip_done)) {
 			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] busy with a previous commit\n",
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
