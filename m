Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D663B5E40
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7066E452;
	Mon, 28 Jun 2021 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEE46E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 67FA15803A8;
 Mon, 28 Jun 2021 08:43:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 28 Jun 2021 08:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=x2tlRFbGfDp+O
 7Jr7iVRw/9te19SjRMwYbKakmaMmOo=; b=SpbCGh+YyFIrVk6hZbZdMcVZFH+Ma
 u98kq+nunT+PjhlV1jHzrx+3t9I2Y1H300r2nZYAEIWlwwOHSXo7K4iVNNe9+6rt
 auLqNy6qk5neJnl4QZ1CXz6+xjRV7ItQw0eMZrDK/WRtX2bNy0AZ0JMRl1W/9rIY
 3zt1Leit0DSld7Wu75twXkVSNeQehqQME+09vc2tHrEtIgclo4cghFYNcU4x/k0J
 Aeh+12vhT37saCo+7aNiUQNZI24J6XRBp2r/WU1OiYiTj9tT5AF7Vw2ZpZ29hDY8
 tUMHRL5RfwqCvIHvj9xw40il8r9L0dhTccMMOY8/erfKbsqGQp6YRzXHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=x2tlRFbGfDp+O7Jr7iVRw/9te19SjRMwYbKakmaMmOo=; b=MnTYlQhw
 2arshvQ4lwD1fT93xFV5mQD/3c+tTU28omfcfxco7Cn0swztu3icBLx59ZNAbEFt
 oT0T8JZkEXAnn2ALeOB+VkJTV1LdMkwy55Tar84CSQDL3Suuapr/qunBf2dtIvp1
 joCZ0QN9cjBk3RZQF10D6anlIWt3kkIUE6tH3iGRi/cYI1B02qk6ssaOi6peTYSi
 nsUzQuhp9oAPJr9gFJT0lGbIu29qv9c+f2Ww0zwKnYAq5xmpwDGFUm4Pj4LkCXkr
 /XzXyX+cLcw5XAebRPgtrbl3NKhhrgYtMTu3yj6Cy4uqqXPAjQdBxiW3D8fVptKf
 WN/rhhf/npL9Ew==
X-ME-Sender: <xms:5cPZYGQ4Lm2xuWy62rV45tcNY69OlLJN7uIBt_gg-Fu9T-ljwKhg4g>
 <xme:5cPZYLz2ff_N_ys-72RKUPd6-3E8ZV2OR-bjEKAI7rSt7oTsHSJcDnLcAf7Z1ChxF
 P6wEqzPIv60ln2VCP0>
X-ME-Received: <xmr:5cPZYD1O_2gOBe_JpUCmCkeFj-cDh8CINQTpVwNpBC6TY6taNsGLp8Qwyx-G9a61QLQBbiAbdsi157DoW7Jl6HKlDJCoVCwkgMwF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5cPZYCCKHmCqGug-Y8zJsCfkBZaOAN5VA954DMOPHGOm3_HZBN4PFg>
 <xmx:5cPZYPhT3a6xU3Ebsd5BOBmIxmorw3dQkXSZClXlsxueC2MEnCAIOQ>
 <xmx:5cPZYOosNEcE5zjUF0elhzHYq3dxLggkOClxRnoWpCpq0hyIGzBVHg>
 <xmx:5cPZYPy64Ocz7jllmv6FPBc2gR0YrWg5TJ7mbo5i4vqJ-ozgW0u5Gw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 09/10] drm/vc4: hdmi: Enable the scrambler on reconnection
Date: Mon, 28 Jun 2021 14:42:56 +0200
Message-Id: <20210628124257.140453-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have a state already and disconnect/reconnect the display, the
SCDC messages won't be sent again since we didn't go through a disable /
enable cycle.

In order to fix this, let's call the vc4_hdmi_enable_scrambling function
in the detect callback if there is a mode and it needs the scrambler to
be enabled.

Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 46f656fd31b9..7efafc893920 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -161,6 +161,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
+static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -185,6 +187,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
+		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+
 		return connector_status_connected;
 	}
 
@@ -535,9 +539,13 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct drm_display_mode *mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
+	if (!encoder->crtc || !encoder->crtc->state)
+		return;
+
+	mode = &encoder->crtc->state->adjusted_mode;
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-- 
2.31.1

