Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B944311D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE5772E78;
	Tue,  2 Nov 2021 15:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705BC72E78
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B9E2258073F;
 Tue,  2 Nov 2021 11:00:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 02 Nov 2021 11:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=itbCaC04G97a3
 W6NoAeVEH6oF12HmjCj6FINK+UTdwo=; b=UMQhWTOYBeJdSlt3V6ULnVHrJHwjX
 6496SWE8Caqv90PYlPVAdlc+WWuB1QYvTna0m0FE3S9hPHKGyxPxL8VNZH+9R1Ww
 B1JCXzFv+XxC6oveutd6NSVZDXxwOiv8dbkozNI7l6V7omwDLW49m0x9nrZ5cFmH
 fNkGAnAFLuQAIu7AJqXxpy5e8Tl6J3aC6RFNA3PsNcaVjg/lcwL+j9WyH/tbBYBX
 biuz6TdYXBwTYm8ZGxrB5JBTelvldwLsmrW2vtR65lHg3FGVx9tHZrE1MA+G9Ces
 tgHzZtCigJ/3nKi5AkcKi5OK+6O0oNaJv3nRjWN68qN7UwV0ja9hnHoFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=itbCaC04G97a3W6NoAeVEH6oF12HmjCj6FINK+UTdwo=; b=VCDQHb+R
 Qa317YN03FdA2Zq/jmcwQ/LNN52kvmaXxuaG6mjv4v/xfT4FpYVA/YJpR1lNNNi8
 C0StR/SABO3O9WQqvrbn4LTmUYjOwjgHiHeDT3oviZzJxyI8btKYLXRtzJCASNIu
 KcdOSgGYTzJJ4PCzOhUNEoG/Y7ahFh1qGayWzFy6LpRNMcfppCfTppa9PTgepFiE
 shq+k4CCtXapLg0Kf1V9O8wLT+c2gCjIorjxjvb50g2ON2SVUc68wOwuUHCdwsAh
 bttltGHcaN0c5wZV5jhZeaOOC2m0qzYx89eTMQL1oufSakoPCi1QHBC0OsSbQ5cn
 i1n9oJhtCj4ptw==
X-ME-Sender: <xms:c1KBYZHdRVjLMnXmIDO8z9jFkSa2-D0wCDrP0Z-tnw1xKR3xnTfJxQ>
 <xme:c1KBYeW4caKP1VZFzP2C96lEIPAfits1ZEwDGx0hv3cPEGPk39-VI7eFfvy6U3XbM
 65FKlAaayaoJtsJ4Uo>
X-ME-Received: <xmr:c1KBYbLPBVftFeb1r7SzeyXd-Pv62pclEJNKrXD-JHPd4bd9Xvb18cIq3rl76q0wcvC_2ea6dUXTHNKvU0byi3M0rnSutdZQdPpto6aE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c1KBYfHGDl9bFhJKi9v7vYGH9L8yxcuIpSFviZxrJxk-MkJGoj_iOQ>
 <xmx:c1KBYfX-dmAYp09GeeyAKSZQcaxes4RAuIOuXbg4vIqYXJRdTqB2oQ>
 <xmx:c1KBYaNIffwdf-1CAnHL-XYWbN6RyEKJYn69R-qMTDqcmK9_zwOI5A>
 <xmx:c1KBYfSFl-IqYfouMVFXpkLESBAM2EO7HWotxDljqdNgO8CzvHzG8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/13] drm/vc4: hdmi: Remove unused argument in
 vc4_hdmi_supports_scrambling
Date: Tue,  2 Nov 2021 15:59:37 +0100
Message-Id: <20211102145944.259181-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though vc4_hdmi_supports_scrambling takes a mode as an argument, it
never uses it. Let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fa76ae2c94e4..49bcb0342cc9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -568,8 +568,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode)
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -597,7 +596,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+	if (!vc4_hdmi_supports_scrambling(encoder))
 		return;
 
 	if (!drm_mode_hdmi_requires_scrambling(mode))
-- 
2.32.0

