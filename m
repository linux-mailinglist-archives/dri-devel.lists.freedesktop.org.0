Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F108475905
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA87210EC7F;
	Wed, 15 Dec 2021 12:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345B910EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A97FF2B00253;
 Wed, 15 Dec 2021 07:44:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 15 Dec 2021 07:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=UBzVExXLwZbr6
 3h0rBiXF1lWi9Fdtzr7OpfW8dxvoVo=; b=XSTUgKnelwTBcq6xCS5PiBeVqITCs
 Uu/sH7OJDzCfm/I6J2gADCEP1eiAeJSOuQGmRh5OOJr4ohLvaJsmgZO2wJJ1Hyaf
 sRoa1CZoT/9/ArXDjJIcYGjBqJaTca8bIQy8t5GvGIZc502qeJQUpQzGhJqu9yRv
 gNNaNizI+zfuqLBzN5XZ1JkzXLJrxnE5gr2Ks1Bqlz8A3LnmAtUMdjhYZq4F6foQ
 7lB8B4l9XIPvtQI0o9eK4zcCtaReCjNSixMhiuwecXxwu9wngASMC27W8n0pE13I
 s9g2aSpxfCOWfegel8B/OCMaCWaHhYGMEnfnnZuOg1yQQu9bvGW92G3Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=UBzVExXLwZbr63h0rBiXF1lWi9Fdtzr7OpfW8dxvoVo=; b=ce0GI8SH
 tv5pChYup6TIvy3GWEq7ax8xX5FkmbuZsjrn5vvs3h+w7+VY/WX7KNqzQU6ewAHo
 Ing4NibOF5fTE7mz3MhdSKsysg2sIy2cwSZF04CTj4hO8vRJb4Fhp+kURCWzRx/m
 OUsfsHM5tEyBvRusDu4e28qSozHGkDL+lndnp2AazlZRvRKIU7CLTNCxmuAmN6em
 KO407od9LdBbKpsbTkc9NnLAqhMIXXYjcN3Dy/ln7FtE+DhTSkHdNaQFMjzPfzU/
 dJ2k7/e69XcWXt1bdk7YOIj7WhMposi+ecPow1rzeTofln6b4e4bJahQsKTvrjuF
 TeysY7vOhYTUgg==
X-ME-Sender: <xms:HuO5YQtgbv9GhEeODG_NgKnmf3Po9e-tAPIkfrnKhB48YdeHzopHBg>
 <xme:HuO5YdfiYkieEwhsaVJZTwiF7AoX9FZL18Q2J34wzBw0BHwyMg0uc_J1W2CAeID8g
 SviEl6lUKLv246NmkE>
X-ME-Received: <xmr:HuO5YbwXfDGubeTmFRfqn0C6qAesbm8vXne9UO4-3N8cGmz_OsmuFu2DScCQzJvr13qHc1by4fauPCVK6LDMY9-ucpH2o6MuYr0oUiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HuO5YTNvXL2p0YZ7TH9kRLQCg-WH8Qup-VoOyJbLOlRgnJPH6VlEFg>
 <xmx:HuO5YQ_viqUVmtrUO5bmqG2br_aSd6F8DgKfxWArVluB6JgttpkERw>
 <xmx:HuO5YbXfqTMHsaSEWlu8phW3AwpsTpR_YgGO-Hj6GTfQ-Jks06dC3g>
 <xmx:H-O5YR1jV6EtEjsjZvaqx5CUt2APRc4BLvS7NLxDMyjCUwIwnRorNe9ekqc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 01/14] drm/edid: Don't clear YUV422 if using deep color
Date: Wed, 15 Dec 2021 13:43:53 +0100
Message-Id: <20211215124406.340180-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code, when parsing the EDID Deep Color depths, that the
YUV422 cannot be used, referring to the HDMI 1.3 Specification.

This specification, in its section 6.2.4, indeed states:

  For each supported Deep Color mode, RGB 4:4:4 shall be supported and
  optionally YCBCR 4:4:4 may be supported.

  YCBCR 4:2:2 is not permitted for any Deep Color mode.

This indeed can be interpreted like the code does, but the HDMI 1.4
specification further clarifies that statement in its section 6.2.4:

  For each supported Deep Color mode, RGB 4:4:4 shall be supported and
  optionally YCBCR 4:4:4 may be supported.

  YCBCR 4:2:2 is also 36-bit mode but does not require the further use
  of the Deep Color modes described in section 6.5.2 and 6.5.3.

This means that, even though YUV422 can be used with 12 bit per color,
it shouldn't be treated as a deep color mode.

This deviates from the interpretation of the code and comment, so let's
fix those.

Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_edid.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..e57d1b8cdaaa 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5106,10 +5106,9 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 
 	/*
 	 * Deep color support mandates RGB444 support for all video
-	 * modes and forbids YCRCB422 support for all video modes per
-	 * HDMI 1.3 spec.
+	 * modes.
 	 */
-	info->color_formats = DRM_COLOR_FORMAT_RGB444;
+	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
-- 
2.33.1

