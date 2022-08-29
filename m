Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8B5A4E7A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB0310F2A4;
	Mon, 29 Aug 2022 13:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7E810F29A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:48:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1D85F3200495;
 Mon, 29 Aug 2022 09:48:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780892; x=1661867292; bh=yS
 yNXgTYIIeutcHr2ZuayFu0Gm/8tGQhtwb4ov9xbsI=; b=hNDGx4NUTOizYur3Cz
 JaEBwwZLPXO7P0bhjxj/71A4a5U56xdmsDtckT79ztJ2SEPH/n26vemkfg9P5fkq
 4G2fm2bgU0z4w3vyc9BClkPjXtQzSHWw21zSOPZVd1jLCIvpU6E2lD7WVTdt9oPK
 ZnR4H8qVWJybPxf+4mJp1BkBLPrmohwRLxlfJ3m2OtXVdjQn4NlwOMXD/JCvsju/
 zZ4VG6CZ7UUd0tsqXWqUzi0XFTxcJOq4uN8NkcC/WNAbWEdwIOis3PUU0w/oASwp
 tVdmhpYcp4jxNc6aCnGIMONC4Rb93dVzHzWtbY68SoXpDBkz9Glu98R2WMxpJdNi
 cnUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780892; x=1661867292; bh=ySyNXgTYIIeut
 cHr2ZuayFu0Gm/8tGQhtwb4ov9xbsI=; b=k9lwwpIl8rl0NlOjSGRiKqsZlsFXz
 xtCbd9fQQXKpLvDtcHYV74hS4GWjjEdoM3CUpyr2Z+aukizFpUatdygmCfFLFZP5
 VoR9Hn8kb4Kk70b0Mh8fUMrqZ5MfAGK7EqJ4poCixpBVysd4D4AqgehnepJHfx2S
 OSVlAe2LNHOX0+1QO2ou1U6TBpC9spHPR9SQAoZQF2uVOwXwg8EqKm8eriQulaje
 dm6zzj0zsmftxBbnWmReIO08/xwzanaMTg4fzSRP7vSpSDE6pUXlqfijtwjbiriQ
 PDHC/YPHEqRxOA/Ga0vpS540tWIcDgTBazzoLyMP36K2/LOp8LrosMzRw==
X-ME-Sender: <xms:nMMMY1-8yQF8m1j8syab3qTHiFlVVIlrNhOImSU7DkZ0Jy-1-UUqkA>
 <xme:nMMMY5uqrFNa34QVy3fK2w3Vb9q_DEb8kZkmXXxQvXxuFhjE7ONrvq04Cb4YKObdg
 VleaOfggw3J0gpLRkU>
X-ME-Received: <xmr:nMMMYzA-EGqSs0i7r-0wC7E4KM4WY9HGk4noHHx-0w5z6vzHeyGtwhXD9j5a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nMMMY5cG7fnk4_3Clo_FoZMrB84gNVSSHm7VlPoRDjSltS_VZq0C1w>
 <xmx:nMMMY6M8T594wp_20alpqaONaKfhyqrCXGaasSeNNTWGB38V5Sf15w>
 <xmx:nMMMY7nfYcZa7OEs0Z77fdziH2XuxTg9sFMeWEfPJ2S3gcu2RBKbSg>
 <xmx:nMMMYxr7vAgMUIo5C23Ch7NfTtGeD9DiWq2zWiLf5QcKkoccWvOqzw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:48:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 6/8] drm/vc4: hdmi: Move vc4_hdmi_supports_scrambling()
 around
Date: Mon, 29 Aug 2022 15:47:29 +0200
Message-Id: <20220829134731.213478-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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

We'll need it earlier in the driver, so let's move it next to the other
scrambling-related helpers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d385003d7f42..a510da7462fd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -124,6 +124,23 @@ static unsigned long long
 vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
 				    unsigned int bpc, enum vc4_hdmi_output_format fmt);
 
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
+
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
+	if (!display->is_hdmi)
+		return false;
+
+	if (!display->hdmi.scdc.supported ||
+	    !display->hdmi.scdc.scrambling.supported)
+		return false;
+
+	return true;
+}
+
 static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 					   unsigned int bpc,
 					   enum vc4_hdmi_output_format fmt)
@@ -742,23 +759,6 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!display->is_hdmi)
-		return false;
-
-	if (!display->hdmi.scdc.supported ||
-	    !display->hdmi.scdc.scrambling.supported)
-		return false;
-
-	return true;
-}
-
 #define SCRAMBLING_POLLING_DELAY_MS	1000
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
-- 
2.37.1

