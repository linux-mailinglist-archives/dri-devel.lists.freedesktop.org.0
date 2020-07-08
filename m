Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419821995E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8931E6EA2B;
	Thu,  9 Jul 2020 07:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24D089C9C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9D2DDFCC;
 Wed,  8 Jul 2020 13:43:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XIGHoVyKVl+8H
 LVwqQB8anvL/xz0waLiYdjV5qd5jgw=; b=owLmGY8b+ZajTAHOm+Y+XSTT5d60R
 IfOsPXvhX87DaSnOG96+xhmX/0VSb2H1rXa9majkev/8ZDCT/JAb3Jdal7oIu5IE
 Jr23YZrqelYPhhFUN0EbG+Co8tMnV5tjtJrUU3KZQVYGuOmFJhg6yO3BdufkktQm
 gZpbsu3h9947GoZvf45QpYCQM2XmlV38E+bQWcZJP4HsBso9mEOSFT8z7drzESoU
 A4s7gzN1WFHVrKjwxqhTpFzYTC2Fwyz78b9Hb6YGvlmIIHOdkJkhfLFNTVBvhcvN
 GbeAjB4iq0D/TcmdYpTAXAFKYQQync0+Tcwxhdes3RrxuSYWNMCrCSisQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XIGHoVyKVl+8HLVwqQB8anvL/xz0waLiYdjV5qd5jgw=; b=hHP6X0ng
 ybjYkRBZR6lxdzmAqEnN26lGKL6jWChh80exmxFuYD6886RICUZLaiprzQgBPCNB
 KjnUzckL98CDLbG8c4t6QMq+S4leEBdeSkFaHygFR3e+q153vyo8QWpAiIeHVkDF
 CcWdnScuTNvW1lQvOIeb/MfzSQ8L3LJoKhxHMl4EVLwRFoqyqtr9m7KM1imMBGgx
 dK+auiZYh2bzbPFlkZw1cwJfKwFc1IwWMEpk6Yjkv93wi6VWt34VQjAOlWxLxQPQ
 Fq77PIrYrLoFSozY0dZHdP0QLg70ami03ENPejMXuvxEMkGf2BnZF8bux1gPsKnR
 hmqT8rkHLJHPbQ==
X-ME-Sender: <xms:wgUGX1XxxqtH1sBRzvDNa4whJFHNtr2QFOBpz6eaAaDbcZspuDlybQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wgUGX1k72VhWsQWFoLalH-848spE0ss0-O2aJn1iEsTdJdUEBQSX1g>
 <xmx:wgUGXxaTPNtCtYpRop8gQJ9AK5Qzpj4nQKNmYchAeH1yMlHJOnyLLg>
 <xmx:wgUGX4XQG7bE8KOo1b2bcOwxXH0glEMjdUrRteXbY54jHVbfYhhe-Q>
 <xmx:wgUGX9VNXHg2ev2RclWXKuraC2UVu5oEoldFREisPcgtuOhxjiluPScLawc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D71BE30600B7;
 Wed,  8 Jul 2020 13:43:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 41/78] drm/vc4: hdmi: Remove DDC argument to connector_init
Date: Wed,  8 Jul 2020 19:41:49 +0200
Message-Id: <81ce970df5507eae8eaba27ba3d66ba292b51207.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we are passing the vc4_hdmi structure to the connector init
function, we can simply use the pointer in that structure instead of
having the pointer as an argument.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1e2214f24ed7..f0fed167149c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -192,8 +192,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
-				   struct vc4_hdmi *vc4_hdmi,
-				   struct i2c_adapter *ddc)
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct vc4_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
 	struct drm_connector *connector = &hdmi_connector->base;
@@ -205,7 +204,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	drm_connector_init_with_ddc(dev, connector,
 				    &vc4_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
-				    ddc);
+				    vc4_hdmi->ddc);
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/* Create and attach TV margin props to this connector. */
@@ -1323,7 +1322,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	ret = vc4_hdmi_connector_init(drm, hdmi, hdmi->ddc);
+	ret = vc4_hdmi_connector_init(drm, hdmi);
 	if (ret)
 		goto err_destroy_encoder;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
