Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B75BA87671
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8778010E464;
	Mon, 14 Apr 2025 03:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d7EaCEWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013018.outbound.protection.outlook.com [52.101.67.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779010E460
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t260feWgItm0XSep3LKHqW/f4dDaN7rhtMOAZlg+kwNkyCCWJqjumVNMPQ8Pi90r2Bx/Bopyzw4ypEshUJTl1m7BAns3oYbBoU9gqr0maBinm//5iCcFhJe/XP5vsZqiAJQ8qbV4CeavdD6UTgWryNPHdGY2T9+lbx2WE3WXRl/1Tqk6RIJ5UGdsU/V5ypmOWMI1HOWyR9lRurgUYPu2rhB4S/0goGKXKuBoT5dEDJcALB7HCUiTrsWno9cEkk3xhW/tE99Kw4HQkImY7hB22ujzJsnURUKgbfmviqIPInakRAMKp/G1dqnj0ljH2boIHcBZVTNGZX3Byyz00Jm3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJlWdPO8Ng4/khSLJdyT9vKeH6TXHck3roVuS4gJMYo=;
 b=RJRlgC8BDbw0LDeVTi+GBGAMrL/a4mOnzorN2ge13VNAjpZGlIgbgwvM1Mis6y/96sP8Z3rskjQFrhP5NUqsZ08K2vXn3SlgFpXuB/5wau9GCtTrPLSqOd4ldOPt+i/SHyLfA/fwNLsU9j8QiObwjVE3rTVNQnPgPmshBDqGlHP/Uf1ehaqzYm4cxo/uHylhS1/+L7aMCUMFyz0JenbiojotNiw+PGaMP05PH5QSXxkGxYkG5fvUfYRQHr6R7BKNBWKeGdPgw9jQoH1O7U2IgEWHPVB73N1I0DUsxNfs+kwFInIanblufQjQQk6kpHXv0bBsfFBf/aN6hKNzopZS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJlWdPO8Ng4/khSLJdyT9vKeH6TXHck3roVuS4gJMYo=;
 b=d7EaCEWS/RaJ4fY9Zm8kd4Of3TYes5FbT2iLRPu4udtK1MpVHxdf83GcqXRUAOVgdWdnijQe96klE/qVny9SyRzP63L++ory38G50Nm0C9sHpVzac6zMJgOMHC30SF+gwhPSYn5A9vZnOiLhXS/0OADXVdfI7q4DXhfhFHGZfHe0Dol24xaSgnHEaArmUDgTEqOpOWxam8XYOZk0wbLqGqvJO5FBgcEykMyqb/9Rklp+qfiAIQxJ0S0JlkkHXmQ02jC3YplH2PYZqzfNucQho5d8qYhvlfHY2FNIu1h2b6k78jyO6vBB4MToNpm+T5sc4OX0nKDcbPdVCcYYo9HLUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:51:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:51:07 +0000
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
Subject: [PATCH v9 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Mon, 14 Apr 2025 11:50:22 +0800
Message-Id: <20250414035028.1561475-14-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 66316c16-2338-415c-8ceb-08dd7b079636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q15FMOBvoQh5gqXHY/2Y0LGvzB/fL26HAMuNNZJEKNjHcSRYBFfRnshqKp4I?=
 =?us-ascii?Q?52NDVIAGAw8D+gDiG72XOGHpZQ4AZ2TfzRJXNd9s3vrkPKb+yWENVzLxAUUs?=
 =?us-ascii?Q?aFKy7cA/YXAjv0+huw1WtG5aBuMPxlL7JCsjJQi1TVTeqmHFkKMwS4Kf/7TK?=
 =?us-ascii?Q?L/c+ZDpJKnU5q/zvok3sg0UiXpYbO3P2Fd8C5QZ03+ntURYACu9R7Khn/i3P?=
 =?us-ascii?Q?ao3Fpi6eLReChOiuXxBlhmcMo5TRjiw1nwNE9X/34u3ndTlk0hGcbjN1SU7G?=
 =?us-ascii?Q?1GLZF101hQ3luqF9aeH4UrUfbX0fFH/MaTse58TZqi8caZZCSYhlUb66UfwU?=
 =?us-ascii?Q?j7zHzWNBB+tuoSPzaQNGOyN5k6lGOlIEMt27x9R0bDSwN3eW/FThRU0eVTlP?=
 =?us-ascii?Q?8BsD57kVp+OU19ALvRCR1cA++1D4uVcDUx2rccPjhu1fi6LhKTYq5+yheuJc?=
 =?us-ascii?Q?FWaS6kDyDJtdfxF0PfqsI9yR7KcLFv4WgjkCclXLxQ+4+mkJGbJcEKmnKaZ0?=
 =?us-ascii?Q?IRjoKG2oKUEqFBLc3ZG2+VZcvCunScH8XY9UEsY47DgZlWa8voWpnQ5cdrvE?=
 =?us-ascii?Q?e46hV4KxgqfW5tMCMxg18g+LEqGHMPcACdI7BiKZTxCqxOdPFg4GhXjPMviC?=
 =?us-ascii?Q?jY4vAT/OKin75ghPA5SKnr6/Ofs0C3oKqJbya/zwZGnIA3QbiWBO50TaYJs1?=
 =?us-ascii?Q?ZcsR3IZRqLzUORVGffTHTlHgT3trXRIXUVSChqsplDmhVzbzIuKa1LxtbZgO?=
 =?us-ascii?Q?d7IllWJ2h1NymbjpUAEOEu9CNQz+kxngZWVerzezZaEMmYOmBW7ko3Pe/WHA?=
 =?us-ascii?Q?j2YrhEtS14jNqIw2z/lVW6UhzI8ozrbDrv6Ex/b78YKO1URIe9NYJtd5+7EH?=
 =?us-ascii?Q?QiGQDo2oT2xWZ1It7tjp+YBFhNk/+djzP5/Xy8NQbO11VTo+Ba1R+Cc6ubLu?=
 =?us-ascii?Q?0eQDMSJgMNKh91Oez4wr58EJqZ9s7Mr/77WXBjEEWWNHz+9Z4yFdrnh6ox8H?=
 =?us-ascii?Q?H16x9FacJ15cI0unCYYAwcZuc4K4i32xiB6haLAJqP/iweN4z0p96DWi+xcT?=
 =?us-ascii?Q?UQ7GLizGpA4aLGLwhs+RmOHsAlO8gbjqete8pdM4V10icjaCk7imdioQOgYm?=
 =?us-ascii?Q?7f9FdZxuZUqN3v8m52YBqFkCe8Cw2Dj9UInAdzDi33/UzNnY9xiK19XpUA9K?=
 =?us-ascii?Q?mEEbCKEgJ0/xSkrqvOm3nxWioyye1YiTJVBLi6NEBmKSc+DJGP+J7q2HWEHf?=
 =?us-ascii?Q?Karulb+ZBZlW8uWR1bBILINuQkQ4cAvMEWRDYQSftC5jngHVClrPu1fnhG8y?=
 =?us-ascii?Q?djY6mGJipPvyYbEUXte2exGXCppRd58QE0Dkr5r3Dy43fruJKbYuqymi3Bdz?=
 =?us-ascii?Q?kyvwz/ej1cCJDF+Ejqt5qeFbhT8X383S7GmqxdMAjXeZFIhRB/QpnThd7E25?=
 =?us-ascii?Q?d8GNRms8ttc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ejWDE9L169F+Kpm6bHGsTLae3eil0bFms6WLCnnD7L36FjL2C6mvkdoZex3?=
 =?us-ascii?Q?9XbykyvnKmuSkyn4riHUcAkcXnTG4VNG7SCNe3Hi+4FPTroENZtml0oOSIdI?=
 =?us-ascii?Q?ZAcksvZ8ST58qO2bGqmsS6zSP1OyRY6Yb4yLA2boPHNuisQ/ZAro4en4/eK1?=
 =?us-ascii?Q?TDThQpwoQ1IaGejLxg4q7KhQWmAHtXZCM/ShU2WE1neOr6W7QzgezaNCRpuV?=
 =?us-ascii?Q?eUV64woT4X8R0FkO5rdMEvaXN1i1Ev9D3F+inArezcWqfrp9K0326zKh/wHq?=
 =?us-ascii?Q?MHZZ4c/RpTmKmu7YrVW40d+sHGMqWwBxfQFgOpoqa1n/C5cxFc9t1PvLW80n?=
 =?us-ascii?Q?HMwMre1+j/EHxYnwEjItKn64YSvI5Q4FFZcuJ8vcieAEqugex1OEgEBKt3+B?=
 =?us-ascii?Q?082EwwPTDWWyqWgfPBVcF94H3c4TLyPKE9LrSyGXlawiR6ypsKcL1VG+rvVZ?=
 =?us-ascii?Q?k43Xk112+7oGa+WBEyoa+inEV1L95dcy7vxyFDjtx4UgRqPYj4GPGdXwDoHg?=
 =?us-ascii?Q?U4IBPS1IkpKLYbGaoyYf35MHZy9MklW5u9II4N90ix2iGyu3qsIgjnrbTFsf?=
 =?us-ascii?Q?pLZ6FqU+4NdOCNk01k583co6NlEZ/PFE1uTTEuGNxgIfZeG+pSIwVcHEc+Lp?=
 =?us-ascii?Q?2v/yUkaeU6oc9ASe3Ns7mAfJtbgZf/OEqe2ttbHchZr4G4vI6dyo7sUfX66L?=
 =?us-ascii?Q?DpjU7ALUysNdg+TXsqw7Cp1KoPwfYmSQrVCUjyH3YiZWK2t33o2gNngoBBQZ?=
 =?us-ascii?Q?cZJgT1khsx2B1TEZ5fUif1msZ2ZToyrjZ5FgM2e6Iz5Fb2UEXr8JHPxwKqrG?=
 =?us-ascii?Q?uB/85dcTvoS9RbqrVHZdY/WLfwLZhoCVd0uzWqMKCE25uUv/6vCVnnClFcwT?=
 =?us-ascii?Q?BIPOf4Lvk4yKKyWm7DUWyTTwWYTMTji99R12LCVK+yfE8xHcBH73TyAd0vaG?=
 =?us-ascii?Q?BTrR32hdil0CRgkPp/QfHw1ZW66pvZEl7c/2XRSZ2nNEDD+73yPdskwiK8Ik?=
 =?us-ascii?Q?mt3R2RvgehZIVL5EPR/0+tTEepMdsIJw0isYU/ONvnNh9Hn2TJ6Nsf87HIy7?=
 =?us-ascii?Q?BwtyztXDXJzRWRtXzK1zvO3Ig9cf3L+TwRRWVMsdGZr0lNzMeQ3YGFo8lP2D?=
 =?us-ascii?Q?A4Fd0WnFHkFBH8/1ciVtdJn14hi8KzI6UFF/ZhVHb0PPZrtKs+XHV5R2uBAl?=
 =?us-ascii?Q?qBwDEm3OrW/UhpYwbzqJYF76keKNGyw729Mlv83yjaTHntNTeKF2mVZhkJij?=
 =?us-ascii?Q?ZOjpY7WeD/NmlKs1IYuqfpM/Cm/QYUL7tAptUABiwwqlwQBY2jSX3ZeA1bzu?=
 =?us-ascii?Q?RP6HQj9LoQYw4A+8OON1WFnAtXDcyenH7y89KPudFqNsBsH29cvXrejT9wia?=
 =?us-ascii?Q?NqYgLrwe35HTHrrkAV5RwrsWvxapPuH2d/qsuNr33Mrka2yylPIogBHodtdd?=
 =?us-ascii?Q?6NB02dvnakUTuRjar2XHxK3XTws9XUGgjgzrtbm0Acpz04UGD0lHuV1YgoMN?=
 =?us-ascii?Q?6ci4Mm8tflApIDcddVA6NtUqd/BkCDT87azkyQfGUac2dTbYn6uFB802UW4w?=
 =?us-ascii?Q?cO3bbOSUFD4CXe96sjpWx32wp1/Ja5WU4Fel+NJt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66316c16-2338-415c-8ceb-08dd7b079636
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:51:07.4961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGqIYHNuYNHvpabJryzXWKpItl6DuLP9He9pZM+Yxvm9NCL/WlzIgVZjJHQpG1cp0gWA8/hAXrwPBNJxj5anrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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

Add myself as the maintainer of i.MX8qxp Display Controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
v9:
* Add Maxime's R-b tag.

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
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..ee09cb88f51e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7908,6 +7908,14 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

