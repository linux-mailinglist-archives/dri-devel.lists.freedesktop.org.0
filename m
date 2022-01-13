Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDF48D96B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7003810E49B;
	Thu, 13 Jan 2022 14:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302DE10E302
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 697505807F6;
 Thu, 13 Jan 2022 09:07:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 13 Jan 2022 09:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5zpxB+F7Bvw4Q
 kiHZ8eQbXkETrRWYlWBRAllblwMmPA=; b=mrmPRa/3fae2LIr6NvRLN8qVgu9FC
 xCDFT/ZyuTWpEMyjNGuBzGN1TAgE/FariY+jHZk+t2PgdrnbrDaUBxo1FgNc8PpV
 5ZXYlnlfUxNUOtFpli6gBFFleIa7lW8Ztsy9vkxNGu+ePhhr+1dLB+CbotFeZlvd
 jwHfRbEfW0yQJiHcWlBcSaiMasb5Jh1yYzRmG88ym37zVmnNe2uHpZ0astPXD6bl
 8BX05VoYfOxugwa05DMgM0oowIWvhRFFev3qVYqfhB4T2TzwM7Ht1SnlorglKYgG
 QZyFB5FH2G3WQWVWyKwTSVtdp5E+cmQUMw4x4F6PuzWpNHk2c4V2vCP3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5zpxB+F7Bvw4QkiHZ8eQbXkETrRWYlWBRAllblwMmPA=; b=ePKVUHHA
 Jd3FfeJympPEkMAPHBetsuua8D5cK4cPu2r+UkstQxgLW03YaggdudT6aobvSl6N
 tuWrkYbOsethOSt0beaUFMl2UjG86WulLx3c+34pA0SvJg2I2ZVJqWa1oW5TYCYS
 iPZ0Goz0fjz6HWUEe6fQjkKdKdglZQzpQCs9IWjz9nYF8N7cqiLa/vYNS8LDbjN1
 MfnkuxIPyYnTt7bB+bx/XyBqJdoHFzUhAz+syrigD8tdBoHaiyjmBoBi92ccGEft
 vvfZwkHohqq8DTMrXv75j35jxAhxJO4CoLBdyKE01XKQdKADEAg4k/irKpgu51YL
 4JUp1B6EgLMQRw==
X-ME-Sender: <xms:IjLgYenpdL5IfuhMxx94Jz0vtpeQaj7_5mxciVBjm-VkN3ftLJE6BA>
 <xme:IjLgYV0KsRroFSzX59PQWqv3RYoiax9ofZDWdRe4oP4HWuh_fdW475wgsaaS2uOv3
 jndoWsNBK-oyERg-bw>
X-ME-Received: <xmr:IjLgYcpPzZdCmY4o0LYYpxAJ6MEB2kNLmx0HqFVKJEzlzmErsGL42Ln_v8KDHqywBtsbXXIgcKd5DZnErdVCvXE9ljZuWSrXExm8NnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IjLgYSnhNRd0KLYpTcrSLZ6pokCi9NA6R4vE39jhUaDUPre66IF0-w>
 <xmx:IjLgYc14S6YtEteVz-C5CDr8hR8TqoKUb3HKiXTVAajHLCNCZd0nmg>
 <xmx:IjLgYZs5jUAGCrfReNNKOL9nhLkdXDkSsMuJLVMdHZZn-OPdDnkMoA>
 <xmx:IjLgYVvYZf2-2DNcg_6fchZKgKHm-kqe9SuA_EA-P7g4sDhcJA1sbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 02/16] drm/edid: Don't clear formats if using deep color
Date: Thu, 13 Jan 2022 15:07:06 +0100
Message-Id: <20220113140720.1678907-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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

