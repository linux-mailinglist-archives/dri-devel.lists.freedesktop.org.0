Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C6554D35
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC59113381;
	Wed, 22 Jun 2022 14:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AEC113361
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5552732009A4;
 Wed, 22 Jun 2022 10:33:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908424; x=1655994824; bh=pt
 Y884X9stCzuHfsQAgbBUlFBjo77Ri9uMAoH3kYwZw=; b=SywJPKpuax6yboWS4M
 /cxWBZqrNdQ7+fOWhL2g/3tV9HFfdHZ01DdkA9i7jXCeJGZfadf3HInLGOELYWO0
 jBBDkCyIsn6DEMoUylelaMJ4khZMLXLKTYphjpHVXLsuPicE8i0wFequDn5HBYnp
 F/OR1toHqh2W8w1MwPwyqBg20WJ32qn970w/kBJkLD3wfH8W9TuX0GUfsepDam2H
 W7kgsdbRwgQLFd6crJx/T2inKwUl+90XsDxnZr2qVhOOE0YNh12AsK5wDXx5xSvG
 QQyiBVzVuvHAmy+cvQEo4HAO7V40BSMRi/h5nmXbq0NEJ3pikYyCYFP3yxdQ8v0l
 dhuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908424; x=1655994824; bh=ptY884X9stCzu
 HfsQAgbBUlFBjo77Ri9uMAoH3kYwZw=; b=l8FLbxdIpiEXvq/Q+oNzJ6+3YAKXx
 NlAZwCBmns+0dtXGQlxkiCJGIGZgh8US+a8aY4ve1v/AR9xnh5pC00gyvEoq0Di2
 ZE9VImFs43FjO3ih1x6hplUbEgACadobSPdIIbTdzSduQEj3thlbwXOWWXNUZZ10
 5h0SW5fcnqYeSiZ0jB1C4mzE+Xeyvs5bqpE6b2anCss5aF3eJSoJFYk7no+R3TA2
 0MmOG3m9nztNKTNiFMuf9iQrAFOKsgeYYmEJdiwMShTWxc5bZC4B4OE6BOrVeVbV
 GQHwnblmxsCwU4fLflb/0ZwMeoAvGmq86NzqeWsIk/LTYtzvQczZhY+Gw==
X-ME-Sender: <xms:SCizYoAowXjMSY93u-niOZ0e8UtSAZBzQ6egkUN-18unAXsEoy2Ztg>
 <xme:SCizYqhal5LJngXjx398aKEqunTLkrX0UsOX5e3fKUazRuXpotu_3Io856Ebbi-hm
 fqywHp48WVGvFbQPgY>
X-ME-Received: <xmr:SCizYrnhJKDqZm01sFtI5LGIIUhSs3VYk4EZWxtALJeUdDSMnxIr_vDKEwaSmKbvNCBdCMpE7Qv-56few0Kkvfe2D-1U5Eo0RUV5d3E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgieekvdevffekueejffdtjefgkeekjedvvedtjeekvdetleeigfeludej
 keffgeenucffohhmrghinhepsggrshgvrdguvghvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SCizYuy97xuid-0ZJCB3xi-KYPndxpalMV_dFSAGzhLVe3LgxcKLHw>
 <xmx:SCizYtSpiUMzGhiD96b8P8bQKgThdCqBfJbACON76GGBtLGebDXnbA>
 <xmx:SCizYpZjiFgKXeAOB1lSDRDoyfuJsfNxObUAZXjtJkPVPJ4GmE5Mrw>
 <xmx:SCizYmKLakgOnfiNv7OrM223xLuSe8NQDBj0pV2PbXuMYfn7WBI9Xg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 29/68] drm/vc4: dpi: Switch to drmm_of_get_bridge
Date: Wed, 22 Jun 2022 16:31:30 +0200
Message-Id: <20220622143209.600298-30-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 233bc5d3b02f..71bb51e1d703 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -220,10 +220,11 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
  */
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
+	struct drm_device *drm = dpi->encoder.base.dev;
 	struct device *dev = &dpi->pdev->dev;
 	struct drm_bridge *bridge;
 
-	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(bridge)) {
 		/* If nothing was connected in the DT, that's not an
 		 * error.
-- 
2.36.1

