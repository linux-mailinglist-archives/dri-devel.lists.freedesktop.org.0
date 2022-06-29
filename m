Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586855FFF7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130E114A602;
	Wed, 29 Jun 2022 12:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5ED12AFB3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0DBAE3200956;
 Wed, 29 Jun 2022 08:35:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506156; x=1656592556; bh=AF
 qF2QY+jaPNe/LA22MD05E61Qwmc/2vdg0trfSt9S4=; b=Jnq6nzdToTMJuSE5OK
 L3Cav4A1tv/XlFv8E3e0e/KnsFuTv5yc2I/z3j3tfiCfCvPbIbGPlhu1TdTwEVqv
 2ZHYQGhWf8ZY7u7RaYQ6FzjpVzUiX6ZXtJ7SpT8y6ZdtPX7Fyjq9E+fvIMIw/AB0
 MNyjJKp2OyH7A3Syjk8tEOoWZr/HZJ1cb9dlfcZzNidEiknvYBUETOQTao0PTKrw
 BFz0pbWPUNXmyRIE9e4hDHBqMX7VkFCOYpk8Gis6xmDAKkABtFFrfqm2csSWM5TQ
 A3IDF3zGhU0CIA4QtUlC616lVfFuNaB766zJji/A6io+vm8iKrQwtVgLOxRqZXU+
 6+Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506156; x=1656592556; bh=AFqF2QY+jaPNe
 /LA22MD05E61Qwmc/2vdg0trfSt9S4=; b=nCW0zsv51YQKUttI+TmkfeOV62Xof
 RuUlQ467H1A4c+RZa2B+duMgmXpUrBIBoKhdszWCrawl0Cv8B6w5y/ulWilO/AJD
 z1Hp6yWvxCNzsVvxx/iJpV4z0MO78pWTwnNE8qpgWOhK2JhyGww7dDQNlgnC5gOU
 +41351IsF+vn3zMIfg01boqX18yYonbXmzUDDd3rrlzfuXoHJfiO/P7fPixfZPC5
 0GsU2AXXHGmBZepFRg/bh1Zkz29MGbPCkxhdnS8KYa4Mi9JQDoWR5bQRP3IYTYbr
 N1ibAUg0bV8LKFb/fIbZ5AGOLVxFZAmuIWeqd1dNI3SaEJDzgSzbnsOzw==
X-ME-Sender: <xms:LEe8YqcF-fpnPQfTeFONc5PlgPkCRhs6xmbJK8VWX8hg4-tkGlKing>
 <xme:LEe8YkOOBefFuk7cYXo0biuyXkeep9HdiDKHXGfAJkOAxbNGtpQ-xC1mGn_X9N_Mq
 FIcWJwrlYa_3-dAJec>
X-ME-Received: <xmr:LEe8YrgcUpI66tDPbPCnir4DmRAPCjoc05nY-QCDoH3c9DEVXqoF4efPFQhv5P055U8UpUnO5lUXMTsJJjLWTDdLo7Pt9jNJ1lx4fLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LEe8Yn_2RmHu9okGPPcXkYkt6ygPNHWV2874sHuYzdS4rhQgiX31Pg>
 <xmx:LEe8YmvSBMgThOJZCWCQ4xSswcdJgGZC4R3uH11VF4dkMyAryQ09Hw>
 <xmx:LEe8YuFVpMTu9TeOsklTfV7wgtjBA2YHfo5zyTIXn5jtwq-uhxQLTA>
 <xmx:LEe8YoJuTxmFBXHH-qMzZpqtzktcUUXFXa4-OVaGC8RZFvZrdEfvyg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 14/71] drm/vc4: crtc: Create vblank reporting function
Date: Wed, 29 Jun 2022 14:34:13 +0200
Message-Id: <20220629123510.1915022-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
index c48a73914200..da52d1e0c7b5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -861,6 +861,7 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state);
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
+void vc4_crtc_send_vblank(struct drm_crtc *crtc);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *left, unsigned int *right,
 			  unsigned int *top, unsigned int *bottom);
-- 
2.36.1

