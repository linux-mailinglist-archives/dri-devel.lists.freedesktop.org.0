Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4012A732
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9989E26;
	Wed, 25 Dec 2019 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40066.outbound.protection.outlook.com [40.107.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B8989E52
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+RrGPwpgBCfE2P0PK762qmZkaVJiWeF2kTSJ4tWHP0=;
 b=3R0z8e8rIeC9lpvU7E1vKCcxmw6r+vL1CVwInjbo9vXsEyaPurypnwY2fH0f49Aig8lGN5r3xJ6kxLQdnVhXMy9ZTw+JPp6sATNxL+XUjS7tMc/3ASrEy/RzC6zM6i+rAm28b48GRvoTg+SWHrW/okDVMiMeIqZfz3sHyeKZtgo=
Received: from DB6PR0801CA0056.eurprd08.prod.outlook.com (2603:10a6:4:2b::24)
 by DB6PR0801MB2119.eurprd08.prod.outlook.com (2603:10a6:4:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:32 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by DB6PR0801CA0056.outlook.office365.com
 (2603:10a6:4:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:32 +0000
Received: ("Tessian outbound ba41a0333779:v40");
 Tue, 24 Dec 2019 17:34:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbb6c4108662efd1
X-CR-MTA-TID: 64aa7808
Received: from 64861fc03c2f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFD34FB0-0012-46BF-AC15-C4B8A8BD800F.1; 
 Tue, 24 Dec 2019 17:34:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64861fc03c2f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/PEai0hhkj29EqVGK4O5M/spfO7TRwashwJaM3Zy+HEMssTY9iNept2vwl26xA0YDgZopT2HpYNimTPO3xIWqdFVrZ9iYOwo8FhBob6mAoZnal8J94qLs7RBXsyv9TQIPYErfoSRzfVKxMku1MHkR3BSj7Xn+5P43d29ZjkHqHPPf+hBdnVO84OwpUBpV+qMPN0i/5PQ7k9pGZgxDoNQkLPcHDP4pAdLys1WY8bmWbxU8h9bqv10v3Lou8cfZVVNFh7Th+yb1ln0USsWS+kIYCaZvIkUjPZR9GN2ETGMsq7H4p43tWt1VIPKEH2Nxwc/bniVA1lw3VTdYfmq5dylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+RrGPwpgBCfE2P0PK762qmZkaVJiWeF2kTSJ4tWHP0=;
 b=oPDW1ALG5h52AfxxsFUKg8AJg+P0V9VXcXBw+ffhonCp97sHcO3/aUWJYfsXOpLeuronUjqssmpGlK5R0/dfZQ5Ov+OObGxit0TE6MBSXvyMy2uKYeGPgZdJ/8Fz0ubEXCOJiBqoZm8teRXbyCv2Gi27Fu8eQx8zJKhPzH52BGPtKf60+A00lhoslYbumWnoPNb+e0aCXQ17n0DBo7kayNAzcjbgfazX1j6eXgb+AIqRbMdtcHH96GVccmhmEu9YoLmJZxYyxvAYT4teb+Ey2ZYywYy5LMkksJJZpyiOrrvtaRKhdGyzGsA0aRFik0vVzGOy7pfWi7j2SR/TKC0P+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+RrGPwpgBCfE2P0PK762qmZkaVJiWeF2kTSJ4tWHP0=;
 b=3R0z8e8rIeC9lpvU7E1vKCcxmw6r+vL1CVwInjbo9vXsEyaPurypnwY2fH0f49Aig8lGN5r3xJ6kxLQdnVhXMy9ZTw+JPp6sATNxL+XUjS7tMc/3ASrEy/RzC6zM6i+rAm28b48GRvoTg+SWHrW/okDVMiMeIqZfz3sHyeKZtgo=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:25 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:25 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 04/35] drm/bridge: thc63lvd1024: Don't set
 drm_bridge->driver_private
Thread-Topic: [PATCH v3 04/35] drm/bridge: thc63lvd1024: Don't set
 drm_bridge->driver_private
Thread-Index: AQHVuoBhyechqLSWlkWGGz4EX7LiCg==
Date: Tue, 24 Dec 2019 17:34:23 +0000
Message-ID: <20191224173408.25624-5-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a851dbed-a42f-4012-5ff4-08d7889789bb
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|DB6PR0801MB2119:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB21195E32527F1A2E615768C58F290@DB6PR0801MB2119.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: L2uCWjO6UmcKGQGloYlxvXqt8wW0crdB7zwUBcNiuLK0Gcx1G/VsxFbyWrzKicoxcN+h/sXFks/O3iakWxShoX0KNpDvAzm7tHcdr9kIaW4e9k9yERdNvzWMmd4a7xyXnxp9y9OOL1o6jfa43CDdsr6GWJXucLaXPgNu3HZs3i0N89FgVdEMS0ypxU4d/GoRgDSRR02Nv9JVddOF6ir9pLxmIktLgubfwNOAomH1oRP+aSEDowvoL8Y/gDKrk6HESUFqiuwry92veFdDVSZT+gY38ZIzEl1mZJCcGTXIOFv+WGPuMRLi1SZ6mciSGg4ROF30e2lXpdGwUyBw7ZeeGirxKbedokIy+yC22VSD+m7Je1QVJtcO9mzITX6lOp8kH8jloAn8lcUbty/vowpM8AguvLkT9Ic9x66x5bmVk/+TMSB5u5VAm+fubL+jOrWu
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(107886003)(8676002)(4326008)(26005)(76130400001)(4744005)(6916009)(6506007)(5660300002)(36756003)(86362001)(1076003)(70206006)(70586007)(81166006)(478600001)(26826003)(316002)(336012)(356004)(2616005)(6486002)(2906002)(54906003)(8936002)(186003)(81156014)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB2119;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d4b31d2-d8e2-4d12-911c-08d7889783ed
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DS6KWKYbl28PrC5EGW83YU+6nINHDU/QSXWyfwzt3xgHrovsQQpQQgrjW3nW51Yp38kI7TGCLMslcV6qLsAVqJ1MqNjtAIKfd50gLSNxokYq3UBx1cS1vJ8FRD+CLV2OF/5FE6BckOWhsxo7qz2Dud28w1SGQIYDdG4YAxXyEjJSz+etk83J60P1DQZc0NQcwdNzk5pWdMbS+9eYrxQ7EZMlJ7lVwcJUFo/KS/XevoU/GMPeEX3+n4mEegMN8ND6/HQ65GoEiH3LXfQC0bUszUm4cgkBYPOD3EYOpVoh0DhH6hwcNr2Xlq7mS2Ef/293GnGWTRtz+haaznGvVaCS1nN++YuoivMk8zioCvUosu7MjEJGauNLzEe878jN/48zQWVjpPHUCBAQ1ArpiJ0iTPwsHEEhAblAh09+DPx7BT2H4t/7a9j6SknVd3oeJsYJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:32.7721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a851dbed-a42f-4012-5ff4-08d7889789bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2119
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's unused.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 3d74129b2995..784f4e4eea05 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -218,7 +218,6 @@ static int thc63_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	thc63->bridge.driver_private = thc63;
 	thc63->bridge.of_node = pdev->dev.of_node;
 	thc63->bridge.funcs = &thc63_bridge_func;
 	thc63->bridge.timings = &thc63->timings;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
