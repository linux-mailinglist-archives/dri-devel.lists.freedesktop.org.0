Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A793B5E45
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDF86E456;
	Mon, 28 Jun 2021 12:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201126E452
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7CB8A5804FF;
 Mon, 28 Jun 2021 08:43:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 08:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=yOB63fJHzsg9Q
 ZNkKHIHmJfI18jn71wpRO/ommwdZ6w=; b=U0r94x11gT1zLIDQRWckIMwe4HI2e
 bJN+MeqFBLozr4yEr/nxARARuF9/EOE2B1WXFPewBF+Fjz9CMQWkrkozWUQpwWCT
 +zXckzWwSCfmx2m0z7pNq/j2D5CJkKV7ai8Qw+m50V4+pn4MZzlfdJ5M54dBrUFM
 noQ5sI+DyrktLfHefsHrofQ2gNG/xU9HvHaJW72pG/ylgr1tmxPnIa6aXDpJ1/eQ
 t06809kt/SNTc40fG9+HY1yVwQqw2ZnxtDoUN3WfeEYwmUJLjHxNGahGNvqG6rNA
 88BfAPoOKJ/4sJo2622P69M9q+xNu9QVDIOAixNnRMtqXeX/Mx97+iSow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yOB63fJHzsg9QZNkKHIHmJfI18jn71wpRO/ommwdZ6w=; b=QBlAr9h6
 j06KhPtzJBKnoDv5W62+O2bKIZ7Wn/jzmmZIdCmZfK9ccvNJSSguHtM3L8gqYi1M
 bmUeqtbnidNq9t9xSLrzcGLFxdh3Y6sMB9rL/lYvX4LX1HabjlQ9z738XLe0OYWn
 OcjJHg5MCeOQg2RStWN85U6y2aSa8ridR7fFTAJdFd+RpF2QzdK7PtcdxBf7FMXK
 8PGxU5/JoikZniAJvQ4rPTNQoq8TATBORbBPAU4YP5vbqxJTAIWzQSuAPoIQopUI
 hk5eCM8r/7J/d8g5iFITiqKCSeT0O8sjejqma0AKrxRN8nt/2mJnjKJU/NkbSCPv
 nAQWjFqqoxsURw==
X-ME-Sender: <xms:3sPZYA8nNG0WdtKGcduyRKr2ou3frfEu47g7brOfAb3kALPldzqYqQ>
 <xme:3sPZYIs3FqZ4cz0r47HRl8D7IxywdFzDer7O4zSKTQsyaf7PuU9J50lPab5CcG8tV
 V9Ei_X5vyURnwBkCHU>
X-ME-Received: <xmr:3sPZYGDg4GJdiJkdtUkAwmWS1SLGk5WTwGvY7LqrVY-B_MCWlUiiZ-fYfSGVF-GhQzSq4WyHWbwwSg8raDJWzVOwAZxYdEq2jnhY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3sPZYAc1uYDrQ3Qt6qZ5xs1NtfU42Dxdf25vhvAdTWZ7sKWBoCUgtg>
 <xmx:3sPZYFOiN2WZgtSRC6gUkJsn5EFAVtXjeWTDwSZyoctZNLrwNaOE-w>
 <xmx:3sPZYKlL8TOK9M7I9H7VDnclHj6-g9zFpmkbuicqSkjOfsYk41nveQ>
 <xmx:3sPZYGvwyhbEZ9sBnJ4z40hwidLjo0qEiYlovdk_zy5xo3tK-xVtuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 05/10] drm/vc4: crtc: Rework the encoder retrieval code
 (again)
Date: Mon, 28 Jun 2021 14:42:52 +0200
Message-Id: <20210628124257.140453-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out the encoder retrieval code, in addition to being
unnecessarily complicated, has a bug when only the planes and crtcs are
affected by a given atomic commit.

Indeed, in such a case, either drm_atomic_get_old_connector_state or
drm_atomic_get_new_connector_state will return NULL and thus our encoder
retrieval code will not match on anything.

We can however simplify the code by using drm_for_each_encoder_mask, the
drm_crtc_state storing the encoders a given CRTC is connected to
directly and without relying on any other state.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 30 +++++++++---------------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  4 +---
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 93d2413d0842..c88ce31ec90f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -280,26 +280,14 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
  * same CRTC.
  */
 struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
-					 struct drm_atomic_state *state,
-					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
-										  struct drm_connector *connector))
+					 struct drm_crtc_state *state)
 {
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
+	struct drm_encoder *encoder;
 
-	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		struct drm_connector_state *conn_state = get_state(state, connector);
+	WARN_ON(hweight32(state->encoder_mask) > 1);
 
-		if (!conn_state)
-			continue;
-
-		if (conn_state->crtc == crtc) {
-			drm_connector_list_iter_end(&conn_iter);
-			return connector->encoder;
-		}
-	}
-	drm_connector_list_iter_end(&conn_iter);
+	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask)
+		return encoder;
 
 	return NULL;
 }
@@ -533,8 +521,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_old_connector_state);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
 	struct drm_device *dev = crtc->dev;
 
 	require_hvs_enabled(dev);
@@ -561,10 +548,11 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
+									 crtc);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_new_connector_state);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 
 	require_hvs_enabled(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index d3e5238eadb5..52214a1568fe 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -516,9 +516,7 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
 }
 
 struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
-					 struct drm_atomic_state *state,
-					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
-										  struct drm_connector *connector));
+					 struct drm_crtc_state *state);
 
 struct vc4_crtc_state {
 	struct drm_crtc_state base;
-- 
2.31.1

