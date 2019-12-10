Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E31182B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821556E85E;
	Tue, 10 Dec 2019 08:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40077.outbound.protection.outlook.com [40.107.4.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61EF6E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/d4jIzeQVWkCBWXx8R3XHSN3jQW91VW1gzlK5vWQXA=;
 b=0NT2mc3MDyVkZJl3sU5mSmS25Syp7XFd6puHbiqBKriAuozDDh1uNx+Ie3OyvmrzJDZ8KfAw672Ai38/KZkS+EcjOcKORQqRBnmrobh9bqxpNhdol/MvIYpeLAgRyoRaJfoZL7EY3PfgCyv1DT0leqzpbsTOTPre7MCXP4jSoj8=
Received: from VI1PR08CA0133.eurprd08.prod.outlook.com (2603:10a6:800:d5::11)
 by DBBPR08MB4361.eurprd08.prod.outlook.com (2603:10a6:10:c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Tue, 10 Dec
 2019 08:48:55 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0133.outlook.office365.com
 (2603:10a6:800:d5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Tue, 10 Dec 2019 08:48:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 08:48:55 +0000
Received: ("Tessian outbound d87d9aeb44be:v37");
 Tue, 10 Dec 2019 08:48:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33ba96f2eead3c02
X-CR-MTA-TID: 64aa7808
Received: from 0edf5832a06f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CFB6E7E4-697A-47A6-89FB-09567E8C3C2A.1; 
 Tue, 10 Dec 2019 08:48:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0edf5832a06f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 08:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tfprypp5FvLmpwoU6cqVW1o5MX2FwOVtlfrj0dx8iHyAq6R/eIufblEEiq9ZPICNohKw12gsEz2UYUbjPrw5PylYuaYWZQ2VEhBkZ/tbzaiWYlSKQyABAK9F3XG+Z7DFfYQQRHzIJJJTbEFBlttAY39b1EyTCIRgty/Zdp1TK8q0dkzBKrMY7Q6ICDHMLeZRfguGLixswMuvQs+UQPUxeTeJpnwLkj92XBJIepfesFg6xPQEXm3lX8+KkHrqgTbNG+hkKvCqFh792VizvYbf/An7vuid7EDwIlmXDNLeX/kuCJ9G4dIYSVdEqVI0wyqoNAXpMhdX3XFZfLHW2HPoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/d4jIzeQVWkCBWXx8R3XHSN3jQW91VW1gzlK5vWQXA=;
 b=VFev+eiDh2LUGUEFJcIAGw6JhGlmnpHZgM6xoHfoDnTy4MUUpC0rqHIVeUrK3dNrHqZ5XNlBTOPcWe8jpu/NuNDEb87vTAHSBHRXS0Xy/XdOsPdvgYNz8Dpv0CiC5QjHTIGHSGbjBDaVeuSPWwC7dtko8pfRz2WGO6M8rS70P1hOvbm/ioI2e7NHfgBpE49zgbGpIJPWfP++rW755maRAabiH8JYNajLjZkwMBjNjLH0v2oXRjqVp7n/wBqJdL4I+y1fZ/THz4vEnj7Q+60VPCcIjOzy8tJ4viDRDkBWIdA8JLEGzyygYNIyIyrxQITJznVQDYU6lvpYu0G72FcRow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/d4jIzeQVWkCBWXx8R3XHSN3jQW91VW1gzlK5vWQXA=;
 b=0NT2mc3MDyVkZJl3sU5mSmS25Syp7XFd6puHbiqBKriAuozDDh1uNx+Ie3OyvmrzJDZ8KfAw672Ai38/KZkS+EcjOcKORQqRBnmrobh9bqxpNhdol/MvIYpeLAgRyoRaJfoZL7EY3PfgCyv1DT0leqzpbsTOTPre7MCXP4jSoj8=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 08:48:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 08:48:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 1/2] drm/komeda: Update the chip identify
Thread-Topic: [PATCH v3 1/2] drm/komeda: Update the chip identify
Thread-Index: AQHVrzaiCeAK5VTajE2NZYt9uO0vcg==
Date: Tue, 10 Dec 2019 08:48:46 +0000
Message-ID: <20191210084828.19664-2-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a5540dba-315a-4ed9-9d0f-08d77d4dca0f
X-MS-TrafficTypeDiagnostic: VE1PR08MB5182:|VE1PR08MB5182:|DBBPR08MB4361:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4361749187C1A41B4A94EB30B35B0@DBBPR08MB4361.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(54906003)(4326008)(66446008)(26005)(1076003)(103116003)(66556008)(37006003)(186003)(66946007)(64756008)(8676002)(66476007)(36756003)(6862004)(305945005)(2616005)(2906002)(15650500001)(71200400001)(6486002)(86362001)(478600001)(6512007)(6636002)(316002)(71190400001)(5660300002)(55236004)(81156014)(81166006)(8936002)(52116002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5182;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hB+UJysy64OneczNQ5E9t3ObK8UyqRPapB2BqJd7Kx7UJsvgZ0q0lDGQMtCRKnaSo97FtsyxUi6gPeMiAt7FQjyspMm216s0aA0zhO9GU4QuUBf0kj3JOZN4rXxY/SE2D1L3oHu8AMMJswz/I4IUIXwOE+w+asvHLBKrwtaMm4U/7Aa3i9moGt0b7rAQ9bKkvyP22xFYreBsivvzC+rB6eBkNDvoMsFnoXw9svSUv1xhnMnOzhnwU+YKD62LpsySEUPqgKQqxpXZH96AMlAmzWcOdQE8k4e0MECbvWrVOwqlmoYSscjXagHkRxej90xSeQUGR/x8DgftH0Lmkv/guZlO+3Kcl5y8OvEVx1Oe5HJKi8f12RU4WPFNJBvgAJevKS0mfCNq+fVuw1rlnO/HBdibkrSh0HBdcMRThFDsZbxKeg0wa7yLA9a4eBXG5ab/
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(199004)(189003)(26826003)(36906005)(86362001)(186003)(478600001)(36756003)(81156014)(316002)(70206006)(4326008)(2906002)(103116003)(70586007)(81166006)(37006003)(15650500001)(2616005)(336012)(26005)(54906003)(8936002)(6512007)(305945005)(6862004)(6636002)(5660300002)(6506007)(8676002)(76130400001)(356004)(1076003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4361;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 88c2a7d0-b516-4dfa-8767-08d77d4dc4cb
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DTBm3D5RODopYAsDaa1Nfo6ragtTSVUv7P23Jaov0mfG6uiv5WtEu6FIqkCP8/IIVjXQAyRpeEcOmN+azSwe64PUmvhHioxpPMQYj4KzrvMfWHfDDq4aygTguUEtu4Sh348MxutVp71KY2ZLfdyPflF2K9Vg9GeBqk4fI8ddesW68ZLw8cV0+xidv1buhkIF58Uyxhiw8BiC+pDhlk4LnAlgw8vSGBMVp6fDOFnEL0FUnGPi90/E23q4v1mn0BJm2ExzPBmT1FW7djW1fPYW2CvyKOIqjL3tq0LsWoyr6HtwiGqN3Y7zlTzCNlQPZK2wciOHlUtBJ1Py7ckaUu6DQ05aPqHCCyEJ9I5BmGJlDpJL7wl/U1naMbP20Qg+rwe/c0sYBKRz74ctjWdRkiA+84rSj2n5YadyKIrG9OFihDkTpcDN5J7i0Rj7BF3OmAc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 08:48:55.1198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5540dba-315a-4ed9-9d0f-08d77d4dca0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4361
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

1. Drop komeda-CORE product id comparison and put it into the d71_identify
2. Update pipeline node DT-binding:
   (a). Skip the needless pipeline DT node.
   (b). Return fail if the essential pipeline DT node is missing.

With these changes, for chips in same family no need to change the DT.

v2: Rebase
v3: Address Mihail's comments.

Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 19 +++++-
 .../gpu/drm/arm/display/komeda/komeda_dev.c   | 61 ++++++++++---------
 .../gpu/drm/arm/display/komeda/komeda_dev.h   | 14 +----
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  9 +--
 4 files changed, 54 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index d53f95dea0a1..7e79c2e88421 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -597,10 +597,25 @@ static const struct komeda_dev_funcs d71_chip_funcs = {
 const struct komeda_dev_funcs *
 d71_identify(u32 __iomem *reg_base, struct komeda_chip_info *chip)
 {
+	const struct komeda_dev_funcs *funcs;
+	u32 product_id;
+
+	chip->core_id = malidp_read32(reg_base, GLB_CORE_ID);
+
+	product_id = MALIDP_CORE_ID_PRODUCT_ID(chip->core_id);
+
+	switch (product_id) {
+	case MALIDP_D71_PRODUCT_ID:
+		funcs = &d71_chip_funcs;
+		break;
+	default:
+		DRM_ERROR("Unsupported product: 0x%x\n", product_id);
+		return NULL;
+	}
+
 	chip->arch_id	= malidp_read32(reg_base, GLB_ARCH_ID);
-	chip->core_id	= malidp_read32(reg_base, GLB_CORE_ID);
 	chip->core_info	= malidp_read32(reg_base, GLB_CORE_INFO);
 	chip->bus_width	= D71_BUS_WIDTH_16_BYTES;
 
-	return &d71_chip_funcs;
+	return funcs;
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 4e46f650fddf..38b832804bad 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -115,22 +115,14 @@ static struct attribute_group komeda_sysfs_attr_group = {
 	.attrs = komeda_sysfs_entries,
 };
 
-static int komeda_parse_pipe_dt(struct komeda_dev *mdev, struct device_node *np)
+static int komeda_parse_pipe_dt(struct komeda_pipeline *pipe)
 {
-	struct komeda_pipeline *pipe;
+	struct device_node *np = pipe->of_node;
 	struct clk *clk;
-	u32 pipe_id;
-	int ret = 0;
-
-	ret = of_property_read_u32(np, "reg", &pipe_id);
-	if (ret != 0 || pipe_id >= mdev->n_pipelines)
-		return -EINVAL;
-
-	pipe = mdev->pipelines[pipe_id];
 
 	clk = of_clk_get_by_name(np, "pxclk");
 	if (IS_ERR(clk)) {
-		DRM_ERROR("get pxclk for pipeline %d failed!\n", pipe_id);
+		DRM_ERROR("get pxclk for pipeline %d failed!\n", pipe->id);
 		return PTR_ERR(clk);
 	}
 	pipe->pxlclk = clk;
@@ -144,7 +136,6 @@ static int komeda_parse_pipe_dt(struct komeda_dev *mdev, struct device_node *np)
 		of_graph_get_port_by_id(np, KOMEDA_OF_PORT_OUTPUT);
 
 	pipe->dual_link = pipe->of_output_links[0] && pipe->of_output_links[1];
-	pipe->of_node = of_node_get(np);
 
 	return 0;
 }
@@ -153,7 +144,9 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *child, *np = dev->of_node;
-	int ret;
+	struct komeda_pipeline *pipe;
+	u32 pipe_id = U32_MAX;
+	int ret = -1;
 
 	mdev->irq  = platform_get_irq(pdev, 0);
 	if (mdev->irq < 0) {
@@ -168,28 +161,42 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	ret = 0;
 
 	for_each_available_child_of_node(np, child) {
-		if (of_node_cmp(child->name, "pipeline") == 0) {
-			ret = komeda_parse_pipe_dt(mdev, child);
-			if (ret) {
-				DRM_ERROR("parse pipeline dt error!\n");
-				of_node_put(child);
-				break;
+		if (of_node_name_eq(child, "pipeline")) {
+			of_property_read_u32(child, "reg", &pipe_id);
+			if (pipe_id >= mdev->n_pipelines) {
+				DRM_WARN("Skip the redundant DT node: pipeline-%u.\n",
+					 pipe_id);
+				continue;
 			}
+			mdev->pipelines[pipe_id]->of_node = of_node_get(child);
 		}
 	}
 
-	return ret;
+	for (pipe_id = 0; pipe_id < mdev->n_pipelines; pipe_id++) {
+		pipe = mdev->pipelines[pipe_id];
+
+		if (!pipe->of_node) {
+			DRM_ERROR("Pipeline-%d doesn't have a DT node.\n",
+				  pipe->id);
+			return -EINVAL;
+		}
+		ret = komeda_parse_pipe_dt(pipe);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 struct komeda_dev *komeda_dev_create(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	const struct komeda_product_data *product;
+	komeda_identify_func komeda_identify;
 	struct komeda_dev *mdev;
 	int err = 0;
 
-	product = of_device_get_match_data(dev);
-	if (!product)
+	komeda_identify = of_device_get_match_data(dev);
+	if (!komeda_identify)
 		return ERR_PTR(-ENODEV);
 
 	mdev = devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
@@ -217,11 +224,9 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 
 	clk_prepare_enable(mdev->aclk);
 
-	mdev->funcs = product->identify(mdev->reg_base, &mdev->chip);
-	if (!komeda_product_match(mdev, product->product_id)) {
-		DRM_ERROR("DT configured %x mismatch with real HW %x.\n",
-			  product->product_id,
-			  MALIDP_CORE_ID_PRODUCT_ID(mdev->chip.core_id));
+	mdev->funcs = komeda_identify(mdev->reg_base, &mdev->chip);
+	if (!mdev->funcs) {
+		DRM_ERROR("Failed to identify the HW.\n");
 		err = -ENODEV;
 		goto disable_clk;
 	}
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
index d406a4d83352..4a67a80d5fcf 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
@@ -58,11 +58,6 @@
 			    | KOMEDA_EVENT_MODE \
 			    )
 
-/* malidp device id */
-enum {
-	MALI_D71 = 0,
-};
-
 /* pipeline DT ports */
 enum {
 	KOMEDA_OF_PORT_OUTPUT		= 0,
@@ -76,12 +71,6 @@ struct komeda_chip_info {
 	u32 bus_width;
 };
 
-struct komeda_product_data {
-	u32 product_id;
-	const struct komeda_dev_funcs *(*identify)(u32 __iomem *reg,
-					     struct komeda_chip_info *info);
-};
-
 struct komeda_dev;
 
 struct komeda_events {
@@ -234,6 +223,9 @@ komeda_product_match(struct komeda_dev *mdev, u32 target)
 	return MALIDP_CORE_ID_PRODUCT_ID(mdev->chip.core_id) == target;
 }
 
+typedef const struct komeda_dev_funcs *
+(*komeda_identify_func)(u32 __iomem *reg, struct komeda_chip_info *chip);
+
 const struct komeda_dev_funcs *
 d71_identify(u32 __iomem *reg, struct komeda_chip_info *chip);
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index d6c2222c5d33..b7a1097c45c4 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -123,15 +123,8 @@ static int komeda_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct komeda_product_data komeda_products[] = {
-	[MALI_D71] = {
-		.product_id = MALIDP_D71_PRODUCT_ID,
-		.identify = d71_identify,
-	},
-};
-
 static const struct of_device_id komeda_of_match[] = {
-	{ .compatible = "arm,mali-d71", .data = &komeda_products[MALI_D71], },
+	{ .compatible = "arm,mali-d71", .data = d71_identify, },
 	{},
 };
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
