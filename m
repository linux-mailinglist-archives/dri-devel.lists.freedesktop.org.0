Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7C92F7F3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5122910EC88;
	Fri, 12 Jul 2024 09:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J5rSzOi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA4410EC88
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyQFDFnU/n9UGCa7L23G2B2zuhj9ND9w8Cw1cAqEhZ9uV/63D2ngqEuEHj0d0ZzxRSdg7GCuD/3OA5CFc4rvNEbQQuN/Ks6F7JIWS/46hJ3T8rR/7OcGgfZVE0I3qpm3a/sqYj6qQ5l8bCJ28zEtaSDkXNlkdCkQ6H4ENEk3cCXsAWA94vynU/I5gUNcGJmOHWxP7LERqNA61vtn2BsuESvs5lcTiFA3zJ5FjQsELVIVFCvQKA0zpWWQgris8n6ZhkKAtc96aF5p0SVHPrkIkJ/hnCotIx/ttyC/E3iVbTAdem32Lx27p68a/zjDhbVF5Qv5tT6lpceeqg7H9WIUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf+JBLtTUoariZ8BlW5QyW0/lLdRtbjVSMi/zGKTf/M=;
 b=SddawfPufEwPOsbDVBfk7N7tS/VJjdNMzSEIzedXeWmp46U6O9SGU1wKYNen9qbF3W+lcuKBy5A/HLyW3iDSKZRD4yYb6aalDlbyiyyA+FaGpwLI+VXogvm1iff9WDy05Xq0wfG0PPvlL+DXNIzW4dvYH2gxnDH7F/eXIROuPTsBwyZiSNR8pAdXyhhQxzHOtEhbowzbnrWzS6V07yb0kdBGPx4kTy/67ZQEsjoMYbfADfv4hua5C14VYWkNc597JuV5iAqPTJSQ1GdhcR7SRqnV3JU5ZFJzrVH/Ey7DAHYdWfObcP+l6gyOWPIiqEQagMANgbfFVTbW2FJpfyTbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf+JBLtTUoariZ8BlW5QyW0/lLdRtbjVSMi/zGKTf/M=;
 b=J5rSzOi97uSEvO99jvalGPKpCviU2HKgto5obz+MGLUaMosBL3te6yQjZZsXHTMOKXQhFX2SJkaq+CVnqWpcmBQqgZjouIixOXxzwuQn6RDt6RIRQhUFY1CVwO+exrgWMHAGyWP1xYTh1jUFKlNYijZfvRAASwJuMecm8TYG3Fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:26:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:26:24 +0000
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
Subject: [DO NOT MERGE PATCH v2 15/16] arm64: dts: imx8qxp-mek: Enable display
 controller
Date: Fri, 12 Jul 2024 17:32:42 +0800
Message-Id: <20240712093243.2108456-16-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8e1a79e5-77cf-4ad4-dc8f-08dca254b29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BHuZOcpn02RzP+IC5ktKxfQWP1zBeGcrHpftzcyHC8kv7GtiR7Ng77TMiggp?=
 =?us-ascii?Q?MIfIeCxalUtRBiPPug+oDKgpLnoBZZ+PTeYGdXE3/x5FhEEsb4o0VGALQUAP?=
 =?us-ascii?Q?JijuHYk5OWwSqIlu+Q/Yunh/PRIjsIy3Lec7G45moPxtaod/HUKBiGo2j+oK?=
 =?us-ascii?Q?Q+Fr9t06SfpdgyHH7Md9XePuewRjNZ7TiWDFxyUIhK8rbmgoszp1K041W8MZ?=
 =?us-ascii?Q?LYlQd5uBNFiH8z7jJGih6TfzHlLomRNWuGbu1k34qhneJKloMYUQs3UYovRy?=
 =?us-ascii?Q?DxynqDpRE90VT/1JbSJPXjdMXWz7SDVc1/qVC3Em0lfgEtS103HKmcmF2FR/?=
 =?us-ascii?Q?6YPJL/Vta2aOEZwp2o7uv4BS9yn7BvomsXPHamcPjOYXTMtu0xa1YB4TeJwE?=
 =?us-ascii?Q?sQ/TAzqeLcgHd9OGwYFs4CNCLIjm6/zi1f7gl+WDNOGxlmz6IofCkVTMJ93x?=
 =?us-ascii?Q?m8f8f9V27l1HeIattRqPZDq4BQjFhC2+vONIC7fcuCklaEqQJrSJPMc3VhpH?=
 =?us-ascii?Q?L2xLvJ4udK2qppgG20+AW/Y2JbV6zX6BA7mL9R7X86n2m8zTUmyAuclSJlvY?=
 =?us-ascii?Q?ASpB8AiwY12ptnSs5jjH1DqCTANlmEoEfzsZ1lUqUfOZDz+8p0FRAF6+a2KB?=
 =?us-ascii?Q?MdmHd41lD+QlBFv5KJekQxkU7Eg3GaQF/SVLOexrv2cVJRjluLjo+qVRMRdE?=
 =?us-ascii?Q?Ps3Ae95BQ47JToDAylRvvYGe5FVpSNVEQkt0BjTwZLCnJZ0fV9L4UfX4dBk4?=
 =?us-ascii?Q?rl745yjmZcqQxqLWfC88xhQCVvWAVuOzc62RdVUdXRQataZYxokjv6a/Z9z9?=
 =?us-ascii?Q?bBiQTJEcVIuGRbrdy13ebkstc0LlGziSwJv+c7cbInUSOrDiJYjsY4H5c0iI?=
 =?us-ascii?Q?D35VPk2L8lMnTRMCXvcV7v5hRIHcTAAekewiqVPih34nj1BGX4fEFLRgrStt?=
 =?us-ascii?Q?txmAAF8u/X1fZ536PV1P9xXIGgADXWgY5XfwWl6eIZlfo5FWtIsTI9J4vNrT?=
 =?us-ascii?Q?eGTdmL0I5/WZeJUH0Z8jmRnJy/yTwcCqrZtV7uPWi4hM749htMuw3ixhMsM/?=
 =?us-ascii?Q?B104jre7q0LhR+SwD+uOYWsVo3nTraLYGgSodLmKHZEsHJWV7ODqEQXQgyiE?=
 =?us-ascii?Q?eocUNFkBXy+p4Wh7carDus6/vnDxX0P0X2U1Y0efpxGnRGH8NoGIpZYE/TEa?=
 =?us-ascii?Q?ooekdejSq+OsQ+H12peIEuF3QmJUMTV8HBYpdMWO+1gn+l4N5GF3oBCrcEwo?=
 =?us-ascii?Q?zgmZeEhjkJumbufBV8A7PjA6BXAwXnzwrz/sVdiwaQ3JJVnmoV0B8tGi45xx?=
 =?us-ascii?Q?yKoxidRd4j4Z94mbSEz0iqw3uVeGJrpTq+TgA/bgzaWc0C8ec+PoBbOnKtBF?=
 =?us-ascii?Q?SU/RAcg+kSKBICcoRYF7XeSQtK+U32+oIg25fbyJiVoFE7pYeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtdX/H0dt17VjPjVC4TSHsj8wkDTpJFcv0+7gJ80jdMbbIwZnu6w+ZVVcnq0?=
 =?us-ascii?Q?kelBt+PKB+cwuD7wOYONI7hfeuhoPm9VWtLT0h7+b3gCowNdl5FJNYWzcqcH?=
 =?us-ascii?Q?o5O4o3AuRqynZ97iGUBYYGrMxb+Zc02VP2YBCiy1MI+wZU6ZAUD/Y/SbTzsR?=
 =?us-ascii?Q?z4D9NMsSe/pigFpsgrJZhuB9uKJjyKfA13Xl/Q7PRlRPOkNSlXxthTjL2Hit?=
 =?us-ascii?Q?7fDM/hzWgRYUUyBUF6GMekNexUb+mbJQHa5tuE+spnVxW4ykf00VPUY1bGNa?=
 =?us-ascii?Q?zM6iToeKnFOrlsaadMQ9KWi3t7UuU96KO6OuCPBt9aKE0bdtV7h8abqNG4ef?=
 =?us-ascii?Q?Vduy49T3wsy7BkWZF4P0uJSGIHvbvHdmj76WIDpwyqGnenkU0WxqUyKSIH4F?=
 =?us-ascii?Q?Vo5GWse8yti0SdaPnNRKe4obXNgEvUW3ki0Od2RD2WQhShMwzEhfghLahKFz?=
 =?us-ascii?Q?VQYysrBBMSjlXBENEbWNekuHMlhn13UxyuEAyRUtVnrb4tivUZvUg9YJHU/g?=
 =?us-ascii?Q?z+LeBIVDlkWsghx2OBCG71WPoPcSRcpFfRm3EpefeP3R9j2voZ+tQkAURhh+?=
 =?us-ascii?Q?a71V5wpC5vLeAtiyYqyPt7EjnlwqNZQ8Mp5JX9EwKGRnV0B+kYoRyz54noBS?=
 =?us-ascii?Q?gn2P1XVFi6S427QcpFBtrxH4M9sog99b22t6yDZHY1IVI+uxUuq3Uofgu4vh?=
 =?us-ascii?Q?/NP02hqfV8nw8vjmDOfpQb6LMkA0vGgqa9rJWQXxQwEa/VREfIFSINHCxVzz?=
 =?us-ascii?Q?wJwBd62Nh8Uyxzbyd4p1fWTFIqEhIlYZ6UVWESllqixN7BuNF7pklAD43z39?=
 =?us-ascii?Q?JID9pX75z8qz9BzfhVvZtRcMdZQ4m0S/6ij0fainWgY4DUHPquYEgfsVjUbh?=
 =?us-ascii?Q?zsYZhejwdG2BZQPC7xm4Y5HyJ/v6Fkr3c0IGjiVOzVqqknr3tAuaWDN+ExKo?=
 =?us-ascii?Q?jSpkhvVmoTtkBjIycBYFex3bEjd2HD6Bgw7bhgJNfBVG01fMO8Ol6vBIDC+v?=
 =?us-ascii?Q?N3hncrh21n4GzcQGzqKM4k3+AsOcCbfBp463gIW+QzJdPyNZw6wV86v1H1lT?=
 =?us-ascii?Q?JVG7VmF3v7klvV7wlYvQCdOipGJDGqwCMUGKyyvC8hRKr3eAyyjSTlxtXcXl?=
 =?us-ascii?Q?VzLCf/hpGUdJAqMhOBXYN7/bAFT0FjVGULgW6gQpfLqmUcRNHfqHqAuRNcUO?=
 =?us-ascii?Q?8SpTwd2bBpbuMOhJ1I+SQsx4sCtGOBPfVNDL8D3GAvtZ9Yjdf9V+e9YvAw6h?=
 =?us-ascii?Q?WLSKJpiZw8dUpM/LvrNZr8C+Vd+IVn3iVc5yl6tVb9bAXD0zCW13LJOdUKsD?=
 =?us-ascii?Q?M8Xn/4wynmCD/ESDjP4r83mvqmttRg2RHybkP6rdMlDvSU4Usz943jjSSYNo?=
 =?us-ascii?Q?Mc8hv6/Y+adpVGWLJdbSw3SN04tL7KQDbbkP7gDe0fFdJ9lYvRkTqgdxK+iJ?=
 =?us-ascii?Q?MbzzrZfeqVrL2VQzeZmF2mzUas/OWGWoNGNFnegxrofjRPt/vKJpx7NWW9ZC?=
 =?us-ascii?Q?wacfd122R3yDdS5e+LgnXaCN2BJ2Nkuff9FbCy3xo7zYE5P6Sjk1knBfl2Ym?=
 =?us-ascii?Q?EFU3/fT8OYjhxv8uYS9Qu/GGNvI2JWRmJL1HE1VF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1a79e5-77cf-4ad4-dc8f-08dca254b29a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:26:24.0227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5lxkMNCfWg6IFRhcXg5q4ALC1P/DbXqU6q17oT8S3z7LAE/0mY4O8sSD8mvR9kzKhXdADLvT3QcIllaNlxhJw==
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

Enable display controller for i.MX8qxp MEK.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 936ba5ecdcac..bf88f189c6fe 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -62,6 +62,10 @@ sound-wm8960 {
 	};
 };
 
+&dc0 {
+	status = "okay";
+};
+
 &dsp {
 	memory-region = <&dsp_reserved>;
 	status = "okay";
-- 
2.34.1

