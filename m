Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97D276A85
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0E6EAAD;
	Thu, 24 Sep 2020 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E196E117
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:40:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BEAE55C01D7;
 Wed, 23 Sep 2020 04:40:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 23 Sep 2020 04:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Jw+oCdGGxeJ5s
 jQ2hz/P19McQuRJdY/BzYPNDIviwNo=; b=JPwMIwIhxAzo9tFBrQs53iSjzbD78
 mgztXjXklum8rJzhR8sCD0wJ7BIgchr09OZ6FK/Qyj1E2f8+013kvow6hntjC5kd
 qUj+cqVH1VQgwKrm5N9Y6nHCPitzIqAGGu48x7EKz+EhnN+1C+1jqLyR8uO3KpFy
 wCBXkC6xVvux8U2Rq1XunW1l1KOHzrz49lWjNnEhIvtQmLQnhzkMO4HyicsPxCVq
 D6f9VC/ECCODoy/IfoUSPIT3Ttv+hX422ddM/fRsfE2ozo6kJYmL65D/j5slQk7d
 vkWrcx7EAI7Qu+zk5+5pqXLarzTy00C7rBDsO0/T2VMywy5Z8pjFBWVfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Jw+oCdGGxeJ5sjQ2hz/P19McQuRJdY/BzYPNDIviwNo=; b=LXcpv4dv
 2mBlvaqtlq3SqQkw3QP1jT3IeE39EZucyMOW3bjwiVBjbaPekTrdc5e5nb8vhCZj
 oBjsKeKsUSI5CbNLU1ouNdwAObIX70cAhGPhNaEzfgRR3neYiAqJkVTziksDwpZN
 4OKZn+QARrv+YlEyvpFiOFN1OhgLFMMCDogcE0Hfs3+YfaNeERbW6xLxZZ/fz6T5
 Vn9FuhybtdsJXdPipdnatGSgxqSyLi94W6a/4uuKYf7OXW0mg3a4HrM46Rr7euOE
 UuwCdCdzlcVQdepBIgiMgLoQn9zdPNQO0ZDMv04aIsTjHKAMyInlPHe1Vc+EKwCY
 mGygUVteeGyzeA==
X-ME-Sender: <xms:BAprX1kVA9ePAMU6c8hadzQsIHL9LDulWrmbEnqvAPTBd_WHP5h1-Q>
 <xme:BAprXw0pgHUFeIRLwONZ1x9XpIOJILa0Smk1qR6Qhlz-Z1MDVlHrwbi3Mikelivcc
 3ZiliXs_mLAZKwZKh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BAprX7qAz0FGAUklD2v_sQ6UPO1hhvrNFzdIbhdWPThY6_3AFqbATA>
 <xmx:BAprX1lXXK-_bDW2BTr47hGHS7qngiN2Yhpvlj402v-LTZBxp-3kdA>
 <xmx:BAprXz3rGpGiQbWFl-nKcdAwj1m_HeDLfRqwYLVSuxsDldatxc1F_Q>
 <xmx:BAprX9qCtFU8DWqKf7_GA31MGGkFVI0jyvoggI1xd9jsGpLZPQ0VHA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E40F3064684;
 Wed, 23 Sep 2020 04:40:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 2/2] drm/vc4: crtc: Keep the previously assigned HVS FIFO
Date: Wed, 23 Sep 2020 10:40:32 +0200
Message-Id: <20200923084032.218619-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923084032.218619-1-maxime@cerno.tech>
References: <20200923084032.218619-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS FIFOs are currently assigned each time we have an atomic_check
for all the enabled CRTCs.

However, if we are running multiple outputs in parallel and we happen to
disable the first (by index) CRTC, we end up changing the assigned FIFO
of the second CRTC without disabling and reenabling the pixelvalve which
ends up in a stall and eventually a VBLANK timeout.

In order to fix this, we can create a special value for our assigned
channel to mark it as disabled, and if our CRTC already had an assigned
channel in its previous state, we keep on using it.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

---

Changes from v1:
  - Split away the crtc state reset refactoring
  - Fixed the checkpatch warnings
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  1 +
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
 drivers/gpu/drm/vc4/vc4_kms.c  | 22 ++++++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7ef20adedee5..482219fb4db2 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -863,6 +863,7 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 		return;
 	}
 
+	vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
 	__drm_atomic_helper_crtc_reset(crtc, &vc4_crtc_state->base);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8c8d96b6289f..90b911fd2a7f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -532,6 +532,8 @@ struct vc4_crtc_state {
 	} margins;
 };
 
+#define VC4_HVS_CHANNEL_DISABLED ((unsigned int)-1)
+
 static inline struct vc4_crtc_state *
 to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 01fa60844695..149825ff5df8 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -616,7 +616,7 @@ static int
 vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
 	int i, ret;
 
@@ -629,6 +629,8 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	 * modified.
 	 */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+		struct drm_crtc_state *crtc_state;
+
 		if (!crtc->state->enable)
 			continue;
 
@@ -637,15 +639,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 			return PTR_ERR(crtc_state);
 	}
 
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
-		struct vc4_crtc_state *vc4_crtc_state =
-			to_vc4_crtc_state(crtc_state);
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		struct vc4_crtc_state *new_vc4_crtc_state =
+			to_vc4_crtc_state(new_crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		unsigned int matching_channels;
 
-		if (!crtc_state->enable)
+		if (old_crtc_state->enable && !new_crtc_state->enable)
+			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
+
+		if (!new_crtc_state->enable)
 			continue;
 
+		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED) {
+			unassigned_channels &= ~BIT(new_vc4_crtc_state->assigned_channel);
+			continue;
+		}
+
 		/*
 		 * The problem we have to solve here is that we have
 		 * up to 7 encoders, connected to up to 6 CRTCs.
@@ -674,7 +684,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		if (matching_channels) {
 			unsigned int channel = ffs(matching_channels) - 1;
 
-			vc4_crtc_state->assigned_channel = channel;
+			new_vc4_crtc_state->assigned_channel = channel;
 			unassigned_channels &= ~BIT(channel);
 		} else {
 			return -EINVAL;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
