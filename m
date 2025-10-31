Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC84C246AC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB65510EAF9;
	Fri, 31 Oct 2025 10:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IyDKGFlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0565110EAF7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlarNMwarBTFimBcuItagG5PQ9vDYh1eEF3eHPpmJxlk+gB0Qmxy6K0/XbWTAHxdzKL7CVaBspYNhg0qjucg24JSztfFwAeyXAwdrxCH4kOkPCtWfR86v1qUL1JHKd406j3vAHBw5/v8DyH4+dDqCzCf2+iNpoS1gKugRDYXERQ3RiHarGjS5Y/Je4eV54Ixwz9kY7rVqLa9d1mmw0xVjJl48pZ7pW/NJNzeZ9uwqmUdXqHltgjuLqUJAHETOssrx8Glz9m+p0pUgPX7qhDFt9pEhq+emkYQNOzWr9gZ5/M9uQvOl+C/MIOwbScbyY4DAXuQeG1haTykZQfjPO8YVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6HFWJD8Z9XGs5dJmdmR5Rv34O8gqVjxD/YOU5KsM+0=;
 b=ooPyR3cd/t6zCqbe0t7HZplWrHAmRpR+OpTYKC4OmBafmHKqnP2bDQONrbQBhsV8D35ywYBLZena13mZiUFJrRgg9/heIZmFLN98SveVHPZbrhr15AIhiBG/SICE8QN0Ube2QP0/3AjL8QwQbEBQ0dDPHAXCUs+D6d2X+klhxb8YFuZE0IY4AsE9qOPi3SKX5SE56MjkqMEa13mk8rguPyF9JS3fbVmuDQmj9lkRwBACS9DsbozvZsQ2zhsldxz1SMiZcUkIor3GZjPD8ZmeWOGwmuuc+6gxT7EiS+AYeRt3SZyp68x2J6GrUJG0lpaC4HzuLEaMTvcct1HdFbo6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6HFWJD8Z9XGs5dJmdmR5Rv34O8gqVjxD/YOU5KsM+0=;
 b=IyDKGFlEQc9qGx7CHosYyuUMYbrC+MKIXAJaA0o3B75t5mLHFXJ6sShm0eEzW77983mOEO0sl/eucgojh1yZgJwqKheAficbKEX2uyEN+1IOK/NGeJZvf2gsbnHtrjSmYN7vwzKGfau0CbzICHtxuuXyTT737GRdis4glbfHULfqmDu0kVuxM4p1wwRHj3NWGVAcfOY7u2aofBTMI9WEOwDqbRN4iDM/K1/15awWncOuyK6bvIWnZ7faGRke0m7eu4GQuSotQIo2GW3/MzYupM/KUT37LISwOkYxjnekXbf9xV8VqA4KM2l80KXMNzjhrKfrc04f0b1XTDlJhExo1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7056.eurprd04.prod.outlook.com (2603:10a6:800:12c::21)
 by AMDPR04MB11677.eurprd04.prod.outlook.com (2603:10a6:20b:718::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:21:18 +0000
Received: from VI1PR04MB7056.eurprd04.prod.outlook.com
 ([fe80::66b9:8242:90ad:ac74]) by VI1PR04MB7056.eurprd04.prod.outlook.com
 ([fe80::66b9:8242:90ad:ac74%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:21:18 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 31 Oct 2025 18:21:24 +0800
Subject: [PATCH 1/2] drm/atomic-helper: Support atomic flush with an
 optional kthread worker
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-drm-crtc-flush-worker-v1-1-9edc94da0fb7@nxp.com>
References: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
In-Reply-To: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To VI1PR04MB7056.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7056:EE_|AMDPR04MB11677:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8e3f75-434f-4d21-7fd2-08de18673ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3ZKanM1WDhrNmFXSUs2ZTZuUmFBR0ZCNldPODNuQXFQWE5aS3ZCNkNMUmxv?=
 =?utf-8?B?bEZZR256eEF2dkVDSlFubmIveW0zcU1XL1pYRlgrY1ZHaEJ4SnVyTCtTVVhG?=
 =?utf-8?B?ZElTcHFSYldsSjkva2ZnbFdUZFFKWkQ1ZFBGZnowb2RvWk9JWHMxc0FxYjFy?=
 =?utf-8?B?cnJUcmlUTExIOXV4N2w5SmduL1VaQXZBZnJGUysrR0NpUkJIdHZhS1F2RFg4?=
 =?utf-8?B?UmFNbkNxc2ZsSnVNMFZ5RkttVnpOdUpRUzRTSzZnbXhPTW9KRjVNY3BLbzJV?=
 =?utf-8?B?VXA4V3doOGZmNXlVZUVRbEJQNTg2L0RJQXpZSFFsYnRHbEt2MTZCdGJRWXFU?=
 =?utf-8?B?d3lCcU43QVl0aFBJSWFmL0ZrQ3d3N2VXc3l4UkJSaVo0Qm84SGxjakIrY1ZO?=
 =?utf-8?B?ejlSMHhMM0J2bzFuZTZSMk5HN0swd2hxS0xPQjQzd1laTitIUTRNRjJRMUFK?=
 =?utf-8?B?bWx3RGZBdlpHMEdzc2x2MVdtT2hPeEpRSWV4UkljZkNWbldDVjhVUk5KNUpS?=
 =?utf-8?B?OHI1VHlzbVpPT0w0cEZRelpQWndmYm1CVTdXVzZ4QUlYckRmWmJaS2dLYUx4?=
 =?utf-8?B?NnNkNkMyeGs4UnAwdnFMSHFXWTV2OVNxZExrTVN5Y0FHZUEreXZpTXVtOXpx?=
 =?utf-8?B?alhMVEFkdFpQN0F6WlBqVDk4QUtBOStrcEM3c3pHaGM4cjh2M25ZZnJhSUs5?=
 =?utf-8?B?UWRTUmx0cnpjRnFyc2JnUktEUlkyZWJ4dTdaa1VFbEVKaDhtUmRTTzhxRTJ5?=
 =?utf-8?B?cHJVYzgwd1llR2Z1VFNrbXhHaDVEajVJY3RwUVlwSFBqREFMRE1nUE1aazBB?=
 =?utf-8?B?T1ZaTk1YYUpNOGpFbXMrb2VTbytIaHhFVlQwTE4rQlkrbW9mVGZzcWNaT0Rx?=
 =?utf-8?B?YURmdmYyVUEwN1UzaW9QRHgzQ3lRNTJnUUdKSWV3VlEyTGt6Y2NuM2t2Rlla?=
 =?utf-8?B?eFRCYmZKYXBJejRPajlDM3JLNTNjSHJDRzhrMWdyV3VsU2x0RE1jMWdHUzAw?=
 =?utf-8?B?VmJETDBIaFk3QmtKa0lXOStQQzlidFNFZHBlaXM0a1lvQkFEeFAyVG5SRFJ4?=
 =?utf-8?B?TTdma1VhNStSQWsxSjlDTzFYQ21zNGFpWjcreDByckwrcFk1TlNJRkJEY3lw?=
 =?utf-8?B?WGZ3UTlWYUVXOEJlZ1JZRmp6VzlWUjU3Q2pKK21IUnNqRzVqT3NBK1BQaHFE?=
 =?utf-8?B?VlA0Tk9RanJRN3ZPQTFHMFpHTW5mRGRxbmM3WTdURzc4ejMzdGE3TWV3VlF4?=
 =?utf-8?B?aGRtUW5aYUF6aWk3dWZrRkVUamhyYmtEc1UweUtVRTJFWkZYaGd1Rk0wdWpJ?=
 =?utf-8?B?VWFRNUFDSUVIeFdLUXhxSjhITU1Ud0tuSm02bzdsZ2hNM1grMWFzWTFaV3gz?=
 =?utf-8?B?dW9nYVBVeHRhVkdIaTNBa1VwS2Q4cE96YW9rQ2tYZ3dWeHFMYVR5UFBEcUlp?=
 =?utf-8?B?cUVZR3hvc0FZakY2eFRmNTRFNVFoNU5qbmpGZDZ4eWhLenJqSURGSGRtVHhq?=
 =?utf-8?B?Ym45TGJxemhoQzVQaDVwME9XM0FScTNFVmdlYXhFeWFUYjd1alBjRWhDcnRK?=
 =?utf-8?B?YkcvbW1WMDJMdkErMFMvOXRGcmRFbWZGRG9OWGxZT0JvS0lUc1FvNHFVLzVK?=
 =?utf-8?B?SUNRRWxuQUtzUFluYjZiR3JOUVlQWW1SV09pa3NVaTNKaGgwb0NZbzBOUnQ5?=
 =?utf-8?B?V1dwTEk0UnJwK1hOUTMzcm93cXhLZGFZL0w1VFNqbmRkUkRidFUwczRSN2k3?=
 =?utf-8?B?YUdKQjVHamZabXg5OFBvRERHK0dqUERWWUpsem5NRW40S0hzTVZKNFpkUzdq?=
 =?utf-8?B?dm5GUnlpZU9jcmRBbTFKQUt5RVV6WElMRnhPaUlza1REZ0dUSEVjcXI1NFRy?=
 =?utf-8?B?UklLMFV3NUlEU1dtLzhBZXJIT1JNUjhOajMrMGxjek5JTkdEUXNINm42eVJI?=
 =?utf-8?B?endTaGxzOEpGUUJFY2NTaFZwc3dqNHNta3VHcXRMMHJQanRIcXNQOGdJYUZU?=
 =?utf-8?B?UTAwbnZIZjBkRk9DWG1kMWVnU2NoV1paZXdCclkxQzBteEcxWUFlNHNqUEoz?=
 =?utf-8?Q?mbhtko?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB7056.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VvZTNPZmJjc1NQaWZ6QW9DdTVVWGVvYjVuWEhMUFZTUVVEKzdmdHNRV0JY?=
 =?utf-8?B?VGNjVDdhRHNyMWZrcEp6NkhlOUtmK1EvOS9QYWtUbFRwc0RsMzdrZ1ovRmtw?=
 =?utf-8?B?V0dwYmduTjNpWXd3blYrZURRSURzUzhHSFc0bVY2M29oWnJVNjJIT1RPYlQ2?=
 =?utf-8?B?YjVxdlQvdnVDbkVSQ0lndFFIbEUyK21ZRm56ZlhVaFNRbVhvcFcwVE9QSW0z?=
 =?utf-8?B?NUpwMnBNRmtJWk80aUQyS3B4UWRDU3libzBFeExQWDBHZkVWb0VkWGxXeTJR?=
 =?utf-8?B?RVBsUFBIYnNPeS9Ob21rcGRRTS9EOWxpUlUwcmVleFU3QkNFUnJOd0J4eUIz?=
 =?utf-8?B?Njd0c1ZsRC8yK3RLb0cvbjBVRjJqemYvakVMNnpaeWpFelRLa1FFd05NZytp?=
 =?utf-8?B?ZG9EbEYvY1R2TDZZcG9pT1YzNmw0Smg0TzBGL05KOGRLWWlsZ01jRXlqNEFP?=
 =?utf-8?B?eWlnWnA2eGxQY1dkY25DMHc2Skc5MWNVUDJibTFMM09udU56NWVxN0tQY0pR?=
 =?utf-8?B?emdOUi9KdFZDNWJTaVJQUWFkV25VcjNZaEtZdEd5WGVLVjNGcE4yMUJNb2pX?=
 =?utf-8?B?OWQyTG9FR1VLa3d5UHFiQVc3L3dsbGg2WnRlYk9NaG1GT0FIQ2k0ZDdycUxV?=
 =?utf-8?B?SGFZR0hVUU5NdGZZQXdGNTh0bmRTRzdQRmo0N2I2T3NLL2Vhc2s3eDVvL1Ny?=
 =?utf-8?B?SDJrOXd0RUZadnVGSEdrVUYzYWQvc0Z4cEUyVktENk4zVlU5OUdMcVdvY0NO?=
 =?utf-8?B?dkJ2ZVFjK01za3UzQ3BGM05nczJEWTVsZXBlY2xWUWdaQ0lpdmVxL3NiUW5z?=
 =?utf-8?B?OWNzQlZnTTlaTFY1dCtrNTA0NGo5L1J5UWt0cjdoRmdiREk4T0IvS283bzVM?=
 =?utf-8?B?KzJZdWRMazFjSmtncTRUQVNNWjhrTUtnT3A2NXpUVkY3MmR2ckwzTzlzRkdD?=
 =?utf-8?B?emJyWFhrV016OVJ2bUJsZENSN0RDUkQ3TWhuRk5LSXppQzFScy9pR3lXUVVR?=
 =?utf-8?B?WjE5bGZJakx5QVlSaVJtM3ZrN1JmU3p0UXNvRWJZSUkwWVJDTWhWR1BwQUJw?=
 =?utf-8?B?bHBlSm5BVTcwREZ1SnU4aE0yRUJvQ2ZXczhLR0FCSlpTZ1BVMEIvZENjYkRY?=
 =?utf-8?B?UjUvNXBDdDlUckxxTVdCUGpEWnhUVFVjT09YNy9BY1N3ZUZMMjBta2FKRmpZ?=
 =?utf-8?B?TkpoTkl6c0VmdlBoNW1WMkw1ZlRYUUtMQ1Nka0JBb1h0cGlQTGlmdEFmOHFn?=
 =?utf-8?B?MFlBMHJTTmVubTcwYlFxNUtFbXNoOEN4ekdjT0xQZ1NkSUhjR0wwZjBKeFli?=
 =?utf-8?B?dE9GMkRtV3NKVWJ6YktzUGk4SmJhQ0FlU0c1ZW5XcForbm1uUzgxeGRBYTcv?=
 =?utf-8?B?WUFzVzJMU3dpb2ZkUUdSN1dGZjY4Y0ZKMHZ2RVNxM3ROT21WNGYwUXB0SzdM?=
 =?utf-8?B?UUkvTWc5Y3M4WE5iWGdpNkptK0tQMlVUNW96Wkg0STVrNDdvNDhOSFd1UW5D?=
 =?utf-8?B?VzZVaHkrV1NGSVZlZnNqMmpobnFHRmtQc2ovMFk2bXlISFdLQnRNR1AwOG9J?=
 =?utf-8?B?NDUvUnVCaXNadmRVQTQyYWt1RElSQ05aU2NGbWthSy9NN3I0UHg2ay9TRGV4?=
 =?utf-8?B?bndNc3pPTDRhVHg5QXFXdjI1RVBWMWpnWDFjVE5hQ0N2OXlxNGFCS05SQWVl?=
 =?utf-8?B?RW9IR012cUFtWjl2VXl0TGREdGdIWTlGNzNidXZ2ZVFnMjg0M3RzcU9KWWd4?=
 =?utf-8?B?UFQxWGhacC9PbE50WEc1Rlo3bmVucHJQcGp5VjVIM3EwRWkvcWFWZGdPUWRy?=
 =?utf-8?B?ME56dUVrS3oxYWJscmRORTIvbjdEdExOUkJzZ04yb0ZCR21uUC9IM1YrTFFK?=
 =?utf-8?B?ZzhtOWRsUm1wSTVxSUNFNUxKY2VpK2NNbXJybXdQVXZEeXd2RVBlc0NPdEtn?=
 =?utf-8?B?SDFZbE5VZG9WTnFzcFQ5RmluQmcraFd1M0ttRzErUklDZHR6VVhGanlhMUFo?=
 =?utf-8?B?TXVTSlBSdVEvaE9acXpmWkp5ckFNTG5DOGN6ZXRza3NaVnE3bWE2cUZjRUhM?=
 =?utf-8?B?UUU1VitXaG1vZkVvODZnRU0zbXM3VEhKeWd4UVJLRDZCSnErcjRtY1I5UlN5?=
 =?utf-8?Q?JVND09GlS5qG7lkS8hdOSXTiW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8e3f75-434f-4d21-7fd2-08de18673ade
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:21:18.5429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQW8vRGRcwxSPra86z5FPxaXPL4v0gy3gyRGso6W9VYGZ27mzEFLuUMER4t/3lPATU9Nmh0TvoTLTdNrJ0wpag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11677
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

Atomic flush could be blocking and hence potential low performance
when flushing for multiple CRTCs sequentially with
drm_atomic_helper_commit_planes(), e.g., page flip for multiple
CRTCs in a single atomic commit.  A real case is imx8-dc, where
atomic flush contains shadow load register trigger and waiting for
the shadow load done event as required by i.MX8 display controller
IP specification.  Add an optional kthread worker to conduct atomic
flush in drm_atomic_helper_commit_planes() so that multiple CRTCs
could be flushed in parallel for better performance.

Drivers should call drmm_crtc_flush_worker_init() to initialize the
kthread worker if they want to use it.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 27 ++++++++++++++++-
 drivers/gpu/drm/drm_crtc.c          | 59 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h              | 45 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acbc5a08aef7fa41ecb9ed5d8fa8e80..e976facba8fc55fb8634d3d87686cd2e1c3fd31c 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -27,6 +27,7 @@
 
 #include <linux/export.h>
 #include <linux/dma-fence.h>
+#include <linux/kthread.h>
 #include <linux/ktime.h>
 
 #include <drm/drm_atomic.h>
@@ -2977,7 +2978,31 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 		if (active_only && !new_crtc_state->active)
 			continue;
 
-		funcs->atomic_flush(crtc, state);
+		if (crtc->flush_worker) {
+			crtc->flush_work.state = state;
+			kthread_queue_work(crtc->flush_worker, &crtc->flush_work.base);
+		} else {
+			funcs->atomic_flush(crtc, state);
+		}
+	}
+
+	/*
+	 * Iterate over all CRTCs again, to make sure flush works have finished
+	 * execution if needed.
+	 */
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		funcs = crtc->helper_private;
+
+		if (!funcs || !funcs->atomic_flush)
+			continue;
+
+		if (active_only && !new_crtc_state->active)
+			continue;
+
+		if (crtc->flush_worker)
+			kthread_flush_work(&crtc->flush_work.base);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003db2a1b43441434839e26f61d79b4e..dad4182d2bb893a3e015cf0573df2c410c5ee226 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -30,7 +30,9 @@
  *      Jesse Barnes <jesse.barnes@intel.com>
  */
 #include <linux/ctype.h>
+#include <linux/kthread.h>
 #include <linux/list.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/dma-fence.h>
@@ -41,6 +43,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_modeset_lock.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
@@ -440,6 +443,62 @@ int drmm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drmm_crtc_init_with_planes);
 
+static void drm_crtc_flush_work(struct kthread_work *work)
+{
+	struct drm_crtc_flush_work *flush_work = to_drm_crtc_flush_work(work);
+	struct drm_crtc *crtc = flush_work->crtc;
+	const struct drm_crtc_helper_funcs *funcs = crtc->helper_private;
+
+	if (funcs && funcs->atomic_flush)
+		funcs->atomic_flush(crtc, flush_work->state);
+}
+
+static void drmm_crtc_flush_worker_cleanup(struct drm_device *dev, void *ptr)
+{
+	struct drm_crtc *crtc = ptr;
+
+	kthread_destroy_worker(crtc->flush_worker);
+}
+
+/**
+ * drmm_crtc_flush_worker_init - Initialize a worker to conduct CRTC flush
+ * @dev: DRM device
+ * @crtc: CRTC object to be flushed
+ *
+ * Create a &kthread_worker used for executing flush works for the CRTC.
+ * Initialize a work item to be queued to the created &kthread_worker.
+ *
+ * Cleanup is automatically handled through registering
+ * drmm_crtc_flush_worker_cleanup() with drmm_add_action_or_reset().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_crtc_flush_worker_init(struct drm_device *dev, struct drm_crtc *crtc)
+{
+	struct kthread_worker *flush_worker;
+	int ret;
+
+	flush_worker = kthread_create_worker(0, "card%d-crtc%u-flush",
+					     dev->primary->index, crtc->index);
+	if (IS_ERR(flush_worker))
+		return PTR_ERR(flush_worker);
+
+	crtc->flush_worker = flush_worker;
+
+	sched_set_fifo(flush_worker->task);
+
+	ret = drmm_add_action_or_reset(dev, drmm_crtc_flush_worker_cleanup, crtc);
+	if (ret)
+		return ret;
+
+	crtc->flush_work.crtc = crtc;
+	kthread_init_work(&crtc->flush_work.base, drm_crtc_flush_work);
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_crtc_flush_worker_init);
+
 void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 				    size_t size, size_t offset,
 				    struct drm_plane *primary,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2a748cf40ebf45b37158acda439d9..62e98d714bbb4d1a948cc7c17bafbe587490b081 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -25,6 +25,7 @@
 #ifndef __DRM_CRTC_H__
 #define __DRM_CRTC_H__
 
+#include <linux/kthread.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <drm/drm_modeset_lock.h>
@@ -923,6 +924,34 @@ struct drm_crtc_funcs {
 				     bool in_vblank_irq);
 };
 
+/**
+ * struct drm_crtc_flush_work - flush work for CRTC
+ *
+ * See also:
+ * drmm_crtc_flush_worker_init()
+ */
+struct drm_crtc_flush_work {
+	/**
+	 * @base: The base &kthread_work item which will be executed by
+	 * &drm_crtc.flush_worker. Drivers should not interact with this
+	 * directly, but instead rely on drmm_crtc_flush_worker_init() to
+	 * initialize this.
+	 */
+	struct kthread_work base;
+	/** @crtc: CRTC to be flushed */
+	struct drm_crtc *crtc;
+	/** @state: pointer to global drm_atomic_state to be flushed */
+	struct drm_atomic_state *state;
+};
+
+/**
+ * to_drm_crtc_flush_work - Retrieve &drm_crtc_flush_work instance from a
+ * &kthread_work
+ * @_work: The &kthread_work embedded inside a &drm_crtc_flush_work
+ */
+#define to_drm_crtc_flush_work(_work) \
+	container_of((_work), struct drm_crtc_flush_work, base)
+
 /**
  * struct drm_crtc - central CRTC control structure
  *
@@ -1175,6 +1204,20 @@ struct drm_crtc {
 	 * Initialized via drm_self_refresh_helper_init().
 	 */
 	struct drm_self_refresh_data *self_refresh_data;
+
+	/**
+	 * @flush_worker:
+	 *
+	 * The &kthread_worker used for executing flush works.
+	 */
+	struct kthread_worker *flush_worker;
+
+	/**
+	 * @flush_work:
+	 *
+	 * Flush work to be executed by @flush_worker.
+	 */
+	struct drm_crtc_flush_work flush_work;
 };
 
 /**
@@ -1220,6 +1263,8 @@ int drmm_crtc_init_with_planes(struct drm_device *dev,
 			       const struct drm_crtc_funcs *funcs,
 			       const char *name, ...);
 
+int drmm_crtc_flush_worker_init(struct drm_device *dev, struct drm_crtc *crtc);
+
 void drm_crtc_cleanup(struct drm_crtc *crtc);
 
 __printf(7, 8)

-- 
2.34.1

