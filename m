Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064384675B1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A127336B;
	Fri,  3 Dec 2021 10:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C211A73386
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 232875801B2;
 Fri,  3 Dec 2021 05:54:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Dec 2021 05:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=l6X/jlxfLZaPS
 A4piTx6Oe+iMOBNSyRccLOCPSgc5QY=; b=DL/S4jJJkCaYDGpZSemUbdqn+hDBq
 L2ynvV+Q1qi50GIdoQGQ6CD6NCmgOC18tjg0g2aCDjkoiO2xTeo1XScgD37zoFK3
 o/swKZG228CU72M+XMLeaJ/08wFdtDN0LzOSRvUEZ2ku2LXvn47rl9Jm+YcHH5Wy
 PveEb4pQS+KzaoHqgPrgBK1AxjqS/OqfYmC0NaKSRJU6h9k2RFeTkRYfCCkqJbY9
 Wf6txn1laAYR2nqVGdRE0Uf3i+37b8+72p0Gj9nLioHk2FAjNsFB/K9QP8YU/GfB
 mgtbDHL9ByE/KeKDrQsJG80xxsvu058J4bD9qwnT6X4DqwgI/t3EESw3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=l6X/jlxfLZaPSA4piTx6Oe+iMOBNSyRccLOCPSgc5QY=; b=YfInbrfh
 5oOufm6OJmFXZNonmeXGb60fhCm/jQckKuFoFWvOFr5e/I9oLINQ20GnvjVA9kz/
 nqX48ccFVfrUbR76votQff7dXLdlHWGYu0GHVzFjdJz7+NdonrNVU9lN331bNZ6A
 Aqv/2AVUdASeiPVDe+9iGey1QL1PB4gYNeq+M4as9Tw3G+wdPm3A/om8vs03uN/0
 apRPSu/JwY9VkwGvDrzRiSjWpt1Vu51hq1PJSmdkD2Ih5b/E2cABminevmONBUnr
 aukRFbP7/gX3btDlqOz5pw9/t7mBXVtp6NaJKfxOukA2ggLaxGn4a6Zcu1pFh5Bl
 x+Exqq4mPyFKLw==
X-ME-Sender: <xms:bfepYRwMorVw-d3s43DNa9ltNc6x3r5zu3nDpDaa0FSpV9_Dp_4m9w>
 <xme:bfepYRRspqYJKTzfe2BknPhiQFe9JrvNEYMOSAb4yh1naPjxxXoqBlFxJ_f6fUfHd
 AgElognKWJ7FwgezNc>
X-ME-Received: <xmr:bfepYbVUxmti2hN6hFl6wCoPz7kGRVUn6JUPj4MjqSjMCRMbRAVemrOsuuIG7or3jrvNuRZeO3NsjjajIIU9f1-eNf6QNqpIWJCSETwkSGXkDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bfepYTgbTGX3_8xQovYDoYELhGbyyth37cyUU2L-II7T_4lzFz-PCA>
 <xmx:bfepYTCrv2UYJYJbStqRQ-OJsheKLSQAjG_zo1YTDzgUHdlj0Iw2tA>
 <xmx:bfepYcKfj3ezX1XUEzE8S4gNZHLhOTOI4XPMmLiC1-2NRH3N5Gxg3g>
 <xmx:bvepYft5_sJBFkci6dtnWQl84PLKDtrmzcHtWK44qQhyRnDZpN-0yA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 07/11] drm/vc4: hdmi: Change CSC callback prototype
Date: Fri,  3 Dec 2021 11:54:16 +0100
Message-Id: <20211203105420.573494-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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

