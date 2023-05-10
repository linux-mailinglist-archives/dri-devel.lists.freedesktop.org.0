Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B916FDA8F
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14C210E216;
	Wed, 10 May 2023 09:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E78310E468
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeQxhYqGBj2EHHZIeSk84Q48UgcPuFAUfrwwGHMV41RY35wEL8P1AspJPlvU/XTiCQOqdrtIiLVIFJ+JuAUkOUCs8tHAjzg/iO7/0HFOfhhq4dqLUOifir7TVd+gDE1FOHGHHnnjb831IHeFeGr898DyKnLlQ/UZ2s1KaFqPPfWK/Hu7RYNFJ5wfodJxmoA2KnXU30UJIg3LY7T5ql4OTNG/37VmjCPk5JklY0FOeEfkm2MQV751MesSbgKkWyOEWUAECSgFDFhYWTxiGO1hhoc8x2FDHWkFi+Um6BkBX5aQlRVNaKm/JrADbcqRBNGxsWMZAPi2kTrNnjxzruBxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt/Wt6vQ8c5rpEREnbw7iKAlZC+1U2Uqz+cvj/tCRC0=;
 b=CbvKWtF+HbzQ2rRU1E70k3VVkRUHlU0zLKLq/n4h89hQhUM/bT6H13qUBs59O19/RFPKUymNqGXbQUHAulAsO+xwBCbyNOUcW9b4vj8EETIyf1uYDRXXipzmzmiX3APS31xiXWLPmWsqFmMzPhPTF+Zb6Zmuk1t5fT/OEl+biDT3Cy3Cuxw5yX5+OKrF6ZcB6ypQI9Hd3c6U7y3adHuv/ZrpRiYYwARdkoGEVDAFlGDHUS+EQPquN6U1SJyiDmo7ldx9yLr9UeS5Z8O7vsdWT8rCn2w0bsfZeWn+3D17RnzolMJS/YPo5mJc9PSYhkwEuqXwOJKFlK0f6naBK529Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt/Wt6vQ8c5rpEREnbw7iKAlZC+1U2Uqz+cvj/tCRC0=;
 b=SJBugp0u4yVriEi6/qc129kkWMvJ+78TolmbZeQI18qSBTCLXUZeuXJQP/sCM84IeTeQzBPogWD4r/h8A6VPeg+w0kDB0xe8wDBZsAzcBWWuXoyQa9WnbX9YkHd/Kz9SaxBM+eJpa8cVOT6qYLS+GK4xAfnCW4ZRg85LpJ10DGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7711.eurprd04.prod.outlook.com (2603:10a6:102:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 09:20:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:20:40 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Wed, 10 May 2023 17:24:45 +0800
Message-Id: <20230510092450.4024730-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230510092450.4024730-1-victor.liu@nxp.com>
References: <20230510092450.4024730-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0ea614-51a6-45b3-0cc8-08db5137d2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8pvUECXvbT7QxkUc550LUZG/yHjSfne1GcNrAUUekHPYul1ufNXYjTgn82qlre/bUPl1F2WmyfPOIKPMO+ajtHywP8LY0FOm2iOpeR04IqHn1CpOTFwu++KQO+SQGpDevXHf7m3EGnPtJ6eDAw+oPR/EJUaQO6Jl805nIwkE8Eo3tfIOj9nDIxQRI7DXTo41/+Yuc2/qMQC83NkNiyz0WZD92phBMmFNZt7TtPMn/24u/50JLiKuZAf541n+DsOHmexEBxN41WsNtIpZKbcA4+8uZIjpAy4abJcK+vxxb9Bz1mqKItcPKgwv0TT4GqRToMuWY24bg58oAvNIkNlwbWbZlBwDBepbWUthyO7HsIksfzdspz1ouUbYetgXWCGg+OqpUE2fUjElhkjUPWwGsgXc8hXdt1X5ynyYf1AUNOHF4VbYnDmnjiCS3Fq98at2NKutIdOVNJxjdSqhN6kb/l7v17WmtBMbUaqbX2GpvpZ/r14izDkvicIp9t+XLaBxatYT4/GzHS4zPdEtEC19unlzFBO3BfguRP3iccNm3C8USMaDBSNBFxm14MyKQnPBK+gldVzyXQ/3qDX/TXdYpOGbs5VdScxd+QZrBL66/cqp7XKYkAPJ6ZS1KsH8iryq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(316002)(83380400001)(52116002)(36756003)(5660300002)(2906002)(41300700001)(66476007)(66556008)(86362001)(66946007)(6486002)(1076003)(26005)(6512007)(6506007)(38100700002)(38350700002)(2616005)(8936002)(8676002)(186003)(7416002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UiazrwXxnMupZXsTjAWHJbgepKycdwHS9vIYpyXfrd7rZYZ2kE5WJCqRFeIn?=
 =?us-ascii?Q?QeVHQIw3B+3Kf/WONop9n46/4inSgBZ+czaTGZLWFGOsdfXXumz3iiDdHXg+?=
 =?us-ascii?Q?HbCkcrvb5/Ap0d2QaSrsrHhm2Xxs+OaOV0FIe3yzSTjkPBT2yGDow7BZGbUO?=
 =?us-ascii?Q?7u0x/ALuFycVO/HHiaF02k4cz4C9pNXz9hHEukPtZsl7RV5gLsCJw8FgNWDH?=
 =?us-ascii?Q?BrIHLbuFjD4KIGXa+r1/FEbHVEXHBOFsoXpsUmSU8SbsACYV/cqIJnk0wvlu?=
 =?us-ascii?Q?VzC9Vz+dpftDvY8ncmoIb9FqSuCHUymOkfZsPw+sBO6gg5D6ew6EkftFHTkx?=
 =?us-ascii?Q?Nhiz4aCKyRToos2Sy+B3G/G0LPhr8yKPWsv/tQsLnarYw7BSGu5DGdqQ7O8b?=
 =?us-ascii?Q?+oK2FsUyXxDR6RGX5TTBV5gZXyuq+znOjK56IsfXvdjdPw5gcT65s/jgTTGw?=
 =?us-ascii?Q?qCEf19vHSC56VvlmLrCYHdOdSmdQd4mt8JxB2xbRz7VrJPfBulIY1PNI1XLv?=
 =?us-ascii?Q?+pN8Mzbt1a2SnF2sLf3/5Iljg6tElLdcw7vf/+oFBhcDQmrjtGOgbTEdv4Wf?=
 =?us-ascii?Q?eZYhAykLpEos6syCdqh91CqY2VQfCM/YMC27qRnNAO2FDXlmljRwkvjypnqQ?=
 =?us-ascii?Q?YUH/X4O5csydldBdnX6WH8ibbqj+dazLcpwP3910PKuvSCpBuced2oNWctQb?=
 =?us-ascii?Q?e2Usprn03vbiEN6fnkFU1Vr7O3DugeJJWYwLqTugsbwYx4OtWfQcBNpAIduE?=
 =?us-ascii?Q?GIy3JLRj+RFJFzdSzBUUbDxslJBey2pEqzGnkwhqQbaZGSHAX1mvtdctLeaY?=
 =?us-ascii?Q?kUXPzd5DNqJrrnDR4QI8NX9mKl2+Q7h6wJ+yLsTSpqhC2seXUhpxU+gH8PSP?=
 =?us-ascii?Q?kOcd7K3bUYQnTtyCEAxVS5B9FhFD0dAn/G6LlW/mSElodsKOS8SsYDQui67U?=
 =?us-ascii?Q?8XyetckrgLj2eDE57eY6L6DkNNBEmY7Si4D7cVVoeMyICRrWkjlnuCTVV2iQ?=
 =?us-ascii?Q?XU2h7iivPliNaKGwMTjD/JlPUi9gbpsC7UdWkSFfu3RLLVKt2KIKrImeaEQy?=
 =?us-ascii?Q?QKmOrlq+buohMN/cUCcoMl5O7Trm7e8ujvFNQv9H/WJmEZymULmM0IdwMNEK?=
 =?us-ascii?Q?e3nY0EEsGRwQY6eISE+H6VO2M9+tpuQmusv2ufBWxXkBug7IcQJhznx3IoRy?=
 =?us-ascii?Q?2o3lNz5zoZLVqlcvYk/+0Ipd6PS2eJlXFRl9HUrJDetpWlzVvDqnCEmLeXLf?=
 =?us-ascii?Q?bl0pTE4m55kuBx0Psf8aGTd+BRO0VTaHcQV9l/tN66i2cbPHEN2R97HHDGeN?=
 =?us-ascii?Q?JrCrfgITGYEnaNbwTKFgB7g6G+XwZKeLHTaJ6PRopxJTCTaimpRChW+TVhAi?=
 =?us-ascii?Q?vDXLpYmviaSgYH+J+SDpaaOImcaESCGIHG1z4bh8Clslui79jMynDADAfbHr?=
 =?us-ascii?Q?WDnLoJ99cz9vKQ0uQcreM1wTl0WMmJcYkQ5l58+CL/4iTLkIhe+vYnqgM2gS?=
 =?us-ascii?Q?BSjBS/dtDbAuLLYD8oDEYZF6R8nYh89dP4wVfiiLCw3bhIPfkCAyYPFurX75?=
 =?us-ascii?Q?SBUu0zzFFvid3I0o9/lgdfkU+nweCdN+kOUw6aB9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0ea614-51a6-45b3-0cc8-08db5137d2e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:20:40.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIfyeZyBkkyyNCyXzCfR2GFfOYju8bxBmOx7w4Moma/ynN8vBrHv4q87hKLW4laCURZidvjWjWBEzwjaMyRZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7711
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is one LCDIF embedded in i.MX93 SoC to connect with
MIPI DSI controller through LCDIF cross line pattern(controlled
by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
directly or connect with a parallel display through parallel
display format(also controlled by mediamix blk-ctrl).  i.MX93
LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
tree binding for i.MX93 LCDIF.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Alexander's R-b tag.

v2->v3:
* No change.

v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 75b4efd70ba8..fc11ab5fc465 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
+          - fsl,imx93-lcdif
       - items:
           - enum:
               - fsl,imx6sl-lcdif
@@ -88,7 +89,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx8mp-lcdif
+            enum:
+              - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -107,6 +110,7 @@ allOf:
               enum:
                 - fsl,imx6sx-lcdif
                 - fsl,imx8mp-lcdif
+                - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -123,6 +127,7 @@ allOf:
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       required:
         - power-domains
-- 
2.37.1

