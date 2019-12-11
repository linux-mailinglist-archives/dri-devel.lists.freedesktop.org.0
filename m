Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D99311C89D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1F46ECC8;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40074.outbound.protection.outlook.com [40.107.4.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F376EAFC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq9XQt4F6O2c/urpI0wY8DTpXUVR6IgR0M6Sy0mhZyI=;
 b=XQDH1w7KhYTDnhoSohIwW2fHvNOWG2O9fbFVloT8LDUcQ3gwnKHOcuxdgrVhj1IR5qmOSYLguIpAjkneqqDOCjzkzC8kyqKHGFyisCS2oPmV+2nkgi29R0Pa552AnAaNVrB7G7kSZ6er9DPGyqNyG5pgO5GCbPlPhActbWskFVE=
Received: from VI1PR0802CA0020.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::30) by DB6PR0802MB2134.eurprd08.prod.outlook.com
 (2603:10a6:4:83::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Wed, 11 Dec
 2019 10:30:16 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR0802CA0020.outlook.office365.com
 (2603:10a6:800:aa::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Wed, 11 Dec 2019 10:30:16 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 10:30:16 +0000
Received: ("Tessian outbound d87d9aeb44be:v37");
 Wed, 11 Dec 2019 10:30:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 529a9642ce2239c0
X-CR-MTA-TID: 64aa7808
Received: from ffbd3846894d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5E80019-7DD4-408C-8FCA-9CBC621FE36D.1; 
 Wed, 11 Dec 2019 10:30:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffbd3846894d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 10:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyT2eAuapar3vVnsizGRbWGN9wRqpCoJvPf+vevqSgJ9FTPjE37C6Ftj1Z16Da6OEZuB9nJvxlgFC2/1cOo+7yIzSYT87HaIo/vT8lCX0ysCip7Tz2pqjcWzzCVN0ehqRPMOy7f5SFu/8tmwnO7s7TRV73jK6YcyltXdvtEodvPhsGQ5OeupOoLtVlOwnExvtOu+yWb4RP3C39y+jmZOQmgkIrmmvx1wmr+jlWYMhZLCENoJi+xXyk2PRzmLYk0qoWCp2INhEcADTLvH2u0bHBog+kPkJhOkxQ8N04papn68o9HSb2v3ctmNbMRCgvEDPHm6gNFSuPxsWlern8E4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq9XQt4F6O2c/urpI0wY8DTpXUVR6IgR0M6Sy0mhZyI=;
 b=bsmCSGfoutEmlEzsxTv415eCXY8JNcAeKyRXmtO33t5pNjQJwBE7skEkb6MZQoSqC77A5KcN7o2De0GRvFZHwhnrQCPeOlZB7gn9w3fS9sgwdI3OGpYdsHa5hQvWQhxxg9lZr1hBBWXyVqvn5AwFXVtOL/NLNK0OnRnpp6d0lt85b6KqH33C61yafhd+HFl7UBElhORxW/iety5t9JFQnVcNDDF3RXOMe5Rk+56Tm0NlgvUTh2Ts8voAmX2wBzRxO+UnKBpkVfen6l+QLpwVz5iIUBi6EgNuRwN6B75hPg505Jktk5zbLepjBvTPQrLzX6CJMowzEXt/Jl14CF9AUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq9XQt4F6O2c/urpI0wY8DTpXUVR6IgR0M6Sy0mhZyI=;
 b=XQDH1w7KhYTDnhoSohIwW2fHvNOWG2O9fbFVloT8LDUcQ3gwnKHOcuxdgrVhj1IR5qmOSYLguIpAjkneqqDOCjzkzC8kyqKHGFyisCS2oPmV+2nkgi29R0Pa552AnAaNVrB7G7kSZ6er9DPGyqNyG5pgO5GCbPlPhActbWskFVE=
Received: from VE1PR08MB4877.eurprd08.prod.outlook.com (10.255.112.210) by
 VE1PR08MB5280.eurprd08.prod.outlook.com (20.179.31.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 10:30:09 +0000
Received: from VE1PR08MB4877.eurprd08.prod.outlook.com
 ([fe80::c4ca:94b9:e70b:d68d]) by VE1PR08MB4877.eurprd08.prod.outlook.com
 ([fe80::c4ca:94b9:e70b:d68d%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 10:30:09 +0000
From: "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>, "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 (Arm Technology China)" <Jonathan.Chai@arm.com>
Subject: [PATCH 1/2] drm/komeda: Add basic support for D77
Thread-Topic: [PATCH 1/2] drm/komeda: Add basic support for D77
Thread-Index: AQHVsA32Uv875OZazUeRYBkr7MrbJQ==
Date: Wed, 11 Dec 2019 10:30:09 +0000
Message-ID: <20191211102948.27117-2-tiannan.zhu@arm.com>
References: <20191211102948.27117-1-tiannan.zhu@arm.com>
In-Reply-To: <20191211102948.27117-1-tiannan.zhu@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0153.apcprd02.prod.outlook.com
 (2603:1096:201:1f::13) To VE1PR08MB4877.eurprd08.prod.outlook.com
 (2603:10a6:802:a4::18)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Tiannan.Zhu@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab100cf9-23f8-4066-0d67-08d77e251d22
X-MS-TrafficTypeDiagnostic: VE1PR08MB5280:|VE1PR08MB5280:|DB6PR0802MB2134:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2134998DA487B675487A24ABF15A0@DB6PR0802MB2134.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:334;OLM:334;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(189003)(199004)(5660300002)(1076003)(81156014)(36756003)(6512007)(71200400001)(6486002)(6636002)(8936002)(55236004)(64756008)(81166006)(6506007)(66556008)(66446008)(66476007)(8676002)(86362001)(66946007)(52116002)(316002)(110136005)(478600001)(4326008)(54906003)(2616005)(26005)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5280;
 H:VE1PR08MB4877.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ADlVIZ12ri9qDW2jBrnWQ06r3c043Lvk5c+3/dDQITHwhxGUoVaD3eKAxiJFQsWiDEDjoCD5yM2OacPI48QojWfRo5csiSHVAIjnBcE1xyvVaCRZhmYCjFufOlqbL93FeR5GwMEQwyOA9YBLjCIbVlNa6Veb4idW85vk0iNPPFvC/o/0fGgbGDmQf5hVgag429ryPiidU73+YaX0ritzhY8nI96ByFOW1lONlAOtHTwi+ssYCQcEeSX0COcrvpr0U/5FT+Xgy7n8YXEQKA/vfrSG9TNg3JrQea7IZs3FMs9EXkvOydVAYvl322OJfLA2fzwVmGxvlVSGAszSXLyjl/hEbBeJQEiqFComqY2kTEiGtz1CUBnqDKf3EnaUF6EmL/InOF9AZFExZOC7i4YUm2kC1LmMDlCyi8BfVkMRawAgJcZ1j3dYwIFDvhwa0Wc6
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5280
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tiannan.Zhu@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(189003)(199004)(2616005)(76130400001)(5660300002)(6636002)(70586007)(6486002)(186003)(8936002)(70206006)(6506007)(86362001)(81156014)(8676002)(81166006)(478600001)(110136005)(316002)(2906002)(6512007)(26005)(1076003)(356004)(54906003)(4326008)(336012)(36756003)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2134;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c25a4102-d052-47af-09e1-08d77e25189e
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHmGXOmBsVDYhy+fVF0Orl3bsVbfJGBkXhAZ7A92oZpXDGYk4KG5GzgX7XdiApGvhLQfyACvEL6Q+q9v+NV9RRfwIE94kSUvE0c5GIZa7W1xKEJWqGgTt+Eicr/Hug08KUKxuZK5EuGNxIS3NLbBdRrX0MokQ19BZ61bg84HLryPWf/30tchymkxRB9tZpZQEvEmaXk4FBBcB9ojs2BlXBKmfo3gkNyuDkng28h7MlWKtvnopB11APX4JzFQBrIKaUEnrb6tUsAcdmIQP7gCN70ni8SDwfcqBCmvbdEZcFDEaSz4HJkHtDvxNI7WlAuJD5cru4nVmf/PYpISquFtBZJhQnmCv7SWLRCmFJa4FZJxy490ZJxCpKnBbLLGS3XESL8aSQtDiIZ1ODwmgCA8yapQss8jjmujY4GFbECbnUh3p71ii21n9x9B1xrWDQmF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 10:30:16.3344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab100cf9-23f8-4066-0d67-08d77e251d22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2134
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: nd <nd@arm.com>, "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make komeda driver can recongise D77, D77 is arm latest display
product, compare with D71, D77 support some new features:
1. Crossbar: adjust every plane's zorder
2. ATU: Asynchronous Timewarp Unit, which is used to support VR/AR

Signed-off-by: Tiannan Zhu (Arm Technology China) <tiannan.zhu@arm.com>
---
 .../gpu/drm/arm/display/include/malidp_product.h  |  1 +
 .../drm/arm/display/komeda/d71/d71_component.c    | 15 +++++++++++++++
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c  |  1 +
 drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h |  4 ++++
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c   |  1 +
 5 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/include/malidp_product.h b/drivers/gpu/drm/arm/display/include/malidp_product.h
index dbd3d4765065..cbde47f06c9f 100644
--- a/drivers/gpu/drm/arm/display/include/malidp_product.h
+++ b/drivers/gpu/drm/arm/display/include/malidp_product.h
@@ -19,6 +19,7 @@
 
 /* Mali-display product IDs */
 #define MALIDP_D71_PRODUCT_ID	0x0071
+#define MALIDP_D77_PRODUCT_ID	0x0072
 #define MALIDP_D32_PRODUCT_ID	0x0032
 
 union komeda_config_id {
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index c7f7e9c545c7..ec96b69a5ade 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -1347,6 +1347,21 @@ int d71_probe_block(struct d71_dev *d71,
 		d71->glb_scl_coeff_addr[blk_id] = reg;
 		break;
 
+	case D71_BLK_TYPE_GLB_SC_COEFF:
+		break;
+
+	case D77_BLK_TYPE_CBU:
+		break;
+
+	case D77_BLK_TYPE_ATU:
+		break;
+
+	case D77_BLK_TYPE_ATU_VP:
+		break;
+
+	case D77_BLK_TYPE_LPU_PERF:
+		break;
+
 	default:
 		DRM_ERROR("Unknown block (block_info: 0x%x) is found\n",
 			  blk->block_info);
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 2d429e310e5b..7598e4856e0c 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -614,6 +614,7 @@ d71_identify(u32 __iomem *reg_base, struct komeda_chip_info *chip)
 	switch (product_id) {
 	case MALIDP_D71_PRODUCT_ID:
 	case MALIDP_D32_PRODUCT_ID:
+	case MALIDP_D77_PRODUCT_ID:
 		funcs = &d71_chip_funcs;
 		break;
 	default:
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
index 81de6a23e7f3..01ea53918cf1 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
@@ -477,8 +477,11 @@ enum d71_blk_type {
 	D71_BLK_TYPE_PERIPH		= 0x08,
 	D71_BLK_TYPE_LPU_TRUSTED	= 0x09,
 	D71_BLK_TYPE_AEU_TRUSTED	= 0x0A,
+	D77_BLK_TYPE_CBU		= 0x0B,
+	D77_BLK_TYPE_ATU		= 0x0C,
 	D71_BLK_TYPE_LPU_LAYER		= 0x10,
 	D71_BLK_TYPE_LPU_WB_LAYER	= 0x11,
+	D77_BLK_TYPE_LPU_PERF		= 0x12,
 	D71_BLK_TYPE_CU_SPLITTER	= 0x20,
 	D71_BLK_TYPE_CU_SCALER		= 0x21,
 	D71_BLK_TYPE_CU_MERGER		= 0x22,
@@ -487,6 +490,7 @@ enum d71_blk_type {
 	D71_BLK_TYPE_DOU_FT_COEFF	= 0x32,
 	D71_BLK_TYPE_AEU_DS		= 0x40,
 	D71_BLK_TYPE_AEU_AES		= 0x41,
+	D77_BLK_TYPE_ATU_VP		= 0xC0,
 	D71_BLK_TYPE_RESERVED		= 0xFF
 };
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index ad38bbc7431e..3ac6b43beb2c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -126,6 +126,7 @@ static int komeda_platform_remove(struct platform_device *pdev)
 static const struct of_device_id komeda_of_match[] = {
 	{ .compatible = "arm,mali-d71", .data = d71_identify, },
 	{ .compatible = "arm,mali-d32", .data = d71_identify, },
+	{ .compatible = "arm,mali-d77", .data = d71_identify, },
 	{},
 };
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
