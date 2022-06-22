Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE3554D33
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E40113358;
	Wed, 22 Jun 2022 14:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882E4113358
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3DCB4320095B;
 Wed, 22 Jun 2022 10:33:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908418; x=1655994818; bh=d2
 TXGcBPX+Qu3k74sK5GmecWWTkUwmhSRQb3AlQeSVo=; b=3GXI5xTHkCUzet2sM6
 hpjwA2A74MsAlxpofWsl+b3wkGH03foQJuZlmaAFmZf+fwhpZ+4S9EdBrkIHFIjr
 0LJVOm26w2kEvbfPLQr2wJQDBMQZA6k9WnLukv2sHwLqcDrI/a1WsKph10BJlEah
 0xBhnZfoPP5K3q9NQ6EEWLpgIX9slvOmGZlAbCd06qdJa/JoBtg6rCOQj1MloQTP
 Z8WIlEoHtk0j1e3Zo0QrAtsQeLG08zGGTJRFTt5WxjME3AFAIZCWYN+LeDoVtyCp
 cy/qzR1m97GLr5ZmesB9jwhSjre6Ce0/pwoE8bPdDgWkKtiuTBX7L+o1BmTyQm53
 c6xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908418; x=1655994818; bh=d2TXGcBPX+Qu3
 k74sK5GmecWWTkUwmhSRQb3AlQeSVo=; b=Cz7g8RuXTnx4qBJU4LzKkFnyQJphN
 o4mG2S0ZgLmlgjZBDVa36pD1X+qWVf4aERPlNr/ViSUR5m4206dbb8LkOW7LE42y
 A65JJL3s9V+zKeregIM9Hsolv7fudyOZI2mpHmaGY0myeyNEj8csruA3GYVWsxEW
 KDWD29f3FemXTdP/ertwjwYzWrcn1vqeAyNMRS6h94b3NF+/bOrl9RnCUQqEP3TE
 DbC6JU8FurU9pMeer3bP/bh7DEjaSxhHsert1wCF42KKXvsWDxoxmJ6qxxW8Zymf
 Xk2VhWuVDeTBnf8NqBcotAktjSyoxvcImAGq6SOE5ezsxaGKGOvaikqDQ==
X-ME-Sender: <xms:QiizYhKSfaj9gVSBkUbSKUFxt1r-dagc1lCeyVvpWvbtMWO8EgvJZQ>
 <xme:QiizYtJ5QRu21vZwvVr928Ux2GU_OuAcZWlf2kebo5zOfuvLO9sAgWtE_PYVx26EK
 BVwDhxjow7UrFvySA8>
X-ME-Received: <xmr:QiizYpviS8-M_5PtkpttlP7dBonjKEMrS7Q0JTRRronlbDgK8ogRWGomHc3Z9eyG4fMKgxSqcuz56-aj6B31h_2muAn1_w7ZcIrDljM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QiizYiYqrgbBgcWoHw9KTksnXL_xJqJIOA7fI4uAZk9YPKGUG9GiKw>
 <xmx:QiizYobaUV39TFN4N-axDO1SrE1mcq9rZTu5P8bpRbTKtBRYU5OTYQ>
 <xmx:QiizYmALnW6vjI-_KrBKWNOmGNP3kxZNk8ZiwOjkr8KwCkqxlE0V8g>
 <xmx:QiizYnxifEuT8vXieS_FFPiIw3OB3g4VgjvlWATKVtuzkNBI2m_0ZA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 27/68] drm/vc4: dpi: Add action to disable the clock
Date: Wed, 22 Jun 2022 16:31:28 +0200
Message-Id: <20220622143209.600298-28-maxime@cerno.tech>
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

The DPI controller has two clocks called core and pixel, the core clock
being enabled at bind time.

Adding a device-managed action will make the error path easier, so let's
create one to disable it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 5a6cdea7bf7b..4e24dbad77f2 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -237,6 +237,13 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
 }
 
+static void vc4_dpi_disable_clock(void *ptr)
+{
+	struct vc4_dpi *dpi = ptr;
+
+	clk_disable_unprepare(dpi->core_clock);
+}
+
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -285,6 +292,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, vc4_dpi_disable_clock, dpi);
+	if (ret)
+		return ret;
+
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
@@ -300,7 +311,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 err_destroy_encoder:
 	drm_encoder_cleanup(&dpi->encoder.base);
-	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
 
@@ -310,8 +320,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_encoder_cleanup(&dpi->encoder.base);
-
-	clk_disable_unprepare(dpi->core_clock);
 }
 
 static const struct component_ops vc4_dpi_ops = {
-- 
2.36.1

