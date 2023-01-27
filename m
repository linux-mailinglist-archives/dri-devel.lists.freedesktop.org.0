Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC867EA80
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 17:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385CD10E181;
	Fri, 27 Jan 2023 16:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4B010E181
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 16:12:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7566C320084E;
 Fri, 27 Jan 2023 11:12:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 27 Jan 2023 11:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1674835942; x=1674922342; bh=4WoLgbsnb8scZ5E2SLZU6DePJ
 AXt1EcxRMVozRSjLdE=; b=fo8KCcpuQZ7CNi+1tWzDISn+Gfm9GJVg9ypKBDYqM
 cmk9cT6Eny/8+YimAikNtOtvoLpYwiU2WF/JINo8qyutDCcTig7fCCDO3KddDgZR
 V16q2eIHryidKtaJdnI6RMOTEw/IqC6oBd35Xjr2C5qAhQKoAqIfAp0IXEcpI4i5
 Pu6nTmeIfoz+CrCXXXIMcy2bvVmlM1+Mbxd2NZz+gM51hcNkFgbuAV85NLRDUDXQ
 lBRMZ7AgOj22Dn5GgOGC89OLEroR0B1ljc9yVVvEnxiFsitAJISHplrnyJCQmhHY
 v+e2gvULbNMuBgDhh+RmPaKXN5+ms9IdCxYLZvCIf1cuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1674835942; x=1674922342; bh=4WoLgbsnb8scZ5E2SLZU6DePJAXt1EcxRMV
 ozRSjLdE=; b=lUUXQIroOVHvBZF+qCBhZryO+W+yFRz0drZtvRESvLHuB82COkl
 gqCzTH5dhOr75gzz8F7PwGV43ZjVhh87E243eUBasEs26m9D7hQJf8+EC+HFwkxb
 yrh5aa/X4lkrIbeJtVevt1yt1qB7vqMpyhy/Kpn/cj5VQG7I3OmwESEZ4uF0liFD
 mMZGEGvh+f/9FeXO1so0Lbn5a0XfE5p0mtdJXWq5DXsaho7svprTO1r5SPgJsFXm
 E2MK4p6Mmd4yn7g75eDIMLnS89j2/VhRtpgXZ9oD0h5cBmASTSI9kUVRvbDkRFeB
 ihtGMzGGO60oEyi7ayZTg40ytKDsvhiOPRw==
X-ME-Sender: <xms:5vfTY0gImGbM9SdWciqF1xOfctIBPr15W2i1z_lHo3A3UwDknPOQXA>
 <xme:5vfTY9BSgqCAqL-AZZ05NwCB_YAFPPMlGXGQyK8eRHXF1HWPmkQTWQS-mXGzQZCCR
 rzLLTX859a_7LzCF8s>
X-ME-Received: <xmr:5vfTY8F6BB1sIFRRdOq2BBVwnYgOt9JT2ks4qEvet40yC_z7wUByWXbUae7hYEgyjgUVPBifrE2meTihyakb89hQkz6rW0TLoXUUW_L7hO7wkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevkeetteejheehteegvdehvdetffdtffetffejhfffteevkeeugedvueegveek
 ueenucffohhmrghinheplhhisghrvggvlhgvtgdrthhvnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:5vfTY1QWAS6KF0LRDLVKHbfWxTJWWPvfGcSzaNR_COWhP_4WiwXt6Q>
 <xmx:5vfTYxy-OTr2P6sMDGumV6adgJo_WtVwNlnG-KYRObyCHDU6m7_WuA>
 <xmx:5vfTYz62GbYR9rf7eQ6oQbqSUjSu4LjUuuMip9zqe6048uXZYx1pAg>
 <xmx:5vfTY0oxwxQeo-8y8g1_-XE0h-nL1059GYq1TQ2IS9dVXvDFcIwGog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 11:12:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Always enable GCP with AVMUTE cleared
Date: Fri, 27 Jan 2023 17:12:19 +0100
Message-Id: <20230127161219.457058-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.39.1
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Issue is some displays go blank at the point of firmware to kms
handover.  Plugging/unplugging hdmi cable, power cycling display, or
switching standby off/on
typically resolve this case.

Finally managed to find a display that suffers from this, and track down
the issue.

The firmware uses AVMUTE in normal operation. It will set AVMUTE before
disabling hdmi clocks and phy. It will clear AVMUTE after clocks and phy
are set up for a new hdmi mode.

But with the hdmi handover from firmware to kms, AVMUTE will be set by
firmware.

kms driver typically has no GCP packet (except for deep colour modes).
The spec isn't clear on whether to consider the AVMUTE as continuing
indefinitely in the absense of a GCP packet, or to consider that state
to have ended.

Most displays behave as we want, but there are a number (from mutiple
manufacturers) which need to see AVMUTE cleared before displaying a
picture.

Lets just always enable GCP packet with AVMUTE cleared. That resolves
the issue on problematic displays.

From HDMI 1.4 spec:

  A CD field of zero (Color Depth not indicated) shall be used whenever
  the Sink does not indicate support for Deep Color. This value may
  also be used in Deep Color mode to transmit a GCP indicating only
  non-Deep Color information (e.g. AVMUTE).

So use CD=0 where we were previously not enabling a GCP.

Link: https://forum.libreelec.tv/thread/24780-le-10-0-1-rpi4-no-picture-after-update-from-le-10-0-0
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 01c1de992384..ea22c9bf223a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -97,6 +97,10 @@
 #define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_SHIFT	8
 #define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK	VC4_MASK(15, 8)
 
+#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_0_MASK	VC4_MASK(7, 0)
+#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_0_SET_AVMUTE	BIT(0)
+#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_0_CLEAR_AVMUTE	BIT(4)
+
 # define VC4_HD_M_SW_RST			BIT(2)
 # define VC4_HD_M_ENABLE			BIT(0)
 
@@ -1316,7 +1320,6 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
 	unsigned char gcp;
-	bool gcp_en;
 	u32 reg;
 	int idx;
 
@@ -1351,16 +1354,13 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	switch (vc4_state->output_bpc) {
 	case 12:
 		gcp = 6;
-		gcp_en = true;
 		break;
 	case 10:
 		gcp = 5;
-		gcp_en = true;
 		break;
 	case 8:
 	default:
-		gcp = 4;
-		gcp_en = false;
+		gcp = 0;
 		break;
 	}
 
@@ -1369,8 +1369,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	 * doesn't signal in GCP.
 	 */
 	if (vc4_state->output_format == VC4_HDMI_OUTPUT_YUV422) {
-		gcp = 4;
-		gcp_en = false;
+		gcp = 0;
 	}
 
 	reg = HDMI_READ(HDMI_DEEP_COLOR_CONFIG_1);
@@ -1383,11 +1382,12 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	reg = HDMI_READ(HDMI_GCP_WORD_1);
 	reg &= ~VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK;
 	reg |= VC4_SET_FIELD(gcp, VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1);
+	reg &= ~VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_0_MASK;
+	reg |= VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_0_CLEAR_AVMUTE;
 	HDMI_WRITE(HDMI_GCP_WORD_1, reg);
 
 	reg = HDMI_READ(HDMI_GCP_CONFIG);
-	reg &= ~VC5_HDMI_GCP_CONFIG_GCP_ENABLE;
-	reg |= gcp_en ? VC5_HDMI_GCP_CONFIG_GCP_ENABLE : 0;
+	reg |= VC5_HDMI_GCP_CONFIG_GCP_ENABLE;
 	HDMI_WRITE(HDMI_GCP_CONFIG, reg);
 
 	reg = HDMI_READ(HDMI_MISC_CONTROL);
-- 
2.39.1

