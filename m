Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA463ABCB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B911D10E221;
	Mon, 28 Nov 2022 14:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE3D10E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:57:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 41C3B2B05E69;
 Mon, 28 Nov 2022 09:57:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Nov 2022 09:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647459; x=
 1669654659; bh=nwkXJOIEr4234kWVYt7EEM9GP5U1EsRNZUcPzK0CrkM=; b=F
 v+iH9J8gH48LPpdFepRnEG/H9hvPh2JvygdM56Lm3sRTwLuV3wO6DdS5ZHtyDZaJ
 B/41wWw7q1Zm8ba4GwDdTW0t3ZvW5eswkiUMwDlxg4pwkK+NcCbRe+PWUuDut0cw
 nRjjDCMadtmTTG2xczlO+oEsvqITnEqYS2czKsXbKNyWeonIJ/cI1l14mvbn1P1B
 zeamkojiAFaAfu0WklLss7yzqFxVLgF544eWs4i8tDJluM97J7fuzovcxr6773wF
 zQmQcFFyNy2kwjXIraxXZTKm0qQsFniHtQv0lcEUHZPGrbDa3SFjvGVcARD4pFcO
 5ga2dMNcbTCcnCERVpuXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647459; x=
 1669654659; bh=nwkXJOIEr4234kWVYt7EEM9GP5U1EsRNZUcPzK0CrkM=; b=w
 LWYvp0lupPcPaFwmJqYbcOEnBGarfmSCvc/Jhob/KWlfEqFGU5Lsf1gvqUCd1Xpx
 IZSS2SjuoC1DFkdaNgUpojdIXsYgXLiRZOF6it7aKeWwLaGh7xZDIH13GmZBrjzu
 5yEqLYgwO7Mz57tkwHY+jWOsAswCQomcQ31MR7JgUPJnu15GQYlisN7Dg0McYuv6
 o4Hjx5cz7nixrZgduoqMFnPI++Jr5PmZWcPGk2K/mBDYUpoP/aPscDt5TN+nJrbw
 WZD/LNYwHm/ACg2nazJgQAf6PAtgBHF2psqXuLNb/1eqkIp4iWTe2BntCQaow6Gc
 Tdvwp8sL21RPszx2AswNQ==
X-ME-Sender: <xms:Y8yEY_qGS3aFosOwG_u8Uq8gH2R5TaE-qBsl8oSOQjRnd0-bZXiR8Q>
 <xme:Y8yEY5ow27sP4IEueXOgdhUHmdRZiCENsKfIxMPKa3-gGxEoH1oXAkAFS0vn4RgPz
 wILT22loNvz7iQAr6k>
X-ME-Received: <xmr:Y8yEY8NlVjs5xZ2Qg_GQv9DL_PivCLJvpIcYfElyRovyaWEIeyWH1S0A2z2jioi_hJBSPgAo-ov8pkKJ_obDtTPEtVo9Ly3Pvvr8I6T0qB9Jqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Y8yEYy7y3RGK7NWTMDXHXiXkBe0ee_nbQ0HLHN2gHmAwddowpZSKTQ>
 <xmx:Y8yEY-41wWUpoIBqGo4ipI9F624k_OA1SK0jgztvDNiywoqQf0s4nA>
 <xmx:Y8yEY6hmBoZRW15COoeo6bMCqS0rQqAjLh4wAQ1Zv9WCi3HxuqtWyg>
 <xmx:Y8yEYzbtU6ARUrtUJp39qKkE3cQJGgojFweYj5DsHg6jBvn9Di1gqRqTRn8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:57:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:40 +0100
Subject: [PATCH v2 11/17] drm/vc4: Move HVS state to main header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-11-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3534; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pJKRYNepa8dk4BTaY5U5nlonxbfgkVNLNF3TRFqQE+w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8sOTX349OMrucMqS25P+bD961GGdrFAx9ccdtZvU1aK
 tp7Y1VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJJPUz/C+5UHlszlxxUXGnTsGOq9
 6iEZrVn+M+uDbk3Xugu71+xSFGhkb5VWuCnyQt3sI4jde6/NXLL7GnC2Q3nn/4PJt3zbHKaTwA
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to introduce unit tests for the HVS state computation, we'll
need access to the vc4_hvs_state struct definition and its associated
helpers.

Let's move them in our driver header.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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
2.38.1-b4-0.11.0-dev-d416f
