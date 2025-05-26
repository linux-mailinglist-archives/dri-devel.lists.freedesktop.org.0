Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CEAC4116
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 16:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB1D10E30A;
	Mon, 26 May 2025 14:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c9jjjkxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B119E10E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 14:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhagqhXTrS1qJvyWr5pC533T6mMNJEwPyd7x258QiwhNZZTXGn66DHSuL4DGRGh8cRkYkzhiCmovFkkHk5f1wOVWzlKnKdi9ai3qfbZ2b9oX68nSrjR549Z1g42+z+XRzcK6+qxA+cyhJeiNJsUJihzgJm9r2h3tjFoyC7u+d1Gys1WwSxQnAbmSqNKCB2pGgwZW64BLk5Ocv5h+oscydKFlyreJIMYpkYcL5yEc9cJK/O0ms4oY/BcNHLcIYLczG5kwqBpba7b9MC6gRDwY5tHY1lO8OE5zJK/c7Rc8KPzjMYmAKoxZkPE8yS346yKkCH7MbDvaQdeXV9a1AeUV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0wiZIEy3a7306QTfQ5xXCVqHInsjT8WxLfIvZTrFuQ=;
 b=Ngv8N+9DsCmYbuOvT/tAkmNh0U5FadCVE+8TN0r0QsucIPSYUSvFJJlk4P0oBkORVM+U0zxBiqP7pJ9dwF7WOoKoFkaYg5K9qle3nGN3pNLNn+YWTkIKf4tuJfN5fdnLjODv9HIoWfY3hDSwhvKY5uuItw7jVbM4/ndTxyVCJ1Vncs9pBqGNcGo9wIWXyy2Uz1X0pByy70i8GHoTUdFSun+ekx5uQTAj2hZ2I5JCpA0WdM226hHnkWxKMwq51KFlowu9d89mKYGfcnNZguIszfox3YZhLzqm3fi/rMfrx1ZLvXkNnzczOAToq+XG/s1tftUJ+USnO64zfKnQrdu5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0wiZIEy3a7306QTfQ5xXCVqHInsjT8WxLfIvZTrFuQ=;
 b=c9jjjkxLlIm1VI2/8iFAKS7XW9mlB1HpZypWTaxWPRfOc5z39q+G1YYwXA5xcbMATQfGVn7Fys3RRGcLNLYYjHuwzDKcy2lrXgGzEXCMwCEtIsx+tvyshKwjEXJu5SQgVLHrLjV0V84FP8tKjrWezkFsSU6h8R5PRgSewu4KjU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9349.jpnprd01.prod.outlook.com (2603:1096:604:1ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 14:13:42 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 14:13:35 +0000
Message-ID: <d695e04c-b2f1-41ff-8510-33529bf5f916@bp.renesas.com>
Date: Mon, 26 May 2025 16:13:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Adam Ford <aford173@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
 <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
 <aec5d09f-248b-4dcc-8536-89b4b9d47e9c@bp.renesas.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <aec5d09f-248b-4dcc-8536-89b4b9d47e9c@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::11) To TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3d6810-1f88-4262-d221-08dd9c5f80a9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzJiK0JGOGxnQnkxbWJkc0lXU2R1MDVtNUt0WFNxcndNeGoxdloyK1FRN3hX?=
 =?utf-8?B?S0cwUEs1SWcrbGxoVUlvSUJSb0dReFVoRG1jMnJ0KzhUS21aajYvM0pLL1I1?=
 =?utf-8?B?UngxdlhlUDF6azZ0RjNOWnhsVmRwbEdGYVdKN3NDc3dwNHhXWlB2YVJnV2FV?=
 =?utf-8?B?N2svOU4yRmR0VGVrdTEwN2gxemFldHhobU5yMnZxbDJQTG5hdUdkQnpXYkJM?=
 =?utf-8?B?NlJORElkVVY1NnhEbENpVFFBTktiTXVjeFNES1lXQm4xVEtBU0FsT1phelY4?=
 =?utf-8?B?T1ZVczh1RVY3NHU5NWp5cjdFQjArWGlCOXp2N2VTREp3SnUyMHJaeWNqOUMv?=
 =?utf-8?B?NTE2MjU4R05Rdk9LaktOUVlNSGhKS2Y3S3V5V2VoY1JHNEJYMGdzMjZTcjZF?=
 =?utf-8?B?eDBZWGhKOElsV0RpMHhTcE5GRklPdTdicy9XbWFyUElEM2xyS081NlpHbU1y?=
 =?utf-8?B?ckhPWUtMWXdBTU0zY3I2OEJ5d3I2RTJVVlBPOXdNcEdyS0dZVTBjeXArTVdL?=
 =?utf-8?B?S0wxdURCZjFJUml5UUI4NFJBT1dBQnhDVW9pNDhrQlFrd1FXT09QK25pRkJu?=
 =?utf-8?B?c2tURVk1cEdRQTFNaFJocDBJSjhIdCtLUEUwSUdUcHQzSDZBMHpRam80dnU1?=
 =?utf-8?B?U2EwT1MraWFyUTVQemtyUWRtYzhJZWtJbTliaEpJK3RBcW4yZ1ZxaldHanE4?=
 =?utf-8?B?dnhTSEMwSVJEZWZoT01KcEZxZjFoZXBvZUxidFNFbWltR3FCbFcrMlFvZGRw?=
 =?utf-8?B?VnY1U2N2QVd2ZEhBNDdGMS9Xc1hVZHFrR2RqUXVXVXNRSjZUZHNpdDdWd2li?=
 =?utf-8?B?ZjUwWisvZTRDTVVLMGxwa0JRV3JyNkdoTFJpTktRTm4yRTMwVC9KaHphWURH?=
 =?utf-8?B?YWhqWDNydWM3cnRMWXVhNG54MW1sKzJjWEd4WmdBempxM2FDVFhmWmRyZTA3?=
 =?utf-8?B?MFJnU0Fab0FsRUFIV3Z5WG9CUzQ0U3V1NWhaZ2lBK2puM2pZa2traXUzMWts?=
 =?utf-8?B?WHY1b0w4UngxWDJkek5xMzE0cDJFdTdhNWhUTk9sMElXVnJtZGRFdnNCL1ZS?=
 =?utf-8?B?Sm1tSFBDN3l2SGFZOGRQUmpXcDBVSk1EZmh0SmJJeTRabjVUNXB3YmtDRlV3?=
 =?utf-8?B?K3NHWXJrWWxYREZpL2F4N3lrcThHcEZSa2ExY0VKc3FZcC9HcDh2VG94VEEx?=
 =?utf-8?B?MUtqdUl6aFZ1UE5EaUR1cHBOYzFDM3ZpT3VZTXYyWkpmb1loTXd2ZWFZanpC?=
 =?utf-8?B?dlMwd2lsQzR4ZXVZYVhCcDJ1THF0dzVKTTJtMzR6eCszTmxzMWgrc1FQcC9X?=
 =?utf-8?B?N0tWa0J6VUxsa2h2MUpuOVRHbWFYS25WRlg4ZzVuVjd0aU5nQ3JmUU5EYkM4?=
 =?utf-8?B?WnhRK040RGNnVEFENzRmSW9aa3lBM2JiZUp0VUhTaVA3eEZDeUF2S0JwUnVs?=
 =?utf-8?B?eWcya3h3Q0YzZUNna3JORjhhNmVqK2lxaytGZGlBUGZWVUE3bkRhL2NDMW91?=
 =?utf-8?B?dXd1aUxSajRqamtZa01pR2NXK3dNVk81Rlp5a1l0Tk9tQ1VaeW1OTE10MWw3?=
 =?utf-8?B?QUdveW9hcTdjMmJLZEpCMGF5dDhWQ2FqYUt5Y1lUOGZIVmROc2pZcGdvY1Yw?=
 =?utf-8?B?YzRGQXNYMjRQTVJQYXdlbjh4RXh1SFhUeDNBcjFnM2lnYWk1V1FqeUlNNWRp?=
 =?utf-8?B?ZDdnYlEwb0MvZjA3SzArUEp0SGZCbnRoRUV2cURYb0VtYVdoYk9MZUNTRGdI?=
 =?utf-8?B?UHpvYkFxdWJidCtobjRZQ01PUXJhajltWGhTTTkvVnM4WHcvY1RFSlJ1eGV0?=
 =?utf-8?B?MDlpZDJXSkUweU1tUVR0OFZzQW9hNjdUZm4vOHp2dUJQbzNzYlJlcWhDUFdB?=
 =?utf-8?B?enNRZEJqdVpEK0NXQ01uUUxSdlZyR1BOODhpQW9LWHVBY1QxWkNrMDlsNWh6?=
 =?utf-8?Q?vRt8eV13vPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdyZlRpL0N0YnFrclFhMVlJYnpVTmJmeTAvY1dNZ1VtcXg4MmdrNExOSXZ4?=
 =?utf-8?B?QTBIc01aNlJXMzlwV3BpczVHNE9FSDJqN2tQSUpkY3dMemQxMUtyMWhrT0Ur?=
 =?utf-8?B?ZDZSbFlXZlVaSGx0bnphTmw5UWtXRGhsS1FLa2RXc3N0SmRDdFNWM1NSUUdI?=
 =?utf-8?B?NTZHbE43MmJ3YXZ4em1uMzdUTEVibDF1ajFZWFJiU2VKZ1paWkw4VWN5TXp0?=
 =?utf-8?B?b09DNFBiOGErdHQwalB3VldxUW8wcmt1Rjl2S3Q2ZDZQcjBGVTFUOFZCUjZw?=
 =?utf-8?B?QW1JbW85Y1B6Ym5qNDRmWFdNWGRhRFlPYkdCMEZ3bTRuS3V4dmdXM1lJSnRS?=
 =?utf-8?B?T3p3VWh6SVlwNDk0d0tuTWt4eEdIZng1WVU4a2VVN01GcEhpb1puSFc5VGQx?=
 =?utf-8?B?alY0b2RhQVFTRGh4UWdiVzRjRFJkeFU1NGk2eitTOVp0SkxYQUhLN21PUGdv?=
 =?utf-8?B?R1hJazVwZzljZVBWUXhFSmU0Q2s0djVzUTlGWlFwalhMcDZJNE93M0I1ZnJw?=
 =?utf-8?B?Rm00MlNKTXV2dWNUT0Z1R3czMW5uRUxpbUVkczlZSGFtOEJiTnZmUlcxL1oz?=
 =?utf-8?B?ZXc2cmZ0SVduamhZQWlGRmw1WlhNVldrUEJNdWI5L005WVlZUEJ2bkpTa1p6?=
 =?utf-8?B?NllCVkZ1VXh5YlgzZHBDZmdGbEhzU1ZleVp0dEg0MG9tY0p2MHhaUWE5R0gx?=
 =?utf-8?B?cVZaVTl3THZzQnJWSms0N2NocmZPcDBDeEc4MTVXbE51ZHJ4VitZNE9xbzJx?=
 =?utf-8?B?TGk2QnAzc2tDZEEvR0ppVVRsVm5pTWYxcnhnVUtDY05Fd0EwWUNVQjliZTNm?=
 =?utf-8?B?VFZ6SDYySy9TTzk0cFVnVmYrcCtsSVBNUXFSczVGSXRDc2hqQnBOZ2d4M0tn?=
 =?utf-8?B?Z2Q3d1VMdm1OTjNnejNYTVo1Z1NtOEtsMlJyOFN6V3ZIdXc1Z1BPdHJaUTVQ?=
 =?utf-8?B?S1I4SHpMZ1A1UlNuTkU3QTk5c3J3SzJaY0VFbHFRaVJ6MmxtSGhpN05QNHZX?=
 =?utf-8?B?Y0xqdTlpRDFtYTdlYWJVNnVROFl1cFVTYUtLNEFXN0VhOE9PdjBVOVNiOEoz?=
 =?utf-8?B?MU4yZGFEcVpJeWxZQVJLVmwxbjVtQkJacFFxeHZPRGpxUzNSRVJEdXp6TXdY?=
 =?utf-8?B?N0krb2RQVnNMeTRkSWN2cmt0YitOQVgza2lSTmJDVGUyV3poS09ZTEpxNkZK?=
 =?utf-8?B?S1VjTVFVRFl4MjI0OGFxWkVnWHRWWHAzRXgwZER2T1B5YS9QdDZZUUR4SUhV?=
 =?utf-8?B?OXM1ZkYyemhjWWNDUG5mMGNqZ3hLU3BBYmxCaXR5RHhvWW9abjFKZTR2Tmtt?=
 =?utf-8?B?TUFNWlJETWpJMjZTcWdHaXJodDJqMVEyQkVWajVKc2xuK2p6eWlkalZtTUxq?=
 =?utf-8?B?c3g0djBBTE5xUk93OWdCQ3BSblp1aHl6UVlNZ1dVWmM1SHZzNldhR094UHl1?=
 =?utf-8?B?dVlPNW1uczVObElBenJQa0JveTNsUHp3c1JvUU1HeHRHLzdndUNoeEN0NktR?=
 =?utf-8?B?b0V4aG5YUC8xSi9kTms3d2licVpqbWtHaFZEWHJpWDAzd25tUkxoTHhpQUV6?=
 =?utf-8?B?b0NBRUlSSFBDWVB4R2hYeUVGZUFVdkdTLzJmV3RCbmdzT1ozUm8xTmdINTY3?=
 =?utf-8?B?MnVPQ0RaU2dObjJHK0VFL0JQaEFiV0dBQWlkbmF0NG16c1Q3bWdBdUNTOGt6?=
 =?utf-8?B?SmVISW1uM2lvcTVwcHJWZnhsY05vanFtdG9vazhYeTAydnkreG5KdStiYlNi?=
 =?utf-8?B?bEVoY3Q3cDUxZytlYWNrSUw0NEFWS1dtWFRKaUNiUzZaN1NWTXkrdTVVc0RR?=
 =?utf-8?B?TFkwVksrT01WV0JPcXhZNkwwdDlSUjZqUFM5SnZHMnpaL1UycjZjNmZXWjFW?=
 =?utf-8?B?TTQvbHpOcVZZZnlrSDJKVUZjdjJVNjE1UXVJeS8wQjVZTVJxYnRtKzJWanN1?=
 =?utf-8?B?V1hNQWdEcThvbWhNc3hkS0ZYTi85ZkpNOEYwc1NDZndybDFWWDFXS0hSS0Jt?=
 =?utf-8?B?aW5ET0pVZC81RGZseEYwK0cyLytPTVpLU2dROFpTcE04WUhyNkhpeXFlWnBS?=
 =?utf-8?B?aXNBcEpHeG1PdDNueityVnVKb0FHV3dYSmFhMGJNbjhEdGs2TmdGU1NmdGpP?=
 =?utf-8?B?N2w3RXBwdTBsMzhqRkFnTmxVbmZpNU5xaXJ1cmdTWi9mU2V5WkZIMk1kRm1w?=
 =?utf-8?Q?x3/Yeb2fYbfMp5K081DpZCY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3d6810-1f88-4262-d221-08dd9c5f80a9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13941.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:13:35.5504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR78WcdP/bAFRdAwb6lWtUNexG1shwTrY7mjzz4r6RrMTkjz1FZIHt0Nsy80Znc0dSMFjHAh7BPeKGuJI9h8yMHq8Ge61pVjZ+6LWgF+2vrIQg+A7kC2tvkF8zRuxCNI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9349
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



On 26/05/25 16:02, Tommaso Merciai wrote:
> Hi All,
> Thanks for your comments.
> 
> On 26/05/25 15:18, Dmitry Baryshkov wrote:
>> On 26/05/2025 14:40, Maxime Ripard wrote:
>>> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
>>>> Hi Laurent,
>>>> Thanks for your comment.
>>>>
>>>> On 26/05/25 12:49, Laurent Pinchart wrote:
>>>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>>>>>> Hi Maxime,
>>>>>> Thanks for your comment.
>>>>>>
>>>>>> On 26/05/25 11:26, Maxime Ripard wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>>>>>>>> native resolution is working when using modetest.
>>>>>>>>
>>>>>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
>>>>>>>> merged into .atomic_enable().
>>>>>>>>
>>>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>>>>>> drm_bridge_funcs to restore correct behavior.
>>>>>>>>
>>>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI 
>>>>>>>> connector helpers")
>>>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>>>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>>>
>>>>>>> Explaining why, both in the commit log and the comments, would be 
>>>>>>> nice.
>>>>>>> Because I can't think of any good reason it just can't work for that
>>>>>>> bridge.
>>>>>>
>>>>>> Sorry, let me clarify and share with you some details:
>>>>>>
>>>>>> adv7511_mode_set:
>>>>>>     - Is setting up timings registers for the DSI2HDMI bridge in 
>>>>>> our case
>>>>>>       we are using ADV7535 bridge.
>>>>>>
>>>>>> rzg2l_mipi_dsi_atomic_enable:
>>>>>>     - Is setting up the vclock for the DSI ip
>>>>>>
>>>>>> Testing new/old implementation a bit we found the following:
>>>>>>
>>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI- 
>>>>>> A-1:800x600-56.25@XR24
>>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>>>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>>
>>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI- 
>>>>>> A-1:800x600-56.25@XR24
>>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>>>>>
>>>>>> Same result but different timing (in function call perspective):
>>>>>>
>>>>>>     - old: adv7511_mode_set() is call before 
>>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>>     - new: adv7511_mode_set() is call after 
>>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>
>>>>> What is "old" and "new" here ? Is it before and after Dmitry's 
>>>>> patch, or
>>>>> before and after yours ? Please be precise when describing problems.
>>>>
>>>> Sorry, you are completely right:
>>>>
>>>>   - old --> before Dmitry's patch
>>>>   - new --> after Dmitry's patch
>>>>
>>>>>
>>>>>> What do you think? Thanks in advance.
>>>>>
>>>>> You're only explaining above what the "old" and "new" behaviours are,
>>>>> and claiming one of them is causing an issue, but you're not 
>>>>> explaining
>>>>> *why* it causes an issue. That's what your commit message is 
>>>>> expected to
>>>>> detail.
>>>>>
>>>>
>>>> Thanks for the clarification! :)
>>>> I will send v2 explaining better this.
>>>
>>> In particular, if the driver needs to have mode_set called before
>>> atomic_enable, you should say why moving the call to mode_set earlier in
>>> the function wouldn't work.
>>
>> It might be the same thing as we had on PS8640: it had to be brought 
>> up before the host starts the DSI link, so that there is no clock 
>> input on the DSI clock lane.
>>
> 
> Some updates on my side:
> 
> I'm not seeing any differences from a regs perspective when using the 
> old driver version (before Dmitry's patch) and the new driver version 
> (after Dmitry's patch).
> 
> In particular, i2cdump -f -y 7 0x4c shows me the same result.

Please ignore this (wrong address)

The right test is: i2cdump -f -y 7 0x3d

And I'm seeing the following differences:

# WORK:
reg | val
0x3d → 0x00
0x3e → 0x00

# DON't WORK
reg | val
0x3d → 0x10
0x3e → 0x40

Thanks & Regards,
Tommaso


> 
> Unfortunately, since I don't have the ADV7535 datasheet, I believe this 
> issue may be related to the functions call sequence.
> 
> I agree with Dmitry's theory.
> 
> Let me gently know if you need some more test on my side. Thanks in 
> advance.
> 
> Regards,
> Tommaso
> 
> 
> 
> 
> 
> 
> 
> 

