Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E0546253
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CDA11B793;
	Fri, 10 Jun 2022 09:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1858C11B3DE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 746D75C01B2;
 Fri, 10 Jun 2022 05:30:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853439; x=1654939839; bh=rf
 LDFnE62l0MXVeDX/fDb0pXoiVt4XPQFCk6hFYaK1k=; b=VydiX04I+/9kEcf+BY
 tSpJoJWLifqRTXtmR+hUkHXSB9h5wl8mbMeIKOgRkbPPlkhc2x7hr3xPNnzarb1b
 VM1V1Ir8eqLlg8DzC/xXbJRXriGpwdXQYykXMuTJ5H2LaPFI9EfbBbIMb3wmMCU5
 wGw1kVAV7hnuCHFiGBbBVcAYNRraUGle0BYq5IH66eC55yNqsPsZFitvqzK+5gOT
 3iuaXAwBgQgiAaWxqW3lzT4k87U51gpuWmd3Y1mFXQyfGWcB4qpDF/2NQu8TBU4Z
 RInyQb8IsPhMRIaif0vgmP+QO1KAXDbzk/5juy2/xOqv88peeXcF6xD1mKMk+jjB
 G5sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853439; x=1654939839; bh=rfLDFnE62l0MX
 VeDX/fDb0pXoiVt4XPQFCk6hFYaK1k=; b=yE4ikCrEGw7wwsgQjiiP0QnUBIIT0
 cotjF/HLgcvVjUiLw/pQOM/cDb4hVh/fC2jGfOLEDVFM/vcwN6a90S7+2Jv6VUcz
 9hK5F0l/wT8oWWnn48CE8NLIeIOUe+z4NvEXNlbtvtA7VTBUO5CQcvyzpqba/nIp
 cBAj7MNwA0Ux8SxMJl6VeaTQ/4vuTEZIDkBXoxfLeTJDcgHq3lh7eLOQ+q2NP+0n
 tIuUvOhXAPRmj5jErhyM3ydeyJovZizoMuEkg/xx0MCZDwGtHBcNHbCktL6jRFK6
 e9LVllj6Vnvv1p2j6s6RfOIq0RylCf0J/Si7x41uXjS3bgLYgeFgE5+iw==
X-ME-Sender: <xms:Pw-jYksNJ8l7SaNMQD4NloSpmy57_uUT6zldO2vGiIlPGO2_L-a1ug>
 <xme:Pw-jYhcnrE6FRiAtqfjSZWwV6kU17cRAvUa_VorPVoyC4tWYY9oeb6-Vgme_Mmz5r
 yhIQEpMPvDLGvSKAUo>
X-ME-Received: <xmr:Pw-jYvym_xy-oq782oPqy-I4-QN3-R6ilweqkwY9_IAflc9egT3THCcP30AQ5EdeYx8lRfM2cfS-hR3rxgDt0nhrfyzmaxS_zcqKcTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Pw-jYnPtE8YyY2NiyXf7uslH5TMASCZUGAOtpdd0A8Jxz6YXMrwV3g>
 <xmx:Pw-jYk8wGRqQwz9CmXF2b6xu_O8Xt3CCsFbd-QP3utH9k93w4OW_eQ>
 <xmx:Pw-jYvUn20nXW6LOUwQZOTgHHsJVh6Hp0BF1EO1OrYMwzUSlscTIQQ>
 <xmx:Pw-jYoYlvsNx81G7L4c8tMCxbSCkv8N6GcNWP8XkLOJhcTTHf1PgBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 40/64] drm/vc4: hdmi: Switch to DRM-managed kfree to build
 regsets
Date: Fri, 10 Jun 2022 11:29:00 +0200
Message-Id: <20220610092924.754942-41-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code to build the registers set later exposed in debugfs for
the HDMI controller relies on traditional allocations, that are later
free'd as part of the driver unbind hook.

Since krealloc doesn't have a DRM-managed equivalent, let's add an action
to free the buffer later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bb9bd0c701be..ecc898684c4b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2655,14 +2655,23 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 }
 #endif
 
+static void vc4_hdmi_free_regset(struct drm_device *drm, void *ptr)
+{
+	struct debugfs_reg32 *regs = ptr;
+
+	kfree(regs);
+}
+
 static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 				 struct debugfs_regset32 *regset,
 				 enum vc4_hdmi_regs reg)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
 	struct debugfs_reg32 *regs, *new_regs;
 	unsigned int count = 0;
 	unsigned int i;
+	int ret;
 
 	regs = kcalloc(variant->num_registers, sizeof(*regs),
 		       GFP_KERNEL);
@@ -2688,6 +2697,10 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 	regset->regs = new_regs;
 	regset->nregs = count;
 
+	ret = drmm_add_action_or_reset(drm, vc4_hdmi_free_regset, new_regs);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -3030,9 +3043,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
 	vc4_hdmi = dev_get_drvdata(dev);
 
-	kfree(vc4_hdmi->hdmi_regset.regs);
-	kfree(vc4_hdmi->hd_regset.regs);
-
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

