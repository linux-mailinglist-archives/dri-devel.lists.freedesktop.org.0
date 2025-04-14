Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F09A87681
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D6C10E465;
	Mon, 14 Apr 2025 03:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aZYBiRGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C95F10E465
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6SjjJdoarBTDnZUxxLbXdp/t6JZoBrqJYCDg6ogOAGykzjev/msqsj8sn5Z7dplyEDNYdcAqcWg/RCrJm8XfUqw6z0Pjlm5Tee9hyxb6HPBb9/0Wf/pYlZTLv54KEuzJLbsoG7crvKgXUlb4V07PR8GnnupQxJFi9bkDQU3Y2aoXJxaIWoccCdDLkdPiJQ3MrheLRlFNGb3f7ADxlyP3KFBi/1ZaM1HCINNtNzETLvKWDx6cmytKmpwlGOP9Yfi9dXAceLZgtYrlwQtzRROXxkv02vtdkpy4JlOrvY8d2ABPVDD+2uEUx8Zm3XNiTiokvgO5GLUogZUr4+EU9NuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+kL9UBzdrjmaegxyyDJO/ugO11EskvSdj0RB2Cqlgg=;
 b=lrP0wxuFn19ads05PFBuJANd0cpKAerGWmLfbpIxYBCNRVHEPp/v8goUllRQSXCGmUdqPteoaxWyuTM+I24d3zIIHnMXwBe8X917lwy5b/FhVhm+Ki8Wob8nYdGs2g1F5n5xnh41T/kDY8Oj556A+nTC7jAm0gsjnpIUl4ob5WnlrDX9inRFCiRCpM13aQxhb5/6qzO83lVD8QF7CUGXAMjLKcmPmmYxOMrfuBBtj7O4csVDVZixEOtkbYyUmuC6DgRnEPaUlu0x3ig80ng+cVImb7i75w3Kt3JaZzCmoE+fIrqGLCQF2nlYmHio1H0Wgn24JSNJ4NQg42jNwT7xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+kL9UBzdrjmaegxyyDJO/ugO11EskvSdj0RB2Cqlgg=;
 b=aZYBiRGSmSn3glPzX6bqaYGq6bnbgLKIAWr0SqlqzJskeJZoiOc3zRf2bz+tG+1iQ3YmTK2/6XFj5dJcBukWeDSBMRiPw4JA7TI64UpQ2M1igbIDTCKMh6j/8PquQDJGvoaWDqy1E9jjIOC0Ji7SzE7KQOhVJk5xuFfFOrZ0d8HqPiYDv6FV35x/E1iFJ6Sziv3BjzHsGR6TfNcTIirZMaB8C+ka4Jssz4MGROwYepKLMug0f88RTc8QtXXxFufD8qnYZqzMSAkWYYawVbgxzC3LRRwEyJKwWqA2NQspuLE1TFVW2/6rKrl2FvcHa8WGY2bAmafL/M5i5zdEGJZemA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 03:51:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:51:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v9 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Mon, 14 Apr 2025 11:50:28 +0800
Message-Id: <20250414035028.1561475-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcb326c-9259-4091-e3a9-08dd7b07b1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2z4hhOuZw0pBCSrHkOp7ME3GXQ4y4SUJQXGkGB4AqJz5F0WWoyYEh/g6Imjv?=
 =?us-ascii?Q?8B8u1YaQVismJT/Zj4cXQfPfSvGKLuZBZ7s2ANaRyx5d9COAsF5CbhdMNTIC?=
 =?us-ascii?Q?80Yncbssu5M6fO/d7SL0eg9RwuYwB1ptCFL3HoAvs5UX85IFnFLVqBJZr7Sq?=
 =?us-ascii?Q?4C+RBtYtFpkCmeRWyoRp1zJj1ivNeYlYsaL11ueOJSnvivQ2D6Z6w1thwlHP?=
 =?us-ascii?Q?jjOD0lCPK/o07ZbD7Asb8MFzNGp3Yo0YYNsfSegKxzXMDEfA/3GDobxUIOJa?=
 =?us-ascii?Q?JBfa3zKJOqMzf6YJwf1v96DyqkIDeDTGB8LOZZ54naiLcmZN1vQ+SdN+Y9qa?=
 =?us-ascii?Q?GGwRpetHNM5A1+t0R+8mUPJO6vNJbOqaPYx8GackRkBq4pm4E6emV4UgORgN?=
 =?us-ascii?Q?I/dMzSDYC19ji4rLkB9m9AQmpLT1AyezNa8sGPzcCkhCPBgHmunq+6pP1xVc?=
 =?us-ascii?Q?NMyGWoiIEe2ueJRsic9zPhnqSzbQ+gSQwBZsX2bxs8P9+3fpV5Zq9p702e5V?=
 =?us-ascii?Q?QqgOPHi1tSRn9UxeYixXcbbHPe3qDK9WffoWNL70KJUFTebXyKcTAPTr51Dg?=
 =?us-ascii?Q?d6YzvJMDG8LbqJ6eCFeoqB8LRdL0Jtn88UsD0XdGfLoA9GZPfjy1VhUlWhZH?=
 =?us-ascii?Q?T4cuHSmJkwW61pl0QmHJsjU4TtBPZ3lHZxl1deoxrz8mLueNaSL5K3QOOU3Q?=
 =?us-ascii?Q?kohbqpjvdn0nOvFq9K13YFXy7sCJv2lae5HBW6dkyA+J6tbuNbkJsZMAg/bE?=
 =?us-ascii?Q?idl9ZDSOMpSTM7wBi/fnqtWiarGy0Az/KheQUGzj6B9GfVLYDJf1QRAUm5+v?=
 =?us-ascii?Q?aLU9uD7/j1Xn/vIByvqiz9yo3cuvuhEbTgikPAJ4KY0Ykh+JLQHXkt6Hkiqd?=
 =?us-ascii?Q?reUIF3dA/gitv/e0k4X6gt/eUqtuogrRa26dULUWxAGWReU5ascmad7NPv7D?=
 =?us-ascii?Q?jhUI7TUMpEP5XekIKyRljXwYCwhSwxIyPYSQoQpk/l825WA+cS+EfoApZ/+X?=
 =?us-ascii?Q?9jlaj6Z+qBec5UKgj1sIqg74kwpnXbSgVvfF0aIXeCS3uEnwYmhdkl+UaEcf?=
 =?us-ascii?Q?BzxWRjodoh84TbctiVtfW8fyZPBstjqYOL/H05+FhS7Wfll/ECSbMGEpTpVF?=
 =?us-ascii?Q?Mr0Kamlg+ftjPHzyJbp6XbHN+9JbCgJMF7qa+zzX9bB4TbQB4jG8+pOVl15g?=
 =?us-ascii?Q?JmabOKiaXV/zjK78jvoBr8CY5kHTyYYHNlxwOdTh5hBBK0fTjlavni6ayoQo?=
 =?us-ascii?Q?cAwUvmqfBfy5yNYUUB6Kb0zGaRO97lefsS7Yw6y5Ew9ma4D5YkhtlaHE6119?=
 =?us-ascii?Q?7Ziz14QfVgpTHlutI5jBheZ0BUNa9GAXYeDyRPBePaUpVNbqfH+3+4hh1ajf?=
 =?us-ascii?Q?dPgdJA68H1JH/vafRGMWR91mUnhlFK3jXT6C+xw+bOOwPlEPHCxrBOTUU6qZ?=
 =?us-ascii?Q?EN2FExI+QjUtLbUOETQyF2FwYZkZRc2lLqlv7VdAB1C7/hd+srmkKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cpaBBAE2D3oxC5AR6aNnsO8NzwTCDAUKsw+D5O8DLnA9rE2+gAC/l0eeacx?=
 =?us-ascii?Q?IYLaVM4FnqNgmSdSeJlDeWCAn90o3bAZhivPpO7qR8p9ZCgFmdlg2EhmelhF?=
 =?us-ascii?Q?Qtbme/AGLeK1ogMmr0GIMUTyYniwCH7HJQLG+Q9bvxVSJvl8wilHl0i6nqmz?=
 =?us-ascii?Q?2MCrSmECWslYahByhAqbs+rzTli1Y7uXiVgKvo0J5t5DiRCL8Qbd+QhyF8my?=
 =?us-ascii?Q?o+73Z4OHM2QP3W+Mjbia0ThX8rpPNzEp+0IGeWuQxbOcdEWa+9NCtLyeugaC?=
 =?us-ascii?Q?VTGMUHOuNDTQJNeccZcyJpaG98ym4Qbox947GH3Qnc4nbAd0BKYu/ESNY9Eh?=
 =?us-ascii?Q?CBxNkMTe/3Z+r1nzqVNp3ciI7FkoWWfhx81fNvOzET+HPLpPq5XadMnB5QGN?=
 =?us-ascii?Q?dJUxeb4bL9QEMUgXjK4Ov1rjI7aZpNsMnaKhAnnnUYzmvYrjs/3WdIUlxEWe?=
 =?us-ascii?Q?0DR9pmw3z1W6c5thPoDc4C/qX06FOvLgOBU63BtNOECHRhxnVdEp2RHguEm2?=
 =?us-ascii?Q?M4HiNgxwtDRCn163K1yhLzQ6c4Bef5dhvh+qBDsSqyStgS77LPD4NQ976RLV?=
 =?us-ascii?Q?rNLqMdB+TRCONc82rxF0lIwXrkKA3hatKSl7ad+dn+wzumfu8bvZ5cz8TNy4?=
 =?us-ascii?Q?UTIs21g2pqXcvK7Ea4jiEy8YUN2q4pKiWNy2gYQp1LuiGtK0Frl0ackhHUmw?=
 =?us-ascii?Q?CHoAFGx0K/hOeyjFHfjiRLzvo9p656nVoMKWqIb2YVjvaGxMAPknXgWNrztK?=
 =?us-ascii?Q?6Rnvh6CAm/O+vknaCuUog9q9HWTjpA8TXjzDcjPpZb57p8nPm1IsQS2KpWzD?=
 =?us-ascii?Q?qQZg1QzHS1lnakKwgj5YKRUS8cH+nY2Gk4GKZu1Y0ie3Kmc8mUTzGgGz7vuM?=
 =?us-ascii?Q?mIE6tP41Pv81HH040p95Hp3M34BhNGHnIqI92FZtMgr0Azgv2hEFgaGm2m4y?=
 =?us-ascii?Q?ToUMOBSDeuY2Esl5rx7EDORCVsWkgXZyzs9LSHI60q1LN6Z+UTTMf0MmdbQ4?=
 =?us-ascii?Q?UFq8CKLyAd6sXfq8dIUFnxiVYrmE0dfX3lIIOEqCSKgNqNNCg0SHvJ6w/KJB?=
 =?us-ascii?Q?nT6XT7FWUgEpbZ0kUpZQ67cGEaUmvtnbU+8sLtPkJisFVVjyIyuUb6cjjEBa?=
 =?us-ascii?Q?R3hh6VFQ7Qfb0y8LMDAMMPzsx6zIdT6gwIqVRLuffJPpcWWyWLMSf4ptMaCc?=
 =?us-ascii?Q?EigDbdRFhGWzVotn1iQtVMVizI4bnzZMY7gqkUgV690b2t9OvfS3VWM/inbV?=
 =?us-ascii?Q?7h2oY2oTDvWcqkJq5ZYDIzBD+simf7pBnyjaGoLfsGcKIon3NioTnhLkcdqu?=
 =?us-ascii?Q?raR8cS6DktFhHwbV22DiiGulhH+1r6EDoY7f+SeDoZkhKev2hjHb8mMMPH9A?=
 =?us-ascii?Q?b3PBbjwBfIHZ6MidxxycQd88hT+Sn4rF6UKVcsyVM4pyMvyYnIeXkKgIfWC7?=
 =?us-ascii?Q?ZzNgtpo4Ir/d++naK1ZAIb58Fn4EwRdThQ+wGbROFywr8ujfmFt+0o+/XXme?=
 =?us-ascii?Q?yv/vQLirDjX5DfcxyLvbo+jZI1Xt5NNkghTac1jWNW4dyFGVDT/lnd2PN3ZZ?=
 =?us-ascii?Q?eRKDkm1T+wSu/QQIKWv+8TQnt/C/2tmR57IofY+s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcb326c-9259-4091-e3a9-08dd7b07b1c1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:51:53.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXxIlzSuHjVt0KQetJ5LGW14qtBy0LjFvlDEnLzAP7+seKo7pFOMiQjiO9GQPsm46Mgz9YWaEOT8SJJY0V+gQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205
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

MX8-DLVDS-LCD1 display module integrates a KOE TX26D202VM0BWA LCD panel
and a touch IC.  Add an overlay to support the LCD panel on i.MX8qxp
MEK.  mipi_lvds_0_ldb channel0 and mipi_lvds_1_ldb channel1 send odd
and even pixels to the panel respectively.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9:
* Rebase on v6.15-rc1.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  30 +++
 3 files changed, 215 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621..ec3f786b15ce 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -284,7 +284,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 
+imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd-dtbs += imx8qxp-mek.dtb imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtbo
 imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx8qxp-mek-pcie-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
new file mode 100644
index 000000000000..7ddd90e68754
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&{/} {
+	panel-lvds0 {
+		compatible = "koe,tx26d202vm0bwa";
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_vcc_per_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_lvds0_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_lvds1_in: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+		};
+	};
+};
+
+&backlight_lvds1 {
+	status = "okay";
+};
+
+&dc0_framegen0 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <940320000>;
+};
+
+&dc0_pixel_link0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&dc0_pc {
+	status = "okay";
+
+	channel@0 {
+		status = "okay";
+	};
+};
+
+&mipi_lvds_0_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,companion-ldb = <&mipi_lvds_1_ldb>;
+	status = "okay";
+
+	channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_lvds0_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	fsl,companion-pxl2dpi = <&mipi_lvds_1_pxl2dpi>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+				status = "okay";
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+				status = "okay";
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds1_out: endpoint {
+				remote-endpoint = <&panel_lvds1_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_phy {
+	status = "okay";
+};
+
+&mipi_lvds_1_pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm_mipi_lvds1>;
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_lvds_1_pxl2dpi_dc0_pixel_link0: endpoint@1 {
+				status = "okay";
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1: endpoint@1 {
+				status = "okay";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a4427a77ed50..a40bfdd2a2cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -21,6 +21,16 @@ chosen {
 		stdout-path = &lpuart0;
 	};
 
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pwms = <&mipi_lvds_1_pwm 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		power-supply = <&reg_vcc_12v0>;
+		status = "disabled";
+	};
+
 	imx8x_cm4: imx8x-cm4 {
 		compatible = "fsl,imx8qxp-cm4";
 		mbox-names = "tx", "rx", "rxdb";
@@ -58,6 +68,20 @@ dsp_vdev0buffer: memory@94300000 {
 		};
 	};
 
+	reg_vcc_12v0: regulator-vcc-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_12V0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	reg_vcc_per_3v3: regulator-vcc-per-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_PER_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -817,6 +841,12 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_pwm_mipi_lvds1: mipilvds1pwmgrp {
+		fsl,pins = <
+			IMX8QXP_MIPI_DSI1_GPIO0_00_MIPI_DSI1_PWM0_OUT		0x00000020
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
-- 
2.34.1

