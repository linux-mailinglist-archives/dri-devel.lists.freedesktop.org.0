Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358BA12A731
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB3689F08;
	Wed, 25 Dec 2019 10:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828F6E359
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8GXw6v+q/NY8DJdmPHOebrg0bk/YbknsMy1IZGdVos=;
 b=gbgH+8ZZx49Tw9NNtPT6wy8LhimVjyZ0qprs7Lu2PjrshEP958uMkF07hoFQs1+J5N/EBtLKWxYaaOoo9jovGddvlZhQguX4oFTsZIO/lrlP/hKZXQJ0hSL0lPbQsMqE8RDc65El1TTowY/cNb15QrhL4Xkl1OSG7mVaO2vepdA=
Received: from AM6PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:20b:b2::13)
 by VE1PR08MB5054.eurprd08.prod.outlook.com (2603:10a6:803:10d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Tue, 24 Dec
 2019 17:34:41 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by AM6PR08CA0001.outlook.office365.com
 (2603:10a6:20b:b2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:41 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:41 +0000
Received: ("Tessian outbound ba41a0333779:v40");
 Tue, 24 Dec 2019 17:34:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10088ed5be068d1e
X-CR-MTA-TID: 64aa7808
Received: from a20093a6efd9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47256F7C-3E27-478B-BABE-4AD1BFE37FE4.1; 
 Tue, 24 Dec 2019 17:34:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a20093a6efd9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BS8QHrJAXBO6hN2FR6SL+AuJR68j5R4W2AIzZCPFuIXaep3tCnak2HyAvulfQbb5wqKHqIpquTE4z2r9vIff4t4CL+ClMbe3rEF956LdA7G0UHLmErFK/mN3F3WvV/PA4TyjKjb/gFEOOY79RxPeAQp7HEhNGqFkeMvGwvb8y35PojKbBd652A+ZpbViwtuINWs263d7y5BYmAL8Riyr6kUTDmv7CWPgzVGSgwS89HuVW/YasIpzu6waRDoU4yG1MMpEpwMc0kX5qxpCeIiZ2z157eVsNfrdLUI8WVbeHg6HGKOfYp9YeYVObFKDwQjdOivzdabeGbtwYdcgh8EAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8GXw6v+q/NY8DJdmPHOebrg0bk/YbknsMy1IZGdVos=;
 b=kuVKWNBL/R7dX4tunBsUl+PTLV5Dh7Pl95AZbh+zBjp7yd6xVYMrari3jD2b5PGFDRtAhHL03Q2oqTIGbNvYiCMn6iy/9bYFZmxTYk+0jkIq+U+Nq1HvIH1iWSPuhQ0xcKKEtnDIdcyPK/ANbva+5ln83uk2PwoKG3qaYpywO0oK3cbTsazjLn3NyY9uhhRZ+5WENWO9/57zfDBacQ66iTDHO8ZvhUkhx8rS1TSdvYwFUA8sdpYCBBfjipLDMfSWK6r7LyEUoaPbPS5nEe26wNGfp14P7dTRv5RVNb7zcCel8qEgUHkoMSZIZMPkc7wOfDeBi0Sx1gvp5Pr9KtnEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8GXw6v+q/NY8DJdmPHOebrg0bk/YbknsMy1IZGdVos=;
 b=gbgH+8ZZx49Tw9NNtPT6wy8LhimVjyZ0qprs7Lu2PjrshEP958uMkF07hoFQs1+J5N/EBtLKWxYaaOoo9jovGddvlZhQguX4oFTsZIO/lrlP/hKZXQJ0hSL0lPbQsMqE8RDc65El1TTowY/cNb15QrhL4Xkl1OSG7mVaO2vepdA=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:34 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:34 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 13/35] drm/bridge: dumb-vga-dac: Use drm_bridge_init()
Thread-Topic: [PATCH v3 13/35] drm/bridge: dumb-vga-dac: Use drm_bridge_init()
Thread-Index: AQHVuoBnmIESwf0th06/ctvQqHI7lA==
Date: Tue, 24 Dec 2019 17:34:32 +0000
Message-ID: <20191224173408.25624-14-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a25d34b0-a1ad-4b43-d7cb-08d788978ec0
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|VE1PR08MB5054:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB50549BF7A9C5B1EC255D35F58F290@VE1PR08MB5054.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:46;OLM:46;
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
X-Microsoft-Antispam-Message-Info-Original: AwQefWC9xvOeB9znZGMWlxH+sZgiJBW8J3u0P0foTGF8+OYYzqiyNLu0815F8ycKGsro0WKmr3UyyhTKXg6I0zOs/AelXaYrVoDZM3tOQLQ3qmYinN+ch4n6a4U5w3FV4ukVBWVN3+lixUYTFc6wB91eFjErWkhdGIoFkK/9/WkPfsfZZrNGKnfv37cGVtqSlfhbqlajb4Z7pPkSB528RiLE21gTIYEbasPyOzVQaiPBFfEjJDp8aXwMg9ji2Y4jZ7lNddzVhiKriqS2O3CmbFUfo1p+5WxXMd0cYe3qV3gijuOFLsdF9e0g2FQ45a0kHsJNpu3I/gLNinittDgV/TaslrczW7KexYpbZ+8R/8+qoLItQ6flNLRvVou05NXA/NiZnyLmB2Cole/rOE62I4EFZguQ/ej60azKj0ldMQqiFS+TSukB88S5LW+9BCAY
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(6512007)(186003)(6486002)(356004)(81156014)(5660300002)(8676002)(81166006)(2616005)(36906005)(54906003)(316002)(6506007)(1076003)(8936002)(2906002)(70586007)(26005)(76130400001)(107886003)(4326008)(336012)(4744005)(478600001)(6916009)(26826003)(36756003)(70206006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5054;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a4fcc757-37b3-43aa-0f61-08d788978918
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPzCrrihfWXGvg9xljOAVr/tAGWgCEEeuWBpQKQuMu/P6bWzk2CTLL9mCe60jWq/X1fpxVhZxtVdSfPEy3WvZWjVgAW7e8h4zI453L+75+DRo01uXpZTPRf113bbrHRINHqeZM36z8PhqCB7RMADlxQ3/X+Uzw6vyfOHP7SisOk43MT7s0s+yYmgNMayYQ9K1XDMQfUynilui4Jtu1hdGkHiV0R7IALgBoa7fq64yvrEYvHrdCF8RYYDGkKofJtF2HThEGrpbzEE27ZqYXkrFn62vzSIipxW/MEw/guNdiDszmCKscTdB9vBV5QXF+lXs2/+V3IPblmrm0DR0O+XaD40PWDjk8WgKqPBtLxheDDjIfGK+g0wBmxVZHNKk8PivvEFBSTn+1Yn3K3mzE9uVFl0PvTG3RJpEkJOwtZo1IHTHRuos/mtlyP+rsX2+Lf1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:41.1595 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a25d34b0-a1ad-4b43-d7cb-08d788978ec0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5054
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
 drivers/gpu/drm/bridge/dumb-vga-dac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index 67ad6cecf68d..a737042a350b 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -205,10 +205,8 @@ static int dumb_vga_probe(struct platform_device *pdev)
 		}
 	}
 
-	vga->bridge.funcs = &dumb_vga_bridge_funcs;
-	vga->bridge.of_node = pdev->dev.of_node;
-	vga->bridge.timings = of_device_get_match_data(&pdev->dev);
-
+	drm_bridge_init(&vga->bridge, &pdev->dev, &dumb_vga_bridge_funcs,
+			of_device_get_match_data(&pdev->dev));
 	drm_bridge_add(&vga->bridge);
 
 	return 0;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
