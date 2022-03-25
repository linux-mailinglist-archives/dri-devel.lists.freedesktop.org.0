Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA594E73BB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10010E48C;
	Fri, 25 Mar 2022 12:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D50010E327
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:48:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 982395C010C;
 Fri, 25 Mar 2022 08:48:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 25 Mar 2022 08:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=mO6smDmu66jceXbcw1658IGABdzuEU
 74wAO64Kl1IsM=; b=Z9tlta3XvtB6JkUQNm2CN6jCp3o3dEcAwlJUjCxb7oXHTY
 EONZ8eHWKBZbg1Z1lEcrCSlKrphs/aAwADIjNIPs/M2Ob7z0LLQYALys+D/UG78G
 1iA/oNCqOSO2M1xMlds9g5EiWUBgz7fpOVUPK5uhtdVnh6bYFaLCGjG8Vc7TwcUm
 sJoMbci2fndLsJqVn17Cpz1SO/HagdQnv2AP0VQcUhVZpeK57Pr+DLPzoyplwypH
 lkJgpDhEexfHEQAu0Ml1upUKT7D0tjZMRPKJxqxbMsY04ZP0MVEDwTWHML+pLVLn
 QR2u1Ux4z/xYpQPAV2Sd/Z8EK3R/F6jo5EbfxAqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mO6smD
 mu66jceXbcw1658IGABdzuEU74wAO64Kl1IsM=; b=nZr7x/hGIqqmyubdvLv1jc
 X9Y2EYG1RzjXmd+5pzahBd0alj3J9O5Ge0syo4xsQlqYJojjO8NLQPe2b7Sqyltz
 BRheB+rciuVhkll2XoBsYck3kBW2EFDlqkG1YNMMagAvX43e1YoSPIKNiM0tgTXW
 vDeE4DM2GB3VAR4m0jZUjdoafHkIdc7W3ISUkQN7G4g8Y6kQnILJK6xQhnlIEjsz
 /W61VGsOjLgk9gr/4BS6sycxWYfZeiWR/7E6ol71zoMueeDzy7GTbZKWKGXCzklj
 oAYrxlPLwkDlf/YLU5VAGz8yLGrDS0WnrTQ/bkOta+mBnnZtE5Ab54UcqMA9MPyA
 ==
X-ME-Sender: <xms:G7o9Yp9uDxDxU-ctogMUhYXWX58DgGp1gQTLafobR4JdFkg__U9AUA>
 <xme:G7o9YtsPf9hTwoUrHpTIiyPlpQlLlkzlgpVWw9dfNzzLjxp0u9hfyTuigQ3dPDyuE
 I2X1XJERanHz-LaSFI>
X-ME-Received: <xmr:G7o9YnDanNVC9jY3QfLEtoE6XHhPgT9ZkkliCaKzmipbo5I4OeA5eGGPkRf4qr2MmBgrlyWkXDCuFSnJG_PKzBOLh-VHopTPdvd-Ezk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G7o9YtcNLaSNbbdKt7ULbUEMUQ2Bd_IBfaOag1vTstzTK_FwTqJdWg>
 <xmx:G7o9YuPSFdLCDE15w-ANzrgTwsOD-E57QTxXsKXwiO3xjvISyxBQRw>
 <xmx:G7o9YvlY7dKtL-wGxGiI4ceWvDGi-SdnkAfWNloQ38aQN3VejnZBXQ>
 <xmx:G7o9YqC5QZ42wIuHam6SUnDOesz35ygP1QT1KvvvUd0Gm1LcgVjGsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 08:48:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/atomic: Print the state every commit
Date: Fri, 25 Mar 2022 13:48:19 +0100
Message-Id: <20220325124822.1785070-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325124822.1785070-1-maxime@cerno.tech>
References: <20220325124822.1785070-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_UT_STATE controls whether we're calling
drm_atomic_print_new_state() whenever a new state is committed. However,
that call is made in the drm_mode_atomic_ioctl(), whereas we have
multiple users of the drm_atomic_commit() function in the kernel
(framebuffer emulation, drm_atomic_helper_dirtyfb, etc.). Similarly,
it's only called for a blocking atomic commit.

This leads to multiple states being committed but never actually
displayed even though we asked to have verbose atomic state debugging.

Let's move the call to drm_atomic_print_new_state() to
drm_atomic_commit() to make sure we don't miss any.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c      | 4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 88cd992df356..73865c147b4b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1423,6 +1423,7 @@ EXPORT_SYMBOL(drm_atomic_check_only);
 int drm_atomic_commit(struct drm_atomic_state *state)
 {
 	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_printer p = drm_info_printer(state->dev->dev);
 	int ret;
 
 	ret = drm_atomic_check_only(state);
@@ -1431,6 +1432,9 @@ int drm_atomic_commit(struct drm_atomic_state *state)
 
 	drm_dbg_atomic(state->dev, "committing %p\n", state);
 
+	if (drm_debug_enabled(DRM_UT_STATE))
+		drm_atomic_print_new_state(state, &p);
+
 	return config->funcs->atomic_commit(state->dev, state, false);
 }
 EXPORT_SYMBOL(drm_atomic_commit);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9781722519c3..45e6d3c62a9a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1326,7 +1326,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
-	struct drm_printer p = drm_info_printer(dev->dev);
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1458,9 +1457,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
 		ret = drm_atomic_nonblocking_commit(state);
 	} else {
-		if (drm_debug_enabled(DRM_UT_STATE))
-			drm_atomic_print_new_state(state, &p);
-
 		ret = drm_atomic_commit(state);
 	}
 
-- 
2.35.1

