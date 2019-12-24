Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C227212A73F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE3089CF5;
	Wed, 25 Dec 2019 10:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630D589FD7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9ls/aoOTQc/7MCW/HA8um4kag8X2AYI+VRD6FJMDQ8=;
 b=baahbcBL2cPpPIwD5vfa3GKry+0ufILeUK9hbzwobGsB5V5wJRU6heGlc+Nj+o5EbDK7A3PgT8juv5TgjwdP7vDeCjXlxlbzb8UUvC3AQCHOVbTV9s4HPNefTSVmBdsiNXgN6rP/Q2EqPEElnHRt5K8+07gfbk2XVyAOW5Mjf24=
Received: from VI1PR08CA0095.eurprd08.prod.outlook.com (2603:10a6:800:d3::21)
 by AM5PR0802MB2547.eurprd08.prod.outlook.com (2603:10a6:203:a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Tue, 24 Dec
 2019 17:34:37 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0095.outlook.office365.com
 (2603:10a6:800:d3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:36 +0000
Received: ("Tessian outbound 4f3bc9719026:v40");
 Tue, 24 Dec 2019 17:34:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f94b2c4191e1048
X-CR-MTA-TID: 64aa7808
Received: from bce15b33d58b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14734123-E42D-43C8-AB4F-C8604D2EFADA.1; 
 Tue, 24 Dec 2019 17:34:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bce15b33d58b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYGgJjnaThC5x1e4xrs50VzaKO92aAWI/+FLaARuK23V68Kkc5Upl5oeSlItpqA5/CGUojJ984ieb4DoIooJJWJzuYVhN/N3VkBpN/SQR+gEB7FqQLi04gZDyi71VmBVs4s7FzYvFXqMiqFSF2LQWPyGKaD8b3GxxyjwTU+G+T6hV/ETM7oktVFTWRiuhS1uLwVpdI+rsj8yzrZAE2/ZHU+T9B1ByA0k+j78E1DzEVxSGoszuwz3/nH5zCRraHKikr6YiaI9plvsb1RwFtY7Hktt5hmL3synxWrELYmGq7ZCEy8HR478njo0Y0Fu/wpJ+mAh3WxZjAIy3fS42NZHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9ls/aoOTQc/7MCW/HA8um4kag8X2AYI+VRD6FJMDQ8=;
 b=bsRaNTDUofCQR2azxiRq0PJwUtVy2ciexmxo0dnlnSBQfX8P0hKUQxz1i9NTlCsmXkeLxDYqmjqx5NLwRJKoKmlUwQ0rnxeTYluy/ymluMdsahyqH5sxAz8WlnxwaL7UWM6CFvjQYU/a9NGQs1x08i4l5OL2QlEme1GMgpn08M9BwP+FUHp3xZ2aEwiA+ZEc+dz0m5QxiflvJDrDs/1Hwzt7GIv6sZv8VvdjsQeo0XLDBF7lDhgcrHjK9T3mxNFlzuSRJZEXu36eL5uXI/U74lKfh5E1TVZzokvpMcQgsjmBMHmEMTIG/GIFy/TXfeMXi81Tk1ksqMg5TrGGHr4dKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9ls/aoOTQc/7MCW/HA8um4kag8X2AYI+VRD6FJMDQ8=;
 b=baahbcBL2cPpPIwD5vfa3GKry+0ufILeUK9hbzwobGsB5V5wJRU6heGlc+Nj+o5EbDK7A3PgT8juv5TgjwdP7vDeCjXlxlbzb8UUvC3AQCHOVbTV9s4HPNefTSVmBdsiNXgN6rP/Q2EqPEElnHRt5K8+07gfbk2XVyAOW5Mjf24=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:30 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:30 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 10/35] drm/bridge: adv7511: Use drm_bridge_init()
Thread-Topic: [PATCH v3 10/35] drm/bridge: adv7511: Use drm_bridge_init()
Thread-Index: AQHVuoBkMIOFtQciZEaSiVpU4Xi4LA==
Date: Tue, 24 Dec 2019 17:34:29 +0000
Message-ID: <20191224173408.25624-11-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: b68423eb-8ae5-4278-a2d0-08d788978c4a
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|AM5PR0802MB2547:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25470EC1F9124FD488650F828F290@AM5PR0802MB2547.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(186003)(44832011)(6506007)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(4744005)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2702;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lJxQfiB6NUo0WJi8UFdhO7CwcIiqYthGwzeutXZa7MBo7fQDC8UuG6A9apT4GLLqzBtmeDhm+jXwfJPevTaltYJtHC8dqxQRcKoiuAWInJDriLG9mlcgUtw//zUIENLx9GQ5W+vGeuRx8Cq9Ylml0T6TviqyE/TmGGzKqfrqrS4D+ysajkbOXJknWuIiRqFbDLFrhzhghZLvaGfHHCtE8kMjRHtkW32pIxdn8UYyGEUmxp7qCTGWEIkpSKcXEWzozH42hW5grXo9GE0t2iAsdeRVxfX4KrEk5PzUtluU0yQIy/fuEIM/dSfYKkIOBiW+MhGUEE1+4GZSZHz5TxuKtDVwVzo0cPT7IQC2Tnv8hEZiP3++wm1IqoRDLSvclfJ8TB7T6/0b9yvOMmn5rixDoEsqAZNYOT+ZmrJYGrQeqN7IDzSLwy+U+VFz37XyD6vu
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(26826003)(6506007)(36756003)(36906005)(2616005)(6486002)(186003)(107886003)(26005)(316002)(478600001)(4744005)(8936002)(54906003)(4326008)(8676002)(1076003)(70586007)(81156014)(81166006)(76130400001)(2906002)(6512007)(5660300002)(86362001)(6916009)(336012)(70206006)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2547;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e20c03c1-2f25-48d0-920f-08d788978755
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnSPOJxqevqPfWZQREIuDP989pavZwXSLLof7rNs4FsXAT1D/j0yEVZimdnK45xALouILp+SLxeVFr/o/QlbZa/bIEG1AJhI1g61wCjp4s1CzwxDcSC1dylDzFv3RMqhU9pJVWuSbfq6zuTl2Sl+IRzyoR8r42LeF44GLceXMGY1H07a2tixDrhh6sBIed/1Pjq39aBumBAz804rd8vESTkGgJgVCE31pfrS+4/yefjXWpz6AuA8rpLRxUqRtjFhJEZvsQUYY/6J6qUgKliI5EgrInWmOcq64gm0EYDL6sXRF00CeftF6O0bFFN4jYvMkTXAjc1AMwBBnJMH97UEf8Oh3tcHXejKgAoStQt9+1MMbUjO09Bg/v5oir84ovedUkr4hm/+MZ49hA84j+aqH8L1tb1I5/ntSIXOJznawr0rlt4z8cWDaOmIbVr/aDYa
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:36.9894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b68423eb-8ae5-4278-a2d0-08d788978c4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2547
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 009cf1fef8d4..14a393f1c957 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1216,9 +1216,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret)
 		goto err_unregister_cec;
 
-	adv7511->bridge.funcs = &adv7511_bridge_funcs;
-	adv7511->bridge.of_node = dev->of_node;
-
+	drm_bridge_init(&adv7511->bridge, dev, &adv7511_bridge_funcs, NULL);
 	drm_bridge_add(&adv7511->bridge);
 
 	adv7511_audio_init(dev, adv7511);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
