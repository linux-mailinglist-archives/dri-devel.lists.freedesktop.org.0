Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3C12A745
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7A189E7B;
	Wed, 25 Dec 2019 10:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64FE6E359
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6BGzVEaBC49FSJuemqQ0iZnKQkWSDkEjaiqbvPgxmM=;
 b=1wZOZKKJJr7JHzbXzhZH3owcB+WXxVR1v7QPa19WiHiY/Nze4KQ9mrXMJoQUsU7X4zCUp8GqBiGIGJxZp3zEmJov1VTOUTD5T5PcIRz7Z+fBLQWuNi5oi9vnPliVq9FqAEOreF5uocBcf7NjU+ie7m7pjvs6EXoK335o+OktItI=
Received: from DB6PR0801CA0061.eurprd08.prod.outlook.com (2603:10a6:4:2b::29)
 by HE1PR0801MB2106.eurprd08.prod.outlook.com (2603:10a6:3:4a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.17; Tue, 24 Dec
 2019 17:34:43 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by DB6PR0801CA0061.outlook.office365.com
 (2603:10a6:4:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:43 +0000
Received: ("Tessian outbound e09e55c05044:v40");
 Tue, 24 Dec 2019 17:34:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 465c61a2700d202a
X-CR-MTA-TID: 64aa7808
Received: from a20093a6efd9.7
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A16AE48-D545-45C8-AB56-7FD94DA70B09.1; 
 Tue, 24 Dec 2019 17:34:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a20093a6efd9.7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj1PcrKMVQtxaoHa9uDdrvMqImDWU+CnjVLljuSnmHXMyNlqzNgiGW8USqQ7+dWzp6O6C73ZjR70o6JAWAg2zIHvpiChOvzH2HNmui1YutAU8TKlJbneiN/PMEkIfYnTxkGnsdhJGWrO8mAo3wxYXQyLNXGKWtAc6DLSEEPU+Un6EurkwEixqp3NJf75bxo5SPiX6rDHqSV2u6nvQ2fI7y13plzOfVim4F83aLDI1F8Fz6LKBJcnTnPnMQPmPhLxEb0RSrazItcVdJ+UEuoLmthaFBFcgM2OWfjn8oeJd8KomOke3O0szoPfRgZ5nAlzyrxW8nXDYw0JG4OyaG1BvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6BGzVEaBC49FSJuemqQ0iZnKQkWSDkEjaiqbvPgxmM=;
 b=WW7ItflSxUgnqFAZs85CXDOEV9BzjfOp7qbQbKDZQRs0Yr092Z3DVKvkpFjj4Py0CciF5022Up+thYvnwD6Eet6fOZFLVb6NgsV1r2HiWeBv2QQBSeq0cWvKhtfkSUx/1YLEDDjvBLWuaJ6ZGzib9TyZQ3o9wI5jzudGcXav4ajlZNpcnzpHS6gxg47hRrnNx88hDNUp09LRCYC1Db6IuBJI5C1RwsSa3XqiXypCgDTnHSpzW9zQnM/+XfCrxQqmdr6qw/Mchll5lRTQLnXAQMwZ9bBrvOGckq927h9/pLX1hVBtGM1FjSgJRXSf9eP++Dw+5mHWij1tgb8WwkxoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6BGzVEaBC49FSJuemqQ0iZnKQkWSDkEjaiqbvPgxmM=;
 b=1wZOZKKJJr7JHzbXzhZH3owcB+WXxVR1v7QPa19WiHiY/Nze4KQ9mrXMJoQUsU7X4zCUp8GqBiGIGJxZp3zEmJov1VTOUTD5T5PcIRz7Z+fBLQWuNi5oi9vnPliVq9FqAEOreF5uocBcf7NjU+ie7m7pjvs6EXoK335o+OktItI=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:36 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:36 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 16/35] drm/bridge: nxp-ptn3460: Use drm_bridge_init()
Thread-Topic: [PATCH v3 16/35] drm/bridge: nxp-ptn3460: Use drm_bridge_init()
Thread-Index: AQHVuoBpAbASn/F6nUe58QN+gfzUEQ==
Date: Tue, 24 Dec 2019 17:34:36 +0000
Message-ID: <20191224173408.25624-17-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: f051afeb-72f1-4427-7817-08d788979008
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|HE1PR0801MB2106:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB21064CC43E13F027894212C68F290@HE1PR0801MB2106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
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
X-Microsoft-Antispam-Message-Info-Original: hf7J2l1Rbd+CjtAu3WNNgpf+5mLks18faxECKLN6RVL7HQBU1H3iLIja+O1x6M5mXBhI9GYI3MHvIq3g0UXMIduiUIj56C3ZDV2OLQQLLUNmUczdt6LXAUmdLKmPy0fvTddpGvtn4xaIfuFS3tVg1NXgygTFRoLAJztvJLpiORENmAsXd0eD+1xcN8RNuONca56xJozAWCmCqToleiDkzISac/aBvng2EjOnB6kaXvFZjMEnRBV2M+NtXP1DHT5zMpv8FUDa8WHnGEdS245di2oizK+fRNzLCJNYFRL69ImTlSVIwNZCvgmN9cJLy6aCIqyJqUy3fKLeGqtcOyyf9U8Eabnb4S5KKi+Oe66qQFZ2YFEETpBgFbZPkK4WzK7+565tU4QvrA2AFH+vI3XZTgF9qiVNM4NGbm2YQKGZ6ZJqIkmVf7JE3M2dT54XIBuP
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(6486002)(356004)(6512007)(76130400001)(26826003)(478600001)(6506007)(86362001)(81156014)(81166006)(316002)(6916009)(54906003)(8676002)(336012)(36906005)(36756003)(4744005)(70586007)(107886003)(8936002)(70206006)(26005)(4326008)(1076003)(186003)(2616005)(2906002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2106;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 55682447-3964-4c1c-72e8-08d788978b94
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPhZwH7aZ4jZ7AKNDnDtJjyXy2xj+NmfSFv+4HES9Dva5aF/znt3eP+94N5INzV96gMaMhtsD85ONaOJQ1NnzSNxrnCO+e/Ycntsre9YTxlcfkwEMIiRw6m9nBf+tVQCv5Hz2QZhJRKEMJ3sZYv6K+0mnSUg0SoWwmM+Po/nF78QiJPz/mmCZ/AuETWKstnlRM5DZjygCuJt0DJJ2DPNvqLiivtPXn90QrbmTmZ8Go+NEiUivOmBOQ2G0FLGve2Oc7qbtXGpXlCxI96HS/OVScu45dBycImjdOT6osbz01q0XAjTl+UPnxg/zx4gFk5223im8pzcPIVXUvP35eoJB1lE1UIyCLq2G31lNv9jS2O60wQN1MMp0ZpgQ7QSFHFaFcXf4UkQjbpe1tWAuA/0f1bd4SJS0qEfsNUKsXX9kFjUjOSTeWibK9lZ/D7UOEyi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:43.3567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f051afeb-72f1-4427-7817-08d788979008
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2106
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
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 3999bb864eb9..19f37ec8284d 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -320,8 +320,7 @@ static int ptn3460_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
-	ptn_bridge->bridge.of_node = dev->of_node;
+	drm_bridge_init(&ptn_bridge->bridge, dev, &ptn3460_bridge_funcs, NULL);
 	drm_bridge_add(&ptn_bridge->bridge);
 
 	i2c_set_clientdata(client, ptn_bridge);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
