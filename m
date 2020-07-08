Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E76219967
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1116EA1B;
	Thu,  9 Jul 2020 07:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B4889CF1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2B7FAFCC;
 Wed,  8 Jul 2020 13:43:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2uHFyUwNK/6yf
 bghIh47l4CHUyqe+Ay+rc5YWKDiiP0=; b=KBVeSrpAcLKoyrd25J6k9xhdbn/rE
 3w/7us9W15wAWVmslYDNzLWPwJ9x3DR8779ylf91b5H0vMR12/g5EButdraw+HNe
 64bFbgADRO+BmQl62IMwQutbTOXDQxeJW2Pl6nHSp3rkUZW7L5awf051690wLUPz
 QA0hgcB5asL40sleKZICW9C69kfo2779QekRhhtDRCs36J2Wwwl4AEKD8LZ0Gvo/
 jp56BCJHmiJhnYPsvIqi9OyUEn70E+tDYa/UC6XyICBeS8F3wrHnsL9ptqygO04t
 OL38yf5ABZ+dcj9n2Job1PS4s6sZb2J49PXHkoEJ/opPaujuZ2uzSXBzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2uHFyUwNK/6yfbghIh47l4CHUyqe+Ay+rc5YWKDiiP0=; b=k9dyQKdP
 LkT//GfaFlHAV+2HQIIkFfjvbv0NVoCTdnb5as+3W963E8dzbyhPGUrFHpHtfYO5
 1UNZbbJHfCXvQFeZCrh6l5wCucSoHNkZQCyHRhneiZNuyzw1AP2gNCjEHGoJfuvf
 8irpbRIvSPD1b7d1TMdKc8OddShlm4aKyYIAUCSWY5HJVNwiE71m+Iqr75AQ8KKs
 2Z8LSMYXdXzo3K9zN937uvbLR2+XRnxo2gJOy8Ml0P5iQKs2X6YVfWcqVLMJujn2
 H0+O83krNGgPsmKNg5KJjOG1s5+pVJYka3uNEmAmxLemuRiV+x5ZcMzu3OD6h9q3
 6hEwOS5Ej0FtXw==
X-ME-Sender: <xms:1wUGX6qWEZ8ZXz0JLNr9taDLzcJ518hoxQ4BwABKKvhq8mkMW85I9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgephedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1wUGX4r-hyAZ-AmWxNRiaF8pVpu1goGtEzJangKb63WRh-RQuDpJJA>
 <xmx:1wUGX_O0L1OwpDet7bcAUaIRa34Ci0r1JjgiZHi8dfNxHJIOw1U3Hg>
 <xmx:1wUGX57JyRZUeDaxtCqzO9naZdR7o6XFxS-Cig9KgKhob8L5RyA7CA>
 <xmx:1wUGX0Y_dlv6KGns_tPAlrCF0OkzDeTgvHgPaE1CFWRycDd013gqH-56_1Y>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78BE23280059;
 Wed,  8 Jul 2020 13:43:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 56/78] drm/vc4: hdmi: Store the encoder type in the variant
 structure
Date: Wed,  8 Jul 2020 19:42:04 +0200
Message-Id: <08b5c574e128bc7c42387867aee11978068c2aa5.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The vc4 CRTC will use the encoder type to control its output clock
muxing. However, this will be different from HDMI0 to HDMI1, so let's
store our type in the variant structure so that we can support multiple
controllers later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a50220bfd5dd..c50241170d7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1268,7 +1268,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
-	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
+	vc4_hdmi->encoder.base.type = variant->encoder_type;
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
@@ -1447,6 +1447,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct vc4_hdmi_variant bcm2835_variant = {
+	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 0c32dc46d289..0d529db4b3ab 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -27,6 +27,9 @@ struct vc4_hdmi;
 struct vc4_hdmi_register;
 
 struct vc4_hdmi_variant {
+	/* Encoder Type for that controller */
+	enum vc4_encoder_type encoder_type;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
