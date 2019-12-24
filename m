Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DB12A73C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33789C0A;
	Wed, 25 Dec 2019 10:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A576E34C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p78FT+8NCxCE/ne/FwrX9Ll2HlL2RYRDQI2jTB6aGP0=;
 b=dQf9JZx5l7oSBjJh2/vLq67eedZcZMMPoWNjq3GkBJ5LlOCOuZpqWWeSpwB9CPC4Fhm4o2HHj5OVF8n83Zk5TJTYjute1bw3FVXYkeuZm+FHUBBitld67WhiZV21183GoboBgm9ExbG3gDpsDeFUStXbozcYRprf1H0dYAgfwHQ=
Received: from DB6PR0801CA0046.eurprd08.prod.outlook.com (2603:10a6:4:2b::14)
 by DBBPR08MB4630.eurprd08.prod.outlook.com (2603:10a6:10:d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:55 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by DB6PR0801CA0046.outlook.office365.com
 (2603:10a6:4:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:55 +0000
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
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:54 +0000
Received: ("Tessian outbound 0eaff1016ea4:v40");
 Tue, 24 Dec 2019 17:34:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20224faac2e31d1a
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.12
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A26B0EBD-2D24-4187-A44A-A79195013849.1; 
 Tue, 24 Dec 2019 17:34:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bdd2edd0996c.12 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4U+5/u71dJYJ1w67sVJSQT4M9TJdRfAimyaecvbEPmXOjNu0mP9+0iYj1e69Rp+dml1CdmcY8Mi1E6zX3LTCNYN2ecL1zEW9UWHwJwnjUf2T3CNexKHhZCTtmLW3e9Oa5HHIYKTYYSVoLVaxHGm9OPLFjMvNX2Db4sNPrZ5p4HfVq/T6HGsS31MtnTF08NkkatGx70MyrS2y9kw3xHStI3AibpuAbbV4AoVC6VSiNOlj8SoApANXK0tpGwcpXUaL6KHcxwFxRdtnAuzXzue5edaFR0TFPLxwl6GiRTlCsOib7a6jKND97lpqwsbpr092YprfDBU95QXgUvBhfevvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p78FT+8NCxCE/ne/FwrX9Ll2HlL2RYRDQI2jTB6aGP0=;
 b=YjKu4293hRAgopKzIiYwaxIAVL/OYs95mOFlFwX/jc9glqZBnW29aTlURq61OWoMTbuTY1hecAPKutnUrgSc9qURhJAyuK+a6rjIWz4zVBK6GXFWIFoLqpFGmEi7WEDE/oSN6+stF99eKf/ZZcEqRDTGazMM+PubCFiKZxq/NjXr+kEYkBMRFlS88TVP0mxNL7ql4K78TY3eZgr73ri7Dmi9hwZB6Jb3mEosKHIkrxRQELMSlDu3D4tM9fs/zlV2QDt9yMgZ/ThJ/1TnAA4UAW68Ux650N4xNhxs41pK/OQkKD4lHcfmTNPA5ZzZuQSZWUwcJSVHczSMrEq+FzRvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p78FT+8NCxCE/ne/FwrX9Ll2HlL2RYRDQI2jTB6aGP0=;
 b=dQf9JZx5l7oSBjJh2/vLq67eedZcZMMPoWNjq3GkBJ5LlOCOuZpqWWeSpwB9CPC4Fhm4o2HHj5OVF8n83Zk5TJTYjute1bw3FVXYkeuZm+FHUBBitld67WhiZV21183GoboBgm9ExbG3gDpsDeFUStXbozcYRprf1H0dYAgfwHQ=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:43 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:42 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 24/35] drm/bridge: tc358764: Use drm_bridge_init()
Thread-Topic: [PATCH v3 24/35] drm/bridge: tc358764: Use drm_bridge_init()
Thread-Index: AQHVuoBtj+SJ2aa/306pQMxDTmf0rA==
Date: Tue, 24 Dec 2019 17:34:42 +0000
Message-ID: <20191224173408.25624-25-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 946ad457-ab64-442c-5933-08d788979743
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DBBPR08MB4630:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4630F9D3D6119B47596943AD8F290@DBBPR08MB4630.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: uQi5Rt1yVJ6ZUQ2Boshgl4tbo8aRLhPnBw7tNQtOq3QsZmp4Ym01b4kJDXNfIVAGZVDm4gRpMxzQS916f6Gt6JM5pyAT3abU7kle4tSmixyrMLp6hr5GcTahGVFhEcX7wgEXkjtXCjJ6nLIylQfW6dAN7YL7EjbQ6BxhXOCD6Xpju+b5n9mlJZTZaCkIttw5ks7NYqaPUpPIBYjQ5iJzoLmBOKCZLzfbqNqz3ry170yZV2QZ4jn9d0RogEsCvvLYMDIZXFVsc/sZE4AfkDp4TBg+uJXIviF55q+8Kdzl02NLD/5hVH2F3zFL1X1sRl8YikjG+guxG9nacgNQIV4xernoQEnpUO2pgGfQ0offk0PvEwg3P5jS6HLkcivtEpegdHG1Vdga8in2kkBM5xeYe4ycYJTExMmruNM/L0UxmgXeZ6xNUR44NHIYev4SgXQG
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(5660300002)(107886003)(8676002)(4326008)(26005)(76130400001)(4744005)(6916009)(86362001)(36756003)(6506007)(70206006)(1076003)(70586007)(356004)(478600001)(26826003)(81166006)(316002)(336012)(2616005)(8936002)(54906003)(6486002)(186003)(36906005)(81156014)(6512007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4630;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5af10545-ec85-4f44-aa98-08d788978f92
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWzIw0sPaACCEN4OyQjXhPb3FlGBiVa6EaED/tMH4TgSdVCKDJ9IZsjN40n8oMVeE2uJMlJTz5I3/vxeO53Yak7FqWv28TPdc1Hgq4gDLfgSRMDawpCclrh2nLJfoVjTA9zp9HAYpqm9pqnYeciLH1yg7p/wt/lA3us4AhzaqckdpcmdWHKVeHCH5+ZAx+eEjhkH8bWj8zbliHmC1y31i6BHNw25sEZvGsLs6gjvLX/IX5jFtr77bhGmC57kJWlzJ1EJIwCRNfqbljF+NEPoqSMMFYG+1Vl5vfLTFjsd0k/ypY06qchPow+4o6VdzQEqc+fx9BDGE+6lsd+yAFxCkJwYQpK1dtODBFYOrsdGJTBsEOLgWy1sSNQro1W/L/3q4/mY7zzG++9xelGQOATnOEzYC6laHBHCHjTWM+u0wYzSCF67Sn3rbpacLc0dOUrP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:54.3487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 946ad457-ab64-442c-5933-08d788979743
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4630
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
 drivers/gpu/drm/bridge/tc358764.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index e35e17b1f396..5525f530f2a3 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -457,9 +457,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	ctx->bridge.funcs = &tc358764_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
-
+	drm_bridge_init(&ctx->bridge, dev, &tc358764_bridge_funcs, NULL);
 	drm_bridge_add(&ctx->bridge);
 
 	ret = mipi_dsi_attach(dsi);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
