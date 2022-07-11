Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812BC57090C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D76B90300;
	Mon, 11 Jul 2022 17:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F5D902F0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C2F685C0164;
 Mon, 11 Jul 2022 13:40:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561207; x=1657647607; bh=gf
 T0Mc/yxo21gJxJooNInyII+AhY4HXW1+9Gy32zBZo=; b=KtTzVK11TA78RGR9+G
 WMo5SoXQIwKHl8++2/DQ9eqe+IYArN5kqP0kyogMwU2a5aMSBpDI7jaTVEDHHsG1
 kSVO1Sn467UJe1Z2J9w1QD5KhT5SbsIzx4WcfrJTO0grtFWDWGqSWqOGJMRKpbqC
 UCDwvI/NGNT23IyqSBodUZBW6PkCARsrWMlkIHZ5Le29NA+UYCttPg/3jt2TylFO
 YyCtBIRybt9tLBktHE7n+83NFOsz7bCIVgP57MzDjzR0bN4U5/rd5ARech4wTbjI
 ACGvB/ad4B3bV3J8CHBwV6QdKwuD1eCGLc50OjXWWzfVz0Gr8v63Q1hlCZ16nyE8
 LZNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561207; x=1657647607; bh=gfT0Mc/yxo21g
 JxJooNInyII+AhY4HXW1+9Gy32zBZo=; b=JxA4aU0D4Ay4JBcPccUpT2ZEFoeeh
 dgXrXvjO9BK/HUtd7LvQqXJouJHw3gO3bKejjxFxJfNBOS4Vse75xzx0gl6spLGH
 emQaYqPoIewomemxHIkKeW8c+2+CK9MZFAWGXqQpahW5F0uEEcsLru3/E/8OmwNs
 iyPFpkJZUjfkbBJ10DCSbSWSXg9P5gEqxHZoHS+gzbXHZMp/JnUMLJz3IR878APt
 Cpf39jIvrku6+W9F/yEXPPaQEscxwbDSU85zvqEJ03sqKk24opHYe9k//Wagj+J7
 jEJiJZ9Q1GxoHu8PePcdxC4HHtURdWN8vVaoKNtQjp8cqMiukSv3uPJBA==
X-ME-Sender: <xms:d2DMYp25uo9fe8NtP-zG4D2O7fyyeLFKb1asu5AhTyPn5lyGgBpScQ>
 <xme:d2DMYgEy9n9DdTi0Tzc_3JnNkjwOtujHlj5p2lsJ1J5iv7ldnZhtXHuYe8xDYGxJj
 of5tCis1pvO3dmyM3I>
X-ME-Received: <xmr:d2DMYp6IDJuZldzgTWRXjCXqRorEr33Z1oHltEB8Q4vD06hJ07a8Ftj1JftqkX1jru7Ik55YCBQBlmm-cQblXS2WO9xTg6n_811qbdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:d2DMYm2Ln4F8UDUx2fK6aa4y61wiP9yKl5TxTnBmt_aZdy39YBAvug>
 <xmx:d2DMYsEP8tIh9RXYKodPGhVqmvfJSDoQO-5VmD9zt8IoqQBUN9eV8Q>
 <xmx:d2DMYn-3CrBC2vwl1oNnwL34x71tnO2pN5DQ7lA33fuhKZmR0G1-cQ>
 <xmx:d2DMYoj1-CZbjPo84Dcv3atBlJzgMdCDx6a5yhLJmWPM80rXbTU1SA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 14/69] drm/vc4: crtc: Create vblank reporting function
Date: Mon, 11 Jul 2022 19:38:44 +0200
Message-Id: <20220711173939.1132294-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

We'll need that code in the HVS driver, so let's create a shared function
to reuse it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 23 +++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 029be98660b3..faad9e564772 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -544,6 +544,20 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	return 0;
 }
 
+void vc4_crtc_send_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned long flags;
+
+	if (!crtc->state || !crtc->state->event)
+		return;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+	drm_crtc_send_vblank_event(crtc, crtc->state->event);
+	crtc->state->event = NULL;
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+}
+
 static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
@@ -567,14 +581,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	 * Make sure we issue a vblank event after disabling the CRTC if
 	 * someone was waiting it.
 	 */
-	if (crtc->state->event) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&dev->event_lock, flags);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		crtc->state->event = NULL;
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	}
+	vc4_crtc_send_vblank(crtc);
 }
 
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 950056b83843..de326cf10564 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -862,6 +862,7 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state);
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
+void vc4_crtc_send_vblank(struct drm_crtc *crtc);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *left, unsigned int *right,
 			  unsigned int *top, unsigned int *bottom);
-- 
2.36.1

