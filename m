Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF329FF94
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE7D6E967;
	Fri, 30 Oct 2020 08:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242866ECBC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 12:25:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C10F7580518;
 Thu, 29 Oct 2020 08:25:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 08:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=6EQlP+QGHRkogkEJOSa/mjPMd/
 dcifzWBOtZuULOoew=; b=UkmwfPRyP8wXV2xeVvohOpniZ95gaqCrurNEPPLw+E
 koKnJsuFeAVfeJ+GpaBFJozyY7Zli/ezaUB5vb9KLgonu7tDZQ2C6LqRHIq9VMY1
 Ge63FSHU8AJ71HfUxzSvVZmyUUzbEbwNjSBjMzNTmqjE85owGuQwHoXn+iVlR/6A
 Dhxp+Y3oQDnYVhY5peU8G2q/oVeLIJPQFllDmvpTfFGtgJsfLc3gVCL7YRi8O8YM
 Toyb3ukJ1uQoEAgmij5yNKqe5KbbWX4+J5nbxwyAxN7lVjcpCQYGnsDC8Rp7dZ5d
 9Enkp6HD2vDhv8Z8LyRBs/Rbwy2HjU4l63jDLvazl1hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6EQlP+QGHRkogkEJO
 Sa/mjPMd/dcifzWBOtZuULOoew=; b=nwURPV8QTUv/E8jF+ae5gOSFy5eDhC3Tl
 X6C5Np4UXdsx0s6clCEtpzamipMnUoJCZq+4va3swRHHsCVSf4K+fdx7nFDn/s34
 FW2xp5W53GMpYMj/IwVaYZeluvVphMDIaQwjRwmy8QMJ5BBOfxgbs0u4qPEMmsRw
 p7JLfkceN5PSr6VPT8c5CSaHsl0ZtAMHQ87+r3eWebNNye9Ukdp57OzVQ4Q2so0z
 nOQxNJ9zYz2dljfHmV/8FsSg14XQRGKZ1Mn0K6BqY8+GwElOFRINqhakpbrBvRnX
 H5EEq1yBG7H5ujO39QTy9eGOBDc9UrlH4oU7oYCwR+kwQ9V4fzE1g==
X-ME-Sender: <xms:tbSaX5AHrL3ePlihy7bCznzEWOg_YWdrTKhauET-8XNYMmBZW_JKmg>
 <xme:tbSaX3i0wHHYIhQwHzIV39cPCska5K6nRdxAiUpdwhYQm7nMNg6FcyIZh3uDAun7h
 9G_X68LxLDFVFBW90o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tbSaX0n_MPcNwlDyeXMEZLx9byYbizlFUhOY7tRKLMwncVM9iPrlzA>
 <xmx:tbSaXzy0Zy-s5uvCtkSZrPq_KICu9Y4FlLDIAAEmfyqnz1GF9fbAyA>
 <xmx:tbSaX-RpqcaLPwHXdMrOrwC1alGbOa8BKO6UjktxoZVgoGQd_H-flA>
 <xmx:trSaX6pB8i1BPVeqJ7vup9EC0P-WlFgcYM1MDPOswMaLrAi3kRhcxw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6201B3280059;
 Thu, 29 Oct 2020 08:25:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 1/2] drm/vc4: hdmi: Make sure our clock rate is within
 limits
Date: Thu, 29 Oct 2020 13:25:21 +0100
Message-Id: <20201029122522.1917579-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controller cannot go above a certain pixel rate limit depending on
the generations, but that limit is only enforced in mode_valid at the
moment, which means that we won't advertise modes that exceed that limit,
but the userspace is still free to try to setup a mode that would.

Implement atomic_check to make sure we check it in that scenario too.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Added that patch to resolve a conflict
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e8f99e290655..3d0338822cd2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -760,6 +760,20 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 }
 
+static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long long pixel_rate = mode->clock * 1000;
+
+	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
+		return -EINVAL;
+
+	return 0;
+}
+
 static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
@@ -773,6 +787,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
+	.atomic_check = vc4_hdmi_encoder_atomic_check,
 	.mode_valid = vc4_hdmi_encoder_mode_valid,
 	.disable = vc4_hdmi_encoder_disable,
 	.enable = vc4_hdmi_encoder_enable,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
