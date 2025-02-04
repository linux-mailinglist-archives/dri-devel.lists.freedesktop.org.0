Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF6A27FB9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 00:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EE110E107;
	Tue,  4 Feb 2025 23:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="gyoueOkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB8E10E2DB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC1NLhi1c8BRIlf7iVPjdd1q8F7NO1oVDJ/413x7T9h/g8WwT9Uj/it+2JvDLOaL0ofRzYdKsYLQyhpHZZPVmn5LecRdkrlP5HYfnEHSR1SPOZyNMbG07WwPa158uFSudusf87s+ODZH494dPFe3Otd0ZVChZYiEFNy2edkVj/h0T6l1jEyv3euevuUWxpNy9YWeA1O41pnM5C1lJvk414F6flecjoIX5F2oaNgHE5hy0DUwNUlWlFV/zCaXTV9bOpBG0atNFdQsPVCtFemgiWnt4/YU28KarvzV11ueSRAnykHDZ1YJ9W+XGyNpqyIJxm4CpOQ1FtVCFl8ekK7y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INao4iY1AKMX3axCoVuPM7vg9v0A4PUEBGQC9APCHvI=;
 b=B7sUrmoSM6+wGMpG0bTiZDNopa8I6HI89TS0YJhFj2S9YGwD808OsafNno/XfnnBBxSQ1DXSf3ug4lpwfUCFrtCBFUCZi2n8ynNQD2BXkXnvZ0uTZBz6nvLjCUGneer5yP/fb22cIFwCZGAgayb4P9VuZR7ytBqOYHBCs4AKx1xbDZTPoGZCYXw6n4ZhOxVwd9Nfzb1/EoAw1Cmr3yCGa+r0MMSZE9UyQOqT0w0Uyl7slo5nl4rjLYl4Q2rsyPqBWgape6MNmuqGNf/8UiWlX5Mi8n3qOeaZLkGKmuQ+866pvhqs3WwS2+cYL69UcAZVPLf9uIqUNFbPVosnGOYjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INao4iY1AKMX3axCoVuPM7vg9v0A4PUEBGQC9APCHvI=;
 b=gyoueOkSSEHIoJb5f3JrelPSXSuDrylyGIu6W0SdjDrkzA6X8QaJaq3wOPDn2H+QhO18MXN9uG6gziK4jlXL9WAtTxCF4lQEgs0kI/g+M8DsglYXvZyfqdgSnAFtzPpJl8X/NCBTJuRXi5oHv+sQiaDA4NBL2ivRj/D21oIdIA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10624.eurprd04.prod.outlook.com (2603:10a6:10:592::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 10:15:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 10:15:50 +0000
Message-ID: <fdf9016e-5bde-4800-bdd6-02e159a63592@cherry.de>
Date: Tue, 4 Feb 2025 11:15:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Enable HDMI0 audio output
 for Rock 5B
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <20250203171925.126309-4-detlev.casanova@collabora.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250203171925.126309-4-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10624:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6a5838-87c4-408e-6204-08dd4504e622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aS9jZ2ErQzJiV2JCK0NKakZKcUc1YnV0NFJSdVpKOFcyMExwQytoVENlaEJE?=
 =?utf-8?B?UnU3ZU9CeXJRUHkza3FPM3lMRHk1emxicnYzSXlMWTdxYlRHcGE5TURkM3Ja?=
 =?utf-8?B?Z09BYWhRUTVhV0M0dEcrVU9GZkRNR09Ca2d2MVpsM05TSTlhajdiVnM0OVM3?=
 =?utf-8?B?UDRwVEd4TVpQZ1BFeTE2eFVHenExRTJCU0hlVDNGNE56cUw3ZjJyb0graGZY?=
 =?utf-8?B?cFFxcGZHL0t2R1hSNUJrUWpnMlNvaFZsNFJFZVJaSUJBL0NZaU9tcnAzWDk5?=
 =?utf-8?B?bmZxNkxtd29OWUVJem5DUmp5VGNPV3N6VmxsWlNMTm9BdHRvUkEzTEtRTVc4?=
 =?utf-8?B?eHpMd2U1RDN1MUowT0xPVlFrRHhNK2Y5eHBLWmM1Y2RKb3lBT1BOWVFSNHl3?=
 =?utf-8?B?bjFJbEtna3N4djlFVXNzaHdnL2w2OGorMklhQm9zSFJhOHVHbk5ya2FwTC85?=
 =?utf-8?B?bjFOa2x4Q3c5TXhESnhSeDRucmNWN0FLUXZ6ZGJ0VUJNOWJBSEluSmpzQnRM?=
 =?utf-8?B?bFVzS2xPcS9JZTJveXRKUCtnMGs0UTdBcGZUOVM4RzBURkJQWmJscXlXdFpa?=
 =?utf-8?B?STBCcU9icWRNL2RQNVNTWGJzdkNyYWRNYVc2TU14VFVjWkFKRUM1K2x1RjFS?=
 =?utf-8?B?N1RBTDNKd2puWklKa3BPc1l0UzZ1M0ExelhYSFRRM1VjamVPamd1TWd3aENr?=
 =?utf-8?B?bnQ4LzgvNXcxNmFST0thRGZaNkJoT1c3dXpNTDR3Y2tEQW1kSWRrQnYra2t1?=
 =?utf-8?B?d3lKajBLS0VuWFFlWlhoYWFNNWRhVTM5TG42a1Bkb1hQUkpURGI2QXNCMmNk?=
 =?utf-8?B?YTJlK0l5QkxVcmVVQ1RSdWowQ1lpU0ltYmlkK3Q0L1hVZG90YkExTDE2b3V5?=
 =?utf-8?B?TjBrM0M2THpEQUhRQkdzZWpzUncxV1NrWjJwV2lSUC91cG1ZNjlvQ01kbWFY?=
 =?utf-8?B?Y1ZwamZVMmk5M2lxdnRmTW1zcjhkUUp0MTc2aUF6UGFpcjZvK2FWL1lhdUxE?=
 =?utf-8?B?N2RjT3p1NGtDUVlnaDVDTFRzSFhBMktZVDZvNW1TSXNzSThrQWJFc3Nka2Vn?=
 =?utf-8?B?djZHUlVtNDd6UllvSEk3RUREcUZHVW5vY1BFL2lUYnZ5dWRRMkE2S0xkWWdH?=
 =?utf-8?B?dnFQWDdVUWRuVHZhWkc2ZGt1K3Q4VzB2QXpObjNEaGxkVHdlazlUem5VL1Fi?=
 =?utf-8?B?T0g2RTBBSnZaTys2YytWSzhiOXlrQ1J4Q3hrNDJPTktqcURMQXRsbmRXbm9L?=
 =?utf-8?B?eXd5eGVmelU5Mng2Z0cvcVVaZ3p6ZVNINElneWQzNElENU83Nyt6Sy9YY0dC?=
 =?utf-8?B?c1RTZmxpL2R6akU1NXEvZjAxQ2lrWkhGSVdpOEJIUWlSRi9meUVBU2RkQmh4?=
 =?utf-8?B?MC8yQ1N3Z0w2dXY1d0xLNXlQSUZ6K1RYSmN5dEpzZ1pLR2d4aXN1SjNQQUNV?=
 =?utf-8?B?SjBYcHBVVTV0d0trQ0xrUWEwNDZmQk1TNmNLWHpucXMwNHR5eVlkMWJUSXZu?=
 =?utf-8?B?U000ZVVkUEMyR2xldVhMbDVxV0w4QjkvbDZRdzAzMEFySnZKN28yQUc1eXB3?=
 =?utf-8?B?ZWY1M0xJOTdGdEc0SkJoYytxdUxmaDJLU0ZFaVVCSmttL1NTbWN5RGxXNExI?=
 =?utf-8?B?dmdhNGY1WHBEbG5jUFYrMlRSMldpaU9wdWo4blcvRUJhVktPNDA0SFFSbXhW?=
 =?utf-8?B?Q3lGcHdsRkhIazBwK285M0o4MTdVV0NVM1hZenM5NzZkb1JsejI1azhobHo0?=
 =?utf-8?B?U3hZbHRUbjZzejFTOVhsaDdVWVl4Q2thRTBNMUNZS2lDeE5aUC85dDB1UGpH?=
 =?utf-8?B?cTY3NnhsdUlxekF2U2JOekpzdVI3MGRSblIrZFF1V3p0M2Y2V0xFanFtbUht?=
 =?utf-8?Q?eyGM+FIm/RK98?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05aRXcvMUpYT1FxQ2VENjVwMC9RYkNZU0lOQUlpWC9WRlJEMDJjY1N5ODhE?=
 =?utf-8?B?NkIvZVgycmRGem9ia3NUUVk2dm0raHltVThpajZFS2xENUN0SE04clJWVjcw?=
 =?utf-8?B?ekZycmx0dFVoUlY4akxOMXBBVWg4cE1TYVhEMXZ0UGF2dXNKaEZZazQyMVVw?=
 =?utf-8?B?KzJDOTJoU2ozSk1mMXJPSjVhRC85WFhub3dlZGVCcGp6Z3N1MXAwaFBpcnBo?=
 =?utf-8?B?bUt5R1pJaXQ5enczVytJWXJtU2JoODM5Vk9mRTVaQnplRU1ua29UZFpiL0R2?=
 =?utf-8?B?dlRZamVnV25CR0NXRS9WWGpKRXUyZHZ3MFNYUFBUcE85N1A3NyszU3FlbmxQ?=
 =?utf-8?B?cFNWTDBRWCtFbWtnOEdhRENtV2FuMERCTG82S2g3YTBsSG5pS1doYXdsQzd4?=
 =?utf-8?B?LzNXbVAzVU91MlRkTTIycnNxY1h3WFZQbCtQcnJjbENRWmVLaUZIZ05DNWxU?=
 =?utf-8?B?dnBpeWE5emFtWkJiVzFjdW5ZR2M2ajNoUlJoNlJSVHJ5Z2VoNUJSSnRaNEFR?=
 =?utf-8?B?b1VUV2s3TVFDRm5ISVAzV2JhaVY0d3VpSGt2U2haRVhuUlBuTUQ0ZTJBeHRX?=
 =?utf-8?B?ZnNMVnJObE9iTFh0NVlFc1lFQjhjbytIdm1qd2VRVmdmZG42NCthek15OWJY?=
 =?utf-8?B?UWFOZDRPd29NdWtLZnRjZWZpNDVxa1FWL0M0Sk12UDg3SVpQMExWTmNoNURs?=
 =?utf-8?B?M1l6SHh6aWpZeHJiYUZ2cmNtVlN2ZGdtWmVCaVh5ZG1CYlovNTRXODZIYzkz?=
 =?utf-8?B?Y1c2SS9uY2YyY25JRDVvUW9Pay95WHE3RlNWMEpjaHpsQ1FGeThQaTE1SmVH?=
 =?utf-8?B?Zjd1TEYvNlRzT2RxcDNvK2tmcVJqdTgxUUxNTHBxZysxV2gzcnJxT3ZveTdY?=
 =?utf-8?B?THE0U3ZleDhEd0QvRmN2Q2wzZC96cmN3ditHVC9QU00rWkY0d0kxc3FmTXFr?=
 =?utf-8?B?ZnpNaVpEd3FieW5ldVo4a1VzK3l1cCtJZGQ1amEwVC9sOHJIK3VuczdZR1lu?=
 =?utf-8?B?MHdKSkh1dXdTYXJXT29KTkZDbVU3NVEvRTVQNzB1bWRkNmdDSkEwSkRtRkNs?=
 =?utf-8?B?Nzl4dFhuWWtnM0F5d1NXRDU2MUllNzh0OGpYWW1vQXhWVjEyUEJ4bGlTaGc3?=
 =?utf-8?B?OU5ybmVWZHdvYlNqOWFzaEdUa1pFNDRHQVR2REVBWFJvUUNxL0FqeUJSWmV3?=
 =?utf-8?B?azk4RHlHMHlBUWdkSFNhQXNJU2JRbVZ2c0p2bnh1VlhWcDdvbGxZRmxrQzBR?=
 =?utf-8?B?a1J5TkxwMmNvZVJsZ0RzL0xkdG5CTVdWU2I4ZU9laWlwd1BHMmEvb1ppeHR5?=
 =?utf-8?B?bkxyNS9iYk1mMzhCNkwyS3Vta2RnZGplTGtjRWQ3T3p0d0F6ZS8xaGV1cHVv?=
 =?utf-8?B?ZEVCdDQ5YTdQajd3dDN5dFJIK3J6TVp1S1dGYW9tZytwaXltSnBPWEY2NmF1?=
 =?utf-8?B?SjlLQnFmbTU0Zkw1S1kwWGdJUGlZRTlPR0NNdjc3MkhINTJWRERIY3hJZmpx?=
 =?utf-8?B?RVFxV2pVVmdGWHMzK0JNWER2LzVBOEFtTEpKRTcyMHdKV3RXZ216V08zY0dp?=
 =?utf-8?B?MjcxRDhXeW9qZ3JORjE3emhBVlFicTR4MkxxUTRzbkxZSE04aWZpUDlGbFhp?=
 =?utf-8?B?eG90TkpOYTdlMFJ3UWpsZkVobEc2SjlvNjd2czV1cXdtRTlRSis4aU9vdnAv?=
 =?utf-8?B?RVg3MzFZWG8zeUZKQzVPQXJlVDUyZjVoYTJOSlpLTmp3RnVFZ3JZblhxRUhH?=
 =?utf-8?B?Q1IxVnI4ei9BQmwvUE96dkgyZFVZeGpJNEYrL1JGN01naURvdGNCS1R0WlRv?=
 =?utf-8?B?VnBtb1BTcHFGNTlxMVlQbGttQXZ2YVAwazZNOEk0cUlJZnA0b2pXSm1GVmVt?=
 =?utf-8?B?Z1VLUGFUbEJiSW9RcVZ4YkJZZ0NnTGZJVTV5R1hrSTZ1eGl4UWFKMk5vV1NZ?=
 =?utf-8?B?NzZFSDMwZGViNmxDNEwvSklRRjFRalhzZTlDa3FuMytWVzhPYklUNVVOdnpm?=
 =?utf-8?B?UEYrWXhHZ2NNbEhOVWFzK25aVEZDeTVUMkFRekY3OUFrOGhPVHkzTHB2aGhQ?=
 =?utf-8?B?RzA0ZmNIalBSVHFhbTRPeEdvdlJzRnhNNUNKWDFvMGdlWm9TWiszZm5lQnM0?=
 =?utf-8?B?dnY4a2hSTjNaaTRBQ1NKYllYQTZCTDAyZS9BR2dyaE1OcXNmUHJwK2M2WS8r?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6a5838-87c4-408e-6204-08dd4504e622
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:15:50.1019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVLYaMtDb5RlZOWPCa0RSiiDRkLsLwpzpTib67dUqD8jc6bmZQJVVewZqkIqJRXjRfANXL27ikGpa77nBCeQkR5jlxRWSE6SdIkWDvHAZXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10624
X-Mailman-Approved-At: Tue, 04 Feb 2025 23:37:37 +0000
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

Hi Detlev,

On 2/3/25 6:16 PM, Detlev Casanova wrote:
> HDMI audio is available on the Rock 5B HDMI TX port.
> Enable it.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Will try to remember to send patches for RK3588 Tiger Haikou and RK3588 
Jaguar once those patches get merged :)

Thanks!
Quentin

> ---
>   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index d597112f1d5b8..88ff5d9db2817 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -204,6 +204,10 @@ &gpu {
>   	status = "okay";
>   };
>   
> +&hdmi0_sound {
> +	status = "okay";
> +};
> +
>   &hdmi0 {
>   	status = "okay";
>   };
> @@ -318,6 +322,10 @@ i2s0_8ch_p0_0: endpoint {
>   	};
>   };
>   
> +&i2s5_8ch {
> +	status = "okay";
> +};
> +
>   &package_thermal {
>   	polling-delay = <1000>;
>   

