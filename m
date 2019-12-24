Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEDC12A733
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE7789ED3;
	Wed, 25 Dec 2019 10:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F99C6E359
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av4RbeCcIzFcw7SkwkihJbx+cKuz7Y5laN42tNG5wis=;
 b=uUGvG83fhFTrFGFphPyCiicaqtJcFh91ZKcl6pDC7abDk30ie7n7Uf077v50H1W1B9nQVnqqq6zyAtsi+f4yVlc8xXbe6fU4Ws3KvJkjmvWIvhDMYcnJ/WMBmP9qFrdiT1+HQ9wl1flVpvVrxfDEQhbxItIpDq4gkTDPi4QLKZ0=
Received: from AM6PR08CA0037.eurprd08.prod.outlook.com (2603:10a6:20b:c0::25)
 by HE1PR0802MB2537.eurprd08.prod.outlook.com (2603:10a6:3:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:48 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by AM6PR08CA0037.outlook.office365.com
 (2603:10a6:20b:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:48 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:48 +0000
Received: ("Tessian outbound 121a58c8f9bf:v40");
 Tue, 24 Dec 2019 17:34:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f14b32a4112de92
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 090D986A-5886-41E6-9684-1759EE94A263.1; 
 Tue, 24 Dec 2019 17:34:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdd2edd0996c.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpu8dwem56N9YN5JmiJMpYqfdezW2ZBlZFv1bFG7DRc7MPpqgyTiS/BAONsno+JdrA4BXJUgpUMeLKlpPIoDjk7fk4CZf7ZBZS+yd1ZMTvMurEagyyXMUYUUwQJitIgLOZpHiOOJ1ClFrHjIMvKpuSKX2ArKA1qIhLydezoGUwAlzSq6u4vZvuC03UxP1yjG05sR2mt2pYGg3HuJORnlystvKtP4xwrM59mvi6irnF5GwHFtt/z5ewvnqlL7XmggusHf5f1MVCrOktJTHse2x1Fcw5n7/3f6dfZZE3s6SxeRNqNd71+T0rWI3cfR1m+ZOIZ+ht9yGQ2FL3ihWUi1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av4RbeCcIzFcw7SkwkihJbx+cKuz7Y5laN42tNG5wis=;
 b=nG+viiJ822pmzSc7tGli67gz1pHBKKcGMSPI4PVt7GyvmCka1IHQUT9sljXj0+n2OMJVLrZ+XENSSJtzG98crVslfoS/PHmmX0z2epVkBKOUPCKIo6ORQgr717rynbk0v7cbh68/Nd6W3njBQljE4Bi+UZZDI257vKsoH7eCldoWuFU62HyVbXQMr51HoBlYgdf1OHidvmFjowLnLwFZUH/DkyrXQnHF1zHYGeW53FjKfkZO9o29SydpGTZGbaqoAqYv1lYWAu5Kwu0gEzujlk0CethzyJfmUA+/mP+RmIm2Q+RCocNjb6yUuDgLfzkaCehBso3qRxU8ZaB0MaNDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av4RbeCcIzFcw7SkwkihJbx+cKuz7Y5laN42tNG5wis=;
 b=uUGvG83fhFTrFGFphPyCiicaqtJcFh91ZKcl6pDC7abDk30ie7n7Uf077v50H1W1B9nQVnqqq6zyAtsi+f4yVlc8xXbe6fU4Ws3KvJkjmvWIvhDMYcnJ/WMBmP9qFrdiT1+HQ9wl1flVpvVrxfDEQhbxItIpDq4gkTDPi4QLKZ0=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:38 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:38 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 18/35] drm/bridge: ps8622: Use drm_bridge_init()
Thread-Topic: [PATCH v3 18/35] drm/bridge: ps8622: Use drm_bridge_init()
Thread-Index: AQHVuoBqBe6XtLdBuk6r4vxdiq10BQ==
Date: Tue, 24 Dec 2019 17:34:38 +0000
Message-ID: <20191224173408.25624-19-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: cbca88a0-5d2e-4513-770f-08d7889792de
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|HE1PR0802MB2537:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB25373FCEE7FB59DF7E7361EA8F290@HE1PR0802MB2537.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: hatUIA2eTnc4ZDQShxaQs93+xUl0tVSkLAEQeb2DieMTXzLhF1ucFlI7VnxAkK4lEpqmfjVMuVwaCy0TBgB04g+hQjtER3hc46cQCMBi+WKXI9v5hUN1I+UIedO2Ns8jofy84KHj8kbuaGkqrc0W7WFiYZdLSuhTjoTQyQ8VYNVhe+31y42zB8BCASBJXWdS7bPuteaK1AGWRKCxX1L66O554h8pLXDcX5aVzxwO51hjyuQpQ7o4wSWt9kaYh9ttcnLBtZCHEh2v4848X5b9OfXNR9WKCsSTnA0RPcS+ECBMidFewfL7p/dT371O3c4UUZBVvLd1mo5FRP29am1/X28GADjzaXiOIapIudE0LygyJBDBrpX5wdzGjsd0XR8P6Wn43/HF7JlV6SJOfhQGggR1QYsi8oisBqyFaFwHAEj5JtS1ywV1Z7e/bp55KMjW
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(6512007)(6506007)(81166006)(4744005)(81156014)(356004)(8676002)(8936002)(76130400001)(86362001)(107886003)(2906002)(336012)(2616005)(70206006)(54906003)(36906005)(70586007)(5660300002)(316002)(186003)(26005)(478600001)(36756003)(6486002)(4326008)(6916009)(1076003)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2537;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 88a5d40c-ae1a-4634-4969-08d788978cb5
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/fmAWJXvhzp7AM4ZZ1Y23rnVsBfh1AFQkU7xPFYWn2ODC4kKj6+mqpgTg0oi3sgd/903x0ybVIaO22fp5hrf1p98wAdWzRU6Y/zBv40gNA66G6aOvmC2njtTlGV/vHt5p+J2XgiDr8g40LCw1+etPWbc9+7rv1pl+Sox3hGT2FpeJflSiBNV/06sOy6qnVau2/q6wtazyXCb154/1cKsjXHi0BC926o5lsuCfQZPMO1qyAYnH53Lrhd91V7NwTdwjieG0bZfqk8XXxq5Bon92zuHny8AjW7yjtJh8M+vEYPUlNOOf08sAj1Kn1RWrdJrKf2+HM61DYOMvjGxGfjV+aHImEly2VBngzfH7ij4x8XnX2QdwmA1pRNmorqweMn3df7vex9mZWAuVbZQVETi9i3jXwdJCmiaftPRJDy9sjBTmsYPuAHrKmZjZ8qnPXG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:48.1086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbca88a0-5d2e-4513-770f-08d7889792de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2537
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
 drivers/gpu/drm/bridge/parade-ps8622.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index c32af9c2bbcc..ce870f26e93d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -588,8 +588,7 @@ static int ps8622_probe(struct i2c_client *client,
 		ps8622->bl->props.brightness = PS8622_MAX_BRIGHTNESS;
 	}
 
-	ps8622->bridge.funcs = &ps8622_bridge_funcs;
-	ps8622->bridge.of_node = dev->of_node;
+	drm_bridge_init(&ps8622->bridge, dev, &ps8622_bridge_funcs, NULL);
 	drm_bridge_add(&ps8622->bridge);
 
 	i2c_set_clientdata(client, ps8622);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
