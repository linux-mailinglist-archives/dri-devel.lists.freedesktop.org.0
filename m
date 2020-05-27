Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E51E5985
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECC96E423;
	Thu, 28 May 2020 07:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BA86E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4EC79582037;
 Wed, 27 May 2020 11:49:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JNjtzlAqDA9+g
 wfnpcyHMYWUnTOc/3kzSZCf4w6U+OU=; b=LnDfksf5nWrkGfQXWCTE/DliYINM6
 eVueHAn0nHZiyNNw905TcjPS4YAXXLL2OooMnwymQ8Ik/tfBpBvlTgQPk2zlVMOF
 6jA1/xzpq2s9Q1Hm/nVtqzLBPuFlzhMLtkgLISDZtqXKke5QWIniM9+nk1fCDShh
 LHzMBxSNZWl2qFgu9riWNENn9BqnqohzmLxGdSBZBBfIQ6wA37E99iyFIEWdwEYE
 Hpdgly+BmhFMIK980Dv1o4eZiQ+JLvTBzb5QKCrymyd+OoaxVT0IvRdvCro3CWL7
 N0yD7l0VwHYZA4non6q8R5TDCPPtaXGkTuNbgtU5jUBKUYesCTQun1b+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JNjtzlAqDA9+gwfnpcyHMYWUnTOc/3kzSZCf4w6U+OU=; b=l1ON8em1
 pY46XNPMqzTkH1x/xq4P9QZ/pcHY89YOkwCk8hEFkVdk7B6CEZF1B6My4uIvdhwR
 R+r4B/awzs4owzwO78lRrEj+kHVOLKNuvG6Z2B6YB6dpJb88Wm5uQHws3Tk+p6N9
 9LXPS1XEmCYykkaJhfO//npVVnhrk6v63m5qcC+DPmGUsQ+zankhYNpPegnhdg9X
 DsyI6Grgc35oTvogPG0IcufcBEqJrYNqqt4L4H+NfnG2AWnK4D3FR5nNfe8ABAUh
 c3kAWtDNhRbxYZAJx/TuD/7X6mVbzhQJujx59qRGWqS2qikcjcvPcRRN5vRN/WQa
 RmSBdtqpfabOcw==
X-ME-Sender: <xms:H4zOXku904LgSvczNi5yrs7XhlPeDOKQJW4xBb56uPQDlQHvP2qTqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H4zOXhcXU8OSN2Z4zOy-tEdKKt5NicrYvnzc_ezarqJrTHN49TSHHQ>
 <xmx:H4zOXvzWswPhtlu0iwUICFPVl9QxJMiZZtVXUFIjzKzXJl6N-KlRLQ>
 <xmx:H4zOXnNd7CM6nrAQh66PKwbf2C0xAbvH5YEq-eBLKJa0PHx1p7i2aQ>
 <xmx:H4zOXhOVHEf7W8Sy5SsPEtdlNbb2njiO2lpdRZ3mNVl9ZEB3FjlQLQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E2F2F328005E;
 Wed, 27 May 2020 11:49:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 022/105] drm/vc4: crtc: Rename SoC data structures
Date: Wed, 27 May 2020 17:47:52 +0200
Message-Id: <39aed7dd512ce2a4560902974ec26b16b88ec68b.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

Since we're going to introduce pixelvalve data structures for other SoCs
than the BCM2835, let's rename the structures defined in the code to
make it obvious which SoC we're targeting.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 2131164779dd..9fdb0ccc4a28 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1058,7 +1058,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.get_scanout_position = vc4_crtc_get_scanout_position,
 };
 
-static const struct vc4_crtc_data pv0_data = {
+static const struct vc4_crtc_data bcm2835_pv0_data = {
 	.hvs_channel = 0,
 	.debugfs_name = "crtc0_regs",
 	.encoder_types = {
@@ -1067,7 +1067,7 @@ static const struct vc4_crtc_data pv0_data = {
 	},
 };
 
-static const struct vc4_crtc_data pv1_data = {
+static const struct vc4_crtc_data bcm2835_pv1_data = {
 	.hvs_channel = 2,
 	.debugfs_name = "crtc1_regs",
 	.encoder_types = {
@@ -1076,7 +1076,7 @@ static const struct vc4_crtc_data pv1_data = {
 	},
 };
 
-static const struct vc4_crtc_data pv2_data = {
+static const struct vc4_crtc_data bcm2835_pv2_data = {
 	.hvs_channel = 1,
 	.debugfs_name = "crtc2_regs",
 	.encoder_types = {
@@ -1086,9 +1086,9 @@ static const struct vc4_crtc_data pv2_data = {
 };
 
 static const struct of_device_id vc4_crtc_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &pv0_data },
-	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &pv1_data },
-	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &pv2_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &bcm2835_pv0_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &bcm2835_pv1_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &bcm2835_pv2_data },
 	{}
 };
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
