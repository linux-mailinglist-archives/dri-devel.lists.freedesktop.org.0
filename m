Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367164F7B10
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1785310E58A;
	Thu,  7 Apr 2022 09:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3074310E58A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F32wkATjQXcGvxE48V2EAX4a+Q2lZigYIif4tGlWQk4c8U15yQ9/VR/d80AZy11FAe0UYIONqHNvYrG3Oz6B8H5p9fyEF7hk0MYSiA4IeJ5YQioVXvR2wOPcdX+NtS4t8j9P1RQzn/Osbg+atA6JxYHKbIardVXvyJ7oM5L1NiWGY36ILq8sF0hegvYVaz9EuXsGLw8c3wfpRceUT5R1myH/9RlI4U8kXVUM3HnkyJ2bWXOcjeufDfYVbtDm52mDumw3ZQmqt5UZfjdNGhUBvCEuxnhH6vZe0Q+D1Hb7CcaYvHaJ7dQr8/9itGvdo5VrBpCh8aiiU0jhhuCAzLSt/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/hkbIfj6ft+yQAOufCFNZiJRQ+H6vNjvlN3p0jrvJU=;
 b=Pac15l3WgezqydiVesU7WQ41nGdxOH8pkCpkmUNof7Na05Pyw4DeRTIk1OtUhX9HbU1A8z/2E21rL5wnwvYRp6zC/fMq4kbjzF4NkLo83HkT3DSFvYeIAa8axLg0/vm6dmzNPmrt/xZ2HuF6ujGksmHjUyff2tAw3D2+GhmBcg7psUHVvqiPR42DwiDefVo2KZZlfJsSSgP+ST8Fi5TvnC0rj2Ilj87RNO99QHki2astSWWyBCL+i0SpzOzer109t1dyM/ROGMjbJwj8u2Vwd/y0suhk4gU2x6ZDQBviGzmBgqMBQz/BdFIszgrKY1GKmWANRpAucevjWGP9/876ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/hkbIfj6ft+yQAOufCFNZiJRQ+H6vNjvlN3p0jrvJU=;
 b=BFIEWDZWPZumakI3u8sNCIMIk1ZaqZfLYZCyDIJU9P+SEkSiQjDa3zucyFN9UIMEcptl2KogE/sFwy/QRuktjyDE9rtqjUd2pqrqVnHG5KhZ3hJeyx48uhNxv4+ED1V4j2frPUGY3tidK0jGVT3Fyz9fg5eHSkSVVpfPNYRHV8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Thu,  7 Apr 2022 17:11:51 +0800
Message-Id: <20220407091156.1211923-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407091156.1211923-1-victor.liu@nxp.com>
References: <20220407091156.1211923-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da77f1e-788e-4d71-c529-08da1876732e
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB93447A66B1B159E0A0210C7B98E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBXG432AnP8oQyJVvr/x0+TBCR3O9te1sN6jNze/TlJ+Kro/1mFyVCJaLToQHpfOpWPkG0ORUnP1avzZtuRYnPDJeEZIOTv3bmvexM/IACBQtZHSZlwMiKvhb0cTx3jzRWBTM2wNSpCUtLWOKeNAZoaAxF4KtkdEju/3YJ1z0PveWOPqGTve9GRxAt+X3jk5x7NxFvMmI1C6ExDzG0GLTx6NpdeEg71XjiAmK1h+ZoUWrhyCBBDhKYcbLAkOWlbPvvbexAQDSW57Qt2/Vr0Q3wWxHO2Z0pVvy5YCYYFEHK8ToBjCynRmaekut1tCJoFORbcU21wSNcHhMU9HcgOc8/Z1iecA+4pmiBlyjON1oEUMh1sRL7n8FDzmC/QNw8kJavXVnF9wb3qzJMX/HJMf5dR//pxb6jsQ3FxNvEq+f3C02GhCPwpT5cRc8rNfdhNgDyqohV+vEdOL8gLBgulCAD6dhrBd+YdcD65/Zqnv3YnnPaKB2fpq7hkai7ueLOiqYh8jJrAtB/mR3P2tJFEoGxNDDKZDoXQDI3Llq93e4fSAcBPG0faU5mlYm4x65z+7Yra4+/GXQFbuTJwPy+xX2DFxB1TZosKOXyohFw6C4UyafJaIKs1pb5VWhBN6cqVB/HFfRto5q3vizwuNfAlRG5SqtXLcDCu8RapkEdc6D3mGSukNim7wn6Bg24oshIoEK/HYidrY5F9wuPCCJCu/5tm9B1lktemHs+LyiKbzLc50UE/URK9XSCQ5dkvL34c8rjWDHlFbvY4XRjoDl002vZc1kbYS4e1u3eFTcypWyQgs/6FxEZqKxeI2BO6MUPNtIataylcORSrQTz+rfxfP7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6666004)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(966005)(30864003)(6512007)(7416002)(6506007)(2616005)(83380400001)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?roEymF6qy/gqO4n+KE/czqlfrtKExOVSvn3tvu0sgNqr5YHDaSSQpAqYCuqc?=
 =?us-ascii?Q?1ZPSk3UMzpm8gPdPp4WXraVXgeDKPz8WgDamqkLiXNrE6ARajGRQEplYhMRY?=
 =?us-ascii?Q?EsSDm8ogGdQO5nVMC7TzS3YSolyHYoHgrpONBKZ2et1FID1Oq7+H4vGuFTzl?=
 =?us-ascii?Q?ycaeQLyTlTdWmwoZFikrg7BvXzZE22RfLxsBPCni1eOiGBwf5G6KnD5tfebp?=
 =?us-ascii?Q?6rPkIGwG3Uk3uyVV0fM2Ajmy7nKVJzedv2BYwcDCcf8khA7T2VaxDhHESx50?=
 =?us-ascii?Q?85MHfBnPVyhZY/YfsBe90OsVlJNAzun+bvnth4xYIYMce8JvKEtlI9cPIJ0c?=
 =?us-ascii?Q?PzSbG0I/D7gcEYnRFN6SjKRYzET/sVgHOS1pzFcZL7/zNazqU181Aosm4BLY?=
 =?us-ascii?Q?s5Yd9kNxuosqLvXG/+hQ5oai5wY3E0w5u7IoRbYOoeI/ftv1jAGOJou0xsbj?=
 =?us-ascii?Q?KL6TLvvpAfASltF+8gAAN0Y+oKoTOAFLFJazi0a2x/NpRjJoV5qpPerQ0yS+?=
 =?us-ascii?Q?FWoaJXVU4mt4eOqUUgzYMv0LX5Mj4hv/uCV/Vgjhfml1hCvxTWs6QWaxcYba?=
 =?us-ascii?Q?J6RWN2hPmLBaTqlZAaGJnymTKh5kR7l3TcnAP85JmEB2JUPQaKx+hHd5UCky?=
 =?us-ascii?Q?nA5HZCdY7Io+/5oZi9SMkARj941k911hlxS6zf53E0D+mxEC8KDPyNWk8Yn+?=
 =?us-ascii?Q?e9S/6KpuXrtXvJe+oyYUAV+RXPGi59DIBYUfDreqA8nWEnjMWBCAUNL0cG1g?=
 =?us-ascii?Q?jcV3Bvz1BsBMFUSRlAp0wKXFc8qsLQSBJn9D92zy6109cvOhQXSSLU9yddbm?=
 =?us-ascii?Q?ciGjIFey4MwAVa5dSiDtvmp9aIxwaSRckMHPridE+ax+jRMkvfS/RrbNlQ2Q?=
 =?us-ascii?Q?4Sg2AgR27xMm25hc1JNYr0DB+EMvPUctGFdUuK4zijg8FW4sjC0iS/WgKoh7?=
 =?us-ascii?Q?sTOlOHDxJWQksXCDduaF7Qin9q7zPm73M7u9QgnCD+Qu7NKd6y9GsXKr66Y3?=
 =?us-ascii?Q?ETR3e8n1t6MwCwfVAKz0+RPFankt0uhtLM6JtvVofFjZORu+6Ci62XVsSHJC?=
 =?us-ascii?Q?vsBpOQVcneZhBgCH961S1hK5cfruLv5XQfoOFoUMgcsduBOowD+aK58pSkDx?=
 =?us-ascii?Q?LUmdgR5BONBw9W6YLoAqWDigdu8MjXI/fgkbQzG7VsDA/qNeArQRA4WEF3Sc?=
 =?us-ascii?Q?WL7/Fo2lKaJIymdNm0fE62sPkovyq4ZHlkAq7nDARM4CA/k+nkyMzVqaqaKs?=
 =?us-ascii?Q?cpmAjO8A3MArRbs5LWuYCvH3UiD/H9JQdMoiSISLy2LVF24Hwrr5kqBhCHKl?=
 =?us-ascii?Q?H+EFyKhDujqMBN8rVyc/+imZtupvSximrT4jx6vvvLF5yPHqm8hrQ0a0qKQI?=
 =?us-ascii?Q?o+DOeyVD5CZ+Tj0coUafeBqB4swWbVLPYddOrsQ9kHLnYj9cCbWIU3bcRuVz?=
 =?us-ascii?Q?WfYosb9BLO1+hMqzh6NaQ6Hv6eKHHLz9pbw4to6MkxCFG3uwLK0jVegmQQAl?=
 =?us-ascii?Q?/LhZxblzXT/u0n1b7Duuzv2Zj1f5J0ZtipAMnjA+uICu/01QoLpQfx8P92qP?=
 =?us-ascii?Q?0TGC5WOlnCkMIiX+t5eTjzTlkPFQgrAEvudma17oVLf0WUyjM7k09OhQcAz8?=
 =?us-ascii?Q?8/jQI4zWb4vUNX9U2Saf5TlJ5meNKFt9TME3AkeZw9/ghai7KJfB0ZBEXfZ3?=
 =?us-ascii?Q?addQW8DsK3o+67lYf6E3CNevYaIwA6aMPtxCXre8ewdNGSSMEGt0hzSR+R6s?=
 =?us-ascii?Q?vTgGq4PC8g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da77f1e-788e-4d71-c529-08da1876732e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:24.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKL+7vx9PXCHJxdsOoUcKT+TP2y80/GS0CM5ryO1Cuj1H/vZ8nvfqVwbuXiZAsBepXUt/gdTkS0AYNqYZD9v8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com, krzk+dt@kernel.org, guido.gunther@puri.sm,
 shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9->v10:
* No change.

v8->v9:
* No change.

v7->v8:
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
index 000000000000..9da9560521e7
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
2.25.1

