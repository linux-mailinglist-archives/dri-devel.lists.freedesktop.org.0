Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C4B29689
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 04:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5710E331;
	Mon, 18 Aug 2025 02:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hCeCz4t4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F68210E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qs5zLnGUb1Y42ujZm79Olg+5vqMxPgHcgoQGo31au69rERKbXadweZVInjVmlw5vPcD12KwNpxb4/zUMSsAqDdGfykrSSjL9ezVrx0aW4VJ42gZs1ny0knPakZ9f7BLIqjDaUaJtYJ9NJtG2swqIuMqyJcMg/ahtjOg+5J6Bz37M5BguIago5lZIP3IXKxp20H0MQiXb8GmSy7NKDLikZb3DWPPB1vjNGXoPMIoKEthma1QDpI0juoNzFKy9oZfByo4dFf9/wzZEzVHR8jVTnMG2SHDYKnohL03VlOgJwvPva67I4IkpBYeIf/t5ig+sqDabujPCWTYwkl8/B0hzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OTUoQBXlLsINuLRLU8VhPBK9NrrtiyATUM7ScVea6g=;
 b=g1IV/qXQGaotQjKX0zC6o4IsTjahRavpK22/v81oHDxUkYSuEZULxwloDCEBn5dGMZPYSSzmiTfldlA9mE8hBCta0rhyZfvDgEXLLKqUqOC9L0atqg266srucHxVjXzTTtwUfqGMgFgrFZP/yhL9UMl1FEjhlbKrtqCRKH72VMckEmp3xoGlYhPygBco71qhQX2wJ0MqVgmFlV9p0eNgh9gsY0Fq+sXhMyd/ZHJQKnwOp4LeQuSJC+f6tFEHE/xINgQ2cTmTl/BrqXgF2PldOGeTyrL0q9L8oacA1D1+R/AzILpTQMll1gcWmdEeqyCt2zEaPQfCmHTjaxRIAOt5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OTUoQBXlLsINuLRLU8VhPBK9NrrtiyATUM7ScVea6g=;
 b=hCeCz4t4eo/tJQ6vNuAguX3RwJtxEdA1DCGC9QRjVCbOXpu66rTMz2hxs48BoXcc3rtndm4eWxIG7mc64erWIeWvE5/OlpYiffssSIaufkg1rn0aA3Opc0lQDQlPSTWqOrXtZJnq+e39grH2EtuqShWBcYUlLSSsNhdEKZDYjWThXqucfXuZngTo+yKuwTRscFe9EwxiMT7zCLrJmS+UwpSb+yWvdHeUMoDEZDgJFyr91ey1j0C5zUTcz7Nr972Fcv2+jF8X+Y5VrMWkRSr+y3z8T6lmikZ2t00PNQYlgatuMNx4ipitjql4rq0V+k+GuP+UZcTFnf7fnY1ZYEdhKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10530.eurprd04.prod.outlook.com (2603:10a6:10:55a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 02:01:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 02:01:57 +0000
Message-ID: <980a990e-ff7e-4de3-b40e-2a28b769cc73@nxp.com>
Date: Mon, 18 Aug 2025 10:03:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] drm: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-5-wsa+renesas@sang-engineering.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250813161517.4746-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10530:EE_
X-MS-Office365-Filtering-Correlation-Id: d85a219f-5f77-4e1a-2fd6-08ddddfb35eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWdjaGw2STRIR096NEVveENvVmpUQ3d6NWYrZVVjTFk3MENVOVI1WjNvMjQ0?=
 =?utf-8?B?Qk5Qa3pWRWFNVC9GbDMwZmpFT0xENi83NHVxUHZDRTg1ZFZaMFo5R1JscDBU?=
 =?utf-8?B?RTdueDNZY1BhaE1sbXltY3R6N21seVNlWkU1MGFGaE9VVy92SmpFQWhRUVZC?=
 =?utf-8?B?QjBQbS9MUTEzVnNvU0Z5UUZZNUp1RzgyVTV3a29pYzZIYW13aXFlYi9CcklE?=
 =?utf-8?B?WEFsZ29LcHJVWWJETzA0VjByRUdiVmllNUJBTEJ4bWV2NzcvZmZhV1dsUzBH?=
 =?utf-8?B?MTNxTFJNdkpvTUZTc2NxYUZaMnVRKzhFSFd1ZlB4Zys1YW4xNGtvSkMyZDUy?=
 =?utf-8?B?WXN3emppYjA1Umh1SEkyTWRLUXAwVGZhcllkTzdoSnpiYWVlMjdnOE1XMzJP?=
 =?utf-8?B?czNMRmkwTE9uTlN0NjIzZ3BtRFZTSUVvemZLbVZXMWV2WDJzYnBrWE5Jb01s?=
 =?utf-8?B?YVhlZWYwTjNESkg4RXltZmM5UzVDZGJNY2JaY0ZKa1M0YVpDc1BZVUd4VC9R?=
 =?utf-8?B?TkpFM2dxaElKMG5udVlQMDlXcWdVZUU3RnM3MTI2Vnh2R3VPRVlQQzNOOUZK?=
 =?utf-8?B?K3ExTy9wV2I5dFNwVXBDTHM4bEdrNFBvV3FzbFdLdGk2U0hXWFBOUjU1Rm5l?=
 =?utf-8?B?aGhyQXpranczb3BDZFVzTlQwd3V6b0hJTHVXeTFpVWhubjdBaUNFNTZvbTg3?=
 =?utf-8?B?QkZIdzVMSnhZRE80bE5sT3E5S0cxakhRMWtsZkxaaTEwYTZiNm10SzdWcXBK?=
 =?utf-8?B?Qkp2MWI1RWNkVjFaVCtWcmpYazRmbTlxWmVpYmxqd0M1K2t4S3pySkxPMjZH?=
 =?utf-8?B?N1pNSUI5YkU1VkFMNHlkUTJmK21lc0hNbUxBV0hycWVMUWhFTnJPYjJuZVNK?=
 =?utf-8?B?RVk4NHNneTVjL3N4Y2pFSFgwM3JReGYwTmF1dGVISFdKUHV0NnBqYjJ1SHdV?=
 =?utf-8?B?L2pOZmREOHVQWVRwN2JNcnQ1S2tyQ09qKzlWL2Q2R3Z4cC9iRHJibHQ4QVdp?=
 =?utf-8?B?cEplSU84K0hQRHludmE0VHpVRm9CR0wzOU5aMEwyTWY5RVZ3SkkzV0lxcGxs?=
 =?utf-8?B?OWMzOXEySDk0U2EraXhZL2VEUlpFR0ZLdEdGWkQ5VUZnMFE4WEVaNXRnRVhv?=
 =?utf-8?B?Ky9LMm9qeW41aFEwZzlTMU4zbEVheGE3WUVGaUZqcVcvdGtDQXZWdEVpeDFk?=
 =?utf-8?B?UmdoY21LbDFxR05COHgyM09RSXZuYVpRZ2FNUWE1ZVBVSE5DYzllaXFKZXhM?=
 =?utf-8?B?SGtud3h5ZFdpSFNJZzVxU1VSM0ZqM0xGVmNDU2krYnJSWk9PWkpEQWNlM28y?=
 =?utf-8?B?bEVsRkFISVY4Z0xvN2Q1djB4Sm5pY1JxR09sYzBHQUlkdVJvcXV6K0Z2VGhR?=
 =?utf-8?B?VC9VdkJiWFpocFhjUlZROFl3NEJ3SWNQaFdSUThxWVQxZEFvZTF3L1cwMTh2?=
 =?utf-8?B?Y0pOV3Q0ME5FWkZJcy9SdFZuTzJDOVJha1BncXA4N1FUN3lpYllkNm0wRlU5?=
 =?utf-8?B?ZFJQL2VMZkZZdDhXSXdJcVNnbUdFakxpZXRqSGc5Z1F1RitvNmpWM1Z1MjZs?=
 =?utf-8?B?cEw5Q3h2ZDRldkhGbElWQ2kxZlA2cmplM3lndWtINHNXU0tBTWIxTDJiKzdL?=
 =?utf-8?B?ODRlbEVmcHl2NG9HZmdua2diWjJoTnZ6V2xIZWxVTGhhcEZIWUQwMEZsRXNR?=
 =?utf-8?B?bStlcitPazllWkhKMEdhVlBnWTZEdEJuN3UrZ1YzMWtBOCtkNkRYQ2poeko2?=
 =?utf-8?B?ZC9iUGRKSFAySGEvOWtsOUtUWkg1MmtBcXJCem9IWjdWYWt3OEMyS2NmYnhI?=
 =?utf-8?B?KzFXYk5JSlhoSXZEcE0zVzJUNzAzc2dsU0k4RlZFYllDTkV4aytqUXlMMTRY?=
 =?utf-8?B?eXhYQzRtY1FSN2VjbkxyRFQ5ekg4eHpVRFN2ZTBMWis0Z1dPRld5b1F2NGty?=
 =?utf-8?Q?EaO9f7EOyKQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1F3R3NWUU5xZ051Qm9mR0orbDhEaEQ1djBaM29iUEFIejNFazRacmoyQ0FQ?=
 =?utf-8?B?RU1BNm1rRmlkUmhhOEY3WXAzNm56UGFBd2VZME03SXIybW01a1JlSGVuV2M2?=
 =?utf-8?B?aGJhZ0NNRVJYNUwrZmthY3lBWVNhU1M0ZER1WjJSR3lmbFRWTkJGZSs4T2g5?=
 =?utf-8?B?RzRjZlFFdFkzSHlVQlpjRlRleUxhMGgzTHVtb2dJa2cvMXQ1Njhzd1FidHdh?=
 =?utf-8?B?N2hSYlAvOERWaUZaSWtJbzNPZG50cEpFT1lSM0xVdzBqeTNRZ21DdFNacVRM?=
 =?utf-8?B?WndRRzBVV2xsMHhCcUxGeWFmdldlT1FpSWlZT1pOeGhDK0FmdWd3dG45RE5y?=
 =?utf-8?B?S3dicWxBVS9VSit2ai9MaWQwQjdYY2NTWVllU3lMb0hacUFPMDVVeXVNL2xs?=
 =?utf-8?B?anhlMXJVVVBjdDNOMlpQYWF0M1RlOE95YUY5S3Yydkl2eUpqeWdnS3lWOWw1?=
 =?utf-8?B?SHBHcUR2UTJiZDR2M3ZMS2QrRjZ4KzlpSC9RZzV3R3hpbmNrR0RjMjZCelZ3?=
 =?utf-8?B?MDVTemVlQTU3RlNJZ3MzOG1CWmptdkdILzUwcm5weHVhVDJvbjljZUpCekdp?=
 =?utf-8?B?WHpKMVppOWJHaUZWNng5enA0d1l5MllpU3RCUUJvcFlHbnJoVXh4a08rQW1O?=
 =?utf-8?B?LzVGUmNEcW9mV3Jrb25YaFJ1TDZ2VGVjOG9SYmcvZEx6cFpBV2J4dG9UM21o?=
 =?utf-8?B?L2NkbTd1QVR1QXBaSlhwMDlBbFdMUkhiNkdrekNHdnFMVVh0NEI3NVpKUUFn?=
 =?utf-8?B?OUlNdTdnanpWZlEwMnM2SFBoZ0pRZWVtTXhRWktMS2RoZ0lEbElhaUo3THdF?=
 =?utf-8?B?WXQ1QWIyeVREbkZJa0kyYTFJc0lJakNkRFdVRXRWRkxFYmdVN09SMDB3cVMz?=
 =?utf-8?B?bEFWSDlORm5iSzN0YTR0ZUI5dERhYmRHTDdCYVVXdkt0ZnVEaTdQY3VBYWhM?=
 =?utf-8?B?VUFtcEtYNXBwSTZFWWJvWTlYdFdndHk1N0l6T2F0WVlMb2k1eml5NVp1Wi80?=
 =?utf-8?B?TmRhZ28za2Z5K3YvTnZXaFpkN1lPMStGbFppZUVhSGV0a3ZQVm03SlBGT29T?=
 =?utf-8?B?NFVjeXdxWXFka0xLZDVhZzVUTVkrVFJFTXVpczkvdVN2bThaZXJYcnZibGZ4?=
 =?utf-8?B?bXNNMnJGSnk0bWpKWERDRGlZemNHTmhaMHdTMFY4WGZWd01Ua1FNVHlNOGpX?=
 =?utf-8?B?L1p1Z0N0ZnM3eUxnYnd6Y1cyc3htNCtuNnVTU1libnpmNVpjeENXaWNpSFA4?=
 =?utf-8?B?TDFXeFpkNEM2Wmlzc2xvR1VqK3ZwMkVXUnJCVVg1YkpvMnVGTng3dUtKWVpq?=
 =?utf-8?B?d1VBMHU2d0xyZHdxL2VKV1J3SnZSajFHRXg4a1BFclJuT2IwcmRwNlZ1c01l?=
 =?utf-8?B?VERjcEVpTzR6NzJ6ekNPYUJaQjcwYm5ISjZMSXAvMGVLZkRBS0tSMXhPL3JD?=
 =?utf-8?B?ci9iNzU3RTNhaENwKzhMUHpvN0RpSGhoRCs1eDJlUUhlMUw2ZjlmcXFOSVl0?=
 =?utf-8?B?UWtQY1R5bHh3SldHN2kyYllHTWNYLytGcmF5bmJjcDlrM3VCUFJzRFBtYkVS?=
 =?utf-8?B?WjlYNVErQ0tlSVg1MXZ0eEZSaFpNa21QbDBhOEFtbTdNMU5hQjdkN2VZQXJo?=
 =?utf-8?B?UFBIeDBTZXBsRlBSSHEwcUpnUTM0dkM5Q05odTZHdVlGd3ZnWDUwYUp6QXdD?=
 =?utf-8?B?NGpKc08rR0JtdDA1VlloYnBQRVVjbVJ0RS9vU0VaUlFYa3BkMmF0MjF4U2ZS?=
 =?utf-8?B?V1VZU0FxQy90eGxJK0tVOEVIaW1ERUwzY204QWNIWXI4SnQxZW41VXpLU1FZ?=
 =?utf-8?B?RW1tNjYwTG1JdGsycGtMMnlXUUZFZmdJdFluV1NDL3lrNUkrWXFpczlJUHA1?=
 =?utf-8?B?bE4xTGorZVNRYVBiMEJqZzdFL3Njdjd6NzlCQ21La2lvVS9SdW5ZQjM4aDQy?=
 =?utf-8?B?aXU5ZnFqaDVMVUljYkZibExOSngvT2F5WG1GcnNySHZLaUllSHBjNnlpeXU1?=
 =?utf-8?B?L2V6aXBMZDZSeUNWMStxamlsQm8zZnJlRWlUZEpkRGtXN0FnYnRzdUpWN0Ev?=
 =?utf-8?B?MVJpU2ZVclVhekZMVExreDZBZ1ZqRkY5TnRlbk0rZVZQdUJPVHNBWmdadnky?=
 =?utf-8?Q?3GXIU5jEqS2aHKh7Z/AudQdu+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85a219f-5f77-4e1a-2fd6-08ddddfb35eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 02:01:56.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HreyWUyxPln4nE1rkoPDfpOS2PsFO+2QmV613OKvTyXJSSIuA0h8wHAdATc71je1vCPbsr3eT4mfh/ZAqFaE2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10530
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

On 08/13/2025, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 1 -
>  drivers/gpu/drm/imx/dc/dc-cf.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-de.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-ed.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-fg.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-fl.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-fw.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-ic.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-lb.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-tc.c                   | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c              | 2 --
>  drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
>  12 files changed, 16 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com> # drivers/gpu/drm/imx/dc
