Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32B33F41C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5A96E81D;
	Wed, 17 Mar 2021 15:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3986E811
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EB9C580A59;
 Wed, 17 Mar 2021 11:44:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Tyfy+iH+8NQoa
 TsoSHxtXaP6zPio6qeu+0YLstbyujo=; b=YwRfd6aA4uH3GUlVqDkSKeswmiscA
 Cw2ILT+OQ940nUPYYZiHdREDBxzDxtsBMFTTI6RXBqxjASJuQ1QbIHlzCYN15PTH
 tTT8VUpnuYFU4p3JSYPYAiRQPMvM13hHPDZb32C3u4iTD2MHdxPTB9sgWu7LIQ0e
 3LBvnIyZmOdSd2iEXWfeHBvxy6JJNY6bVf62y90DolcPvlg7PziLy9Xh1QohBus4
 mNYS0tqsTIWut9fZBl5DFVplkB5jgH6tAgAsg9TVHZzZ+X8RsVrbvO+HOnA9h1I7
 bX4XBoMIXnFlTs+HeDeFu2T5MbGcfzxZF5XxzozrhMH/fbwY1zw9UVHwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Tyfy+iH+8NQoaTsoSHxtXaP6zPio6qeu+0YLstbyujo=; b=NAT9t+5F
 l77TzGKXGijmh1nCOGVpn3FXMDMDxlUbXcXT2dzmj7tL4htnXhYk4OkVnSLInGcm
 XFWD+ybGW8O53/lq3BtRm8ZN0je99uoVPxfsc0M396sexzHfm25l173KkjIo5Q2W
 IjKFXmf9IlXSZ3ud/P5F4abtDkscpwFSPPhwpEBVy1hoKWaxHLLMxRnVt8uPUEaH
 mQjOa0Uo9p/k8nZdbW3hxXlVYYUmMcVO9o3sT/2OhGQN3gzVjZRGJW/bMl9Njv5k
 sCh87kjUUrX/a5+q6rIHMcPcFiyT1xLozHEJDIY3g0JN2Ds4I72uALg921q5l2pb
 FJA0xcIZQMKcqA==
X-ME-Sender: <xms:0iNSYGlqP1TYZNq92UdqA1u3oqO-9gNX2DUxgCkvz5NhlUBj6cLQZw>
 <xme:0iNSYHcosnuWEM0BLjDHCMp9XlBVE84I89qzIfK3FwyESW1O43S-T79evuOBlZ-1g
 DH6Hcjls5ZLiZPRvdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0iNSYIGMT2coUMoOfhetRxg66IECZYhgitIbDYgOlxc0gz-p_0P_-g>
 <xmx:0iNSYBeZDkiL4RSnHgTr-e92dyuF5y0tcznXpyZtBwd9vzawFPjPEg>
 <xmx:0iNSYP82zNn_kZiN8sUw9c4di_Nt0hUawzjGEuQU6EbMJ4uUND5F6Q>
 <xmx:0iNSYHntWVi_0PkZsxPjn1D3YWH7GEepN95GCOfBtIkaISLV1Lj7Ig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C6C924005A;
 Wed, 17 Mar 2021 11:44:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 14/18] drm/vc4: hdmi: Change CSC callback prototype
Date: Wed, 17 Mar 2021 16:43:48 +0100
Message-Id: <20210317154352.732095-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support the YUV output, we'll need the atomic state to know
what is the state of the associated property in the CSC setup callback.

Let's change the prototype of that callback to allow us to access it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9614de7303b8..56b5654c820f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -490,6 +490,7 @@ static void vc4_hdmi_bridge_post_crtc_powerdown(struct drm_bridge *bridge,
 }
 
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       struct drm_atomic_state *state,
 			       const struct drm_display_mode *mode)
 {
 	u32 csc_ctl;
@@ -570,6 +571,7 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 }
 
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       struct drm_atomic_state *state,
 			       const struct drm_display_mode *mode)
 {
 	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
@@ -860,7 +862,7 @@ static void vc4_hdmi_bridge_pre_crtc_enable(struct drm_bridge *bridge,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	if (vc4_hdmi->variant->csc_setup)
-		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
+		vc4_hdmi->variant->csc_setup(vc4_hdmi, state, mode);
 
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index d03c849d6ea0..cf5e58a08eb4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -78,6 +78,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to enable / disable the CSC */
 	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
+			  struct drm_atomic_state *state,
 			  const struct drm_display_mode *mode);
 
 	/* Callback to configure the video timings in the HDMI block */
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
