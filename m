Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D784CA87675
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B43A10E460;
	Mon, 14 Apr 2025 03:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Zj9H3ubV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4E510E460
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9Q2SgNJNba6WssAasYyjQ/DLWRKz1dqMyblnVxAHcZOeCgxL/IisbDuuEITW80vPKtHStSmtq+K1QkDnOfU6379tXATQBG/RQt7lrw8SMln3cLfNDCLKxKQBgp+KIZpAHrXqbEiBo1Lh3fLIdaBOIo9yAsXY2Jwshk94CZsfChdeh2JwAh2ZSqbL6EAfSoZlUOrVML1pSgUB12R+zPtjb6UEsGaZQtZ9EN5eIr2oulTpovQksoGPjc6tH9N77E38JeYyAFNcp0Sl+ao5HXrovpuCaKrZRiFo76WqUc8tZH6OETF1fU+GOGK5zMtLvFi0dfkPhlcVIKyqYlJCmR+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSgt1I9fYU4QYg/ujpRfARlu36TtpLk4MqwmgX4Ulf0=;
 b=d0LXJKQgSTOChGzSfOOgY8IkN+8feLeN2C66EP9XDsrQXhRPHPxPkRi1GMd5HrPbSXV7Z2f6i8okDY+a6v50pNZDg4vmZiPvQyC93GgPOkPrv/629Pyca3wwBi68HNQ7T4BdPsbO0t/8742t6bYDtOIRjUv7ghILNCe8Kjat7X8NhaH2N83yHkj9rmIDPNOzaRsqEHay86mYqUHigahI8dZBzqtMZ+DE5FKvq2H7xDszomo2caSYcEx40yKRc27YNt3JXdfOOekainYitNn5L1Nx73k/XQjjkiyn0XhQuyEO30eD/G3T1toi7vfxAhwyZJmviTx1NXm7OjNA/A8pLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSgt1I9fYU4QYg/ujpRfARlu36TtpLk4MqwmgX4Ulf0=;
 b=Zj9H3ubVwAC7G5fmX97ZcyujiWdq8B33Z5lx6VnUd43PkyNTx6HHVGN8IRF0hTKS0U8yKwy+phsUXeiYnR/G6i1pMwwiR4KPbiCvi8V/85sO/UjxUs9k6JYud5ZdJ089ztP42NgYYo01JIG+KYzH2XMo4lT8K2ZEkImvFPMNv1+eg3BAKwJr9YaTtohOO0US9iwUa8I+o3HHb8EqWl48ywwdVdwra8s5Tn5Kfj73bfEhrAgyFzZyBQwkUxOjNEpGQpl0hK6JyMUVdDmo5JPSU3rW2jms7mZCbw8HAuwXm/kpKlcWjYDwJgkSQkcDNl6crgXQxD3ft/QFXC+pKdqWHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:51:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:51:15 +0000
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
Subject: [DO NOT MERGE PATCH v9 14/19] dt-bindings: phy: mixel,
 mipi-dsi-phy: Allow assigned-clock* properties
Date: Mon, 14 Apr 2025 11:50:23 +0800
Message-Id: <20250414035028.1561475-15-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4dd0b8d-de23-44cd-3c95-08dd7b079ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oa6TLfunA4+rQJ8KclQZ3oRFI5P5v7CZx8wc5Me6wXqn6LG36rq0kWO7wbhR?=
 =?us-ascii?Q?aiC12cLGcHg+3iMOpIh9QKYI3MgN0Ft9//t3aHcnuOaSPQYlaiaNWIgo49ta?=
 =?us-ascii?Q?/BsV0EHHHG8Z8RQqHUcOtOArEv6gLMNB0A9tDcKmxAL3D2ksJaAj8mTMyd91?=
 =?us-ascii?Q?WnFNpLIaHBMdEsdJ5bQKSPkhpYduqM9qWDLwm3jXeSMVrr1MCO+H47ya9E4p?=
 =?us-ascii?Q?s9vq1A0/hm1xMaDWhvI14htvLSNIETEcDX5gfa5QrhNxPxMWrtIA67kAyYOo?=
 =?us-ascii?Q?5LCBCuoK2FTMSSQkQpjqLEjjtgTVgTK3TamMmIyZAyTK8PB/zqKQuV68lhiI?=
 =?us-ascii?Q?zt9gnm2EKBO7wxtJl3oKobiYv+8ssvsiVhsvQh16svYKDNfGPQ55quo+W9rc?=
 =?us-ascii?Q?ZKBNgHIdMvNIyeIYm/Km+3p675r6/NaqyfoIxx7NSkgbXsHTYxAJan+fa7oW?=
 =?us-ascii?Q?85naTlxsQDXHDOybLRtWA1OhSsEog6yyvgRzg5gFF2uqklYOwAMmlRm7R4PX?=
 =?us-ascii?Q?w0xiRNLtg+E0CVfRalQonibKZ2nq0syxej9VJZzN3vqt9w6gW7aBNqnddZ6b?=
 =?us-ascii?Q?Zug73q0iE5friw4ZikQrfk6xBTHNrgsLHVcVh0Vkwb1gg4rwwh2Lt8Oc1eBE?=
 =?us-ascii?Q?HW7Du5+b2vAyPtGuf2p0psIFxz/JAVBZhbQ9EUWeYJ7Vvnk7hMW2K1xlHOuJ?=
 =?us-ascii?Q?LRPi+zUgDSMkCWjJVN+OGX+Cr5eETw5jWAA/VJ7Y6atQl2yfvKe35JcSalb3?=
 =?us-ascii?Q?ZguByRuln0/064c5zB32dGs8XcRLaxzcWSm66Efy0JBPWmSjNwAoCh8zJSrM?=
 =?us-ascii?Q?MkCOnTd1SGjPUzq5CHguOG5J43m0cP18cZvknJGTTnsjuSvevrII9m0XJK3X?=
 =?us-ascii?Q?RBWzuZd3oHggvCuNFgv3GU7wCGX5nyIhTqgf4pubIFqqi9RS+A5ee4tWFNVq?=
 =?us-ascii?Q?L5YdeK1LNgLD9DNwinl81SM1pzhUV3tBiWcer+KSJzC0ViuoYi053dw9JI2I?=
 =?us-ascii?Q?7eNMS9PxdxdPGo2XG8WVQQ80feXfgv0QnenADSYtb5h6XnGfMklzKP9F7IGi?=
 =?us-ascii?Q?hQwWsIwPS7QirBDS6CV/qDPLRHzMraeu2yKMVLxH6ewETjmonjSc79t2O1Nm?=
 =?us-ascii?Q?jLnfJcbq/Zv6UVXTvAtxDbKbMm0o1evD82D4hHZ/+6qPt2Z7/jtzq7iA/Ago?=
 =?us-ascii?Q?zZbHFR2EkcexPnf4ZcY76he44T9IG0Mza19VZaHc/Q7Lm0IZO+uIXR5nKmHt?=
 =?us-ascii?Q?qe7ZN9Q1UwmP/sgI29IQhZgJmFZHiAyad4Xq8TEuld17ds/ZiZu8SkuzCcm7?=
 =?us-ascii?Q?jd+spuOxRIKJh/PNMzi/FobSC9Nbwb1I4/Bw8Cf5Jjzd52djnwy0QtAR8wkx?=
 =?us-ascii?Q?qoSVZUU714tX1kybUYMts9ghjWyaOxP/qM05NqOShLEDt+6QzivpElY8+pig?=
 =?us-ascii?Q?TStyXxc95Z9NvZqAyx9zRP0WHnJkSKe8hZnSed+A2rV9TerZjYd7Zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?anl11MHXUwat2uzopi2wMrVWiAhJGLJNOV8NNUUj7j84WGO48bpj1+sF3Q0K?=
 =?us-ascii?Q?sFxCOg86X4+I4jA9ahXB6aprTJozKDVpoeNjVDPS+XULCfVfkQb4TERinmnW?=
 =?us-ascii?Q?SrW34l1ZZbQZG57gjyMAX2aIOrCTMJXUe93WMx530ZHPjsP9Vwz9I2x7IVJl?=
 =?us-ascii?Q?tbIRhzjxFFS5zFy1pyqrN6cCr4TFNBIsljjHs6HQtAb0CsTi8X3+I3LOReRT?=
 =?us-ascii?Q?Jt/ErS/6lfQuaEcQigMZ0etk0yh+oaIiBdkRCUBEORhorqOLVnqeTO9GBpIq?=
 =?us-ascii?Q?D5AyZ8ij1LGLOOjAp3yosIptIryFO8pdOCKGyZNCJAyT9m36VGtyH+I3D/oq?=
 =?us-ascii?Q?1FL3eQD2S4wI4DOtMP71vgmG9t/41/EYG5C8kAoaWDuixLZeLcZB1azNvy/s?=
 =?us-ascii?Q?D7Fysb0Q0a93EYISyDys5rX6jJS9b6SBfXMZ8cKk312FMOJt0N+Xzl82Nkj0?=
 =?us-ascii?Q?lL5p3NBjfcW9G+mwgQQOsuikoY4YwpUd1tzBPfinq1PSt0ATz1FJuLBB24ub?=
 =?us-ascii?Q?XFbOVJSrviOHrhoTe1v4ykEm7llPw+DunpWsVII93v/5u8Oi1ragPJHgkT93?=
 =?us-ascii?Q?fciWV6a219E+NDbwqanSaGabdCLt6KKU8XUOU6Q0qTqWTbF5Dw1TaDqX2DCR?=
 =?us-ascii?Q?g7J8XDqhphEkuqTFuaeRd3Jwn9dCBoc5+XBYkfCpZQh1gB5QCtbAvoI8OgBf?=
 =?us-ascii?Q?FG4FUTEx3KU7/2M6G0+nRjLOkzUr9l0UK8bAtTpKl6RV4F/lWAnCFe231maW?=
 =?us-ascii?Q?VNTFz08645oBzuIYNOu94FD5OQfC+WvGzddEYIER+t5xeObCokEaBfSjVaA2?=
 =?us-ascii?Q?XbicTj9RCzf/Nwu/0IFhea22PQvwmelMRYGLCg40GOnim2zNPu/xbEohhUbS?=
 =?us-ascii?Q?olOTtwtg9eNcj4Abs2ijYZbSazW30AG9DvoWhZ8Q9rHcy4UN52LKzXi2V/9b?=
 =?us-ascii?Q?iitmP7mr1JL3+x2ZxDD9GTsA8ngyYcBv7+aW1/CdZuzVcCTdLBtVAkWrjlr+?=
 =?us-ascii?Q?V3cDJO094KxSS2re6WIN/C6KMULlbgeKBCpGH0FXNXS94c8eqSkotVl9bCbU?=
 =?us-ascii?Q?TKPt576KhH2bXELNglc1ppRYYEBHRUUs2DvHaxNnrVpxTxYjqeVftfEgAbrU?=
 =?us-ascii?Q?HWu4INDmFJMszQIfdmuzrjbp7u6OIPkHePheiTDmpyhM1HKfhyIkGfOgnBkb?=
 =?us-ascii?Q?OERtREECJwrZegD0nkqx0P+cC4pop5PQw1VNIOM3TBNuC9e7enmIRTjiJKWP?=
 =?us-ascii?Q?TUN5r1Y9+9KetuNaYO+VmXFvIW80gw4yZBqv4e1g7eRsBXPT68Pz3GAOP5x5?=
 =?us-ascii?Q?ODlktA1lPLu4hHij+eUijxu0MHIDqEY1RHpduS9cfzmxD1IyUrYS/kBUsini?=
 =?us-ascii?Q?nhZRHIN5D7Ch6Ijl4SaMVF9aNen5BYzogx8HA+yY8/GBUdqIjw0iAhJpH3KF?=
 =?us-ascii?Q?SEpzhiiKeFiJupymwYBr7C2OncXZ1LtVpTtqtu31PQxteJGgnyfIIx5I6w+S?=
 =?us-ascii?Q?vYlKLihAytauNp8XjfamncBtAHowaiLISHJOhQqc342lJEzKTcB6MYpKz8HE?=
 =?us-ascii?Q?DIYelaAqUAkpFVYOEd5OcZE5RNFw9V/dUUkubYl9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dd0b8d-de23-44cd-3c95-08dd7b079ad7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:51:15.2818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAV0cnzLYO1baPoZnjWaja9UiLFztIoC2LIL8feu9pYpOhJVButzmqWhuxMv5iJFFtSVvyzAuIBtq0eDT/Q1pA==
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

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9:
* No change.

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
* New patch as needed by MIPI/LVDS subsystems device tree.

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f097..286a4fcc977d 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 
-- 
2.34.1

