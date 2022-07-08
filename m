Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BD56B624
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F746113833;
	Fri,  8 Jul 2022 09:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C956511382F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A073B32009AA;
 Fri,  8 Jul 2022 05:57:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274272; x=1657360672; bh=gf
 T0Mc/yxo21gJxJooNInyII+AhY4HXW1+9Gy32zBZo=; b=OxCFZMv13IRhOHdTsL
 mGJw/5HPeVTE3/cMniOJDzD1dpnI3bcMk/LH/n5OlWvaJEO3GgXeWnkYrDEZocyr
 jnO7qcsvFzlY9YhKX9as6G8rcSg90s1tNOJnM6OGcp18Bff2K2RGXu5AFMGADciu
 K8OC+xRaQ+9921k4U6yNV3snX14fRy8H9bXnlEns23g7CYMSjcLIUdrDqqETuVQK
 9wjTepw/SEV9xSVj6j1XqfFBesfB/0DLKfS8IIMxW71RXzBbKy5cUe8IcFWou1Rv
 UzNxpoe9GyERvzU4I6pLSt39Q8+9Z9s39+vP3y6XX0fu9IAYqfdXsRvt6fMaHBkO
 GggQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274272; x=1657360672; bh=gfT0Mc/yxo21g
 JxJooNInyII+AhY4HXW1+9Gy32zBZo=; b=Xs4ruCuyVt2aVI58N34Us9ZulOTKa
 ccLVFwxeqaBD1lMdnbUpvm0Ys5jENUwuznakHo6fbhYvylNRBnES36scbztJhqHH
 1Wp4GLGoE5WnyzfgFPL60tky+YKKdbYzqrVnXJua2cvxvbhQrj49645WHJumKOOo
 Pe/yEf+HSDM/Hd3f3EkET5Uknpqq2GAnYyQ2YQ5SJbxK6rj4szU/iLRdMVFOXsbT
 B+2/gpUxIeEWAUtrdkmdYqdSfqRP41idvNFvp8Cz1asyXkh/KakUt54uWVks9BET
 di9YYidjOafC5hkFkxM9sEqx02X/R/lWZm+QVGFOKicjAD0EtXh7GcdCg==
X-ME-Sender: <xms:n__HYiU4xDzl4a1ZYexUyF6UCbVzptz0GezJ6wO7OT_LlBz3rM_-Tw>
 <xme:n__HYulBD0qAL5gvVwEc0eL1PDmCKw3ywFSB4iHsswT7t-7LihG16OeVrIhr78kNo
 H_BcoUkDgaX0k6yFCA>
X-ME-Received: <xmr:n__HYma-4gVQeyaMm3fPB6SerpIu3kDa2_TCwABICFcYoVm1eg1cV0B3CG6nVyu_qQIZVG0a__Z5qy_2H6onFrWNKJzGNwcUghvusEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oP_HYpUhhnckx3nIxQgZdLeo2JE9T_J80wG4-JxEm35rFxvVfyo28Q>
 <xmx:oP_HYsnu582OvKj23KYUtJ1CZ1TxbffNWlk8nTA5g0dF8Vd7jumufA>
 <xmx:oP_HYufde_yvDLE3W8WdUrFeiIQqD0oZfC6AV4QSOZkPLuGtf0f2wg>
 <xmx:oP_HYtDAaymx2S7umD4XnM_4jtwjtxdb9xK-Hoo9TcqbtvfLj8gBcA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 14/69] drm/vc4: crtc: Create vblank reporting function
Date: Fri,  8 Jul 2022 11:56:12 +0200
Message-Id: <20220708095707.257937-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

