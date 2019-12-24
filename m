Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2A12A74F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2936E362;
	Wed, 25 Dec 2019 10:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150081.outbound.protection.outlook.com [40.107.15.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42016E357
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v53aWVHznm28DhdSWj+bbqsUrhZa7rN2Ijd6RKwk5wA=;
 b=XuSO4xBGDbB7LXEb+vrTezudWEmTrE944SQnaANZ5i+2gYCuyZWfda9D1CXrUvowLs+kHsc5tTMOCF/RpsTn4WZIfzXCA+4DxtyKGr+4Lx/r/cda6douNHIub6yE0w9rFynu8IJTJukA9sO/ftF7S0J2fNIQ6Hsw3K4dpzp9aQc=
Received: from DB6PR0801CA0050.eurprd08.prod.outlook.com (2603:10a6:4:2b::18)
 by AM6PR08MB3670.eurprd08.prod.outlook.com (2603:10a6:20b:4c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Tue, 24 Dec
 2019 17:34:53 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by DB6PR0801CA0050.outlook.office365.com
 (2603:10a6:4:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:53 +0000
Received: ("Tessian outbound 0eaff1016ea4:v40");
 Tue, 24 Dec 2019 17:34:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd98a4721141abbb
X-CR-MTA-TID: 64aa7808
Received: from c54502d9e00b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A07D49C1-6E2D-48BB-B09A-0F904EB7F8AE.1; 
 Tue, 24 Dec 2019 17:34:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c54502d9e00b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjxlcvDZYL1YzIgrdxpjtdDaeYpApFWpaPcpp3NIh6w+K75Jsun0RaZljro1mAIc0DGrXjfZhez3nGuAFAUqvydIRb2+2OHwLhDN6vvL/Rg9NLTH1nxIfqjPautnWqprooEJRycWOUYAZb8LZHiOV7EfxLGa3wzkXQwbqB18N1O06eBkmicB3ZEjgS8dUKSbSi+zeGoN9pENB2FiUcsA64RIqHXuL/QOVE/c8L6yeXFzMo6wzm9MDbP/saLIlq6LHgCVcVsw4jLsSf1tjngF6SS1VKGNJiK6XWuCTceYa0XfwZIKuGm5f9l0POVVAa6LNU6Kmz5cOhmP9kCUraIjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v53aWVHznm28DhdSWj+bbqsUrhZa7rN2Ijd6RKwk5wA=;
 b=K/GQnUL1M/R/sGTR9Wcltu/BVLY/TO4XWH89MGi7KZ/0qGF3sDw1rkvAVt8kcSlD/6/LVXaIclCfxRi91FZ8d1h4vy3Uz27hXxTiDGpnV3jt+RiyKMM9x910/RRqStX98HdoOKPijcXeQCCdg3+ymckr0ORK9nWCZhmNiG/uIRgRq9riHzxKXipyu/TaVPy+56BLfBt2nZdfj9JJcSke/glVVEAEs92qSs7QRV9nfp4A8UJgAwbyVU3tSXQlLjlv0xepHLwoTxqSx7rJSUwb9ly85XE/wzKIVNHrEw9w7+mN8UhZmykZk+nRPzhcKAa+1lAq19xxsyWTSO9D2V0MFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v53aWVHznm28DhdSWj+bbqsUrhZa7rN2Ijd6RKwk5wA=;
 b=XuSO4xBGDbB7LXEb+vrTezudWEmTrE944SQnaANZ5i+2gYCuyZWfda9D1CXrUvowLs+kHsc5tTMOCF/RpsTn4WZIfzXCA+4DxtyKGr+4Lx/r/cda6douNHIub6yE0w9rFynu8IJTJukA9sO/ftF7S0J2fNIQ6Hsw3K4dpzp9aQc=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:40 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:40 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 21/35] drm/bridge: sil_sii8620: Use drm_bridge_init()
Thread-Topic: [PATCH v3 21/35] drm/bridge: sil_sii8620: Use drm_bridge_init()
Thread-Index: AQHVuoBrYwqF9kghjkGVCqsPYsD34w==
Date: Tue, 24 Dec 2019 17:34:40 +0000
Message-ID: <20191224173408.25624-22-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 36c1250c-223a-4548-fad8-08d7889795ec
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM6PR08MB3670:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3670E1CFF9BC2AE98CB2DC118F290@AM6PR08MB3670.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: eAvmc8C9AZsVS3I+UtFGtCDfgePTkdGv8pCYTz1MTYRuzhVsdHvNFiNc675kT1AtRDCrEcVNeM9yGIkj5u5oBTLQmf4g9aTVptN6goZ2qKNVMUst4vnHMN0qLQ0Bi4CqmiBwo8j263wRU0VoLohaYATGoBupjGALQCjGpoakoo//sQsPZQW5AdfSvFLzqhtWuOZYYE0Owp59H0qIqNMe3ovmOyCdk+YviItu+ZkXy1ZTYAKF+XS+v1cXaEZyELb4kb1Pn6Q6OAz09WyyAPFT8x0XLQCQZNjIgqrii0FkIigI/dGvNvqEnIdNpSjHRuh35faWFhYvx4+e2ScAKqb0A6kO3aUypC+7ng2+5rhdbO14JZ9uOjdmT9Qce1A6INadPeA9P97NuJoxvrPqaa0sDeq1c9aVBlKItNWHPYSTzP4dhi9MTB0X7QcsEfS+gQXc
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(76130400001)(5660300002)(86362001)(2906002)(6512007)(4326008)(54906003)(70586007)(81156014)(81166006)(8676002)(1076003)(336012)(6916009)(356004)(70206006)(8936002)(186003)(6486002)(26005)(316002)(107886003)(26826003)(2616005)(36756003)(6506007)(36906005)(478600001)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3670;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dbb96bda-812b-4402-67ce-08d788978e30
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMMaZY7IskguVxaaOM+kXqHWVf5XIkpIHRbruMWr0SR9nshfGmxf2JwqWsFR4z0zX0ljJwk4WH1joxaNqvIp7LsFpph3eFxImkja9FPFBrMT1D5ONq3B0NeR19HW9tiftEDTLhi8gqHUSiMJPAhs3Hi1YckN+7XOIusgZi3dT5gwVwnttwzoAohUGofYUW8V/nPIpvoD7CAt1FNmHIyCqboiCQyWIvfrOIWklzWdmqp+qR0OFIyYBU9BBjE+u3Gomg+5bsJ58UnxS6PgLozglbGn3kr49lUZ2Fz4hSdODaYUwRZLgxBQP9G1aKJcR36LFpbmgQ4EvO0KH60A8+/wnzNvvr7V1mbrWmqzeXjAhmnS7caC0W2df0yDsf+NPH40E0iLNEnXMbFrLNtkAWf55EnqjJLPiwQ3MOTy7xOZ2Irkc1pVEQltKmDUdtfGg0FA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:53.2369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c1250c-223a-4548-fad8-08d7889795ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3670
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
 drivers/gpu/drm/bridge/sil-sii8620.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 4c0eef406eb1..d67f9a844647 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2337,8 +2337,7 @@ static int sii8620_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, ctx);
 
-	ctx->bridge.funcs = &sii8620_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
+	drm_bridge_init(&ctx->bridge, dev, &sii8620_bridge_funcs, NULL);
 	drm_bridge_add(&ctx->bridge);
 
 	if (!ctx->extcon)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
