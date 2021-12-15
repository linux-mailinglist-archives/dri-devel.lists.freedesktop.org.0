Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA847590C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8DE10ECC0;
	Wed, 15 Dec 2021 12:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD21110ECBD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 4DAAC2B0024D;
 Wed, 15 Dec 2021 07:44:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 07:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=l6X/jlxfLZaPS
 A4piTx6Oe+iMOBNSyRccLOCPSgc5QY=; b=doK3ak8swC6k6J9pODwx8H7EbxUc1
 sP78ocK7qNRhYQs6xQSfGSDpWH1Yqh8TeP7BBVhvmS9DtPYPdQuAR+nObfBRsf2k
 2lnrxpYK7FUZ33HzkEgWdislOl5aW3sOD2uG4RUEPBxkX4RGB9uPKjjJvv6RycGJ
 nfw4t0O4qqMM+bR5yhlcORHbkr0LKNoz7pTxT9gArSUdnpFZndznU7Tu7JZkAvgB
 aIk8Km/Be9W3NQwoeivMQ4NKqF71HdefHU2TUoDWrTh5l/FJw6IszpwiA7ftBSf0
 Ayh3B4JcjnFCdpQz9tZQcGL1eMBnfoneSTrkasHz/hYAoRUmNk+qVsisw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=l6X/jlxfLZaPSA4piTx6Oe+iMOBNSyRccLOCPSgc5QY=; b=QBaMrxES
 yAPne45kDdj5hwkUhzx8GJjcmZhZI9uai+5W7vvOY057GJtVSl0GDWwa5KzAY9HH
 i1AsLDAA2T4hp+I2dpLZG0kvwM9XTOPd1Qu+6QIDw+BS8l34+lESwaTE78+aM3ye
 EuiddZZt9TfffosYDJ2Vlp5vZSoCGOsaYhZ9KBDlstpgl+YT4xbEJDsEaGVWTIOi
 FW+JekM49aqClA85rUybb2t4eCqFY3fzDZCd3alCGl5qa3osFRp8sO9e4GC0IY0Z
 IP+LzOhHmlkNqMaGE5g3DC77mRAHAKbeFmiFFwYpntOtIzQiV2NpSMB7yD8iLli+
 jyHjVmg76jMgBQ==
X-ME-Sender: <xms:OuO5YeC_ba19gqChizKf7euUzzsMXvkd5NXg1gkUSwPfofGWc-sKhA>
 <xme:OuO5YYgOlNwTV0HKz1NMu0i3nQwL2kaCCD-16FG2Zn1BizYIY6OyXXBNpsB9BMivo
 0H_sD_uqfjcIPlKjOQ>
X-ME-Received: <xmr:OuO5YRm42Dx9XeMsck03WJmhRHxeAcW8IFTVpOHeA_KAGkqr9kGp3m1KukJfVfPB85kVUiSDUbRi61nFbq6OV21jzQGXLn7F52xs9m8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OuO5YcxEnEdu1lSzLlNXqVQt3DjsrMzcO_Cx2QEeY7rFzRDDA6kFXQ>
 <xmx:OuO5YTRXrHOessp1XauJGDk1Zn5rUYGhjPHlSWBS8-nOoQrfSD-_AQ>
 <xmx:OuO5YXZ1kBMzdjqwApFSJ8un1V0cct_GIH2lp014J3kk_4xe0qrEzg>
 <xmx:OuO5YYIeZ0u5W1e4jouWS6aJG1lxuXvCPKZSTcSrTMdSsdrJO6kXyvU1bLE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 08/14] drm/vc4: hdmi: Change CSC callback prototype
Date: Wed, 15 Dec 2021 13:44:00 +0100
Message-Id: <20211215124406.340180-9-maxime@cerno.tech>
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

In order to support the YUV output, we'll need the atomic state to know
what is the state of the associated property in the CSC setup callback.

Let's change the prototype of that callback to allow us to access it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7fdb49e790f3..d79a70bae7f2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -735,6 +735,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 }
 
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
@@ -822,6 +823,7 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 }
 
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
@@ -1144,13 +1146,16 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
 	if (vc4_hdmi->variant->csc_setup)
-		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
+		vc4_hdmi->variant->csc_setup(vc4_hdmi, conn_state, mode);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4a5536975bf6..2b6aaafc020a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -77,6 +77,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to enable / disable the CSC */
 	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
+			  struct drm_connector_state *state,
 			  const struct drm_display_mode *mode);
 
 	/* Callback to configure the video timings in the HDMI block */
-- 
2.33.1

