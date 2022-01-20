Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E311E49512F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F7610E3DD;
	Thu, 20 Jan 2022 15:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F56410E3DD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C21452B00152;
 Thu, 20 Jan 2022 10:16:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Jan 2022 10:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=5zpxB+F7Bvw4QkiHZ8eQbXkETrRWYl
 WBRAllblwMmPA=; b=G7dngpP1GCbLzm1/0M1g5Cp97S1Cnc1Ue4jErNifHMZAwb
 9fzXwVHp2FmNIvTqdbnowCpHR60GoLmb9mnXgsmaoE3l/DGGEqTxJ2z0IFDJG28r
 l8yPHnDXK9OdtOxot9xl8uMBVhFErN4aa49qFqAibgXaw+TaMM8ximXwCsBv6SZE
 gu4OMG8NDvetQ4QlNqZDZ/LH6Sui5nMmV7V/wowA9tQNwFv6QjXx2OW+MkQVbmsH
 Zn4qxv/bWdDFkg3xOjKxMHhchBm9t/HT7Pf+uwhC2SwuDKrU/+0nV1onG0DYIR/1
 tCs1F75vor+D7AHUWpcrsZFHfjlPW2QWqUbhfPVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5zpxB+
 F7Bvw4QkiHZ8eQbXkETrRWYlWBRAllblwMmPA=; b=oGtnnrYwKYIhG0DQArik5y
 18m5lkDL7/Fmtpcckbzrn96DQbu3pZX1DIaOIebv7hMqN4NtCrz7MBrHqFAcWGU2
 Q5GXIZYgaR/4J/mAL+AtNpgKE3m+Ha/XuNqgauvpGevfzNu19uacAvcFW6KeHQoD
 Yao3GgdYMZjUh/KFIrllKWmbKbrqfP32hcuPLsgJm/RimMixt2c19GXR1K+CrOZo
 dwg2IcQr9HTq42Y1m16OuTTyLonh3yiBKCWnkT3Pajuzm5Hh3b2BiuWRKTuAP4Cw
 m0DJViQTKXSMPmaFZ70vyOe2eII9IIOnGYCcep0iaoZWvPzonl6AGHzq5S/kXieA
 ==
X-ME-Sender: <xms:1XzpYTCVEu--47n7_iwomF6iNRnmufsQqUqAr8uiWa2XYXTenc__2Q>
 <xme:1XzpYZjBKO01bBgQ7fdn0gpTx7c3kvAC_iQ-pKYHleU070K0Qa6bid0pG_Ryz8y7F
 7cVoAHOa6srWjNuHyg>
X-ME-Received: <xmr:1XzpYelVyddOnfwjfL11ZJzZzYeAVkfLz7avJMJN1v3H3ibcC7uak8X_H1Fl1Ra-jBLHzHD9KVYbszHsr8JorwIswPnih8lPJUDI1zc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1XzpYVxWmEl3roVSx4GRig8ZAZahU2btzq45ajNaYxo9sYXRUE6COA>
 <xmx:1XzpYYQxh9Samnyt__3Wd5QBKWJQD1ypnaC-qlHOCTuTWWPSzsXJMw>
 <xmx:1XzpYYZJo5Kee7VNY0wHencM1avjhVy3pNLvETqaDpwJEmAf04p7Ag>
 <xmx:1XzpYdIs7YRtSea9e8rfhr3iO9zrDzRIbXrS8xPxoNHI2GLNwLjQRwODKag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 02/16] drm/edid: Don't clear formats if using deep color
Date: Thu, 20 Jan 2022 16:16:11 +0100
Message-Id: <20220120151625.594595-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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

This is also broken with YUV444 if it's supported by the display, but
DRM_EDID_HDMI_DC_Y444 isn't set. In such a case, the code will clear
color_formats of the YUV444 support set previously in
drm_parse_cea_ext(), but will not set it back.

Since the formats supported are already setup properly in
drm_parse_cea_ext(), let's just remove the code modifying the formats in
drm_parse_hdmi_deep_color_info()

Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_edid.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13644dd579b4..5085ef08c22d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5104,16 +5104,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 		  connector->name, dc_bpc);
 	info->bpc = dc_bpc;
 
-	/*
-	 * Deep color support mandates RGB444 support for all video
-	 * modes and forbids YCRCB422 support for all video modes per
-	 * HDMI 1.3 spec.
-	 */
-	info->color_formats = DRM_COLOR_FORMAT_RGB444;
-
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
 		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
 			  connector->name);
 	}
-- 
2.34.1

