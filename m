Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF3B94699
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F9A10E562;
	Tue, 23 Sep 2025 05:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oIlEhWej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013028.outbound.protection.outlook.com
 [40.107.162.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08CD10E563
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b234Xi18G86pe2N1AbL7ZI/y5M434SstSrihFXtnYwP/Bc/S+MjyftIGPduPvnuWbR8UMdsTrVu7MCw04ralQiF53C0aycUpc5Gw+X9BnuOcPtKXLKq3glmQwbgPja+L+lVUAOh3BQ+yc/ojEfJXDup+waXZe0Fn4S3WaWWl+3dc+JS35hljPcDNYOx7M/HnZDuy8i+WkYRHr/WbKeUa6464f2WZ19sLItHjUxXmsisGa7WM9nCa2rvUWH4jGikBrZD/2tRCzhOli9n00h6NxI+Vyr6xeXaOfXyzEsXNdYAkln/zCRNs6/7LxZXl+sBSsy2msiDkov8pUKgwRElrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQIAbC1A/BoG8ywp30/pPldQNAZpPhMlR5FpNbQca7w=;
 b=y+ZIXghyjWUgMJ42/lGftWE2jDlrgPWgH58F2M06NbsQqmUX9TAxuLGZmtQlvdoshfhGneLjdC0dQ5SUruE0C6nHV/Eq2hCe60xHx0aqKRc7NaENbH+yOQkOF/l22UExpVWjfFeSboy1x1wQWux1Cqa/z4H7jlgKZMDm4rF7mD/CRKDZNs5cgF0mRqVUEKTXHAQgf14adYABK6vK8W3aWARjP0IsapOBkNBDC2RPnn5R1NoT3skU+PPpJWWcUEVGNaD/6ASqb2ZzlPUAINnnq4QumYAniuBLZNLJWz+lYXEJNeRgUPYBuTh5rHyxaXwjj5o6WhYU5zbAE0i6MUEbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQIAbC1A/BoG8ywp30/pPldQNAZpPhMlR5FpNbQca7w=;
 b=oIlEhWejKJ6/Nl4xNaR6F4qX2S1jMuDt/iRff7L1E4Q0NiIovHjRJQ9jCISKrOmo8+eOI/xxzWIZNhTUtQfx8Z/LTXQqj7Skrr9hk0s73HuwRY+XPG99mJzO8uR3rAMpHF4sq3K+Hpz9J0VC8AInjQr1OL90p0Ve9/HunVm94wLF3RcXdqGwb7On4zWq8f+7yxpxVGE0gQJLsk52UncN3+RffbyIXpD9jLm7dPSzYw2OIjDYXLyyH8AIGBFQ6c8SQ0YQiyzeFFz0i5IDd6c4qZG8X+bmAYTok2uLfarQuGcWE1LU3QbMsVtZDbbcfx/2rAd9GxHxFaThGT8/LkE7eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10419.eurprd04.prod.outlook.com (2603:10a6:800:235::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:31:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:31:33 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v7 7/7] arm64: dts: imx8mp-evk: enable hdmi_pai device
Date: Tue, 23 Sep 2025 13:30:01 +0800
Message-Id: <20250923053001.2678596-8-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10419:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afbba0d-7085-43e1-8c2d-08ddfa6274f7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qnh8hn7p2498eyd2tdITRYBUCNvdgwtF45lPwIYW151UONSbYcUk7ODamda9?=
 =?us-ascii?Q?qBQKB5CCzIwW+Z9w9nT0ZQ5YV2OoO3J9/Ziap2t6y8vq84qhxfMw1tD2tSI7?=
 =?us-ascii?Q?0dYh1yGaOWjuhLZzQmuSGGDgXs5nPsuRBENNXr8WGLsh8oSsHLltdk8080ia?=
 =?us-ascii?Q?x9S9xuDGQpM8mZ7wSC3A9XGv5cws0AgF14+0hAepI8OMMNfdGrG82dT0Z8IO?=
 =?us-ascii?Q?93gozh0suTVjCuq2R8rTuVvs7JG5xcAl+a+hpvaD6Bq43qiZz/fdH0Lljdco?=
 =?us-ascii?Q?Fj0vUI2bPPUjAUI6f/trrTb+82yb+eF3Xi2fbCbBWokdws7Ht7DIvoc8I1BK?=
 =?us-ascii?Q?tZ9qDsC+8o5keZu/b34MQhaULqCE+5XGjnbeucwnjEB/mnre/fMOExmHvVMT?=
 =?us-ascii?Q?Zj90Z+m6CRZF0F0N6vs2R7xdJIja9IDUJVgBi1HhO4kOlDK4mZtE389EdJVu?=
 =?us-ascii?Q?0amh9wRWqYBEBr495oQZw0K/+o06Bh8UyQH7V2H0+IeGjN/hmUk1/d7+r62F?=
 =?us-ascii?Q?pV4SwnEPqegSH/4dwQFjxrIV/f91PSHVccK70RpOUm+hX1MkFAFyqrXz/YRv?=
 =?us-ascii?Q?uzNzF5Jo42/x+jon9k6pVvnc96qX5Wpa+B93NndL+gNo23VcBFhDB3xCxwNV?=
 =?us-ascii?Q?mJY++29Z1pYTt6BFq23c8TLY6FNFcFToxh36/wun/771ZYjFWJYSzaHSsyvk?=
 =?us-ascii?Q?nBcoLhAv51ZhXE2Vj9U9/JExi6QQOu+xNOEiF0ARnOh3gPZrB3YkfbDnuBOe?=
 =?us-ascii?Q?AQHSmiOESxoDBwilS2vn1H4ni0GR64LrfSr6UgkFRnng8ZoKzV0JiWsYXN2M?=
 =?us-ascii?Q?SB8nr1RhyaaWmwVaN4/Fcu3cwDyAzOlDuiHFsD6ejKDU/rvzGZ4yzAS0hg+p?=
 =?us-ascii?Q?s9noRxXH4OHdBO31OtCxjNEWI5WNG4hGHEeP6nD3s1PhiTOu6pA4wxor+1jk?=
 =?us-ascii?Q?zdKPAXNnniNOYqWU4RoqRnlg65GElnPHIT0GeWxzsFsKyNzlq5DNUIc75aLE?=
 =?us-ascii?Q?nPHDeTyqHPiJtIH5rMNVoC3Wyy6+AdNTUgh5lQln5XTKjUp2A2rBbZJezri9?=
 =?us-ascii?Q?GxVB3VOG5aJoyDicxcip2lM4VTdNsi28uXtKLEuwL5TXvJOOUODJoB0LjhgB?=
 =?us-ascii?Q?ODBuDd+IkVDiBq5tGL3TztTFkffM89SQ4onMNs0XehgBpaQR+wICJEKfgOW1?=
 =?us-ascii?Q?4LS/SZLn17+QoFoBOKfCCHUv18DjulHX7+w3XNCF+hlPQ41kRTHXMJ+QjmH4?=
 =?us-ascii?Q?GL2lTrKwP0Vm0/o8X/lV43xROo0YT40/YVfB1NIwZf8Uh+/iBgooappSRvrP?=
 =?us-ascii?Q?0ZEevE7GP1DBJMaL04ctzao9+YU34iXPHI7gExxGlEwmfpoTEI7QyWAI+yC+?=
 =?us-ascii?Q?D8DYI6qqEbtDtS63RxZPZq2zRnVhE+1lfDksvW+CTHEkkJ7AkUVG1Fk0mam8?=
 =?us-ascii?Q?snEFwjWFCpo7kWL5m82h5/1N2Ce+7DF59qHnLDg3yZ1JrwXNvMt6h21Gz9V+?=
 =?us-ascii?Q?VzTDvX4Lik0S8jI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wahGEJ4JYZQo00GBMRiOKMasWi7Mqhp4+Lkx+5hbn928gPMvGkmWVpq0aX8/?=
 =?us-ascii?Q?BiQa1xLMtwcuUDdG0vI3aP10Dt1DSumowzfk5jHZjjxtIG3hB/8z9RF+aJ4g?=
 =?us-ascii?Q?X/ZyqJmBv4z2WOZ9AB7btx7CO12trBfaFAubqprZ4u1IyZeT9OLbhzOWuAH9?=
 =?us-ascii?Q?jiXl8HsvB20uizn2S89KTHWGeKE0KEyLjVO8FWA8+kjWl5WsbJbiu92Fo75L?=
 =?us-ascii?Q?FdhhMZA5HMfuk/6Sh37AnZILItlL6Lp/i2SjjmIpjBcrWDWQLJdMsRmlyvxs?=
 =?us-ascii?Q?m6Mz3uef0tVNDnoDOgv3y/44nTb4SW6k4/Nfh3bU66aVwg5Yzdo0EPF5GBfn?=
 =?us-ascii?Q?+JSLiRkgPVn8ypft0C9KPBdknXSgTD/F1vkiVQgwEqMSWJtsHkorAbSRvo5a?=
 =?us-ascii?Q?QO/ZS2NkQYX8xvrJn0auMj/ho4PdGvhjf+m8VsI99YfOLbopMris0wbUsOw9?=
 =?us-ascii?Q?hCsVZhLoIbddEVV0amEaBTW3uzWruacqkkr5Ws7F217nFEIjOMKDggkZgIpc?=
 =?us-ascii?Q?nYj7xpt82SQwvaQfQ0RUInohcwYWzxuHpXELKSSXi3yMk363Ig5SdZZMi8Bl?=
 =?us-ascii?Q?D4ftFJypgQdJJ71CqLu8HPIpY08ly0o2Qp/iB6dOXzlIJIgaI/uJ3KMP6ts2?=
 =?us-ascii?Q?FCTVJs+NPkoOzKPX1NGBkWmoXu0Gh47RVRv3cy9aRb20dqTfUMrdaGkV6Acn?=
 =?us-ascii?Q?IgPhKJMRQa9Do/RfzZZkxUsVZCCZyn6EIR+T1lYKdRPTbDFarDUFw5BCNqed?=
 =?us-ascii?Q?5gLro5xShoCaScDqeIEQUSqstJCmQTrT1eEx/++b41Cm44e6Yf0mlFMr7IVQ?=
 =?us-ascii?Q?ku1uafcNIV6ef0vGfHEGRkUJJiHbjcoqsY1/5Rg9ODOZjE+Md2aJGpKBGyF4?=
 =?us-ascii?Q?NK8+Y++A2FVVubu0bdnFM67qoIE8fwcO9Wnm6XgtVb78pHQleimZ9LBEcwU2?=
 =?us-ascii?Q?YOR3zy/otMKsji4zko7DJbw3LOIcCzVUdcCfayhsZ1ntYS2tiDl54tqtg41Q?=
 =?us-ascii?Q?Psa51XC5g5dDpj28GYNca2v3gcjmfxqp3vLlo3sJytwFmj2NxOfjkiHij4Cy?=
 =?us-ascii?Q?REhcFhNayrJJjgGGVm5bxI1GJCWhU/Ly2j8W90yf0JdF9tlWwWASYEWU6Axa?=
 =?us-ascii?Q?g2xaWY4B9oO9GJ7kCty+ySURb1CsbLWcBKyrgqRIBTHOzOFUHNfgO0rsB4wy?=
 =?us-ascii?Q?kUx859btpWAHnRYJS7QhCGFjMhnOB+4Uk8058sE2hiGxhnggUeSnWpv5bNUJ?=
 =?us-ascii?Q?6yyt/7/gwq+x2sPfCCx2p6N7Mpva8F9Da5SClORb5MieKfWkgE78vfXF6lnc?=
 =?us-ascii?Q?yqVjQufGhEAf/HZmBJOEjLx+X5Lmfqb+VRO8oegxK2Jla4uAnOTK/kmkAP3s?=
 =?us-ascii?Q?P+J5hMZn5/wISG1Y5vfR7s2yteQppNYM31pbGdkRCj5YT9rc7TM1l1TYQ8pu?=
 =?us-ascii?Q?dDEtdJydro2wjuMnBaZCJF7B6Dv4I9hnkpFBvBzdBCl34V48DcQEQn9QxkzF?=
 =?us-ascii?Q?APfQzot0SJPruBAX96N8ju1uZsXJpaAZMP9hVFHgY5/zeo5Vu4QzUrDRFf74?=
 =?us-ascii?Q?LHCcJZfsYgq0GAazRR696PdAgZgQ755Q9+rCX6Za?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afbba0d-7085-43e1-8c2d-08ddfa6274f7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:31:33.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYtK6hPknDi+9uAE8msSHVyLwZ+xf/asYfFrQa+r9aNKnxgtd3Swcb9UHu/d3hRaX8WZLNHAQ6IJvOwIAgGvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10419
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

Enable hdmi_pai device.

Aud2htx module, hdmi_pai and hdmi controller compose the hdmi audio
pipeline.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3730792daf50..20c400766ea8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -442,6 +442,10 @@ &flexcan2 {
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.34.1

