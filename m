Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9415B54755F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE7E112E83;
	Sat, 11 Jun 2022 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D24110FC7C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naVHLAktfHOPpAhN1GnkMOu1vm7FNqau9XlYTjUbn0Llj3NacfRiG1b12kqkh8RQ+CDJVTAJ+LthPNj139sukUGvPhjaKl2Wt8uwttBheII/r62DO/G0rWTiSoRicfbc8JfxTOnYqkuBEnOtwvEVnxaiHlSiMaIB94Ddth1SckOQ8bFjNog0EioaaE0/SBsJkMkSdl0kZ9K2YtF/r7lkzKf0Uf/fbZ71qvrLjo4vWmHlWc6gVNCdXwfu++LedkPsvPcMAAFRkWEBleVhoioHSbpIp+Yhx5BlYEyMeJ9SNoP4/AjAf/Ge1Rh1ib+oPyKOwiqjv0+kflnAQc5p0v1hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtV/1O09gmCo6ebdaVoHXJHDZNvjIeOZqOMnUc4yXwU=;
 b=Fienni41feQGtzdQ2/EdceX+vqXfLnNdpk3vVHz0l7UQtmqoKOhO7M54OhS1tmwz1gHifcddQUZCR1Ux5L0Fv8zu7awFIzKvttJ2R4xRzsKBOO1tZ8DoMyXUs+Hmmbs7uxj0LO7fZpQjiMsXTNX7Ez62cGcyrY+H81vO6NWw9b7ZkLYqFym5GDMZz54wkeBhYhf3gK6ByeZwSX2rzUGPiEiRHGiimV3nyUm6SgE5MisEHwSWNZSiRXCTebSi/pkcjGGlDUC3AGvp5OoQYYfhH6dy62vIIUCgFcNzX8pgCJuY8cn55h/WogFyHHvYzyidsaYryajGCqBFJHrplJwhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtV/1O09gmCo6ebdaVoHXJHDZNvjIeOZqOMnUc4yXwU=;
 b=NGz4iNR3qZmFUDaLSjdzZeW/xXYeEfQ+W6VRxAiUdWDAR5FLLdC9us46HMNoSz4/mZtrOtVBLydhgftQPWTTeJF9PrecC1VoIxwvqxBEaeW1fetoWXD4B+lJSk3qPJwG6OCT+J896eE8BTRQmFTEkwr5ZRnfYaX3M6MQXSDDF5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Sat, 11 Jun
 2022 14:14:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:14:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Sat, 11 Jun 2022 22:14:21 +0800
Message-Id: <20220611141421.718743-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9150547-4bcb-47fe-2102-08da4bb4ae26
X-MS-TrafficTypeDiagnostic: DB9PR04MB8249:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB9PR04MB8249E3B91E0EF04B623BC51A98A99@DB9PR04MB8249.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CF50Ud+phQMNjHnTn0+8ylRsIdzzR5Fj1QJf5KZ6t74qSgZnLH4fpjvAtquHZ9VSR7Rc62TZDuw7HCFm0FpLnwfokW6N3VXpHvUKVSqLEFdB/kYD9NK4su/kZTo4LUUXHsw/yHxQa3AnhdI27ARBQZNtzT7q0Upw8PupgEK4z0COsNOymmtgiA90Pk1mmCdQdiu0BBPb25aSn/OVguIfwIVgFuhhOdZebMOELDoK4BEFvir1raSvRLtDJTtea1e8u9WhbhWoVFUiY+NKgUorATe2hWrPL81WzP3IYcFZgxvw/F1jfufB6NZiX3bl55oTaYFVgBIbrUxTKz4tLURorRfeRqCBC1+MBVZYikgO0UXU+1ENYWvZHU9sRPK8AlFV9uD3DBFIA7/Qgb0gxhb5eAP+klHqkxTPwAWGSp6uf9D5a+iqbfKBqg6ZmuZl/JP2xv3DUDNwN6Y4CfLr6nkejEIvmkr+LuF2Tdcog9xjn7eBS0S5K0qwpCHf8oqA6Ufk+s1EQdOwEzfX9duZDw6qHatBTXslxxnuBzkCXQkGyPoiDXcBV8JuLyk+/I/Gaw4PfbblFChIZB8w9+ZCXypIa/XcZRMIAbc8TdwCPblKBq0WxaCK9vypCs6CrrvVGyJonN5xI+Q4qPuOl/41jHORM1wRCCnzAOT19/Ho9m7EGhLRMPe8ZsR8KbZA9Z8HC7nkUmf0eQm1XS0K707z1cfvxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(6029001)(4636009)(366004)(26005)(6512007)(38100700002)(38350700002)(86362001)(186003)(1076003)(2616005)(8936002)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(8676002)(36756003)(7416002)(2906002)(508600001)(6486002)(6506007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KftyKW1QiwHh75Lv4fu/vW5Ny6eRT6AWPnZom9EjAR/pgWPXbfhZBmySdz7y?=
 =?us-ascii?Q?lo0PclYxB0MYprYn257UghmL5Wp2FKnvNE1rnzsmHJBHBTpLQRpi3LpwVsj9?=
 =?us-ascii?Q?OzcWMVCcSbmAxBlfunZlkdCrsi5vVfMnkQ/729VOIRGJx+D4qYUbrsx6R978?=
 =?us-ascii?Q?F72IOF5jE9ZfP+HOjKmwWGGP12CXUBa/aqGmPou3Ra0Jl9rApcfpLtpsRt7I?=
 =?us-ascii?Q?680V7Tuu8lQTydlo/cqZxqRCbfmwCnJ/wY8Hm8innlmkXkvVSe4RWeatO2A3?=
 =?us-ascii?Q?aAcs+3E18UDsEr/XGwpwe4Hr9ZZaQv+6AA1I69s7EWr2lcPC4WQuvCe0MNye?=
 =?us-ascii?Q?U7uJTXYf6UqqHmlJlpeQfnBoiLCCYBcWmJDYzUOmv+I7BhCMu8Z6kOp1MjR0?=
 =?us-ascii?Q?xV21GqOScCRl3rPrc9bXW1PNOn1TBhRtNwqh2KT0wj9X/Rmgj7ddEvQIx45W?=
 =?us-ascii?Q?KFsrigkn2v8pfTfwu65HOQd1C+kImkA0i9e9bK/VN2JqaeUlY1W9gehgKhZQ?=
 =?us-ascii?Q?0NehuBF09iiamdq/UrmuOuhfK7GQIWC+Jci9aO37ZQhe5xFfPYk9p0jXITli?=
 =?us-ascii?Q?LgY5G/WITPCd8Q1QU5AZmatz0VPkUYlB42g86JrVEJI/KYUGMTFnytfwvPYJ?=
 =?us-ascii?Q?42rLYBIEbrT0/xtHGdZpCi9WMTFD+z9j4KXknLnCTpZWTEOQFiMxemgRZITU?=
 =?us-ascii?Q?QfU9/LaNes+ZnPRE3DZxjC+LqQUlp+riDENoV5y6fl9TfOL8qCJ4aoMPX4We?=
 =?us-ascii?Q?xZJRm0+fQjagMiDxbSajTe5OLTcg5gSfPzF7vvaMQpu7xfHHCJ/Y6Wd1jf+O?=
 =?us-ascii?Q?r2suOxP3PZFxSMU5SFV7NXZQ9q6TzzddVYVcTr/oXzbbdFz3huBtR73L6Sa1?=
 =?us-ascii?Q?lGVXAsC72MbEcol9d/RBGkL5qeMuFjGvqSmgPJMXFjJX1L55GESD0z1KPcjC?=
 =?us-ascii?Q?XUcH+Tz50z46wIGrJ3AVrGgpgR9QwVnMbEUuYtb8SxoX6QwRkRq7P4BHYc1E?=
 =?us-ascii?Q?9sqjl/38K5qelpSh6daFfTxMvXRuR+gDEVAICLAIKMYDD2+Oql69oAUHAY0Y?=
 =?us-ascii?Q?twFz/JUGG2oYmrzaZNMYS4ZM4EmmH2/+3VJzw/rtaUI2QX3I7rnW/xlnm5Du?=
 =?us-ascii?Q?tJe3SQw1oFRTXH1YsrVehglwOPehRT3LVNp6l7NpT/bkSjzyhePg+pS1uIEl?=
 =?us-ascii?Q?T/hE7IiL2goTzTidMgBvgZavdjbjRhqSo7j53oB7O/4oiosvZ5r8Ag/gpFvX?=
 =?us-ascii?Q?qk1trZdCjWCQaQKdyBdMuh9L9HKbprtXWnWgVOF8UB5XLfXiy+iPmCgjupfI?=
 =?us-ascii?Q?WU6D1XIcDx9sOI3Wskhu3jvIX2l2iwf99dokYY631eonEa18aMGnXlf5NGYE?=
 =?us-ascii?Q?KZ/wU0uP0dSuV4QtUdAGzVNSD2xExu1Sn/HgilWxuIcFjbZJz0gwqkje2BAK?=
 =?us-ascii?Q?p3nMqdwmQ845xdaMs2RKyZC9DJvmL4K9K7ImQD9bKhrJy8nj9DKLsuPrkP/L?=
 =?us-ascii?Q?wcs+NnO1nTqGlNizwlXck90spFIuMwc64GSybXxSM/XWVuQcWJkF/kHUrhSX?=
 =?us-ascii?Q?xIgG0RezHqGXFQQzDq/b1O0Z3VfehrI/fBS7dSSd057A//B99uB7y+mw1+aH?=
 =?us-ascii?Q?SI1FhVa9kAmQsLTjew0pJUMigprrtLP036Ioeh9+Um9YFTXeG5Als2WcNVbl?=
 =?us-ascii?Q?dyKdO4jnfj4z/Ir9m7MoRHa4ryH2Pyu4VDypsyseO1Jrimm37s3iqDdu0cEU?=
 =?us-ascii?Q?FmH75LsuzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9150547-4bcb-47fe-2102-08da4bb4ae26
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:14:21.6933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5copZBv9C1EP+LY8IAN8mCuZlcHTvENtFz+htUatX1WmB5Au5BgnrIMWRtRiuXfXDzaN9hOYTxW5uoiWLJ8FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8249
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..033d4e8b838b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6654,6 +6654,16 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX BRIDGE
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
+F:	drivers/gpu/drm/bridge/imx/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.25.1

