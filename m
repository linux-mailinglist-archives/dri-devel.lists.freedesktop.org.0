Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4591885AFB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 15:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606C010EB50;
	Thu, 21 Mar 2024 14:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="TsGSE+hZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2094.outbound.protection.outlook.com [40.107.104.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F0E10EB59
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 14:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaUWcymaPgvSBrZw54H2+CO0QjVha6jiMtyJrC52IHpVBqGU0kKp6fEkN2xmPmt9LmeHIcCbz23D10G4hHAAJmVUhhYipEJC5jYZ0DG6rgp/6Ds3JRgz1fj7QByd+/w09CnsEFrS0hcyukQNaoshBiWoIHa+5jYNPD8Faz74jJ9TJYSAnBWArF2EjCxsxW9pJVMD3EHzy79/lCsqwSuSJX6CgAoyJx3AVVO4Ey0juR2AcftSqf7XrxzXUC/azZgosov54zjWL2tHxxSbMriZAkJPGq4/o9efL62jD0ibUfR1BOGebxwJ6IDYjrqQp2+dTIUArQW25PWbqSOfwbxDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XMqoIj56jSj2i0ioqWVbMSBEZD4mRgyJuzHCEjLU/0=;
 b=VaxC3WTkPdMo+Grb3l/fqZfmCYckXqwzAbybnsK/SAp8Ex5vxF6SMgLFpZajtVutTPVZGSz7aaq7LSN/uoZyhTkk1uke64LV3wJ3sJ+OoPdMzFs0g/L7Nn+bl9VdtqucrEgW1S0q/SPg++fBoOJu9iD0TPP2LoXEVek+RFTVjH0PPk0cQ5n1rebmex5aS8ew5RvkitT/Bt0jpwnhsawgiUM9N/IZDkUwp0ghfcOMyY+yeocjwV6Rbgl6LH2YGcTDIZFyrpQOcEEb2+XpAOozHIbXEuz67xyi4rWrB2M/Glj6Wa1t4NWmoF7yWrxiLr/QW7isbGxQ/+PwsAPZ3A4/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XMqoIj56jSj2i0ioqWVbMSBEZD4mRgyJuzHCEjLU/0=;
 b=TsGSE+hZ3COQ54bsJ6PIpu+hhT7rxY55338StjVygayfHwS77aCOgBvkgMi3jM61vjPbHAb553053gf3+kaL0LOMAo2dxP0Vv7pGLoqaFuf6C0JW4N88Ig/4/kvao/unvR8HKMAsE8ZlXqWIhgRgM2yU0cj/bdtMwkFLveFr3iWSFcyjXuThZx/e48xyJFv76teZ3NWmdsYrdzGHlI5PnLEGzklCEDfrOIw7YWChtTzThg79ozx7K5f/Ev40gxSBe1db81jlQ+ZrKl7+fohemCrvHmGPnRqwXpFh4wlMlw8b+5zl1ktQVmC7tYkXzQYYVHiJJVup6Fpf9XTEQLquJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI2PR04MB10219.eurprd04.prod.outlook.com (2603:10a6:800:22c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Thu, 21 Mar
 2024 14:41:15 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 14:41:15 +0000
Message-ID: <5ac99bda-930d-4f7b-850a-560b76c39bc6@theobroma-systems.com>
Date: Thu, 21 Mar 2024 15:41:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to
 LTK050H3148W flags
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, klaus.goger@theobroma-systems.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240320131232.327196-1-heiko@sntech.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240320131232.327196-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI2PR04MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b15f27e-c638-4af0-71b8-08dc49b4f5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ERTakDI5hMcHN5Pb/ZLbjH6XB+iIKdgUY2JrJwpAbstREej/wBI4nzyuPmrnz0Tt7aUyUAo07IbeLqJszu9weX7gTcvWv5ZbphgsdaUTtxylB74P5rVjszg6fe6ClIXNLFObAfkjOI9peHJkaF4l3pEtH3+l3Ulspgqms6YLGVkQlT6MS5v/+5rJjox+yTKH8SaJNdlGR1pq+rSvG/pOHzffKjAuUq0Yb9EAH161+m+buu4NIw6cjbWmPHFWUeHX9Kx93HJTOVl1Sat1C+24EYKv+bGWZm0eIqMaJcjE13eSNbgVRQDHWnIZxqCe+jbG7oYyp+r0acEshfZI8vxY59DTN6wa2qI2bH0efscWiM9a55v+N7lTXDaM79RpcxeI1/HsoY4miY6gDPbIUbaBMM6stX7Pn+RJcDuTPfgP5SVbUYkRj1FBlhAlWF8xj4QbHFpTmWW+J81/GvWlYIokGxb7yLUDlTxDLFO80zOizG7Yw2AT1r0f4JOJHVoR9JzB1b8k3+cEyoCpTCNloXnE3DfYH8z5Mk+ZcAwh8nv/Am1Bp2IjSiMD3nhMjB/RvoqqzCN2IcByw04czoaX0OEri1Uo5RSt0Ouy0Z5OYHbGxVKC8BARM9+b+YC00blriyj5+w6Vu3Ni8/M4haYUTrXLf3bMUrKm9RQhqgwICfARsYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3p5MCsveVVBTGlsV1RZTlpWMGJDZmFRdmpJeThDdTJDRjd3cFJqSDZKNEZP?=
 =?utf-8?B?L25hRURCZnhLTDcrdnkxYXBoSWdDZ0s1aWp5TzExYXlsRVVCS01iYzNySTFh?=
 =?utf-8?B?alZuUjJBR29uS3NYYmdNUS81aHV6R2UrYkNpWnZuRlBXQm56Z1YwRE93NjJC?=
 =?utf-8?B?T050TDlicWIzRGVnZS9QU0ZBQmg5N3VXMGtHT3lvanhGbEp3QUhlNVhQRUMz?=
 =?utf-8?B?K09jbEo1OTgzMWFkZE1NWmRTRDVzVjFVQWk3VlBIb1dpd2ZLUkpsbG41dXZX?=
 =?utf-8?B?UEpsZVREUC9PSjdQZzA0WWNuWXZmVnFUNndvZUlDL1lDUUkwWjQxSlJhOVhw?=
 =?utf-8?B?c1BFTnp4Yk53ZTNBRVFJZmowZmIvbXRQem1VcGVHU1FzcnFSd0hnWWpaMXUx?=
 =?utf-8?B?QXFPc2dqWnVzWHYvaGtobUI3TTNLTnFoRUxWR2R3UFpyOFhNNnZHUE9WL3Qz?=
 =?utf-8?B?RnhtT3IvbHpjUmU4NmhpQjZKNWNzeHlsUmhBa09TVG9xWHY4RHgvMlBsajBy?=
 =?utf-8?B?ZnVBVFcya1p5VjNmWnphRVFWMHZQZGpDNThtU055TDJVdGF6WS9GQXgvTSt3?=
 =?utf-8?B?S0hFZlNBd3NteHMyK3VSdDlxL1QzRTMxdjhBVlM4NjkweVNTNExkL2hRa0RR?=
 =?utf-8?B?RjZsQmcxckJrcWtRVGw4UGlQVDZ1VktVSzNnaU9HWlR1QnhManp1WVdjbFdk?=
 =?utf-8?B?dmRjazJ0L0p0c1BqQmN2RkV5aXA2YjVQMTVnM283UFZOSmUvekI3U1dGN2pX?=
 =?utf-8?B?YUZ4a1NDTDRjQ3cvTkZLMTE1aG9PNU5QcVVVYmhTVW1RZ25oSmx3alk1UmFR?=
 =?utf-8?B?dklGdGl5MXVnYis3WU40MW5QdjdaTTQ1Y01QNVhNUXFkR3JkbFRhU3BQaTg2?=
 =?utf-8?B?WDVhaWxMUk9XSDZyTkRRUmlIMkEySERoRk84VE1tU1lDUmFUdjhZWlFtWDJK?=
 =?utf-8?B?dHg5QkRTaUFPN1VIVXQybjRmeWQrRlZHNWltRXFWM21TTVR2aXlkc0E5a2h3?=
 =?utf-8?B?Qk1PRkYvbHNNS203anJ1QzFsVXFOWDgzMVFobDVEZkVZaFF5RzI0UGd2MXFQ?=
 =?utf-8?B?UTgzOFRLYjdwOWxBQXJ5ejhTUEYxWStLQzJZcC9jZnROK2Q0YWoyZERKUU05?=
 =?utf-8?B?NGx5K0tFNi90azBJUjFCd29KR2NrSFlScjNwNFFNcVczUStNbElzTWZmQjFN?=
 =?utf-8?B?NExLYlhNSkxYODlQS1BCVW1EenRyL2FxeDg3RFA3cjRIUzZmcFI0Q0ptMkd3?=
 =?utf-8?B?Z05OWEhEazh0c1dpV3dwR3dJYWNMT0hKc1VaU2U2T0htU3FrQkl5R2tGYVAw?=
 =?utf-8?B?aGxwTTVtTkZDVTMwOUllNUdHcDk2eDJDZUYyTXZiSjQxVEhBSmVUU21JNE1m?=
 =?utf-8?B?Q05ONDdyV3RmandPS3RZZFNWS2p0VEJQeXhzaWRTVVJaZ3ROd252OFpUWWxv?=
 =?utf-8?B?YkZLRGt4ZlhtN1FXWExvRDZGL0dvUU9ORkhiNEFwZTgrTFo1RFZpdzZDb2hU?=
 =?utf-8?B?MXVQbTdSdS8vcVNEbUI1bUdpdllqTTlBcmJtM3BPVWFKZTVGRkdDd2pGc0N6?=
 =?utf-8?B?VTQ5azArTERsS3htYkg0ZVNVS09OdVJoYU1ka0xZTWNpNW15WlMyVWpqSnJx?=
 =?utf-8?B?cXRwNXdKNW5GamlhdFA3TUpnRHBEODF2T0VBK2Vwc2ZRenltb0pKZDY2ajli?=
 =?utf-8?B?Q1E5c3RIQkpYV2N1WXhmZnovdEdFd2NmVzJRaUZjNjlOcFhKSjBJZk50azcz?=
 =?utf-8?B?SFlUWmMrU2ZnNjlicmVFM3MrVUsxQnhUUkhXeXpXR1F4ZnZpd1JUSzIxZlk5?=
 =?utf-8?B?Zm1LRHBpK1hwcFJoV3NHRldOQWRBb2RUQUZPSWwvd2xOSzJiTlpZQU8zNGor?=
 =?utf-8?B?VFJueUx5VEN0TmM2aGlHVzkxUkNSeGorTExGK2VNN2RpTTdpUCsyc0dpYXRS?=
 =?utf-8?B?Z0RmWHpYbEVyTXVOVjk2MUdHTXRyUWM3NFA2QWlWNU0yem50eTVDOFo2d3hq?=
 =?utf-8?B?WU1MTlNzOFFNM2N3Z1U4c3RVdWx4NlVzeHpLa05vcXJCd3JGdFZMaklzc3Jz?=
 =?utf-8?B?d0FzdVN0Q3czNUVXV1dWN0JnSkJJU05ZMEJuRy9pZldIVmlYR05qbXZDZEN6?=
 =?utf-8?B?UnphOHVrcTJLNXQ4ZVBMWVo2VU5ud2c1YzRiakVUL25rbDBST2F4YThsYWt6?=
 =?utf-8?Q?+J4uZrTNPStZZztXN/eh/iY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b15f27e-c638-4af0-71b8-08dc49b4f5d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 14:41:14.9619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y6JZ3x3STRZ2Mp0RgqV5LQvSxWTbfbiNCiVUzizon3yWkVxxnDQ7K9f4klGUc5fk+4dFZmfk/a2G9qrQo18JHpjq6cWIc96ksTQBpFKSeLCUFqR//foxOC0zDhlX6lz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10219
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

Hi Heiko,

On 3/20/24 14:12, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Similar to other variants, the LTK050H3148W wants to run in video mode
> when displaying data. So far only the Synopsis DSI driver was using this
> panel and it is always switching to video mode, independent of this flag
> being set.
> 
> Other DSI drivers might handle this differently, so add the flag.
> 
> Fixes: e5f9d543419c ("drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 variant")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks!
Quentin
