Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E85237DA
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C019010E38C;
	Wed, 11 May 2022 15:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2062.outbound.protection.outlook.com [40.92.41.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062C810E330
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0QtNjAh0EmKM/X6Jz2jzBwEsUkYokdVFewKzND5OL69WhgWuPfjOGTXgf4woj6Ib4cnzP7a3XnNU8Wkag3cOBUXgirgrApxUkTJQ1tiIvTpHoXnkMeoJHQCxqtnqV8RrUi7q1Nku6nbrwlSU6g6LG981w5ITU0krxPN6Se0qqOMg0XdA+0D+RIXb7wPrCS9TsNvvuMB2Di4S9ilnrtvbG7lOn1AUPmF0clvwVNkguzsEDq2NC/PWqqJiwmrQos3Qh+0A7Zwuc0Go+c2XQ7KvSUuTRALi6Q1TnOnW3xEfrXq/Q2g8wO7GwKRjBhwZ2V5X4Hmc3Wnuy0gnafL3Skycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXWVjTMZZbeorYFpjiUkGBXXfobV5fvWOZ3nP5Fy3NM=;
 b=O/ZEZtUghvjB40tuhAAUX40CkW+LYmYu0G53zk3+d+O6oFAGiPdOqy+DI3wHX/0zeTr4uHAj4RH72egoCn/7vF20OEeIW9OHUmoeXONztIB/UqLSacita2/gx5I2DDvC3DEC4KvNTVjt777emO8/K2w843stqbTH8NeT0pQoH66sAhST03BWEFni1xknmLe3qvjrmeHm8nJiGRkOMf3poZwna+swMyqYT6d7pbPtSGd7r3pmrOjkaxAx725lEaKnh9ucmmOu7XHEQGbF1TUBUhOKfKPxLUfu/q54hZ/8cNKdjOhFLTVJo7dHAdcZtQirVrcU86bRXvTxvPpKDWLXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BL0PR02MB3889.namprd02.prod.outlook.com (2603:10b6:207:4b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 15:54:52 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 15:54:52 +0000
Message-ID: <BY5PR02MB7009605B175F12F0639EFD29D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Wed, 11 May 2022 21:24:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: krzysztof.kozlowski@linaro.org
References: <b3a618a6-f236-549c-0bac-4c874cd49a00@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Content-Language: en-US
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <b3a618a6-f236-549c-0bac-4c874cd49a00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [6TkkBXL4hQzHdTcFHPyTccFlPj2uXd3FgcFX+VuZ7r+e70Gk2KYzz3lT4mVpyIOf]
X-ClientProxiedBy: PN2PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::7) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <cb6feda7-ae04-a09b-0d0f-08a542deceae@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe71bd6a-422a-4145-618b-08da33669583
X-MS-TrafficTypeDiagnostic: BL0PR02MB3889:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TwdNLhWzQsr8vD51mc72eEQ3FCEcrq6uo6PCi0yt6s0s86x/u1zREaxz+FLCQFscmMDItMS3x9IAQdK1cQda87Wwd1ggOz0juHuFK1/MZgxzI+xXadRM8MhqzoH0xZ5NNDbNAmgpgRMNbyshJEVTq2K3sP84Uc1BiLQLdpCZHSFUvX51gkuizd5hkxeqq/9x3Krc6yV03C13SW0G7IAQedmJwJjugo6iiRXp6M4n+sTMux++y9Z8QkCnJaBEGrmEyqs5weuMRMcLJ7mhdkZO0xPHT2QvOvuVh+L91g/SG+IwlVyj3VjwXvP/SoXy7E5Jm26wZPdLrYC54UVcskDNtpXFzAO0ZfmmCyBrJhiH+AgJFwWyyoVcQQIGB82bhmKogO9KYQh9iZc/pnnQR09QvHSR25jetqKIhqERc7Qw9znjWvRIv8GV7O0J0qmQGblg4Wq3qLoOEPefoDXJ5MXVrPl6fGmjQYnCtx384q6OQA3VVnOKQczcm9fkNujheAodRfPntp3RGXUmNuuJvVzy+OpQsZirK3z3zAYX97Z2EKSqIMxnZ8pEid6rMdCmv3WCLOXfm+E7/UPlEsY8x6NEf4fL8DHV3o5eaLsYvyEXDzIjTQoCONhHnzKdILohTxNhwq98dr6q0EIuLRft160iUIE/H46YPc5ruqTdLQbl7/g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXBEM3Q0ZW1US1ZXVlI5Z1Z0TXFUbkZXSzVCa0tFTHJsMUtJODJwVHRpdmVP?=
 =?utf-8?B?VW01a0dWZ0o5LzNVOFg2Z1lTbzNPcS81YmRJM01LTEtqWUdyNTN5dmZSSk9u?=
 =?utf-8?B?cEhQTk9WTmZCTkZybktEL05ZdGtjdG1zM1FsdVJRUnpBMkluV2U1UXFuU0R3?=
 =?utf-8?B?MGMzdTZMeHVCaCt4dkIxYXc2SlZhWVBDdktJaVZrOTdhVDNqNjIvVDJNVXZj?=
 =?utf-8?B?TXJTVnFpaUZuYTVURE9BbW1YNzBGd0VubHl5Z3grTjdQcTc1ZWtQRHRZcllX?=
 =?utf-8?B?VjV0RHZLOElqajlBaXhjRi8zRlZCeDRrcURSb0RKWDEwTkNFSDY5c3NueFlj?=
 =?utf-8?B?MURnc2YyaXBnVHo0WkdpMG1maGZNakpoNU5VY0Zoazl4eVJlbUxtaVNRZ1RS?=
 =?utf-8?B?QVhESkxIN2RRcXpTeTNVUHBXL3NzUzgySVB1VmRzc1FRVHdmRjhKOVlvQTlt?=
 =?utf-8?B?MTBFanBFYmNLY1U0N2QwRXYydVh5dXNwZmFDY3duZXR6djUxNWFMb0RhV0oy?=
 =?utf-8?B?YnI5eGZZMGI1SWgzNXN1RmlNZVVPaFEyVGltNUVRRy9uNXNFR3A4dk5vTGJF?=
 =?utf-8?B?R3F0OXdVVHlVV2dWNlNNMHdNb1U1L2dYMXRyOThFT2UxVXZHb2JERFZWc0dq?=
 =?utf-8?B?WVJvNkJoMHZscDJDallyaFpyRWFnOGJLMGN5bmJsNHZ1YWNHSlNEQ2NiYnhS?=
 =?utf-8?B?WmN6OEtSNXRIeEk3bnFZSlFKTUdGR0hxNGEvZHBTWTlRMmg4VGIwLzYweDdN?=
 =?utf-8?B?OWFoWW93S28vbTVpVW44bzVzUHdXZHRaYm8zSFA5YkM4KzJhak5QN2dXSXRU?=
 =?utf-8?B?OVpONUFLbkZmeERxcUpmcjlOYkd0c2hNb2ROQVc1c2Z3bWNod1p5MG5yZkly?=
 =?utf-8?B?WjRaN2ExWkU5OFZGbFFzTWJXYWdKc2laL3dNN2cxYXJ4aVd4cFpHYUFyVi9Y?=
 =?utf-8?B?N2d0YmRoUnFOZ0MzQnhGWk9adlhmOUhsY0lsRXpNZHF4RVo2M2V1cUNXUnp2?=
 =?utf-8?B?czcvNW9lYVNvb2NUTTV0eWsrSEVsUHZFaXducXU0Q2hlL1l0UjVDVk9hL1pn?=
 =?utf-8?B?OGFzMHlpWlFhRnQvbE9HTCtKUWN1cC9mYkV0Ti9XTlROWjR1SUZVUzF3Tlc3?=
 =?utf-8?B?T1lNd0xQVllwWmYvcjd0RHREQWNXTm5jUzEwdGZXaUlNSWhOckYySXpwZ3Bi?=
 =?utf-8?B?TU9Jc0ZoV3hxbFAvL0oydVQxTTNKbDR1TmlGczkya1V3ZkE2aHk4d3J4azEw?=
 =?utf-8?B?NktEZk9KNWY5OUdkbXo3c3FWOFpDVU9VRk1kR0FrNWR1VmI4VzdRa2NjOFZQ?=
 =?utf-8?B?eWwzLzJuaVJ4ZnM2R01rVzljWUFyWTJ3Z3ludzZyWHcxRVhaenNHN1pqemhv?=
 =?utf-8?B?V3RVb1NaZ1hTTUE0NW81RVNrSkRIcmlacDlJOWRCc01TbEFpNkxobzhqOUpD?=
 =?utf-8?B?Z25CZWlMS1JBcFZlbEVNTk43VEFzMmsrWnBDVzQyN1pYOFFQNmtrMzBXOHB5?=
 =?utf-8?B?L3VpZzZFbnN1ak9DUEdCZnYvUkdubDA1MjZVeldkbVJpZnRFaWE3VTRhS1Mv?=
 =?utf-8?B?NnVWMlFJVVJ6dDFIb3pYOGZoR244T3pxdlZGNGxiQUVneWx3UmhiRDBQZzBv?=
 =?utf-8?B?MVo5K1J3elBIdkRaSDYwZFBZWnRzNFdDVm1IY0g1VytJNVpmczlzeHkrMEFM?=
 =?utf-8?B?Wkd2SzN2NkZwby9USGV3N21kbCtzYmNsdjhDVzhTWDJIL0xhanEwK2JCdXdx?=
 =?utf-8?B?UllLcXllWTFUZGR3TkNmVmZoY1BuSWRxTUNUZnRTZzBJMFRXV3FpL3ZCSWhB?=
 =?utf-8?B?TGowRFhtdk56elU3WXhjd25HTmloeXVJczI0QXlCVWhINXo4Mk5kRGMvZ25z?=
 =?utf-8?B?Q1Z2cHpTbWY4ZVN3cEoweWwvZTNVUlMwd0xjN3h3QUNrbG42ZDNyc3JaM09Q?=
 =?utf-8?B?amQxM2krZ1RoRzJtTUZNdWplM2p4U0laSjlYNzlrTVEzM3hxMHJkZTlJeGtP?=
 =?utf-8?B?cnBMekRMK3hRPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fe71bd6a-422a-4145-618b-08da33669583
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:54:52.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3889
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
Cc: devicetree@vger.kernel.org, fanghao11@huawei.com, airlied@linux.ie,
 shawnguo@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux@rempel-privat.de, robh+dt@kernel.org, thierry.reding@gmail.com,
 clabbe@baylibre.com, phone-devel@vger.kernel.org, sam@ravnborg.org,
 stano.jakubek@gmail.com, jo@jsfamily.in
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/05/22 13:50, Krzysztof Kozlowski wrote:
 > Please add Acked-by/Reviewed-by tags when posting new versions. However,
 > there's no need to repost patches *only* to add the tags. The upstream
 > maintainer will do that for acks received on the version they apply.
 >
 > 
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L543
 >
 > If a tag was not added on purpose, please state why and what changed.

My bad. Completely forgot to pick the Acked-by. I will make sure to pick
them up in future patches.

Best Regards,
Joel Selvaraj
