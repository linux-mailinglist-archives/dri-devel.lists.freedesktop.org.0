Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D041CD259
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9FC6E24E;
	Mon, 11 May 2020 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2025.outbound.protection.outlook.com [40.92.23.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4B89AC3
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 17:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBKGfcQ8r98+P63VZho5A2SLQSV4ExL75O9FkQa6VIk/T4rTL3JMon/OEcD4AGlhCKUiFI+74PA4iWMW4HlpWbt9YimR602MN6Pz1nsXxurU/JyfoAcIS8GkhTajDwJr+DzLI/m0s5oF1AGy9/gmxNp6eCGrcN28J8QZqDzmBKfT1azRMfpofwTA32h7m7JAZiVC20J+JcwgevjMze74BMOt+yGkvM8b3sRMtmpgXT+riTvqSWykjgOM2J5bI7eYa2NUoPRxBKzMlDIouGsOEGXMpN6kAWCb1t/RSgSTd+N5O9h3agP60zHDh6IUY8ii8dF1D4aKVwb/jzSnmXxxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P/ysoYMoDg11BymEOP6RDN+u+jBVKqTcBy6+gdoUJo=;
 b=HaGwjTShiPsHf2bMtBae2qw0ymSP8L72gHuyC9M1mluv4YoUPuabiZo/Gzxl7PaUoGwsxwPYiHjWLkbrWCOc5the4+hX9jKAdwoNLD9hGfIy56PylJImCKyQ5VLBTB9TpgbINNVF0eR9uGj913xuvh+S9OdTXchx7ob9QAmUQ5kCIzi+lC9DM8PzLU9qTlpCd42Xpv1/2jpz7DvbX7okWatsRdT6hKX4Wvk7Asmimi8Kg4+AET/EFWYvtTKd24ZONrl7ecHCPp4waxunzsjxDaPTF/8ftBQfmLzt2dg9dy4edQxWVyTRC/+7OeJHUBN6P/wTxVqKUGUCapsQNlGBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from BN8NAM12FT003.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::46) by
 BN8NAM12HT163.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::244)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11; Sat, 9 May
 2020 17:46:18 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc66::4f) by BN8NAM12FT003.mail.protection.outlook.com
 (2a01:111:e400:fc66::61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Sat, 9 May 2020 17:46:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DEB06BF210B3FDAE410F1418F57562C045E0462DFDFB5843A8DDEA13186CF3F7;
 UpperCasedChecksum:D7FBC1096683728759D117A5BB5DF5E307CAD3BF03DE15731720358CBAFF8653;
 SizeAsReceived:7839; Count:48
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 17:46:18 +0000
From: Jonathan Bakker <xc-racer2@live.ca>
To: nki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 kgene@kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: fimc: Add support for S5PV210 variant
Date: Sat,  9 May 2020 10:46:00 -0700
Message-ID: <BN6PR04MB066030DAF82BE31F35A8F3BDA3A30@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: MWHPR14CA0058.namprd14.prod.outlook.com
 (2603:10b6:300:81::20) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200509174600.6321-1-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by
 MWHPR14CA0058.namprd14.prod.outlook.com (2603:10b6:300:81::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28 via Frontend Transport; Sat, 9 May 2020 17:46:15 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200509174600.6321-1-xc-racer2@live.ca>
X-TMN: [ucLRUXUy+mSX0hMA08ILpDuZahbW+IW172qB6WNATTwSDrSs+nTl0TzPx0FH+wYN]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: efe460b7-843c-4eb9-15cc-08d7f440dfd6
X-MS-TrafficTypeDiagnostic: BN8NAM12HT163:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2608ATGCTDg6E58NzDlS3ayKxpuBDKRLqZU8VvFYAaiaJ1qGqmW7e5mJyhLDi9k9s7856AMtEk7Ssuf6cgmVy0FkqGcLAHV4U5rGrB21K2HIJxPQawU8KJeKrKVuRVLdpQA828eRaa1pYPxiu5hYGsv3+s4lhwRKTSrNUGe7yaBT888f2IED++H//l5h3Soo+WhidzRoAzPWruT1q6I2Q6FrvrEv+Sn8G2gDrHGVQoP/Zg1ytGWaVNQA9/XhDN2m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0660.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: nK7xH0aEmE+V5FUMEU50d6c/A/lF28BhUWNl18zz5C7kAYCfg1wHWP15KtHnNBwesrqlB+K1Ws9sYO/SEiv28mPKFvuOROl/fUstOFf2bplEzpGbYXnOc8FsELTMThEPflzz0xFfnfMEK2y6NAfC5umm050MiXT84zvDTu5mmDYcfC4LnGZbSDdMB0vitmMLUHJB/8dCxbyuxiNRj9v2hA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe460b7-843c-4eb9-15cc-08d7f440dfd6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 17:46:18.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT163
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: Jonathan Bakker <xc-racer2@live.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S5PV210 can be trivially supported by this driver.  Only one of
its FIMC devices (#2) supports the same scaling values as Exynos4, and
it is marked by mainscaler-ext in the DTS (as it is for all of the
Exynos4 devices).  It's limits are the same as that of id's 0-2 of
Exynos4 so we don't even need to change the device id check.

It has been tested with a modified libdrm's test from
https://github.com/tobiasjakobi/libdrm/tree/ippv2

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 29ab8be8604c..63e1b8ccb8e9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -89,6 +89,7 @@ struct fimc_scaler {
  * @regs: memory mapped io registers.
  * @lock: locking of operations.
  * @clocks: fimc clocks.
+ * @num_clocks: number of fimc clocks
  * @sc: scaler infomations.
  * @pol: porarity of writeback.
  * @id: fimc id.
@@ -107,6 +108,7 @@ struct fimc_context {
 	void __iomem	*regs;
 	spinlock_t	lock;
 	struct clk	*clocks[FIMC_CLKS_MAX];
+	int		num_clocks;
 	struct fimc_scaler	sc;
 	int	id;
 	int	irq;
@@ -1183,7 +1185,7 @@ static int fimc_setup_clocks(struct fimc_context *ctx)
 	for (i = 0; i < FIMC_CLKS_MAX; i++)
 		ctx->clocks[i] = ERR_PTR(-EINVAL);
 
-	for (i = 0; i < FIMC_CLKS_MAX; i++) {
+	for (i = 0; i < ctx->num_clocks; i++) {
 		if (i == FIMC_CLK_WB_A || i == FIMC_CLK_WB_B)
 			dev = fimc_dev->parent;
 		else
@@ -1210,6 +1212,9 @@ int exynos_drm_check_fimc_device(struct device *dev)
 {
 	int id = of_alias_get_id(dev->of_node, "fimc");
 
+	if (!of_property_read_bool(dev->of_node, "samsung,mainscaler-ext"))
+		return -ENODEV;
+
 	if (id >= 0 && (BIT(id) & fimc_mask))
 		return 0;
 	return -ENODEV;
@@ -1277,6 +1282,11 @@ static int fimc_probe(struct platform_device *pdev)
 	ctx->dev = dev;
 	ctx->id = of_alias_get_id(dev->of_node, "fimc");
 
+	if (of_device_is_compatible(dev->of_node, "samsung,s5pv210-fimc"))
+		ctx->num_clocks = 2;
+	else
+		ctx->num_clocks = FIMC_CLKS_MAX;
+
 	/* construct formats/limits array */
 	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
 	formats = devm_kcalloc(dev, num_formats, sizeof(*formats),
@@ -1409,6 +1419,7 @@ static const struct dev_pm_ops fimc_pm_ops = {
 static const struct of_device_id fimc_of_match[] = {
 	{ .compatible = "samsung,exynos4210-fimc" },
 	{ .compatible = "samsung,exynos4212-fimc" },
+	{ .compatible = "samsung,s5pv210-fimc" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, fimc_of_match);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
