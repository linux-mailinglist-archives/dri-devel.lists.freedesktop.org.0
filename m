Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7879CEEBD3
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 15:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5910E29C;
	Fri,  2 Jan 2026 14:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MyQ9DLzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDEA10E18F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 14:17:18 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-bc4b952cc9dso10514252a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767363438; x=1767968238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HF9+lG717CVNmqMq8exrBzr6HEfuKw3j8dCzXnfDeFA=;
 b=MyQ9DLzE1Z3Aixbqj3R7FO6DfQ3yE+XlNgmkfk0smPymH1cEQ55uW1db4Nu5eOsEsD
 nRywTtndfIo/lRFCodSnBNLO8k0EdOUirDe6zCv3g59iThvBBRDEOARvNAtO5F/YVBj9
 K63w3aDDOO5gMcA1/2Xs6x/cFDRs93fk/vJMKpmCrVlFw+CZ+a+vy1jK9lIVFEC1d9KM
 NzD/kSnNoE5EnH2VJN4VQFEHoyglmGF3My8SXY6uKMUQ5qZDEf+oJqAcbbWf4/IF8/fp
 7UXutwh7ZZRG+Tg+U09uE8V843Lbum6nfm3zgQ+W8kZqm1elrkTpgBaxKyw+GJM+MChX
 a+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767363438; x=1767968238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HF9+lG717CVNmqMq8exrBzr6HEfuKw3j8dCzXnfDeFA=;
 b=maT9kmXCgpNoQ1ovYWViIEbZwFqP6rN6wrjpTf6W1X7IlYxM+vLHyEfnh26ZUmdfoX
 nioCcYoeQOkR0xHotZr4d3PR2SvPy8Y3Eo2aDpmJxNI4TCP1nNAKTD3YW2GgiE5fKYCC
 1x8ytzPsEo+nEoCZ9FvBgvH6cOE1nB4Tu/4mlie29BGO1x3NcrOu1RW3TmGgs7za1iEU
 l/sPiWVhKgwsiiC3POjMZtE5HsPjAsCE6rNIhXrlzRKRQcq6jRrUMZZUcodpzovRz5rs
 izpzLnrgfwyDWyn/O16Y5CasI6BTUhhMMEs7PD7H8cIHghqSRz4hCijhjVm8RVxxeKwl
 zOSQ==
X-Gm-Message-State: AOJu0Yz2zbzqU/fENQJjJ4ujUtzLvqf2yPnEKDpXCp8QAVai55qsnTG4
 3QvvIqG/p91hPahB//Z3IrufEdB01+K+fB5FQ+W4A9zTWhBkMp4Huuse
X-Gm-Gg: AY/fxX72itSghQOOzTyq9WqOWGkRSBDt5PnhlCvV81N+JGEW9DxQ6oKh4YpXHy5G4YO
 TTOYi9BOKSoZWJB5llBeEoowlAXdggulcq4CfpwPpAuBR8s9GwtN0SweHYAVZ9ydASXuI9kdvbR
 OeA6thP5xiEB4hxylp+RzDATtdb/5NBt4E32V/dANaHKJ5qsxJO3AIc6FTNmuiE1fspTrP4Ooqe
 JN1UPt5WkV9CbH95hJHrGYdvG1thtgesu3F85GvAf34oeVx0Jmo64yxc1JGrOE2618l4Kd7OFuM
 oATT8eSMdQFWnYbes4Wz8V2evpO/HV/qX86BiWtC23KTNyZv5dqaiosArOE/gnofihaqyEIvqbn
 b/3PRaPCBc7ZIxodqllolEWAOVKg9m9N+Lm2pemMEGeqzhCOMo8b6EMshxYDMuGZ7/wT+xgrH/r
 WX+9ZDyaw7kJ1pfzhS+iCo1GfWvOOsWYY3hQ==
X-Google-Smtp-Source: AGHT+IGoPrJ3ysAlwx4pGQiNHkfSl5CijdG6Qv9Gm+B4ir5LeQKGngbBUkiw4zJqznzJS10tmjiMEA==
X-Received: by 2002:a05:7300:a217:b0:2a4:3594:d552 with SMTP id
 5a478bee46e88-2b05ec96026mr29703798eec.31.1767363437975; 
 Fri, 02 Jan 2026 06:17:17 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:388a:7a66:ea1:ff85])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42ea3sm840356eec.29.2026.01.02.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 06:17:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 2/2] drm/panel: simple: Add Innolux G150XGE-L05 panel entry
Date: Fri,  2 Jan 2026 11:17:06 -0300
Message-Id: <20260102141706.36842-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102141706.36842-1-festevam@gmail.com>
References: <20260102141706.36842-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@nabladev.com>

Add support for the Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- None.

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3acc9f3dac16..c606e5932ca7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2836,6 +2836,32 @@ static const struct panel_desc innolux_g121xce_l01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing innolux_g150xge_l05_timing = {
+	.pixelclock   = { 53350000, 65000000, 80000000 },
+	.hactive      = { 1024, 1024, 1024 },
+	.hfront_porch = { 58, 160, 288 },
+	.hback_porch  = { 58, 160, 288 },
+	.hsync_len    = { 1, 1, 1 },
+	.vactive      = { 768, 768, 768 },
+	.vfront_porch = { 6, 19, 216 },
+	.vback_porch  = { 6, 19, 216 },
+	.vsync_len    = { 1, 1, 1 },
+	.flags        = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc innolux_g150xge_l05 = {
+	.timings = &innolux_g150xge_l05_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width  = 304,
+		.height = 228,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing innolux_g156hce_l01_timings = {
 	.pixelclock = { 120000000, 141860000, 150000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -5314,6 +5340,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,g121xce-l01",
 		.data = &innolux_g121xce_l01,
+	}, {
+		.compatible = "innolux,g150xge-l05",
+		.data = &innolux_g150xge_l05,
 	}, {
 		.compatible = "innolux,g156hce-l01",
 		.data = &innolux_g156hce_l01,
-- 
2.34.1

