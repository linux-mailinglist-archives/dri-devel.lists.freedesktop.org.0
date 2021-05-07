Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02CB376790
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7436EE57;
	Fri,  7 May 2021 15:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A4F6EE57
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:05:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 930A61364;
 Fri,  7 May 2021 11:05:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 07 May 2021 11:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=F4W9uyQV74C7U
 BU/JNa5oUl0tMDHwnh8qM7k1wloo2A=; b=cYs+hi7OxdFCs7OJj+Maak3HSLxvw
 tK/A0evoO4sTZFXIOxy2YJpoOKTSQ59OqStowlOmLB0Na1UBckxxZT8KVTKsWUkE
 muYpqB2XTBHpTFeFnWXNxcUzuKRjOmsomfnrg7aFFSY/auwbaqlDSq3LLvsVuGWx
 iKShfRXTWbrVGWBemx21YhP3sdMcz63LPwJvCgwliScOfMjNWe8L1+PCQ+FikjUD
 H3cmkYU5cQvgNlUv4hGkVPTUseqbMaRHyXylx8NHc9U8KIqnZNTaZqfKhlV/jPb5
 s5G+wbhyIZ8FWTI/RqGtKC1TjdmlglmP6yvc8PU2sJYrqKq6yHR/DOsXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=F4W9uyQV74C7UBU/JNa5oUl0tMDHwnh8qM7k1wloo2A=; b=mUuwNNZ3
 j3VtSowW+/tNIwWG4YjJwfUlMCmKJ4qoJ7SnPCaIgoUE3XgnvDRyaH8/jgfhHu69
 tnXfyeXYrX7Qvgg0exuNuHTk5xk4cjWMKWsV0UMl2IEjLWbLIVv4T8WfjZwjimso
 cqezj2C1ixGQNrkHqxqiNj9rQXjhOBoAyBWk0PGEn2xK+7QEBi048bXO8Nwfa9Kk
 zj12ndhzJARxfhprXFQ81l/IFhBXB6Sm+8ZM5DCoo05KZHkcI+fb73JHaTCAggx7
 P07kyQfbANCxCkp+py6DakjdFQjn/Pj812pKjCJWzBza/gT80VkER2algX3bEYFf
 AHPspGcviLe4lg==
X-ME-Sender: <xms:RleVYCVFhvOKtQOMA9B0JCxNwjT3OKE4P5upaJNaN6yF8r4U0kY26w>
 <xme:RleVYOnKXG6b6CvG-A4vYaX22fTPge6iwmZk7amzH2Rwj_WeHCt-vmsUYF5VNrI6p
 iUX-UBqdlbDRwhj564>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RleVYGYT_G_8VDArYQrKoWF4G5wr8NKvPjq1xa1tVAyI9q5dcoFzCQ>
 <xmx:RleVYJVSrcKJigByhpKMHmqeOVHRruzDcekTMs5VhdQbdwVo2FBERw>
 <xmx:RleVYMnLnS94JvKVl46UTDkglTumVjqHNzmphWOCwsiT66KZ-opxBQ>
 <xmx:SFeVYH_2jJzI_sIw9vGZRtiA7Qjz6aiBMKvzH-g4mmGcqv7ImSvxVF_3A4k>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:05:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 04/12] drm/vc4: crtc: Fix vc4_get_crtc_encoder logic
Date: Fri,  7 May 2021 17:05:07 +0200
Message-Id: <20210507150515.257424-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_get_crtc_encoder function currently only works when the
connector->state->crtc pointer is set, which is only true when the
connector is currently enabled.

However, we use it as part of the disable path as well, and our lookup
will fail in that case, resulting in it returning a null pointer we
can't act on.

We can access the connector that used to be connected to that crtc
though using the old connector state in the disable path.

Since we want to support both the enable and disable path, we can
support it by passing the state accessor variant as a function pointer,
together with the atomic state.

Fixes: 792c3132bc1b ("drm/vc4: encoder: Add finer-grained encoder callbacks")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8a19d6c76605..36ea684a349b 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -262,14 +262,22 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
  * allows drivers to push pixels to more than one encoder from the
  * same CRTC.
  */
-static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
+static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+						struct drm_atomic_state *state,
+						struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+											 struct drm_connector *connector))
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
 	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
-		if (connector->state->crtc == crtc) {
+		struct drm_connector_state *conn_state = get_state(state, connector);
+
+		if (!conn_state)
+			continue;
+
+		if (conn_state->crtc == crtc) {
 			drm_connector_list_iter_end(&conn_iter);
 			return connector->encoder;
 		}
@@ -292,7 +300,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *s
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
+							   drm_atomic_get_new_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
@@ -407,7 +416,8 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 			    struct drm_atomic_state *state,
 			    unsigned int channel)
 {
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
+							   drm_atomic_get_old_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -507,7 +517,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
+							   drm_atomic_get_new_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 
 	require_hvs_enabled(dev);
-- 
2.31.1

