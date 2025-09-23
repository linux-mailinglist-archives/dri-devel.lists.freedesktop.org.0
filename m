Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51084B93F1E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF510E52F;
	Tue, 23 Sep 2025 02:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Swxm1JnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACFC10E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbWG/m9zddBYNqcTB8ONerEjOjMCFz8G7ZmzKk3WCXxUI6Z5spPrCfrrI/AXARcT8xQkTt6Ry+FIcavB+tQspto3DQTCSa+gnIpSUWZJofh+7slqkUagZK6guhyuNcyb1t1QJnOdLSddCh4wNbWaeWT60Msb9TQuUm6WKtS5eRG7VydXR/afoAZTuJYff5T5BA5/NbfHgZq4tZQ0f0HI1kDLoBoo7soVVQRMLPrl/ac2hEVclzdiag16wfzPS4268c8kv7gBLvtEnpFk2y2WMl+l5+adDTidoXtvpG5yvdswBhmcy2Kwnr3R9WjOeaEdQ2KF9TfmPoWEArM6r1y0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P3HmKfxpwnxvDGNu7Y7RD24cUPCPC5dmHEZMnYHxfo=;
 b=UIEBcQw7poOPjTpWfZLIdQjEBxTl9XIV5cd/+loCVvWmGXtKi0AFHinRYGC0gjVvOX4rggS8psiDnGazqqsc+kP0mHSptfql3bTED+yM6gAH9nFY4p5Te2dh+Hfg6BQ8DZUxGgj5AeHeAUzwdQyIUh4ov67VlqlHs9jz/MN+wyDAGc5bBU3UT1BkWYTLe7N0pYsEwjbHstgMxVAJQBBJu1jPgKRSanN+f3t3fV6SAkeONn6zt2TG3rw/A96LCA55yYQe08GLn9TVEHDfx/cITdCRNTSLWmZz+Qh0WQhOjGL/JUgNH1djfNr/wNf8YJCS8MBElox774SpQ2vfxTThrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P3HmKfxpwnxvDGNu7Y7RD24cUPCPC5dmHEZMnYHxfo=;
 b=Swxm1JnRj3m9pW29IIlXLB33lnJHRVPu5HhiWRuVQsJ09OM7kjgSVhBeXsxRVaaT7HEkbE1yt31gxlLJBMK2wWfYmxleen6ANwZrnZdi8JF2A2dEQawZeJjtWiRIlA4JAhCxvdRkc1kDORDW6DYUnevaJShCqRWWEMGSmBRHn0xO/Mi9Zny3Pj8uJ6WZCTaRMkbz0UAkF8A3ZANeZkAQyRtFWFSOGWyKQT6qFG1+fXotkSlGEldAcsZXa9+zJNP5QPl2vz0H+Ym1W35O1CVJI39BKuAWYcjb3y29LycjwyFi2PGvrTdfSinTIg5q3BDTwyv6MA0FPIQWl+XxJGCYVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:55 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:08:02 +0800
Subject: [PATCH v2 12/14] drm/imx: dc-lb: Drop initial primary and
 secondary input selections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-12-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
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
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f255a0-2d4c-4542-d0ac-08ddfa4602bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmhMait1Q3F6WVBTMVZKeEpNcGhCUjdFTUs0a08zRENBN0RWRnZpZTRQdkF3?=
 =?utf-8?B?SzFNSVBLS2lsczZhSjFLUjJObXFmN0NzN2RkRnN2NUt4VTYrT1VCYkRjN0xo?=
 =?utf-8?B?aGd1aVN4YXdJb3dYaHpBb3FWSlhHdHYzMjZuaU1mVW5reWhMV2FjSW1EZnlW?=
 =?utf-8?B?NFZ6NnNaMGJGb01hUWtzeGJYNFpycnQrMHJhOEMxd0gwS1NQWnUzckpVRWVs?=
 =?utf-8?B?cjZaVmRTRzRDTnNRejF3NkdZcERocVlHOVhEUDRVbmlid3h6ekJDek1BcVJM?=
 =?utf-8?B?Z0UvbzhDa1FTVjRBOWp2WmZjV2syOTNhS0NzQVdQRGRTNTE2N3RVRzZVZTRF?=
 =?utf-8?B?dkYwNzVST3hibWlKZ3R6T05qVnRiTHNNY3NoTGY1VDNwL0R6YXRqZWJLR0Zi?=
 =?utf-8?B?bS9QT0VzYWovcm56WExpTnhJVXYwZ1NqVU1vQnJ6TmpwakNtYzZxV3FjU0FL?=
 =?utf-8?B?TXJ3dGFyM2JxODhrRWpzR1JPdmVJWStMTy9wbGMvWTV3Rk1FZzZWVEZRdVJO?=
 =?utf-8?B?ZUFDQ1F1Q3Vielk2cTA3bWZUV1RnOUVYRzdqMDVORzNkWUdyRTFvZ3BhbEZv?=
 =?utf-8?B?bTl3eEM5dnAvaFFQdzltd1FNcjJGeS9IcmdKenNIR1ZtV1RpaVlsM0NwYTQ2?=
 =?utf-8?B?SUZ1R3NUNlU0aCtvZkNTVHJxMGlJSG5aUHFPK24wVVdHemlNUlNIVGNHalhv?=
 =?utf-8?B?TUYrYXA5ZFZQcVhrYWhleGp3ZEVoaThiZlNhNldNZmVxamppK0lqOFA2VjZT?=
 =?utf-8?B?cGswQ0h1bEozZG05cno2ME5QOWRocnJROE53QjNQdUxrUzNGOHhCYXpOUzhG?=
 =?utf-8?B?Nk5wUWEvMjZVclBXQnRGdUpCZjB2bGUrWVd6UHJhdDR6MjNua0tNaW9rOFR5?=
 =?utf-8?B?SnUxd2s2UFNYcEJPcnB2eTZBVHo3Z1F2ZTdCbUV2Vm1pNytmUVU4bHVVZXJM?=
 =?utf-8?B?NERLSWRGbFE2c3pvUDlXUnYzenlMZkNRYjd3Y1NNU1RPRng3S0s2b3RtUlVP?=
 =?utf-8?B?bXlCNnArSDBHQklNaFp1ZTYvbmZvWndEWk05c3FkTk51WmQyY1VQZklvMy9F?=
 =?utf-8?B?T2VqQ0xCT3piVkdicWxneFJpZUQ3SnNEOW9HeWc5dnNURTZWZWR2V3YzMU9i?=
 =?utf-8?B?eTgraEJVTTgwM2NPS0FiWm5GMkVFOVY2bEZLR2luR0x4RVZMT1QxempjVUpD?=
 =?utf-8?B?dFpBbkx5UFpraXNPMG9WU094U21WcUhMREM3ckFSTmVqbjlYT0ZIeVVXTmp0?=
 =?utf-8?B?VkFwdSt6a1QvblAyM25BWFl0YkZUTTBaWEUwQU44Q0V3dUFrZHVQZVdSYWho?=
 =?utf-8?B?TWZUTUI4Rjl2ejZuamtEMmRNUTdrMGxLYWRORTg0QTlHc0pFT3c2dDVPK2dC?=
 =?utf-8?B?SXdLYm1JKzJWNlVNWWFoY2R2THZHYjhnbDdOYnR6RnJmT3pPM0dDdHhad3BC?=
 =?utf-8?B?YU1pUW1SN0NMd3k4TFhjaGpad256N3g1VS82b1pVaHZVVXNPbysvbjhmL1NM?=
 =?utf-8?B?anJjM1U2QlZTY2ZzZHhUYzBtQlFobUVuelFDamlNVHlyaXNDMDJlTlBWNk9p?=
 =?utf-8?B?RjVLU0dIS2JBMy9OMmVOZUpKWHRrQ09RZVFFSFFsb0lWVVVVSFYva3Arb0tQ?=
 =?utf-8?B?WEk4SnFEUUw1azdwblRhSDl5WlZMSEZrdE0wT0kvZ2hxSmFGWWkxbGRFWXhB?=
 =?utf-8?B?c2xmSThQaGNFTE5MSXR5ZGZDeGFPclhCNTJ1Qmd6dWFvNnREYm40RWFCVmpt?=
 =?utf-8?B?ZEFlaXNUeHpzV2JnT29Wa2E3T3ZYMUlGWDNHa0RRcURRY0p6SG4vcFliWjNv?=
 =?utf-8?B?c0ZqQ3p0WmJQa0p3bm5aR2JvcnJjZURHcTRoVDFwcUt3NTFJUjF1R2s3cTh4?=
 =?utf-8?B?YWpMZzZLZXVacXBrZ0UySGtOT2xtMS9ySS8yYWdLOEJmV2oyNjhSandTanNQ?=
 =?utf-8?B?b3d2TjBDSU9xeStVSC9BYVdYUFgyeXBNb2kyVjBoS2xFWjhqWnYxcy9MUmp2?=
 =?utf-8?Q?WbAdShMd/wTa4+ngbRPjl2novwS060=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHpLZkF3T0V6Q0xQY3NLZ0ZkMkJMOGpQRGRvS2Q2bXpkZ2tqZUd5cnc4bGdT?=
 =?utf-8?B?czJNbmx3QnZWWG53Zmk4bjZ4Z2U1MGZPeXVLYk9JVWVMMjNqS2Z4SkQ4RWhl?=
 =?utf-8?B?MHMrbDBrSXV2M0J5NC9EWlQ0c2d4TjVJMHdVR3lscFhnajR6NG5XanpIYitV?=
 =?utf-8?B?Vk5ld2xzSFB5dHBrbUd4MExlcmJ0dmNKZDF1dDJxMDZmTFh4OWk0M3o5VFVI?=
 =?utf-8?B?OEV5eU5tL3RjcDZLTm1JeTZEbnR1QXlDdnJ5bFNTMFBFRWJGZGd1Rk1RamxJ?=
 =?utf-8?B?Q2xkR1dCb0VnMElaTUN5QTROb2ZoL0c0SEpBVDNTaGpWd2FoQ2NXOCtNc2xr?=
 =?utf-8?B?allzM3hpMmZObGw4UGkyRkZtc0tiY0lEeGxsUENRbVFOQ1c4RVlrQ2h4enVU?=
 =?utf-8?B?ZlA0b2RId1pzVG9wVFA5RUM5RFN1NjVRV2V4VkRkaDFmVzlPaGxvR0xtcGhj?=
 =?utf-8?B?U21kbmJDdjc2ZTNvdEg2YjFiSVNsd2htc2xxOUZqRkhzYmw3dWtsNGh1YUR1?=
 =?utf-8?B?bjMwZUN1RGllUzRNdkN5NlZKY2ZtQzcvY2NGa1ZacHA1RlIxdFFNYUtISDZJ?=
 =?utf-8?B?Z1p6RTVmSi8zSzB1WE4wbmMvNjVxMVZ2S0QwelRxditqYldLTFlFODlWc24w?=
 =?utf-8?B?NUJxajR0RnlUcC9vUXdUbmI4SVVNYlVBVUl3Q1d1dnNjSmtDMm04MzRIYm1r?=
 =?utf-8?B?cW4rRithZmhYY3BmTlBrSUFUM2N5MVlVekZId1VZS1paUDR2NmtrT0RoMUd4?=
 =?utf-8?B?Y01YSFBxK0xCTEVYK3FSNmtUemdadmlQNHdJY2txN1h5c3duUkxvaHBJSWt6?=
 =?utf-8?B?SkUvVXBGdnYwYTZqNU8vNlhKd3A1WE9ZZE40R3MwQkF0WVIzeFU3cXNiTDFr?=
 =?utf-8?B?MjVsS0pHZU5qN2cwTzRCSnBKS0NDeFpJK0N5alF0RFo4cWh1MXZzZTdBRldi?=
 =?utf-8?B?RG1rTzFTOVorL2F3NkowdkxyM1Y3K3hwVWxpRWdOazJuV2dsVGMxclprZVps?=
 =?utf-8?B?NlBjUzd6SDMvajIvY3lEUENkTVZzc3Y2aXlDYlNtaFJQMzNaVWlpUWhBaUVI?=
 =?utf-8?B?eUFSQnFVRDl6QlZwbmdoUU5CanlOQlVia2s5YnNHUGRaTjVMbXZzbnd0VVhE?=
 =?utf-8?B?ZWgyKzVJck81elFiR1FucStsSkYrRWFjM1IvT2wwRXo2eDY5aVRoeXJPMjJK?=
 =?utf-8?B?S1BENWdWT2hWTXBuL0xrT1RuemZMcGYxcWhMQldGUnJXUnRncU9WM1ZpRFQ5?=
 =?utf-8?B?eWVPZUorakh3Q0xKS1R3dFZmZnVhYnZCanovcS90K3pnbDJ0emVnNWhMRU1h?=
 =?utf-8?B?aGNvVGZENGFYRVRUZ1IyYmpJTHZXUUVvZ011MXNwQkhYVUlFOC9MSWVBamNw?=
 =?utf-8?B?bklscVFCYW4rSmp1K0h1NWExRW9Ualkydyt0cUJOY3lpQ0xMbFVjbVBvd05q?=
 =?utf-8?B?eHNsRlowRmE2QVRCMFhvUjhXS0luNHpmSHhrMko4UDU5UkFCQUx1TjRGbWxk?=
 =?utf-8?B?aTNicTM0Myt1eThZU1Z5dTF3dnRtKzFBUkV6TTllSTNraklZSDNmZWdFUGls?=
 =?utf-8?B?bXZQaURjaDExYWc4b3NRVFVib2NscXZvMDltNW1lTEU5Y0thcTRpS09HaVo0?=
 =?utf-8?B?NlQ5ZjU3NXhMdjJPcUlKMkM5bVdMNmh6WTdvOWdzRXVBVWdZMWlCV3ZhSnB3?=
 =?utf-8?B?Q3hzdytzYVhqRHhEbVk4Y0YrN0cxbHJYKzMzR3cycmhITi9KcUZ3Q0UwYlZ4?=
 =?utf-8?B?SDd5dGRFekdyVDNJOXQzZ1p2QjhaWnFZM09qeERMT0tLZ3dJdmZNNzF6Ryt6?=
 =?utf-8?B?amN4ZjRYTWNBT0wrQ2FQSERiNThFOUEzeHMzVGdlSmVTQlNRRW1nZE9aRXg5?=
 =?utf-8?B?dGNZeDAxUUx5R0JqbnZzaWRMWXNnTWtJUGFMbkIxVEhTcDEwUmJUajd3QkJX?=
 =?utf-8?B?aDltWHNSTlBNVkV2anBNRkdoR3dMeDBvb0NERDJXS256cWdWM0lqbGd4WnZm?=
 =?utf-8?B?V1NrRzZKQkQxaEVDVFQ4K3hjVnVVaGZiZWhIT3JackZKUnRkbkU0Ykh4WE9w?=
 =?utf-8?B?ak54VWgzdldVaXZXWndTMjVXalRuREhNUUtsMFozUGJGWFNUdTR3TW5Nenov?=
 =?utf-8?Q?+NXGyDjpORz0JvsK5UWSluW1P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f255a0-2d4c-4542-d0ac-08ddfa4602bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:55.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSh+aYDf+F0Yr8/GCrd1D0oj9OLRFf4nhYZ9vSxWNwbeDjUI2e4aGxSWLoV8fKCJO7nt7+tIhFOILj1n/BKXYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

It's unnecessary to set initial primary and secondary input selections
because KMS driver would do that when doing atomic commits.  Drop the
selections.  This is needed as a preparation for reading LayerBlend
secondary input selection when trying to disable CRTC at boot in an
upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index b0f3fb818799b58597e8ae41d868338c3fd40800..d0a805469ae79d467c7e71ebf75e1befb80e15f3 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -254,8 +254,6 @@ int dc_lb_get_id(struct dc_lb *lb)
 
 void dc_lb_init(struct dc_lb *lb)
 {
-	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
-	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
 	dc_lb_pec_clken(lb, CLKEN_DISABLE);
 	dc_lb_shdldsel(lb, BOTH);
 	dc_lb_shdtoksel(lb, BOTH);

-- 
2.34.1

