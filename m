Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73F124702
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921F6E2E4;
	Wed, 18 Dec 2019 12:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED5E6E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:36:01 +0000 (UTC)
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Yh7OB4GjYSP0h78YQ+nAuZPs38phPaHQu/QDYlv6W9aeuBv8n6/ueh6m8CtLg4dxHaFRy9Tpuv
 4ncYmHz6s6OLIxi2pxtrhxJqWZ0WEOFwP71Z0kX9lPShUSuU65JnU20wbHr/uMUJL03AOq98Zo
 WJgjv+1S4N4Bv6UnpAjsOPavNrtIhjKVYTj3guT0+VrQBO061qXL+uo3ySPthD9nWvXcivBSQ9
 dzLM54KkVQA/phSWX9qIh4sftL84X1sW5p2p21W/ev0hK2Cxaay7fEED3Sbei3/6q0xRdf3SxS
 oy4=
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="59399403"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Dec 2019 05:28:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Dec 2019 05:28:53 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 18 Dec 2019 05:28:50 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <boris.brezillon@bootlin.com>, <airlied@linux.ie>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <lee.jones@linaro.org>, <sam@ravnborg.org>
Subject: [PATCH v3 6/6] Revert "drm: atmel-hlcdc: enable sys_clk during
 initalization."
Date: Wed, 18 Dec 2019 14:28:29 +0200
Message-ID: <1576672109-22707-7-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:38:50 +0000
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
Cc: Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, peda@axentia.se,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit d2c755e66617620b729041c625a6396c81d1231c
("drm: atmel-hlcdc: enable sys_clk during initalization."). With
commit "drm: atmel-hlcdc: enable clock before configuring timing engine"
there is no need for this patch. Code is also simpler.

Cc: Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---

Hi Sam,

I still kept this as a patch as I didn't got any answer from you at my
last email up to this moment.

If you think it is better to squash this one with patch 2/6 in this seris
let me know.

Thank you,
Claudiu Beznea

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 8dc917a1270b..112aa5066cee 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -721,18 +721,10 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
 	dev->dev_private = dc;
 
-	if (dc->desc->fixed_clksrc) {
-		ret = clk_prepare_enable(dc->hlcdc->sys_clk);
-		if (ret) {
-			dev_err(dev->dev, "failed to enable sys_clk\n");
-			goto err_destroy_wq;
-		}
-	}
-
 	ret = clk_prepare_enable(dc->hlcdc->periph_clk);
 	if (ret) {
 		dev_err(dev->dev, "failed to enable periph_clk\n");
-		goto err_sys_clk_disable;
+		goto err_destroy_wq;
 	}
 
 	pm_runtime_enable(dev->dev);
@@ -768,9 +760,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 err_periph_clk_disable:
 	pm_runtime_disable(dev->dev);
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
-err_sys_clk_disable:
-	if (dc->desc->fixed_clksrc)
-		clk_disable_unprepare(dc->hlcdc->sys_clk);
 
 err_destroy_wq:
 	destroy_workqueue(dc->wq);
@@ -795,8 +784,6 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 
 	pm_runtime_disable(dev->dev);
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
-	if (dc->desc->fixed_clksrc)
-		clk_disable_unprepare(dc->hlcdc->sys_clk);
 	destroy_workqueue(dc->wq);
 }
 
@@ -910,8 +897,6 @@ static int atmel_hlcdc_dc_drm_suspend(struct device *dev)
 	regmap_read(regmap, ATMEL_HLCDC_IMR, &dc->suspend.imr);
 	regmap_write(regmap, ATMEL_HLCDC_IDR, dc->suspend.imr);
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
-	if (dc->desc->fixed_clksrc)
-		clk_disable_unprepare(dc->hlcdc->sys_clk);
 
 	return 0;
 }
@@ -921,8 +906,6 @@ static int atmel_hlcdc_dc_drm_resume(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct atmel_hlcdc_dc *dc = drm_dev->dev_private;
 
-	if (dc->desc->fixed_clksrc)
-		clk_prepare_enable(dc->hlcdc->sys_clk);
 	clk_prepare_enable(dc->hlcdc->periph_clk);
 	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, dc->suspend.imr);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
