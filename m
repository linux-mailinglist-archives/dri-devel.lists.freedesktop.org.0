Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376C35C683
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5617C6E588;
	Mon, 12 Apr 2021 12:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFD36E588
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:44:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id v6so18751982ejo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xrbT3X+z27jY5oY3DhIJgQi+dRZPPf+4KdDWNNrxL+Y=;
 b=kYloPyOadd4AgvV4UDeYTxu6q2VH26mX1mvW54hkc5IEIXeHfvBUJwKYUVDPieAB47
 EZ2jDrFPfDGuV6Jp8irVyW9cryWoYjWFDWlof5t4n5SENDHQ+7ihMbugs3KYOt4kpz1g
 OFLjOUuFcsUrpKz5g1eNhZD2v7Hl6GS4rLOHbc4XPdPrybh9K/+dhb/lCYpw7SHn7kHS
 dt5g+Cu0QLwVONYzdURiOCJUwZ8tnlRbfyOkaCEOZeVgD4sGUyDN/hDA3JeswPeJwqUY
 1OUto8+/v4ijlAiSodPVEW3DxXLKqVIW2TEBCLnAkMLdP6suu/szXQor5Y4H0O0W17lz
 Jqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xrbT3X+z27jY5oY3DhIJgQi+dRZPPf+4KdDWNNrxL+Y=;
 b=ZzHO/wLsSYZGgFbY/bJ8DfcbwXc5s6tL/ZuzraPi4zL6R3t8bELxI2/qccr84c16Ff
 Lmq+aOYiN3M45SB3myPLTq8ZxJ2Cy7D6zmLNVovSmZiBMrYzTEPbw7O/NVLvQXCmnbzW
 uCc+hkGYxvm7w19qq7FwHxTIQw6xqYntAEPYnsCg+ekPTjKe/IGtw6QQtxvzOn4fD5BO
 7drDyqmyslY9LDyFk0cK7UkNn4Eyfyq1Q/HCVuW1Phth8zyLUqxC+RT3P+rNTgsVsPkG
 H6fx/oUpWpeM1xwLFV6Adyxg5xpEiR8O7Pte+VWYHzHXNShh+AiK+xQC14b9rq+Hzm1Z
 gLZw==
X-Gm-Message-State: AOAM530/XrjkCyGuEEh21u2PPOztQCOC2Trl76dbfY5JksHM3nyIQ/Vp
 rNokQPHzgzglkQ8jXU3e81PbsdVVTsDgxovB
X-Google-Smtp-Source: ABdhPJxq6jKlsrKz8Xw5ztCvDWUswFUo7CvzNnLHr9A62duLzbdtKgMbWFG2AgCZmk8YNhF83j7ngQ==
X-Received: by 2002:a17:906:944c:: with SMTP id
 z12mr11537616ejx.398.1618231439672; 
 Mon, 12 Apr 2021 05:43:59 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id m6sm5939452eds.49.2021.04.12.05.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:43:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 2/2] drm: drm_atomic_helper.c: Correct comments format
Date: Mon, 12 Apr 2021 14:42:16 +0200
Message-Id: <20210412124213.4628-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412124213.4628-1-fmdefrancesco@gmail.com>
References: <20210412124213.4628-1-fmdefrancesco@gmail.com>
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

Changes from v1: Rewrote the "Subject" of the patches in the series

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
