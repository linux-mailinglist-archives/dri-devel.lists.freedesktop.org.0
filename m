Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHF5DszWemnm+wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 04:41:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B8AB798
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 04:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC0210E1DD;
	Thu, 29 Jan 2026 03:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fsNTIjzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011026.outbound.protection.outlook.com
 [40.107.130.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5257210E1DD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 03:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abG0DlGpYTUGu3Uh/yFA95qw6YE78Jf2gf0ZWUUYKB3pFIDH8z0AMX1FwMU940c7u1KJE3NiAuCkbbp+z9AQfrYTCLq1xtLEft4NxJQ1NYRK7OlZbR7LeZ1SIrfVxgjUqltKy869vYcTl+BRJFYIxk/WXPsgZHppePuVlu0hUGoqUrH4gZa3WWKzBlPFT0OeiD2RJ/IdRZ7DUxbU+UyQhNGuBlLPyiuWww39rwstyfN6SfOqesuG97b45OxMBVGqnk24jXp47TnC+fsxWy731kMfkR3JyG2hMMLcmtFfm40jVFg14ZJJNl759qe/e11Tr0aZ9UW1KrTg/tydvYjFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaOIbCp7OBa7wDckQiWnowfBijLw+l1qoWobOfbpoXk=;
 b=PhhFEv999xoUtJ6iABXKijw2XBNfzYUMlvDJOKcVigBZ5AC6ljrYBHFNew75gRw16bM56tNeTGyPHUwSYZowzugApScgAW0XcvdpoJfx3X6o4JauufANdsj/OZkLhBCrSZwwTboyuncR/G/0ImLxncxSH3yw5VwOknEvG8PCcmysINNNDCeoOrT35ANsUp4WfAY3122fttrsmi3c+hFczahNd2hT5OPjLylsrdipGMerGFK8B9RPA/5De/LA+yYWlUcdIZrHnUo0g0t1RD3Ih2atfdk/8/6oVGwp0Rj1pNL2zoVXVkERk6eyHk9ivh97CaOCuJm3flllmz0KgL3aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaOIbCp7OBa7wDckQiWnowfBijLw+l1qoWobOfbpoXk=;
 b=fsNTIjzfoKKvoqUce11/QgI2U3RIYE75dP/qigbkQYDIMFylseZYTqh+g5eq9uYruerJvdw/z9yWR5wjvWksoh7kvbglz8pN+jBvK/p5XosHYRpz51sI/T5k1Iie9FF/PUQKCNO1KOECChgf+BpMe16/xXfGct68S/+/DX0GwyyWxZs3zVIVk9PRypBYBagr0bR60LNZy1CH726ZwgRyePJgl7cZ7wY+WJkDXcWDUcKloIF4/0B++DouuDl3SmXKtQQSAuUVQRkSaNmiH2+6zYNIzc4zj2Xr1LT5/IZ0XhaA+hqXXWBSui5djfRzFmRmzqFPYVHJsuuaGB/XDegB6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 03:40:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 03:40:50 +0000
Message-ID: <93da6166-79c2-4f26-b69c-8fe62f4698da@nxp.com>
Date: Thu, 29 Jan 2026 11:41:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
 <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
 <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:4:7c::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 38292f94-f92c-4a2e-2289-08de5ee8321f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXIyREhVRkwyV1NUTU54dHFmamZKeStncWllbmFZSGxOSWVWWE1HalRKek9I?=
 =?utf-8?B?UTZlRy9SQVRlLzBqSzFpVW84emlGZGNoaThNTG9KR1RzMlc3SVJXekphdE5v?=
 =?utf-8?B?ZTR0UTl4ZFJVWnZjSjB2YjM1M014UEhnNGt0UlQ5Zm1vVEJWd1hOamZDSmNH?=
 =?utf-8?B?em5uOHN4Y3UrRmRHbFFhQXJNbkRZUUhMZGxqVUphUGtFdlNNamxmRFFRZjg5?=
 =?utf-8?B?L3RBTWxYaW93ZWloM3Avczc5OGxqQzRXUldGVXppWmVKeUdIelFRZ0Y0dGhE?=
 =?utf-8?B?YmhYb2REUFF0ays5M0ZvUWtFYzJKSDhSVWFtSHo4RHo5dWlVc1BRSkJBK0pP?=
 =?utf-8?B?amdJSjdzbDhKUjd0a0NtTVUxNHAwbGFrcTBxVkJjV1FDd3NEOWU3WndPMStP?=
 =?utf-8?B?SUlFalBIQ0tPOUtDNnN3MkdkSzV5QUx3amJkRGdKUWtKQnlHMDNod0tJWjEx?=
 =?utf-8?B?dlJ3d0IreCtrTzQvNVphLzFONnlpU1ZNbWtEc09RWmVzWkJCL2M2MEx6cXhO?=
 =?utf-8?B?SEdyTTFKNE0vWkd3dU1uQTd1eTlpZ2p4VVB5R3BnVnRMUFRvcGR3MzVySHV3?=
 =?utf-8?B?ZUhIVFZUZ3g1YzhnQ2J4NEdtRGtrc3hzV3hFb0NCblVrOGxlTzRIZlB1SEk1?=
 =?utf-8?B?N21EMHpQWFRFcUNPVWZLa2JVZU5aWkpqQkYyRUt0WFJ0VFl4MDZqS2ZlZEd3?=
 =?utf-8?B?ak9iNnNxNnh2eHl2TDFlaUtYaEp4a2RIQ1o2NmIxYzYvNXp3K1FHK3FpNXRZ?=
 =?utf-8?B?SG1VNVhsWkEvcjcwL2tlSkg1OGdKUlBJN3Y3VVNnR01rS1orWTBNY0MwbGVT?=
 =?utf-8?B?QStaSmRIUWMvNzd2YnZnVEpXMU1pRlBlRGJOaXJERHZsMHljR0xkcXRBclJp?=
 =?utf-8?B?MmkrKzAwWTNkZHdsTjZzUVNUd29vcjllRW9rVnorTm1KV0ZUL3lYbkJPdjJz?=
 =?utf-8?B?eFJMTDR1c2tPYmZWMG5BZ1c4RHFMSU96Qm42QjNpTjNScmlzaUI4MUw4Tm1a?=
 =?utf-8?B?V3ZkQnBrdUgvNFp0L3NCSzczQS9hMnB4Q3RJK2RHQ0NUVDdaWTB1VytlUGVG?=
 =?utf-8?B?ankzdU81elZIQUNBQVp0M2NVVkVkSUNnM2hyR3JjcXVVVjFaMUNkWTNjNkhG?=
 =?utf-8?B?MWRlemRxbkp3S2llcnQ4dGdlcklYbURWUVJ0WWc1TjNiUE1LMk5zUVBGbHpp?=
 =?utf-8?B?akI0UnRxOXRTMlBZZmRDNFB6Qmd3alRQWDhPWWhEcEJQd1pabU9BV1JjbHN3?=
 =?utf-8?B?aGM4TGRYVDJqK1p5Q0R0K0U0ZVVJTUxIYVZCZGNwWmdJSS9lVXVQbk1tU3RW?=
 =?utf-8?B?M0JqdE1WdHZ3VmN0VkFkUkoxZVJDTWN0c3d4QUVRQTRRbGQ5NXVoVkFuVWxZ?=
 =?utf-8?B?V0NzSDlzY3o3VEZZb05LdUI2Z2g5b0NjYXV5Q2ZQWFNUZU51YnlDMG1nNnNt?=
 =?utf-8?B?MDdic1I3aFpzaGNaYStSOTNQUzZBT003SkZPQUFRK0VBbWxaL0hJSEtib01h?=
 =?utf-8?B?bDlhZlBhakpzc3pySXJUTnNZWGtXa0hyZWVreWU1OWRhdTBwMWpSbExZTHBm?=
 =?utf-8?B?bU5OMEEyWVV1S0RtV1FBS1R1N0ZmQkJzNHUrMUdaU1kyVkw3VmZFaWk5QnRh?=
 =?utf-8?B?N2hEQ2ZYS25XUFlnSzVXVjRBNGFLL0NCOHpYTDNCYmN3bk1URXM0amxoaHda?=
 =?utf-8?B?M2x5UjIzOWNpUnZYS1FVdHQycXRtZXpHV2JSNmtrR1ZEdTM3eDI0ZjVIbEph?=
 =?utf-8?B?ajlLKzY3RUc2cWRGQlFvbU5yRDd1bHJWcFJEWkYwUG1WRTBGUkJLWk00NHJy?=
 =?utf-8?B?eHZtYVNRTGloS3FWNHB6THBsRjdUK1FIWmlnNDI1R3B1a0wrR1dUYTB5dkFK?=
 =?utf-8?B?dVF6Nmo0OHY1ZWdSdy8xa2hhVENJVnlVcmY1b3FxemVydjdmNlhRNitlR2Mv?=
 =?utf-8?B?Umw0V0JIVm03cnRPV0RhVTJFUkdvUEJDdG9XZjg2RkRRRnJKWjR3Z3ZVcWJI?=
 =?utf-8?B?Ym5OV3RqdWtlcjhmUGY0c0VQdU5HK2V3Y2VrVWZ2ekkxdHhOUWMxbDlZc2RK?=
 =?utf-8?B?Tm5mUUsxQ0ZpUkpxeEovS2VaNEh3Uy9Dbk5Kaks5WEowNnNxeE9WY1ZYcC8w?=
 =?utf-8?Q?EgE8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJsVnpPUHlnNk4vbk9rR2Jtd05USWFDMWkwRlQ2UG9BaysvWkl3MEdZNFA5?=
 =?utf-8?B?SVVzenBZNk15dGlhUFJLZnhQOWZFb2ZFRU1PYWtFYzlHb2taZk1zMWc4dDhI?=
 =?utf-8?B?L0Q1ZEVTNHJzMC82ZHZCSmNxalpkQ2ZoeWJJNlN6RXEySXhoenRtWm1SZDBR?=
 =?utf-8?B?Z2VQUDc0THdZeDRYQjE0QnVUZmxjcFlPMFp6L2NiVjNlQ1BBZ1RhR2pQdnJk?=
 =?utf-8?B?VXRodDVQMjd3RkpWT3pSUHgrOHpEbEx2TW02ZGJqSzBZR282b3VOZE1SbCtS?=
 =?utf-8?B?NUN6TEt1MHlxUkVHNVNwQ1NFRDNCdm1rRDVqcW5tNTY2R3Z0NEFqQzlCT3lS?=
 =?utf-8?B?QVFqRjR5d2lzNk1DY2pEV0piTXlmQ3FaOC8vaFJCY0pzY3F1UmpGU1A3Tkh3?=
 =?utf-8?B?dVhtaVJXL2RYaHFFemVKRWVTR3BHdTFEVFI1WXJvL1VIUjBNUHBoMVN4blc5?=
 =?utf-8?B?M3NQMjNWUk5mZXZ0OFl0Y2xxTndUcFI3Q1NaSzJiYWtSZWhkSDA1Z2JQeDZi?=
 =?utf-8?B?cDhkMXRxMnpvZmlqdjliVDhiY29YUk92VEwwaE5FRmRTY3VrWHhtWEZ1WnBj?=
 =?utf-8?B?aG5JWWtYSSsrYnpkL01ZNTFHM0MrQ05zSlpsQXNUSUQxbTJKK2xPWUlFWVUz?=
 =?utf-8?B?Z3pJcGZERk51V0VEVnVpcWNMb04xa2IxN1ZuZ1pFRmQ4ZWh4ME04Z1NiVGRQ?=
 =?utf-8?B?WVU4clRKOXFBYnNQTFN1VnRLSTlPU2x4OW1UQkVuT2J0VTFYR2h3RnJKV2JM?=
 =?utf-8?B?NXMyeUJIRnhRSWMvT1hhakFOUFRKVlBmd3cvRzVTK1hrbFhjOFVsYUMrVU1N?=
 =?utf-8?B?bmNwc1JXQmxFN3dKMnpMUUxFY25ybEgySXViMERmVlFXYlpraUljdWtxdytO?=
 =?utf-8?B?Q1pHU1J3S3NHS0RQRS9lbTl3UDd0V0Z0d1liVXBCNzdseDRYQzQ5dHROSGVT?=
 =?utf-8?B?anpEUEtZeGZqeDF0WDdZZ2ZrY3VyR0RVaU9Wd1N5WHdoZXUxVURmSVZOQVgx?=
 =?utf-8?B?bVk3OHpHVmtJcmlVamlYQkxjYWRJK3RUd0J4YkVaV1pzbW54cElMV1VDQ0x1?=
 =?utf-8?B?TEtoZ3prbmNvZ0ZrdDdjdVJOY2NBK2NhWmFobllIa3hGcnhoOUI0ZWc3SERF?=
 =?utf-8?B?Y2dzRlhYQmt0ZlcwS1dYNmEweXZUWGpPSXUxWnNLcE1yenQvNkRXbmpDSHhp?=
 =?utf-8?B?ZjFXbSs2NlFOVnI1RzFGTVpqYWNqdE9XYUxpaVMwdGNCZWVSdi8wRE5yOGdy?=
 =?utf-8?B?NW5Fd2k0VVY1cEMvRDVndnpGdnQ5dmhiczJYZ3pIUzdrWmhhRUZSL2hVaG1h?=
 =?utf-8?B?MmpscktYWjgwMURxcjVYdmdxUGdxalFEdGswY3lWa3BIU0pheStTbmJHZWFV?=
 =?utf-8?B?d2laWjhEdUJHY3FpeEx6OVcwY0Rua3BjLzRSM0hqa29LRkxNRWJKenVGN1VJ?=
 =?utf-8?B?UVVNWHNUNEs5cC9kL0xUWUZjTnJvdmpGLzlWMG1jMlJzcFh1MUdrWnpQbVVX?=
 =?utf-8?B?N0w4THB2NGRDQnpFNEVJM0hnU3lGM3FJdmc4NXhWV1M2U0NpcGhaeGZJKzZy?=
 =?utf-8?B?T3Z3Tml0UXVVMTg5MkRtejlyUzR0b0EwMk5CdTVjL2tDQnNvR0V3aEhRbjBl?=
 =?utf-8?B?SDNXZzYrUnRFb1hoem9wbUVZbGZQU0R0ZUtrSmtPd1RaeFdVaXYwcDZOUUF0?=
 =?utf-8?B?N3QvZW9LTWd4ZnRMTEc3SXlBVjZzdHk0YVppU0dBQS9adk4yNUhVajJ4T1hO?=
 =?utf-8?B?Y1F3aG5UdFdxdWQ5QTgxUkkyK2lxZUZnYzB5eENGUDV0WEFOZnYza2FqS3hN?=
 =?utf-8?B?R01jSEdzcExyYjlxdXlrTGg0cUVqL25IQXRRMUt2RVlmaDdQVXFUSHFKTFVx?=
 =?utf-8?B?SXpFWjc1cWpGejkyL2grWkVDR0xJM2o2elpiSVBGRGNLNkppU2dVQko4Q243?=
 =?utf-8?B?Vm5yOWEySDdHRGpMOVEvUzgxN2Nid25mK0toYStneWNPanF2a3Q3SFhHVGFa?=
 =?utf-8?B?UWNWUk5NaWVIVVA0d3pVV0JSQVZjN1JocGE1THlEQ09YVGtBekFyTUIyK3gx?=
 =?utf-8?B?MWtIRG1wVFg4N3JyTjN4cDEvYmVWZXIwTUtZTFZUMGZjV0dlSTM2Mmh1bTRy?=
 =?utf-8?B?dWpMRFhoWFdSUURQa2tVNUNFb2pHR1FXeTR0Ny9UQXNRbnVQUlJwY1RjNE81?=
 =?utf-8?B?UmhkU3JTbTRtQ2F1NldxTzlmVXRNcWJ4b212ZkEvelZvVjZzcE93NXRxdUZu?=
 =?utf-8?B?dUxsdHpxblFtK3dYd283NDVDZkxxWjN0aWFlNzUxNWl5dTJtLzVyRzY3UXdw?=
 =?utf-8?B?WUVTeGlnVUV6S2UvSm01RjVEclFqYU5pMDdNczdsSFNzVFdnbStZUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38292f94-f92c-4a2e-2289-08de5ee8321f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:40:50.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUFocWChs+53DLODcXMuaaoJdDn9IW5YYuq6/U2S3mFIOMXyfINxyiJMzXrasQjyVGKtUwO6CPf5cRXJY1fU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,pages.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 720B8AB798
X-Rspamd-Action: no action



On Wed, Jan 28, 2026 at 04:26:22PM +0100, Luca Ceresoli wrote:
> Hello Liu,

Hello Luca,

> 
> On Wed Jan 28, 2026 at 2:50 AM CET, Liu Ying wrote:
>> Hi Luca,
>>
>> On Tue, Jan 27, 2026 at 12:35:47PM +0100, Luca Ceresoli wrote:
>>>
>>> On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
>>>> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
>>>> Each patch fixes a NULL pointer dereference issue and stands alone.
>>>>
>>>>
>>>
>>> Applied, thanks!
>>>
>>> [1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
>>>       commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
>>> [2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
>>>       commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc
>>
>> Any reason why patch 3/3 is not applied?
> 
> Yes, the reason is there's a patch conflict and I still have to find out
> how to handle it.
> 
> Patch 3 by the rules [0] should go to drm-misc-fixes because the bug (added
> by [1]) is already on Linus' master tree (since v6.17), but it does not
> apply there due to a conflict with an unrelated change [2] currently on
> drm-misc-next.
> 
> Note that [1] and [2] are the two commits mentioned in your 'Fixes: 'tags.
> 
> I had a chat with Maxime on #dir-devel about how to handle this situation
> but still haven't got a final answer.
> 
> I guess the correct way is:
> 
>  1. apply patch 3 on drm-misc-next, where it applies cleanly
>  2. send a modified patch for drm-misc-fixes, to fix ASAP the master branch

The conflict between the modified patch and commit [2] still needs to
be addressed in the future, right?  Not sure if there is any proper
process to address that.

I think it's acceptable to wait for a while and apply 3/3 after commit [2]
shows up in the master branch, because i.MX8QXP pixel combiner is not
added to device tree yet, that is, no one uses it for now.

> 
> Would you send the patch as in item 2, so it can be applied to
> drm-misc-fixes and have master fixed ASAP? Note iit should not mention [2]
> in the Fixes: tag because [2] is not yet on master. I can send it of course
> but you can test on hardware so that would be the best option (and I'm a
> bit overloaded at the moment).
> 
> [0] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html
> [1] commit 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
> [2] commit ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge")
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

-- 
Regards,
Liu Ying
