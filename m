Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C08600A64
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0524310ED28;
	Mon, 17 Oct 2022 09:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA7E10ED03
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7Rx4pL6iM/klYO9DnR0LlrkXE4+ncw/K87GegPt85j9LJ+YUHYawLqXgGLQgMYwDVcU/dQrbrUksX2k8GkM0HYVmOWEdakf6f8A5VtHHwX1fEJQO7wtxTBGoAl/o3tPd61gh/PSKCmIrDyKaIO5VkzuH296jMwEyiqiei6Wno42Y9Ma5VUV2MKMZe6MQaq1NiGUnYnwttbvw3Om6AM4RBHGRNUsZL18kXFA6h+2QgiXVSyoHEwWzN++6vEam/+AbSvPVaWPQIBuDUb4TDTbqTze3jSvbJiic6cSj6oFhCRqMhtLrfspRAjxj5bpKmL/3tHKM7Z2LopqaNCD//TdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj0Dmcm12Caz2ySX0dTM3fMwfwtUIGpRYJvAGBLa8Qk=;
 b=FWBrHB9GwgX1BEH83k3cT/YXlSAZFKnH8iYRqFp/n7DwVi/MuHc5L0++dakbQqC+yek/XebT1CVsKHlCoBAbd2CJQ6wbrjwbT8+6J/ZPAs5t/biLh+dvtNyUM6UPKeDJYGVdg6yvKfTAK+v2PKnIAYbe5Uxre6vUaOCy3gQps5oBkYfN3pukTIj0oDJWzWTXsZPQV/LegFJwR1KHzFfKJRmhi+cPu1hAIWnUczSdrsfUIT5Ort0JXJLrIJhUU/c2oTr8NrNr905+QZy/Icr9z0kYQN4y8BVq3Yr/nNQF792JA6QmSo1uXfQKPAtQdhEoJjnWqm691U1AJj2r4fBiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj0Dmcm12Caz2ySX0dTM3fMwfwtUIGpRYJvAGBLa8Qk=;
 b=o5N/ZXbIwSlxqoobyR86pK0TZNoBT5jjleSTPul0ClnVsLejnFmeliXkCyLZRe07U/AuOsxeOmOXZgvTPimT7ZLquFfRNEYYQWHBNTVJSuyGVSm4oSUDscAMknI9YbJLNCep2u9TJiLjE8MWyuJs2UKfEXzqPq7JtXPCwKMzWzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:21:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:21:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Mon, 17 Oct 2022 17:23:03 +0800
Message-Id: <20221017092308.249665-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221017092308.249665-1-victor.liu@nxp.com>
References: <20221017092308.249665-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: c5662702-6a1e-464a-a83f-08dab0210832
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2K2bEI6VYSsG3BgfmJeEm3X3BhSH7GmllhtwmZvxAtXUhYsyz3UocyWrRnd/OyqExeboAKVVj+nMG4sXMmw/+8LZzC4tRMq23Ga/AamrYOp6HtIW9LL7wcuf+idKfV3bjzC8s+1C7OvXvM6wAvqCJRZTVGDkvFWFDZ1EHAirNsFqKh3YxWc+tPtKBgWE7HTcyRL+g0ZDWw5K0enOVISWfBnFbmwHjmKqBI9kF7rzcbVNlApjUMVTzK388eCciDLwZsNso5NsW2Bw6rwCaDUMTXZAQh5iMgavBb+lziexrcAgYs4SuB+95uvCbLkF2CcNeCtwuFo22iCBmlcMHbic8zbIxIU/aJhoD3jQQa1EL0S0qzrndrBqAf3OxiXvUaw8iJ5C8i9EWZEBbUHl/vh6uTbIsFuYE3y7PNBuU1zOHmaE7P90ZXOUADN2B7c8wouYpPmM6x0wZHsteDU+ZgszyUFq1VVurXKP6UoWWZOjZdrgkcBdjwlEkt29i5F9fLk+MV6qruy9YNFJ/j8FO9M2Xg5AN+jiiHFEgZemB8o/zYGUw1TSrt4t7etsI2TYEjeMZvHt0Q59w9jH0GViCaXExpeSjrTSMWLmVn0d/ZoKpHN8Uq36/hEnQD06O96+rzDHlqwRyFDNFF+yJotINmZcASphKHhaEFTKt8BStMVsUkqpcl6p5p2KAEI1zcJRzMsadsNXxysQez9syVSmNc37xUROPC39pmrSO7I2a5Pte7ekvENQwSLlpdum8KgiPAl7C+ojhyxwC9BOoKN2dl2mdOKQsiXiaM/I/YL4qqoAVPsRHmrrEOf05mxAr0aZjCThaUwtDfy8QFUruCZv/o+e2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(36756003)(38100700002)(38350700002)(8936002)(5660300002)(30864003)(83380400001)(86362001)(26005)(6512007)(6666004)(186003)(1076003)(2616005)(66946007)(7416002)(966005)(478600001)(6486002)(316002)(66556008)(66476007)(41300700001)(8676002)(4326008)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tp2Z8FIj/Nr9FB9OHZbyaRDxcqzBV8y/Y3sMFwh6Ecv7Ixa+MnWjKNIU+fuD?=
 =?us-ascii?Q?o9sGqq3RVZPz2lk+FkIXhz5/nFM9D2ug21SPoTHcTQLOPLVrOO9bNXlmoYLc?=
 =?us-ascii?Q?PyQAr6d8JLFWZ5siCVxVjSr5zESbAkNAaYCmjgMc7PIod2oIquI3JDChHqOP?=
 =?us-ascii?Q?00tzdSmfYva61DYRqqUXSypBT8TJUjmAM48B6gDeYoIyPFEH7t8zNXOaaOhe?=
 =?us-ascii?Q?Q5AaGZMNZAGi+OOn1gm+OZa9Z0iJAVzQmpoxgLzyoCDTsFckFpMX5uD8lyLj?=
 =?us-ascii?Q?6gCdKk/y6O1981kikQEOHRGP91aduZE8FAkMox7cIo3aIYthWlsCyN8ExkrC?=
 =?us-ascii?Q?+Hg/b7tVR6a8KN+7bZ1HVCk1so9qHApKU9jlVEoMElQEOdFFw9I8+y4FuWsB?=
 =?us-ascii?Q?UcZ+F1kDq4VuXA8ILX3uCpVQyZfsAiiS9cbAx9i+9d5NBhuviX/QPQUoRMhS?=
 =?us-ascii?Q?kPMFFWC5ZkpdXMGjesWU06tkv5nWj2/sACupF1DsnZAhZHQ+MSxcOoAjk8xl?=
 =?us-ascii?Q?WmEvMbJcRIU303cuQ8pSPV+3zy3ujPetdADkxhxOqCZO0YdMPP+t7xwmSvPt?=
 =?us-ascii?Q?qyjJMuoELAsDNzNN8Z1X+WsiLQr3prQyvdYnRZ3lYMug+xQfUh7iUGKM6aTU?=
 =?us-ascii?Q?QtITGaHlk3LWbdRVLAF8dqEO3ORe244gKFE/Lkmq4vejkYpxTQpcstrMrJd8?=
 =?us-ascii?Q?p2Ukn2p93Ud+iW0xBGX9czbYkQKw9+QRHNVE8fz/im63MDs7WwrNWZyPhVVX?=
 =?us-ascii?Q?VRpxNYBrhA2U2IYaX5QLqLOUBCyTAjBeq5759RXmHQf4nJn3agwPbO1B92wb?=
 =?us-ascii?Q?qs4x1bZ5WK2djlozgiQ5/X1HhCsev0OZ+8iD17p40SLVLSXmfem6nhPhm/bW?=
 =?us-ascii?Q?jYdlQD7XTVTwoNXcZdz6cT9RG/CJc0G3ifPWdb8Y+sJljbUY7rw83Mwq97cQ?=
 =?us-ascii?Q?jybDJxyjo1M++dmtGsHe9h2zedaQPlEjakdDEL9toypRRlOZgsXG8g8cE9jk?=
 =?us-ascii?Q?lArIyox+Cf1KoQHyIfNI3ZHFxCpxxTBU41Akb+f+KMJjsEbRww0TDh4CfrmV?=
 =?us-ascii?Q?KtBClmBSIFxi+062YFQ2z/bJFrzCGdPACjI00yVfI9jDP7XuOccPMD01/FXT?=
 =?us-ascii?Q?P92geuUggXqo+MafvFeYZZ/TRhXx6NUs6uUYpcUKk79pyfYgDCAz50ltzq+X?=
 =?us-ascii?Q?C6liaii3ii6nlr4deFzU+wb0goV0tW295G5cFHvhMPIigYJUBLg9WRNcqF3n?=
 =?us-ascii?Q?ShiTCfiLfZJc8iW2ikStUa4NnT81cftmn89LUZ2/ugpjPbLbd/FaHK3hvMVx?=
 =?us-ascii?Q?/VhIgXLvdWFwzOsyMskhRchf5ri2c1PCs30FjyigoTYNkgtMB6JNuYE8dPNh?=
 =?us-ascii?Q?8bCeC37VJWp9vT288MnkXYr620ClH9jpJmjtBzO7akQsdCv9oNmWpbqTU3wH?=
 =?us-ascii?Q?NSMIe6MgtrUBFu9f02CKUEbMaLkmLuUOmR3ArSUvke1ZHAefAxrfWKTwcsds?=
 =?us-ascii?Q?Hskla7EsNxZAEWy5lDwZOPMHB30a5m+KimqkfhmotmVaRYVbO1R2mtfSZWSk?=
 =?us-ascii?Q?7/bE56OegpAYyhBJyxHE4qK7/Er3z09KXk9RGFwt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5662702-6a1e-464a-a83f-08dab0210832
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:21:54.7574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKG7UzeSnC17/nC28tpWan/Bu5pm5rGBFuEYPDAxnVOqIgXJXhbLMhBVXyO/gPJVO2mG2jTF0LElpxhDjmWhGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v12:
* No change.

v6->v7:
* Add Rob's R-b tag back.

v5->v6:
* Use graph schema. So, drop Rob's R-b tag as review is needed.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Fix yamllint warnings.
* Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as the
  display controller subsystem spec does say that they exist.
* Use new dt binding way to add clocks in the example.
* Trivial tweaks for the example.

 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387 ++++++++++++++++++
 1 file changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
new file mode 100644
index 000000000000..6b05c586cd9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
@@ -0,0 +1,387 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Processing Unit
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is comprised of two
+  main components that include a blit engine for 2D graphics accelerations
+  and a display controller for display output processing, as well as a command
+  sequencer.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpu
+      - fsl,imx8qm-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: |
+          store9 shadow load interrupt(blit engine)
+      - description: |
+          store9 frame complete interrupt(blit engine)
+      - description: |
+          store9 sequence complete interrupt(blit engine)
+      - description: |
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description: |
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description: |
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: |
+          command sequencer error condition interrupt(command sequencer)
+      - description: |
+          common control software interrupt0(common control)
+      - description: |
+          common control software interrupt1(common control)
+      - description: |
+          common control software interrupt2(common control)
+      - description: |
+          common control software interrupt3(common control)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: axi
+      - const: cfg
+      - const: pll0
+      - const: pll1
+      - const: bypass0
+      - const: bypass1
+      - const: disp0
+      - const: disp1
+
+  power-domains:
+    items:
+      - description: DC power-domain
+      - description: PLL0 power-domain
+      - description: PLL1 power-domain
+
+  power-domain-names:
+    items:
+      - const: dc
+      - const: pll0
+      - const: pll1
+
+  fsl,dpr-channels:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to DPR channels associated with
+      this DPU instance.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DPU output port node from display stream0.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DPU output port node from display stream1.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - fsl,dpr-channels
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    dpu@56180000 {
+        compatible = "fsl,imx8qxp-dpu";
+        reg = <0x56180000 0x40000>;
+        interrupt-parent = <&dc0_irqsteer>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <0>,
+                       <1>,   <2>,   <3>,   <4>,
+                      <82>,  <83>,  <84>,  <85>,
+                     <209>, <210>, <211>, <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+        clocks = <&dc0_dpu_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_dpu_lpcg IMX_LPCG_CLK_4>,
+                 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+                 <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>,
+                 <&clk IMX_SC_R_DC_0_VIDEO0 IMX_SC_PM_CLK_BYPASS>,
+                 <&clk IMX_SC_R_DC_0_VIDEO1 IMX_SC_PM_CLK_BYPASS>,
+                 <&dc0_disp_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+        clock-names = "axi", "cfg",
+                      "pll0", "pll1", "bypass0", "bypass1",
+                      "disp0", "disp1";
+        power-domains = <&pd IMX_SC_R_DC_0>,
+                        <&pd IMX_SC_R_DC_0_PLL_0>,
+                        <&pd IMX_SC_R_DC_0_PLL_1>;
+        power-domain-names = "dc", "pll0", "pll1";
+        fsl,dpr-channels = <&dc0_dpr1_channel1>,
+                           <&dc0_dpr1_channel2>,
+                           <&dc0_dpr1_channel3>,
+                           <&dc0_dpr2_channel1>,
+                           <&dc0_dpr2_channel2>,
+                           <&dc0_dpr2_channel3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu0_disp0_pixel_combiner0_ch0: endpoint {
+                    remote-endpoint = <&pixel_combiner0_ch0_dpu0_disp0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu0_disp1_pixel_combiner0_ch1: endpoint {
+                    remote-endpoint = <&pixel_combiner0_ch1_dpu0_disp1>;
+                };
+            };
+        };
+    };
-- 
2.37.1

