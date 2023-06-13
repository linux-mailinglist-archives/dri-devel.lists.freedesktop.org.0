Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A721B72DA83
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447D10E330;
	Tue, 13 Jun 2023 07:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F12310E330
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686640376; x=1718176376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z7sh0i6Gl2/LRPzmrS845oLG7MhlbMwUzMTImsVh/hI=;
 b=BALLol2w1RsbYsaE35JGlr9c0pMSWFy0/MupKZkxP9G5eO89apUEP/qq
 wDIIQLCjToHgalAd7ExH6nPa8YIRZXUEIvZ2rVymh64joxzj6EyA37Yja
 N+i5GWb3hGPDSIQxGM9sEJAmdePXsUnWpH5/G60KGJ2ScwUxJCmzHQ/sJ
 wNjImWYuEy0FNZsoqBAv4DCqm35odAUL+7EHGPFc6vo3qWRoDI6Qkpj98
 AHP2dFLIM6CbOSAjcXAOWE4sCEziK0WU2cWAcioYci+jbQxxlsocj8pRB
 5nWNjTsU5h1gYpBl9y4hKra2JGFjJtm7qMKN8/ZOdPk4jfnlgsZvuKwz3 g==;
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; d="scan'208";a="229806838"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 00:05:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 00:05:46 -0700
Received: from che-lt-i67131.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 13 Jun 2023 00:05:38 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/9] drm: atmel-hlcdc: add compatible string check for XLCDC
 and HLCDC
Date: Tue, 13 Jun 2023 12:34:22 +0530
Message-ID: <20230613070426.467389-6-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613070426.467389-1-manikandan.m@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com,
 Manikandan <manikandan.m@microchip.com>, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add compatible string check to differentiate XLCDC and HLCDC code
within the atmel-hlcdc driver files.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 7 +++++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index d7ad828e9e8c..fbbd2592efc7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -761,6 +761,13 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	if (!dc)
 		return -ENOMEM;
 
+	/* SAM9X7 supports XLCDC */
+	if (!strcmp(match->compatible, "microchip,sam9x7-xlcdc"))
+		dc->is_xlcdc = true;
+	else
+		/* Other SoC's that supports HLCDC IP */
+		dc->is_xlcdc = false;
+
 	dc->desc = match->data;
 	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
 	dev->dev_private = dc;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index aed1742b3665..804e4d476f2b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -451,6 +451,7 @@ struct atmel_hlcdc_dc {
 		u32 imr;
 		struct drm_atomic_state *state;
 	} suspend;
+	bool is_xlcdc;
 };
 
 extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_formats;
-- 
2.25.1

