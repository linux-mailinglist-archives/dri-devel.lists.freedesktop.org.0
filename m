Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA4812A74E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3F89E86;
	Wed, 25 Dec 2019 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153736E358
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1zgGB0KfFqajqv2PzSevnA3ctHjx8hNIITFYHHNAs=;
 b=IxPKYBuTlpAcK45NKq1I1EcXAPe5hkntZn070+6LGZeFIQyhEz/Ady1tEHg+FENfvDtn0TheXAS9ziSUInOhmvXTvjmRG6KHB3Xx+wXGK77BGfRMihQ97usqgPA4HhJpnVZcPjWyeMWtOCBpKFqbDYpz9oO6z1WYsU3SgcWId/Q=
Received: from VI1PR08CA0160.eurprd08.prod.outlook.com (2603:10a6:800:d1::14)
 by DB7PR08MB3324.eurprd08.prod.outlook.com (2603:10a6:5:22::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.13; Tue, 24 Dec
 2019 17:34:57 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0160.outlook.office365.com
 (2603:10a6:800:d1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:56 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:56 +0000
Received: ("Tessian outbound 1da651c29646:v40");
 Tue, 24 Dec 2019 17:34:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a48b47ca8cbd3d1
X-CR-MTA-TID: 64aa7808
Received: from c54502d9e00b.7
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 547571E1-1620-4766-B034-6F6E66A31FFC.1; 
 Tue, 24 Dec 2019 17:34:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c54502d9e00b.7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frY2BUWOCpwfq6WH0kNWOvMkAXgdnD50peGpvwHStx8KFW+gZPoWDf2EUwhQe6yTJVynNIeWmIUzeAM3z2BHYvSnu6NWTZcAAaFx4xe1IbhwyBYoT73re/DYlAmzWJO8MOoZUHRQ1WekC8ZjUUx+NEOc/TNCM1sBrDugm3b9klPasFEV7SAv/xly5xMf9CGS66E5Qfi76itgKhVZWYjq2lRn/WfN3Gfi0YHd/YE5Ioq4pYqpnwMZmnFGMA+qYqOiMyHyE51AnvnFQN9MlF2iCSfgM9f3TZO+FaaoFyuyH70D27LiKX8utOySTjLUbsC7ijWVvMtVqU5603LTvs9c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1zgGB0KfFqajqv2PzSevnA3ctHjx8hNIITFYHHNAs=;
 b=JpmOBjG+ztg2d65AzBK2UkGv70YQa4LOLXkEwklCqlSinfJWK9Wvyg7uJrOr/m3htytHAQFKJ3DmiYgmaeIVUYPjhJY7mSU4DU2I48YeCe4TGjKG6YTzVb+ex6kx4xBI5/JcAjiiXby9uSRMbc2xojbmPeQOF//ZQHRcw0tT0tEqE2OxA/V69S5vO6BdmdfSvWEgBkHY8aKhPXBSHKv5n0ZmAay+v+Sk30zRQX5oo6FqXxRk4ugKP4HrkoPsLlxXsilGD/K2m0tSMiAEB3q+zO3034wEmdIn0yQ0k15DTfNeXpbptFvx4DKOjG90fOA/oHwsG8VPZkXilVFbTv70rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1zgGB0KfFqajqv2PzSevnA3ctHjx8hNIITFYHHNAs=;
 b=IxPKYBuTlpAcK45NKq1I1EcXAPe5hkntZn070+6LGZeFIQyhEz/Ady1tEHg+FENfvDtn0TheXAS9ziSUInOhmvXTvjmRG6KHB3Xx+wXGK77BGfRMihQ97usqgPA4HhJpnVZcPjWyeMWtOCBpKFqbDYpz9oO6z1WYsU3SgcWId/Q=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:44 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:44 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 26/35] drm/bridge: thc63: Use drm_bridge_init()
Thread-Topic: [PATCH v3 26/35] drm/bridge: thc63: Use drm_bridge_init()
Thread-Index: AQHVuoButaaZf4N+00m7TBopJFb9qQ==
Date: Tue, 24 Dec 2019 17:34:44 +0000
Message-ID: <20191224173408.25624-27-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45064ac7-87ad-4fbf-dca9-08d788979807
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DB7PR08MB3324:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB33248B1505AB0D4FC2D9F2FD8F290@DB7PR08MB3324.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(4744005)(5660300002)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WMsyq7C3kfZWGUUNn7sKk+UO1rof4nJh3GmA/3BnvvGh0U5r8gc5a8Z656ifKaHG77//HXIILcfQSO5lWx2caCYxnxKjwKjcT6fLn90m1lX8JxKPIXjIn7ICikI/aEofPhlf7+CG1FFYpamhTT4Jziu9eJjVFdalIDZh8E7ijndz0ZE7WUKsyxLZ51IbIxo5LRh4ZqDXtxRnM5vSF//OsiOzm+Ko38HsHgOHx2lxW1HR02LKYoRCgePOtHITS9aH/WwFnuRdVzbS/a5++rG2GFlqHtKq/WU1Hu0b+O/+fC38/LrjIYgujU/swanNXW6JhRUIFyeDwLKqtc7g+n5wXBWvTNGphwwB591idjW3y8OscY7lag/JXrY3/UhyfSu+hjHueLKjTXVF7ssL4+S3ZBgpLTGN2s3Pl4gXjF4rptN2OiHN1mi6DXDVWZLfhy07
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(189003)(199004)(70586007)(2616005)(107886003)(316002)(6512007)(36906005)(54906003)(1076003)(70206006)(6486002)(4326008)(356004)(36756003)(76130400001)(4744005)(2906002)(5660300002)(478600001)(81166006)(81156014)(8676002)(6506007)(6916009)(8936002)(26005)(86362001)(336012)(26826003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3324;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 861b6978-b8f6-44b3-6dc9-08d788979090
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEYZiOt9ZbDaLokzCo0GXPHneHeomWJj0TZ29E27bbP5NV4jXCHe05nD3qmGtqufIImzTpWud6dBmYmqr9M8jx1B61H8Gt5Duz1DsryP6v4m3o+07iDX+VyPFsPnpt1Tfnvyv0Knss4PcDX0CjLn1FCQ0ZNJXA0f1csNeTn1smTR8oTpsGN4MBCOHOcR5kLsPtG6ZKtZK+pNFWgLlocek/EQISxU7z4pzfyASXdqMD77S8zN7874HvKvZSwTkNV7qU8xMbZPmlOqu+dzXCaO+GQHgPojCeB/Tul3CUkawX9i/aGKp9JqHLP6b7Dw1BuRczZpTZmVwQCrq3RA3v0g5TbVDSVh6IJps3cam0NVBbWxMJ4pQC+io8e3vsNRfTrWI1JdMyxDCRvEBZAOQK2S6LiRKZ/DRnSZKkxNfiVdYaWSYfM6mTP+ng1YvwvBIj9v
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:56.7695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45064ac7-87ad-4fbf-dca9-08d788979807
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3324
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 784f4e4eea05..30f6a76850f8 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -218,10 +218,8 @@ static int thc63_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	thc63->bridge.of_node = pdev->dev.of_node;
-	thc63->bridge.funcs = &thc63_bridge_func;
-	thc63->bridge.timings = &thc63->timings;
-
+	drm_bridge_init(&thc63->bridge, &pdev->dev, &thc63_bridge_func,
+			&thc63->timings);
 	drm_bridge_add(&thc63->bridge);
 
 	return 0;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
