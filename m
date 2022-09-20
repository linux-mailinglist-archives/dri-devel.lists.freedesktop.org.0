Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D95BE7C5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0BF10E52B;
	Tue, 20 Sep 2022 13:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8710E1B1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:56:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82EB021BB4;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663682181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7PFPcHbjcwYVUBoLskNXQkvYIvEyjtxsQmzR6amJHg=;
 b=SYSl7YM/f8bxZ6g7jeVCAzvSzElfb7u3xWDjfFqS6PFUWbsnTj76r3y73HVmSmiZ2xnaoK
 dVqrjnqOFUV4rCS78htSKQyguYZ5whAq7CZ83LopWHKVO75Nf7fIlNtcY/memoFWulqbsF
 P5nxquu9CWdVQAzTwTlCBm/Ui2fXEZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663682181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7PFPcHbjcwYVUBoLskNXQkvYIvEyjtxsQmzR6amJHg=;
 b=BF3BohZJkf7+hbWdktlO5unknBBt4CB4nPxo6LXAcDS86Remv7UxZszihqrYi0vE1zkdmE
 wHx+HMVorpAqQHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FC5F13B11;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uECCFoXGKWO9BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 13:56:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com
Subject: [PATCH 1/5] drm/damage-helper: Style changes
Date: Tue, 20 Sep 2022 15:56:15 +0200
Message-Id: <20220920135619.9209-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920135619.9209-1-tzimmermann@suse.de>
References: <20220920135619.9209-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename several variables in the damage-helper code to better reflect
the use of old and new state. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_damage_helper.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index d8b2955e88fd..4b1f26ef119f 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -53,7 +53,7 @@ static void convert_clip_rect_to_rect(const struct drm_clip_rect *src,
 /**
  * drm_atomic_helper_check_plane_damage - Verify plane damage on atomic_check.
  * @state: The driver state object.
- * @plane_state: Plane state for which to verify damage.
+ * @new_plane_state: Plane state for which to verify damage.
  *
  * This helper function makes sure that damage from plane state is discarded
  * for full modeset. If there are more reasons a driver would want to do a full
@@ -65,20 +65,19 @@ static void convert_clip_rect_to_rect(const struct drm_clip_rect *src,
  * &drm_plane_state.src as damage.
  */
 void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
-					  struct drm_plane_state *plane_state)
+					  struct drm_plane_state *new_plane_state)
 {
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *new_crtc_state;
 
-	if (plane_state->crtc) {
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
+	if (new_plane_state->crtc) {
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 
-		if (WARN_ON(!crtc_state))
+		if (WARN_ON(!new_crtc_state))
 			return;
 
-		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			drm_property_blob_put(plane_state->fb_damage_clips);
-			plane_state->fb_damage_clips = NULL;
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
+			drm_property_blob_put(new_plane_state->fb_damage_clips);
+			new_plane_state->fb_damage_clips = NULL;
 		}
 	}
 }
-- 
2.37.3

