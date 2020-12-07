Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D136A2D2627
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCD36E9C4;
	Tue,  8 Dec 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AB689AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:39:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C9AF580364;
 Mon,  7 Dec 2020 08:39:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SUgklR6p6MR82
 lH8ZrRyryzabAwen1f7BnMLb8Gtc0M=; b=n5bu5YL7W7M7WPsGpNsYGdMC+rwEr
 SKPQSFyghSr7A35PbAYDqP3kA8Y+MYIN/uSleI8vdWwH8QKgLst70qYvy+xgdDrb
 fQcxjH5LnyjfA610FcTOK1dferGsWACSD4A5ctdl9OUe3l6WRHNui+W5PkUXuPlw
 7iPyGv36NTc9/RJsKcL/yrqDjfXsxp2Gpl2xtk/SvwX1TRXRsMiWmS6zlp4OGKZ7
 G8AnOmJ8v5HPYZfgjIz8beWxzOcXrUKV+9BHE2IVJYgheGJp97vTuv0Lt9/BZGv1
 msnJUs7Ck3+oOZtp+A4l8yVX0p0Ps7OAqzcQp/54/oWtbZ6w2014qp/QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SUgklR6p6MR82lH8ZrRyryzabAwen1f7BnMLb8Gtc0M=; b=b4N8ITA+
 RWOqg/498OL9zAz0JQlT7ewI/Iy/G0Eno3z3pxHHqHQLHpaKbcKKMpEIPlutjgwa
 15Bd9dKPU6I7A/Xw7/1v+cG+pQbCYbL5oI1fkDygdqwuTq2KXJmFN9BIyryum46v
 6rY7c+Q1nsWJTzMdDqQj2/eFhRDMjItTjBxPNyVpmqzr0fjjIAHNDlqHMZdzgvp6
 kcfnyAR070wXXgPC0nsSCYGmehQN11FXwjd9LSY9Nawc4aQljaaIUKNOlCbYMHXC
 0cpb+HQweHyaUO+ugF4oC2F7ci+g+Z9EUGxVtPSHHKoJIzEtpzGEfmGIVPnbZVUd
 AQPDEkFAqTDT1Q==
X-ME-Sender: <xms:qDDOX6smHerd-1sdPRMU5UnB_S4swbkQXtcaGf_sKp6rf7oH6aYQ0w>
 <xme:qDDOX_c0wRY9erhzlt0K2PVJkEWv2i2Y2uNpnRnDAP_8c_e8XYejuxeEhEBOB6PAr
 i-BnH6ptoTfL-fGgQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qDDOX1zP7UK6Js3w6jA-8pnrSh2jwGqmB3zRmS8_PzGJohGkJbNgnQ>
 <xmx:qDDOX1NeQV3rE6vEPLhurJHUvAxNWBhTGEc_MycDx7ENLY5I7fIqSg>
 <xmx:qDDOX69_W5rhnbCi8CmWQEtNFVf92ZpgsK9A-OdtaAOfyS6CgWwiRA>
 <xmx:qDDOX-RGX4cYi6YugcmkrPPbfvCYCge9IYtklSDUw5PzO6nP0xXS6Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C74431080057;
 Mon,  7 Dec 2020 08:39:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 1/8] drm/vc4: hvs: Align the HVS atomic hooks to the new API
Date: Mon,  7 Dec 2020 14:39:41 +0100
Message-Id: <20201207133948.2109194-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207133948.2109194-1-maxime@cerno.tech>
References: <20201207133948.2109194-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the CRTC setup in vc4 is split between the PixelValves/TXP and the
HVS, only the PV/TXP atomic hooks were updated in the previous commits, but
it makes sense to update the HVS ones too.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 +---
 drivers/gpu/drm/vc4/vc4_drv.h  | 4 ++--
 drivers/gpu/drm/vc4/vc4_hvs.c  | 8 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c  | 8 ++------
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 06088854c647..e02e499885ed 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -503,8 +503,6 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
@@ -517,7 +515,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	 */
 	drm_crtc_vblank_on(crtc);
 
-	vc4_hvs_atomic_enable(crtc, old_state);
+	vc4_hvs_atomic_enable(crtc, state);
 
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c5f2944d5bc6..c47c85533805 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -918,8 +918,8 @@ extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
-void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
-void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
+void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state *state);
 void vc4_hvs_dump_state(struct drm_device *dev);
 void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b72b2bd05a81..04396dec63fc 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -391,11 +391,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 }
 
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
-			   struct drm_crtc_state *old_state)
+			   struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(new_crtc_state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	bool oneshot = vc4_state->feed_txp;
 
@@ -404,9 +405,10 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 }
 
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
-			    struct drm_crtc_state *old_state)
+			    struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
 	unsigned int chan = vc4_state->assigned_channel;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 34612edcabbd..4a26750b5e93 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -406,23 +406,19 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
 static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	drm_crtc_vblank_on(crtc);
-	vc4_hvs_atomic_enable(crtc, old_state);
+	vc4_hvs_atomic_enable(crtc, state);
 }
 
 static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	struct drm_device *dev = crtc->dev;
 
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
 
-	vc4_hvs_atomic_disable(crtc, old_state);
+	vc4_hvs_atomic_disable(crtc, state);
 
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
