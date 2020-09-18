Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A785D270BFD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E9A6E1BA;
	Sat, 19 Sep 2020 08:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFE56ED0F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 14:59:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0939FD42;
 Fri, 18 Sep 2020 10:59:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Sep 2020 10:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1tzhFpEYvpjfH
 nK073sHkk3Jjws1bTVnlBbkwHiSTeM=; b=MSVGJ6lq1S9AOPQirFYZZYvYaLLb5
 1+Uwhzm76ZA1BjGrPR98aCiJK93rAjzN+fHSdijPG0nLvmp7R3KZfM8VirYXzqpd
 5tPaoG7QSOTGbb3/jkcPRu9RQszWGutlho07BGAgXq2ciInj45JtZ3DXErJWaZ3C
 2YReRDmwGIoWZKfPSnp1v0MSpBDcwPiwioTjpcX/FAtNGoNXTCOyxBe2uJycf55A
 UUkbq0h2kUt9cp19qXn+M7FLNeIzGxGWimtr0yS/TY35RQpTXkr6+cWymUjYyteD
 j8tL5g0prcpQaeKMaRp1iGm52KJbr/GEk9UywEFM7ZO7hY9n6YHPv3X6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1tzhFpEYvpjfHnK073sHkk3Jjws1bTVnlBbkwHiSTeM=; b=cpm5Ou5W
 5Imkaze9/Y5X16dVSzk5uYKS52I+pmVBIXqn65x6ljnE2T3neAMdjm6DtyI0Lzf1
 bGEi4tbiptpgqjPey44hFobjLrZtORE3HV0g5mJlt/5ZvStH3hj6GwIghxjpnNSr
 ajv1YYic2kkOLGok/J1lm5DFf8GMriyGhqir5eEfH/dCpC6JUiEwZ0oYt18WMA0m
 iYyN0nSMrWHpy9HlsNDx8LAf5HoV0iOKitETGj2/tthHl4Q2I3jEfYhyYO5UQxQw
 a6UCFAv+8kPwprJpvY53ZHi1suQokF+ovRE9PuzZ0cd/grzpJXjsZmst8hg8XY7F
 JT/2ZjCS9CrdBg==
X-ME-Sender: <xms:TstkX_neQHyh_f-qA-3Cz69RJokQ71gkiWguM_3C7nekqsuPrANuQQ>
 <xme:TstkXy3CdPOn_KKswgmEGacNTgi-Wz15hF6MZk9tCjN5vFZheowbQZS1nqBOcnuwY
 2SIgnjv0KJILC7iQHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeigdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TstkX1pzB44EELbKrS-ylMf3kR0xL4Y7njt0nC0r-_1PbqIVtVByVA>
 <xmx:TstkX3llqtLVbWvpNgotHKXfdqYDtG9SmRhA_jvDwF_lswiQXi5ynA>
 <xmx:TstkX92uh39m0i4CNlYyeIE7fflXrH-BszMmhnZ08M38wXhViCm1Vw>
 <xmx:TstkX3r0dyITtezJhe9UAkMIHXvS5LAlIM3fF8d3ufdzxFuNIaIR5Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 473BE3064680;
 Fri, 18 Sep 2020 10:59:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/2] drm/vc4: crtc: Keep the previously assigned HVS FIFO
Date: Fri, 18 Sep 2020 16:59:18 +0200
Message-Id: <20200918145918.101068-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918145918.101068-1-maxime@cerno.tech>
References: <20200918145918.101068-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 13 ++++++++++---
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c  | 21 +++++++++++++++------
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index a393f93390a2..be754120faa8 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -852,11 +852,18 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 
 void vc4_crtc_reset(struct drm_crtc *crtc)
 {
+	struct vc4_crtc_state *vc4_crtc_state;
+
 	if (crtc->state)
 		vc4_crtc_destroy_state(crtc, crtc->state);
-	crtc->state = kzalloc(sizeof(struct vc4_crtc_state), GFP_KERNEL);
-	if (crtc->state)
-		__drm_atomic_helper_crtc_reset(crtc, crtc->state);
+
+	vc4_crtc_state = kzalloc(sizeof(*vc4_crtc_state), GFP_KERNEL);
+	if (!vc4_crtc_state)
+		return;
+
+	vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
+	crtc->state = &vc4_crtc_state->base;
+	__drm_atomic_helper_crtc_reset(crtc, crtc->state);
 }
 
 static const struct drm_crtc_funcs vc4_crtc_funcs = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8c8d96b6289f..2b13f2126f13 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -531,6 +531,7 @@ struct vc4_crtc_state {
 		unsigned int bottom;
 	} margins;
 };
+#define VC4_HVS_CHANNEL_DISABLED ((unsigned int) -1)
 
 static inline struct vc4_crtc_state *
 to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 01fa60844695..f452dad50c22 100644
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
 
@@ -629,6 +629,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	 * modified.
 	 */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+		struct drm_crtc_state *crtc_state;
 		if (!crtc->state->enable)
 			continue;
 
@@ -637,15 +638,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
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
@@ -674,7 +683,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
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
