Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9BD1E59D8
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7056E456;
	Thu, 28 May 2020 07:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083036E339
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 703D4581508;
 Wed, 27 May 2020 11:51:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=shm6sF87ItrwW
 YPyqYBMld8xZIeMwBquVqAKxgBoIXQ=; b=BENg7e6v3urgsjSuqUqwxZJY+3dyI
 /j8mkUWpIiCYDUAv6SW/4wSp3ePTZ0Aa8HpRfGj+d3cp8gGff643zQVs7djH62b1
 OoEfEzIUMMPqgjDhBU/S68QKygE7EpRPnjC5XamlXArg2w2mwAbCvAdIq8GtB/Zc
 VXzLv9iwE8KuvLlXOpjZQEGsE7/++mvRV+2rONoalkS2ePT5aZKvEhu4q2wylmr+
 sr/z6chtpjTejBopAi7W5BoOYRtf0iPhYSHqkOSHbdbDKRV0wi39/0OGHevCzpd7
 AKzvOBMt/3itWKgr2hnBXe0/O66ocCPQF6m9XPSwloWhdsddRe8r9cgpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=shm6sF87ItrwWYPyqYBMld8xZIeMwBquVqAKxgBoIXQ=; b=CAKyJyM2
 Fkadp4LxQPhMqyik+Vd34ICtXGN0RTJgeXxGGNrf6qVXdV911IXirY2HJdSE18+3
 w0j/mvxCCmFGpge2rIZgsgoLHB3zfM/tBZ3W9d8ys6rB/ROU2T28FHtaT6ABHiDa
 6wFC+JTGvnfkpiktOXJYW2SwutsYSZWqlecMyLa7CXUhbI/vqowWluNLOqMnVP1j
 kVVdA+tXONvIM4lYf9jdN3rCdF6OOqbgUZFowQ8zohUKqxFBBHv7LyRkNaA51cSD
 kulsw46GKZsg4HFR2LhL1A/9Xck4Lucj4gT/ZstqOXsN4d0kn+XGZdtK/OikU2WP
 FLg2BAb6yIFnag==
X-ME-Sender: <xms:g4zOXtJz3B5mOZKO--RV_HuEtNIhiItLhMFrVw-MdScewxTS3N9uVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g4zOXpIYel3YJlJjZlAnAIUPcvoK3X72jsoCwVfe-2JSj8dXMai_oA>
 <xmx:g4zOXlv6B7kidDa1jGyxJhzb1EHeLCTF_-g0DHkK-tV4xQ5OD0_nqA>
 <xmx:g4zOXubGGu42iPc0efbLVdT4i-59WtFGQ78ctei69NpYZBlvSAvipA>
 <xmx:g4zOXk7rwoSEhSr2UuzovrG9bCnVWnmyJ0E7WwhNzdanjiPh7rGmuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E79330618B7;
 Wed, 27 May 2020 11:51:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 085/105] drm/vc4: hdmi: Store the encoder type in the
 variant structure
Date: Wed, 27 May 2020 17:48:55 +0200
Message-Id: <8119ef70c9bd73455895b23a039c4ab7360a4922.1590594512.git-series.maxime@cerno.tech>
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

The vc4 CRTC will use the encoder type to control its output clock
muxing. However, this will be different from HDMI0 to HDMI1, so let's
store our type in the variant structure so that we can support multiple
controllers later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d63fbc97360e..7542447eb314 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1262,11 +1262,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
-
 	vc4_hdmi->pdev = pdev;
 	variant = of_device_get_match_data(dev);
 	vc4_hdmi->variant = variant;
-	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
+	vc4_hdmi->encoder.base.type = variant->encoder_type;
 	encoder = &vc4_hdmi->encoder.base.base;
 
 	ret = variant->init_resources(vc4_hdmi);
@@ -1428,6 +1427,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct vc4_hdmi_variant bcm2835_variant = {
+	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4a67d62aef53..4240c5ea7fde 100644
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
