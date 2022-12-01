Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A493B63F374
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE9A10E5FF;
	Thu,  1 Dec 2022 15:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDAD10E604
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 942DD580393;
 Thu,  1 Dec 2022 10:15:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 10:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907711; x=
 1669914911; bh=OdgoG4N5gu0zfihZXh28QKTMeemISz3VOG7TcMtDnEw=; b=i
 48U7oSkHcApmfKvmsRtF3+pKGOv+GDbNbFlPnnk8OuF3+PKfsK3/xG0CphWKQY8D
 JB+D8/5/ng1lghgHQkzrRUKUy8JttJgF2nF2yYJvetrGjELeQqLUP2/MAWAAAev5
 JudquaSadAaj9PehORf8ns9AYjn6SlLstk91or/J3fa1urDTgnRvDk9aXc+nbjWj
 NyZerxhm3l4+xKSwrrIVtFh3231U9MIXunnANay2uo3IAv+En9tBSw18/w9zv1GU
 8aR5t2O7LPDCtzFMHlm0Hg2gYDJpDbAiy9y6vgcEJ0qlWU2idG5xPhjIHXrn7dOM
 e0lyaU/ZPCsG6L57aFCyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907711; x=
 1669914911; bh=OdgoG4N5gu0zfihZXh28QKTMeemISz3VOG7TcMtDnEw=; b=w
 AnxWaECLk3vrcCAtgW0eIpZDGP/6eTQIbVXbuWMKHik2t3NSSbPykDvWFyj9mdNL
 V2ZvOP7eRbhLEyDyQlELWxH8y9DJq1gO3p1HooESQ591qj78Xs6EE6PClMnKAqC7
 gVzV7Yz7eb+pdoOEvOOQFXnDFpx8gR2+kMKHtsTSIu95V0F9RW2BOXhaMZC8Z3nA
 nkx1nvurP2ULsd+nSs990HlOH69snOyo6exskc2o+Rf0V9wxZdu07XxrJUgyf2Dw
 OUviPvxESyOXkERF2Hli0gQtcqBAJ+k+Q9IiRxXgu1KX2J7Wb6/IdID1G+2VEklp
 aZH0ywjhrgTSSpJmyTZbg==
X-ME-Sender: <xms:_8SIY2iWpJitYzB7o7V_HB_fQbQgOMOE0N8YhpvFWd959sZmaccO2A>
 <xme:_8SIY3CWC_0Itn4AhCNr-MyA7rxI2XvOSouD8CFD0r1Gw_qxliNnOhSvUlWGfRWgO
 5_Ss3vsCUpmsEmcTxI>
X-ME-Received: <xmr:_8SIY-EFuO35kWfmKwOrGAWiXN5Vwrmr6NZYB3YcnN1DBC6859eKIHH1cPudATsEn-iY35X5Qvv7CMRsn3th5yBNaiNfMnqkyO3aXCojmlTvRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_8SIY_QS8lrwO7_1O4RE2nVzDrUoFW18yySr0eMWS6T-O2pIKx5Q5Q>
 <xmx:_8SIYzwOTYMydZZgZpuIO5nlG-2zXF7Kn0bt4qAkHXQsRTqypPMVWA>
 <xmx:_8SIY96Tz8osMWHlYO97uvlN694Pcc1XIJLqhsy0HcDJ8ySSEvP9Mg>
 <xmx:_8SIY4QkzS22DMpikE7v8FcHipvtWC1NflJY5s0BvUtuOiGQ-QukGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:44 +0100
Subject: [PATCH v3 13/20] drm/vc4: Move HVS state to main header
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-13-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3564; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=2AYcDp+EnzY9rhv9f3Uik8fq8QACKSwbsm6PRjFyHGM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzQCdzuZ7r4XWCtzXPjy9M8V0a1Xwr/7+u2+anG89K9/
 4wvljlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkERcjwxwGJ8X6a5+0e88rO0w9+f
 au7yMRzb2v3TfOXWwi/+K6y35Ght05LkFrvu9O195/YZbpW+emH+dMnmjkh+84sSck81JGBQcA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to introduce unit tests for the HVS state computation, we'll
need access to the vc4_hvs_state struct definition and its associated
helpers.

Let's move them in our driver header.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 23 +++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_kms.c | 25 +++----------------------
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6af615c2eb65..051c2e3b6d43 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -355,6 +355,29 @@ struct vc4_hvs {
 	bool vc5_hdmi_enable_4096by2160;
 };
 
+#define HVS_NUM_CHANNELS 3
+
+struct vc4_hvs_state {
+	struct drm_private_state base;
+	unsigned long core_clock_rate;
+
+	struct {
+		unsigned in_use: 1;
+		unsigned long fifo_load;
+		struct drm_crtc_commit *pending_commit;
+	} fifo_state[HVS_NUM_CHANNELS];
+};
+
+static inline struct vc4_hvs_state *
+to_vc4_hvs_state(const struct drm_private_state *priv)
+{
+	return container_of(priv, struct vc4_hvs_state, base);
+}
+
+struct vc4_hvs_state *vc4_hvs_get_global_state(struct drm_atomic_state *state);
+struct vc4_hvs_state *vc4_hvs_get_old_global_state(const struct drm_atomic_state *state);
+struct vc4_hvs_state *vc4_hvs_get_new_global_state(const struct drm_atomic_state *state);
+
 struct vc4_plane {
 	struct drm_plane base;
 };
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 7282545c54a1..53d9f30460cf 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -25,8 +25,6 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
-#define HVS_NUM_CHANNELS 3
-
 struct vc4_ctm_state {
 	struct drm_private_state base;
 	struct drm_color_ctm *ctm;
@@ -39,23 +37,6 @@ to_vc4_ctm_state(const struct drm_private_state *priv)
 	return container_of(priv, struct vc4_ctm_state, base);
 }
 
-struct vc4_hvs_state {
-	struct drm_private_state base;
-	unsigned long core_clock_rate;
-
-	struct {
-		unsigned in_use: 1;
-		unsigned long fifo_load;
-		struct drm_crtc_commit *pending_commit;
-	} fifo_state[HVS_NUM_CHANNELS];
-};
-
-static struct vc4_hvs_state *
-to_vc4_hvs_state(const struct drm_private_state *priv)
-{
-	return container_of(priv, struct vc4_hvs_state, base);
-}
-
 struct vc4_load_tracker_state {
 	struct drm_private_state base;
 	u64 hvs_load;
@@ -191,7 +172,7 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
 }
 
-static struct vc4_hvs_state *
+struct vc4_hvs_state *
 vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
@@ -204,7 +185,7 @@ vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
 	return to_vc4_hvs_state(priv_state);
 }
 
-static struct vc4_hvs_state *
+struct vc4_hvs_state *
 vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
@@ -217,7 +198,7 @@ vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
 	return to_vc4_hvs_state(priv_state);
 }
 
-static struct vc4_hvs_state *
+struct vc4_hvs_state *
 vc4_hvs_get_global_state(struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);

-- 
b4 0.10.1
