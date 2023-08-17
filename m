Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5A77F2E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 11:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E5110E1C6;
	Thu, 17 Aug 2023 09:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E867410E1C6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692263613; x=1723799613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WCG1Ovk97pVQtMtJX+NlFhx11oFlfPXeQ8l9DlmV5mE=;
 b=Q/D/p4iCBW3CbmY8jP7Q56LIKnlW2Y0yMBqz1sKiuTbd498Vyjde19VY
 voq0YW+QaY6rLrHkbmy00s8cHIsJIKV/yb0XfeD+tIrCpc0OER7Gv3T0S
 TUp1oloAdiI46ZDpYXEFJn52f35gvyd1XvkxxLmN3KaPv1gy8ZZV+QBOO
 qP4MDYLidLDpF5XqZcUL9aaO0w6Gro9a46Sa6kffSLp0MGUpyh/JJBtBC
 saV7wjOCuX6olZM/Xu7UuQnFkK2YUNk9XddvwBD6/pZQukOWBNo5yXqSY
 lKReJatPUeaL5NQNJhBy6n18wDa9Q1o6UvJxLTjY1nhx0JQVxosgsdmXS Q==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="166879526"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Aug 2023 02:13:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 17 Aug 2023 02:13:28 -0700
Received: from che-lt-i67131.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Thu, 17 Aug 2023 02:13:21 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/8] mfd: atmel-hlcdc: Add compatible for sam9x75 XLCD
 controller
Date: Thu, 17 Aug 2023 14:42:43 +0530
Message-ID: <20230817091250.225512-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230817091250.225512-1-manikandan.m@microchip.com>
References: <20230817091250.225512-1-manikandan.m@microchip.com>
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

