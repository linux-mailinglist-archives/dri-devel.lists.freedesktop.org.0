Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EA1B37EF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D445F6E312;
	Wed, 22 Apr 2020 06:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B5A6E32B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 06:51:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pRcQ125681;
 Wed, 22 Apr 2020 01:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587538287;
 bh=Zs6KQC1iefAXl+flTN8k21B4sb8ZHsnZ/WFHZcR7wUc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IxBNf8QBapDf+Z8CMPujF5ZZOU7y+K4A6uWXaPWq6FNAoT055+eeJiP/rHVjXTpiU
 jXGQisZB1g+i8c94NSmvJgYFLu9y3sIavKvxJI/uFJjj+/a/l8kMehx77VT8uJdJHV
 J00DWgudYGu4aWfa4spd/d5Eqst+Fvavk9KTbgEY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03M6pQSY025177
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Apr 2020 01:51:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Apr 2020 01:51:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 01:51:26 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pKUY100224;
 Wed, 22 Apr 2020 01:51:24 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCHv3 2/4] backlight: led_bl: drop useless NULL initialization
Date: Wed, 22 Apr 2020 09:51:12 +0300
Message-ID: <20200422065114.22164-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422065114.22164-1-tomi.valkeinen@ti.com>
References: <20200422065114.22164-1-tomi.valkeinen@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to set 'levels' to NULL.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/led_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index d4e1ce684366..c46ecdfe8b0a 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -140,7 +140,7 @@ static int led_bl_parse_levels(struct device *dev,
 	if (num_levels > 1) {
 		int i;
 		unsigned int db;
-		u32 *levels = NULL;
+		u32 *levels;
 
 		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
 				      GFP_KERNEL);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
