Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B469F3BE4A2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96236E848;
	Wed,  7 Jul 2021 08:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4536E848
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1EEBC2B00944;
 Wed,  7 Jul 2021 04:48:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 04:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=c+/e+DeDuf9Q6
 Wz32tUPct5JYypt2bqbIG2Nw3u+iPc=; b=zWtNOf+21qtVnlF393VzAGc5O3f2b
 C1EUWgKnBApN7AySwHmYwg9TEVHv5senE/aNBjy6Gj4GdWbTC25UIIv5G4otn97k
 PTuGeHSwPkl3He6DQRfMzhVv44fL4ui56qJzI9+CZwRYBM6kSfaRewVpkoMf0ULu
 k3b8+S35w3e054zNQwVtCKaRKdKLmeiVFKztbLjZvDKWBI2MRYtVk1Q6CYNJqofE
 pBgau5/imN7x1r1hq0qvgA+1t8eQlfKxJ0jY1vct0DRT/4+ycU5iXBTLq2IdbsrB
 N6bfWJH4Gtuq/O5COYPh4HurjqS5vIuN2pZK74mmNnV5awj4CpL9f/Z4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=c+/e+DeDuf9Q6Wz32tUPct5JYypt2bqbIG2Nw3u+iPc=; b=NsSJYChT
 DsDhv3bIwsIB/NlrYmDuXRxOZPNuoqewkZ695fbuIiuOnlFvUqk560tNmUPaDB3g
 ZjX7Q1gXhX1ve0cZlSV7e3LSx6pm49i1ylqqVYF0HgsrCYG+H5Q3nYI8HxgwQIbO
 LIuRwS3ajZSeRi5+t0fGVEED1EvIkzmaYAOTDex/e1js03EnlVZxMYD8gUvW8hVU
 fsLFNOgH01q2W2Or7qndWvF6XoYPq6mOSLNQ7CaMLVps9aC2wzJJ2Mhz1HeZ1vIU
 JAr3OZuWCJq0prFzy84t5ut2edfc2cHxsT5Iv1UDGFVE+8KoAUsloD0mq6GqgA1F
 +WxldPEJhh2EoQ==
X-ME-Sender: <xms:V2rlYJJ-qAXjJYndOQHGRNdivRQ7JCHgfPqyTj-W9LOA3F1abLCkKQ>
 <xme:V2rlYFIsA12A6Sz8MTPMc5pHkDADcv8hpCBrfM7OC0LjKCF1tA--am3I8WIB-Otxw
 uZeBFh4hQUYMwg1nAg>
X-ME-Received: <xmr:V2rlYBvjI2OUJOIJJfQIF7YgGWWuODxsuR_E9KopsAKa94zDsMcbAnfwqC7dYWyBuoCrx0W5oRpsw4FafJOejSM5OWYqfcCZEjU->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V2rlYKZgGYBiAgi5L4MMTmJRzdFFxvc5-jTM4rgts7yte5HRC2-lPw>
 <xmx:V2rlYAYP76DES35_aC_769HuuF5z1w0Vkn3eMKZJUry7-Rd1rq7NxA>
 <xmx:V2rlYOBlt9uZhPJdoDQfIq6K21TqalTZ_9ItpfhBq4PgCuZYyob1WA>
 <xmx:V2rlYGyrqUW_zyDMjARPzPbJnpRocM8cnbKV5SDyQcOAA-ENFqYRd0_4gs0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:48:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 09/10] drm/vc4: hdmi: Enable the scrambler on reconnection
Date: Wed,  7 Jul 2021 10:47:44 +0200
Message-Id: <20210707084745.1365390-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
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
index 40f995c43376..d478ec5ec8f3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -160,6 +160,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
+static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -184,6 +186,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
+		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+
 		return connector_status_connected;
 	}
 
@@ -539,9 +543,13 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 
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

