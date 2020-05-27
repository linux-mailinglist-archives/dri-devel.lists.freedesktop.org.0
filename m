Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436011E59C1
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9C76E3E3;
	Thu, 28 May 2020 07:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03C6E340
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 131B2581514;
 Wed, 27 May 2020 11:51:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=G7atmPA7eX8En
 DxiMYNRcBaB/TV7dfsNzYMcQXosr6Q=; b=YOmGWhizQbR3FyRe8QzBGNpNklQS2
 Zqavm22mpR9iN80mzBk6gMI4znsV9Ye9+GGgcu3aFlroxEc1XVAcTAdBHrwXC7qi
 jcknFjzSJmtCbWNBKTkI6e4tXb/ovenpmOsb4NvVPN9A8Q+PiEPFp1qEMZcGIQbk
 R9xXngYFPmGmxBsSU3mG8rcs2fQwUKahffwej5+PjZVFmitqkEQHIcU/S9spSv+k
 wKj9p1PICjmyGHGwhomwNBqVCMcaTGoVJhGwr7MCXdErwf674oH3o7Hvm0uu3/bT
 NVWcNSLvJ+UEaJPMI4VEkgLc54jMxekXr89U9li/UNbLlDf9unKJPM2HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=G7atmPA7eX8EnDxiMYNRcBaB/TV7dfsNzYMcQXosr6Q=; b=Gpp6s1SF
 U58FsU/krF2Fqnx20uqepleXvZW0CSUF4N31fVuihW3Gu2a25xQAJiF5t0uu1WDw
 YWZY1VoDirFSwFXfxTTUErxVMb3PCMcOWHQUNa1d6J4B/2Q1nnEO2M0O4+OXWLLS
 047FNwxIjm1TLuDSu53qwbOjGQ4Tlcs1IVHNc2VhYtTLxmSGF71uWkJYUcM1maCI
 tjCSY+PLZjjGxQSOMhimkCIQSr9Xs10NsvalHQn9n00zby8jQK0L/mSXP3hvCscx
 GOO07UAl+CAUkObpy0qBUivlU3CwB0Y12pyyzcK75LJCfo7ldGULGAz63gj2D1ES
 E9niaMBK0Hk1rw==
X-ME-Sender: <xms:h4zOXr6c9Q-0-O0Bo4yzzJACxJ5azm2BnDXDaQLlZkSyM_ZtdkJ9zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:h4zOXg6NhAHYD_Mz0zbMrRLwKuoqS7rWXpfBWRrIxdFmrYSf2Mc76Q>
 <xmx:h4zOXif7cuBNtJ7e012tt7XyR6vyfXLnvODeAAno27EvmECKOzDbdw>
 <xmx:h4zOXsJlcX0hde2dGO6zcwTpJG7pxsqfSlV5AHiB4hixs2KC0uSEdQ>
 <xmx:iIzOXsp2g4gUrgJhKNMbs2SwdT-DT2jp6tARLqs-d5DY-gqM-iTHTw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A76C83280069;
 Wed, 27 May 2020 11:51:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 088/105] drm/vc4: hdmi: Add CEC support flag
Date: Wed, 27 May 2020 17:48:58 +0200
Message-Id: <954a94de6ea75165ef0c44ef0298bfa960601885.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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

Similarly to the audio support, CEC support is not there yet for the
BCM2711, so let's skip entirely the CEC initialization through a variant
flag.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7eb3cee25001..27cfcf38edb4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1178,6 +1178,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	u32 value;
 	int ret;
 
+	if (!vc4_hdmi->variant->cec_available)
+		return 0;
+
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
@@ -1457,6 +1460,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
+	.cec_available		= true,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 22100820c81b..20e0f5498f1e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -33,6 +33,9 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
+	/* Set to true when the CEC support is available */
+	bool cec_available;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
