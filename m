Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904616363A5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED7A10E589;
	Wed, 23 Nov 2022 15:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7910E589
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B18B72B069B3;
 Wed, 23 Nov 2022 10:29:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217375; x=
 1669224575; bh=Tqzo+v5WDIDmLzX6xbpzVYdBUdOj1wrrBvxc03NT8TU=; b=a
 ho/o6aHA9R6BtldA1gCX9xf1xz7LOx8xOWmiAvRYG4sy+bkedP1t1TXO1OtIB+Zg
 8+0iH5XnelO0wBY0IPxDpmXwe6bzxRnRNy1KGZ3m4RJAuiJrYbg5ibwt+zq5UEk9
 dW5qAUE/R9EBdppHOPdDwJRgYkLQRmUVjJDnYk7BfPUnOnGij2iuEJQssq6VgF2y
 LmRn8a06MHzN0hRI8ldCm8vP/PLXIlqjvRlYZNASB7mMWcKzlhkSe80463U5bedb
 XccbiCFvngTPsnx/luSITFsG/sRWuHEc+nZM0ANCTk+Fubmd2kAcwXMIKbfW83Y8
 K1Z+jOv03pysGXN3h4Qlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217375; x=
 1669224575; bh=Tqzo+v5WDIDmLzX6xbpzVYdBUdOj1wrrBvxc03NT8TU=; b=Q
 bJNa9mf4vhqB3LzyT6SLJHsSiWaE02lBzZfJWuU7Wely7AkqDVONPdfslMz0yqm9
 T/4p2692lPaVcGXQJbYnh6/aZpA8Kr02/3m33BZqE2YK3cgKF3zy5n3hUIW4hFtB
 YgygUhOpCIkObaZAY45Igeqfp+3Od27t+sN7J+SO9slQzUqTUYNVFldFCLO3VOiI
 g+i48T97JvZMjrh2PCcDjsOfOlAYDy++Z8FVc0ggCU5B87pkRhHSAX8/Mm55GM3r
 itSO0nDbN4Wjhveg7FVyC1zqNgCySvKkY2G3/nrftaoMI2IrxkX4UmOkkzVFm+BU
 1MHUcrEuE+0xm5v8A2trg==
X-ME-Sender: <xms:Xzx-Y2huKL3JnHPGY4WqKVVFcEDrzgF8kDgPQzmISBh4p8rhfjpYbA>
 <xme:Xzx-Y3COPh2HMxPVgJj1vAIM9DnT8mkMt2ABc42LkfkoyCCGz1E6x4Ml7B1Equhq5
 YBVJM9iPQItf23Cwdk>
X-ME-Received: <xmr:Xzx-Y-GdOw5dovKGxeRxQThQr1B9whEKLlAjsAwrl4LgdHlU7jVdSk949tNYwgzRhA3vC4al-avCnfv0v9RP4KLcWbb-dVMLXx1-jxxLCIFMqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Xzx-Y_TKiY0fwJ3CkSoWl6xFO1bNxJ_WlfIZLKt7vPnE8ILYjgxo2Q>
 <xmx:Xzx-YzxmNv3gPPac7JQFD5_H9c-FmkU86nkg5ErPUtoJgRX24vA1GQ>
 <xmx:Xzx-Y94LOniFcC9m218N5zvlt8y6mPRqq7p2dF7P-YrquB5VQsgGeA>
 <xmx:Xzx-Y0S48oNy7otF_kohYJula5PDBm7Oc-lfZhN_kQmkkP5XD-M7R16HsjE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:54 +0100
Subject: [PATCH 12/24] drm/vc4: Move HVS state to main header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-12-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=NIPYyCJzsWMlwD5UxrtF0hdjDVhM98s1VpBl7SCSDlk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tX/tVUE7OZ8XX7w6O+Inlk9J6tWfrnLnvDQq8e/b0/d
 xZ1LOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRQ4kMf7g0L7DlXL6U35YrGrtN31
 5lzxO9CIlOt7vMZ/idXSu0Qhn+O7xJ1dTb/L5OfL6wwInNCiy66w/cqhQu+qn6bcaT6t9reQA=
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to introduce unit tests for the HVS state computation, we'll
need access to the vc4_hvs_state struct definition and its associated
helpers.

Let's move them in our driver header.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 23 +++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_kms.c | 25 +++----------------------
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 3ff56c1821ef..6ff63036915c 100644
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
+struct vc4_hvs_state *vc4_hvs_get_old_global_state(struct drm_atomic_state *state);
+struct vc4_hvs_state *vc4_hvs_get_new_global_state(struct drm_atomic_state *state);
+
 struct vc4_plane {
 	struct drm_plane base;
 };
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 17a28f9a2f31..cb2197622b2b 100644
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
 vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
@@ -204,7 +185,7 @@ vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
 	return to_vc4_hvs_state(priv_state);
 }
 
-static struct vc4_hvs_state *
+struct vc4_hvs_state *
 vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
@@ -217,7 +198,7 @@ vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
 	return to_vc4_hvs_state(priv_state);
 }
 
-static struct vc4_hvs_state *
+struct vc4_hvs_state *
 vc4_hvs_get_global_state(struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);

-- 
2.38.1-b4-0.11.0-dev-d416f
