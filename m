Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F366A66D7A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1B610E204;
	Tue, 18 Mar 2025 08:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YP5STpDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B1510E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:10:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 6A415582583
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 07:58:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05BC744533;
 Tue, 18 Mar 2025 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742284732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7R0mqNUzqAg2QCm5bBtYnkjd6OV6reCUBCbRyU3eWic=;
 b=YP5STpDoMZREkp9gcCPZZCu9ZEsd5x8CKrViKkcuskkD+We7frWjtRTDto1VN01D0akUuw
 q6/9HtBKeZB0/cRWMVmLNvquu5QEmjEqDIdEgypU600OUb0Qmp9S1eD7Qy6rQY/C2xcAkj
 PoygrGyDrXRQJcNhKLP4lQtB0R/bJBC/jgVeuS5qRd0UI3mQrklaoVYhKolUTh+bbM/SL5
 cbnSRP7PXlIaMgGSEX213PgZTWM2X1aVcJkqOHeXHXuJguFSHDu6auqVMQV4zf08mswSQ5
 F4okykfuF8/VJRjMa//0raygycgPlfjYk3sRFek9hI3XWVJwOahrmFy2bfgICA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Mar 2025 08:58:29 +0100
Subject: [PATCH 2/2] drm/panel: simple: Add NLT NL13676BC25-03F panel entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-b4-add-nlt-nl13676bc25-03f-v1-2-67e0f8cf2e6f@bootlin.com>
References: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
In-Reply-To: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=O13+H7IKC69Mnli79GP5hJn7xftMhmmXRfJoVpOIonA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2Se5u0z7p3sTgUJn+YNpLaU7q09mv9Go6GNUK
 39Grqcj0NWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9knuQAKCRDRgEFAKaOo
 NibeD/9gZx27UCPrSJi9n+UogplclRbozKvhNSWtpzbSLijNdtrlr3Z+J9rm/9Yy45nh2F8MU2F
 rTK5RrcigGXYDCad9uBHc9hxAXubSIrCoGWojIivldPwT3Tvm2R1SiR6MT4eq7hxhjr/VM8LOb3
 WhcoGB4SLSlBDFdpmcVsxUN/AsbuNk4uA8RocgjFtzWWL3z1QDqWgu4D3iZtKWUOAUgVNcFXHea
 xyT9OZKydi+j2PjO4QufDNrEX6+9c1kQkSrnrlJhDai3qGo+tqYin/dPHZ9ZfkzU9ktOQsQg2JS
 AQXassArm0JFdHEZhxVJCKx/0UWCW+xMfowPre9qxkthRlyigpJkIBuLHLS4QkFW+0miktXMdun
 NSrJivBmR5NaksF+C5mAmf9/n1+gFefVKvkb1DQ3Aunwnd2NjhS34zgvMuGZgUV5gku6njiQy8Z
 UcGVUe629eFaD0T1RcBcTRaHLpebyYvYsbeO6TUwRW0YuIf0fCJtVH5v71xkERcNsdyUnfKwGxZ
 /Flm/8tNxyr7XDqaf+NwSwX8S6PrSEybMrof1Yl5NkdrxGTO0tiXkSQTn9Xmvz1VPzf6xuL9nqL
 yo9OUGoKWiG7SikIsGdkeM8wg7pcpfrCkvvDLyFp1Toh23WMUP+IS3/Vx3d3q/DKpsMF07CFMRP
 3o5F7G3VoCPrkIw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedukeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehveevhfefvdekveejvddtgeekvefghefhfeehvedtvdevfeekteegteefveelvdenucffohhmrghinhepfedqgeektddvjedvvghfqdgrthiglhdruggrthgrnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehquhhitggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidri
 hhnthgvlhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the NLT NL13676BC25-03F 15.6" LCD-TFT LVDS panel.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b2f128fd309..96e8569d97ca 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3469,6 +3469,30 @@ static const struct panel_desc newhaven_nhd_43_480272ef_atxl = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode nlt_nl13676bc25_03f_mode = {
+	.clock = 75400,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 14,
+	.hsync_end = 1366 + 14 + 56,
+	.htotal = 1366 + 14 + 56 + 64,
+	.vdisplay = 768,
+	.vsync_start = 768 + 1,
+	.vsync_end = 768 + 1 + 3,
+	.vtotal = 768 + 1 + 3 + 22,
+};
+
+static const struct panel_desc nlt_nl13676bc25_03f = {
+	.modes = &nlt_nl13676bc25_03f_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 363,
+		.height = 215,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing nlt_nl192108ac18_02d_timing = {
 	.pixelclock = { 130000000, 148350000, 163000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -5056,6 +5080,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "newhaven,nhd-4.3-480272ef-atxl",
 		.data = &newhaven_nhd_43_480272ef_atxl,
+	}, {
+		.compatible = "nlt,nl13676bc25-03f",
+		.data = &nlt_nl13676bc25_03f,
 	}, {
 		.compatible = "nlt,nl192108ac18-02d",
 		.data = &nlt_nl192108ac18_02d,

-- 
2.47.0

