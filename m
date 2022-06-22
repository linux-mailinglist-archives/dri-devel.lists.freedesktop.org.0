Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A0554D24
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57051112970;
	Wed, 22 Jun 2022 14:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102F71129D0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D5DE0320016F;
 Wed, 22 Jun 2022 10:32:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908376; x=1655994776; bh=fQ
 RTRNn/ai6iCKFULdZha93FoNv1yXNGLFXu1C+BOX4=; b=A0Rq+4vl0k7eN99EaA
 1spWhHxn1xXQCHsw0V5kh0kKE6nvs26JWxZg2jua3NdIkeKyBm60gJ4XZLxbzYBj
 /p7JGkT/V6Wqups+dBu9LjU6fsZ8yCWTX/7rSKCZ1d8g9rtwOJ3kznRyBqgYFUpJ
 BRrQQlRgM0m44v6iXOM5FybAVzuGKkIEtzJfunoxxu6updhxE+K4q77GLs092I0r
 aujCJsg0q7XTP9rkbdjTz2qOTkSFlycL9IoewNuOrvR/uqQzB64nqk/rxFaybqUQ
 QiaFsL5gSsHSz9EcNTLy6T74p4jGOcFI12wQSv6FS9pOmCqdR3DsBsHecRnftcHi
 ChJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908376; x=1655994776; bh=fQRTRNn/ai6iC
 KFULdZha93FoNv1yXNGLFXu1C+BOX4=; b=mJVPXqaIv5n+AZQtzJVCQZAePZb1G
 j84ic6SfMtyKnuMmsOm6vr3N6dSEpk1NmrRWmKuNOi44QMT7H5sDjxIqxGYTjWYM
 Nf0bqMiKc1RPIwVNdn8nmtLBkaLH0u4NEJOrNyVLRDrD6YNclNvcwW7YfBnIfiQU
 Mb1h1mOtn8tCXA/1FZnorTmvbmxoVuRgz1UTmBn88hFpgTRIZuIAp9RMTZNJVUns
 64VtJ+u3qGOCu9ZzznklG/wTxw6lLdkr+HPZyN6L0MzJhvMN0U8Dipd6XAAQlN/3
 aBwON+qV4M1i2/gWejdsfNVVjQxJ08sbyM/uYDjji5YQ6uN1OjRtIRs8A==
X-ME-Sender: <xms:GCizYq1hoNY6wh48qo3-0V0fV2yRQBnqZFIbsTnqbYKMYLEpSljK6g>
 <xme:GCizYtEgfdNAQnUzyaah7fbd8GjpZtREw_K84bb1hl4FseAmefOuIV0f4ttNTnIVu
 kUlJk6cf03gzHj7qCA>
X-ME-Received: <xmr:GCizYi4Xz-2rn1231gbUZCppc-Q_GtvyUhgIokhm8hpsbe6L75DMwraPM6H-59AS1ReAwTyEHdulNGpSm4aiLhnFn1ht3EgoWJb6fUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GCizYr2eS9cB6tCXADdVJpmyzyxRVe3Ljnlgb_Y-mkMUHtIMeJ-TgQ>
 <xmx:GCizYtEoUBQJ1-EK4WchK4neC01UWDBcv-gXCo5JSAlOrbns3Ij4OQ>
 <xmx:GCizYk_DXwqUNnIm5LxliY82gujiVu2_-_aQCiuMSzgYreR_wCZ2sQ>
 <xmx:GCizYhg_i8E279pwsIQ8etc0Fb2bXXiMyJ0iVAGirGaxEeWXMJJUlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 13/68] drm/vc4: crtc: Create vblank reporting function
Date: Wed, 22 Jun 2022 16:31:14 +0200
Message-Id: <20220622143209.600298-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
index 9355213dc883..49ff0506e551 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -539,6 +539,20 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
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
@@ -562,14 +576,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
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

