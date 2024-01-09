Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E971A827F90
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1766710E369;
	Tue,  9 Jan 2024 07:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2040.outbound.protection.partner.outlook.cn [139.219.17.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CBE10E35B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 07:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmqOsLopXDhHml/katI6kHEtsB01GPi66IRM81JnTNuqfRJi7FR+Aos/BEWH9BK0wzAJgup3rQSMOSDMnziNywv4irGctsNMlCW4o8ArGVyozaOrmM7L1fTu/V9kCVNGFbNbfsuCF88scphiycWbUrLQG6vzw/1hrP5tfXWZR+tr0Z+KMrj1t0wvAyVbNIXW7QnmbTpZdNHnPvjNr1xU8BMX4+/HEXQl3q7ealuMLabjilr1QCN1QdCypvLi0ZdlNYWPN0fDwudjKpyQv0SO5bqYbs6lj+F6NAvCgSeEpiUjVTKjkNcsjbxYZ4UGjt/uP4kfk5opxiDscIio7n0Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kqumkryVSdpbCjG5y2mqCPrbAy3Pxz8ya7rERp6Oxk=;
 b=V2SsxW0ey8JBlfkv+GGzcP9ZqZBwkPSC9YzaRsTqeAVFtBcHu8Mt3gt8EPHoZkqB73sywy9Z+2cYmip8isqZ31FxX2SVNeona78TDKlBAEiz8K5+DQEYiGaEFHKY4I5ZWY4++EhwNCLUqmBHJX/w36K1Ye55wVprsjAg5tr2kWmx4ya9QdmBF33GTc1RQOgx4CBPTgUoAXIXQdg4kxR4keJVbHYzpSNi6SpDu8Jfe7thSLkXqFiREOzunug8dHQPsLPCROKqdMMxRgquf/jzOpKv27b8I1lQ2xuN/YAwhIQwq79MtB3YdUQB7b+5kdAkg/sh7w9N007qClJiO7RRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.32; Tue, 9 Jan
 2024 07:25:25 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::85fc:7fb9:8b00:dd88]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::85fc:7fb9:8b00:dd88%3])
 with mapi id 15.20.7135.019; Tue, 9 Jan 2024 07:25:25 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: cdns: Add properties to
 support StarFive JH7110 SoC
Date: Tue,  9 Jan 2024 15:25:15 +0800
Message-Id: <20240109072516.24328-2-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
References: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1231:EE_
X-MS-Office365-Filtering-Correlation-Id: 789af601-4a03-44f1-e12b-08dc10e42607
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lbkfvI1/eraylV/9bDmX9pXTaYVJbKwldc22CQ5yniXYV1xgM0Z52uuP0hKNpddrZ+3vKTE3fn+U2pbp/W5pLJqGWaXoEiuc/UHBsyUeUCDZkTiEEsOaf7r4MeTo6+uRR4mb2UAxTLRoPZAPZXe89zdpw/mHLwh6IkMWSpDe1PhJje9AgDtnlIWA08DcHcZrF8Ukks4Q3U+f23e+Nn6Z7n3CDnu1q+4+sNaLfAox2c+8DVvYb91/wdcO+2ZfRosuzHj78UQ8rrKy3NqipFI9RETN1yVs5E3BcFSP4vy52vb0UxzH+kmyU4cSEK+OM1GhdXW/2e7SqCf651ob7/RGd15Wz+sQ2YhdmdwRCTNTV0vhASQxXndYr1auMpSA9dONsnGjk4z1qq7KCjydbUULSzJmBeE/t1uCukBVeRinzW5brAej0q+ERxt7ZfKwVsMOjEILpIIsfJWLV83lNAH0uQzP0JnOYwxgWmrrn5ZaTVaLeQ7Q/mA0e4Gd1wQCQzqv459zIZCNaXUUSnAvwBl4aCftAqg+XcHLnXYbzpKO/byIpM81rv6UcFbnAI/tFe5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39830400003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(86362001)(66946007)(40160700002)(36756003)(40180700001)(38100700002)(83380400001)(1076003)(38350700005)(508600001)(52116002)(6666004)(7416002)(8676002)(8936002)(2906002)(66556008)(4326008)(44832011)(5660300002)(66476007)(26005)(41300700001)(2616005)(41320700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sxXojW9gpMPwVen4lpTUSyyZmtQXcislezjqx2ws0JA21CeFWKnWNRztGpRL?=
 =?us-ascii?Q?EK9Pjgk3vv5kd0nZ12z9nFFV4kGnraRrxiVn1GzM0Rik2myIinjSUpORXcyu?=
 =?us-ascii?Q?WIy7+j+PyOlksV2lsNj6dvrX4nkR0e2DSSltqRoQYQEnnr2dQYBxYAi9VT9N?=
 =?us-ascii?Q?Scj7w51ZatPx7clACD5bvDVpgbuFy9Flm1uNmqpIifChNV9AlYFF3W325it9?=
 =?us-ascii?Q?fVkejgA+csRKApUWIDMbF//7sbTl00ETUeYefjeffTUJXTKs3VOAzECWZEQg?=
 =?us-ascii?Q?x/419IhP97x5d7bsYNJLCxjs7tEdmhGBn33uREdbvgcQncis1kzjn0BHG1M/?=
 =?us-ascii?Q?HsqiyC5ZonTDBLTNxaDwiUdmb5pU49QbJX7kPQFAoXBLnhdyt5g5vPyXRaZa?=
 =?us-ascii?Q?09Ahc9RRVKi9fPpHXpYNGbzIGpBNjm9nPch/r7uR3NChVCCvxVWQWQflnVFJ?=
 =?us-ascii?Q?W4AvbHKmSun6+N8PfeXIoIiomM4Ma14GWPdD3sHH9r0oCr1ej45sS/xxfy0g?=
 =?us-ascii?Q?ZjF8+UfwgO7H6nGf+9/+4mHJhgHBX3UyaNLT2d8FK2QkC+kj28q9hFy/6IS7?=
 =?us-ascii?Q?/qU1a/UCCcMI489yRb8YMqpJkallDY4IGdnwU27phneE4ZmnrGnsxhh04xUq?=
 =?us-ascii?Q?wDkuJOLa7fXLwMM0EfW5hOhkgcgRrdvv9NmGju0z+c8mdR/mBSDNZQ6E9s2D?=
 =?us-ascii?Q?tkUveR7+MVXPqMnbAfF1/lM9Xfi2SGwugaHgdDedG4obL1mis7OwKwyM7CEt?=
 =?us-ascii?Q?DajVkvRgT2YxauU/Gzb65P/AUnGbY5FKPm6WLctJJRQkzCNQQaaBX6BoRoCu?=
 =?us-ascii?Q?GuKAgJqPbWSXB/DKHVPpOG86Np35F7t8YjyHzwSS2JXNa8NMrqKxvyg0f0N6?=
 =?us-ascii?Q?qhuyEUmLa6kCsW9OgF8k9rwOMAWnvqi0X3O8PfqoOqExjshiwYUXfseQfiUe?=
 =?us-ascii?Q?zGu0fKzLHveclv6WiuuernOQrFR+QQTd/BFWKA9bw5PtxCzaZFSx1azcwJ/x?=
 =?us-ascii?Q?/W1rl/7iI84aIfVHVTE/iE3vDvFvFqbZNBRtsORJRygM8voveDzqpYz87lPC?=
 =?us-ascii?Q?sEDX5BF0K2T+3G4f63zPoXmISC7DoO53eYEVQVR/7dmRfWuAe5PncrYEUlhv?=
 =?us-ascii?Q?DJbQYj+Szi4waEKH6GpDYe2sOOOBdB5WZ7/Xt+IiZwt2DfnFeaPF8IjYWU89?=
 =?us-ascii?Q?z+4K/L97UvyB8dN0/90KFhaMoiDNOC4infoZNY6Mg4XnPOfdcUAv5YB5vTwp?=
 =?us-ascii?Q?lk/O0KV3b1S4b0oUsszOkuf0OQiXz80HQ3p0YTbxjj2OJ+IYVaNJThrr+/2r?=
 =?us-ascii?Q?OxR1Gxn7J9t5ui4jTYnx8qA8FvD7azB7t4V8cgCgaoHONzWf1Gxa+N63UJD6?=
 =?us-ascii?Q?ZnHSP6953m+ABp9mjATGllxUyebNrxWtCx2pvM8U9KMGry9PRi89tvRokB2y?=
 =?us-ascii?Q?fZwwF04KB2aRark+zxUoSY8Vlnm5C5Sg1I/TKwGUiYm4rGJti2FewoHzk4/z?=
 =?us-ascii?Q?lfpgx407p+/uGvYeBzoBsdy3EdptqEBc9JuVWnLbBLvvz4FPsObG8/QlSu2s?=
 =?us-ascii?Q?styTsfFhN9rnmF/ifUcdbDsRDpKT9nCjw64mhLD2sadWh4hfZ702tGrm6gx0?=
 =?us-ascii?Q?jDyTQeG+hEheFz98Pyo5f6g=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789af601-4a03-44f1-e12b-08dc10e42607
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:25:25.7523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mg6fOvHskeakmtW8bD39pRJCu3acbR00qYuNpzNMJedMvB9InCkCcNxOk6XapFspiLzH+vSbO/PZl8B/Rfp3aXs4X47pEQiDkDeH963aAeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, shengyang.chen@starfivetech.com,
 conor+dt@kernel.org, jonas@kwiboo.se, mripard@kernel.org, robh+dt@kernel.org,
 aford173@gmail.com, neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 bbrezillon@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Keith Zhao <keith.zhao@starfivetech.com>

Add properties in CDNS DSI yaml file to match with
CDNS DSI module in StarFive JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../bindings/display/bridge/cdns,dsi.yaml     | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
index 23060324d16e..da091e105794 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - cdns,dsi
+      - starfve,jh7110-dsi
       - ti,j721e-dsi
 
   reg:
@@ -27,14 +28,20 @@ properties:
           Register block for wrapper settings registers in case of TI J7 SoCs.
 
   clocks:
+    minItems: 2
     items:
       - description: PSM clock, used by the IP
       - description: sys clock, used by the IP
+      - description: apb clock, used by the IP
+      - description: txesc clock, used by the IP
 
   clock-names:
+    minItems: 2
     items:
       - const: dsi_p_clk
       - const: dsi_sys_clk
+      - const: apb
+      - const: txesc
 
   phys:
     maxItems: 1
@@ -46,10 +53,21 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: dsi sys reset line
+      - description: dsi dpi reset line
+      - description: dsi apb reset line
+      - description: dsi txesc reset line
+      - description: dsi txbytehs reset line
 
   reset-names:
-    const: dsi_p_rst
+    items:
+      - const: dsi_p_rst
+      - const: dpi
+      - const: apb
+      - const: txesc
+      - const: txbytehs
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -90,6 +108,28 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-dsi
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        resets:
+          minItems: 5
+          maxItems: 5
+      required:
+        - reset-names
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        resets:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.17.1

