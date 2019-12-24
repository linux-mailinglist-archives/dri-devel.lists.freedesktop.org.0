Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BB12A752
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7606E354;
	Wed, 25 Dec 2019 10:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AF56E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/0zJrf0XLA5Sb326x6RiVHw/NRaNDEgL3SBCtwP5Uc=;
 b=iyX2tu8ZBr+uKxvw1orgKBSywVv7JJkcmE1nBeHOvOJuy2nBMIkUH9YmWwVdkiHGbhwpdBF2GQAo7RPFrI7UgWUP0s327AJ6HW5guCFzGz9shhAdDeBDH9VxtlizQVyD5tb1m82L0JTJHczoKpCSARLnWyDpa8t4aFiXMv7qoDw=
Received: from VE1PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:803:104::49)
 by AM5PR0801MB2018.eurprd08.prod.outlook.com (2603:10a6:203:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:55 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VE1PR08CA0036.outlook.office365.com
 (2603:10a6:803:104::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:55 +0000
Received: ("Tessian outbound e09e55c05044:v40");
 Tue, 24 Dec 2019 17:34:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5c018cc780c467e
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.13
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7E4FB5C-74A2-44E8-97CE-33F88B8EF429.1; 
 Tue, 24 Dec 2019 17:34:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bdd2edd0996c.13 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZ/x9HQP95ngnCj3aDhViIv8Cw82dEArBgifZBzDevWZtDuZHFkImPizPWh22j8KBI5ty4RGCcfg3tzL8XnjHyxcf3adDDZ+bf1Ko+5afabqbudquK6IRUfZq06Py+64owCUgtZ0oTfKIvv8K2Yj2Ebh4b3JnmhUB/OSYJ/wE5P0D680OhQe5LGmsDIHrlZG3yR5qDQ4jiHzubl9IGuKgt7x1Q5QgQTv7jgEflUZIfHf5g1MYV/DcaZppbWASDp5z+vQzoCdz5NISKm8ZJcf5F7xfVw7YnFO2FneaZG1s9SsODm6sMOpalVtCsxclzl+JKk3C0Ba3vOE7rlK38vDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/0zJrf0XLA5Sb326x6RiVHw/NRaNDEgL3SBCtwP5Uc=;
 b=DIQ7zQfd36eEiBaMbrCoRMDgmGlLznoltXMBGxlaGf/7zqQlHjt55/bnsm1TdG+ovWv/G+xi/PY/LlGHgPzFjwYiBnGu30ag5bRu2eP4K4+vr44KCQUqk+tFEA6qq3tNcDcVwkQkaWUMFgFhLeOduQPoO36X2YA9+R6kBkBvf39O0LsixbgFkm/AV2jUEnBWiHP3TUgu3EyXDpqtcODIst6DeSv+vFCaNGv64HE80I7iak6NRTSeaiQlBj5o5VNnOrc3XGpsGXFFsEyhsUmLYyPUycyLhPW8Fj1G65T2RjUmZeLSl8GToPLQrEGcwFQnyWi5JGVP1ahWwnmLxqHHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/0zJrf0XLA5Sb326x6RiVHw/NRaNDEgL3SBCtwP5Uc=;
 b=iyX2tu8ZBr+uKxvw1orgKBSywVv7JJkcmE1nBeHOvOJuy2nBMIkUH9YmWwVdkiHGbhwpdBF2GQAo7RPFrI7UgWUP0s327AJ6HW5guCFzGz9shhAdDeBDH9VxtlizQVyD5tb1m82L0JTJHczoKpCSARLnWyDpa8t4aFiXMv7qoDw=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:44 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:43 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 25/35] drm/bridge: tc358767: Use drm_bridge_init()
Thread-Topic: [PATCH v3 25/35] drm/bridge: tc358767: Use drm_bridge_init()
Thread-Index: AQHVuoBtcoOxVV09yUKPt+/sYYv9JQ==
Date: Tue, 24 Dec 2019 17:34:43 +0000
Message-ID: <20191224173408.25624-26-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ab403a1-b800-4457-a1a9-08d788979716
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM5PR0801MB2018:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2018A6DA27668C998CF41D598F290@AM5PR0801MB2018.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: miEMQwkbu6tN+vQF6GwVUJ6BXnM77jOqDJ/I5ufL7A8uVh2oe6pzJCjxBZHzpeSLrv6fW+g8vJ0z2tkF0kEbJoZOpe5HA6C5LXmr+xh2UTkaZ+nJvN+8IpWfaCi8NSVhZcNJG65052W2HkvPYfMClqRq1EzhQOJELHYY7exBlA1n4c7+zF0m4f1FefgOwE5Xef/wHfhSvknfoKEz49cBrpFxvnFXgTTNoVHAn4SNYosqyKJD3sm3qzgRHxWFqVQ2pqUk2zEJxzCMkUf+i5MqOnu/CB9yUwlE1difuPqTHH5tnc8Tdoqca6+pLfKabgN5WxnuOaK508ZCHWn6tk8uPlNHxbvbdztdF2GKlalCgiC6VmuSJuUYO99bVb42lQg51EfMB7cpLhG+APRAVNskrQuGh6ZtQk0IDAg2PjU8LL4sQfthOTHF8tyqzO1u2EGo
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(26005)(36756003)(186003)(54906003)(70206006)(70586007)(5660300002)(316002)(36906005)(26826003)(6916009)(4326008)(1076003)(6486002)(478600001)(356004)(8676002)(6506007)(6512007)(81166006)(4744005)(81156014)(107886003)(2906002)(336012)(2616005)(86362001)(8936002)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB2018;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: af1d5dfb-2add-4d48-4f67-08d788979012
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOWR2E958nQQRRak0FeUry6Nr/wd7V6EIa0rZedg+/ONE8Y2F1bSjPUw68GB4fTfgfZpI35HUVMCkyWqmYUvtSNy1tCQAkoJcky7OgyBkDK6yKlBa5h7YEEhYGxHgA/DEQUVBcB3vZ50cYAhvWKqe3XBR/+jirLA0zIooVryaLBLLBUkbmdM8H3yUIE3gVzVmU+i4fulZmfnqCaLE0vn4O9DQoy6Wt61Tg++nMfNvEHTkLyODtlQFvBWotkfxfn4zTsHsz+3n3YivNkBgQv/2MFzDeExRwEelIehe27rcObB5ok6p/pBXMDgQ7BBarDC9WIUB5nH7o1kRGKbo0Z/wPr6x4UIAgB0jBsTDz4d+OwF/7XqTL8TrgTF4j7voLrW64dkvLbwk+RbyK0eZ5KZ8iQUePyMGHRfrWMi3I+0+TgtQOHjimqL5q0CHGt29+Wp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:55.1906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab403a1-b800-4457-a1a9-08d788979716
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2018
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
 drivers/gpu/drm/bridge/tc358767.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ab1524c00777..7f60c6d85fb2 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1671,8 +1671,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
-	tc->bridge.funcs = &tc_bridge_funcs;
-	tc->bridge.of_node = dev->of_node;
+	drm_bridge_init(&tc->bridge, dev, &tc_bridge_funcs, NULL);
 	drm_bridge_add(&tc->bridge);
 
 	i2c_set_clientdata(client, tc);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
