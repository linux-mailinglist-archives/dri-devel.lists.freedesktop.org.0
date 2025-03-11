Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C60A5CB6E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 17:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0A10E18D;
	Tue, 11 Mar 2025 16:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pNNkRzGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9156910E229
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:57:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 53964584A0E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:40:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E695820457;
 Tue, 11 Mar 2025 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741711241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsxnqo6HjsJm0M7jyTeDr5TGZHZn8pllCm1cLgKcq08=;
 b=pNNkRzGoSHT7uu6aKBVfDDogYy52WcDlzL+z6J1vUw4AkLPL32vOqei6UMOB/XPyMRs0ZT
 rI3nTQfQ9dElg8BQIwbZk0qjeilAPeS92zWGoKgkwiobaipHO3k60NVdpUaUdHzaCi3WIL
 eJ6mHd73pdOdhlJtzt++q95mN1eJZwnHcRAYlpZMxVA4W4WAmUQYh8o8Gf7xY3U7Q+cO/m
 Gt2FlWW44EpuqOHwdEP3esyGkelyZ+MvAbAdTUL68AG76MLcWViNjSxXUae7DlBVwr8IYx
 CmVUazmLIeY0HLVQHeEYInEBUIZ4Ys9H+8HrtiCFIh4LOScJZBSez9A83UbBgw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Mar 2025 17:40:06 +0100
Subject: [PATCH 2/2] drm/panel: simple: Add POWERTIP PH128800T004-ZZA01
 panel entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-add-powertip-ph128800t004-v1-2-7f95e6984cea@bootlin.com>
References: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
In-Reply-To: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DK7Z2yAARfFjabstQ/O2Gk5kpA6ZcrhH1LG7iGgqdkg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0Gd8T8IJ2YfGapBfDSz8ZnX8ZKPn8hqGBfQdn
 sM97aEKijaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9BnfAAKCRDRgEFAKaOo
 NjcHD/9Od77BWYqTNgey25Bzviy90iic4gmbyQDoBgfJRzh//POE7WRdv7jbjHEH+oKxfL6Obu2
 lMeA7Aq2Q9cQ3icQaphXHFJCQnHTwD2tmrsJsdsSDGouNk7R5A5L2UUCb8zFdxHfRy0EmMumZEh
 mTqa1cX/9byd8UumC/3Z39Ia2sP3gRbC5dKOPi73i13gh4bitGSbgbjKlt8EJOt92JMPo2uBpiX
 WwgFy7a1mXB9rLIKYFf0v9bboHx5a6q6ozvrf1D0Xhf5oZaOQ8wFhgvc8jjJYxQOwBq0Ii214II
 UYv+sNS8DsaRpsfZ2MQt3jqLYnk5VDVJhdYzAE51lBkZQc8GLS716+4Nu/wQ1Mxp/K8oFJWxqz0
 4pZpngtwaBIlqUhQWc4Mnk6HOqopwU8OJ6DZfUWInn2zJ5oPlGeuHV7p/pg6FGGiO3bOrvL34r4
 I6X2S5SGUc33I+mcJoh0rsxZL7UeOMmh4W22Y7NCtXcfMvc21PORoXRBJRhaGfdALkg20ZCQJym
 oyr/PQX6P5o4JQgiPzpgXIqtq+6DTy3J3jl7bPRMlrNI8kJMNzCeb6rHEbvwQ93lSFtPEYaOODn
 19sS1vO1Et06hzhqoEm0zGfaX9fWPgYNMy4D0iSPlYbA7UnxsG+tt5srO46oqxABakXYF+VbAZb
 sTyCnAHCTaTdpIQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

Add support for the POWERTIP PH128800T004-ZZA01 10.1" (1280x800)
LCD-TFT panel. Its panel description is very much like the POWERTIP
PH128800T006-ZHC01 configured below this one, only its timings are
different.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b2f128fd3094bfb6731fc348b91cc101f495a86..80dda575b48a99feb81b9a75dc69ef18075ffdcd 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3738,6 +3738,32 @@ static const struct panel_desc pda_91_00156_a0  = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode powertip_ph128800t004_zza01_mode = {
+	.clock = 71150,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 48,
+	.hsync_end = 1280 + 48 + 32,
+	.htotal = 1280 + 48 + 32 + 80,
+	.vdisplay = 800,
+	.vsync_start = 800 + 9,
+	.vsync_end = 800 + 9 + 8,
+	.vtotal = 800 + 9 + 8 + 6,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc powertip_ph128800t004_zza01 = {
+	.modes = &powertip_ph128800t004_zza01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 216,
+		.height = 135,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode powertip_ph128800t006_zhc01_mode = {
 	.clock = 66500,
 	.hdisplay = 1280,
@@ -5089,6 +5115,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "pda,91-00156-a0",
 		.data = &pda_91_00156_a0,
+	}, {
+		.compatible = "powertip,ph128800t004-zza01",
+		.data = &powertip_ph128800t004_zza01,
 	}, {
 		.compatible = "powertip,ph128800t006-zhc01",
 		.data = &powertip_ph128800t006_zhc01,

-- 
2.47.0

