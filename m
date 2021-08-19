Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476923F16AD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5A26E7D3;
	Thu, 19 Aug 2021 09:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A456E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 70786580B76;
 Thu, 19 Aug 2021 05:51:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 05:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=R7mfm7hRhU+UI
 1PSD5rJ0gQJVsai+oDRCPpZeZ3wdfo=; b=JgwzfM6MdgqyeS69FTaNb1naI1mXW
 4M82mU8m2slSatx5dnFs51Tl2gXglb9GSX+B1dyzWP+ImhBdx2TFkUoNwd8E8TvJ
 H8LaJ+GcZ08HmvrlhS5nDrDJ7wStsrvE5N+D7NjhU8GgP0jbx8geVlJctE99CnTQ
 GFB6ZTAhLeDzxWuwQ/I5ndc5mhpCNn7+IsE4jUpBETg+YjMvgfDFOa/HIlKuqgwG
 oVWwKSGRHEfAJbxO85GBYvNwcR6KVVn/mEqLyzDt7A0z/+EqLHIWlSQ9btu2TUT/
 rsBwjW4GzlBgvaF/pHp7mOcw9bVckEW9cPyN3v+q3tukRrdv2FMo7m+7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=R7mfm7hRhU+UI1PSD5rJ0gQJVsai+oDRCPpZeZ3wdfo=; b=gGamRwof
 9/PipAxyJ5+pI0bnZIrrhMdoqjiKtcwiPCb+99bBwj9/Zc0IYcQckuKx4TQ1XzM0
 Rts9pWVolav1sBr3Vk8oQwm9Nn1+eTGxaF7a0mwJ6aerqaqZ7Ca4/C/y1iF63XdV
 KRmn0agJe5WUX5J2l1B0GKLXjLmntYudKd6c00ngoqNeLd9ATBPwlOcz09oA1VBr
 VwlkCIvk9Z+hYdySVB/UqIUV3fx0gpkdg/wSXdn+wScyBBA1sDgrx+TXeE12XnSQ
 DPA8z/DUAb/+Mw+eKfuo3Of61dg+gbv5VyLTDU2QeHeS8NeeFglR+Q6O8DaKgdoM
 YPoPMqteAveUCw==
X-ME-Sender: <xms:qSkeYb7wi2KXcbdN3N1K7Dai37YCf6nLQchEbSErMqCwKRs2g0BaCg>
 <xme:qSkeYQ5R_qp2G5AytRQpj6VTxz2K5sd_EVSx5D4yhMeAxc0BRb5pq0gYFrQiPTBMW
 IeBgxcBJPKKDMKXQx4>
X-ME-Received: <xmr:qSkeYSdvYx9c1fdQc_cXMtYs7rfNSG3YidRW-Nr2ix_d3z0vGmgXgvSk0Sdej-0R1l29LbiPWBHJT8-ZliHIIRqFDXmsaneQpkGx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qSkeYcLJCkI7ACVt_93z6m5JmTKNNVe9xBNuvlN66Gqcs96cGIZI9g>
 <xmx:qSkeYfL390Y8i53xIsZqhP7vaqtepVqLKWlYyhu6t_vJQAgpFpWHoQ>
 <xmx:qSkeYVyaVvCjyTgXqNDIiBwmBrvuLbdzk_8G9824ZfMfngwTZB95kw>
 <xmx:qikeYRj6CrXZweect_FpFKOo1CFICn7nYdFgDn_w0DPVIZo3lqNsKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 05/10] drm/vc4: crtc: Rework the encoder retrieval code
 (again)
Date: Thu, 19 Aug 2021 11:51:14 +0200
Message-Id: <20210819095119.689945-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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
index 0865f05822e0..220c5e81ba2c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -518,9 +518,7 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
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

