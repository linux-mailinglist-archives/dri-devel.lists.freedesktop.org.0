Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B799FE203
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25810E2CB;
	Mon, 30 Dec 2024 02:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d+AapTbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093310E2CB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhuaxGw0U5EzHIhYdaPiSyhSLR9CtTytoA9qCYk4DTGg8sxeJGVMBu0VxgFt7OEjdPN+aHa6xv2TCe0lC/g9rwEt2+2tKvBpuysGtxivkRbT89TgbbIZ8rxSKMPV2q8kLOgrMH4kHXGKKnooqC/7linSo/EgRiz2Bxj0TYho2HfHN4UYhbB7BrvrZJM32oxbBfHb6GDTzR1bBnT0nRlES99f+EsrIATTWvuuDj8KGXlok3Jgqlj7hR9rvSMpSX1fjmRxOqx11PeVqZmt91MXCJJ7lgX4SkrNkAPqun3+ygAnh6fs93B3+S4zhyzyavuJo9G4+4HMXtnwYBgTnWhOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l17UosyiQwE0DyZJUSoRG6nijw0aqRiFzLbwr6OFQSs=;
 b=mF8SSsKN/piaSYUaKBvuwwh6YgYeDcmZpkXzCQmmlap+DGWk0Pq6Jb4SZKEhg63MuZEVVP9lqyCsx4Xnp/Cu7p9I/TKyzbMb44/yAfvo5qTaSx74Bw6sV6rVC1HqdrkCpQvU/unKg7ekGM6aBAiYGVLFd6FwDprYp0/ETFpsglBuNmW8AAgTdbkBo8Tjvf8H3x0pX3oBqIL0AEVVxOe36rQa105X45yJuOsudWr8ya8r3Em8BsAOqF8FIwfnpz16nGBGG78LJt80KDCXpXw0iGP5zFusOhPamUhZmAbDGTHKdrIMYF6HFjZSLHGLGnhmJWNlbVWvNDYh35ZA/UUJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l17UosyiQwE0DyZJUSoRG6nijw0aqRiFzLbwr6OFQSs=;
 b=d+AapTbgAE+jWI4XLqKxVMPxDahAJdqrpgGW73lu/2j4tc8zyADMbdb/gkwrz+65RtpVUIZFIVj8VonqwXa6KNYvFgh0/Zu2oLIbgKJEzHaFARcYwoMpOqhP3PuRkVG3ZDNT0FgydQjlco5xFXgxAHb7P2XSFG+SBHNrWJyYE/bCUJ8tWkQMqAUpE7z6ZcayKNmVT4od9Fpq8ymYSvrOKNuZKC2duf1857YuHcE2JwpuUaxqx/92jo4W6aG5CDStMM+XvApXcFwTDh1KbFmno8Wtl5ecv6Fhzr7W5IMsoito2SOinlFjxNZ8UePnnisZLyTnSXBIlDpZNdDo8/zBRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v8 02/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller blit engine
Date: Mon, 30 Dec 2024 10:11:50 +0800
Message-Id: <20241230021207.220144-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2b4abd-5539-447b-fa4b-08dd287763bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dlEjabQxlL/99l+k0u59ZZ0MkYLbGhWjVtkGp0ax8vMbSNswKMhL0//VLiYU?=
 =?us-ascii?Q?AJmRQwpJeSHx5zly0CuQ1ai/AVuKlKxUqcopFrkURq7OOPLZBW/GVO7tqa/b?=
 =?us-ascii?Q?0oFNT79iltQEPM/ULfK5+i0RoONdvr9AGN1snCDkfxnD8USoU2i/C7gvKV6X?=
 =?us-ascii?Q?aJvgC8lf9AWfXUwFBMYwoT0dwMn2S2zZ+cZXXPvN96EQBSkEl0VYglRdZ5tu?=
 =?us-ascii?Q?rONm+SKzPC8p6vMJUEqk+4TOExSNbjiAvxzf/op4fTG0U+zDqILQUY71cCdO?=
 =?us-ascii?Q?eF8isTOnCtJPIBBNspoCMNUQ1VpcRD9AzxIq42gg1kEmagScGl2k/U4xexU5?=
 =?us-ascii?Q?UcplhaMZeell1/hojpyLzk2oe2OZOD9R6glGqWoxuWBwibT3ot/pIWYS3nAY?=
 =?us-ascii?Q?0MhF0DILvnlEd+i02TaIaCuVtNPaniU3ST3WMZDzT1wKB1uxNxbSh7J9pUYZ?=
 =?us-ascii?Q?LWut7e283zdv8jBiSzE+w/avvfjiY2iGeo5ks92MNgsOfq6K4uz69aXxUlcw?=
 =?us-ascii?Q?qRPPxEfFoGd7ermrhKzVlNXLMvB3/VW3JIXYKGqBK+d7NFAhgle+Qj5RFQlY?=
 =?us-ascii?Q?J4ZzsyLyoLQOf02dwRUQTswf/jHC1cjH53k2ASRAvchtFRqw0ce+dE/3yWNS?=
 =?us-ascii?Q?fLi1OghDvoDySmVPIddscSuofGeb5aPnarr41Qvdu7I3HHPvkQ87bs62ObTJ?=
 =?us-ascii?Q?7UnwiEZ4XcgtAP8AtSVAam7XhUDdwowrFUuctNB6jUxwZEdcK3giHwERGPHe?=
 =?us-ascii?Q?euQTr0zbAop7OiL6XhXC21kyGe/Txsycy7UvYyNJMKyI+8dkg1CtkRuRZ+Wi?=
 =?us-ascii?Q?tRjW9GqqFHL+HH+8t9FLGGodmjq3HKqqjvGww0jduku1rz9gNHQCbwd/H6SM?=
 =?us-ascii?Q?DpFjY2Wez1wGGThA/dRf6GrHg5SPQIqySSWQRjWoDn84vOUNknp/1B8Nrdcg?=
 =?us-ascii?Q?ockxd9OzrtHBrgVyeV98fJGgxETlAB34s9qyqr6M+9/AplF8LKjlRs/nBp4P?=
 =?us-ascii?Q?2ErGNYIsCgaS3Izo7n0rPzQJYJ7GQ0ZTXAZPXcGFc+vbDse7p1d2nlDbLqbc?=
 =?us-ascii?Q?FwvOWildJygalynB8ojtS/srt7vatnYBZ4W00uvixz5+iVL929TU/pKhY2PU?=
 =?us-ascii?Q?Dgmz+XYTCCZ1vP8eQllEODcLfL9pAkyCVI4vEN5VOIJIpd3BUGlpuyRHhGY0?=
 =?us-ascii?Q?SAAQfxxh3VTNKs6gNM2ceoZr50c199SACL/UHtqJ5OaEc7uCuCDTXWT5Lg68?=
 =?us-ascii?Q?CmzX8blvN/Ako0zV+9DTLsaRnB1i1S2nWyMjGo06b0Bt1VLblT8KGWdduaR7?=
 =?us-ascii?Q?oUo8R4f5AWeHL1c7+2BEtKD6/u+ANYNMRZ63Stj+5DH43LQNsvPWDYL4sAHZ?=
 =?us-ascii?Q?AEZI+BGLzeUj32Ypv6D5qSa5XV0z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nSjIXHrf/Y4NfCvJUTq1eKSpgWq7abWyR6iyUVIVn5qftQaoINAoE8ZJFsri?=
 =?us-ascii?Q?HWrpbpozcBOpfOvmblqacZZUm3/YP0Y4PhDJ5Dg/cU5hr/hRR6XOOAr9OQyd?=
 =?us-ascii?Q?YdXG1T9dkfnfzVvF9t4pYP+Ynf9CiiZLikLcC+lnKuD4u8nltjzn09Q9+N83?=
 =?us-ascii?Q?iFXwJyNHn9Rf3FhY9353qpoRBMSxLT70KxAwDAmaCptFLUnrJROngHS57yQT?=
 =?us-ascii?Q?70XjnOWYg18TqyDECsnKWAbcHXauVZ875Da7ajr1TSogpx/4aF4qpfZbSTf4?=
 =?us-ascii?Q?Dx6TTQCGp6+Le07cVbW9MdKerqDtrdqpXh7JbQz80mYHudgx4YFfRbdVoC9D?=
 =?us-ascii?Q?rNOTWHKSvr6Mx312xy03cUEoBJLIeARmFh5sYc9xyrJUQTp8NBhmUATpy/wr?=
 =?us-ascii?Q?spYoov3dvm9IzB/e6M1VLmVMauK1FIqngM2zFKfiO8I1KzkMxKdy6UEbm+Sd?=
 =?us-ascii?Q?vxAtEx9RGm58GAWH/BEUJKptwr3fZpPOzUEA4YPX6+HvDqrlOC4i8iPbBxGN?=
 =?us-ascii?Q?BTRQoaIKvSEmNLdnV31j2Fjr0F+h7t2a8d0E2vrBE+JNzs2wS8Bpe6Ym32Xj?=
 =?us-ascii?Q?kd0qV/QoSUGziM6pUTjWxEno9YeapoHYY1Yg30cycQpLKOhyfWz/XiHWh/h/?=
 =?us-ascii?Q?vvYVjOxzNPB/6c03/8SGJiOMy1+VGg8KpunfPp/mh7kOK1bijJblUXoNZNJa?=
 =?us-ascii?Q?9oOLUJq2ilzHyAnfRvJAGaT09YzJB+z7k/NIbE4a7mkx5khnsi38qkn7EBo/?=
 =?us-ascii?Q?IU6wFJuVeupjL8xtCAwzCceCXY4Bdig2VwJsirH1/9u7GNa7LbiDvhyKS+Jc?=
 =?us-ascii?Q?wQto2drBP1hDIU7ewxfPz6H8m6b3njZ4NW0JSZ7ptUGwv/+faTeN/weBnRF8?=
 =?us-ascii?Q?R019eOfeCVtOPyq6X6O4dEpIwsXIlZXamBLnKL/yiBZvIMbiaVuEFgCP+0eL?=
 =?us-ascii?Q?VckOIO8b3wuJiek4DZmPjqg9ou7UyNkNbldGCB/E3Kp3vaMkjTcNDMzzcb6K?=
 =?us-ascii?Q?WFoJPN0D+x0lcgqVTXo0e4EheNFjCI3Uk/CUSXDE/cGSHEczukraeUz4qcKr?=
 =?us-ascii?Q?3pxUfV54/gRLGlj3eMsdyEYC1Dr326YSu+7AfkWE+j+a555B4ZaFK0qaRKXq?=
 =?us-ascii?Q?4gdX3C6TDCPOmehFdPNHr77A+fkg+HrFLS7pmoyeSMdukJm6k16C9LUOuXD2?=
 =?us-ascii?Q?gwyYiGVTvoHqGzWxNsoPmBmbSslXZGyrXu6NfZtVx9vzi4ZY6LNXxr5jM2Ua?=
 =?us-ascii?Q?jPdYAHppXHhi/oAZccIzsmD5M+h/cfXSYLoT8hkQyFsE8O9jNMUMRSJLR0L8?=
 =?us-ascii?Q?nwqWejjv6DDISOlMyhmGYG2VTXl26EuqX54o+vmW3Etv/lBAl1tH2grhyZi8?=
 =?us-ascii?Q?lvVPw3wbIUKoB1WuFW+yOoJaiIPZq5sLC/IdsagQMR327yJxmHsBTt5cS78F?=
 =?us-ascii?Q?EcanHLkbZtsExNI89SugMZ14MIXDZIPQNi4gX6Y84VsAR14L9/MOf8Ccuybp?=
 =?us-ascii?Q?Puclh7BkIqpMkw3yCsXcxgzwE6oYY+LtWa9WA1s9uAoItk/eFwbu84ZmGLks?=
 =?us-ascii?Q?y2PHvgwhIBFS1tX9hZ2EK5s+5vVtJvfNMJnWdjLO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2b4abd-5539-447b-fa4b-08dd287763bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:19.9032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnF9ZokVjqltCyht4k/94+JN/0Pq39hiG3ua+sL9z172U+sN/OcKkLO4nUgVc5JSqipOHNi9Tgg6XCOCUckDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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

i.MX8qxp Display Controller contains a blit engine for raster graphics.
It may read up to 3 source images from memory and computes one destination
image from it, which is written back to memory.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Add instance numbers to blit engine internal devices' compatible strings.
  (Rob)
* Drop Rob's R-b tag.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 ++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
new file mode 100644
index 000000000000..45db6da39e20
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blit-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Engine
+
+description: |
+  A blit operation (block based image transfer) reads up to 3 source images
+  from memory and computes one destination image from it, which is written
+  back to memory. The following basic operations are supported:
+
+  * Buffer Fill
+    Fills a buffer with constant color
+
+  * Buffer Copy
+    Copies one source to a destination buffer.
+
+  * Image Blend
+    Combines two source images by a blending equation and writes result to
+    destination (which can be one of the sources).
+
+  * Image Rop2/3
+    Combines up to three source images by a logical equation (raster operation)
+    and writes result to destination (which can be one of the sources).
+
+  * Image Flip
+    Mirrors the source image in horizontal and/or vertical direction.
+
+  * Format Convert
+    Convert between the supported color and buffer formats.
+
+  * Color Transform
+    Modify colors by linear or non-linear transformations.
+
+  * Image Scale
+    Changes size of the source image.
+
+  * Image Rotate
+    Rotates the source image by any angle.
+
+  * Image Filter
+    Performs an FIR filter operation on the source image.
+
+  * Image Warp
+    Performs a re-sampling of the source image with any pattern. The sample
+    point positions are read from a compressed coordinate buffer.
+
+  * Buffer Pack
+    Writes an image with color components stored in up to three different
+    buffers (planar formats) into a single buffer (packed format).
+
+  * Chroma Resample
+    Converts between different YUV formats that differ in chroma sampling rate
+    (4:4:4, 4:2:2, 4:2:0).
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blit-engine
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^blitblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-blitblend
+
+  "^clut@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-clut
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchdecode
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetcheco
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp
+
+  "^filter@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-filter
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^rop@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-rop
+
+  "^store@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-store
+
+  "^vscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-vscaler
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    blit-engine@56180820 {
+        compatible = "fsl,imx8qxp-dc-blit-engine";
+        reg = <0x56180820 0x13c>, <0x56181000 0x3400>;
+        reg-names = "pec", "cfg";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        fetchdecode@56180820 {
+            compatible = "fsl,imx8qxp-dc-fetchdecode";
+            reg = <0x56180820 0x10>, <0x56181000 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        store@56180940 {
+            compatible = "fsl,imx8qxp-dc-store";
+            reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <0>, <1>, <2>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+    };
-- 
2.34.1

