Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70B35DE54
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 14:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A589F2E;
	Tue, 13 Apr 2021 12:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519F589ECB;
 Tue, 13 Apr 2021 12:11:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id B3D77580446;
 Tue, 13 Apr 2021 08:11:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 13 Apr 2021 08:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=F1eyLPQMrVY+E
 Res3vt9RF9miK1ff4SmcdhrwV4b2bQ=; b=XAcdTMXblEePAHsVGvnHnsoHaEney
 eB10z6QapGxQ1hBmLnVOnPsrwy1J9GFcFzSr+5vsNBXmjD8lhnxQhfQZkgRou+9V
 BxeGNNamkZTo0M4nwN+ktyd/sBbc2wvZJbBynC464x4h0X04Ks0FPr2DEtwbOiK/
 hMnGCxTRQNXnAPhq1Gapgl751J7tAoFz1M1yum7m52bTHYBKDITzuWKCWBvgdN0r
 bTL6OdnrBLyJZeJv3U+Fk24KCNUIlTiu4vlKt2pJFQjEX+WENJtW5eP6Nlh6X43c
 irpUa03pTBEzU9he+fpGKip2xlhjLCHZBq/thqZHS1RSmzmP5veI9H+/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=F1eyLPQMrVY+ERes3vt9RF9miK1ff4SmcdhrwV4b2bQ=; b=fIf4mWTY
 /IvAEuCbl3DwoVtyi7U9tff1Efp7FSaE7BgOXWdjVjhTduhIyRZLCwoIsxJ5x2Nx
 Ok08Tc5JULhQyjnMTeid55CMBiwSyCjV5SSjDAZ9iJmjAKU7s4XAd9jRRK1KGr1G
 aMoeoHiFPABNLyOE84U/o4aQJjld9uN9LkHA+/CiLGeczwHosDHslVWm/ZcAIIjc
 a14L/kiLxwQR2eoNU++kspWLwJrLcwf9kEk7uy2S1G2kaptZ1+c9ZXEW1ZjhHW0+
 gy15Jc+zJHSy0XZB7keMvcp3tz4LYHT2SWTwAnfFOVDS/EaJ7bhbkDDyu3o1BeqF
 K7ihVCk3KytEfQ==
X-ME-Sender: <xms:YYp1YDFHzfaUF0BAYI47H3Oq4ppt1u5NdamsNOtLWmhrYk6uHgs7Tw>
 <xme:YYp1YC42PdX7sQVdO98OzVaeAvbAs7sbhn_kMCHNXBacofYrXYlGgBEf_LSSDqH1A
 4jQcJYFhYu7brMqK2c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YYp1YIw6QyeX015m7J67aJUnmtMqJoxux3ELgXPBVLh446bXPEULQw>
 <xmx:YYp1YBNr1oxH15nOrxodqTA4euiZPZLWM_g8Y3-0R0F0y8esGIp7Dw>
 <xmx:YYp1YOnYgkxJN-j5PotqtJX8j6xhOD57dte5bCyxCafAf0oNaGKDUQ>
 <xmx:YYp1YLkf1cd_gFOCyDaP6__gxniKwbXFAv1n7iqo1iEi-hVDl1S7xA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A7761080064;
 Tue, 13 Apr 2021 08:11:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 5/5] drm/vc4: hdmi: Signal the proper colorimetry info in
 the infoframe
Date: Tue, 13 Apr 2021 14:11:04 +0200
Message-Id: <20210413121104.375789-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413121104.375789-1-maxime@cerno.tech>
References: <20210413121104.375789-1-maxime@cerno.tech>
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our driver while supporting HDR didn't send the proper colorimetry info
in the AVI infoframe.

Let's add the property needed so that the userspace can let us know what
the colorspace is supposed to be.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - New patch
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a33fa1662588..a22e17788074 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -226,7 +226,8 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	if (!crtc)
 		return 0;
 
-	if (!drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
+	if (old_state->colorspace != new_state->colorspace ||
+	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
@@ -316,6 +317,11 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_mode_create_hdmi_colorspace_property(connector);
+	if (ret)
+		return ret;
+
+	drm_connector_attach_colorspace_property(connector);
 	drm_connector_attach_tv_margin_properties(connector);
 	drm_connector_attach_max_bpc_property(connector, 8, 12);
 
@@ -424,7 +430,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 					   vc4_encoder->limited_rgb_range ?
 					   HDMI_QUANTIZATION_RANGE_LIMITED :
 					   HDMI_QUANTIZATION_RANGE_FULL);
-
+	drm_hdmi_avi_infoframe_colorspace(&frame.avi, cstate);
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
 	vc4_hdmi_write_infoframe(encoder, &frame);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
