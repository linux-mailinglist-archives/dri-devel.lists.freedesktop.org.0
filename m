Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF8439A79
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394F56E0B7;
	Mon, 25 Oct 2021 15:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969F96E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8A7105806D0;
 Mon, 25 Oct 2021 11:29:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tv+wbTU6J0Use
 +mg4lA3ejbpWxCxckfSkHrhhUqanZk=; b=f0wSwCNZw0gIqCxADFwIGVr8tjfhN
 J6DpNQLhgTGrnxHcqUu65wuZivkoE+rECGhmmZxoqB/XjzugWU2+J4AeaK6n50GU
 e5Kb2ZSdlIEQdo1fDwsXlBMVYkHKuaunnjGcj2+5zSi4+2+RBMZwC8jKJje6mN0V
 inLIjdhC0y8eFbwvAWZKSBg/hbqcipAsYZ6BVL+Ati0KWK7PmXtkwvdU6vtSkCGA
 ARiaueEMyQKd2GJp0NAC3aqvSJ8bK+yzWBfYb/X2baWGnUWllKgDNE9Eum/iYCUt
 Y7oYBGdTzcsxC7XQrP36LFKp/yzYzxudhC7p3h9b1/LnqNqjdbF6dzVHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tv+wbTU6J0Use+mg4lA3ejbpWxCxckfSkHrhhUqanZk=; b=LZHxIuJS
 QxFinvSZbAsxCcKABY1hOGxTdEb301htkVXYvtBOAlwxFW+QRwiwAS3tJ1CSyv7T
 VHx0hFwvPhlhN6LHo2bU1kEK7wnnoI4X+ixY/gHNlKlD90xJRSdo+kO+mYmYFGdV
 ROcOOCwm4wcVSRTSGBJZTyelfO7G9P36Zg+V3ywIhoVCo+uJIp/eLTBjCxW9ngqC
 5kwooIEU/bEnEyyCQypBFHQOFO9wu41X429cKTpjypdrDxWlM2FbU0MtXCEFc446
 R0mnxc81MEuiFH6h0kI951nuAGElM7Hn0HNV0IAsdmYb8szLMfW3b71UPX/UY0Nv
 NA8CCdYvK3RksQ==
X-ME-Sender: <xms:S812YQL-1neqKxQMZLOhFsHzHAE1F9g6KXnk6RQ7AERzIgZhcoaZRA>
 <xme:S812YQIPjlxLuwlYA7l3dTS3LqUoJ1wFtoHKI7_kE77Q35pkd-NNgfeC74mM0_Tml
 1CVwU1YamLv1HJ3OX8>
X-ME-Received: <xmr:S812YQuIMJMzhH_pfKAdS2aKNWIOki7NJsvnJCpEJ7rL7CxLuBzAke0YmwKkNwrxnxcZSifLGYn5XPS8SPYf7jBZ9w_ZxE5lQKvKMe6B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S812YdY6634Mb_rSvlreiVuBfep-vcF7fbeI3ZTGbI1UQMx6jqxwbA>
 <xmx:S812YXYVkG7zFY8g1Fqb1rx_uBFkMIibw1Ee94A0QbKoX2wuRfP6Fw>
 <xmx:S812YZDDTySnhRhy0Z4C9ugj1gmdsnJCASXOzyytmOLwrb4GM2OsgQ>
 <xmx:S812Ydzk-G8EKnpt91YSB_FxLZKP_B1nbjXbaJQenl9j8A1nNxb1Lg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:15 -0400 (EDT)
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
Subject: [PATCH v8 04/10] drm/vc4: crtc: Add encoder to vc4_crtc_config_pv
 prototype
Date: Mon, 25 Oct 2021 17:28:57 +0200
Message-Id: <20211025152903.1088803-5-maxime@cerno.tech>
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

vc4_crtc_config_pv() retrieves the encoder again, even though its only
caller, vc4_crtc_atomic_enable(), already did.

Pass the encoder pointer as an argument instead of going through all the
connectors to retrieve it again.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7cfd4a097847..e5c2e29a6f01 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -315,12 +315,11 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
 }
 
-static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *state)
+static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
+			       struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_new_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
@@ -597,7 +596,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder, state);
 
-	vc4_crtc_config_pv(crtc, state);
+	vc4_crtc_config_pv(crtc, encoder, state);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
-- 
2.31.1

