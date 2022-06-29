Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAAF56000F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2B414A614;
	Wed, 29 Jun 2022 12:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC3114A613
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0AC34320096C;
 Wed, 29 Jun 2022 08:36:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506198; x=1656592598; bh=po
 LGTBXE9XNk6FEOYa5aXdJHXp+LvQFQ4ma4ZId/SxY=; b=npl4sQRyoc6HmrWkBe
 XJ9UT10WM9za/N0mZbIeXDRFVQPmLzykWDe95FjzKFc1jKN5Kz5SntKeOym0O9k/
 bhuZVM8yFjcuqgb5t8sUEso6Iw2TWWtMRP1W82SV6Jsy73HMkVMr1RVTwyvQOkRu
 9Hrv2mDikuz796JRLwK+X2ZFtnwUyjLJPKiX7IvcZIUXKKhYlyGf3h4fG62bITuB
 rvKYb2SNt0oCTbM1t09myJRaH28v5mJDTn0FxEce+NlY+jm+342hcMpopdLnDZKL
 V0iYGfCbqDdGFslJsYhiLwVlAHtJxYOVbI+g5uofERRdfG/UaVmK9rxVXAa0PnoP
 Evyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506198; x=1656592598; bh=poLGTBXE9XNk6
 FEOYa5aXdJHXp+LvQFQ4ma4ZId/SxY=; b=d4tuUkLMSp9uqBjwTUYsIATkfcYly
 igXclYOPCOb7eqjCOCO8Nhe0m+omG0LAkE1xoq7T/9W/QnDb72/3Yzc96NJbELN4
 C1cPOgBqR2TuX6QRwUj1nxVRGBOMp4m9nazfgpqphZnpTHNx8a4atOjtx7BXxKVB
 cHV8teSkMGhnD2j1Bn8yIgXDB7HqoZLmYCx1wFdkS4CWadUED6QbqpSeLY8qGmhW
 vQ8m6GRGi/5X9JQA4TY8eqm/F6ZHaFhEuo7j87hcQOxkIFVo+DawTgFCinegKMWd
 E8k2TM73+PWJ+wBt2Yq8CP2tlwDjXHy6R1w8IZuUi7ULFc3puRdyuWorw==
X-ME-Sender: <xms:Vke8YvG7zL783pgIphSfHRE0v34_fSd3aq8t1CU72H7JjzL-YuxyUw>
 <xme:Vke8YsWnKLagdKfp66F6uTPU6hO7uZZufVYHv495EetzBViRp2WXEJsqZyQzkFaBZ
 6zOiWs2AyRkPcPdaKI>
X-ME-Received: <xmr:Vke8YhLFBo2ww6Vn9TdekG7bZUXa4Cy5QjTiKaUJfuNvfvrGNdQkQNFGFYphERX8973yPzEPu2bXjrJTXIE-pw3ihCuHCwwutDhQC5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Vke8YtGAa64zydjcQs4fR8uqZ86VEu3ZHvU7arUqDEqY-KeigLuNhw>
 <xmx:Vke8YlVjcRQLk3hZ4LmgsDkjsqCu2jGYisx1TFIYDj-0VF8KE5B0pw>
 <xmx:Vke8YoNFyFyQjlLP33V65RjS5ImvSiWK8xjgc44zD3C7Itu5Z86kuw>
 <xmx:Vke8YjfpjJrFG9bSonlM0FC9FMlHI3n56th4CAwpINVh9BskWp6-Cg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 28/71] drm/vc4: dpi: Add action to disable the clock
Date: Wed, 29 Jun 2022 14:34:27 +0200
Message-Id: <20220629123510.1915022-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
index 22e388d17508..9c5629e9e446 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -256,6 +256,13 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
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
@@ -304,6 +311,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, vc4_dpi_disable_clock, dpi);
+	if (ret)
+		return ret;
+
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
@@ -319,7 +330,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 err_destroy_encoder:
 	drm_encoder_cleanup(&dpi->encoder.base);
-	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
 
@@ -329,8 +339,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_encoder_cleanup(&dpi->encoder.base);
-
-	clk_disable_unprepare(dpi->core_clock);
 }
 
 static const struct component_ops vc4_dpi_ops = {
-- 
2.36.1

