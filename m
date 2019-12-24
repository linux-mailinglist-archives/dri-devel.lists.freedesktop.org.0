Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C0212A72B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D3D89ECB;
	Wed, 25 Dec 2019 10:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00056.outbound.protection.outlook.com [40.107.0.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5706E362
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ShXCfn8ryNmKZhoRvxGw0VU+0xf/g1xjkLqqtEGc7g=;
 b=pG6C1Za4bdgnEIkbmKVhG+WrEBskoXxvelp+tb4sNDSS7m0Whh+NFVtKl2xLe7pgKWl3zseMTWJJ4pW+vRLamwzywNdcEeXg3hyybF8ojjTTTLixZjqpBE6u15KVMAJA+qJmiOZmA4dFXsX2HoJH89tMn9yjU9dANi1rVSgoR8k=
Received: from VE1PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:803:104::20)
 by HE1PR0801MB2059.eurprd08.prod.outlook.com (2603:10a6:3:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Tue, 24 Dec
 2019 17:34:43 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VE1PR08CA0007.outlook.office365.com
 (2603:10a6:803:104::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:42 +0000
Received: ("Tessian outbound 0eaff1016ea4:v40");
 Tue, 24 Dec 2019 17:34:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48d55b3b41932df8
X-CR-MTA-TID: 64aa7808
Received: from a20093a6efd9.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D504777-08F0-4CC1-BE28-11798842B63A.1; 
 Tue, 24 Dec 2019 17:34:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a20093a6efd9.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkjLpr5EmK3Jbcd5ftkucQUQ4oK8cKNKeaufqa+u0rl+k2i9aQGr502048UMJF3bM4xsg+smJHnusWv/hEosHj+spU+3Epeq3vy7mlgZ2F3V82lahUmFzvXGSfsqLkinOy/ygRMgNw9OVwoNk/ULbZ2Gz+9vXk4kEswh127Q6CcDYl/zIpe2awi9+fJ6qkVSZcWmeenobt6/jS6zzWJYeAbGVa6DrB7rqiorTSNf+VkMfBQPu+cBOOTuLMN8dC1WEZpLG25xDzMcj1YLTegpimoAEMpkzko8lAW03StCyYEhM9BtGkq0WeWaro/0OX414zO4K9pnZ6y20YSwMgHkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ShXCfn8ryNmKZhoRvxGw0VU+0xf/g1xjkLqqtEGc7g=;
 b=ORqz8WJVpwu4rx5YG9xjcK5uNQ0F3C/KBSLMZJILR/SOsLnMZXqlPiHYudICaLLSJsz17jZy+OBU6R14bp7qlnZzL7jp99Cc5l6m+RDEYjAsqg/tsvs5aYj9mD2lrWcAvidxieM618u8CgVpIlyqrdHLb4h1m+ffv+w+5QxTIgEaEy2EPeodtU8MkeBHPYV8Heh+xyLWySmQzXh3elPx5KR6oKdwQBawgevYm4WFhdBfuu4lM5/E+GME1aIiRhj1tR//zkQPhrjyyaWo/sqnaCAGtwe+Ck7UmFlozmvGjaa9CcpEvzNSzE1gOM3wwTcFdmpiAYid/pK+eWpgLNoaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ShXCfn8ryNmKZhoRvxGw0VU+0xf/g1xjkLqqtEGc7g=;
 b=pG6C1Za4bdgnEIkbmKVhG+WrEBskoXxvelp+tb4sNDSS7m0Whh+NFVtKl2xLe7pgKWl3zseMTWJJ4pW+vRLamwzywNdcEeXg3hyybF8ojjTTTLixZjqpBE6u15KVMAJA+qJmiOZmA4dFXsX2HoJH89tMn9yjU9dANi1rVSgoR8k=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:35 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:35 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 15/35] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use
 drm_bridge_init()
Thread-Topic: [PATCH v3 15/35] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 Use drm_bridge_init()
Thread-Index: AQHVuoBoYgUHgfU1Dk2mbm0heByIWA==
Date: Tue, 24 Dec 2019 17:34:35 +0000
Message-ID: <20191224173408.25624-16-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: ee58a5b7-c0b6-47ed-5e72-08d788978fc8
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|HE1PR0801MB2059:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB20596B0E054EE4467FE60C688F290@HE1PR0801MB2059.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(7416002)(186003)(44832011)(6506007)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2702;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HbdHY3GyUAq2G/f1IE12mkZ29AsiTlvpOxnnL6+c92k0VKHgEqOjCZHYscskYmFhUtoIzaGr3WTGTKqJu2bewdT4/wlZBYSxaTfv3ae2al9pPcp8jx7DIBflvFtfD3kvgGmEvg4j52tdxeujvIntEGGMcs6f7rw03OdA7T2qRLfBjo6o3jO9B+FTfuHA9oZg74MGtxrKDT6g8OkuDhKcBQZmqh0zwaV1Ke6eWyorWPOBuJLn9bnmVCKeEBl2hsY+rxyrNmdFEAWgvMFp4bJ+Jzj+7Q6i3587T8kN7TjlLlQeAKBtVSiQUAJg9w09vN3s0UFlcBI195E0XhMaRrrCMBH17QZAOf1WSunbegwYO1hdGW1VBkD9rU6CzFKImANSz57kWo6JTM2UCLQT6PREDzSqOjGAk9eTLyp2PqlvBa1UJzpz0UELI5aSQ0Skc/nG
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(189003)(199004)(107886003)(76130400001)(26826003)(478600001)(70206006)(70586007)(36906005)(336012)(5660300002)(26005)(4326008)(2616005)(8676002)(186003)(316002)(8936002)(81156014)(54906003)(81166006)(1076003)(6512007)(356004)(6486002)(36756003)(6506007)(86362001)(2906002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2059;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 540605c2-2816-46f3-2663-08d788978aff
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: unobWQP0qPEXI7hXPw07bjKLAoakiB5BBtfNlVsKmitlmONE7Oy3fmliZnH3m5gI7/3uHwdz0mDCVsO3Ekk0304GPvjAppwsAgv7tgGVn+S94f7EGzOsOhs0kOkxDV3+OSxYanpOWILpFskHxo0RbJe1JxnIeWuwOom8HZ22eKVEFYzfEGk0yNB+QxgKFig/+sHLh6gnHe79ZkbnyaPqI57vQd5hTNTyiGgEWnbIkfYQOSzw2+1Vpo4hsL/vP2aqL4VPMwO6gZMizAsk0wcSo6hRh63I9aLmbNvnXnYzNv5K0gzyImQWn5Oj9L7wycLnXOuwMCAlx9Ii1YM4xjs5eLXni6LuehrQ9Dxg/ut4yGhooU2jxy8qvJ2h5OdxYhB0YF8YC0yoWZNTt2HovQPIkD5rElKei86wXdHLBAAb9pzE09GBL7c+lCgT4FB2p35s
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:42.9316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee58a5b7-c0b6-47ed-5e72-08d788978fc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2059
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
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
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index c914f01e4707..a13ba625cca8 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -303,8 +303,8 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 	i2c_set_clientdata(stdp4028_i2c, ge_b850v3_lvds_ptr);
 
 	/* drm bridge initialization */
-	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
-	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
+	drm_bridge_init(&ge_b850v3_lvds_ptr->bridge, dev, &ge_b850v3_lvds_funcs,
+			NULL);
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
 	/* Clear pending interrupts since power up. */
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
