Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A933412A736
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB7E89FBC;
	Wed, 25 Dec 2019 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91BD6E359
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYlkeJ90WiZW8Cggtnrv/K+fKTcTQr56ghgZZwwHLbo=;
 b=JZnFu6frIx93pXcxsyo2Pb2jIu/iV0wHEj31Ara6SuGu9/LsjwVueu7NGSWusvDf/PMLRJEbSzGU1udmerY8j3rJaiQhSNzGdSuQu8tm1FiPPx7W+Wxjsj9fC9qOGu/yLeyFGpuvuh2czBY9ok0XdGIJ7gjxgBuEUkJx6goQv+s=
Received: from VE1PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:803:104::42)
 by AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:42 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VE1PR08CA0029.outlook.office365.com
 (2603:10a6:803:104::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:42 +0000
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
Received: ("Tessian outbound 1da651c29646:v40");
 Tue, 24 Dec 2019 17:34:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cffa408b5dfffe4
X-CR-MTA-TID: 64aa7808
Received: from a20093a6efd9.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4898AC4-9CBA-4373-915A-5BC35E8B3BA9.1; 
 Tue, 24 Dec 2019 17:34:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a20093a6efd9.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj4CtvK5aMiabpRYT4r5CerBHl+NyXPjUZ64IOfQOjVcC8weoPBrT7aYc0WQlfMtHsndvUsxozJnoGPlQQXWNhbBhmJSlixbmAs0p2FYk0PVxLSQ4A/Is6l/KDaddbAgkHWsHGHvCwe/JC+VdDC9aFQuVi34EAL9/fPqAfn7ORtGb3l4qE/H6YSTRDwKtl0w/5RYkt9aTuFXT5my1OrWEPTmymtajKyrJQ2LFnN+opyWtrDVxQZFaFmYKO4Sk/EVxWFFXfOXxryAhzFjt1/8hmByVB/zUPoWyYxezZALaYixdVkIElo8XQITaf8taVgnbUBYTg1j99Jw/6SQS1YZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYlkeJ90WiZW8Cggtnrv/K+fKTcTQr56ghgZZwwHLbo=;
 b=B4QlyjAf7XK3jXAAYBpuqXQK7agkWOyStVU8/W0cqf0Q1qr+KHNJK90dqLtaLD96Mv7S43vFcYO8x31yvxVZaP7TjUbEjiAdhxZCSFNiGsXElK+biHEJFhxr+myFXxvLC57YdZsYFJtdZI7ODNy077k1A1aDL7LSC/PI34M+9gxAgBNaWuL2QDCSeekWG2XHoJM1QubQv0WCBdvhaQEzTysi6FHLGK9bPg/FwCePefMomfMO9BoJtVWROCj15ZanvOdBicdmnxt+iqPej/a2ON2B/FhuwieqUKcaPwXBZSROH5Bl6Ul3eljmcAvHIRqgcsMsj0oD0m37jX/eytfr+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYlkeJ90WiZW8Cggtnrv/K+fKTcTQr56ghgZZwwHLbo=;
 b=JZnFu6frIx93pXcxsyo2Pb2jIu/iV0wHEj31Ara6SuGu9/LsjwVueu7NGSWusvDf/PMLRJEbSzGU1udmerY8j3rJaiQhSNzGdSuQu8tm1FiPPx7W+Wxjsj9fC9qOGu/yLeyFGpuvuh2czBY9ok0XdGIJ7gjxgBuEUkJx6goQv+s=
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
Subject: [PATCH v3 14/35] drm/bridge: lvds-codec: Use drm_bridge_init()
Thread-Topic: [PATCH v3 14/35] drm/bridge: lvds-codec: Use drm_bridge_init()
Thread-Index: AQHVuoBovxfdmrLJtUmljZ+7k+j1zQ==
Date: Tue, 24 Dec 2019 17:34:34 +0000
Message-ID: <20191224173408.25624-15-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c735d28-c798-4575-613d-08d788978f55
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|AM6PR08MB3560:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3560962C285EE14FFBCA0E778F290@AM6PR08MB3560.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
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
X-Microsoft-Antispam-Message-Info-Original: xYyvdLTWwqX6ZAsJAbCP1Frd/om+vqcaapIVWJ/ky4br0QXobeS4y6lJr0bG6NexC4d3/xAQAJ/iov6tJiwaiCifQ8ujjUO8+/z89KrIbeA86GAUhkJIAoOATMuZ5uwyGUNT65LtiDynetw/gSdyfBgInUhDxrnu2DutR07lk2f2nubCdo99xMmxLo9n7SqupIreKp0Tbl9GtF/ZgFqc8VK3dSA7bJBg+GvVZFg67U4RNGvyObgQx1ZiadChRuglF2Hgq2xU0b5Ucf4wBdRHhAiK2CSonXKZIUVc0Dg2F6J0Di5OcWitt+i/FWR2aAG/E+Fr8SkGBd1WJOlM8/M2hiYjjYVDGTpmci6/BnzQvVBgMV9P6VlzU5awqSz6sT4iDb7H2zkB+rVqikG9W3jP3rxPz/qbnEVfYrkwG7VQGJEexu08f9NBu5GA/HOK1qWI
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(26005)(107886003)(8676002)(54906003)(36906005)(186003)(316002)(86362001)(336012)(2616005)(4326008)(8936002)(81156014)(5660300002)(81166006)(36756003)(6506007)(6916009)(70206006)(356004)(70586007)(6486002)(6512007)(2906002)(478600001)(1076003)(26826003)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3560;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fe05137c-8a34-4a60-73fc-08d788978a48
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z2/OvZSLJtEJtlcjedtFt/ICfZUxsmUpqq78fy2EU2msxL0GAf181wpsfY7DLdViUxR0vJxlFv+OoOFoP9uVXwgccXwnb/afpW2JVP/h0rajXTZh5+LNbzWj9d1rRJbR9xk6Z+tJjvAdXlAOpe9iaMRHWF4HWt0ZV/RehTtfe+Skx6QrqtBjQlS5y8tNU/3ue5mER0cd+CjaODqL8PzjhQy8WfZYseSUcUJLEizHzS1bajQF5PAe2/5NjnnHit7FdlZPRUlHGBA/s5fohRQHt0KjLi2eZbnZrHNR3ppOM05YBtYGG/OXjR0nfr6LZnguX+4vRCJNdBfuhBJ1TD3b0KprrNHV3pGpPLb0MGMNNtAByx3joRTmvnn8K3vMzt+PC+NHoO4uoxFf+2lRpF40dg9rg/Sow525M+oCBL15j9d9xo+eEOxzirHWC/aZHpHm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:42.1620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c735d28-c798-4575-613d-08d788978f55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3560
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
 drivers/gpu/drm/bridge/lvds-codec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 5f04cc11227e..3bdfa7cce6d9 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -98,12 +98,10 @@ static int lvds_codec_probe(struct platform_device *pdev)
 
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
-	 * but we need a bridge attached to our of_node for our user
-	 * to look up.
+	 * but we need a bridge attached to our of_node (in dev->of_node) for
+	 * our user to look up.
 	 */
-	lvds_codec->bridge.of_node = dev->of_node;
-	lvds_codec->bridge.funcs = &funcs;
-	drm_bridge_add(&lvds_codec->bridge);
+	drm_bridge_init(&lvds_codec->bridge, dev, &funcs, NULL);
 
 	platform_set_drvdata(pdev, lvds_codec);
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
