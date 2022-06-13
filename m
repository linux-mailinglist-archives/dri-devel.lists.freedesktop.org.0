Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0795485D4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC05610E83E;
	Mon, 13 Jun 2022 14:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC9910E83A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2EEF6320090B;
 Mon, 13 Jun 2022 10:49:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131750; x=1655218150; bh=OL
 M34FypGdRriPwtH2Q7WnimapAKarLljrIpNbVS7pg=; b=dL2zMAwHNU7zfJ2+Lr
 p49dcE/YGOKXNrCsyft62VXYdIIIAtZWZ33NGK7vP+Vma0yzIpTvuUvnc4OEMAK/
 Q4uN+n9hZZFoEobd9Ec8Xm0eqBIKLRd9zzZcSiCkbf5NLK1Vh4Fzp0PbX4XOYCAp
 frsATdXwKdE3yDjlzptMqix02BHqd4uDnoknjBzI0GPAtgkoR7MatVTgoqrI/HFu
 2rAZ0R5XpiQDg/8UGrFRNLvxOYxqhxn7GYFgYAtnLo71AdhdT/cRD3I3n+eJWGAx
 VZz04B8GAvTAc8hMvHw28Nejxs7UKAUWurWAoJZ78OcJ+qciNJVn1DBdC18jN6Qn
 o6IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131750; x=1655218150; bh=OLM34FypGdRri
 PwtH2Q7WnimapAKarLljrIpNbVS7pg=; b=Wo9g4NF2GIAKG+6fwmmmcsQspquHE
 53jE4HJiCE42h6bUDYtS6NhMTw4m1kB6jYtWqyweasu0dP9n6ijWr6i0p3Saiyfq
 Ja/BTm8QimwXp5Jrlug9ZoyLrSzmTViVNXYCeH14L+O5wxIh4Fq9Zt9XdBWZfY/j
 hP1/ALSh90mtwlMgDGxXvnn1PZc96usgwoYx0fGWk70epTKIEF3P9yCVjclV7ztB
 jQo/p7Xq1Ib8RCCkiN4TuCVqlta08iytfQ8lX/EdMm1aptGygI1MKeNGqujKsC+Z
 u2UcsqF0szDAK3ee+Eoz+d018IfyE5Y+IHon4IGZ1MsRPcmhnOyGGDlqw==
X-ME-Sender: <xms:Zk6nYtbW6M6qAiaF3xXXm2jI0QFYRaIdICYI6GQtp4SDJ3A2irTPMw>
 <xme:Zk6nYkbZZTPsRqEpiUD97tT7hrGjVW4o7IluZ2PbsCJQ0V_uZUTcxX-81eG6hmoEW
 Miie1m79rsYlJ3weoo>
X-ME-Received: <xmr:Zk6nYv--eltc9wdAYjl5qED2XvEYl2WIJPhHGRlghpvCQ6IuOxS8BOpMj-otbfkPmrA8Uhop3n2BFHMAFH-C2ogVcEn2ExPIg2U5Zy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Zk6nYrrY07SG1j9qF6pnZmLPLsrHoOi4cZgt9aEAJ2yr-JkIzr5H4g>
 <xmx:Zk6nYoonpqYZcjst_t5JRRPmhRt71z87j55cgZEblvG_e_R0ifcLaw>
 <xmx:Zk6nYhRuY9xE1xqRtbI8UraLUjrRpArbmmIJF5-hWKfemL1btigjDA>
 <xmx:Zk6nYtAM687f8VRyrLr1nEhJECs84HIckwAQmyQX7CeXYZ_VCvam9A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 21/33] drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
Date: Mon, 13 Jun 2022 16:47:48 +0200
Message-Id: <20220613144800.326124-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The HDMI block can repeat pixels for double clocked modes,
and the firmware is now configuring the block to do this as
the PV is doing it incorrectly when at 2pixels/clock.
If the kernel doesn't reset it then we end up with strange
modes.

Reset MISC_CONTROL.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 8 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 53cc0b7b664c..8142efa2d479 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -78,6 +78,9 @@
 #define VC5_HDMI_VERTB_VSPO_SHIFT		16
 #define VC5_HDMI_VERTB_VSPO_MASK		VC4_MASK(29, 16)
 
+#define VC5_HDMI_MISC_CONTROL_PIXEL_REP_SHIFT	0
+#define VC5_HDMI_MISC_CONTROL_PIXEL_REP_MASK	VC4_MASK(3, 0)
+
 #define VC5_HDMI_SCRAMBLER_CTL_ENABLE		BIT(0)
 
 #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT	8
@@ -1116,6 +1119,11 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	reg |= gcp_en ? VC5_HDMI_GCP_CONFIG_GCP_ENABLE : 0;
 	HDMI_WRITE(HDMI_GCP_CONFIG, reg);
 
+	reg = HDMI_READ(HDMI_MISC_CONTROL);
+	reg &= ~VC5_HDMI_MISC_CONTROL_PIXEL_REP_MASK;
+	reg |= VC4_SET_FIELD(0, VC5_HDMI_MISC_CONTROL_PIXEL_REP);
+	HDMI_WRITE(HDMI_MISC_CONTROL, reg);
+
 	HDMI_WRITE(HDMI_CLOCK_STOP, 0);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index a040356b6bdc..549cc63dab39 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -127,6 +127,7 @@ enum vc4_hdmi_field {
 	HDMI_VERTB0,
 	HDMI_VERTB1,
 	HDMI_VID_CTL,
+	HDMI_MISC_CONTROL,
 };
 
 struct vc4_hdmi_register {
@@ -237,6 +238,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB0, 0x0f0),
 	VC4_HDMI_REG(HDMI_VERTA1, 0x0f4),
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
+	VC4_HDMI_REG(HDMI_MISC_CONTROL, 0x100),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
 	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
@@ -319,6 +321,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB0, 0x0f0),
 	VC4_HDMI_REG(HDMI_VERTA1, 0x0f4),
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
+	VC4_HDMI_REG(HDMI_MISC_CONTROL, 0x100),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
 	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
-- 
2.36.1

