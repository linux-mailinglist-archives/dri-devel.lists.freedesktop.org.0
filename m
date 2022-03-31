Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4104EDBCE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47D810EF85;
	Thu, 31 Mar 2022 14:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90B10EF0F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:37:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EB5DE5C01F2;
 Thu, 31 Mar 2022 10:37:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 31 Mar 2022 10:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=ni7kRpxEQP2Tkhl0vs79fy51SvbOJG
 UP4EOKTq3N1Zg=; b=AO+iCKIA4rrCDGaTg4Tar0rgpbYB44WCwAsmMWk08OGNSg
 Om/ZMlQJpJeTctpeYuJAoxsnJSF4c2QokdwmfG+xIbdTyW2Q71P9M9u3gNc+y2Tj
 wfxGvKJH0XYQwHIOMRBwhUnoBcB5YtrznH1mdmDfcdZpI4XcoGMcQVtzZ3lWKVhK
 LFnEdyKhKh9IPCcbjf713jkDxvpLYN0JTwSNKYCnaTNPr8c9JJBaZ1mWZH4+9QFf
 Hz1BwoVqXIG3O93/IhKGxRca/DJkT1EW9jSxv8nfd+PbEgp38/YRvUFmOXyqM5GU
 wftkd5DsE0AkGwH6kHCUI86M3tOot4oy7zl0Mhpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ni7kRp
 xEQP2Tkhl0vs79fy51SvbOJGUP4EOKTq3N1Zg=; b=n/OcFXZsq959CB61opIYmL
 Mv6t/cJn7M7UTt4hmMh7XhfKB4vK5ZkxrtobWpFyhfJenEwIRQdDUVZ1qWmcUpX6
 79LwVju0e72U6gXYGdczFb9xj40zYweeLSoRt4ImDIQQFjGteYYJsv15fKLTBpUf
 lbtne4FksB/P9f5KhhOX7fULvSWWT8n5XC6sNoVc3iq5zltBHLKJ8nzcdM753VSe
 cqm4e7q6hpsW+p1A1B84NnAtwTJttn5olyY3WCMJdvi+q2jFMekqxOSyN7c+eK2M
 20QXsnIfEzBu81J3n0vlLowF2CYqEPANcr0YHUEZUlWkumHuXYgGH+2c6V0kDymA
 ==
X-ME-Sender: <xms:xrxFYkc1lJEboFvLCTXFt_vw8X6h8DeVbV-4uuStlFsQBi53qfwoZA>
 <xme:xrxFYmOVYhvKnfHqH5RXd0-fcPM5W8r6hfN5_gvVryic5rPL5yoAyKdz_xtEM92F2
 gB2fWKhLTXKuhk2T-U>
X-ME-Received: <xmr:xrxFYljl1MOjJHyBaTyRauUdgvwhN_hbehnQ5-dk7kO8qG5k_zcQIEUQ8z5Mx4sR_JdN5RGKfovzaFvA2LIa-3s6lkpfLtRMqBx0WNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xrxFYp8itqn8SeNiti7-P9tVFGQ5DSehxbHtqQEIaopjPVGAkonh8g>
 <xmx:xrxFYgtcf-7fVWoDKrTa793dd4L6hIogbINOcFhKPqs5ro_wA_rIpg>
 <xmx:xrxFYgGv9t2yVSjPgEtJmqHT9EgDvy9u7W2lxfZg-1iAccL9xFmRiw>
 <xmx:xrxFYiLVWbm5lR_trMefWiBdpEL4DgJmm9OM88DKisWi2C-sF65olw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:37:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/vc4: hvs: Move the dlist setup to its own function
Date: Thu, 31 Mar 2022 16:37:42 +0200
Message-Id: <20220331143744.777652-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
References: <20220331143744.777652-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_hvs_update_dlist function mostly deals with setting up the
vblank events and setting up the dlist entry pointer to our current
active one.

We'll want to do the former separately from the vblank handling in later
patches, so let's move it to a function of its own.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 71aa5081eaa3..2d540fc11357 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -382,10 +382,19 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	return 0;
 }
 
+static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+
+	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
+		  vc4_state->mm.start);
+}
+
 static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	unsigned long flags;
@@ -405,9 +414,6 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-		  vc4_state->mm.start);
-
 	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
 	vc4_crtc->current_dlist = vc4_state->mm.start;
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
@@ -434,6 +440,7 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	bool oneshot = vc4_crtc->feeds_txp;
 
+	vc4_hvs_install_dlist(crtc);
 	vc4_hvs_update_dlist(crtc);
 	vc4_hvs_init_channel(vc4, crtc, mode, oneshot);
 }
@@ -509,8 +516,10 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	 * If the CRTC is being disabled, there's no point in updating this
 	 * information.
 	 */
-	if (crtc->state->active && old_state->active)
+	if (crtc->state->active && old_state->active) {
+		vc4_hvs_install_dlist(crtc);
 		vc4_hvs_update_dlist(crtc);
+	}
 
 	if (crtc->state->color_mgmt_changed) {
 		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
-- 
2.35.1

