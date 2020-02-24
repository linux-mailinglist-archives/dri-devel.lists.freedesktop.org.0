Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBE16A283
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1076E2F9;
	Mon, 24 Feb 2020 09:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA8B6E221
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 878C160C;
 Mon, 24 Feb 2020 04:10:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Ff3uGUcGXy4TD
 fBH2MRflci1U8oWaQz52lbUwl02l9U=; b=BNwCM3Aq0Y49bTHPqxVM1RsW8FT2o
 kNjo16S3ZDPUXJb7WO7kuXqJsGQyRwsVI0825YZh/MuMFySajdM4FD0ML5N/+nl4
 z39yug1SICr1TemgcPxTIYTSYYxQqXoWVFfsaq1xkQmnT4uiuQMYrUnwojTfPpfc
 AWKWJNjTLtIF1HMEyJ2wc2XtHPOjA55x6EtfO4Z+TwhrlJNkPzdnjqfREdSbNHO9
 HpvKV+1CAZ9jAqlOuMOWRJiZLOEvRduxbCyDT8KJOSN52npmLp9YmL6BZH5VkLFj
 QCC+2tA2Dc3hCw72Al+yfFmLNm2rQkaZ488VCnqjrb+1h41WwHd6iNlGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ff3uGUcGXy4TDfBH2MRflci1U8oWaQz52lbUwl02l9U=; b=GFxVExl7
 z7YaPf5tJTDNA7y7Z175WVqCb8HRBUNutDGm5wnIpBY0YOjr2WXlkVNLN1R7/pQq
 8YIM0G94yJcy2O+v8v+hoVIThWSlx10cz5MJOFG2Hma2/bCYTD4CWYGYWjWwxMYf
 EKJAaB5kX42SyLlmhmUJAagFTQ6d91+G4JxOvzWjhpEwKh+tfn4jGh5z9vm4SOno
 V5IwKl2RhyLHQ9SVYaAP6xhwYdBcq72Qc+zEvf4JHylyHrNP18FxwpF2sLZnY6rC
 I78n8yp3o02GnqCTKE2wJybyKqmfAA8UyBLvEd+yMOjs/+Lb3ZlDL59UFMYcLGxn
 WMpxAAQWnSO/0A==
X-ME-Sender: <xms:FpNTXn4QbAwAHtXHIrASL_Oz-lZaEgvOsKWAERp568c9eVgyzlnCsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FpNTXuZVw5rdV8AppwcWYCjSg9UlOqegBkYAhxH4P_TNwaHuF-6Hog>
 <xmx:FpNTXnHFeL1kq7czW0bYo5XrpZVjiJAyTKLIh7_zyDlX-C6N4iNEKw>
 <xmx:FpNTXqKpVHW7g6Aqw8GNXKn1opT5XJJV06AxWttOng5Jgw1sDSCOHA>
 <xmx:FpNTXhi1BGPxNidcbz8MTe1aFRxzR8Bt3BL4lUHwElEeDuqX-Zo1OdgMgnI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CAB163060F09;
 Mon, 24 Feb 2020 04:10:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 81/89] drm/vc4: hdmi: Add an audio support flag
Date: Mon, 24 Feb 2020 10:07:23 +0100
Message-Id: <16464cc202d1867843f68f4c2746d5a1b2facecd.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 audio support doesn't work yet, so let's add a boolean to
indicate whether or not it's supported, and only register a sound card if
that boolean is set.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 25fbe2fb72fb..a98661c12c24 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -930,6 +930,9 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	const __be32 *addr;
 	int ret;
 
+	if (!vc4_hdmi->variant->audio_available)
+		return 0;
+
 	if (!of_find_property(dev->of_node, "dmas", NULL)) {
 		dev_warn(dev,
 			 "'dmas' DT property is missing, no HDMI audio\n");
@@ -1429,6 +1432,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 struct vc4_hdmi_variant bcm2835_variant = {
+	.audio_available	= true,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4d3117de383a..f41116507156 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -32,6 +32,9 @@ struct vc4_hdmi_variant {
 	 */
 	unsigned int id;
 
+	/* Set to true when the audio support is available */
+	bool audio_available;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
