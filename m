Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E55939E33
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625210E539;
	Tue, 23 Jul 2024 09:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z2qrl5yG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013062.outbound.protection.outlook.com [52.101.67.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B775F10E539
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpjvEEFHO1zoCeG5YMZ9L6kz5txsjO3aks/FyxLmh78myc30wSkm62vc2Ct9bk8ScN2fI6VmfN9AglcOe7xVuDGOsDf83FnMltTGMqZJRcAFdsklK1hlbRIYIbSkn8KJYeiES8VltwS9PaidzQ8bsg0QC25x+1EzhUKhwbmwHxGpRQmjz/V/k3GkVrp0MTP0RhZGc94gtLKVUEoA/YJx6OUPyIWFyvI79re9fH+S35bIwWFLWh7+7Rn5WYt0VHuMvubzYIQtnXrVJunmbuNV9v6aIB/RnIAKVmlZColvC8sPogZwKDp2+doOywWkQI6ScGuR4nAR5ZuSvQDUyfyKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPPNh0CIuIc1+XX1YQ9hVZcJp6s7lBSIg5tKyLU/9Yw=;
 b=lmv/7/tAUrTARD1Jx1r9CnCc9A2ts3e7ATFbLOolRIH9hQu62Yh+a58B7Nrdrob1Z7p1xyfv6+0vgkI7BZn37pD+hlnBUlLTeheSrhmwaucjFpK6vmivKoIMnPk/fBh3ntc2HM4K5kigo2KJtSfhUK9NdNQFJ8e9z0aHzZKuIEFtxFMduGpmxsQaNB+yOpvs8IZxLV5fJHpf4kHQNFuzEgr6mUy4sJYkd/ya3viGTh/vG/BD6kiFx3oyHnCrpq+4hQNsp40UbZuvMkJKt9LXpSqFwo+4CWG93i5ubEVoQUDl7NnFhH0dwrT2o522oOA80MJO2YUf4UzNnqaHqOmqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPPNh0CIuIc1+XX1YQ9hVZcJp6s7lBSIg5tKyLU/9Yw=;
 b=Z2qrl5yGFIcQYnOVgZuoNZ6+hAge9db7V1+ltCNW19Xyq9C9lPk6xfLgmg5NHY4ejoatM5YILBi/WObzVjphAzYJexmOd+/UT9rT9+15ANT2e+BvijUE64xduIAoeEP/mLYdIVsKXAKUpRR8fmayttisY5y85lb0qfkfwKaB2B4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9830.eurprd04.prod.outlook.com (2603:10a6:150:113::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 09:48:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 09:48:46 +0000
Message-ID: <442c51f3-f675-4599-a0a3-654c0a4b756f@nxp.com>
Date: Tue, 23 Jul 2024 17:49:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dt-bindings: display: imx: Add some i.MX8qxp
 Display Controller processing units
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-2-victor.liu@nxp.com>
 <20240722223814.GA183822-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240722223814.GA183822-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c492439-bf07-4731-86ed-08dcaafca569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU13V2VKbEZPNUREaEJHbEN1a0F5eDYvMi94K2tWVDFMN0NEYTc4S2llbHM0?=
 =?utf-8?B?M0xyWXdMdElVQkkxTWhHaGd2OXJEcHJONmlQb09mRTBjbUZJcDZ1NnArNU82?=
 =?utf-8?B?OFdHYktOTUhIWEFpejd4cjM5ZEs3WFZKTzN1TjZmVEN4WWYxTFZyVit5U0dH?=
 =?utf-8?B?TXcrbVl1dlNrUVIvakhWVjhoanFsVVc4NENMRks3RGJ4UnhJRU1ZQWx3emoz?=
 =?utf-8?B?eXNnOGJJUVFacVh0WEVOSU9IMFVNM1ZUK09MUnI3T3JBUUdLcG1yNUJGbk12?=
 =?utf-8?B?WG1iV3k0NWFESUtZRjJ2OGZPREZEMGRoTUZBYmxoOU1jdUIvREUwZDU1aE5r?=
 =?utf-8?B?SG1aKzVJMkMwQTlONWEvcXREanBSYlE0anlkWkJBdENzRmJIaWlONFM2aVBv?=
 =?utf-8?B?cEtRN1JxRmlNLy9jQ04xT2o2ZjRRaEdRWEgzZ3JqSE1KbFM2aE1STkxMc2dI?=
 =?utf-8?B?Zm4xMWRpVmRWQ1pDcHBBd3I0Ni9talhlTHpOUHhYT0dsK211d0pNTUpuMllR?=
 =?utf-8?B?aVMzeVEzc2JWVVdGSmRxNTcyRFlkVEUra1Exa3Q2KzhpZkVHNWdjMml6T3FT?=
 =?utf-8?B?ZHhtaXJ2REc0MzVqWVZHVkIyVUVaa3YvT0VZOHVaZ1U1M1lTc2p2ZlhvRGx6?=
 =?utf-8?B?UTFOVi9tU0t1Z0c4UFB3ayttdlRKZGZxMFB0dng3NGpKWGRFK3NqaFk5RFh2?=
 =?utf-8?B?WW0wWG1wWmFmVVFoVFJuNm9YVG9najJST2xwRzFQS1Jha2lXeGN6Qk9EL29x?=
 =?utf-8?B?dVh2RE84RGh2ellEaXExS2s0aTZQNmxwU3VkSkNEVVZGUTZ1YzNPemRyY3Zv?=
 =?utf-8?B?TmZGZ1pRNHljVzJGSXN3Um1kRHkxQ1lML0MrYzRuOEtBYlVjQjUxamVtYWdn?=
 =?utf-8?B?ZHJrMGRRY0FUbldzdFVDSm85TnNNOHIvbWxnOUpsMUs5elFzdTdYUkY3Z0Rx?=
 =?utf-8?B?cWluRk54c3QyL2pCTDJTSkpDWGR0ZUk4d2FMZ3ZWUzl2aElpUDBIOXRTR1Qz?=
 =?utf-8?B?Rmd0SFQwamRkUldFTXNwSTBnWFpjMndVcmJuWmVGTEpLQUR3NUNmeGpNS2xp?=
 =?utf-8?B?RWNoQ1I1R3IwQ2ttc09RR0ZtVE0vRS9hMEFOWHNDTkZzN1pzYTNjazBQTXBm?=
 =?utf-8?B?cGZVREwvbUV2LzJmMWY3Nnhiclk3UmZPb0xERVNkSnJrSkdnNDlwVEswcUlp?=
 =?utf-8?B?d1ErbXdtSXpyVDRPNFlXUC9WSjhFa050WkdXbGhLbDZWeG1KY2tIL2JkTERW?=
 =?utf-8?B?VlRud0hXVVN5OCtrOWVqWndmOGNkRSt1SkR4bG85QmVzb3p6K056QmthMzl0?=
 =?utf-8?B?ZUZMc0N3Y2ptSEdoejlWVC9JQnN2N0Fib2l1OG9mNXdVb054MmNlSmRWTWg4?=
 =?utf-8?B?d1J6QmpCeHFxVXhCa0kwL2UxY2FyUHEwY2ZiMjFwZkJPaGZhMW1objNMUy9w?=
 =?utf-8?B?Rnh1QkFlaXBKVGpxTkVGaHVKaENmUmcrRkhzUFFBaUZhMWdRU0xldHJ5cW1F?=
 =?utf-8?B?c1BzTGN2YmJ0SFBFSEltNTJ4WmJoU1I3dVhsZ2lYd0x4S0pxUjM2QzhIZnBJ?=
 =?utf-8?B?TkhLUDdTRnh3dlFKZ2o1Sy9kYUU1ZjRqK2l4MzV5MWNIRldJQ3pYd2YyWmUy?=
 =?utf-8?B?SmhtWU5QUVI3K0FKeXJJUklZUlFzeTRzd1lLTHVyVWJVTkJYcUloc21vWDlJ?=
 =?utf-8?B?MnVqamJHc2ZSVlpiRTZIb1pYbXJWNXRJUVQ0YkJuS2Zna1FodGd4L0phaU0r?=
 =?utf-8?Q?yl19wcntUUL1y+xydo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnJlR1VLbFFDNG9MU094c1hlZ09uazZ5eTRPVTVWWW9uZFdyK3k3NFJpZnFy?=
 =?utf-8?B?UWpPQ09yMTEwRjllT05WTkIwaktyMllUSWd6dldYOXRhaFhya0VzaXErbXha?=
 =?utf-8?B?Ykk3Sk50MGt2MkZWbld2UEJrbEJZbHZSQnNjbklZZFNIY29GNytmcVdVYmJJ?=
 =?utf-8?B?R2hxdjlnSmZERHBMbVo5alFxeENJM1RuSGtiMGdHeEZYaW44Nkp1OHV1cnkz?=
 =?utf-8?B?TkNPVnpGWUdlcGpWNkcwS0NyL1FERlRHemJRTU5zcUJHTkMvQ0RESjRUL0xV?=
 =?utf-8?B?Ykp1NFBXb3hMWjg3VkJENThQS21MSkZlMFRqVnVoalhobXgzem1QYU13a1Q2?=
 =?utf-8?B?Nm9icnRoT1ZtbC84NThOeDRPUkZjMnZHaWJ2aU5tWjBTcUdyc0w5VzJBc1VY?=
 =?utf-8?B?amxDYmEzQlh3RWRsK1lLenVGd0d4cjRPcnp2TDNwOXFJQjlkbmJkK2ZCWHB4?=
 =?utf-8?B?bjJ6c2puZ3lScGdGL2ZVN2tHRlFoYjQxaFNiTUYzeHdaK3JiQlBvY2NCU1dJ?=
 =?utf-8?B?Y29aQnowRHU3UDRxQk9yLzVFWmN3MzQ1bUNWcFBKZ1BHYkFpNEp4VS9ESHFE?=
 =?utf-8?B?WGFQWmxsSzEwUCtKSmoxd013UXZSSmRMRFBhWjNNaEFOb3ppaHJpMVFzRmNG?=
 =?utf-8?B?aTd4NEhSaXJaKzFuS2FtV0RzckZ5REhWSVVzOVdlQXp0ajFWOGUvSFF5WkVY?=
 =?utf-8?B?TFdJOHF2b2hwNFdURU5qbWVnSDlUVnhZS2FuSEJINzkxU2YyU2VrM2Jpc1lp?=
 =?utf-8?B?bzJSWUR1cUdVN0FDbzdabGZMWEpGa0VIc2ZTWExXaE1yYUV1SVdUczIrczlI?=
 =?utf-8?B?QlNzTitWV2JhZXlHM2NzL0xTbTFRRHhsMlhrWVdDbkkwR3JscCt4SUtXK24y?=
 =?utf-8?B?aEVMRGFodnNkM1RpTVJwSzFWa1pjcXVEa3MxZUVnOWYzZ2NZaEpMVmFROFdW?=
 =?utf-8?B?VExpeTBYZWRUUm9XR0NSRUlOd1gvWEl3SzdsSzZoTDF0TDdCQ3NZMEpJYnpx?=
 =?utf-8?B?QVB4OGlmSUlHdTI2U0pGSFRFNkcyTkpJTVZ2RkdybnMxTC82Q3VRbVk0bXNU?=
 =?utf-8?B?dDVXSGhKWGJsN1pqM29MYXI3TVRVNVFMWUV4cmlOY0lPOUlYaDNxSERhMGJ4?=
 =?utf-8?B?c1U1SnhGcERXL1YzZVNpcWwwSDNQaXNuVTJHWUlyY0tqZ1RCdmZVY0w0aysx?=
 =?utf-8?B?eFZLc1Z1UU5iRk9TUkFEM013aXF4MEx2am03MUNRVlJkZWVEdTM2VWU5L053?=
 =?utf-8?B?aUNuTnBPaEh6d2Y0L0lJQTlpajROWXhuR1Y2d2ErY3RNcHc4M2p4dG1mMGl2?=
 =?utf-8?B?bFlFcXVQOTVaOFVqcUJhZGFQMnVsNDlQMGEzTXlKUXpSUG10Yk9hQlpuNEND?=
 =?utf-8?B?dmp4bDJ3MkNybi9tTHU3bDk4YWhGKzkrWm92b3NiNGJ2ZjhHbnlDZjM3cFZa?=
 =?utf-8?B?QlBaMFdDcmdZVTFCeFZDd1drZXN5N3V4OGsra2lWTmVmT203SEtCK0RZaUhU?=
 =?utf-8?B?UFJaUFJmY3IyWURJdG5VVE00dmpiYTJxelN1VHgvVkJDZWpwZzBwM3d5WDNH?=
 =?utf-8?B?cE5ZbitUWk5WcDVOWnVmNlU0Q0VmdzVWdVlUa3JoQjQ1a3NhZkRUT3ZSMFh6?=
 =?utf-8?B?N3pRSGhmdUZlNlJEWDZ0VDkwNE9hemR5ay9YbzdmRW9QS2ErbGlNMldVbFdG?=
 =?utf-8?B?azhsWDR4a2IwNXRycGlhNFlkV0lVck1RS1V2SFFEMVR2V21lN056OWlKZ0Za?=
 =?utf-8?B?em1lNmx2eGhGVC9jZ0Y4OVM1ck4zbWxWVG1abDVQSjNyWW5TOHdvV1paMjVS?=
 =?utf-8?B?RlhlZzJyU3pYWi9EaDZ0MGMvWWxhY3R3MWZJWVBiSHF0ZGIyTzlQRTB4a1ZO?=
 =?utf-8?B?Mm9GblFVMXlxVzZxUkFIcytJNWo2N3hDNVJSVXFQaFB5NU8xWHdOdUpad0pJ?=
 =?utf-8?B?YzhFZERaKzBXdlE0eFVFM3pIUldEZ3Y5N1N3S29wQU14MU1XN1c0LzNDVVFS?=
 =?utf-8?B?RVo0bjI0d3JaamJMRitwZlVTQXZEaU5jSGw5OFZWdmVvdE11cm5BaHFSRWxV?=
 =?utf-8?B?b25qS29PYUUzSGhvSUM2alVDaWdSTFVmeTlSOTYyUEV3anRRN2FaQlJBMEY3?=
 =?utf-8?Q?tt5Gxhjj7Fvmz1iUdUEWHJYfo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c492439-bf07-4731-86ed-08dcaafca569
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:48:46.5068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyxOh1i93rSAN/2V4SWJunR9RTy5AJcjoh281MWDkLoJIGKCnPdqqA3o6zd4ahmpuBb96u3u/wbuKzhD8Flt5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9830
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

On 07/23/2024, Rob Herring wrote:
> On Fri, Jul 12, 2024 at 05:32:28PM +0800, Liu Ying wrote:
>> Freescale i.MX8qxp Display Controller is implemented as construction set of
>> building blocks with unified concept and standardized interfaces.
>>
>> Document some processing units to support two display outputs.
>>
>> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend processing units
>> are in pixel engine.  FrameGen and TCon processing units are in display
>> engine.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v2:
>> * Drop fsl,dc-*-id DT properties. (Krzysztof)
>> * Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
>> * Fix register range sizes in examples.
>>
>>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 ++++++++++
>>  .../imx/fsl,imx8qxp-dc-fetchlayer.yaml        |  30 +++++
>>  .../imx/fsl,imx8qxp-dc-fetchunit-common.yaml  | 125 ++++++++++++++++++
>>  .../display/imx/fsl,imx8qxp-dc-fetchwarp.yaml |  30 +++++
>>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 +++++++++
>>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 +++++++
>>  8 files changed, 449 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>> new file mode 100644
>> index 000000000000..94f678563608
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller Constant Frame
>> +
>> +description: |
>> +  The Constant Frame unit is used instead of a Fetch unit where generation of
>> +  constant color frames only is sufficient. This is the case for the background
>> +  planes of content and safety streams in a Display Controller.
>> +
>> +  The color can be setup to any RGBA value.
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc-constframe
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: pec
>> +      - const: cfg
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    constframe@56180960 {
>> +        compatible = "fsl,imx8qxp-dc-constframe";
>> +        reg = <0x56180960 0xc>, <0x56184400 0x20>;
>> +        reg-names = "pec", "cfg";
>> +    };
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>> new file mode 100644
>> index 000000000000..dfc2d4f94f8e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller External Destination Interface
>> +
>> +description: |
>> +  The External Destination unit is the interface between the internal pixel
>> +  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
>> +  and a Display Engine.
>> +
>> +  It comprises the following built-in Gamma apply function.
>> +
>> +  +------X-----------------------+
>> +  |      |          ExtDst Unit  |
>> +  |      V                       |
>> +  |  +-------+                   |
>> +  |  | Gamma |                   |
>> +  |  +-------+                   |
>> +  |      |                       |
>> +  |      V                       +
>> +  +------X-----------------------+
>> +
>> +  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
>> +  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
>> +  otherwise.
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc-extdst
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: pec
>> +      - const: cfg
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: shdload
>> +      - const: framecomplete
>> +      - const: seqcomplete
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    extdst@56180980 {
>> +        compatible = "fsl,imx8qxp-dc-extdst";
>> +        reg = <0x56180980 0x1c>, <0x56184800 0x28>;
>> +        reg-names = "pec", "cfg";
>> +        interrupt-parent = <&dc0_intc>;
>> +        interrupts = <3>, <4>, <5>;
>> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
>> +    };
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
>> new file mode 100644
>> index 000000000000..804a3ea7419f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
>> @@ -0,0 +1,30 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller Fetchlayer
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +allOf:
>> +  - $ref: fsl,imx8qxp-dc-fetchunit-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc-fetchlayer
> 
> As the fetch units only differ by compatible, combine them and the 
> common schema into 1 schema doc.

Ok, will combine all into fsl,imx8qxp-dc-fetchunit.yaml in v3
if no objections.

> 
> Rob
> 

-- 
Regards,
Liu Ying

