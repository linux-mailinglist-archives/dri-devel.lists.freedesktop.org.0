Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9AE1E598F
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1816E450;
	Thu, 28 May 2020 07:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EA46E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D27CF582020;
 Wed, 27 May 2020 11:49:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sxWZl5KKn2VhR
 9WppS1aPoxRwWoqEP4r1tn8UEwXsu8=; b=xsDbRjAH4E8roBw+4bsE65xtP78Gk
 gxvX/1ATphCEOz2X3cAXpUrh0Frt0VwBmmNH7+pZSP80dFy0Xga0ojqF/sntNXs2
 nwHEu3ZtBdYCI/3J9LBJzZykaXf0adbrCsNIN827CGJbbvZ1ll29qxZTG78fJyn9
 TRy7sJtKypJ1HB+PNQDPJcgt/lz72B6o2VjP9r5nEJbl1atHfexdMK96L83E6CaZ
 lq60zRfGijk+JCft7zu/9wPB3G1OLwuW/kGKbLcb1Gs7G45z9GyDqYHE5pkgehMO
 ffb4LPIJ/Mg3Rk3lAo3rl6BZveYXanWbBv7JL7fpfxY+sZqKbIn7t6qlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sxWZl5KKn2VhR9WppS1aPoxRwWoqEP4r1tn8UEwXsu8=; b=TWTyJiJU
 HzBu4z/dHtkpxzy2KHNaQqO4bh0bdUU7fCH7NihoTtWJnoUUMpZ2fcwueKMJn0in
 DE27PmsmYzwsA3zOIQpsawmmv5XyeRYz95imGm3BhBSvrVE7sIXhsTxFZ5na2qgh
 bEA1qr8mHoZI42oMxIPwE6T+z+Z4fNqcqHL7WnLTPR1phQvFbO9A3VVlEWHrTVmM
 1DbKWlsBtOHOwTAmZvwMRwO/NhU279H3p1NB2cHUDMSoM2Nx4EFz9SRhn8OjlXiN
 sPLHAh4xtnDY83EL49R3YuOpsGoKVdoEbWlOktnDUnuXbJ+ZwEQ21+FzmCRXku5J
 HECqWiHjLoUyEw==
X-ME-Sender: <xms:IIzOXrhgSCcmZRKQ1mlbmYZPWGqpXcU-3qgBk3qcHbIveyhNvoOV4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IIzOXoCaTMIiZlYOcIDBoqPUI8DDw03GTCXBPHtmPT-8WOtC2uvgKQ>
 <xmx:IIzOXrEgzfLw7ay_9FFcsiheX0nDozCRVRV9eSvvoxtwQI_VY3hpvg>
 <xmx:IIzOXoRdxZIf46T451WQ0OyCtgUI310Uj7xcb-9pcn5wNirXqTIg8A>
 <xmx:IIzOXrzEEeMmWL4vrH2WcyqLleIrO-IcJa5TxAa8d2RmqbGaJW9yog>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 719AB3061CB6;
 Wed, 27 May 2020 11:49:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 023/105] drm/vc4: crtc: Switch to of_device_get_match_data
Date: Wed, 27 May 2020 17:47:53 +0200
Message-Id: <1ff06413a1350d28bc3e88b034ed7ad23834e5bd.1590594512.git-series.maxime@cerno.tech>
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

of_device_get_match_data allow to simplify a bit the retrieval of the data
associated to the pixelvalve compatible. Let's use it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 9fdb0ccc4a28..b668bb8d060c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1142,10 +1142,10 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
+	const struct vc4_crtc_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
 	struct drm_plane *primary_plane, *destroy_plane, *temp;
-	const struct of_device_id *match;
 	int ret, i;
 
 	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
@@ -1153,10 +1153,10 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
 
-	match = of_match_device(vc4_crtc_dt_match, dev);
-	if (!match)
+	pv_data = of_device_get_match_data(dev);
+	if (!pv_data)
 		return -ENODEV;
-	vc4_crtc->data = match->data;
+	vc4_crtc->data = pv_data;
 	vc4_crtc->pdev = pdev;
 
 	vc4_crtc->regs = vc4_ioremap_regs(pdev, 0);
@@ -1211,7 +1211,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
-	vc4_debugfs_add_regset32(drm, vc4_crtc->data->debugfs_name,
+	vc4_debugfs_add_regset32(drm, pv_data->debugfs_name,
 				 &vc4_crtc->regset);
 
 	return 0;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
