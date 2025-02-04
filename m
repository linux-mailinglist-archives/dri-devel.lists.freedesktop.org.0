Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E954CA2751B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A2B10E682;
	Tue,  4 Feb 2025 14:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="POftEWL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80510E682
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F5F55C68A3;
 Tue,  4 Feb 2025 14:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA776C4CEDF;
 Tue,  4 Feb 2025 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681189;
 bh=Ln3xQNtypHh6CSFXfBuZpufWLNToI4kD0XuPctFd5Oo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=POftEWL80k69QJnsQmakNsehgSEsDIqNu9A4yqs/HLy0Q1k3rgsdVPHDrhO9Tk/Sa
 5xPzveI0361QSdvq50t4+F/54L/FWXEsc/Lk5Sw3JNr7A5ODsjZT4Tq2oo97CPaBCO
 ZlPRLiFGirpDW/mNYhfIQ9BNeb9gW3tb3UQ3EVjT4Hq7udLaZuw+pbdaDPqYsmukBa
 Pn2nR6dBSOEokHPh3bhqDi4etEFOFtI+Y2h/RZXHTabg6wPiH5XQACWuOZco/y/ceQ
 eQ/aCe1oaWdOJ3lOzXkkdmtkH8G4+vQIVyLF0HPJXQ0SvAlsVdLVgr6NPB1+cuhKbA
 feJOXfLR3bwtA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:49 +0100
Subject: [PATCH v2 21/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_fake_vblank()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-21-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ln3xQNtypHh6CSFXfBuZpufWLNToI4kD0XuPctFd5Oo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD6tdhNVmvNGbd1D3/RQroMWrwXXvnN9GOwv9Tl5/
 t5Q1j0bO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE/oky1scxiGxZ8j11yx7L
 uQpKrs8WH4tMUzUQ+b8995jZn9eGj4+Wt9hcjPm4ycTm+fFiZ/WWJMaGJR9N2zQ2yLy0ORR7qcb
 BQnK9/IRnK7vqeH7PrasWlnx4nYMvxDZaaU62zrU290lK4UwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_fake_vblank() fake a vblank event if needed when a new
commit is being applied. It takes the drm_atomic_state being committed
as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cf859fa0110ad1154021e970dc262387cf3eb0c8..78bc540158b7c64129eb728d8f8d67a6797bd0b3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2460,11 +2460,11 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
 
 /**
  * drm_atomic_helper_fake_vblank - fake VBLANK events if needed
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function walks all CRTCs and fakes VBLANK events on those with
  * &drm_crtc_state.no_vblank set to true and &drm_crtc_state.event != NULL.
  * The primary use of this function is writeback connectors working in oneshot
  * mode and faking VBLANK events. In this case they only fake the VBLANK event
@@ -2476,29 +2476,29 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
  * VBLANK interrupt.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_fake_vblank(struct drm_atomic_state *old_state)
+void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	int i;
 
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		unsigned long flags;
 
 		if (!new_crtc_state->no_vblank)
 			continue;
 
-		spin_lock_irqsave(&old_state->dev->event_lock, flags);
+		spin_lock_irqsave(&state->dev->event_lock, flags);
 		if (new_crtc_state->event) {
 			drm_crtc_send_vblank_event(crtc,
 						   new_crtc_state->event);
 			new_crtc_state->event = NULL;
 		}
-		spin_unlock_irqrestore(&old_state->dev->event_lock, flags);
+		spin_unlock_irqrestore(&state->dev->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
 
 /**

-- 
2.48.0

