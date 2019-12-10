Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB81182B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044B36E862;
	Tue, 10 Dec 2019 08:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701CB6E860
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYmCw/H9HAJXv2dndC52ixrEWr9aWZfqlU0dti+9oas=;
 b=5fr9elvzsr6sOvugAnOl+cXEweumTZsh7X7/S18GhfUu8H7oFfgJ0UZzjAZoIHeMPe6a3OHIaLXJDmvHNl4RbzCSSFx23kzCvFeP9huHiuegcZY/T8mUHgbH1QpMu56Ku76Ne4Q0CmydYM0aJcpHjLe24VpnBDwbPLQaz1ANkWo=
Received: from AM4PR08CA0069.eurprd08.prod.outlook.com (2603:10a6:205:2::40)
 by VI1PR0801MB1679.eurprd08.prod.outlook.com (2603:10a6:800:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Tue, 10 Dec
 2019 08:48:58 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by AM4PR08CA0069.outlook.office365.com
 (2603:10a6:205:2::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Tue, 10 Dec 2019 08:48:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 08:48:58 +0000
Received: ("Tessian outbound 25173d5f5683:v37");
 Tue, 10 Dec 2019 08:48:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c62a380993af5820
X-CR-MTA-TID: 64aa7808
Received: from 4d760b48d4b6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDF5CBD7-AD5D-469C-A1D9-9F1818DB3B99.1; 
 Tue, 10 Dec 2019 08:48:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d760b48d4b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 08:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMjBRjUxL37PhaKD4mkQGrT3qp/2foFMP5yM1IbqAqLavNHbLnCOSwGpikhaFT4GYUH2gphuN2l1J2vgcqrSYxXgiW2JCCPwVTnMyQsdIjeZ1qRTLhgzaQ7nEyvevgzGIMFH7t+shwYoOSjmQJzcF0nXGRCKbYcFH1VhKqY5XyRklLMkLx+8jiZHhhSE/vKWKINuduMz9+CInMxIhrsJlmDDYrgwZeljAYM64Nbq5iLvmNIOiBUIRwMuxYBSzKMzN6ACYYe6X6ec9QDKHB2ZJMdAD7SzecQq7Ooe22Vt5Qp/G1xN67D7Y9P4MsrwG9nm1HCIM8Zz4Fs9Oj7wlL+vTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYmCw/H9HAJXv2dndC52ixrEWr9aWZfqlU0dti+9oas=;
 b=EhGm9iAfIusqC5/g0wuECrSKKcTyH+UiI1APW2EVyVHClQK5r+PR4HZ0AQ7t5OSVSqhvxHEZQ0T/mqlNb6aKZ1Yo4MiyaOb9qZ0rTpGWuw+VhBCHAV85o7XQbWuIyni0T65k+LeBZGj1KQTmwJmJ7EHMJGZSWN/R+JDo5dHK5VzuyFxh42CaWFOC42A1rI8ZrlyxCUiYenFS/lPkQBtsCKS9gbqUz2QvcxvKFp61t3Dgr/JmhHrSbmro9KMJQlvDORWB5BPwDjRPv3lWItYauEhYagaRRs4jPWhhaYzQaTUmUB0vk5BKRw5w+4nQ2ScjzxmG2Bwg5GgpAHQWSBtHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYmCw/H9HAJXv2dndC52ixrEWr9aWZfqlU0dti+9oas=;
 b=5fr9elvzsr6sOvugAnOl+cXEweumTZsh7X7/S18GhfUu8H7oFfgJ0UZzjAZoIHeMPe6a3OHIaLXJDmvHNl4RbzCSSFx23kzCvFeP9huHiuegcZY/T8mUHgbH1QpMu56Ku76Ne4Q0CmydYM0aJcpHjLe24VpnBDwbPLQaz1ANkWo=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 08:48:51 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 08:48:51 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v3 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVrzaleAtsmVu8OkaYqJLyku2PnQ==
Date: Tue, 10 Dec 2019 08:48:51 +0000
Message-ID: <20191210084828.19664-3-james.qian.wang@arm.com>
References: <20191210084828.19664-1-james.qian.wang@arm.com>
In-Reply-To: <20191210084828.19664-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 917cde55-43c1-4743-612b-08d77d4dcc1a
X-MS-TrafficTypeDiagnostic: VE1PR08MB5182:|VE1PR08MB5182:|VI1PR0801MB1679:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1679AC4A60E0E8F7F31980B7B35B0@VI1PR0801MB1679.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(54906003)(4326008)(66446008)(26005)(1076003)(103116003)(66556008)(37006003)(186003)(66946007)(64756008)(8676002)(66476007)(36756003)(6862004)(305945005)(2616005)(2906002)(71200400001)(6486002)(86362001)(478600001)(6512007)(6636002)(316002)(71190400001)(5660300002)(55236004)(81156014)(81166006)(8936002)(52116002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5182;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KsSO07UuusPkwFdrCldGUD1EEVXP4ugytbcJ5GNYeLC8/4LsqBlfsegvpYXNMXmuvaqCF7pi4+QgCxrVOKkXl6qE9gXYm8sK0J2F8zmJGZBL0/Yra8E3lwLIGAwaGc9N2YdfK+DzNkJd3QpXYpF2qiJE0vIgX+tMHC4OpR5KKdvLDFqjWmfWoN4g+TLMFcJLvs858bVs2S8f8M6hBKRjpQ3pjX69mTePRLOtFttwjl7ZrvKNLyMLVgnry4XtWNxJd9mAyBO1BX2VUH1uOvGZQxf4mJlQprBIvsNv07BRml5g5r9TmYtDoBR/q2c9T65I1I3iOfTMI7kMbtyp27TfVn5rRxbpapwYdMoH/f7tfA3d0JR1cg19Q2grWy68NWhb+Leb+Fgkyh3ASSKYCP6vlmChnej3rqt/Pkar7ZNKaJhC+hS/sx5avtF7pQCdZAwy
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(199004)(189003)(316002)(6506007)(6512007)(2616005)(26826003)(6486002)(6636002)(478600001)(86362001)(76130400001)(81166006)(36906005)(5660300002)(81156014)(8936002)(356004)(70586007)(54906003)(1076003)(8676002)(26005)(103116003)(37006003)(186003)(70206006)(4326008)(2906002)(6862004)(336012)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1679;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6f5184c5-d7d7-47ae-3c7b-08d77d4dc783
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YeTSpBL3OoB2MIIklY9uLt16sgzU6s4EKpoT5yXys/vMzeU3Oqv1+GWuAPOw8jTpv26K9BdS6MfmF/U2xA0cyOGJalESg5z/DGzH3sGhQNsobvX0lKG0sQCSrfo8SUsRdIYkmcSM7HOR7QJ/QTxs6fbzdAu0lQHFgKC5hlRr15xMxR/Dq1HY09pfMHaUR2xJFAgmferuhoIAgMA8aIf1axhhx2OEmt12L98HApcl3oO3Wrc++I8LAaKYysCmYBfMCwnmvYsr6+i1nVvku2AgpwRBOFIlsbsYabFzsn0xtyFnGBDAT/pgsutMb1v2xssws3+3x6GA23AXM1xR8sHW4EQ8RAOhhc4w5K1GIYgyNAuSysBLszmmJlTv/hF91nn5jKQqyyRVfHkJlb4j5tGZ5V2Qsc1ZLaDOpnoIvN4GBkGtDUOo5YegYIPX/RL+eiu2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 08:48:58.5238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 917cde55-43c1-4743-612b-08d77d4dcc1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1679
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

D32 is simple version of D71, the difference is:
- Only has one pipeline
- Drop the periph block and merge it to GCU

v2: Rebase.
v3: Isolate the block counting fix to a new patch

Signed-off-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
---
 .../drm/arm/display/include/malidp_product.h  |  3 +-
 .../arm/display/komeda/d71/d71_component.c    |  2 +-
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 39 ++++++++++++-------
 .../gpu/drm/arm/display/komeda/d71/d71_regs.h | 13 +++++++
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  1 +
 5 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/include/malidp_product.h b/drivers/gpu/drm/arm/display/include/malidp_product.h
index 1053b11352eb..16a8a2c22c42 100644
--- a/drivers/gpu/drm/arm/display/include/malidp_product.h
+++ b/drivers/gpu/drm/arm/display/include/malidp_product.h
@@ -18,7 +18,8 @@
 #define MALIDP_CORE_ID_STATUS(__core_id)     (((__u32)(__core_id)) & 0xFF)
 
 /* Mali-display product IDs */
-#define MALIDP_D71_PRODUCT_ID   0x0071
+#define MALIDP_D71_PRODUCT_ID	0x0071
+#define MALIDP_D32_PRODUCT_ID	0x0032
 
 union komeda_config_id {
 	struct {
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index b6517c46e670..8a02ade369db 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -1270,7 +1270,7 @@ static int d71_timing_ctrlr_init(struct d71_dev *d71,
 
 	ctrlr = to_ctrlr(c);
 
-	ctrlr->supports_dual_link = true;
+	ctrlr->supports_dual_link = d71->supports_dual_link;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 7e79c2e88421..dd1ecf4276d3 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -371,23 +371,33 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 		goto err_cleanup;
 	}
 
-	/* probe PERIPH */
+	/* Only the legacy HW has the periph block, the newer merges the periph
+	 * into GCU
+	 */
 	value = malidp_read32(d71->periph_addr, BLK_BLOCK_INFO);
-	if (BLOCK_INFO_BLK_TYPE(value) != D71_BLK_TYPE_PERIPH) {
-		DRM_ERROR("access blk periph but got blk: %d.\n",
-			  BLOCK_INFO_BLK_TYPE(value));
-		err = -EINVAL;
-		goto err_cleanup;
+	if (BLOCK_INFO_BLK_TYPE(value) != D71_BLK_TYPE_PERIPH)
+		d71->periph_addr = NULL;
+
+	if (d71->periph_addr) {
+		/* probe PERIPHERAL in legacy HW */
+		value = malidp_read32(d71->periph_addr, PERIPH_CONFIGURATION_ID);
+
+		d71->max_line_size	= value & PERIPH_MAX_LINE_SIZE ? 4096 : 2048;
+		d71->max_vsize		= 4096;
+		d71->num_rich_layers	= value & PERIPH_NUM_RICH_LAYERS ? 2 : 1;
+		d71->supports_dual_link	= !!(value & PERIPH_SPLIT_EN);
+		d71->integrates_tbu	= !!(value & PERIPH_TBU_EN);
+	} else {
+		value = malidp_read32(d71->gcu_addr, GCU_CONFIGURATION_ID0);
+		d71->max_line_size	= GCU_MAX_LINE_SIZE(value);
+		d71->max_vsize		= GCU_MAX_NUM_LINES(value);
+
+		value = malidp_read32(d71->gcu_addr, GCU_CONFIGURATION_ID1);
+		d71->num_rich_layers	= GCU_NUM_RICH_LAYERS(value);
+		d71->supports_dual_link	= GCU_DISPLAY_SPLIT_EN(value);
+		d71->integrates_tbu	= GCU_DISPLAY_TBU_EN(value);
 	}
 
-	value = malidp_read32(d71->periph_addr, PERIPH_CONFIGURATION_ID);
-
-	d71->max_line_size	= value & PERIPH_MAX_LINE_SIZE ? 4096 : 2048;
-	d71->max_vsize		= 4096;
-	d71->num_rich_layers	= value & PERIPH_NUM_RICH_LAYERS ? 2 : 1;
-	d71->supports_dual_link	= value & PERIPH_SPLIT_EN ? true : false;
-	d71->integrates_tbu	= value & PERIPH_TBU_EN ? true : false;
-
 	for (i = 0; i < d71->num_pipelines; i++) {
 		pipe = komeda_pipeline_add(mdev, sizeof(struct d71_pipeline),
 					   &d71_pipeline_funcs);
@@ -606,6 +616,7 @@ d71_identify(u32 __iomem *reg_base, struct komeda_chip_info *chip)
 
 	switch (product_id) {
 	case MALIDP_D71_PRODUCT_ID:
+	case MALIDP_D32_PRODUCT_ID:
 		funcs = &d71_chip_funcs;
 		break;
 	default:
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
index 1727dc993909..81de6a23e7f3 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
@@ -72,6 +72,19 @@
 #define GCU_CONTROL_MODE(x)	((x) & 0x7)
 #define GCU_CONTROL_SRST	BIT(16)
 
+/* GCU_CONFIGURATION registers */
+#define GCU_CONFIGURATION_ID0	0x100
+#define GCU_CONFIGURATION_ID1	0x104
+
+/* GCU configuration */
+#define GCU_MAX_LINE_SIZE(x)	((x) & 0xFFFF)
+#define GCU_MAX_NUM_LINES(x)	((x) >> 16)
+#define GCU_NUM_RICH_LAYERS(x)	((x) & 0x7)
+#define GCU_NUM_PIPELINES(x)	(((x) >> 3) & 0x7)
+#define GCU_NUM_SCALERS(x)	(((x) >> 6) & 0x7)
+#define GCU_DISPLAY_SPLIT_EN(x)	(((x) >> 16) & 0x1)
+#define GCU_DISPLAY_TBU_EN(x)	(((x) >> 17) & 0x1)
+
 /* GCU opmode */
 #define INACTIVE_MODE		0
 #define TBU_CONNECT_MODE	1
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index b7a1097c45c4..ad38bbc7431e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -125,6 +125,7 @@ static int komeda_platform_remove(struct platform_device *pdev)
 
 static const struct of_device_id komeda_of_match[] = {
 	{ .compatible = "arm,mali-d71", .data = d71_identify, },
+	{ .compatible = "arm,mali-d32", .data = d71_identify, },
 	{},
 };
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
