Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2EF495138
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3022010E475;
	Thu, 20 Jan 2022 15:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C61F10E475
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 412AE2B00155;
 Thu, 20 Jan 2022 10:17:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 10:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=u7zNqovfjnk6WOKEOVEvyp++AUoBgB
 ieUPwzYFFGkcA=; b=M/Vys1LMkEr6wTpmfxnRT5dVVU7sAiv4cKsBEufZabVFC3
 3DVpC2muqP3pv2IfbPw1cw1fA54iHKwowNfEJyuFXDbSf5fjipyXOKKnf5z5fi4o
 7Ny9ohIxV7EFnABHXBQk71TGE+p4zl34PSoXWyKaQ5QC/YpJm948mYjgozZCTwBw
 3ZkIK2aIo9MiIEIbXrrSrd2UWeIkvsorFsqqbNr/R6P+xO5shltkOZcwz0ER++ud
 64vaXL6RH5e1+aVTCp3vxMlzqrk9y8unSpoqMXwnzHoiXX7z42jRegDb3FeSQFJb
 L2ob9o4LsBqaXM11b3BK+5ERFwuXY2eLMtS0d6LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=u7zNqo
 vfjnk6WOKEOVEvyp++AUoBgBieUPwzYFFGkcA=; b=SpcRpaDMbpvPQPcMTT34Qt
 ZDICqsYpdlnh66pK3TGaAo4CKkPw7Cb4pbJuX42IiNVUiCxaPaPhllX2Mv5tsebd
 UPY5Vy7fdiYvoUmayjUNaNvzX3rtHvUC0ZSYCQBWlr6DuOSV5m052b/XyIBYZjTJ
 8g0eH9sChOMwcky69myUnOQuOiPSkOJgbDAYA9oy/idWQqykTI5NG2+2iEEXvLNb
 CybZTV5wrHrrmILOqse7izQM6yc9+mJ7mQZLknkABpbp1Cq6aIeOvdLU+fcxeuvu
 5vTVhr3zJx5r7G26EUTNcrLHVL5xmhRxjYBD26/GBh8Wib6L+hHtMj96UX6ltJPw
 ==
X-ME-Sender: <xms:9HzpYRQT3NET2w6eiv06sXorYCIZWV5k7UcYDNT-ZnzEKd7hJtVzKQ>
 <xme:9HzpYawzPko2MBGQERP6O3V4ubjx0zmmjcFba6wXWey--d2Ac6jWRFA4h5HDxEsRv
 jDA15LtS-zMPgZWF_Y>
X-ME-Received: <xmr:9HzpYW3g2ECLbCIUHmmM95LS1PUKnnmIUVjztmEkYnbrOAsPW7-OI0ym99DnRSVP4tPXwaS6QH1mH_n0PoAk13DLSYxRIDFXxOlSIlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9HzpYZDoWCUAcEeeOV6FLjRSEhiltrgZeevEg0ETrwiKYmWktLfDvA>
 <xmx:9HzpYagp0Eg8qHn6QUaqUlUFf_W8GD_d7FPVXRWbQffsqwWoOt8jgg>
 <xmx:9HzpYdpI1Z0jbDyrl0IJJGZWXhmH7CAvdJ6XlPlml6FEEjFa-aM8Uw>
 <xmx:9HzpYfZ1tI1I7chUEaaEdZSAQUXAWwbR86GZeHbcmAnTAcMP60MdHUw8JGs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 10/16] drm/vc4: hdmi: Change CSC callback prototype
Date: Thu, 20 Jan 2022 16:16:19 +0100
Message-Id: <20220120151625.594595-11-maxime@cerno.tech>
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
2.34.1

