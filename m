Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB2439A80
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95D46E10C;
	Mon, 25 Oct 2021 15:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F5D6E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AC7575806D2;
 Mon, 25 Oct 2021 11:29:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 11:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LNY1QtH3tkIeS
 7rUfr2hb/mX9QHEIReCgJkz5sgrem8=; b=JJeH4ZNBqIFO8q1o2R8f442sXkzdb
 OIEpGF5TzMg4N+2LoRN6IbFhS/RKVa8ia35VtWfao4inpJh47fDKBjL5AyK1J6qa
 1YDhFosKf4rq07zU9GkaCnxHU/T0egxrqb/E8T6OMnGKKmh61yjstRKU/aZ/D8mm
 5ke5704DZTCVDBmlJIgU/DMNhSfQbGpufBQc2Ulz4c5S0Hv0n3urm0GPsqqTO/ob
 xpgyvtuQjFTPgxfQ29NvXXMYo2SCM1cO4GqbUl2NPAf4OzdCON1ckJuL3Jjx+PEc
 FQkdHi0ROkV1/ad3rWLsduDftm3WC4Pv4ZSkgI+B3OVlcWk2YnkrOMgdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LNY1QtH3tkIeS7rUfr2hb/mX9QHEIReCgJkz5sgrem8=; b=KkMh+r9o
 dK8Jys+k1KQckFM0oldfm1OG3rZkMTDw+ePurQOZZBgjuhoWgUVSHMEE1YU8gZGv
 ITGAa/+XU0wFJMSQNU2sC5j/D8RChdX6NdScPCFFNgkU+vo/Y+QNJYcpwETTl6PP
 hZPuplNg7092uI/5yy78dUlIuvX5Y424WcWANUiqBQxp+oP0ksgDHZ3mYmhafESe
 U9WklkyrkrhGUP8BHnrcWOUzQLk9nXFTaP5oLTd7xBayoT1BNOiagmG9JlfiPtuY
 n10pzYvK4ldDwbnVFXZ8ToxZFOuoH9rEGEtwyydhsIv6I8P00ti9Fzv3MFo3fCiY
 7XBtT34MpllEaQ==
X-ME-Sender: <xms:Tc12YaRXAINY31RmvtdiFfBhmiSGifoAphzmy4IxIMv3q6vx2rDQcQ>
 <xme:Tc12YfzECGEfgpAKMilYF89tYNGyyzv6VOcwY-8Y20q5dwXFCGXpX1byBO9WASlfH
 BIF4idDv-krPsOSz7Y>
X-ME-Received: <xmr:Tc12YX2fZklo_YMp91XwGogMwhOA1fdy1oxJHGvCBw9UUwfHK8n2RrVKsq-bLIe8DwEiCvn0cOlJE-KH-waSMUWKYkwJUQYg_W3tWPFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Tc12YWCiGyaHJhYswQ-5ZeB773GTzYBBr7_W6eoUwtkOBUJkNphmeQ>
 <xmx:Tc12YTgnajoHhtpNUXFZ7sHi0IXIjBidqUvFxSLGlNLIn5Fn2kVtDw>
 <xmx:Tc12YSqf9Xb6XdJihjDOuf9AKXwv5XMBYWjHKZXjuAshiRS37yGXAQ>
 <xmx:Tc12YT7NrfJsNySnOJ560d0NQPYGyjLnvUf5-mR4sPSCvqmX1Yt7xg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 05/10] drm/vc4: crtc: Rework the encoder retrieval code
 (again)
Date: Mon, 25 Oct 2021 17:28:58 +0200
Message-Id: <20211025152903.1088803-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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
index e5c2e29a6f01..fbc1d4638650 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -282,26 +282,14 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
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
@@ -550,8 +538,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_old_connector_state);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
 	struct drm_device *dev = crtc->dev;
 
 	require_hvs_enabled(dev);
@@ -578,10 +565,11 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
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
index f5e678491502..60826aca9e5b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -545,9 +545,7 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
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

