Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A656B6A1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0378113875;
	Fri,  8 Jul 2022 09:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B31113874
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2DD6B32009AE;
 Fri,  8 Jul 2022 05:58:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274313; x=1657360713; bh=pJ
 crKCoG7IhNWP+w2dHjwD9Iin4zKcCM6h6ityddm2A=; b=f132AtUh0iWv01jfvF
 olEFvH2+UyGt/Pqb1E9Rao5s5pKv6l1GmKxrxJ/lJO5RbcBYjv/zWSqgzFbPDm+O
 eBL82dwNm38Qg4fmwbVIRniMrzG65qqtnzwmmlaaNwzRFSialW6dzsAHIsZIepic
 bSv2hcW6vw33LtabEVw/3mtMIljdekjPzFSf1ERub+n0Tm1mfznthyjbHYpVQqCj
 /g0+F56kneLGS5CAjDtsQRffewaW+0KR1eO6DV0iWjdgqaX8LPnIqIzohfJgG5Wj
 O5hNvxPcZ5LojW5u2KFTkw5remaaRUaXGRRB4gMiaz67Hc7hmjkF+BIfk1DHNRkG
 QlbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274313; x=1657360713; bh=pJcrKCoG7IhNW
 P+w2dHjwD9Iin4zKcCM6h6ityddm2A=; b=ZmqDHhgD6zhJRA7bor2Q3Zb5Ysp+b
 5wZ3hwhWBVfIqhCAjL0UH/XTDm3DrTvV9pdAoj4MkPSLzVk3j0z+pG73aUuMipDR
 TgSCzOMufnoPDzS7fzpAdJM9M0/LuSQBZUuvYtlbBCWrFcmGh6eQpVHsNQl8ZD4U
 tJQdyI9NDd+3qdlUXwfF1qCyZl4lXcRqDNB+C6mRVd5SfcbkPy/e+MFHWfv5oH5u
 7eEeIVbDOgY5w+3MBtF1BSmcSNnz67YOMdl0j1ITtIwwwp7fCifNpkatrZNUHHIc
 osFxfBQG8pdgVAh5h9hEXBnIx5QGNYWpd/xeaNIFkkNcyQR2Bjwx7ON7w==
X-ME-Sender: <xms:yf_HYnCCHfX8fNEZtY9itUGknHKShda0wK1J-W_UDD3bfz8PLHzD8A>
 <xme:yf_HYthF94dJ_KITYpOVoDMaPgrXbYZMW2VU9D16_-Q-cuzJxSVt8hFlhVYYfjRMR
 VetotNDdsqUKseX0Hs>
X-ME-Received: <xmr:yf_HYiklibeaC4shtBME88E8iD5tFZk9etUva6AS6LEBSzTJLKwy0n04mGA39vOmjnaj1EdtSjew9D-yKwr4rXsk3fL8IIfOpSkjjMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yf_HYpwUd3HZFT_bG5GcdJrLw8cl830lGU5WVpCpPWSpP5GroOek1w>
 <xmx:yf_HYsSyS9BXAUGfv8gSqiYbVlTIOHkinbbW3rWBA70bmDwlambRSg>
 <xmx:yf_HYsbRbfgqed_qGYr_SIrdizxaawwujwxqUwjBvPKsMVxOpdU5_g>
 <xmx:yf_HYhIjQRT8N14x4EKMFzL8ohdTV72PGUtjeXAr3Cn6dwr6jEwtaw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 28/69] drm/vc4: dpi: Add action to disable the clock
Date: Fri,  8 Jul 2022 11:56:26 +0200
Message-Id: <20220708095707.257937-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index f18b05cee8bc..c4ea99f85e5b 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -257,6 +257,13 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
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
@@ -305,6 +312,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, vc4_dpi_disable_clock, dpi);
+	if (ret)
+		return ret;
+
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
@@ -320,7 +331,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 err_destroy_encoder:
 	drm_encoder_cleanup(&dpi->encoder.base);
-	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
 
@@ -330,8 +340,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_encoder_cleanup(&dpi->encoder.base);
-
-	clk_disable_unprepare(dpi->core_clock);
 }
 
 static const struct component_ops vc4_dpi_ops = {
-- 
2.36.1

