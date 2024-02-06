Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5284AE88
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 07:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80010FF33;
	Tue,  6 Feb 2024 06:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn
 [139.219.146.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783B810F8B8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 06:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3glP+96ZfrQL/kgd9AV8Xy1nhU1QcIRBFskwye4j2QqPDeeB57aqxFlhweykWyfr/Vd6EbIDgX2wDJOb37RUqbzVh6SoW/eHCOVyQU6tPm4PDL5bVdmid5+2Tgmdh+OZ5EoWbdNO/evJk/3/6zcEAJKUbDKJY5BNi0PDKZ+lIHWmZ+hRWE8vFHw2bW3yBTc7c/xJCjt7xgncCgdoNBkPnFNiMg7Irkfoa8tv1JMEfn+B/qEb91hJbY1W4gGdQ9XdO0EKrcFukcKsnfyvSz+ZY/QuZ+pUiXt3FG5E1wbewEbDw0BEhErNCI1mcBZYLbKKoD+QQruA7yr3tTvwaR7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlP8BD48O4texInCX0LN2s8VYj/6VdWDP+lqTUeWMJ8=;
 b=Vx1f1rJfBvn5z8FJQW2DUDIWP2leVnLcCckL6Bqpd+i3umlxBKnrrb1MFG3kGvQ2Cbt9jSPIIsxoPyHqbAtNjFeVYYEUT/x6JiQFK0GsdCsf2TLM421lL3Z+na46MSgwXf45mlzIU+Qhq+fRyiZRzNfP7xDqS2cZ5ukyxqGU9Rtt0oLwwWBe/MFDXgTzDTz29qm5pLw5tpxlnl4KqLh1Nm8yQPQksvTNtvdQsrFNsGNFcaaoO8kv52bqUIsxmHjSK7KrggT2WuNwWifFSPPnDBQ6w6KNP+j1z+CpDIpUIy9enmu0WvzKzRvD/chI6H8pTuo+w6enfGWtFWOCZZcTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB0974.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.19; Tue, 6 Feb
 2024 06:57:27 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::57c1:eb9d:c4e0:71af]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::57c1:eb9d:c4e0:71af%4])
 with mapi id 15.20.7249.017; Tue, 6 Feb 2024 06:57:27 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de,
 tomi.valkeinen@ideasonboard.com, r-ravikumar@ti.com, aford173@gmail.com,
 agx@sigxcpu.org, rdunlap@infradead.org, u.kleine-koenig@pengutronix.de,
 sam@ravnborg.org, bbrezillon@kernel.org, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, shengyang.chen@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: cdns: Add display bridge
 support for dsi on StarFive JH7110 SoC
Date: Tue,  6 Feb 2024 14:57:08 +0800
Message-Id: <20240206065709.108684-2-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
References: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::23) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB0974:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a189221-e15a-4f52-5569-08dc26e0e17f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mVuGnWhglo2IjheUDfqwpvVUxrNS5bEhYsVCcM4zAbmrJaxBpnYKlZF2sGkh/OKNyzhROrQtUo/1TYFs/rYaUmIrda7lWsNcUV50XfApiCIxVmBSlHknXV8MS2hqjchDg1aWRqj9jSgz2bIs3SbkMw6ttQevIgtfkn6MJ1gvnQezwX3FGHgpnFUIwTzUwbsp3LtSJYCp0CZAv0e6Em3LLZT13ZKejJWV/sMZrAYkTiK2DlZKrLq9il7ocj40hWxe83leVeY8Eq4HsLe6/d3whmw3OqpGxp6xR5T+NXGpCGGY+GhGE5ctv0GlXKmp6yhIVRc2MX/Y3Gl3guvLaw1kNT4mb/3CCw+jiV5kIjoI7taChCe0YsRZgE32Tc0k+rsOFfk8asYH1NxFOAKrv1Td8gVOgEzVAu/BTxAt6eAUD+JUVrqUKedoHyI1CeU4bjl6T71W4DCRxWBWKAsldc60ZRQNQH6X9XsQAXJdlWo1aDi6nSrUqUH3j8YZPm3ek7lododVL0DJUWjTYas1FfCQ5UYsz2wt/3RbTrmD0JL6gvtSA+QgSK440/YguqdkKVH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39830400003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(40160700002)(41300700001)(83380400001)(66946007)(6666004)(8676002)(7416002)(2906002)(8936002)(5660300002)(4326008)(44832011)(40180700001)(86362001)(38350700005)(66556008)(38100700002)(66476007)(36756003)(41320700001)(508600001)(52116002)(2616005)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMvOO79wxk7sw+cGjWU17mXT96JmCIjC8pq/hk+Zb7rO8FCP09oh9X7szIkz?=
 =?us-ascii?Q?R1Ksyuvas89pU6DvjMLuRsC9JCLAMrY7C1GI2moAMXzA9mIzceono30+7xJS?=
 =?us-ascii?Q?pH1lXwdoLA1tHEi003CwjG81ouOWO3UJmMMRnzpDRNxPFf3qc2PEkmqaqhrA?=
 =?us-ascii?Q?iDTp3hj4MziRP8VpX7ph5Uhowae0ltGkDxy9Pj62uP0PlObNHhQWbVxDYM97?=
 =?us-ascii?Q?noozn1t5+dlmdfg+lFDSVrlNHHKPAHpi14o4rcDyNQqLqYBt3XuhUbbgpRYV?=
 =?us-ascii?Q?wxfLTTrT7oy1yCWBZUNrBNGwefPf4uyoIEhPiHZFMW/3kWylmrsv8EuUUlde?=
 =?us-ascii?Q?qbIuSzOZmPdMt8NEUgLInpw2kWc2wV3vxZ/vZJJMMjERFXEEw5IeQJvuZYMl?=
 =?us-ascii?Q?4LfU7DnRrErgYpZQT/cZUCQ4rwX9QyLA6N3yBmJfhKxkOEcZKioM0eb8Lcw3?=
 =?us-ascii?Q?ec6jt2ObQkuaxPzkbC0E8IUgLQYB55Vyj6QPYTaRH9WNHWFH/aB1uBMny9XD?=
 =?us-ascii?Q?83IvsnpLPAkDlWY04Qe/Kj/6+yh38bafSR7SDzfWBufSpxYNCsn5zVhv7GoH?=
 =?us-ascii?Q?6OuKaQhs9ZZN8Tk+pmoozuZ2rb3EwVNoJ7nE+f7kDLVy20hCGSzuU4cZpkRS?=
 =?us-ascii?Q?mmH+8+8mIneg6ROHF3gFntMDPeOX3RRz7ec9+atd4xZPxD30U4KEdft1+dHH?=
 =?us-ascii?Q?dIHuzU07L3OAuE8rsRIjoQdjcdojNGgxzJbx9J/Rw0QsNN95ojXNUwjzFwUp?=
 =?us-ascii?Q?t7JsITudqaGJhsQBxwbzIRW22G/9d47+DhXR1Si3fHqF0uwuXAYzOQ9v3tN6?=
 =?us-ascii?Q?z94SGXw3bW8kr8VVjYuT5X/ajsLBVc1uKZ9noVJ4a1gqmLpOg+v7faDMO9Ia?=
 =?us-ascii?Q?APTkSTbl/HnUSCrNYnts+IRG7N7P7FvG9BnHKJJP8S9OwocE/oSpTK1YR9mz?=
 =?us-ascii?Q?FM7dYG2+SGs7XFWOEm82pvGtXxv9IU0Oh8Uv+tr8WHtgo/PxPtfdkekPDLdP?=
 =?us-ascii?Q?wA5Xcq059lIz6pswD+TruNADZB13MHEr0ITKiz14eM1bvzhDGV+AGi6z/iJW?=
 =?us-ascii?Q?NIvyFfO1BO9V5jedQ0Cfo5sFKZoioG88o2XnqSg8igPqeev8mGfAyE+c5ya9?=
 =?us-ascii?Q?MBoyIstLu4HacpOYR+i8A3ZxgR4FdqLOkjwIxEvviwbKOujt4J52AacE9eYV?=
 =?us-ascii?Q?ENI2QBeolNS4rAszK1i+Du3g+AoDT7YVIbi2wMgUzcs3qgPHLRsBpBi1b1+N?=
 =?us-ascii?Q?ifNZZ5lUwe8jTi96w3yoDH5E7tALL7wRbJc1T8UVKrGhBVsWCGJTFV3la7tO?=
 =?us-ascii?Q?AH9SCZhbPd/v8TstdyLprab44rv86TDzZrs3qK6AvcdlKOW5Cn0y0xEErG6v?=
 =?us-ascii?Q?RI17QcFXxtUPjyj+VGzrXqrMz5rkb1namVXaOaOBwk0CM5gbJqKZLfh6yREg?=
 =?us-ascii?Q?0FwvZ6BJ3MFe+kAx+Lz3VMv1WgGpJ52kxVjac+0NEsFwsaI9bBLh1yyys044?=
 =?us-ascii?Q?jSFgl/egse/wdve1oEZDrYQ3ns1a2pV6TmQc8iVii+w8+YN3b2tBQ5t6kkgB?=
 =?us-ascii?Q?vun8Mfirz/xM1oVlP39RGHbvFzTllnQx+/e3hLoTfd1EvA1ZNZr36XiKgca0?=
 =?us-ascii?Q?Myvp8kntR1RTWGNnDarR9UY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a189221-e15a-4f52-5569-08dc26e0e17f
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:57:27.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cj6nPZ/9WDYNQ1xwmIXIzVyG7oWhR3mtO61/Glei6MUaQ1CXIwjBHSfIP2reRXspC80y61RfBSI6vHvUelM2rB70FncP8ifWwsfAFNu6xDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0974
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

From: Keith Zhao <keith.zhao@starfivetech.com>

Add compatible to support dsi bridge on StarFive JH7110 SoC

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
---
 .../bindings/display/bridge/cdns,dsi.yaml     | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
index 23060324d16e..4ad0ecaacaae 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - cdns,dsi
+      - starfive,jh7110-dsi
       - ti,j721e-dsi
 
   reg:
@@ -27,14 +28,20 @@ properties:
           Register block for wrapper settings registers in case of TI J7 SoCs.
 
   clocks:
+    minItems: 2
     items:
       - description: PSM clock, used by the IP
       - description: sys clock, used by the IP
+      - description: dpi clock, used by the IP
+      - description: txesc clock, used by the IP
 
   clock-names:
+    minItems: 2
     items:
       - const: dsi_p_clk
       - const: dsi_sys_clk
+      - const: dpi
+      - const: txesc
 
   phys:
     maxItems: 1
@@ -46,10 +53,22 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: apb reset, associated to dsi_p_clk
+      - description: sys reset, associated to sys clock
+      - description: dpi reset, associated to dpi clock
+      - description: txesc reset, associated to txesc clock
+      - description: txbytehs reset, associated to txbytehs clock
 
   reset-names:
-    const: dsi_p_rst
+    minItems: 1
+    items:
+      - const: dsi_p_rst
+      - const: sys
+      - const: dpi
+      - const: txesc
+      - const: txbytehs
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -90,6 +109,39 @@ allOf:
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
+        clock-names:
+          minItems: 4
+          maxItems: 4
+        resets:
+          minItems: 5
+          maxItems: 5
+        reset-names:
+          minItems: 5
+          maxItems: 5
+      required:
+        - resets
+        - reset-names
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.17.1

