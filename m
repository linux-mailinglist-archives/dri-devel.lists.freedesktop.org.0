Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AEF74FD25
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFFA10E480;
	Wed, 12 Jul 2023 02:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95C110E480
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689129671; x=1720665671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WCG1Ovk97pVQtMtJX+NlFhx11oFlfPXeQ8l9DlmV5mE=;
 b=LFc9Pc545JuSTmcKlvkaxAa9lkdKrtItOFwwv2tfohLepVbg0e6td9rP
 7vVKoJtKIrNn/aMBivxUR6qrdT0XEu7dq24v6UO334X3bGLZXOwONACPW
 EUe5hIKRqJFFQl4fqlDwkyml55sozQQA9x/OMUGW+aLQbEtO7nSJb5CxE
 jitTRHRe8oQ/ufkfCCcKOw341Jznq/BxNJQ3Yt3wyRPxlhuaWq8o5cHE2
 INax3T3R/PO8wilVNyhjhxXNIepZMorWMcY4bYgeLtENyP5RyVHBURA23
 ltQXNRhjGpK5jN4sy0TCjZGalboNP7Yg5+eQVy8zuF7kXHY/MzLvNdAAQ A==;
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="234987691"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2023 19:41:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 19:41:00 -0700
Received: from che-lt-i67131.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 11 Jul 2023 19:40:52 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/9] mfd: atmel-hlcdc: Add compatible for sam9x75 XLCD
 controller
Date: Wed, 12 Jul 2023 08:10:10 +0530
Message-ID: <20230712024017.218921-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712024017.218921-1-manikandan.m@microchip.com>
References: <20230712024017.218921-1-manikandan.m@microchip.com>
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
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible for sam9x75 XLCD controller.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mfd/atmel-hlcdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 3c2414ba4b01..1daa7410468a 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -141,6 +141,7 @@ static const struct of_device_id atmel_hlcdc_match[] = {
 	{ .compatible = "atmel,sama5d3-hlcdc" },
 	{ .compatible = "atmel,sama5d4-hlcdc" },
 	{ .compatible = "microchip,sam9x60-hlcdc" },
+	{ .compatible = "microchip,sam9x75-xlcdc" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, atmel_hlcdc_match);
-- 
2.25.1

