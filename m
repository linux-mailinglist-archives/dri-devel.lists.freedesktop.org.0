Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B59612A738
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D5889F0A;
	Wed, 25 Dec 2019 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08476E34C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnB80cckWBIAQafLN0IPF91ce+g5Ht7qeutJ2eb+7QU=;
 b=zyDkZaj/EkSLpTmgA9/jx5/nb6hn2b7SpmXBsSySpUBORTWe2sQFUxjZ2AYj7hvyMqHkambLDenV/FocPhTDHtBU0SclhtF3KvTi9kan0dwSWy174Eo88nZfnWTDwUX8uBI38YFpNps9oK3CE4PLxg9zcd8QSA3jlDncCLteo24=
Received: from VI1PR0801CA0080.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::24) by VI1PR08MB4381.eurprd08.prod.outlook.com
 (2603:10a6:803:f8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Tue, 24 Dec
 2019 17:34:57 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR0801CA0080.outlook.office365.com
 (2603:10a6:800:7d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:57 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:57 +0000
Received: ("Tessian outbound 4f3bc9719026:v40");
 Tue, 24 Dec 2019 17:34:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c55a258e76e13e4b
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.15
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E889DE88-3357-410B-81E4-B1EB10EFCCBC.1; 
 Tue, 24 Dec 2019 17:34:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bdd2edd0996c.15 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHk/oocB6h1FOsJSSs4UzP9K1stzn/RX3TbP7O2+c01egkXDrc2qrhORNnOW7G1uElB1zYQiD/PRJls2GDRGRx76g7gFK/ZTg5uZlxLrf+VHE1sMVId41OZk8eiHuDTbBe9HfCsoLQO7OPNU1UDvQhGvaTHMLOHLQch/UICKkNu1LfPggnHJGPmq4tYGcEBaV5AiO2pvQZ5eMjiJd+qTGzdWYkf+rJMcxTuzeUCfzWMO6QA+TvjzGdWn+wxQiufQbto9b15XDYloPEYXP0j62lDSZr5bgniyyqhdfqgBatfvWaMEE+1MUV7xpTdwtjskWxiy98RgiOjYl7uSXAmtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnB80cckWBIAQafLN0IPF91ce+g5Ht7qeutJ2eb+7QU=;
 b=en+jesXrQmcbU9OoE5PFL+SCCWT6sotl8PDJqfGL8Q0KLXBFZGohrLXrC24ZIipLLUGoYapso0a8KnbOjah8nkzkOa/S20JS2wH9F7nvCN1ZVxtsJM/R5LK/OuVOjlMUAynfP8128Whoq0K/BbKx+a3T4ybh2ETPBwPRxmjQbuAXCBbmDawKw/yxdsZIn/e24qQQZMYNRaRe9rcqlUgB9v2IN2v1j/bZT3fqAWZAYayPcCtQ4dn46G30wjbV73VYXFjVCDQpzN9uD8hkpZhRCeKsmmZqOYK4wANWSil/i7At47PZFbQPozgQisIkOX8kN8ZxjroaOQbpZ+5rbxspLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnB80cckWBIAQafLN0IPF91ce+g5Ht7qeutJ2eb+7QU=;
 b=zyDkZaj/EkSLpTmgA9/jx5/nb6hn2b7SpmXBsSySpUBORTWe2sQFUxjZ2AYj7hvyMqHkambLDenV/FocPhTDHtBU0SclhtF3KvTi9kan0dwSWy174Eo88nZfnWTDwUX8uBI38YFpNps9oK3CE4PLxg9zcd8QSA3jlDncCLteo24=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:45 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:45 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 27/35] drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
Thread-Topic: [PATCH v3 27/35] drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
Thread-Index: AQHVuoBueFK3izZu8Uauiq2d8cLB6g==
Date: Tue, 24 Dec 2019 17:34:45 +0000
Message-ID: <20191224173408.25624-28-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7ba810c1-2de9-463b-5aa4-08d788979864
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|VI1PR08MB4381:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB438104918A1D3DD24B148F828F290@VI1PR08MB4381.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
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
X-Microsoft-Antispam-Message-Info-Original: pRgUrvrRb5q66klerm2j6rTE05IkB6ogY2B9OirsyQ1M6O22YfI5Nkybof7kreoitje8/YFaQsKmvRh28QuKhquvkfcWp1HuR4aaoxggB46DhcK2F/QV6qzMPqh0YKK79h0r8eByu/2BANIKxnxi0kX3ICjQViZm7Ne0RGpxRrtbS9NtnHxTqp6KR6tqVlImbFMlemIpMfWO6ca0gFizq6KtxZY/6hznaOIVrcahTqfHQ3P9PWmFijKXMKmohl8aTncVw3LT8hw1j+W/jXguFfiKeX3cvT8Tc780flP26OVMFwYzzMMe/s49q6hMED4pb9NW6xI8FlT8jKIpnlIDSoAd28Vl+gdWizR3oUkYFmp9MVgtys5rqlZRaWnayqXauoIif3gy3aZzOkAoUGgdRMW8uS6u7TUJSaNtt+TRE9b6rJHJVgvFf5Dbl6GQeuus
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(199004)(189003)(6512007)(316002)(81166006)(4744005)(54906003)(1076003)(8936002)(81156014)(6916009)(2906002)(36756003)(6486002)(86362001)(6506007)(356004)(478600001)(70206006)(70586007)(107886003)(76130400001)(26826003)(8676002)(2616005)(186003)(4326008)(36906005)(5660300002)(336012)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4381;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8edd6c70-46e0-4be5-7331-08d7889790ff
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KT9A+Q/j2QPY58KE7ti4SsPwdR2xjMoHbu2m3MXCRqzUulqPhdqs/sFLK9Uckz3k1d7saLjs0a6ar2CMBA41jgeg9/5lQYOiFFjf3wTel+NWrShLuD1vKFikJ3IHNU4GYSnA1yBtrdJwmHbK87BYq1/Kad51cltgSYnKBf5Z4AaXY47Mn6JvFwiwj9Zeg9jPxwpSuTHnAvL+wHse+qoko8OmfY1gAIBX5BTOzf14ywdJAzPZsdlgF8Xaknqv969N2xsveznjmnbhgT3OOFmwKCNsntves4lTpI6Kso2feYa7pzFCXWpM2olfpInpkd3KfAhSvOrV9JhOwdkKneQDk+0E05ckSuz2aEZDCNOI1irKXriAYWpcb0mCDDszy7cwKBaj3otbL9Q/btwHXHpWVbKSBq+cgeQ5HrL3snC6O0rV6xYRAmKYICn8wL5pVLQA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:57.3616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba810c1-2de9-463b-5aa4-08d788979864
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4381
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8a4e64cfca1e..b1d2690fc218 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -765,9 +765,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_register(&pdata->aux);
 
-	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = client->dev.of_node;
-
+	drm_bridge_init(&pdata->bridge, &client->dev, &ti_sn_bridge_funcs,
+			NULL);
 	drm_bridge_add(&pdata->bridge);
 
 	ti_sn_debugfs_init(pdata);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
