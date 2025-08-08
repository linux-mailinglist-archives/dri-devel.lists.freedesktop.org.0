Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8CB1E421
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BD110E8DE;
	Fri,  8 Aug 2025 08:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cKr4NVpf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013010.outbound.protection.outlook.com
 [40.107.162.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193B10E8DE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1iOYVzWK75EjZAJ5ZqTOMt+0YolLSUIDUKWRTK5O//VBSbnFrBdptFyiQSAfpAQeQewg0DRzv7O/eQhzqxbK4rCFJP6Eaf9ahj6bBsuVDSA8f0rIg1L1VzzGeuT0WXNVwzEbN6jQpLz9CQ35cWVfDf594txyaeCy3FMuTrCA81lKvhTb1Rb13/j3NSitvY0rKdmWAsXsPXVAX6pWUjm3IF9CKOCvEVMJFqCj0gCBPlDAq8QJ8RbkkV3PsXbm65mffN0GtMeExPfF6ewPpDMS7te/cxK8qRfZKETBW1EWL6YnfGfzqxuRC++9ZX1jVtjtS3dL6ch4rvDgw7+dcqklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMoPaf7vVFCkt56La2a/yrev0j8Z8aFCG46aMOvwuRw=;
 b=CwsP8hXKrplWRA+87psP/y1DWdWMNFUDFXeTOI0j9PW0iyRctABHF28x8MotDvgGJWP+OL+HoDwHSclg1wRxIGLKjpqAKg8ozMiqaFt39XtrpYwBcu0fzknvtxCwPQzRvcSJVs1dRnztyQysgrgiGukHQM6URC+QWG+BPNes7ha2FqTmhniYmqppZxSXQbivHtH1wLH+4Gk5FdaPygC7b/CzLqY5pb6v5BE6bgdV8+VmAjq3pL6UxbGFFxiu54foLdZ9hkS7UcRECQxvYKGAWN3aOnZIHCEU8H/GWIpadMIWy8jRH8ELQ7QX/c1RbArZE2sjwSNuhRfBtdvLmPnOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMoPaf7vVFCkt56La2a/yrev0j8Z8aFCG46aMOvwuRw=;
 b=cKr4NVpfvpncQN/+2s/O6Tody52j+tIs9pGIAe9GDOagX5Fc/fUJRmvkBHEDp3yiZKOf/+jD8w3wN8dwIVknSD8jBC3Ke6sDB5iE2GPmx1FMPpkVmW8LLix2mSFmWAfqMXNSvKP7O3E+uR/+WQblTC2HVuPvwk5PgQgqVPHZJp9onobKPDNbhsNbDwdTZH/ijH95Z9YYlCcOY+C4/pq1aR2KBfNltRK9uYWpfZEHA8+Kzo7DnOU/dvmrAX4sX3V6FdmWhE5QgeTcvyMyVPZwuNRZERpN6zlmhPEcuISVrZWtbFjVF8BhkF49wA7b0RkZyX3F4b7kshzpqjJJb4bD+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:07:55 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:07:55 +0000
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
Subject: [PATCH v4 7/7] arm64: dts: imx8mp-evk: enable hdmi_pai device
Date: Fri,  8 Aug 2025 16:06:17 +0800
Message-Id: <20250808080617.2924184-8-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e67be6-1d22-43fd-8c26-08ddd652add6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gO5ACPZB5NyB9lshoFk+RFpuXDaMIzajBz3+EYE+DFbo8FAtqOsnx2PhfNz6?=
 =?us-ascii?Q?69IQxxFcB4ukjNs5Mxlo0Z+GEhrXArQRB6v4Gf9S0EJrklmpq/oWiavMo8UT?=
 =?us-ascii?Q?3BDF/JgOlPSNoGGw68cJaC2A8BAvRi7/vidDLweldw88oWEpr+IBOF5/bwLy?=
 =?us-ascii?Q?pG1u9nu9db9zkCNjP+KRgKzQ+biHwJJvAkbLyqDZO0Tm/qsaC+Utk2tej+xa?=
 =?us-ascii?Q?MrSpU7ehWIYPx613CQjwMA+swRNsrWWE65v3Gaxc6u/xzr9PUPl4T7x9eP/8?=
 =?us-ascii?Q?VgDJM/fLRFV7l1u3QnwLauUA4weU/sCISVLihcn8d9Jx46QX87H81V8CzUM7?=
 =?us-ascii?Q?VfuQprc9DOFpOa/O7/sK36gzhobqxZVWeYjMLuKw48orJ63p8xdEck9EuKPZ?=
 =?us-ascii?Q?E2msAGyV4SfbsJX5RlPx+0s4UBGnAVmqr4neMsIF8MsHr8adGzeLUaNZR7cp?=
 =?us-ascii?Q?+D8IM63YpHKo9q1voRljKMn22+9EsM/5WMsXvxxVih4eqmws/nzbHISNkJtF?=
 =?us-ascii?Q?8k75ubqtjozPBid9gqd5SAenoi5u0DgtAIGgZkfg6XKoXXJIjP4fc4DH3dHb?=
 =?us-ascii?Q?U3vaV2bLmIJ3EAKysPF3pAh8Ov+wWdHDz2vrGqXyOyW44Mxpn4nw5PdMHyqY?=
 =?us-ascii?Q?7Y1tDBAY9YfzoTXepooT33IipGKs/93ohrUWD316onC/GcctwCK1by7IUdSC?=
 =?us-ascii?Q?p4tHtj4tx874f0tRG6ikol6UzqgbRsEWjBP1iGrjVRz5jjWLy1MeDzu556xZ?=
 =?us-ascii?Q?IeiWKk+Jdfu1t/hWlrVLZ2kAcH6bVb7D/T49c2SH7yEGUzPo8HfTwECPiix2?=
 =?us-ascii?Q?xaFjC1TsAxUabhCtZC4YLpcDuT7SbEa+xIt2dlZ6IARyNBjStm6NjvUvA6cc?=
 =?us-ascii?Q?NSQ+XRkmVh7bU4bfUcHPfZw76T8jbjgdvgyMePOhI83SHuUi0UVRGr8SMukr?=
 =?us-ascii?Q?sqMiwcyt3WZSG/fF0bzyFPxVIaTKVaFMjNXM65VWxYXIL1+iFbbtuMlHmJQC?=
 =?us-ascii?Q?ZumZnBsv7xGwhlz0vRIkOyFht2/qEijx3eIEK2hvxZUmkDv3Epduh8UGMliB?=
 =?us-ascii?Q?iUdypzoF/bNaxtElxzypBdK/ksW0gxNRtET0/wPPXy9neQRO5sp0KdCgCYUM?=
 =?us-ascii?Q?GlfKufZrPlVLcbtnfqpDpEdEUS5nRIIh86IrnKuYnEQP4wZDqa3P2S2dVjTJ?=
 =?us-ascii?Q?dJD1J1FCjs4+iCHPQ2yianObmuxuXdDaEkT4rcHeB14cb0QklUG8z1LvOqgK?=
 =?us-ascii?Q?vzXu3aSVTMrrXPJujfJHvFsoVGqvjU05qURFH1KrY4xmm+Oi2wzy/tx1myO0?=
 =?us-ascii?Q?5cRBQYTEw9LpL1O8HpGAGstCUJxreeKKIWigBBV42Oa0HcGA8cX4XcfCrHtE?=
 =?us-ascii?Q?hkt+D4xp9xhkqdXFtU+HO3Zq0V4isRYr1t31tQfwy9yVpzi8jPHGzG7LAAs9?=
 =?us-ascii?Q?A7tw+u/7yQh2+EQGz4qTOJFDTS5hM/thzvoFsI2nzpEJq2QBEbFQSvKLLYUL?=
 =?us-ascii?Q?cqOynt7H5h+fv6E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0TYcwPJfLBGy2yAkBR12iSHNADjwjLHKRRVtsAxVih6zxg0ofJRuiBfFDC5O?=
 =?us-ascii?Q?tj/hbZeWDDAOmeHhT2Ldp4jHByeykhmRegOZCSf741IUkjFYJvUqVQb38UDM?=
 =?us-ascii?Q?vLFhqGqQnpAhlAQGpr65CD809t1n4v3LTyxBmnehSma34kg3owyfJnOsTnGs?=
 =?us-ascii?Q?77p3PwMctkzGr9WGwX6jSEBxKD4vx1jLyN0M5b2byEgDCMFb4cfcpMpoPqpD?=
 =?us-ascii?Q?yw0dvJIU+yXSxZlXd6+nserjrXMOsi2Pa1hJyQTZ4C9t93P6poJJOb8Vp6c5?=
 =?us-ascii?Q?L2b76Z1P36LYqYzQaQ1PXWjWvzbb8n5CSbkCx7eOR8/YAgykhKIt+KpSh2Gu?=
 =?us-ascii?Q?hwjj4F8rkmo8OJdZToFH7fdQKeAvK8+nEQpKHparVXiYt2+xcKNx1zeCGLEY?=
 =?us-ascii?Q?JOmHFKWn2oL84OEgF79NL7R7lBWLioHWdloySnJ8vT0EMXDE6gFg7iZTzvdK?=
 =?us-ascii?Q?gKlRlGR5iGpcgLRNPpyrT8Eu82x95FRNYqqpSKayQLfkH9iZdVZpLlLgS1uC?=
 =?us-ascii?Q?iMk0cRB7U04oz9+d00wwivW0wGy5dQMuys53VeDj/h5xYav4VrvBe/xG2b/e?=
 =?us-ascii?Q?QOP2+R9j4LcckrR98Stqpen4qt/8Oqu5O/ugQfIXmrAff/JVlNRNO4AtmUO+?=
 =?us-ascii?Q?tyqR6xLc21KQN4/NqOPjQUJt4L06542YLUAObiJ6bUf0decuV+CVk/SFrQ+E?=
 =?us-ascii?Q?yx+P3BYFgVheyp8yqr2VUEneGBm3C6J/pYXF9iJzGHl5fSSdkTRJsQOps7e9?=
 =?us-ascii?Q?pP85VT0+U2twgbroCzP3ZaIQ9/g18kqGtiTv6J+tjKOlDeOZkQWpq1MuyeqH?=
 =?us-ascii?Q?mgBBuG2as7HrrTRB5tDMGSjgnFbreBrkXJRPozMwqisj9j4JY7h0qsde/xUv?=
 =?us-ascii?Q?y7NlWp8ZOLUIvh7Z3iQ+YYjAIFgTq8rdBHL/ArzXDRDp3XG3dmvxsAK1M/Sg?=
 =?us-ascii?Q?cTiAshj4oEvwru/P/1YtPmVh9Yjd58LY9ZuOgLKj3bWI5VW/szAEDjdbV95f?=
 =?us-ascii?Q?2WdptaFsWSX4r6HafeA70Q/2iLPKxjiBCZ0Cyk3xwLuZMO2BoELsJeNElIhk?=
 =?us-ascii?Q?9jvoIksJCF/7WA/KdgaYRefoH0XaC12HyAtNYUpHt+4rNeQMY10C02rgSNEs?=
 =?us-ascii?Q?3CcWJl+YqBVEVBXF2FuDZEEhAr+hdyoZDvu8nw3JVEXcBVuhg6QSyFbuOeM+?=
 =?us-ascii?Q?oULLGJ5uDsttmy5q8l0gBXUHNh/SCxlA9v005h0ay4pDBVskmnmzkQxfPv0W?=
 =?us-ascii?Q?cXqYr/GK7Hxr/t4qMuZ9fUh/xmcWQ689JK3hny4AOS9UUqV7K1D6UGvTBAYR?=
 =?us-ascii?Q?xbpcVApL/eTaRPaqQS2gas9AaWvkEEdXh1+j8B9sIKwOWKrRwqDZXIGSug5k?=
 =?us-ascii?Q?p5cqOYsjC7ZQXjh7IGxkF6fq+kiTPbbCbfIz8QtYOz+G5sRjl61eEg4sFrQy?=
 =?us-ascii?Q?DMgKWnQlQGDtWl9joFh1ScMXuauCdo6/CkcJNrjU/fXYDEzefZzl8bOx8rDk?=
 =?us-ascii?Q?jXhe1A9s8qWk7L+bYCXJC1pJkVm1sdZZwoYF6rOgREz0ryaPWrZXJukRCpnX?=
 =?us-ascii?Q?lc2QBVI4VoDyvH9+58+jKl+XNHTvZvjwAwxNN6an?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e67be6-1d22-43fd-8c26-08ddd652add6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:07:55.1935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AppvQtwbHNRGUor8PZjOc5kTWuwcfC3s/+ooRq+dBTX+1UEsDiEKTPSqOyS9bzNx6JtaJR481bezQyQxn3cmEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192
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
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c0cc5611048e..cc9351a5bd65 100644
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

