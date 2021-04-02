Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01513353066
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 22:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293C26E156;
	Fri,  2 Apr 2021 20:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-oln040092003032.outbound.protection.outlook.com [40.92.3.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCC56E156
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 20:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVkw7gtbehQXGAXlE6ale4EoF8Vk6FKjBcqGnZ0241eaWpdga/BT+aC2OsI/Z3UiPTxg8dZTcXnrexBtGIETob1WK0Y+BXG7jpm8c20lLEO/DoHpiM8cEJv2CwZA+Xm5/FDgw1X8EkmnTdxitMXN13VsnnRJD4F6uHyJPnPsaI+kFbE5VshcO2d6185vNs8WbM2Gfb2hTo2RuIfMUeoUiD5zr+Ur7fK6JY1QU/SQtaFF+EXDLWq05XxrKNkWwk4i6evgIfs1Yy3ddFGWiz2NTxsE8XMtEJx3wkUUJFu3uO6onKkNmga7sehyrUBDzgWYpUeuPv8BPt9MhizghHQoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxPKqX2q56Td1F0jieF0fOU/SVIfxFdtsHyNpi9j7R8=;
 b=IowOMVEom17OFUl6ME4weRml6vrMLjOrsxuwJxeWcWKAlQpOLTtLEQ7csLRtg3qKmIAuUsbgmjmZYvPQiY2yDJdlXAXXs9bdiilOKoNCcpJbm6tLiybjxDhS3hYnAu2+qQxdCRrOlVzMIMb0TKb1N5u+eE8i20csuSlLyG9/3BssXwURKTARg2lRW/D4TlFYVDZ86ZYftffceLo8XrBrSlAFfp5QOwqSzjOVYsm9fQBp0qUbB60/x6d7zsP48HNA8h4kDCywZKOx+KuQnolIQiTguCoJrX8UZ7YVi5XyAgp02iCpj0kgsz3MHfZygwgriTpafHbzlEIgA6W50GzoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxPKqX2q56Td1F0jieF0fOU/SVIfxFdtsHyNpi9j7R8=;
 b=PZPf/cm0MsuqOBrGgTd1KU1H6P88ynmhN8VzOHLPg5j0q3jLXFRpt+8qrWmNlVuSy1OH5L0Kgh8hpA94nwFIb7HptgPYwaaL1Nv/sWFDqK7yBMwfHrkwM7CGLDJnTbalWi7eKG7nujyAnuPeaRSz8SBFe10nLSiMGXHK2vZIF6uY/BGKDpm0TRcMIsBji0rWtVdLTKoPjp3Fr6o6GDE8Jy4H2tr5Vz+ehdxN7LzH3SinmGrZB3Q+XA3gHYXi1QP8bi4laif/yzONqHWXkloB7fIqYbHg4vc548kQIiZQfAA5YkEs0y2Q6G9LXq+pSyhRagQ16xgoMQH1dZSPCd4tow==
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (10.152.74.60) by CY1NAM02HT175.eop-nam02.prod.protection.outlook.com
 (10.152.74.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 20:50:20 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e45::40) by CY1NAM02FT020.mail.protection.outlook.com
 (2a01:111:e400:7e45::447) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Fri, 2 Apr 2021 20:50:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B63F7051D85A659BBB34C5A13F3D46CBEF48BF98F5F4B8131085D4BD8A0E7C8C;
 UpperCasedChecksum:81D9C832570E64C20AC8015C4FDFF559317FA634895AAB28256FF018068BCBC9;
 SizeAsReceived:7395; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 20:50:20 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: correct typo in comments for Elida KD35T133
Date: Fri,  2 Apr 2021 15:50:06 -0500
Message-ID: <SN6PR06MB53426AB6E7F572EBF2EE29A5A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [mcObe7290I2eaaPjTzv6MMVuDXENTIEz]
X-ClientProxiedBy: SA9PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:806:6e::32) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210402205006.7678-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA9PR11CA0027.namprd11.prod.outlook.com (2603:10b6:806:6e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29 via Frontend Transport; Fri, 2 Apr 2021 20:50:20 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cf31d381-e6dc-45bf-ac90-08d8f618eddf
X-MS-Exchange-SLBlob-MailProps: zswcL9HXbeVlDLV/zsHYmi+MJQR7rtsPqx/WaZy8ffWz+ufsPoN6+rvVdIvqx75zdKBYF3XjaZiStU/wOPYxkuunuTIF0S53I0nrztSF20+dNh4Tz04iC6Fowp0rG+nkA+el09/HqtiDROLJTz9WTX4V7BQlgtcLETBW0EhQcuO4cXM4fXrQuoD39AHeHEW9yzT/yRU9YRxqyIAx01XUipiXSvyfbQwMgb6jZTpE/GwIaj91PT0EmN1CSq65dr2H33p8SaGw9ytYD3d/81qwU/tbdQ1YaknRcqgcghHAu889G/xV3xOzbUFzbsIUXkXEjN8CBjUj4Gm5//hhn+Cm1ehnU9IarYzh/TiNf5WnzCKx769ltavjgsQ+FtYi6Bd2gzcShD1ty5LSSe48rKUCrC8tL94kKkCaTshEb0fv0Lc/mFfMPdv+FWdvnaa8Zc4x1Nthhb8qMVOKNV8V/YHtY/6TbPfSEQPT2F8eOYtDT2K6H6/eudspKiJ3LgQqP8uCoMRyjBjDvUpSEUpabeHztvbQ9S5YLY+8hXJ5jwe2rKj8CIlaGM9V0AmaNjdR4r/L1LyHo7F2EmQsFtDLShOlYW3xHUbCTk2vR5zr9qHHKAp1X29FCTp963xwwffExtnaUwX0A2eMapAQmkWhksREaqKy9UnUC+gaHZfEViHQyLw95zduKfdx8oiGdUFmDzhiAmZg4nYbu0DasIpz4ejzwvga+PWqC7CN3HTVkY6nW2RwPcFE8Uy+AnEbApfe5h+L
X-MS-TrafficTypeDiagnostic: CY1NAM02HT175:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yk0IsaQP0wP6NVx/1pXCBc2phcJZxASnA+FMz8MEqqMDk+xpj1cjImZxCwddx7HwuH6i8pf5vpFU///qcm4SdcDauuqN+JEIAyggN1egcyuc6Oy2pERwvHF4TuO4YTEP8w10/o0XjwK1C7o0EG6vAG80RaBGd7gOv5xnNEKXeyGpbdkXLwt1y7URHYKxGPhQRRI/NJIHb8Sffeu8KHq0RLSCnHWltVnedbf24mxDIHp6hiYi9n34aSO5UKEK9He5aPD+oFO2wDilWGKpyTJWpinDz8Tas0Q2XX7EWia+9Amz2V9owXdTYx6nYtUj6qHIFjkj62jhyyB/B/HDN28/TNKS4jbZHNfm2KvjFuKeYpl6D2ZjL5K6gd2VPcO9TEjaIr9ekXomq2zmXma7PamBpA==
X-MS-Exchange-AntiSpam-MessageData: cL0X2dOToboPW6eJ46ABYHRDojsFcYD/t4/RPOJCGeB67VUah+EG6uhG5HvNteiygvegpYyFDhZpr5+xIvY8bGI+1FdFj7zkS5bmw80iF/2MPnA8RpxqOdAWibgVeNVcMrPJv2FB42cSDuZ3T5Z7RA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf31d381-e6dc-45bf-ac90-08d8f618eddf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 20:50:20.6596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT175
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the comments to state this is a 3.5" display and not a 5.5" display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index d8534406d1ef..bce84d2e6ada 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Elida kd35t133 5.5" MIPI-DSI panel driver
+ * Elida kd35t133 3.5" MIPI-DSI panel driver
  * Copyright (C) 2020 Theobroma Systems Design und Consulting GmbH
  *
  * based on
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
