Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D774FD2A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BDF10E484;
	Wed, 12 Jul 2023 02:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022D510E484
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689129689; x=1720665689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tznlbG5AbiqSiozof5lGgLyoGSA7MZxGGsabeR0FxYA=;
 b=AoaNRQss1ZttJRVgIYvL9w2cfn+uyeOIh0bV1bSOdwctTGHQRVebLgRq
 /2lfj0oEMPO5H3FLk+3qgiL/QXImr2l0FLXCDYcxiYRE6B2kyFUZc2q0l
 +wMpi4oPokVErZ74JNX094yBmt/beJXZfRL/ZdzQ1oThBhBf+YmUy4G33
 3SeMSp3BC0ps55G8GqMNBUodhC/u9BeJe1Mn30i8k0CWlvo+XezmUEkAw
 kuCtwIQThKn6fczCL9kZ5Cknx8e234kzD5l9YAr+nWymdOz1W5sEujCtW
 Yh2XEvmlfYTbHj5vPAXpej2xiyfNdHr7h2NqrCMTlevGu62rTrjPN5RwI g==;
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="224240971"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2023 19:41:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 19:40:52 -0700
Received: from che-lt-i67131.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 11 Jul 2023 19:40:43 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/9] dt-bindings: mfd: Add bindings for SAM9X75 LCD
 controller
Date: Wed, 12 Jul 2023 08:10:09 +0530
Message-ID: <20230712024017.218921-2-manikandan.m@microchip.com>
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

Add new compatible string for the XLCD controller on sam9x75 variant
of the SAM9X7 SoC family.
The XLCD controller in sam9x75 variant supports interfacing with
LVDS and MIPI-DSI and parallel port RGB.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
index 5f8880cc757e..7de696eefaed 100644
--- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
+++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
@@ -8,6 +8,7 @@ Required properties:
    "atmel,sama5d3-hlcdc"
    "atmel,sama5d4-hlcdc"
    "microchip,sam9x60-hlcdc"
+   "microchip,sam9x75-xlcdc"
  - reg: base address and size of the HLCDC device registers.
  - clock-names: the name of the 3 clocks requested by the HLCDC device.
    Should contain "periph_clk", "sys_clk" and "slow_clk".
-- 
2.25.1

