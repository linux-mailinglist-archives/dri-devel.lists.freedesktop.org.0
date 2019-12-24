Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109812A746
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB15A89E8C;
	Wed, 25 Dec 2019 10:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0D46E353
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBlGwLh9pKkOUqEM2641n+ym25NOlv35DCAiYqvltQI=;
 b=4EmgPT0G++Gvq2ROwttsAoxiWG5O6KaS5hAtMzX8Nro2ewUSY8LdJyOVfIEu52+itGKZCx2pOuwmTJqd3gtALumoBjT2vmpm5840nO3FETSlnfeWPvy/IMenP8IApdW3ti+HR8C60lMETqcy7TrQugAaRKNssEcRPqRFCR1BYlM=
Received: from AM6PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:20b:c0::33)
 by VI1PR08MB4368.eurprd08.prod.outlook.com (2603:10a6:803:fe::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.17; Tue, 24 Dec
 2019 17:34:38 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by AM6PR08CA0045.outlook.office365.com
 (2603:10a6:20b:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:38 +0000
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
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:38 +0000
Received: ("Tessian outbound 121a58c8f9bf:v40");
 Tue, 24 Dec 2019 17:34:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c42846624a921ba3
X-CR-MTA-TID: 64aa7808
Received: from bce15b33d58b.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 787EFA2E-6617-412A-A6F5-81D8DC82D241.1; 
 Tue, 24 Dec 2019 17:34:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bce15b33d58b.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxrBUvy856iZD5BUZQ3KVUjnSUA0wd/i1M84tw2X/wGpF3XSUMYc43PCHS/Di6pV84vvSdsC3fQmrWUT6YKiFz2Ul7Hh04TRAsGS/3+CZqYr2dj04OdYtamAFO10oMEcGqhFcANF6+JkzQT8JvfXIgH2/yf0KQbhlvRv576xvVeGIYQLLrKrWGyiNzcoPhxbIs3HLoQQ0/xlJfyooxVzFa+mpA7nKeajLIZxmkHSC3j8bkQOyHXb0s/90u/U742VLpEJgzUpNqwuKNdxgFPZZXJKGFued/9w0JwHYO71Dv6s15v9IKGhA7fikuiEPkd75k5ZAHcZvCG5sfdAiM+jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBlGwLh9pKkOUqEM2641n+ym25NOlv35DCAiYqvltQI=;
 b=nZTrtRoyM3ry6pNtbaJ0NB1Vf3sUhpVx50CmwlgaruJGZEqYg6DMNXGyLvqth8xSLaxIJhvOGYM2I0DzydWjio68uhCH1ZpzFLhZKblufEOqaHuUEkTlFk6NnXGe4KdsYHytJvzeDx2+kHNBdlhM3JhKnGlI9P1nmfZiYAjUyQr8FTyERffmPVdvx7j34VDdQg6TdzBlobcKoaFnDGGlVGRbID+ZpXhakLlTi/oDlekmhP05bVe2d2yZoJcngYz1gS3ht4nj+5KTSknJRolH+KNIMn+XFLsEu/1b5SLyyzjI4tJ33E4q+NYL1il3YSCzJ7Cvee4yPlN5OUF8/W7GRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBlGwLh9pKkOUqEM2641n+ym25NOlv35DCAiYqvltQI=;
 b=4EmgPT0G++Gvq2ROwttsAoxiWG5O6KaS5hAtMzX8Nro2ewUSY8LdJyOVfIEu52+itGKZCx2pOuwmTJqd3gtALumoBjT2vmpm5840nO3FETSlnfeWPvy/IMenP8IApdW3ti+HR8C60lMETqcy7TrQugAaRKNssEcRPqRFCR1BYlM=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:31 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:31 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 12/35] drm/bridge: cdns: Use drm_bridge_init()
Thread-Topic: [PATCH v3 12/35] drm/bridge: cdns: Use drm_bridge_init()
Thread-Index: AQHVuoBmb+v7/Y5W6kugghe/aJFluA==
Date: Tue, 24 Dec 2019 17:34:31 +0000
Message-ID: <20191224173408.25624-13-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6d5920ca-240e-46ab-b438-08d788978d25
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|VI1PR08MB4368:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB436845C585B2CEB774B12C188F290@VI1PR08MB4368.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:669;OLM:669;
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
X-Microsoft-Antispam-Message-Info-Original: MgRUh7Kf13GGL/BvOPIgx9DLycLZsGRoVcFqt3DGWPX+59nPDHMe62j/jarvBHWGuzRj8uMK5qSTRL0Xh/QciGSDY6Sc1oSpHMJhhLAt5UG0jAInal74vQU6CZ83b7fRe9OjCDw0pYsmK1/a8DLzzKRSIwNlxgmeEtIZLffhc2rbb89IILTx+i9jHpjbGE5KVwzzbEpRa+Hk8psse6DxVBfUqF1ECar3WEFBJzn+vtUqGhv+hIXEaSd1bTKxH1ShRKyT9qGgwJf68oTPJaGntJnZmgnj2hizeCgF5Fd5MFhz6AXU4zPhhqOtxukqhNINfQRZQ5Dje9+21dFMoK+2Z/1VIHhA65kQyrDv8PNtYWK7ooPPdaJryBbx3XVHzOEAArFvNV2GrcyHYk9GV/6+QwT8FzGHDDG5VK2LJi1qKywkQ7FnL0GuVQvK9i4Y3eVn
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(199004)(189003)(4744005)(70206006)(70586007)(316002)(6916009)(478600001)(54906003)(6486002)(4326008)(5660300002)(2616005)(86362001)(26826003)(186003)(8676002)(2906002)(336012)(6512007)(107886003)(81166006)(36756003)(36906005)(8936002)(6506007)(1076003)(76130400001)(81156014)(356004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4368;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ffcb7b9f-8597-4628-b390-08d7889788a3
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2GC0zzDZIFu5CJgMBMhgDDwftc2V3FQ7P0N95y6VlSv18FkhMnoiuXbJRe1XZIpVbtoFWCPaSyMtbyBo2esdklmk0uD19geArjAwdlld1pW2njPZ0vJZRGh8ONtqLS5wdgdP+HrCsqDSZSgGiepfY5NEKVuUMs7Bc34QRFYXTMHHmaEhVkcQCAijvKn1YUa2VWoyCPFSv9R9eANA7vru4MARyKhoRELvZENmFtS66KdJcIBZz1hnsrelPrc3XyngM+s7zihymcBZzYYWN8GNyYH+xNwfTICCQjCQZeaors4rEGph78bEZ85wPWxRlhuh2MXnYbaU1emCnUMIdgOoEkJjLCtZZ3oL1sXc7tXUNj6o+1T5RcCd7RfvrcZCAwKy0x7xqx373UhdcsxQ7UCSbksuvj1BAomFsHidQic/VdRLFQ9zxK3k6mL702ai3ch
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:38.5091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5920ca-240e-46ab-b438-08d788978d25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4368
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
 drivers/gpu/drm/bridge/cdns-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 32863e3ad537..15999c971cd4 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -1233,8 +1233,8 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 	 * CDNS_DPI_INPUT.
 	 */
 	input->id = CDNS_DPI_INPUT;
-	input->bridge.funcs = &cdns_dsi_bridge_funcs;
-	input->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_init(&input->bridge, &pdev->dev, &cdns_dsi_bridge_funcs,
+			NULL);
 
 	/* Mask all interrupts before registering the IRQ handler. */
 	writel(0, dsi->regs + MCTL_MAIN_STS_CTL);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
