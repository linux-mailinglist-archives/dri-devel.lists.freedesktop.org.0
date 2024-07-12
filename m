Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B655292F7ED
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D6310EC85;
	Fri, 12 Jul 2024 09:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="q/bqBxT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364BD10EC85
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC9sBJbq/jG36ILJALOsx/97rVp57dpstOjNj3OpBTQ9cHCg14UGEO/kELyN29cOBCjDcpzFthQmvhkrFniUBWk3b7dvBpI1z0YEub7izYJvxJD5wfdiB3ePl6a4c6LrsJqRvjLyDlAydOH+WMFppWKbrnbfylnhhb7XkpC5AcdKAVFllS/K2AnEMEkYIAQCX9bBcs1cIi2E+Z5+13LrDYSpeg3QiOqrlIQAwBxZNYYnnlgXMAncpjPfoT2/9wEbgB8YF7TztbnhEv2nbrFemBrOCuWEvr7m0pwBVuFjAD0trSk/XgA5FS+l4JvitXjDDX+KedZXtNHarCk7CuZUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzrpyOOR+2gqKLgvTPIzMIoY/IS0ipZtVSdoA2aVQic=;
 b=XQiEFBAK9APWnrlAyznWa8y6ThSlXVSqfW8syatOWE/p5Ri06Novl7S+SzTQ9kCV8N2oMdk4zI4w0+SHzOjsVdZTsJRNGjkLDfWeZOc950lIvpZc0Ue1iSfryh9Z1F4rXYMLWcPNRFuPCHVUPEYwvwO24aeLChTODzXTIArUNhMHrghaVVP9xkgKa8eEUB4WZlYziU+rF6bO+n+IzrM8KkJosgjp951cn7u2aa68mE378OuU2j7Vh8rKN3VZoKU4Dv0vXtBXgw4+NKfpnB2HbyYE3G1s7pS8e/x5feXTwGBWpFLbxXBioM8m71dYojfRTgDkcmd+0O7krRc0+95V4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzrpyOOR+2gqKLgvTPIzMIoY/IS0ipZtVSdoA2aVQic=;
 b=q/bqBxT9YyLMlYOiz3jom8WgSYl4SzfynG1YGNTF2fYH5isbuQ6FnpDoQ9rth0iFitSLYntYWsGPG7wN33skcJBbk90P1+UK3N/9N/tM9jB9cPpMjQB2TRNh5708vZq86MQhu5DQs9SrI/TB28yrhqr2G0Vg5JczNwpdleHeAgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:26:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:26:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [DO NOT MERGE PATCH v2 12/16] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Fri, 12 Jul 2024 17:32:39 +0800
Message-Id: <20240712093243.2108456-13-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0d22cc-ea2c-4741-06f2-08dca254a605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2At3d3jX4ezONO4upq8pORasdywsWwn4/vC3vfjWnf05EohflMPhM0ACgPfB?=
 =?us-ascii?Q?PtLLLYR+7e38455dQHAAfEelPPXtOfj245a7h4VWK0bArjQPh5aThXsKrZ9w?=
 =?us-ascii?Q?QP1l9qDNzNXGl7Rt4a4TB5hWT7Pou10Ll+i1rW0juSd+ScPSsBheL+rvD523?=
 =?us-ascii?Q?W9LVMsh+O6nruMVf++7sKlhVwP4JwUNPWeLrIevf0d7f0DPXWlq4RD/gWRAu?=
 =?us-ascii?Q?bh+rD3x22YEg0XdnnfeQM+JmkkERldezJH5veDqhxgc9Hwu5y5wU7XoxOzIT?=
 =?us-ascii?Q?qMZEhpS/kqfpuWg8VzDiuvNhjOTUibzP0TNyUIHQ7fVlR7cVQaaZCIA2Z0rE?=
 =?us-ascii?Q?SYyihH950VILAjw6ZfUfobfuB/4GwMdVb22lQaGEyaGr6vhKlRe2TQ0C21XG?=
 =?us-ascii?Q?M+7aY8vH9qWAwMyHzEcPUFzDp2UZfi7HxQEiefaXYn7i7n7N4tlfQCIPqA5g?=
 =?us-ascii?Q?wDPrXQkF9W1zWn7FGRxtq0+hWJFwt0UJea/+txSS4fpY3godJ6M4xhKULX8m?=
 =?us-ascii?Q?Au/eiPNGK2sLjsUm40j7g4da5IfS6nCRIpYMo74zay+bVSFitqxgK0eTtgEc?=
 =?us-ascii?Q?AQ4n3kiZSNPn3P0cZq8YaZguFf/PWas5r+PeuU26HAsBVDxkGb3uHyf4eYXu?=
 =?us-ascii?Q?NU1p3h/neCNAmGIcx9ypsDECzdWrQOT+8iBbSr8wLVjm5AKWgVN4CKpIua5a?=
 =?us-ascii?Q?cT66Bl9Iu2erY0Qbstvy1m9LPLIxBRMv2Gc0Zn47GKTmInmA3FjmequOf+Gr?=
 =?us-ascii?Q?r6nO28PoKvhDhnzTt7sDWG11zbWHZ0wR0wtxOF3okRdW2Z7naGAplVqFlTZp?=
 =?us-ascii?Q?5XZ1j8ZU7vfZpu0JSEFs3A9ixVsucX4dUMRdlS657ljCYuKdXlKFChPH3vMn?=
 =?us-ascii?Q?GyPoF6aE+c16jezHM5qN32vEYbLGzNxSYQA4+S7g+vEZ7ZT6XWva05L85xAP?=
 =?us-ascii?Q?SdRiIzp/OEG13Ey5aVlG1KzHVlCRN0J0fba/am3upDOaPi81PZvifIwe3koi?=
 =?us-ascii?Q?JDFP2734o4cz72SpW7gZnEl6BJ396aZidmyDNqBIEkjW5ltmYWgAaKH33jmt?=
 =?us-ascii?Q?+HT8HktN/lM1Wf6t/ve4djwSndbhVidSsk/kbWeLpmkKw4GD+btiPuKc2l13?=
 =?us-ascii?Q?9IP+BpvCnTzv+FIKeiEGfZ3LdKwFsEVW58wngtv/wvA4hQ7W2NZ6z8LIdsb+?=
 =?us-ascii?Q?aPBJOLXSZvFGp2jXkmHdUHHYZsUjWmbNQGAqQqkGv2V9Ts3AKjs5lVWNUfav?=
 =?us-ascii?Q?llTFqyoyZxfCA8sfmEsEYyTcaF+HEVkH73cu+MVITTLxlCRneebXhDJJIL5B?=
 =?us-ascii?Q?CtoJKhWDVdx/dQAdf+TkN8DhtrzLnUC52hD/EQkb23n+0QPaVS8AGFp5hfYR?=
 =?us-ascii?Q?ymojqnpzsG5AcJ4ziiG3R0dfkIPLIMQi38sRY9DU8Wjs/pfPyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gOYZZw81XNXSVLyBkqWiuwWq8b9x6jQHSUgyQSroroEOL89SFLZIMhdu3qhr?=
 =?us-ascii?Q?odKGWXLuLXhE1H63G9uHG+UzZjaegr9nghMDRyx87v9TCCVhF6kzGp2R77TY?=
 =?us-ascii?Q?R5RRI14Lbfj9lr5E10TeH7VkzYFksOjT/ilh0NInITv2Lw7qzswld61KZxn2?=
 =?us-ascii?Q?0T5+6yiU12gwGpR1YVNfWiiwURUxoesIdvq2PgUrTE1LnuUsP3boq6+nLd96?=
 =?us-ascii?Q?EGdFaOyKBTKnxqj4TPfFRzBQjqVqa/qOCwvyk/6WImtkoYXlyP5T/Jvlx/Ys?=
 =?us-ascii?Q?dkQY7x007H0xv9JK8gToaspZUYG9BKIUx/0PO7NDSMves9HJ65hiaDb39dw7?=
 =?us-ascii?Q?n1QLAChifOpzrVf6qH9OU0rGuuOQioID15y3481MIy5Pg5clk3nB/K6ng8z/?=
 =?us-ascii?Q?M5FacRmuPUEGbkwk2Fctw/UT2mMi52oebwnjbKAbRDAcUfHXyM2xN5mlw/QJ?=
 =?us-ascii?Q?+E++01WiS9lU7q70fkXZD/jEoxsdm949r2flTy9I7YXxASS3uPEqMvADNLyt?=
 =?us-ascii?Q?eH2pCsnpNW57myjtf0lFmgSdFgi/i6b2LJSOZx3prSxNkZbIPkn5sclQMZfL?=
 =?us-ascii?Q?Bf9igSRFWQsseLaqfsZd6rPRTNyH3avuecs0y56ryOeZH2MuNSzoBhjie9KG?=
 =?us-ascii?Q?HH/TPzeSCi1EqnlV2usXHqeN292OrMILXMU0Yn7cWIlF1+ZhCppf86N0suij?=
 =?us-ascii?Q?+zfR1wTZcHr2BFJFQRH3whTE0X7tvHKM6xxq+a9x0Qhc+dSiUBj6r/H+y93j?=
 =?us-ascii?Q?nYBUQdLHe6LJUXtA+oJSLs7Amo7pxigcmreKKden/idlFU6B5yK//M5mGImL?=
 =?us-ascii?Q?yC0gxVPTv66R3YdJ+35In7CHGMKYaXtI/XZTcQv4OHjDuVPnQStJujgoM4K4?=
 =?us-ascii?Q?d2bDYHTSjFfIX0QoDBfHJUJBwUq5ToYbugL14a5FuxXRnkYW6hTVdpfF56ST?=
 =?us-ascii?Q?qUSHpBaS5mHrDSF31kFq1pw/M7ot2f1VVahcrfLR/7Bu2ugQ/26+N3sFB8GB?=
 =?us-ascii?Q?XG/RDN4tCUSf7Tus39j0GOVGXAnLI3cnJmmIOEVmb6XRvmrlmc3PxrGnMdip?=
 =?us-ascii?Q?9DjcMEVuAdJVBoKpNDYC83gxAEaas6yx1cPC/N5X+KY5wnTs45d7G2cOaFBV?=
 =?us-ascii?Q?tKIxacxTJs6XbDWDEmbNfDcAVIUoE1+r/CoTE0tbzzIZh3A+n174qVMwTHiA?=
 =?us-ascii?Q?6hLovJ0pOog0VNBTFujL0S/ccXUnQK1UCaVCGrIdyWyl1G/H5XfeIzdqZSH2?=
 =?us-ascii?Q?GyhlIy2uMNUFl2h20EL3uU/xm7uxmMqpa9/AHZyHwlip0IdjatiEIG/VOxju?=
 =?us-ascii?Q?zM7oTMtEkeq8CUSbCE48DTZHEqqemPiLbNxmcHH9LxXcAl2pxQu+/XiBErVX?=
 =?us-ascii?Q?tTGNrR6G9oBM8vtnQ9rUSH0G0pHI57UJ1Ho2WIqkpghQG4O2f1elWQD3jFaf?=
 =?us-ascii?Q?9zEpi3UnNRA1oDv/iYvOstFSyU9+RkM8wwr51i+y7mBkuTp7YtW4gNlBMNAU?=
 =?us-ascii?Q?0lOrPip0WAEIBUlVBm7D5GvcNc3nF6D2OBwExP+FAus8gAf3cPFs0Cmj970T?=
 =?us-ascii?Q?+a1NXTAjOU+Gb2rr3Qu8vxHngsAvUGi+otz9YM1M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0d22cc-ea2c-4741-06f2-08dca254a605
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:26:02.7583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEmx9sWY2Ptg/IJ3NwmOs54wz7HlpJ6seFlZdNHjOWKgpoBnHCFZ5Q9Q+ei1i6JRB8S2pvDc4fSPzfwjwzeL4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
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

Document SCU controlled display pixel link child nodes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* New patch as needed by display controller subsystem device tree.

 .../devicetree/bindings/firmware/fsl,scu.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 557e524786c2..1a920f013ad2 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -30,6 +30,26 @@ properties:
       Clock controller node that provides the clocks controlled by the SCU
     $ref: /schemas/clock/fsl,scu-clk.yaml
 
+  dc0-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc0-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
   gpio:
     description:
       Control the GPIO PINs on SCU domain over the firmware APIs
-- 
2.34.1

