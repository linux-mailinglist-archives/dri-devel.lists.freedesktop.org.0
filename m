Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C742F574807
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E58E12B07C;
	Thu, 14 Jul 2022 09:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD02A3B4C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B4B23320085B;
 Thu, 14 Jul 2022 05:13:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 05:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657789997; x=1657876397; bh=j0
 xnmJYnLSZASBm5qUsI6skT1uE+k/RNwa37GbdtCI4=; b=o8cRRheoCTsNnvksw4
 J0N29qE+F9iywRlqELhGG6BrFbSep5HMDmFR6OrP8mzN1jN9gB6peqqI0h9qiTD2
 cW/yy/qmqcOjFx3qJd+nWOM8+D67ija96ifYaa1lCdwQ9A/dKTui+pSmTBzhK17b
 g79Lau8Ab6WRutaw2TboWjpLA6XGW0kwoEDz7uIIbYuleuc/8X33Tr4f92tJ5a01
 e7WRdqkVNr0nEPbrFdDIiUXk5oeS0rHg0bC+Gd4pwIWzl3+pm/XtDlmOYKCEn31G
 lP6sHEkIQWL4UJx4hLszd2LP0CRdfhT32FE1jl6rXi/g7Go8ykGnYXpeUN/91MSg
 fTxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789997; x=1657876397; bh=j0xnmJYnLSZAS
 Bm5qUsI6skT1uE+k/RNwa37GbdtCI4=; b=ObSA09p5AeE7bcwykjqDjjM5CQxsg
 zPi+Lcns9DVGBj4wmvXzZEtPBxJnkDvaz2hbrSRrij0oEohdIaOROaCJwjnJ1ZuQ
 5SALCPFTEJPfBmtBsQJHm3OdNc5glFny3G9KoQCyscOhVnzddBIAx4ZfeKy01e+D
 WKV/igNgw1PiJzrCkDl8rMHpLfDiuywSUF86Nvcfxj84PQ6UxsH/k+VEl2hqUlfD
 C57LKKe+Oz2NrFd5c2rzMN+cYTBRr5ksFzjrEdbkGfnZ4LGeLmf/C7acidTgVP0x
 XlEc1DLYyqU/Yf8Eswg4UCBchwB0emVo78TIZp62bOquhRTuncstr6erQ==
X-ME-Sender: <xms:Ld7PYnDPtOvokRAcWfRom9sNAkS8GbF3D0DX6PuJUMixZTZwPuAEwg>
 <xme:Ld7PYtgOkXE1Iza4u_eQoRSy8_a-AzmjGXMzkLDl1kyVoOxgN0icojwV0sJVarnjZ
 LRM2Ik8eAqKbuir4rk>
X-ME-Received: <xmr:Ld7PYim6maRBNyfHaRgQQhskMQDIcdl24W_RVqkK_1Iw_J7J1BB9VIjyP9cB0MGtzce9z_BiYA6BLHSkXJR9gf8edfIomE7g4DUdAcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ld7PYpyFZKPgFDgOY41Vv7GQVCLzGsGz4exjwkXNH5nyo3b4480mDQ>
 <xmx:Ld7PYsTP6pHsZwy2i8GUH7CI7vNzapphJlNFbnIzZtEoxp2q6ZvKaQ>
 <xmx:Ld7PYsYqOxk0ZFb1Zh3lAMB29CWTWf7sxA1yCgG4GtTmcjG0fNccqw>
 <xmx:Ld7PYl9FVm0tBFwKr_qlkgQ5FzMZWcIt9O7z4-kd0mh8-7wwIruTLw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 6/8] drm/vc4: hdmi: Move vc4_hdmi_supports_scrambling()
 around
Date: Thu, 14 Jul 2022 11:12:50 +0200
Message-Id: <20220714091252.2089015-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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
index 668addc8c170..2d988c73d12b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -125,6 +125,23 @@ static unsigned long long
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
@@ -684,23 +701,6 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
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
2.36.1

