Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581C11F249
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02316E3BB;
	Sat, 14 Dec 2019 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F8A6E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:05:42 +0000 (UTC)
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Uon3aYhT8Equ95C9kn9F2LJ8aztLHchWlQPGrsjDXVEBROp8u1vy0tJjchkZKGKo4zBZ1xakqU
 wOyAWWyLuOUdMLoRKqR5LxJa4lp/lBIcLGULmVr0rCkLxlha364uWEOa7ayxduWD7Br6Ikv7+b
 l5qeGy39Ffw/ie8SWgals2/eALkEZqw/E0D9sFDFHUcNNK3f7uus/2TKUoNNpQSmMNG7ecCk9e
 3WTBzXgvn4/eDhEXZ5b6RuqpX2gFg9idjIjoFi3w+RAYxtkICSOlJ4MwhSmXvn3RZGkazAe7bv
 YPs=
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="59718095"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2019 08:05:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Dec 2019 08:05:20 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 13 Dec 2019 08:05:16 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <lee.jones@linaro.org>
Subject: [PATCH v2 3/6] mfd: atmel-hlcdc: add struct device member to struct
 atmel_hlcdc_regmap
Date: Fri, 13 Dec 2019 17:04:53 +0200
Message-ID: <1576249496-4849-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
References: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add struct device member to struct atmel_hlcdc_regmap to be
able to use dev_*() specific logging functions.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/mfd/atmel-hlcdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 64013c57a920..92bfcaa62ace 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -19,6 +19,7 @@
 
 struct atmel_hlcdc_regmap {
 	void __iomem *regs;
+	struct device *dev;
 };
 
 static const struct mfd_cell atmel_hlcdc_cells[] = {
@@ -90,6 +91,8 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
 	if (IS_ERR(hregmap->regs))
 		return PTR_ERR(hregmap->regs);
 
+	hregmap->dev = &pdev->dev;
+
 	hlcdc->irq = platform_get_irq(pdev, 0);
 	if (hlcdc->irq < 0)
 		return hlcdc->irq;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
