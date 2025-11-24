Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6918C83DD2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CE310E37B;
	Tue, 25 Nov 2025 08:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="S6VPJWSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020105.outbound.protection.outlook.com
 [52.101.84.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2E10E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 12:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tblMDLZeo+nnRQynwCp1mB8PHRR3HurLj2F1O78gxUfc2vTRC+5LBv/NbiWeQS+TkOm4FjH+cdBIHYAZQOrAUSNTvUt3h5gU/Fmm3GHEj7z7iWVwSKs+5zROoEYQAS9BPJ3zEnASXdF0jfEGY73IZonrtJTS8YON2IaqA4ijigzBjjLnkHf9uTUn7CtqMO/AHBPbZIIB5sOO0+ckPNjuzMJvSSdIdjxupJ9AtNY0QYWftcXix9Qkb32nGbID9jph26Bi2ZJCeRFXuWB+TQiO1WXTPMrfiUaGxNeNmOhVzRBFBO76tBLM555jeRWvGoAOhHLCoAVgXJ9ppvEbAIUo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYaa1Cl5anKKhLEecREbrmn81aSd/+hK+Muze5bmNwc=;
 b=CkJW498KkkmXWQeXkfr21SeaX/KHZU+jVM6Fy5iyPNgOR1KszMkjQGKkEAVCqDMphGu3hxeUMZCyl9vYHqLwfN8GNg4A9pY20u2kBuFBxOOIodEEOR08gGAw9EGSs72lgL6VE7PbLQFvZ+40bWU/IBv2hywkQp55vhE3zHA8981u4oRQqjueDiuhzI/fLnFAgUSJLT6x1XbLSHvtoj5RMycC9K0wtPDmXmjxQtfMLh4F8lXw3CNZ9r/qZcXyssiQiHUt4YQYt/uFWtcrf6tOsaDIgfwoBbKIgqgbnkStpyYf+cCJvkZYk4kPr7K25nkqqkmg6f7eE6UjeWoFEtSi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=linaro.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYaa1Cl5anKKhLEecREbrmn81aSd/+hK+Muze5bmNwc=;
 b=S6VPJWSBvpsaNwATgRdEKHYMlAJ+ZxpA7JJT2VVDrhY0AvZVracG+lNW8VF7oml7z1QX6zIoDxD7gOOpa3YDP8UQ1rX8ztoD1yXVrtHoN0DGKrOOWcEpvbOvyckuWIvhqFm+Y/FWw0PgnnXutWBNG4q8LcxyXop9/9Gx2PU5SDtx6zVlsxf7aUvhUcTpdvA2ScXLL8Qx1v2PvWNdrs5x1jqRlEs1NmjyGpd9oCghng/BIpZFtLLfTDyph9yTZWaaqsWhIAbbvEtuYQUrg+x3/DItP6VU2c5L0gq/12rHkPTcnxW6NhEZzfJAqJGLJDYB6NJSHUEH1wPaJil/dJdDPQ==
Received: from DU6P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::15)
 by FRWP195MB2940.EURP195.PROD.OUTLOOK.COM (2603:10a6:d10:185::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:39:58 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::22) by DU6P191CA0040.outlook.office365.com
 (2603:10a6:10:53f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 12:39:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 12:39:58 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 13:39:54 +0100
From: Daniel Schultz <d.schultz@phytec.de>
To: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 1/2] drm/panel: panel-simple: Add Sharp LQ070Y3LG05
Date: Mon, 24 Nov 2025 04:39:37 -0800
Message-ID: <20251124123938.936521-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|FRWP195MB2940:EE_
X-MS-Office365-Filtering-Correlation-Id: 997e8ed3-620f-415f-f5c5-08de2b5693ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XxRnF0h+KU9ALKy5q96QjWLzB9W51Ri4I6KvHfClK5BOe+HdpXRaph/OwHCA?=
 =?us-ascii?Q?t4OaMHdWPyksccQH7FwLdibKUC47LdbI50IOeUFTiP6dIl7zoNRKt+JKGDKu?=
 =?us-ascii?Q?YHdXF4f6/sC9UjjoJpA1k36vi3zZo99UDKpgjXo0J+XxMg54zaJGy5WKk/Fw?=
 =?us-ascii?Q?oMDquBe7wA1t79/jCKXmslywPSnZEtNxJFi1ZNsFKpm817gl255YiXi2Bgk7?=
 =?us-ascii?Q?geX0xXIuef8qcAgcHe2BHfqFDjerAzsFeBDDvz7FJwBxt0WAvzuhH/xLJsnn?=
 =?us-ascii?Q?HogSmjrOGTLdHJ018OtXig3225vZlIg5qokvOsC2o2CxuABgh/UP5yA8NnJA?=
 =?us-ascii?Q?DWkUdwY44MWn6AQOAotWHGL5VctSkY0yzPLrOwm+C3Gnbzk6hrOqlhITRohd?=
 =?us-ascii?Q?dUgjwsI/jaDjlXguEd8lVAMD+wAabMye2HIM2G7KVvDNZpEopuqFsvba8la9?=
 =?us-ascii?Q?q1cIeDkx/5K4nMlA+C9+ZbA1/NRfzd1BxrDU+lMSkT7EMGntzVkTA0GnfFPx?=
 =?us-ascii?Q?cecUnr0HQ9A4GoBCa53DjpEXXNScyR0hZNqwKZvCMcvM/MCdcrlptq1orCf+?=
 =?us-ascii?Q?IB9gnk87RsGpCEOqO4sFRITyHx5KcI+ifUnokzB5K0GTltLZh2tpQdbMK+3E?=
 =?us-ascii?Q?JqT0x8+8eDfwtL8SBanPQTrb5jcfMnSOOpyyFzzJhz4wkOtbtqxawl6OdfPi?=
 =?us-ascii?Q?TZambCySW0e53m/RjsL0s+4ERV+8rJYHFFAIXnE+0wsBHCSIxX7hYqXJqlWW?=
 =?us-ascii?Q?YPcFbBiuaCm4NqQ8IFW422AVenIoPixQoLMtYBS0qgBUQ7N5gfZuDcQ9k+oK?=
 =?us-ascii?Q?FcCx6Ro7/R1S85z95cS0I5uZLPvWfeovk0HrLCIskOyW0WoDscM41CQogb+/?=
 =?us-ascii?Q?s4TqJDLF2ZUfhWk5WIcVrKSgBnO1pJxXiBxJLh/+vIm5DdNboJfvFZdJeQl7?=
 =?us-ascii?Q?OpvL4Xs+E48DvxIQ2ailn+GoW5VE8itssgIGIJ8tINgzYBaw8Gjk0z/OnNgN?=
 =?us-ascii?Q?6+Cy9KaEKP4c5OzdWZQLu4guxcpjiiFI44sBDH0dbmsisIb14eJkEZ/Nsomu?=
 =?us-ascii?Q?suADRUcq+gPAb8aCCY0fTJFXmOfRz4RHR3sMgbtjcDLdoQh1X0UUTyjTWLdN?=
 =?us-ascii?Q?/qrxoS9J5IA51JStucIFlMMJML9fsxryAbdGvU6Ch4h+hUl2zDzHSNSUXlRh?=
 =?us-ascii?Q?fSPtunUkxyHEq5/+WpkDIERizc8PFImmkCpL7xWXj3blPPUGvcZYPAYec9t2?=
 =?us-ascii?Q?sPFZZod/eHDRZ8TG42AcTbliSmDxjHw5nGFuAQpdezoVyRf6vdD06qPqv5P3?=
 =?us-ascii?Q?TIaHqElocR2AnOTFooweWRiyJxQh30Ft2t1GgnYXQahRX34yOVcDv0WCtQtT?=
 =?us-ascii?Q?TEENnzHM6ol0YuqMyw/nL7PBT0EwxnCg+no/X2c4EZXpAYwg5SqLvCWM72cU?=
 =?us-ascii?Q?oNuFiPMQ40B7Pl6V9eBfQxJGb70urS/3yagLVHk5on+FOJ7fuLPe7cxGrvCU?=
 =?us-ascii?Q?c8heodVWJ3EuG0RDfmynEOqZViiZrNJhJjw/O29skHrGTfXpEzqlPwR68Zps?=
 =?us-ascii?Q?avOGi2R8W99hRBLsFRu9R4BUqgYHEtJcjbgG29ML?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:39:58.1298 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997e8ed3-620f-415f-f5c5-08de2b5693ea
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP195MB2940
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the Sharp LQ070Y3LG05 7" WVGA lanscape LVDS RGB TFT-LCD panel.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0019de93be1b..9ad6beeb9952 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4266,6 +4266,31 @@ static const struct panel_desc sharp_lq070y3dg3b = {
 		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
 };
 
+static const struct display_timing sharp_lq070y3lg05_timing = {
+	.pixelclock = { 28000000, 33000000, 40000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 40, 40, 40 },
+	.hback_porch = { 40, 40, 40 },
+	.hsync_len = { 48, 48, 48 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 13, 13, 13 },
+	.vback_porch = { 29, 29, 29 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc sharp_lq070y3lg05 = {
+	.timings = &sharp_lq070y3lg05_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,	/* 153.6mm */
+		.height = 87,	/* 86.6mm */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode sharp_lq035q7db03_mode = {
 	.clock = 5500,
 	.hdisplay = 240,
@@ -5367,6 +5392,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "sharp,lq070y3dg3b",
 		.data = &sharp_lq070y3dg3b,
+	}, {
+		.compatible = "sharp,lq070y3lg05",
+		.data = &sharp_lq070y3lg05,
 	}, {
 		.compatible = "sharp,lq101k1ly04",
 		.data = &sharp_lq101k1ly04,
-- 
2.25.1

