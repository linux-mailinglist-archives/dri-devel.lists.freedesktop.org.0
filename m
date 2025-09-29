Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DEABA7CFA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504D510E1F2;
	Mon, 29 Sep 2025 02:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K24fpWgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E8F10E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyeHMJZFTIga3tlbT9OZuuWR5enOqz+1zeJwxs73LQz25aU5hnZm57qMPJUzOBC57ntUE/Brz8gAp0MzfREFXhX9yXUERLGwTZvzFTu6bK38LX2Xm/yZdHP7fltmfHTaBNj0IGgti5PFjmKcmhqHdWPCT2C1GhcoGnmvNnKzX1U0qWcr6Xy8j6gOMpkX4/y2HzNWmxcGvqvzVxPsg5kosgnk1jHvE3Lr3J9yWAm6hUo0etDGx1a4vMyVWeEB70ti8c+AH0l4jOHCJX4OUtAnTDPU8K3Hf4m6qh7+Zo76AkzLD1FDoe8d3vfpPa1ZraLhax15m0E6sPiT8zAf2sOFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=nAt5TDcbJrSC3oFmg3HKNrqXQkp1kwRts/9+vltzWO3dq/ZlzvWFjOUGGfg9oE92PGAielqLP5W/u1xOfWR2+JLYmLjnayjR3+XqDzR4qS8bi0J+DwXJweSSze9MtIcKpYLF4iS0clFye+nS7uTEOzM+zsfPcvHhq8ly3Fbx7F+YB+nWVtQZ3tPh/iagVojuSuFWJPJg/u7E18KafKuEVn3QJfGf95lMJZEdqe2rOwCPlMsvh9/oI8lnRwPvRX5iVup1Lgz0Fnd4+DNFT5lhLUGEuhRnRqbuN+SPlSiyQk03PeZmq9bho+0jzhUD5o4a+LbSujiKNYP6fSDpxcnmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=K24fpWgY7ZMRhPbahnY0xbxyvCqVwgC3cNKisDoOYxhhOlOke/qiUM4UdV59zP74MWC/CzKAJbwJitH1QjLtI+tuXzMvS7+nyzCTZi/yxuuOdJ9WBbMYkg6toPYadwwJhZA/X6EYHpRStDrW+WC/heAF9+Es0vWC/3Ri2DcrhfNRUbtgUB0uwF+qE/F/LabKn51mdNUJZ0PnL/VDsLvc3fwbgnfxmml60SAe6OaCMQTJS0/5431ojPEIGbh0fKkCLnsMyDT4H6k5g0KklRisAAUM/m6AKfO1MvcHAePzyui2xgHsgTp6cfhBp4ml5IWzZF7nSiEdpkd47ic3PP2ZYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:40:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:40:31 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:36 +0800
Subject: [PATCH v3 01/14] dt-bindings: display: imx: Add i.MX8qxp/qm PRG
 binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-1-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ae2e0d-91f6-4f0a-1502-08ddff018f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWtyMWtoeG5seGRXTWI0Ny8wWUxVblc0a1QwWUkzbWRGVmNYajdVU2IyZzdG?=
 =?utf-8?B?YWU4WFVBbldmQ1Y4QThvYkFmVzdSczRNZjVWZ1EyT3VudjBuMEpjYUx3T0Jl?=
 =?utf-8?B?bmlEbzAzRFlvYjZobVB3RUFEMUg0N3FoMWprT3NkK2tBcDk0NXlyZ2F6QTRK?=
 =?utf-8?B?OXZ6a3llQkJ4YnVoZzBtRDZIL2k3N2pVa1BmRkE4WUFiRmJMeEUyMldtZCtx?=
 =?utf-8?B?cEY5M3YrU0gxd2MvS0hsZSt3aTYwOVV6WWhQS1NyTGJQMm03bkg1SlJkMVBH?=
 =?utf-8?B?Ly84TU1Fbkora1ZzM2U2WVRMeHF5czJTbVl2b0tnTDg2a01DNk9hbjdvVDZZ?=
 =?utf-8?B?Rm9yNmJFdTlOalAvL0xYRld1ZTFFcDNXZUZ4ajBVMVhDei9oQzhTNVJkcXY3?=
 =?utf-8?B?QzBwOGJtbHlmbXNrUkVxcUFSYmp4TjNFRytrTTFKSUZBNmFRSytnaDJZa0wz?=
 =?utf-8?B?QlprTW5oYVNEbFgxTlFqRkdIYTRmWjBFRUhnclBXby9EWXczek1IRjRNb01m?=
 =?utf-8?B?V3l2K3Yvdk92bHFZTkRVZkM4UkpLUGEwVWZqdk5Oa0laNmdmeDlZdWJwQmpq?=
 =?utf-8?B?bkJpR0gzbkx0V3liVW9kalp6WXVHcnkzVWhNeHd5UjZ2c0s3UXlRV2c1eVJJ?=
 =?utf-8?B?ejNDZEJPSFpoV2RsTjB4MGN1cG0vZHdpQjFsb2NrdjJFZ0Qyd3VFUjIwOFhO?=
 =?utf-8?B?ZFhUaWQ4RExMaWhWWXRwck5tVTZzczJvdnRhSmtBcjB0UWFWUUprTFovZ2c3?=
 =?utf-8?B?OVlXd1lJam9IVXU4Vjc2ekdFd0Z2T0RvOWF6YWUwK0IvMUFVRnlOVXJUNHBZ?=
 =?utf-8?B?eDRmOTVZQ1B1Z2NqdFpxaHl6aDhBYzFHRW9nY2JHOTlMc2hPM0YyTm1jblNU?=
 =?utf-8?B?VmlQWGp1elMzMURZak9Vci9UWk5UWFpUeE5rNy92MjE0ajNIR2wrcG5zNnlR?=
 =?utf-8?B?VVA5c0ZkVnRySVZOWVc0S3BhU2dPRzRyRmcvNk9IdlN1VE44YmQvL3NLSEd4?=
 =?utf-8?B?Z1RoSG9Ka0F0QjJxeFpuK2RRelJFU2dZRDdEUFR0SEJwd3NyMnNMRmE3dGxK?=
 =?utf-8?B?bFBRR3d6NWxndVVzdUxhV21tS0RpNkNaTjN5KzRNN0hvaDQydnVmckZIWENo?=
 =?utf-8?B?RENIQ2VwQU5nelFJb3ppejA0bFdGeWdrbHdrcHpYaXpzcFgzU3ZBRXJHcGRI?=
 =?utf-8?B?UXJGZnI4MGcvUUtGalFDS1l5c3JPUlptRkxpVjRDanZZdENEWFdmRDdQODRQ?=
 =?utf-8?B?UmNERkpoajRtNExpb2FLNVNJZUhGekZ2U01HUnpjUzVzZEZZOWpkUDduZkUx?=
 =?utf-8?B?OTVlZklFR3kyekxwUzFsSkhxbnVFNWpxWkoydVl4QkFQbDFmRklZVXhKTWEy?=
 =?utf-8?B?Qm03TU5EK1Ftc1BqeEZCL2F5R1Y1bnlySkovUlU0bEM1OUx2QlhEbWg3T01K?=
 =?utf-8?B?ZHBTalhsR3lpaWJVOTFDRXZ1dTR2TU13NjJxWWplS1g3MTBNSHo0UU9aSlJ6?=
 =?utf-8?B?NmhmWUVNWlFkVEtKS3ZqVS9RczN5c2tXVDdRYkpBQzZEcUVjeTJ2QUdYZFlx?=
 =?utf-8?B?c2U5YzZhN1Urc0Y3dnNMeFp3OTh3azhWZVJPVVlVZExqK1BxeXFzTWFzNFBT?=
 =?utf-8?B?SWdxUXJBaTJyUU9vaGtTczFUS0YzbzB1L1d1RUlRbzlXWm5ZUUFYcGxsY0pp?=
 =?utf-8?B?VngyWUp4dDFZWXp1eTdIemFuMnc5NHF1aVRjTEFESXd5biszS3hoUjNDOXhw?=
 =?utf-8?B?UGVCN0JKK3JKWklLeUg1eU9LakNpZkpHQ3pQNXIyTlNnQ29wZlpaY2pabHhS?=
 =?utf-8?B?WllqZmJHUk1pMVk1NkdkT1lzLzVOeXBaTkxQSnJVWExpVW1xMUt0VWIxTTFx?=
 =?utf-8?B?Sk9sMjh3SEh5RUNnaFJtaXVLdjM4T2NicHRRR05CV0tHRnk1VjIxRWFNbHpx?=
 =?utf-8?B?NW9Ya01VWmYzMkp5Z3V1a2tta1czSk54WWF6WFp1T0dUclRhOWpkREFONHpJ?=
 =?utf-8?Q?lQiHifzGbuSu8nPCr4XAsF7k1GfV2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXpOSTF5Zk44STA3RU9BNkhiTFFnRStyMHhCajlWUTRKcGJRNHVzQ29JS3Ux?=
 =?utf-8?B?djhDVDk1bnBiS1BIOHBoemRHZmJsa0lPRlNzaUU1WFhqaEtlWm1WYTBmV3Vw?=
 =?utf-8?B?Z0FkUGVLNFJUZTl0RkliYzRPZ0dVMEhkaWgxazZKR09SdzJySlNBRm1BSnNu?=
 =?utf-8?B?OHNMSmdDMmY2djVwNHVJUXg1SU84dGIxMzQ1ckRLT2dUNCtSaFhnbStLMjFX?=
 =?utf-8?B?Y0JURGRoSy95U096VFFGSUR0azJSRnpsSXlyYmVYalRNSzdhQjVLRUk5amla?=
 =?utf-8?B?YkhoWUxCTXZUQWJ4aEJiRDdHVW1adHY0NmVyWlNIWDlTSzhoMWhpTjlNNXVL?=
 =?utf-8?B?RE1URnlXZWlvVXU5MjdmMDZpeVViZUt1WDJzdG1hTi8xcHdCVmlCajlZekRi?=
 =?utf-8?B?YkJsSEhiL29sU1pKYk53RVdvME0ydHlPWEJtL2x2Y1ZGRHhSRmNNRm11SHZt?=
 =?utf-8?B?eUJCRDloWXR3WU9lQ0xpWmNXNW45RVlSU2E1ZU1yVzR1cG9iOW9YdSt3dkVz?=
 =?utf-8?B?U3QxOWlNZVRoQ2srNVFOeWwreGM2TWNnUzBGd0VuWWZaQmFLSzY4WWpORnFD?=
 =?utf-8?B?dkF5L1M5WVI5Ylg1RHlRZzRncVlyeUNjOUIwMTB3Qndkc0xhcmhJcklxZHEz?=
 =?utf-8?B?Mldsc0Zqd2NvWUlvQXVFZW0xZCt5YzcvMitXblhuZ005UExCWE9hdHZpOGQy?=
 =?utf-8?B?ZG5UcFlBOUJuSk5yOW9IR2NSOGloQndwSmZhUXlwSUlwOUQ3clA5Z1A4azlp?=
 =?utf-8?B?MVhZRTliQkJCM0hvbjRKMjhoajJNNXc1cm5lQ1ZRcy9OVlgyTHY2UEJvanBN?=
 =?utf-8?B?ajUwRTZqTDBIT2lhRHdTWXFwYVNodGxobnZOQVlJNG1QdnJ5c0R2ei9JU3Nq?=
 =?utf-8?B?UjRrVVdCWngzejN0TTJYenN4Ym4yMGFFdUF4dklJQU5MWGtwK0krTjNrejhq?=
 =?utf-8?B?VHNpNWFIUUZ0NUl2U0NzeWtnaXR6dWFzcGlJTHR3YzkvRTlIcU1PUlpKNEZL?=
 =?utf-8?B?MFlsVGRXWjlxTlhDaUxrQ0FoRnpRaVphaFNYVWw4eHpONjBkTlhpdlI1ZS9L?=
 =?utf-8?B?Q1lhdUFWNklpcGJYRXorQVU2TlRCQ1hqOXE3SWdiNnZBRVFCekN5YkdtSm5y?=
 =?utf-8?B?Ym1VTE9FZDNpM1M3SzVheGpseTc5Y0gvMEpBaEFLazI5WktrZmt4K015bnB0?=
 =?utf-8?B?b0R5MmRVZElDZWI1bUdMOTdwRXlrNDU1WlVIZWY4OTNoaUVwcGJPS3gvbFNy?=
 =?utf-8?B?R0VQcWhmSXphSmxtbUpMNGl0YTk3MEZJZ2s2MGJjYXJtbWFqUloyWmVVNU5h?=
 =?utf-8?B?VEFUZkRIZysrY1hCREFxaWNTYmN6dG9qelM0eVMvRzV5ZXRWRFh3QTMrYkNl?=
 =?utf-8?B?VVp5SGM0NWxQc1Nxa3BQT1JtNjAzUmdCMDVyNUlVVkUyYllMS2Y5WVlOeDdh?=
 =?utf-8?B?WWp0ZWo4Um9KU0dqeXZwTFhRUEdnVnJmM01uNVFjZ2VJQ2dhd3BqY1RKeUds?=
 =?utf-8?B?Nno3alk2VGJvUjUyc21jU3VyVGhMaURGTDlIVlFZczJYdjY0SXlmd1o1Ukxi?=
 =?utf-8?B?MHMwRmZwVE1yb2Y0Vmk1NmVoNGk0TXI4bFlNMUxVN3JGUytpTWRCamNoS3pB?=
 =?utf-8?B?K0hjOVhxYzRCTVNUSUYvcTNoQ0VqUE9ZRmo5WnR4VXFLV0xncklEUlprT3Rw?=
 =?utf-8?B?bDJ1WDRyOHBVUGxuRjc5Qm5TYVlHR1RwVEpGRW1NSVB3NndnQlBKUEEyUHJN?=
 =?utf-8?B?UVU3RnlTSGRsdTJWMFEzdjJHMW84dC9LQ3J2RDN5S0JhOEF3YVpLeS9iYmlU?=
 =?utf-8?B?QTRTNGx2ZXFERFd4VXVPQURRRXl4bnlsaFVnOWZjOVJPQ1J6VDZGR1JmOWVW?=
 =?utf-8?B?UlB3YityUU9ZWjhhalowaEZybW9NWGRFYXBmbVRtV1ZZZzBjK2gyalZIcGVY?=
 =?utf-8?B?aHF1Mk12eUJIWUNJYnBCMS9MN2ZCZElRK0RBSmVBbm5pZFR1NXB2UG5vanpK?=
 =?utf-8?B?SVowRkkzMG00ZFBZYXZFNE5PdDJZMUliS2N0THJvam9WRWVheVB0UE1hdTUz?=
 =?utf-8?B?aGkyTkJlV1BsemlLVzRUcmxJMGc4aG5jQkVqenRzL2Q5RVFCTStDRDRRd1lW?=
 =?utf-8?Q?90vklEJIaUcwmBa6zLGAeuso3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ae2e0d-91f6-4f0a-1502-08ddff018f1f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:40:31.9009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gcn1Aryu1HXQ+YUFxhRxu1RFiRRcl8StzIguaJ0NLruAziIL2wAzgqoO3p2nzyMSjd3xeg0OKOLtXEy5TAWgzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ff46e0d4e73488f8a3ed538830570b1ec71b50c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1

