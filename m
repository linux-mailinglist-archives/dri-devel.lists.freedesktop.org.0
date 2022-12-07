Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B6645E6D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B7410E3E5;
	Wed,  7 Dec 2022 16:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0533210E3E2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 60D8C5C00C5;
 Wed,  7 Dec 2022 11:09:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 11:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429354; x=
 1670515754; bh=wOH8b02xWJ0mRQcHqZZQHEuSYyhICsE6ixqlZb6HdKs=; b=n
 ZjRCRXSXFDQcGdh9cZ7f93KRo2hSU5HpiluUE1BpSQAazB/QdOS4nrisMgMYpEDO
 UcmCKOekw2iPJW9jBQugsSNUFnJPgTAnnb3kE1aVY6eeA5GQlQUEP00oyYroZWTs
 O+Ewh7wM/8uFnXpK+7G4LDe4ryY6Gob3BX6Ae+HGrZnsYTR4f5EDaB/jGDLIRBSe
 Qh+daFX9nyMigC2rTuLoqFCNHYag7ygZE6qBRD7oyO21Y5o302sWQ9sLlUEhHhky
 9LZA37GQiDAFHNy89PUkRAQqg6nhXzU1xQT+Exqu8CfbSh7L8UzAf/5//3eptHY5
 hvn+5F0sBfSKaL6d26rJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429354; x=
 1670515754; bh=wOH8b02xWJ0mRQcHqZZQHEuSYyhICsE6ixqlZb6HdKs=; b=X
 VTpAOgL3rJmqLfBe801kzt+97X4nUTYMGH/80eXEwO4+PFouyxotZu5y6rdZFLsv
 SDof97mDYVmRyWGfuemlTsXMovgMNPCvZLjnavsvbgCaGcyAY4EqwgmxUTmBNu6W
 HGlrtlPaVFz9GVE8ZLrMb/Xla1MeZ+BwnMu6c8i6THPUCQeXSyhAKYMJDDbItTfO
 Psq15og/cLLGugi9ogyJN7tN6MmeoMsrQZGMXzyb/6uPLsl2VfFnWcD3VHANN+H9
 BlbbRg3xCtj2ZoT5Q4yJ35iNslczB1vWdBSF6fFEWzQFZxs3BJiHU2wW1dNpbAIH
 cKZ2rmxuc8EPMQDtSHsQg==
X-ME-Sender: <xms:qrqQY8UsKB_huku0GFVVh2KWBE5Pjp4YKUt869AY4MaASXjFTZN8gg>
 <xme:qrqQYwkq5r_-Nrx5aynR2Xx1K_yzQdu6nvWey9z6njwL1dj5JKZzAqQp2VIElmTPj
 qKiPEtTCWR0f1h9JBs>
X-ME-Received: <xmr:qrqQYwZUcAT_uNrgxWhV6l5Vy9nCzL8GT26jn3JQJS3g7KpolbW0lcU6xF6N3_EpR7mYU2vJTmhiktkqwuv8PSUqfXVWW2hlU4vkVKluUBP8FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qrqQY7WWvL3bNeDV254O2ifM-9PLk39aUrxu9XwhRNzTOQXetZkicw>
 <xmx:qrqQY2mN0lmL5Dirnp1Egwo-nk48gSTAR3pO143pjYBKgY-itDtyrw>
 <xmx:qrqQYwcoZVXJvgRbYoiIAxwkekbPtjleWQHzRjCEn0jGdkhUUoKJxg>
 <xmx:qrqQY79XF1sHwLZLybWVDw0ZX-3SqQkEttiCCE4QGqVzEj51bgJUaw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:48 +0100
Subject: [PATCH 4/9] drm/vc4: hdmi: Rename full range helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-4-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=vvagXCydGCs7AAmT7tK7VEtuwCOyOXRnqiXl7KI3dvs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgXdrNgfPKvm5vyJG9b+UJjzcNnR30z7zy07W6jz8laN
 7ml93Y5SFgYxLgZZMUWWGGHzJXGnZr3uZOObBzOHlQlkCAMXpwBMZBoPI8ParTlfz1wsMHy3xnvnW5
 fWg/unfV6V4yK74eClnOnBarnzGRkuOCe8+r9rE+PhhoBFyYIv1p7L/rp7V7T+ibfv5rprWTHzAAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The VC4 HDMI driver has a helper function to figure out whether full
range or limited range RGB is being used called
vc4_hdmi_is_full_range_rgb().

We'll need it to support other colorspaces, so let's rename it to
vc4_hdmi_is_full_range().

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 488a4012d422..51469939a8b4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -149,8 +149,8 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
-static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
-				       const struct drm_display_mode *mode)
+static bool vc4_hdmi_is_full_range(struct vc4_hdmi *vc4_hdmi,
+				   const struct drm_display_mode *mode)
 {
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
@@ -892,7 +892,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
+					   vc4_hdmi_is_full_range(vc4_hdmi, mode) ?
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
@@ -1145,7 +1145,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
+	if (!vc4_hdmi_is_full_range(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1298,7 +1298,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	case VC4_HDMI_OUTPUT_RGB:
 		if_xbar = 0x354021;
 
-		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+		if (!vc4_hdmi_is_full_range(vc4_hdmi, mode))
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
 		else
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);

-- 
2.38.1
