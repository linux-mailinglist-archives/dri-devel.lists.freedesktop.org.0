Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97CD3F16B1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156456E858;
	Thu, 19 Aug 2021 09:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1426E5D2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8A473580B71;
 Thu, 19 Aug 2021 05:51:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 05:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=77NxfyfOo9DLw
 z8TAC3B5G9MPinKPBqJ4QlxHLjZkjg=; b=b3nbqJobiGihWiMYPtXm0rZZ0NO+w
 p+itYxe4pavgcRKlr+WPfl/IiV4BcR4UwCaSI2MBAns7Ut0XfLA3S+GknInc1ZBV
 vPpUAnz0oj74jRGkyuRm8f9BnFfIqPrFV1lRl0P0u0zhqPBup+c9NNlK93f3gcdo
 c8fs8fHNLU3rLXTasE8bFwqxIaVmniH/DdwjH6Z1Ym+SLTV6etF+CM4/LTt6SDpB
 sl/Qnfi8Ok+upksp3RA8HFUCZ48FAGiG39FwLugVESMbOtQNx5867mXJeNSJQA2C
 UlQuDMqv8EiPlioBVAeDoqpdgdMTWiFiXtVz+FcCL4Q7NjmM9lkA3mjlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=77NxfyfOo9DLwz8TAC3B5G9MPinKPBqJ4QlxHLjZkjg=; b=c2Ib8edU
 TYX1j0ZY3RN4StyAE462NRpDVIUC5o8aaNZeLfQIH9/TCeLEdZ9iUB2T9hwmvsBt
 0yP3kn5BwjAsqt7fXeiJIHUbsMOD10Uzr7BGZ51uSX3G1ZYiZ3M//OV5yhof06XT
 kib6pfC+e5H706rw+r3va15fA05Lw6x4iMsOiMVDBRCNiolayqUdAP3e9K33EJ6e
 4i6h/4AkBTwPvJoHXa1cF9NR9JrZJqI0mOwzFZvXJWAr9/ufouv5wJZvlLe7NlvP
 xdnKlwW2KKml/XWxwmsns9do/iZzZQVi8mEtfR5PWcYgSDKFiwofxjKBuQT65xvx
 GWMhn4aB5YShYg==
X-ME-Sender: <xms:pykeYY2gtwp1SvN7y3yU1lncKwLCjA1Lyck904Zigdb9no1tO6QiRQ>
 <xme:pykeYTEmYBq8CqhzM1XWC2VQIGrJhi2kp1ginWsR-9N9pLzYVXZVLj1MFKbwMmc3D
 i79RX1svudQjiwhx5I>
X-ME-Received: <xmr:pykeYQ6hzEeDqTzPrSefCkGzvNCA9KN65RecT51ALANfbL6MIfEW6cThXk3NT6bVEDCPsdnpxVAoD9rMAv-0Qnw_KUGEDpHJhWHK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pykeYR2TnkzcGV4_fJRPqpelnLXYvqEMNF14iLWfcMYpi0oXUbHjeA>
 <xmx:pykeYbF1sBg7Ub72bBPwUCCu4YyN-mKR3ONqxzOqQW3nCVfHsaa_PQ>
 <xmx:pykeYa--8YpQYqlJe0mEpreAOnPFBqRvwUcnhR3bzo82lKmwWSKPyw>
 <xmx:pykeYYc-GaIi7qTemy83WQUAmqg7tR-YIxdTi6kHzbMdP7eoauxkdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:35 -0400 (EDT)
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
Subject: [PATCH v7 04/10] drm/vc4: crtc: Add encoder to vc4_crtc_config_pv
 prototype
Date: Thu, 19 Aug 2021 11:51:13 +0200
Message-Id: <20210819095119.689945-5-maxime@cerno.tech>
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

vc4_crtc_config_pv() retrieves the encoder again, even though its only
caller, vc4_crtc_atomic_enable(), already did.

Pass the encoder pointer as an argument instead of going through all the
connectors to retrieve it again.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 902862a67341..93d2413d0842 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -313,12 +313,11 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
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
@@ -580,7 +579,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder, state);
 
-	vc4_crtc_config_pv(crtc, state);
+	vc4_crtc_config_pv(crtc, encoder, state);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
-- 
2.31.1

