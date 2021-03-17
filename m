Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4AE33F419
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F172F6E81A;
	Wed, 17 Mar 2021 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2D6E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8060F580E69;
 Wed, 17 Mar 2021 11:44:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 11:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=7HzWK3OF86485
 Dl+CCTKib6H6Txaqx1Gtm/ZPBCmtB8=; b=JzoQQ8QJSeNOqj6DNd2yy2+QNLVXe
 7WgWGfQwk/HVQcbWE14ps5q6qD5r7hJ/qhcDE0k2X40FR8t93MaOqszOG82gj4Zb
 rc9og2033nc1zNgJiXP1xA+cfAbOtr4Mp8JUXI5oLqdnmE/HbUOkpmE47Fr19Xfc
 rk5qtS0mms4brDGnUGZwbcmUkmMv4awor3sINBRitkrabCt/5Prwez2mtggfVOB8
 k10T9sScyk+pQwKMWjk1wvZiXHBc5E2LlZ4Jszi5gauzEEMOziA79U/yxve35OlW
 k7HnJFQife0HvzNZaNOv1OVglL8wvZcZopAIjfKwaHM46tdcbnV3o7z0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7HzWK3OF86485Dl+CCTKib6H6Txaqx1Gtm/ZPBCmtB8=; b=iDvsHs1X
 zFV88Ffjn9i/lyBPxoC13NHsv+8XDp0o/qOX1YZyVjJP7RGA1da3To26aclYgm0s
 3268z+vYWYp/KASiyuWqIA86o6BkI9VDfvwO8dPvBU8bPSaW0mlF1m9X267rR0BH
 TRQKBqzaVx70GpNwcWHKonTY+IBzgF0Z1BzxidRKuhmOl5IUIoTFoOXPctftk39f
 g7X75715fA6t8sYBFujQfhcOE/TBsvaCWbfXBQJF4RIeEcMhbbWt4PFY6R3OaRGP
 7Pav1QMXwGXCdXfjVP8SXtRMs71po6XWun0v57LEl6ba791enb+m7XRtj7NPKS1x
 AWHZCT6X9eG73A==
X-ME-Sender: <xms:wyNSYOgANE3M-L4tu7TVBcoeMgIGDtAYARX6ZjHkXkpeDKA0osxp5A>
 <xme:wyNSYGZJ3asMdJmlhWtiOJFG9LLgu9C5zXzcssiFZRMBl4Gm_KNDi4obrNvttww4j
 M5FOMea8LqCOf-o9Y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wyNSYLro_xmWPem1mZCS06l-ng2lR3KBL3BW1Fvi2NcL0o3t7jsVlw>
 <xmx:wyNSYDMPyb9xPiULHBY1flXQN6JZ_ItVc7FI9XfUQzK42dzzokuCMA>
 <xmx:wyNSYOq49heVKzR2059GWoe6nWZbfcxaFHI3oMUPSZMLejti--XFiQ>
 <xmx:wyNSYJBYPkGxHtnaIlUUkB9aj1gj2Z3q1olL5_hvGb_bSfY1_a7YMA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44BD0240065;
 Wed, 17 Mar 2021 11:44:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 05/18] drm/vc4: crtc: Skip the TXP
Date: Wed, 17 Mar 2021 16:43:39 +0100
Message-Id: <20210317154352.732095-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_set_crtc_possible_masks is meant to run over all the encoders
and then set their possible_crtcs mask to their associated pixelvalve.

However, since the commit 39fcb2808376 ("drm/vc4: txp: Turn the TXP into
a CRTC of its own"), the TXP has been turned to a CRTC and encoder of
its own, and while it does indeed register an encoder, it no longer has
an associated pixelvalve. The code will thus run over the TXP encoder
and set a bogus possible_crtcs mask, overriding the one set in the TXP
bind function.

In order to fix this, let's skip any virtual encoder.

Fixes: 39fcb2808376 ("drm/vc4: txp: Turn the TXP into a CRTC of its own")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 269390bc586e..f1f2e8cbce79 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1018,6 +1018,9 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 		struct vc4_encoder *vc4_encoder;
 		int i;
 
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
 		vc4_encoder = to_vc4_encoder(encoder);
 		for (i = 0; i < ARRAY_SIZE(pv_data->encoder_types); i++) {
 			if (vc4_encoder->type == encoder_types[i]) {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
