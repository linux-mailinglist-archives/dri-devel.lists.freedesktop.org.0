Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC4D1190C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 10:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D76410E21A;
	Mon, 12 Jan 2026 09:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="icF3A+GH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013025.outbound.protection.outlook.com
 [52.101.83.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42AA10E094
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS07gaqARGgBHGlgLuCZNo3U4zTI77B7WzY3kTsCKsMn+qlMIZE8LDqznQxLrg4xgVuneHZend5yU8z4+RO7qu2INf6rWQbNyxGNlrLJd+K8IIuBZt+YJTUlCJTk/w4DLU8ipB7cf/Ai1vhJzmoY5dnL8LubuYY5As/nKYDDP+kBK1JfL+SCTtvMEZGBd5BooN0AybGq+bu85R1XFTuO27caOemNfC8dE6nEWe0Fudv0/SOkEQy5Dhzy6Fhr+HgfnmvpdKS+suvxk74jDFxIVvj4tska17sHGY2KiChMTXe99XGKdfXQY8Tu8XTymR+2xHC1TMIVEZ9eRVWcA3e9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5jqfRtZe9lPR05qk51r6QAq9HwY1j2fka9/DwjZHBY=;
 b=EAz7HMOqNCZHpt6J8YtykfSbzPinhHae32EthMFOg+X1wCZkWuofQD6DpKeXsOxREH2fI2QK/yd3ZbqpPxQnBCM2jnWIKRGxwLkIG3m923MTQsH24LXk3zBTjkIPMsR1mwI7i0j8F28c/j5oG8bta4oZmh2k5qI+PKoOK3YGK7cHuehCJ4yB1DMRTI33wHZLhser4BmoGEZW9JRqxJZj5mJvicnHvuQ6Fa07mEySHnHBreoGYRYqGMwM+ZSrIViPU1Y8pkiONfWhNYrKP53Tw/rnAn9ptVtsPMo+ZTWWcW0LfQ3vk7temteSu4ULpZ9h8pBC9ZA9kT/r03yLPyK8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5jqfRtZe9lPR05qk51r6QAq9HwY1j2fka9/DwjZHBY=;
 b=icF3A+GHw+BfY0Z8v+sFr1Is1pXTS1u4vSXzOMv35LL8rFiXvxOx7gcjXY23iNEHXtj9AZGngIN+ny91AKTB4qjWWylWgN4og7P7hhWG9dg4XBBs1HXxY4Ckgc0rBWLk4ZCc5EzD2JyhSbXxX2fDClK3e5ZUZjoWJ3QrCcKuQrXObru8eFcrhkI4jflFqir9hW8LZZqIKCFawfF+UgUyotCMNXzftloiwB9SsZF+H26Aq5vXaD2La9cdEEe5nCvC1twgIW35yJuxAkT1q2E9Q1Phl5Q/Ck4Ash8ZCmk+61ptNDQqyjz5wxbABlIPXGtQ5Y4sij7d5zRnBCfamoLRjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:44:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 09:44:12 +0000
Message-ID: <fb7b9103-701d-4110-b2aa-b53c0e5c8d0a@nxp.com>
Date: Mon, 12 Jan 2026 17:44:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/bridge: simple-bridge: Add DPI color encoder
 support
To: Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20260112093127.GA121274@francesco-nb>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20260112093127.GA121274@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f36a6d-4b58-4eee-68e6-08de51bf2481
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anBaS21YSVBhRm9MMjFqNnlrc3dFQUhVZW9MUXE0aFNpSFVYSVVzbDdqUnJx?=
 =?utf-8?B?V0FDK0Q5bEtnV0krci9tb21MV1hIditBd2F4ZXQ3V1YxdFpnbzNvSEhucmFB?=
 =?utf-8?B?USsrbUxJQzY0WTU3QkpQUjlXNzhwTnFzZ2xoM0dkcjlJaDNiTFRpMDNkZVBx?=
 =?utf-8?B?QnE1R3pGTVBpNk8rV1BkZjZuRzZmQ3VGbXErV1NJZ1dwaVp5OWZ2T1FiZldB?=
 =?utf-8?B?YWxsOFM2bkIxbXhkcVdMZEtJN081MllKemNPMHpmUVpiTjJSTVR4Um5BVmVz?=
 =?utf-8?B?c2Q5Ym1qb2ZNUjl1NWZwZFEvNUhacXRqWFVaT3dhakpYeTIybkNzOFZXV1pR?=
 =?utf-8?B?bTQ5SW9BZ1ZheUxRZ1R6ZmRsQm1sVCtJcHN5QWZsREM1RzFCVFArWlkrVVB3?=
 =?utf-8?B?K0ZwRFRkWTBpTFdFSFViSU55a1l4TGFZWnBQWHkralMxYk95MnVwbmV0QzFV?=
 =?utf-8?B?UnBxUWh6Vkl4aW1RQXE4NlZQL2pCZ05ERVJwTjZNOVNlV2lEZ3RTc2RMMW5E?=
 =?utf-8?B?MGd4Vmtya3RTR0V3OUVXd1hQclI1REZmL0RPYUsyTkViME93NTJyckdseHZ2?=
 =?utf-8?B?Nm80TUJtWG03VmltOFFHRTdFZkphcTRZMFVBcnFESW8xOGNxdjNoS2d0NExM?=
 =?utf-8?B?UDRpR0lQMzB4NXpDN012TDh3aUhvd2dnYXU0OUpNa1AzdEhRYkFSdEJXd283?=
 =?utf-8?B?S21DdXJWUUM1cktyM0lKNTFoS3kvazcxMndHVC9LTDBNRFJxVnFYcFdDTEI1?=
 =?utf-8?B?QWY3MWV1MVJFd2I2b1hmR2RocGNZbUF4ZWQwQjZxaWJSVzRockRnRlVQd3l6?=
 =?utf-8?B?YkxwU0RwbUVYWENCTDc0cVM3aEJvMzlmQTcvaVU4Q0pYVHFLT09kSGEzMVcv?=
 =?utf-8?B?bGxxbm91d1FUYWxHSVQrNHc5czF3aTJKc3ZWMkMvRmZEQ3NLczFsaDBKYlp4?=
 =?utf-8?B?T2s5SmszYjRYSVZycmRXUmdlemk3WHRFeXNSWEU5bGtFRHJPUCswWU1MSnlo?=
 =?utf-8?B?aWVrOElGSkRqaXdrS1JnRTJIb2Fkc0JDdE95NzE5L0tMd1JwY2Y5bkE1TThr?=
 =?utf-8?B?aUltQ0NsMm1nQmdOQlFnVmlwaGlZdCtGdXNEMzQzN0lPRWRkRTZqUmxWU0tt?=
 =?utf-8?B?VlhJVnhOT1lKVXF4RHBqOGNjWndLeXI2VHpzUkY3OFY0M0ZxcFhOQ2l5a1Jh?=
 =?utf-8?B?S2hLdFM2eU5CeHhqdUkvZUF6V28vK1ZraFQ5SUJpR0dYLzZCdmNyUDJTbEFU?=
 =?utf-8?B?L1B2dC8rcHQzVzhPcFZrcG1tVitRV0FxaWgxRXMyNXZEaUw2cVFjRlYranFK?=
 =?utf-8?B?NFg2UTA1WmNGMlljWk1lMVdwUmJncUo3TTQrRVRKODkwS1p4QVlsaEtRWGdo?=
 =?utf-8?B?UjF1UlhmSU5QZVc2eGRmZUF4NmZjN3dhVElncEQvMlIzWFM2MWJUc2V1RlhB?=
 =?utf-8?B?d3hyWndpTUNPQVlYc1pzK2dsdUM2TW82TFJlc2RPMkx0S2x1U0dja0RCOHRD?=
 =?utf-8?B?SHIvVk0rVDZlczc1bHJSTmdIV0lDdkNuRGY3Qld6ejA0OXcyT3RTNkxRWXRv?=
 =?utf-8?B?MERiM3V6cEJnOThTT0I4b2JmTHVtSTRpUDVoWjFHSU5yM0dqSFQ1ZlAxT0RV?=
 =?utf-8?B?MVpsM1Rac1BwSkJpT3h1dzRMVXovNHgrMzJqQ3c0WVIvMFlldmNBSDJUOG1C?=
 =?utf-8?B?MVVjNzVWNVRYKzlFalF1NFVqR0puamE0QlVEeEJvRkVRck5Ba2RMRlByOGlY?=
 =?utf-8?B?ZmY0UTk0VjBVcjMxSmdzUVZSdkFzWW1jdG9JeHlHbU9NNHN6V0NQS0lKWnhS?=
 =?utf-8?B?OURDalp0MzlMVk9Ud2dWdXBUMks1dlk2b00wK3N1TmdlTjZZQUtjWTNvUDZo?=
 =?utf-8?B?RU9qanQydTlOZ0xHTk85Q1pMRGt3cDhwYnZNM3lFYnczZ1B6dytBN0YrOU91?=
 =?utf-8?Q?Ccx7hBNlpEjSUBp5rUa9xXGuFlJdsUO0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xjYWZtcG9NOW5vdi90TWhPRVAzL0d4d3FwMWxpOW9uVHYwci91R0swQS94?=
 =?utf-8?B?bE1QWkx4Q0NmVHVhd0w3eXAvallLU1dqTE55Q2tCL29sSWZ0WlpNS1FtODBL?=
 =?utf-8?B?ZndleC9OQUV1Y05keW1DNCs4OXcrdFhZRXE0REZxV0l0WkVtZjlXNXZzam8r?=
 =?utf-8?B?bUs4Uk9jaVdsejVWTlV0SVNXakRVREo5ZFZxa3NTUUlWcVBLSDR5MEJrQSt0?=
 =?utf-8?B?cWtka3JmSnM4N2tNVm5UNTN4OUhFeWVlVVB1WWMvM3dPQVNkSk5HSVJKcUYy?=
 =?utf-8?B?Tkl6ZldDbE8wL2JkaVdpR2FuTWRaSzJsKzN0ZEM5aDduc0QvcktpTXd5ekRn?=
 =?utf-8?B?clZrNjVZV3FvR0lvL24xK1h6dWdOTm1GdWJPU2k3bXh1T3BjVW1Lb0FGVWlp?=
 =?utf-8?B?VS92YmFZWWgvSkVlWUtiK1grQStLWC92aWVVOTRqdTBVbVR2UnpRRng2SGpt?=
 =?utf-8?B?QlRZc25sUDFqUUh0dFdTMStEdFlnTzZqUjV6b25SSGdrZlNvbVlwYzE1TWxq?=
 =?utf-8?B?d0lkTzFZS1NvSnV3ejFIdnFQMFVyc0RQTmlxRlpnS0JudXJBT2RBbWpIdDNo?=
 =?utf-8?B?NTEzTnFFdWRYQTQwOEtEYWVBQktkc0p5elRXUHpKN3JSemk2UjZqamlESmFS?=
 =?utf-8?B?V3gyUEJjMnJiQUJtTVl4WlRxTktaTU1lMmtYelhjZS91L2tBSXB0NnkyRXN6?=
 =?utf-8?B?b1B5NlEzNlR3cEtWR3dtT1lmTnRsYlREaDBaS2J0cFltd2NuK21iRGYzcWU2?=
 =?utf-8?B?WWE5cXhyMnd4Zm02MGlQSE1pTlhZWjBacTJCdTVmbzBpdzhBcExrQUo0RHh0?=
 =?utf-8?B?NExsU3lTNld1QkQ5ZTUwbjJHTGx2VW9WN09nR0REN1ZRZk5XZmhTeDVpcStK?=
 =?utf-8?B?NUF6cEsvNnRuZ1BQa2cvaWgzMUZ5MGM3L0NjWmZjZ2hlSklxSmlub2tzdm5o?=
 =?utf-8?B?VUhWaloxNVZhQUNmbm9aN3dKSm1LSEJaOFpwYWVaaVdYZG9odXFka05xUzl4?=
 =?utf-8?B?ZDRRRGRWbUwzRDB6a2owU0pOcDJtbjd3NmdlQ2ZnLzVlYnlWNGtpdzRZL1FJ?=
 =?utf-8?B?R25MUUU5OFFBYlZQODdxQ21MMFdoeVdxNUFDaXQwemlPb1FMZkpFQkNRcU10?=
 =?utf-8?B?cktkaWduREJDMG1rWW83QXNNMXlOMmZrVlV1Z1BNVGFoYlFDOXlPL01nYWt5?=
 =?utf-8?B?WmxqbkJrOWpOSVc1eHRYZ2RUa2d0NzQwNXVyUHNkUW9PanRuQ0owRkdHTUhB?=
 =?utf-8?B?OFp1elg2dkhmM0RkdkJkRVZvODRZdzVrQTh1U1kxQjdLM05iN0Z3cWd6azBP?=
 =?utf-8?B?d0cySmNIeXJtQnNBYnA5V3BITEZRUWFCUlAzVDZYbFZTbWVaeEtiR0YwTGg2?=
 =?utf-8?B?U3FpbjR2cjZXSmRqckUyaDJ5NkZhZ1BMYW9TWHRweE1VekdPTnVUekZHczk1?=
 =?utf-8?B?azRkSnJlTUE5YjljOGE0TWVsM1RxYmRmNFVkV2lhSkRQUDk2UHc3Rm1mUWdz?=
 =?utf-8?B?THlCYnk1aWlFMkxoMy9UOGI4NDhxdWxHeHliQTFWYjVLYjdiSHo5MEhiYUth?=
 =?utf-8?B?aktJTmhxa2ljT0oyZ3k1N1JPQTZCYS9HU2FoNlNDeTROSGtPN2FXRG40MGVC?=
 =?utf-8?B?NzVXeUNFbHFpSDJHU05VRkVlZDRWYno2M2Z2SHlUUWI2NnEvZXpvM0NXWlJZ?=
 =?utf-8?B?b3EvTmg0MGJXT3g4eGpDRll1TzU4SmF6Wmg3MXdOZk5OREV4UFVFUzBYT2VM?=
 =?utf-8?B?Y2RzSnF5Rk9OVTJnUzc2OE92aU9adTdVK2ZOOXlvUFY0anFya0FKcjNZOHBC?=
 =?utf-8?B?a0M2bjlpTVpDREpOeW5EcCtmbVNrbGY1SXh0bDVJZXBJNHBjRUZPV1JLK2lq?=
 =?utf-8?B?aHdSaG1BSnFvNTRJUVRsTldwYUpzNHIxdXo0bmdpZzY2MDZIdkFNUndrQTgw?=
 =?utf-8?B?Y0UyVFJHajVQZnd5KzZvNHpDamplcU9nMlpqZmhVQUdoK3IvTkhDUVRleWFp?=
 =?utf-8?B?YUdqMFhnRWQrNnZuMEJlTTh6MVcvN3BYVHJNSWhDb0pGWTRvU0Q1VFRxRW9I?=
 =?utf-8?B?YnpleURaUUhveUU4c2hJc1dIYXRXNEtFNER3ZE5ROWsvenFWOFNWQnVkYlBL?=
 =?utf-8?B?K3h4OHNRdXdTcURuZUlITktOK0NTeGhDcGQwdVBQVHdCdXRuWWRXZExBd3h2?=
 =?utf-8?B?eWd5UTR0NEx0NjgvYVZwcDA2akpDVnJuZ3FMS0NPRHZPYXd1SUVvWGtqbXdh?=
 =?utf-8?B?MytIb0FQVmRZb0lzQ1oyT2w5dmROOTFFMk9pSk9SSjA0VUdhcVFqdUVxek92?=
 =?utf-8?B?RE5LZVpwZHlBWThuUHNycloyZjE3Y3JmOTlsNHo0WnV6MVFwUlUrZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f36a6d-4b58-4eee-68e6-08de51bf2481
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:44:12.7457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cn4MlLhX73PzNMwaETJaRpKFbqqJJ/lZTsEhHXh9dlqomXUdkWHjelBVGoP03Ns3pKJAiO1hEMAYd+WR4UuHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
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



On 1/12/26 17:31, Francesco Dolcini wrote:
> Hello Liu,

Hello Francesco,

> 
> On Tue, Mar 04, 2025 at 06:15:25PM +0800, Liu Ying wrote:
>> This patch series aims to add DPI color encoder support as a simple DRM
>> bridge.  A DPI color encoder simply converts input DPI color coding to
>> output DPI color coding, like Adafruit Kippah DPI hat[1] which converts
>> input 18-bit pixel data to 24-bit pixel data(with 2 low padding bits in
>> every color component though).  A real use case is that NXP i.MX93 11x11
>> EVK[2] and i.MX93 9x9 QSB[3] boards may connect a 24-bit DPI panel through
>> the Adafruit Kippah DPI hat.  The display pipeline is
>>
>> i.MX93 LCDIF display controller(RGB888) ->
>> i.MX93 parallel display format configuration(RGB666) ->
>> on-board Raspiberry Pi compatible interface(RPi)(RGB666) ->
>> Adafruit Kippah DPI hat(RGB888 with 2 low padding bits in color components) ->
>> 24-bit "ontat,kd50g21-40nt-a1" DPI panel
> 
> 
> Any update/progress/plan on this patch series?

It seems that neither Rob nor Maxime likes the whole idea of this bridge.
So I don't have any plan to proceed with this patch series.

> 
> Thanks,
> Francesco
> 

-- 
Regards,
Liu Ying
