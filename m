Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1111C6A2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 08:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E006EC79;
	Thu, 12 Dec 2019 07:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A796EC79
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv8LFHGUc7FlTMS1j/XZGI2wqkF4osTKc6AxXYv2Go4=;
 b=86mri5F+R6LXapp5EwbU0k40NA56Uom+OCF34XwG0sOZH38CMLj+Yg3cUjagvzHajc8T2OcLSgTHr8WPp3A5qTFvLmTriaHJE4L4hfBeRBZgkqxCWa0VF3f5W57/j+uGedePTxl7QuxwiU2unQAILAh1gsZWBM464eVyoFbUEjs=
Received: from VI1PR08CA0145.eurprd08.prod.outlook.com (2603:10a6:800:d5::23)
 by DB8PR08MB5468.eurprd08.prod.outlook.com (2603:10a6:10:11a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Thu, 12 Dec
 2019 07:48:22 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0145.outlook.office365.com
 (2603:10a6:800:d5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Thu, 12 Dec 2019 07:48:22 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 12 Dec 2019 07:48:22 +0000
Received: ("Tessian outbound 1e3e4a1147b7:v37");
 Thu, 12 Dec 2019 07:48:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7176d6de12056882
X-CR-MTA-TID: 64aa7808
Received: from d3a567c650a1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEC51003-4089-441F-9E8B-62BAC3745974.1; 
 Thu, 12 Dec 2019 07:48:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3a567c650a1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Dec 2019 07:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtotQ7LRraZJesqMiwyuoCsdb4qzTco4bT1xpfxfUSLjxmImcTOTonfUkkdEgo7IsVpbua5DY7JKPYCA9qBH7MtZtz3v9sw216F5T8mGD0DPAlyEwv+YKJbsluZtJ1ZP89EwAIc8yALGjrkRNK7DSjRu/Zrruz74lF+MgHqVVqQSK49MFDoyjz3hJD/yp9cZmOxtNolj/mz7Z2yNWGxcj5efHebU9THdZFF9pVMrj4QeHBowDaqs8G2FqRtIJQrOU29fjz8bTsu/dxglzw9eMS782G88G1FTX8xHv4F4AwyuVtENvLcOpoZgfyJJMbgorjIKIMT2ocjVoW2pZ39n/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv8LFHGUc7FlTMS1j/XZGI2wqkF4osTKc6AxXYv2Go4=;
 b=T2k2JR4YEiU+g4vU/unOpW2E1/yrYpomeIRVKaSw/LHO36f7tlrkYgviAGqmULchmNoEufBn0NnF4OdkJtVRST1VSe8LVmAtI5FakQsXBoBBb8lXG67EV1gA0DFcSxu8CTpU22ysNNiLWIX3e3GsCMf8Rjw/qnEdAZ6wVYNSBvhCdVX/JSRFDPP+crTGykj6S8Had1qnjgkNAwIbOQ7+Mu0wPE2X//r1VaYoL5nQ4/9vhcSZFb9O8OjStgtpl/Lh+AiWghyPnOJ5dHLHGI99JzqDAlh+NKiGIipfj4BQ5YJgkyA4DmahsfhlUvpw7urBW1txw0rVCKKwxadshS8vXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv8LFHGUc7FlTMS1j/XZGI2wqkF4osTKc6AxXYv2Go4=;
 b=86mri5F+R6LXapp5EwbU0k40NA56Uom+OCF34XwG0sOZH38CMLj+Yg3cUjagvzHajc8T2OcLSgTHr8WPp3A5qTFvLmTriaHJE4L4hfBeRBZgkqxCWa0VF3f5W57/j+uGedePTxl7QuxwiU2unQAILAh1gsZWBM464eVyoFbUEjs=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5261.eurprd08.prod.outlook.com (20.179.31.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 07:48:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 07:48:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Add runtime_pm support
Thread-Topic: [PATCH] drm/komeda: Add runtime_pm support
Thread-Index: AQHVsMCBN2D7zCEwDUuoMKQ83lPGMg==
Date: Thu, 12 Dec 2019 07:48:13 +0000
Message-ID: <20191212074756.14678-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57473b44-1fc9-4eaa-b9a1-08d77ed7a98e
X-MS-TrafficTypeDiagnostic: VE1PR08MB5261:|VE1PR08MB5261:|DB8PR08MB5468:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB54680DB4538FFE1F1A1C2EF1B3550@DB8PR08MB5468.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0249EFCB0B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(189003)(199004)(316002)(52116002)(6512007)(5660300002)(2906002)(4326008)(8676002)(54906003)(1076003)(37006003)(478600001)(8936002)(66476007)(103116003)(6486002)(81156014)(6636002)(71200400001)(66946007)(81166006)(66446008)(6862004)(36756003)(86362001)(6506007)(55236004)(26005)(2616005)(64756008)(186003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5261;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Zzf2JubaE580f3ZP7H+RJUJndlpLgPiVx4NkvGgMCHGc6FYL18XsoKG1eJbAlzhOstmm5bPSEbggW7z4yzFl8ZAjp3Hv3fEqKLAZHOZRUz+ep+2YA8TEliM+fxIM7d8McbAmEqhMB1ZESQwGYqWpPJPHKOaf6Nyj8MqiBSkj9Y7LMTYnGGRSM6BPjWu4o670kRa0KRsrjY6f20bODE3B9tkSDeRDR2ZfxlOEMYryqLC5WhBCU422Vgk7FdNRpRwA/H9OBmgi4WoLpopeETe5Bhg+uTnh2pLPeYiyTG14L4EK93hf/93qPPpZr2iX2Grom0k/zYGbp6ZOgyZ7Xo7H0ds4rdy15e+rywyoIe4+O2ehx9O7wCFNAvvBwFLb43g6yhq0DO8Gf2rsL6jkXUkaFbUtU0RvNGBJ/OG/N1q8hWribBHWola6ciHTk9HhGeZO
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(189003)(199004)(26005)(316002)(2616005)(356004)(8676002)(478600001)(336012)(81156014)(81166006)(54906003)(1076003)(37006003)(26826003)(6512007)(6862004)(4326008)(8936002)(86362001)(76130400001)(6506007)(70586007)(70206006)(6636002)(186003)(36756003)(103116003)(5660300002)(2906002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5468;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b647e486-e3a5-4fe4-2909-08d77ed7a3ef
NoDisclaimer: True
X-Forefront-PRVS: 0249EFCB0B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvqKFgD9ZHvtnUyS2IQu4BwmhMlLZsjoTwsbTbQ6NArUPwmwnFV1CKtD33bOcslpC0YyQ0579A3hazVHPw/7mk4haLpH2lfKivAC0SO5sSW8T9pWoQfDIvpzLaocZCdrJ2NM055cKf4DpZ0C4w31xsELpWiFzRFABj74Q3ZbdAJY8+YS+10MlFoK8Hcyextetu7kIsR6+7ctE4NRTnAsrBbtxR76IGvQop1X+YyMHhrrwOwpUlJCMC8iZU8WuH+o/YvWk6f0x28n0lwQgylVHHhalv4ktD/5zmcAbwHtg/63CmNZkyaLNk0hlMZilL8gpN0h5+9SpZbYsSCZ8K/Q76T9iTa9b3K4ToL5aN9a6hRPz/abek6VjXiyfv6ANkBgSiIRhiOAYurcy0Nz3m4+3Clk3BHSRZIHC+3JeUAXLeTvonx2Kn4fEWE2u7Y3u7p/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2019 07:48:22.3255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57473b44-1fc9-4eaa-b9a1-08d77ed7a98e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5468
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

- Add pm_runtime_get/put to crtc_enable/disable along with the real
  display usage
- Add runtime_get/put to register_show, since register_show() will
  access register, need to wakeup HW.
- For the case that PM is not enabled or configured, manually wakeup HW

Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  3 +
 .../gpu/drm/arm/display/komeda/komeda_dev.c   | 55 +++++--------------
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 42 ++++++++++++--
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  6 --
 4 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 1c452ea75999..56bd938961ee 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -5,6 +5,7 @@
  *
  */
 #include <linux/clk.h>
+#include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
@@ -274,6 +275,7 @@ static void
 komeda_crtc_atomic_enable(struct drm_crtc *crtc,
 			  struct drm_crtc_state *old)
 {
+	pm_runtime_get_sync(crtc->dev->dev);
 	komeda_crtc_prepare(to_kcrtc(crtc));
 	drm_crtc_vblank_on(crtc);
 	WARN_ON(drm_crtc_vblank_get(crtc));
@@ -372,6 +374,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_put(crtc);
 	drm_crtc_vblank_off(crtc);
 	komeda_crtc_unprepare(kcrtc);
+	pm_runtime_put(crtc->dev->dev);
 }
 
 static void
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 38b832804bad..1d767473ba8a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -10,6 +10,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
@@ -27,12 +28,16 @@ static int komeda_register_show(struct seq_file *sf, void *x)
 
 	seq_puts(sf, "\n====== Komeda register dump =========\n");
 
+	pm_runtime_get_sync(mdev->dev);
+
 	if (mdev->funcs->dump_register)
 		mdev->funcs->dump_register(mdev, sf);
 
 	for (i = 0; i < mdev->n_pipelines; i++)
 		komeda_pipeline_dump_register(mdev->pipelines[i], sf);
 
+	pm_runtime_put(mdev->dev);
+
 	return 0;
 }
 
@@ -263,15 +268,6 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 	if (!mdev->iommu)
 		DRM_INFO("continue without IOMMU support!\n");
 
-	if (mdev->iommu && mdev->funcs->connect_iommu) {
-		err = mdev->funcs->connect_iommu(mdev);
-		if (err) {
-			DRM_ERROR("connect iommu failed.\n");
-			mdev->iommu = NULL;
-			goto disable_clk;
-		}
-	}
-
 	clk_disable_unprepare(mdev->aclk);
 
 	err = sysfs_create_group(&dev->kobj, &komeda_sysfs_attr_group);
@@ -310,11 +306,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 	if (mdev->aclk)
 		clk_prepare_enable(mdev->aclk);
 
-	if (mdev->iommu && mdev->funcs->disconnect_iommu)
-		if (mdev->funcs->disconnect_iommu(mdev))
-			DRM_ERROR("disconnect iommu failed.\n");
-	mdev->iommu = NULL;
-
 	for (i = 0; i < mdev->n_pipelines; i++) {
 		komeda_pipeline_destroy(mdev, mdev->pipelines[i]);
 		mdev->pipelines[i] = NULL;
@@ -343,44 +334,26 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 int komeda_dev_resume(struct komeda_dev *mdev)
 {
-	int ret = 0;
-
 	clk_prepare_enable(mdev->aclk);
 
-	if (mdev->iommu && mdev->funcs->connect_iommu) {
-		ret = mdev->funcs->connect_iommu(mdev);
-		if (ret < 0) {
-			DRM_ERROR("connect iommu failed.\n");
-			goto disable_clk;
-		}
-	}
-
-	ret = mdev->funcs->enable_irq(mdev);
+	mdev->funcs->enable_irq(mdev);
 
-disable_clk:
-	clk_disable_unprepare(mdev->aclk);
+	if (mdev->iommu && mdev->funcs->connect_iommu)
+		if (mdev->funcs->connect_iommu(mdev))
+			DRM_ERROR("connect iommu failed.\n");
 
-	return ret;
+	return 0;
 }
 
 int komeda_dev_suspend(struct komeda_dev *mdev)
 {
-	int ret = 0;
-
-	clk_prepare_enable(mdev->aclk);
-
-	if (mdev->iommu && mdev->funcs->disconnect_iommu) {
-		ret = mdev->funcs->disconnect_iommu(mdev);
-		if (ret < 0) {
+	if (mdev->iommu && mdev->funcs->disconnect_iommu)
+		if (mdev->funcs->disconnect_iommu(mdev))
 			DRM_ERROR("disconnect iommu failed.\n");
-			goto disable_clk;
-		}
-	}
 
-	ret = mdev->funcs->disable_irq(mdev);
+	mdev->funcs->disable_irq(mdev);
 
-disable_clk:
 	clk_disable_unprepare(mdev->aclk);
 
-	return ret;
+	return 0;
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index ad38bbc7431e..ea5cd1e17304 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -33,6 +33,12 @@ static void komeda_unbind(struct device *dev)
 		return;
 
 	komeda_kms_detach(mdrv->kms);
+
+	if (pm_runtime_enabled(dev))
+		pm_runtime_disable(dev);
+	else
+		komeda_dev_suspend(mdrv->mdev);
+
 	komeda_dev_destroy(mdrv->mdev);
 
 	dev_set_drvdata(dev, NULL);
@@ -54,6 +60,10 @@ static int komeda_bind(struct device *dev)
 		goto free_mdrv;
 	}
 
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev))
+		komeda_dev_resume(mdrv->mdev);
+
 	mdrv->kms = komeda_kms_attach(mdrv->mdev);
 	if (IS_ERR(mdrv->kms)) {
 		err = PTR_ERR(mdrv->kms);
@@ -65,6 +75,11 @@ static int komeda_bind(struct device *dev)
 	return 0;
 
 destroy_mdev:
+	if (pm_runtime_enabled(dev))
+		pm_runtime_disable(dev);
+	else
+		komeda_dev_suspend(mdrv->mdev);
+
 	komeda_dev_destroy(mdrv->mdev);
 
 free_mdrv:
@@ -131,15 +146,29 @@ static const struct of_device_id komeda_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, komeda_of_match);
 
+static int komeda_rt_pm_suspend(struct device *dev)
+{
+	struct komeda_drv *mdrv = dev_get_drvdata(dev);
+
+	return komeda_dev_suspend(mdrv->mdev);
+}
+
+static int komeda_rt_pm_resume(struct device *dev)
+{
+	struct komeda_drv *mdrv = dev_get_drvdata(dev);
+
+	return komeda_dev_resume(mdrv->mdev);
+}
+
 static int __maybe_unused komeda_pm_suspend(struct device *dev)
 {
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
-	struct drm_device *drm = &mdrv->kms->base;
 	int res;
 
-	res = drm_mode_config_helper_suspend(drm);
+	res = drm_mode_config_helper_suspend(&mdrv->kms->base);
 
-	komeda_dev_suspend(mdrv->mdev);
+	if (!pm_runtime_status_suspended(dev))
+		komeda_dev_suspend(mdrv->mdev);
 
 	return res;
 }
@@ -147,15 +176,16 @@ static int __maybe_unused komeda_pm_suspend(struct device *dev)
 static int __maybe_unused komeda_pm_resume(struct device *dev)
 {
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
-	struct drm_device *drm = &mdrv->kms->base;
 
-	komeda_dev_resume(mdrv->mdev);
+	if (!pm_runtime_status_suspended(dev))
+		komeda_dev_resume(mdrv->mdev);
 
-	return drm_mode_config_helper_resume(drm);
+	return drm_mode_config_helper_resume(&mdrv->kms->base);
 }
 
 static const struct dev_pm_ops komeda_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(komeda_pm_suspend, komeda_pm_resume)
+	SET_RUNTIME_PM_OPS(komeda_rt_pm_suspend, komeda_rt_pm_resume, NULL)
 };
 
 static struct platform_driver komeda_platform_driver = {
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index e30a5b43caa9..9a7dcf92591a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -307,10 +307,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 	if (err)
 		goto free_component_binding;
 
-	err = mdev->funcs->enable_irq(mdev);
-	if (err)
-		goto free_component_binding;
-
 	drm->irq_enabled = true;
 
 	drm_kms_helper_poll_init(drm);
@@ -324,7 +320,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 free_interrupts:
 	drm_kms_helper_poll_fini(drm);
 	drm->irq_enabled = false;
-	mdev->funcs->disable_irq(mdev);
 free_component_binding:
 	component_unbind_all(mdev->dev, drm);
 cleanup_mode_config:
@@ -346,7 +341,6 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm->irq_enabled = false;
-	mdev->funcs->disable_irq(mdev);
 	component_unbind_all(mdev->dev, drm);
 	drm_mode_config_cleanup(drm);
 	komeda_kms_cleanup_private_objs(kms);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
