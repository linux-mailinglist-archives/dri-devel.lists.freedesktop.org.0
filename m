Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F3216A2D8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B82C6E3B8;
	Mon, 24 Feb 2020 09:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13206E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A44D8643;
 Mon, 24 Feb 2020 04:10:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=NeT8Etu/n2smw
 w8XqanUz9yA7nyrtyuA4swRfjiBSaI=; b=OYmoHfSoUssolbQCHPPkUDjwGGcvS
 Fs3QkfShyat74WbcsXvoTtNvU8mybwQy3AG/Rv5tAlXj2ahTYikOb2krHBun6jor
 ihzmi5nipoiNf7AKcNos4zDDnPX72iyOK1sNrHZ2sQJX31zK9M5LbWqeEug1NcrF
 WoRLa1mUWNDqWc1maXwZT6d6EOxoSjWBdy9tNXAPfyEu1UjDyGbKb0W8ZpyDoANj
 B3oI8LDrWA5TOaN7RFk9WxAuedaeS5xMxqh6n+CaS80wGekT5awrq5J8M5MpQWeZ
 vdPNBlSIycPCTTQOBcyKDn6xKgUwvDIM9I+gNJFhJn4WD1OgpTbkH7K/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=NeT8Etu/n2smww8XqanUz9yA7nyrtyuA4swRfjiBSaI=; b=QE56iucB
 +wDSkVI+29GTHwe42bFY03MfCD3j+5CRWzso9gu63jk9H9uW8qd1jjxChiGV0+4G
 4LGv+VCmpoaL604058eatX2f9yYttAJjjPXRRJVulfgkcgYrvS0Sy/g2MIYytusE
 Mo5nouqytxs6gOcG0e7EAtVlDyUcJc3O/0HEAYrqayOJDP4PgAgokIfo9qAu8Y5D
 udLOyC7vrtOHEiI7uFPfiFsszTFmepL11GIC6361i4ziRqFcJZ/BB8ZiBz4pWwQ8
 nDkQ+qdwaUwzvhyeseAj7IVpbcwvRIdb9Q7lfn5ZFwh+pkJQu90RCobEWhVgKMj3
 Z9Jlc3+om1dyEA==
X-ME-Sender: <xms:E5NTXnXHVDr4LnKT3xgpBvHncCO8aPPwT6h157buMQtAa9rfXYpt6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:E5NTXnbGeHWrWOmTgfu4r4O3ARZo-egXA0JTriHblyOjzQl7LrFAlg>
 <xmx:E5NTXuwcxzkZG1prk49qbonaXHM7zSH9fwirA0QNn6W3bUjpE5yb5w>
 <xmx:E5NTXsKwF_qDFHm2asw70mp49hMpea9DyABERcYyOpbJPsWxlpHzHg>
 <xmx:E5NTXsI95CC0r2_00aZB5SdFG5bhpMrH3j8bKS114r9J1jzPQkvaGzX4eSU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F28023060F09;
 Mon, 24 Feb 2020 04:10:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 79/89] drm/vc4: hdmi: Add HDMI ID
Date: Mon, 24 Feb 2020 10:07:21 +0100
Message-Id: <c1c6dbe495700dda05a4b841d8a373f04916965f.1582533919.git-series.maxime@cerno.tech>
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

Some operations will need us to have the raw ID of the HDMI controller
in the BCM2711, such as the encoder type to register, the name of the
debugfs files, etc.

Let's add it to our variant structure.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +--
 drivers/gpu/drm/vc4/vc4_hdmi.h | 5 +++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 98198ece8db8..fffd1ce7cf90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1252,11 +1252,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
-
 	vc4_hdmi->pdev = pdev;
 	variant = of_device_get_match_data(dev);
 	vc4_hdmi->variant = variant;
-	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
+	vc4_hdmi->encoder.base.type = variant->id ? VC4_ENCODER_TYPE_HDMI1 : VC4_ENCODER_TYPE_HDMI0;
 	encoder = &vc4_hdmi->encoder.base.base;
 
 	ret = variant->init_resources(vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4a67d62aef53..4d3117de383a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -27,6 +27,11 @@ struct vc4_hdmi;
 struct vc4_hdmi_register;
 
 struct vc4_hdmi_variant {
+	/* On devices that have multiple, different instances (like
+	 * the BCM2711), which instance is that variant useful for.
+	 */
+	unsigned int id;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
