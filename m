Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGAHOso9c2kztgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:22:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA873300
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4A510EA70;
	Fri, 23 Jan 2026 09:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CiAOq1o9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013033.outbound.protection.outlook.com
 [40.107.162.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA6B10EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlEm+LHdELWhw5+ipFn1rAcQMGlPQ/1mAWxSJQS9geCUpghDgrO+pL4E9qaXFSIHpOKDWpqAAO07fx7BoesM3RDslWfgRgV6Gzt98dyNQZQWndmdai9gBHBHFEqldWtnkSrmztlpK6S61ARWis7BPEHzMFcG5eF8AuB7oQk2dFr4lkZxglT0OLNs7nKzzxoSUwtRxiPpA6DfVLhHhgIYS1D6vNSFcp39VHDYMLgdo/kj6O8fDU6fANQflCXxaEQdq4pGzzPdeJ9YF5KBZILrBbLOlEwcArHl66xGAyrAoYRg1ld5ZXz7D7MknIb6A9rKKUStUCNHxbUFBNxGSzDISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5irpja++CgxEiBBsr8nTMau5c8Jdsuw1z4TSSykcjA=;
 b=qgUjyaQaL6FbBvQauqPU/oS5rI4zvpx99g0z6DVT0chsWTim/y8I9MyRXqBketawdxFWvNf2GaNQ6CxD6jGHfoL9cLurvyiYDzq8KBUQiO4sZg0EhygsWG+IjmBp5AkNnvVyXysPrsD1c7hKggx3a+32sganKbILKweVj9DGMBRwI6byEstBLqaXl9bzdmQz+yWs2HHxiRTEQdXa+WbA/jLXVMOZsPgFnFzWnyfCQc1A9tUp5bUZSt8XzmQTnYumXtWRFGnVHFrTCNYAuDwy0NN2VZPDSWPgyw+veV0j6EfatdWAeuzDBIy2xi2XDgOyw9pPI94JuTx4zB/Xz2bhfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5irpja++CgxEiBBsr8nTMau5c8Jdsuw1z4TSSykcjA=;
 b=CiAOq1o9w12YThkyT4pvAac4xf5HIiIhB00UboypfF8DR6+ZzqB0oiRGtdmqYnl47vlt8VlGH3i75mIWGZe3jMiY4YRj+PD3vQ3RxuXV8cRvoIIpCu7VrjUv5GaX48q13xtuBwukFuILikPkLw3PI+b2sXBvJn5NKSfUUVC+KLo8PoNrFxerp0TXS3btpp6BaaDG1kGpKUduuVsH8BkaS0eYajJzIWaKefpyiT6WcZsq6YHzRIvjB+URVBqLS+ZPHGF29BRjqin9f/Cjmq35Am9aqS/wWuEIktT+P0sR5cx4xi2UTIApY9v2O7mEVm623E5AYrjFT8Mkm/Ki6OFmrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:22:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:21:59 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 23 Jan 2026 17:22:16 +0800
Subject: [PATCH 2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer
 dereference in imx8qxp_pxl2dpi_bridge_destroy()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2413cf-1013-48a5-ce04-08de5a60dc9e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cndMTE11SFVLU2F2QUJ1MGtScUkzL2dRRnVsZGYrSGZNTEUvMlRUSGVtWmJV?=
 =?utf-8?B?VGlMMUhrOTViMHRCaGdTeXpTNHh5Wk5FSllGdU94NCs3SjkrdS9UZTBYbGJr?=
 =?utf-8?B?bHpZR0MzQzBHYW1obmIyc0tKZ0RSNTJaNXNFaklqcGlkYkZSdm9XSFhDd1Zt?=
 =?utf-8?B?Si9qeDZHNXY3VHdDMFczZUN0U3RtNzRIdys0eFdMMEJTb2Jnc3ZaUUdkWU5O?=
 =?utf-8?B?cUNOSThhb3BrNlREbjdZdkd5bmpSQ2hQaFZsQ2w5MTRTZU1RRFF6aWJteFlB?=
 =?utf-8?B?VFJFWGpKTGR6NW5HSlFCK3NGeVhxV0JDQUVnNTlqbDdiYTduSWNqM29RbUUy?=
 =?utf-8?B?WDdzRVpMUUh4VWUwV2JCb2k2SUdZTEpVVFNzQXZqdW5QcDh6MzVVTGNkQ3Jk?=
 =?utf-8?B?QVBnUE16Y1FOWVZZK2VaeHVWT0JWd1JjUGlvT2pHdkZTQUlOSVRpUnhWbHpz?=
 =?utf-8?B?UysrVDNuSFJDVjhNaDlOdzNlL1VrRmllNmRYd0VPUVREVkNiMFEwUURZWlM4?=
 =?utf-8?B?VVlnK0pMME1VYVpYVXFWU2IwWlpNVHdWVjl1dUorcThaK2VxNkM3N01qbGNx?=
 =?utf-8?B?bURDaVpYdWpnMXdDc1ozVzlEQ2hPZUNkZnc1WUdGY2E1YVFVMVFqV21URTZF?=
 =?utf-8?B?MktUV1ZFcmFiOWZUQ080bVF4TkpocVRTd054eUdBT2ZFODlWNVAwRjRYSXU1?=
 =?utf-8?B?UnBxTjM2d0FWdk9wNERyekE5ZjFXU2xNY0JTVVR6SHBJQjlwSzdoVFhreUZL?=
 =?utf-8?B?RDN5VTVyRXlZVytWVkZjbEM3WG1QQWhvTUZKbGVONWxkSUFpSG9oUE1oVzhE?=
 =?utf-8?B?UVBpUHU1MUVzSHhSNmJoNitFeWlMYVEvNFhNL0dlTGQ5RjdMTWUxblJiRnVk?=
 =?utf-8?B?QUViNy8rSG5SMkdJNUE5Q3dIbFFkWVFUOFdObHhmTzhmWi80QWcyNFQvR1gz?=
 =?utf-8?B?ck5GRjVYclk2dTNGZEFOYnI5Z2lRKzdVc29EQXk3NDN3UGtOWjZZUCs3SEhs?=
 =?utf-8?B?ZUE1VzBIbU9TQyt0OElQSGxRV21pWXBBeDBKRlBqWTRCdHNMM3RVOVJ5Mit1?=
 =?utf-8?B?QnpOS3FCYlpwT1lDVExDYWxjVmw3NGM4WHhza2J6WHJkMnRXeDNKOFo4aUpQ?=
 =?utf-8?B?aS9EeFhmRTg3RHc0NXJyaXovbjI0YXFwN0J6VTdJdktEdWdSUEdmbUo4Q0ds?=
 =?utf-8?B?bG9wZzVrUGZUOHhUbVJ0N0RoQjJXWVRvTmFnalZZNkNBK1RZaUYwZy94YUtl?=
 =?utf-8?B?dWE2ck8yNGZEMkp6cEl5NXZ0TnEzamw2Z205d0NTMTNRajRBY3RnTFl1aXRP?=
 =?utf-8?B?TG5KWWNFNndkRXlZSUk4S1RNUlhLaGVhdFNEWk1hLzJRaUNla3ZUVVhielRV?=
 =?utf-8?B?cTJTWnpGRkg1QkQxcmZDdStzTXViRXYrVCtlVEN6Nkoydld4YkxUUG9TQkpm?=
 =?utf-8?B?ejdtc1oyYkI5K1VQdGloYWc0aDFHVGFqbHFES2lkWDNNbjkvWW1adFZXa1JY?=
 =?utf-8?B?QlMyOWVRVG16MmFJU2FDZ0xLeUxWMnBnMVYwKzR0K1lhMEZpRDBhYWo3S3M4?=
 =?utf-8?B?Z05VRDZuR0ZiRkdzNm1aVzZSNFROd1FPOWdnK2NielZWY0VMbFRwNzAwOHcw?=
 =?utf-8?B?cyttbzg2WVVjMUwzQTZFY2t2QzByNkcrUWRJYXdQa082QmRCU29LYzRidi8y?=
 =?utf-8?B?THBXVTJ4cXg4ei9UREtVMU13M0ppakJGZUlnMHdid1FCSzNXbkpSQmtubzRv?=
 =?utf-8?B?RE1UMUJuR2F6VjlxYnJsd1paV2plWStPWHViejFrV2xJNGwzVU55aERJRkJ0?=
 =?utf-8?B?VExTQW1kN2x1ejFFcExJYUJkc0JzTjJOZTRydityenRPbkhndGU2ZUQ5c3py?=
 =?utf-8?B?SjByWDhPbTBzK0NTZ0NxY2ZaRW55ZGZSMWJndkZmYWVSNG9NNEhCcDZDdUFw?=
 =?utf-8?B?Y3pTbXNIV21WOUpZeG9CUGYrNXRoWjltcTJJY01mZ28xQ0kvcXZ0T3lkVVhp?=
 =?utf-8?B?eU9sR2tacDFKTGFHU0pCL1lqSUd3VkljL0pHWk1tWGVPQkdVKzhyK1hqQzZH?=
 =?utf-8?B?TUp2c3h0R0pkK0NORkw2MEVpTlJUSTgzS2JpV2NzcXdjNVRTS2YzdlQvUjlN?=
 =?utf-8?B?bUVTZ2RKQnVaa0JySHQyRlp2eUlDVGlmd09JcHFwZjMrVk50OUgwWkJZODJz?=
 =?utf-8?Q?0qK6eOGdos2YYQYxTTasYr28/ZKE6AOpeu+vOk/u5tbm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1N3VUZyVjB6RHFWS08wZ3RtTlpERTJLRGFHNk9WcnRFdlAxVE1tSFA4d1ZX?=
 =?utf-8?B?dGVWS1BPQTd6Q09aTHRmSUt6enhsK05icmhqZHdZaXU5MGFMb2NFNUxnZ3hO?=
 =?utf-8?B?UU12OVNma2hRb3NFdUI3VU5sOC9BVTFPRFBHR1hFMTdualJYajRsY1JKS29i?=
 =?utf-8?B?cUZOdHQzdDlsZXNJN041eGY5SnBMSVFna3k3N0FsblFYVGU1cGlpeVpXak1R?=
 =?utf-8?B?WWZiNlFsaVRQUTZZN3dnYWhaZzR0bUdGQlhYTmlZNGs2U05zNjBXckVOZW9t?=
 =?utf-8?B?c2VNNCt5Q2U0YXhwaENTV1BlQlZCbFNOYm1rV1BkOGJwYkR6V2J1cmM5Q1FR?=
 =?utf-8?B?a1BOY3pxNWlxL1Z5b2RPL2NtSTk5MktsVk9vQUlQVEJXUkNFNGFVbkNXb0Zi?=
 =?utf-8?B?SlZINFRjUTZmSFZmMVZ0TUJXdVFiRGxBTXQzQUhEQjE1TDh5ME5xN2lURy9F?=
 =?utf-8?B?dHA4Uy9BRmpuekRPeGhWQlFscE5UQ1FNdGlzYmt2MzhDUmlnMkEzaEJiQ0w4?=
 =?utf-8?B?dytvaU1mdm1mbU5JSkpQYnRlNm5WRnVRR3U5dGs5UGJwbXFmVFN3MkRQdjlF?=
 =?utf-8?B?YW1BQ2FhdjFJOUlUdWRXdWhrZDNZSWtocTdudEo5dW9DYzA2ZHg2MHVlK1dH?=
 =?utf-8?B?MlQ3UzBjdFNYQXhiVnNKaVBLRGxVOU1OTjUvT2JKeUU1VWRtSXdXZVFtb2tr?=
 =?utf-8?B?NUpiTWI2R01oTFhBWEVDeUVyLzdpYlc2NXpWWnZWS3NPR21WL0g3K0FNTWc3?=
 =?utf-8?B?QXVxSzdOb2FFRXhQZ0tqOGs3WTVaNlAzOW9TaDR2bXYwNmkvVTZFaXhPbEVI?=
 =?utf-8?B?OG1MR09BMjd0SVJtTFVGZG8xbkVFWGkyQ1lQNlVDRlI2SkJMbUZPVjZYbGg3?=
 =?utf-8?B?NUMvQzdGVG5yNTVBaHZIbHhseEgrTU5oYjg4c1NxeTdBV1pCbzNZcmg0U2t1?=
 =?utf-8?B?Ui8rcUZGWjdTWTI5azNTdGU2aFQxaFl3eHRySExaSW5mWnlzZXhmM3lBVFV3?=
 =?utf-8?B?alhxeUFuTzhpTmhROWxhbzhtU2RVRlFqSXhTUTJxeUdhQXpxQ2Vnd3ZNTktT?=
 =?utf-8?B?NEJvUjhZZjZGMURhT3ZKUXFraXBOSTMvNmREOCsxTlNQNS9mTXFIUndnaWtv?=
 =?utf-8?B?UWhQVW56c3h2dUhWZjRNdW5pRWlTWGx1T29heU9pTXlkOWVzRU0rbzZ0YSt6?=
 =?utf-8?B?dkVaTDZzcWNyRWVMRExXVG5VV25zdWN6MW9IVWxZMWdOUTZ1V2d6ZmpIUnRL?=
 =?utf-8?B?d3NHaEZJTUwxMUszUDh3SlAxOWhYVmZZNTZmK1U0Rm1uMnF1VlhabDJRRHQr?=
 =?utf-8?B?aFZKVkFVR1M3aXR0NG5CcDM5TE1LVHBMVHFZVTBjOWNVUm0xQS9lMTlSMVUv?=
 =?utf-8?B?YWVVdVFEQnVnOG16UmpIMFB3ampkeUtycFc4aG5sajUxT3lVVXIwWFM5NVdU?=
 =?utf-8?B?Y0t6M3VGUFpCZ3puK2VxSHpEaTNmNjlLL21RSFcyZnBicmliZUlpeTgxcFBG?=
 =?utf-8?B?ZVdVUnQ1eFYwaTR4bS8rTW1rM3dqTXpldVJKeVE2TFNxeGZid2xCbW56emZD?=
 =?utf-8?B?bC9WeXBjMVBNajRVVjhyYWpPbGR0K2pTL0JNU3NRMWRPU0RMeC9DV2lIM3dr?=
 =?utf-8?B?cHVwbmlrVVBNenVoK3UyQmNXcHZtcnNnMlJIM0M0ZENxeU5TS1JnMGptTnFJ?=
 =?utf-8?B?WDEwRmVhQk84dk9PVGMyTVNyTzBtdmptQ3p1OTltTHA2M3lVd096N3dtYjFO?=
 =?utf-8?B?NW4xZ28raXFJSnJYbm5XWXlUaUlPY1VZOHg1cktBU1FRQ3N1aC9UNVVHN3ZJ?=
 =?utf-8?B?WnJzWnRzK2tHdVdOblNwMlBIUlZ2UnBGYlBKZDZWOWpOakNlbmhaM0dLNU5M?=
 =?utf-8?B?dnpublZudk1TeW5IWEJ0bE1tbnVBaHZ3b0dWZFA3K1Zrald2Qy9mTnpNZ0x4?=
 =?utf-8?B?UG5FdzVPaHI2dXdlUUZNUFg0TXdQdlZuWFd3OFQ1bWtvc0ZGdi9wdWdDWkhT?=
 =?utf-8?B?eWEyRXUwS0tTT013bjR0MHBRZWNUMExvQjFTT2JCUW9HaFgyVWdIbE1QZmkw?=
 =?utf-8?B?d3RjMFF2L1BPdWJpRUoyL3QySDRmUW1kWWppZkdjQ1lLeWRKSjBVaENoU2Y2?=
 =?utf-8?B?aXNrcVhCNURCOGk4WGFhSnBPZlIyTHlXRnVDQTcyakRmQkl2Uzh1SXVyZnlI?=
 =?utf-8?B?OXNYY3lwZUdvNjlnK3FuSUVLUDQ5bS9nQkZPNEFMb2dDUXAwRThOYzN5UUhq?=
 =?utf-8?B?TzNJcHNFSjNldHZkSkpwWHlBM3Y3ZWpwRzZldXlKWldDT2h1TnQvcTVTazdC?=
 =?utf-8?B?YWM5TDNRNUg1TGZvemY5bGV5K3RLZVdUVTZwT1pPQTNqUDQzQll0dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2413cf-1013-48a5-ce04-08de5a60dc9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:21:59.9153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTTwC5wc51T17dceTGTu/IjWvwgGVFsGu15kcVcKqFz9XuhX78Etvnp7x0HJCqUPeqH+vm1b3WBdg8vIZHPNEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282
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
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:luca.ceresoli@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:victor.liu@nxp.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	NEURAL_HAM(-0.00)[-0.816];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 6CDA873300
X-Rspamd-Action: no action

Pointer bridge->driver_private in imx8qxp_pxl2dpi_bridge_destroy()
is NULL when imx8qxp_pxl2dpi_bridge_probe() returns error, because
the pointer is initialized only when imx8qxp_pxl2dpi_bridge_probe()
returns 0.  The NULL pointer would be set to pointer p2d and then
NULL pointer p2d would be dereferenced.  Fix this by returning early
from imx8qxp_pxl2dpi_bridge_destroy() if !p2d is true.

Fixes: 900699ba830f ("drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index f0814702b641..9dc2b3d2ecef 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -67,6 +67,9 @@ static void imx8qxp_pxl2dpi_bridge_destroy(struct drm_bridge *bridge)
 {
 	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
 
+	if (!p2d)
+		return;
+
 	drm_bridge_put(p2d->companion);
 }
 

-- 
2.43.0

