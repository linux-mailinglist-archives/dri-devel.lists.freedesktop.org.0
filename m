Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89E28A0DF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 18:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60A56E02E;
	Sat, 10 Oct 2020 16:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83486E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 16:08:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09AG8qOJ114216;
 Sat, 10 Oct 2020 11:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602346132;
 bh=uPK6blWxb5W3HCW4jztnG/Z1Cs7LlxWlHhow8qdGX1E=;
 h=From:To:CC:Subject:Date;
 b=IJDjDrqOgY7AYdez9pAGM56qrERaHLHaT9Wna71aLAqqTDM+bBFoNYm3r3ukyWZge
 ky4byd1pdonPSmtLEvXxiEOIALwUz/FWRNAJ71iHIGk0Y+RkRwXoQJIS1SyjjPCKBE
 YmQCTWxTGUmPP8aUahLRsekBlqBz/TG7PLfaTQz0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09AG8qjP106199
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 10 Oct 2020 11:08:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 10
 Oct 2020 11:08:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 10 Oct 2020 11:08:52 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09AG8oA0088860;
 Sat, 10 Oct 2020 11:08:51 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] ARM: davinci_all_defconfig: Add CONFIG_DRM_DISPLAY_CONNECTOR=m
Date: Sat, 10 Oct 2020 19:08:50 +0300
Message-ID: <b88fa14d313267ba2e70619c0452120f941d1438.1602345599.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: bgolaszewski@baylibre.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current dumb-vga-dac driver requires CONFIG_DRM_DISPLAY_CONNECTOR
for it to work.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
An alternative would be selecting CONFIG_DRM_DISPLAY_CONNECTOR from all
bridges requiring DRM connector.

 arch/arm/configs/davinci_all_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index e849367c0566..28471757c129 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -160,6 +160,7 @@ CONFIG_DRM=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TINYDRM=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_TINYDRM_ST7586=m
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
