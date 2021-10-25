Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AD43983E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F96E03A;
	Mon, 25 Oct 2021 14:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1686E063
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:36 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7508F5805BE;
 Mon, 25 Oct 2021 10:11:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 10:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/DaMsh8ayKxva
 qkX74ptS4WXCO/EEx+iDCGiXC/BLa4=; b=T/QaoiVLYTe2kqFofXzlceqZPImVb
 54Z4A4hd2lOgs8kA/QrPLCALXOx+WPZqXLeDOWbC1vda3giwnxsuWf3bViJOAVYi
 mJg0gi/r+u0C425PtFpIWXK6ISn35TJVyhdOikY/mjbLU86SUk2p0Wo8Jzd/kSx2
 QNsxfDIc4KvE4nozI1Iz1Ef/KeRiEgDez84pWYf0yys1FGmQZKja0e2os4yijz4F
 w8c1xtpk/78BML6gpNArUWe3rYHwDvAIJwGH+81uOSId6MWcSoLdrPc76kUhLmHt
 dC1zyJOu8HfC59KRe5NPp99ha/3Lb6TpsKcnOdz10ZxccmINqIgQ7/FkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/DaMsh8ayKxvaqkX74ptS4WXCO/EEx+iDCGiXC/BLa4=; b=fcPybdzg
 X3ziJ4I293B5riBPuXMo838lVdZbWOByLMNfuA6E0RB6/fmNOqkSL3CPwqdAPUhm
 0881vxBpwbaoUokLBxOZOfloRU/aiIJqKE5wbatGWBua7jBkX0uwGWnuKRFnJukg
 XwTDM0y/c4oMR9eoFApS/6UMLAngOSgM+5Rc14jjzoHMLE6fSwNWHvGIlsWhMd55
 uXsKrepSQu1f/KznCCUgli+nJT6JxTPs+GYIVqn3qOWRBpqqq4tB+sz/Bu+bxHMS
 UD9wAyKt7no3TebYfgclsKV+ofvPkh24go9Ke0N5IEguND6uzoDoALpnCcP072bS
 Ev8WMwdol/BpkQ==
X-ME-Sender: <xms:Frt2Yd3Qimri-fqlVibHIco6x84AC_iNetXl3Wj3axci2vIjNVSZIA>
 <xme:Frt2YUGYc46d6pm_5zJcnj6OvI9pc1w_PYSQzciNc20KG9hqbxHr_yNs_eE4fgbKC
 gNo0bRKbOcEY2s5HXg>
X-ME-Received: <xmr:Frt2Yd6RTjMEj-txn_Sqfs8UEDwXQTfOqpOHob2XsIj0fFn_CWUfpYW2Hys6xIXFtfnzwPKu76Z9totgI_3RMEAGytZ7Fe_tV4O3ryih>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Frt2Ya37DLFh-S6oygelEzbYvfaYY1XhNpadr8ELmXiEwjAuuMYv7g>
 <xmx:Frt2YQFbZFLbnjZUxXlgvKOlR1-M363agBtKZ42P-YuCPXVPMa2T9w>
 <xmx:Frt2Yb9BUIKUAputv3yJ8k1UWtNRUCnZvkKvdpYfjmlc9227aiM_kA>
 <xmx:F7t2YbBhvBX8R5PgGLvSxygpojCU5lILfveuMJmqFPh9z0qTOw57qA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 8/9] drm/vc4: hdmi: Introduce an output_enabled flag
Date: Mon, 25 Oct 2021 16:11:12 +0200
Message-Id: <20211025141113.702757-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently poke at encoder->crtc in the ALSA code path to determine
whether the HDMI output is enabled or not, and thus whether we should
allow the audio output.

However, that pointer is deprecated and shouldn't really be used by
atomic drivers anymore. Since we have the infrastructure in place now,
let's just create a flag that we toggle to report whether the controller
is currently enabled and use that instead of encoder->crtc in ALSA.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 291fad018be3..8fb8e7e57f9c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -724,6 +724,11 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 
 static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->output_enabled = false;
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
@@ -1217,6 +1222,11 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->output_enabled = true;
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
@@ -1396,14 +1406,12 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 
 static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
 	/*
-	 * The encoder doesn't have a CRTC until the first modeset.
+	 * If the controller is disabled, prevent any ALSA output.
 	 */
-	if (!encoder->crtc)
+	if (!vc4_hdmi->output_enabled)
 		return false;
 
 	/*
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index a43cc5614d19..5d3e97703e8d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -203,6 +203,12 @@ struct vc4_hdmi {
 	 * for use by ALSA hooks and interrupt handlers. Protected by @mutex.
 	 */
 	struct drm_display_mode saved_adjusted_mode;
+
+	/**
+	 * @output_enabled: Is the HDMI controller currently active?
+	 * Protected by @mutex.
+	 */
+	bool output_enabled;
 };
 
 static inline struct vc4_hdmi *
-- 
2.31.1

