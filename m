Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7F694016
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C0E10E4E1;
	Mon, 13 Feb 2023 08:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8311110E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFux/PuL1QL6vfj+OyJ4pBMMYztghMCeR11i5QCY7wmMXIPLbWqK9Xtap+dgR3sfbRLmDOYgOg45PLtBznD/mJbCGfx8kkgZzoRaTSdCCYbGX01AAQC1P5yYVi3Z6azKhevCcprl+Ah5m6kblae5gg/CDYVP/GFpvKVifwptZh9/ES9skhKg4epebySJNxVYbylWI4qVEWKSMOZvJ0ICqwCrqnXim2VDY56+UF63WDjeF2PDGv4y4JnavgWKNbovoogNcfRHFTGv2LFOiVV0J+XQdCwRxnc6JrD+YpeTPI5Vu01FJ3kREC2r4ow7pFd/nQH4oSd8YN6uk/Y66c6gkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rK3sw95nfTh2qO/3gaLHLHDQ7W4NNjug4tGJycrlp4=;
 b=RErkLNQTruIBEqiD9oLCtfXyNntxL3mpWsSsDIrrELDXTRCxYyOYJpxLVX6Dt/wACK8FDtxW6mn2FoPoXRdawUAPaRJUknLnQ8xCpsoZTlPNm4SZ0VVtY1ojAMiYR5LXPC22abJnnFi7kZT4fyBcQ3AJBUswlZnL0/g+1UWpPEnN58VDklg9d7v8BGCayDKBwksHburQqy+w3skpsgWicKD5pKeK8xogoOp8R9A4D6nU4o0N/naX0kFrXKY1w6nDoiGjaPvnOBp9ePAMwwc7Y1sMuZHs/F1mWumDKNZNAUBJ2KypvrRSXMsH3TLaT+Ljihl4S5skyPRNd5nn29WrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rK3sw95nfTh2qO/3gaLHLHDQ7W4NNjug4tGJycrlp4=;
 b=oSR99yJWnqAvfJTP3bWfTemt9iB9OgHKooHqUX3LyFRe4EDCHfFOWDnBC6cVBF2oD8Vha/lnPz+OjAiuEIV0fW2ml1koghhH3I4WjH3rZrmJTyh41gUzgpuSUkcuVyJw88FUzHUKC6zdOPkfYK64+sgOtFT/BBGRLRcRsE9oMTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7600.eurprd04.prod.outlook.com (2603:10a6:102:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:41 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 6/6] drm: lcdif: Add i.MX93 LCDIF compatible string
Date: Mon, 13 Feb 2023 16:56:12 +0800
Message-Id: <20230213085612.1026538-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230213085612.1026538-1-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: cb680e75-1646-49d6-ecda-08db0da01590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNM2frljo9WM62nXROCd1jWPeJTVWRrBwt0SaBenkF/Ymsj+jpiMqvQNDJ3q7kxYPT1UpVpIH658iGIQ5Oo6i1xuzvMDPyPkaTyFyBTd9wsj+J6MqsD2abKAJ/n6tJfdtqPv6ubM0++msQT72ffoVrfni5uLgw/jf+j9uCIvnrBxFLPTuPpyt36p8te9vsqtxaVNs3fxudN2bestUknTyIF3i24u8HG1U9zGfzGz5v78IJ/FpcOaLrQ6BS5LphAgs1E3Hjnn3XgJnrreOzDULPLesyuSaY5ezreXAunmjPlABQ7sZr+6f+i2ZesbIbEoVPdXCWqm+rrPcgCbLODwfPIinJqTVU8EbxJURMgADKLqJn43hOS5pq2TOuP29IC9gaAavP6h3r7OquEzeG8HTqqOwIKsaqdj0GF957n4cwifWCd/FC1rbFD8PFvsxfkCpmhqjBXtPA6HHW7ghSfS2o5W2b0tKyAyOeXvU87eoGlY71hp/BpuDi63KUom4UT9sRePgNaZ4+toBLpHzMIT188XONL5teChZX0+6bL3dSm8ylrqZ0S6pzIXpH3JzERUCLDBcu4Otut0N7FSVCJW/E9IbxuMdWOk4uUT8NeSFqI6QJIIdZbL0JdSKxvDAteq47j0Nr0P5x0zcF5eNqqZ2JW0T05xTRF10ets+gpiK4Nbt1qpBhOQW0DFR0/qdHKM1uo/wfyghH2BJOcBtbePHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(4326008)(8676002)(1076003)(66946007)(316002)(86362001)(36756003)(2616005)(186003)(83380400001)(6512007)(6506007)(38350700002)(38100700002)(26005)(66476007)(7416002)(6666004)(478600001)(6486002)(52116002)(4744005)(41300700001)(2906002)(66556008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FLxvVElAq7fF74UC6vhmqznAEnKSAJNW2Lxdf4182p3MhmSmRU/vCb9RMbs2?=
 =?us-ascii?Q?wljGjHNImpx7/3c7RTv3BY0zijUf/2IZMsV6762i0qvKr5iGonlUSwmcb1nb?=
 =?us-ascii?Q?A6GEtwt5f/J1ezexEgdUa7nucsoBcrPLEqDxVONJAG4QldzAR/vtrYZxrUE0?=
 =?us-ascii?Q?AYdhFztUVPAoAt2XAMEPfjlqUaMllvYuPkKiRp3/z/3VkRpFxw+T4u16w3+G?=
 =?us-ascii?Q?nApxGCdmNhb0Au0bUN0VeaqEzcNES0CYGnXLlx94bYRGRCQT8jYNvfKWyop0?=
 =?us-ascii?Q?AtAEJ+t/8oIgwZQJ/1RKQa2zdoZxPOeienkgyUj7r+S8c2i3S02Ueymo4EGP?=
 =?us-ascii?Q?hmkf/HFrADvydj9lz3vgvj7XjEcS0AkonK2t9kgrDw9R1wy7DB2ZYKj0/I6C?=
 =?us-ascii?Q?5GqVzNK+DbjTz0l+dEblKn5Frf59UkEkXAzXsaF75I9Z8euX6kb+XsgiBOf2?=
 =?us-ascii?Q?5oUJODH714vwB+rTmAACRdqKGPgVxoDEu55mds69+tvbYbKdH72a9BFJQXqQ?=
 =?us-ascii?Q?R0oxUK9BPGsePQVTUxY+hetxoDISCJmmJJDZrhFZGUky76Tkmpj74TCzu4Yh?=
 =?us-ascii?Q?jHmbygnzzlccY7wxAC8iytGK1TGRBcfdtCeh2s7DrawhRgE/EJajjUh0UjKg?=
 =?us-ascii?Q?bavZ85KP7XF0Jic7ZIuwn/LGA1x39z34ZM4AeYu7G2jtgdMKqTHkK2rKWKU3?=
 =?us-ascii?Q?kd4R9wUgGa73AE5glF9+zd2tCxpk+VnVbzGAGZpfPRFz40PfNbp7WFYijPK1?=
 =?us-ascii?Q?K8mQGWlca5cx8ZMFHj3gvNQHR1E2c7I6P1YoDUtip/mOpfuqUGyC/XpTGjKK?=
 =?us-ascii?Q?2qxc/XaZDFefvz+OESzNhZZ38ax7Bb1bGkxeajPhKb+aH2f3mwZEzgf+oT2W?=
 =?us-ascii?Q?Y1endFFgf9o/Jt/HNy2VMuSoAGOhCbR5cadr2OEnemclBagQcuhGBNNeUZ9d?=
 =?us-ascii?Q?6j5t8YpDw221II0Z8jT4rbLRqQ7o6hvYvyyyZqZFU+ez4SdDz7gQAuED1lXK?=
 =?us-ascii?Q?3K0tTyv33D/QrMZAfR2K1J7BNhmFAXso/OVMd1f85h0CF1hj3nSecAko4e2E?=
 =?us-ascii?Q?3OpGl9XbxWX6Q0WnAUt461cM7Q7qLuIo9nxYl14Muhb9R4g3VmfyMexme1OJ?=
 =?us-ascii?Q?Q9ipJMCBqZW+vDs3N/Vlhn7JmzDvVInslU5wfqX4AVBHRNR23JsB9BogE3Hr?=
 =?us-ascii?Q?ZidOb0vVm+qFyVzx5InRLslwrqyUDBY4hN6b+fDaFw7gXG8jHC61SHV85bNV?=
 =?us-ascii?Q?JAM2qwb4vV/g5pytvtPQkeOHfkV/fZQts0rFllQ5/nJLGJeN4PcZ7a0KfzVV?=
 =?us-ascii?Q?bwP43aFLfoOacknrcvrG8CHnaEsCbhavqBQdaj/GGHfanUwY+XYbWZthABtr?=
 =?us-ascii?Q?rcPFwxUw/E1klg7rZuK4gBTqRNVl4Lm4oP6GBQ9CuJDJL9Vx9fh3VmS4NVfB?=
 =?us-ascii?Q?MaEkvY+7uPT0GWjAObIQLgMjQeCqPehfsCEE1wU5f2nsvPrCTIIxcrXnSZoj?=
 =?us-ascii?Q?qfH18n21vz0SlK/qdhP6/Vb8ynxo2M2Wpy7dCq3FzmQ5xidZ7PSTP618ebq3?=
 =?us-ascii?Q?htTxV7W/8ssvoRhqiWkqiRMxrI3pRLe9qCvO2ESl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb680e75-1646-49d6-ecda-08db0da01590
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:41.3907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxBS9/iQOSVAM+EEelFIXVkjk69EOYKmOuErhH6Y/WLQM0zJrCvVOsBwrBJtAA3Cp9ngBdiRSsp7Jk4+BJTq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7600
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With all previous preparations done to make it possible for the
single LCDIF embedded in i.MX93 SoC to drive multiple displays
simultaneously, add i.MX93 LCDIF compatible string as the last
step of adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Fix a trivial typo in commit message.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index eb6c265fa2fe..48c43b273a4a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -249,6 +249,7 @@ static const struct drm_driver lcdif_driver = {
 
 static const struct of_device_id lcdif_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-lcdif" },
+	{ .compatible = "fsl,imx93-lcdif" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
-- 
2.37.1

