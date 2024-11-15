Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6A9CFDA2
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 10:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F92010E192;
	Sat, 16 Nov 2024 09:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="KkMMa8vL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05EF10E139
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 09:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgXzEcWXWrMIKz4NfzzbhApALhhyJQNMV0iefFqlEbGj3THKpS2sIuuRSC8xLFuKTbVVd4pkKSrYKm/IEXLcw4coUnCEpnQzBniGcaqcPllQdt0LYINppHTu66qeME/rZcYrkOlloR0y1HtOCoMy+cYhCINQp2zbbKnLqcrl+0tymc0+iD04c7+/gZ/sx8vgqt4mQXCfkIEsdZ7iSLfsBMb+s8kdCnbeKz2FZSwJ99Vjms3jmtEsuoQF1oglCnQQikc2uSW3b4kd2faVixwX3RNRdP1DDRwWl6iI5mdTo1VcLCc1U8oW5uVwg5lxliR3ozSbPsQzvau7FxzWH+saNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSlUL2VRMnvxHOTTPLUxNy40GItfC6veh8tFuwWlSjU=;
 b=INQ8U5KumWUIUJs4TAIsb4VLmte0vw826v9y/Gv9tEP5cEHd/VuVQstdGEXSyvOUcnlw0McwuPCdDGDUVtUHK7HDpwdjGtqyXIhqnAvOAiE1sibzlIqE69ULllsv7bAqfVeF8+lZ6x6+mCA557KsiGC8e/r4TkTveqP84pmC7tRZ8IwRwIp99YRhR9XPn0aJDNdanEdAbGpeiBnDyJapRenOdckgWke3X4scovQffStmk9gGZHFlD1c2yrUZ2Dzk3jc/UxYf/cHPe8mOhnpgjaQaI8YCLJ1y/Tc5rj6IlUZgIPslVIF8sq1VH/AhA1twjSEaZmiIBSoNiDjgOSjLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSlUL2VRMnvxHOTTPLUxNy40GItfC6veh8tFuwWlSjU=;
 b=KkMMa8vLkQ2gAj/h59KOK2rVLJl1uN34I3/nqwP1E1bE8Tz373IdGIdJxHLJeR/m5lSEBgVVIrprGzvANcVi77mM+NEQ9HufMTjc7G2OtjSJEFNCO1JcHtrTDt3pQF4hG7dvYRFJ9jpU0R3eHLYCfZ6njYdgW1IgqA2gguwAzMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AM9PR02MB7625.eurprd02.prod.outlook.com (2603:10a6:20b:43c::10)
 by DBAPR02MB6262.eurprd02.prod.outlook.com (2603:10a6:10:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 09:01:34 +0000
Received: from AM9PR02MB7625.eurprd02.prod.outlook.com
 ([fe80::aad2:67d9:c82c:fbcd]) by AM9PR02MB7625.eurprd02.prod.outlook.com
 ([fe80::aad2:67d9:c82c:fbcd%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 09:01:34 +0000
Message-ID: <a243c18b-7fae-27b5-83ab-755653f1bf3d@axis.com>
Date: Fri, 15 Nov 2024 10:01:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/bridge: adv7533: Reset DSI receiver logic
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@axis.com
References: <20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com>
 <hukcjydehdbkk4xn3c62au4az4tlfjlkmxhq5db5xwabvxhyba@nf5tzddcbikv>
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
In-Reply-To: <hukcjydehdbkk4xn3c62au4az4tlfjlkmxhq5db5xwabvxhyba@nf5tzddcbikv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0053.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::32) To AM9PR02MB7625.eurprd02.prod.outlook.com
 (2603:10a6:20b:43c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR02MB7625:EE_|DBAPR02MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d82dc-a1c0-4e61-1b4d-08dd05541aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmJqNmptM25PRkVYQzNuYzVaUDFvQ01BSmVNRkZ5QXU5VEs4emp5a2YzN3Rh?=
 =?utf-8?B?Skd2V1drTVhKT2FJMzdJQk9ia1JGU0crYkRpbkVqOXpKa2xxaDdVVmQ4aVVT?=
 =?utf-8?B?TmxUSk9sZklhQ20yZ0pQTVlmT0pqMTFxSFNGTWZJcytGd3VaQ0dQTEpXWlA5?=
 =?utf-8?B?UXg1Y0cwRFF1ZmE4UFprY3dHQjJpVENDVExsVTlGRElNQVZvYUJTTERkc0hI?=
 =?utf-8?B?ZzkvL2lBY3R1Yi9yZkNLMGRXRjNldC9XaENFMVROZ0tSenpadFhMcHMzeHNE?=
 =?utf-8?B?a01tV1ZhV20xbkppWjJVaVQ0dlRzczBSRUpqNWY4bTlNdzVhT09rSGEvUHVB?=
 =?utf-8?B?MUVIclExMVFEMTdrOU1nQ09UekU4bER3dVEvbms2ejNhL0VrbVFqaCtwdzht?=
 =?utf-8?B?NGlhUkV2TVJqR1ZvNkhIWCtHc2JXcGQzbE1Rd3BtY3lyV2czOG5tZ3NocmdU?=
 =?utf-8?B?N0tiVDlvTVViem5tVG5NNGJhUm53TTBXaCtLM2NMaTc2YXg3OUNjNTM2aVZV?=
 =?utf-8?B?YjhoNmdQMVRwUUZwT3owUWV0ZzhDMnZVVEZnVXErUjY3bjFYdlYzUUtQN2tt?=
 =?utf-8?B?aTlaWm94KzZBMHlKWWpZV1N5MndBbVh1N3QzL1ljRWI4NVFOQm9PaStHMmlP?=
 =?utf-8?B?cGphWThHMmUvL0NDelkrSDhQUmdySmFaR0hCbkFpb29aZFlvMS9lVHJMMWV1?=
 =?utf-8?B?cjNkR052ZHovQnNJV1k4dm5QSFNwaVNqU1dNOVNFUDRyZ2E1S1dwN05ibkU1?=
 =?utf-8?B?THpaWVJJOVdZOElDTUIzUzZnOTdnR3dsUVovMkdFbFh5N2xpUm9vQ1FBWVh6?=
 =?utf-8?B?NjhhZHd5K3hnaTVFczlZN0hXY2RwZUhZbnl5OThLMjRvK0xSZFZ1MFpEc0pS?=
 =?utf-8?B?WlUzZXp1Lyt1M1k1ZXgvYXAvcllhcnhvWCswNllqTzBUazRQT0FGRm43ekR0?=
 =?utf-8?B?WFFnZXVKWlgxU2x3TDZ5T29mSVNVL3ZBdDZRNVE5czJINS9mSnJPNHlXSmxI?=
 =?utf-8?B?WVJneXdCVHdEeHh1SzdVYmxzTllVRFRXSU5yejJCaVU0bWtGTEV5TmYzNk12?=
 =?utf-8?B?QmVubFd2NXBkd0djVTI4bkc2TnNvL3l5SGJ4S3VERkcvWTZrS0NrbzZzMlJU?=
 =?utf-8?B?UmhlQm5DRU81V2k1ZTRwS0tMSTgrWFJRVVB2eTAvRi9Dbi8wT1c1K1NtL0FV?=
 =?utf-8?B?djRQbmtxcVRieWs0OTZsZmRFbktSN09sQmQ4Qm1YTjl5SlFHTk15Y3U5MjV0?=
 =?utf-8?B?YmIrbk5IcDU1aCswRDZIS1YzL2o5OGdVeWNycGpOSUdOSHc4UVkrbC94MVdy?=
 =?utf-8?B?QVFtYjdrem1ndHVWN1U5T0RTOGh6QnpvcVdFbjRxNDE0KzF4ejRRdjN1S0dw?=
 =?utf-8?B?UDZHdmMxaUhPNTYrZmJWcEhtSlQxRzA0U2xmdzk3RVFucTlGR2lzSUJtTjVq?=
 =?utf-8?B?SGU1VHFHQmN2d3lrUEM3MVcvUFEwMVBSL3lCS0NscjU1b1FOSjNFbTVWT0wx?=
 =?utf-8?B?S0pLMFNHYzhwTTVvczVpaHV4SEpjTGQwc2NpV2ZlVVZSRlJtcVBSOTlSa0JX?=
 =?utf-8?B?cStIbFpBRVJvWnZlekNQQlpRaldKVGIvTXFIazZGeStWOWExRitwY0JlSjlz?=
 =?utf-8?B?VVlCY2hIZmZMeWkwMWZjcDBzL2RJNG0xaUU4ZW50bTA1VklOdmFES2o5Sm1H?=
 =?utf-8?B?Zm9IV1JwakVvdDJXdDhVejR3cW5nYjRtRTZ5MEx1S0M5R2JpVi9oYURrRW9V?=
 =?utf-8?Q?iGtrVdBHrz7bWpfNEhdBFwzw7Y9a2EJhcvZggFe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB7625.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHJ2a0p0WCtEY2lkZHFlaXVhQ0R1YU1lQTBnZ3NZcTNWZ1hONDVuZncvZjk5?=
 =?utf-8?B?bFdVdDZoMDN3djd4Y0VtMW9TakNZZm40M0lOb2dGclBpemx2Qy93Y3JSS3BF?=
 =?utf-8?B?bWRsQWtqN1NITHRZYVB4K0lIT1hUTUFRVGIrU2xqZTNFYUdxRnhCQ3p4OFpW?=
 =?utf-8?B?cXMrd2FFL0ZFWGtjZFpnN3AwdUQzZkZub0xkVmliMDRORnYwNU9QckhkdTlk?=
 =?utf-8?B?bElvWFEySE5kMHhKUGl4SWVEZE4vMWFQM1Z2OVRGbG04S0pRRWJtWmNON3Ew?=
 =?utf-8?B?Y2NQckFzOWVwZWhENFAxYm9pL0luWWpZUE9vVUJqVU1hVUoxWHJzejVXMXlW?=
 =?utf-8?B?MUEzaWJCVVRUaDdqci95Vmo2ZFhrMWQwemt4cGFzd0tnUVBsc2IySmo3Tjl2?=
 =?utf-8?B?c2tlSlRGejRFSit2Vk5wT2s4L0ZsUW9Hak9pbEJjajRHUHUxVStRSnZ1eElX?=
 =?utf-8?B?NTQxTlBSY0FPRkVBWkNVak9iaU5ncVVkNS9wRk0vOE5zMzhKRExsZlpHSi84?=
 =?utf-8?B?QjR2cU5OT2VRd2IwM29vZG1ad0YvYlloallsZk5OdjRqNUFWb2dLTVFoWWVZ?=
 =?utf-8?B?Q2VEUW1RL3dsTzhHZUZsM1JMT0M0ZWtua09KU1NPU3oxekJNSEFtQzNqcTll?=
 =?utf-8?B?dTc3b3NYL3pPRTZTQjFXeGxPOFNXM2VFWG9XY3NjSnNNb1Z2Sk9YVm80VDc5?=
 =?utf-8?B?K0EzQlAwdjY5cU1EVk5XLzZxMHpSOXFLS1VzNE5sTmJ0VUFwa2diKzBvRGh2?=
 =?utf-8?B?a0VPSUtFV2h3UVA3SDJsTGZ4REpPdG42YUkxeS85V2tDTnFmN2FWRVJHbTdV?=
 =?utf-8?B?VDNwdERnQ0RyNGt2SDNzaVJwUlh1Ly9yM0RDRWYxRjFXTVI0NDVVcTNvbFcy?=
 =?utf-8?B?VXl3QzFKNHFBWGVRQlVrZWN5Y3hTUzhhQkxLejh2NU5WS0xRSkdvSlkrWUQv?=
 =?utf-8?B?UmNwbzRnLzVvWVlmQTBkY2ROcG1tYlZHQVYxMFVZa1NVekhPN1UxT2RtallX?=
 =?utf-8?B?ZXVuSHJCSEdhbVg5SlNLaWpJbFNHbUR2cy96b3NlZkRzMWUzeWJpY2Fsd1VZ?=
 =?utf-8?B?RGtRZ2RLMEFWa05mRU5DS2xhV0F6Z1ZEZWhiZXJkV3lSN2hXOTJmbDVpbkNT?=
 =?utf-8?B?aVBGOE1PMGtmYWo5cFhJM3Z6bGRLc1FvSEs0c3ZtbEhFMkRwTEFFR3ZTTzNj?=
 =?utf-8?B?aWhLbmljSHNIYms1OVRNem5XN1F4T0lMRlVyODg0Wm5sbWZXVVZDYzM3N05E?=
 =?utf-8?B?dHNkUjJUQzNuSGRpQ1JBbGFhUU50ZkNSWnRUcGZoZjdSbzFzNlhENzNyZDJx?=
 =?utf-8?B?aWVmODFTN3U2M2E5cjFnYTAyaG8xcFJwUCsrQmZyOXBveTBHK01lTnhEWXlo?=
 =?utf-8?B?bjhwRndQdnBKN3dmSXJDSzlYa2JBbHZMRU9adStvOHQvdlZaZU9sdCsxb1ZT?=
 =?utf-8?B?R2NhbDNOOHlBSm41VjcxazFPdnFPTjBtWFREY0svajJIei9CZ0UxY3FvSVB3?=
 =?utf-8?B?cktOaENobWtVclRRdk42emg2QVRTaFB1TG1NU0FzUWlYNmlnb1BlOWRFNzJ6?=
 =?utf-8?B?OUhSMzhzRFNJbDdFZkFmcmtiK2Rvc3I2VnFYQUphaDhCL0NsQks5Q1djSmVs?=
 =?utf-8?B?MDRXbjR0TDNLa2VDS3pPWU1pMWxRc3hTMTc2VFRZb3Zjdm94R01jYTU4aity?=
 =?utf-8?B?cmF1RWJ6dnZnNjFmanQ5VXpRSjZwRXY3WEdCdWgrQVVBM0NYaVVYMEh5VVVB?=
 =?utf-8?B?TmFES2N3WFAxU0x0U3ZlQTkzN0pGR25OaTVoNFNQU2IrdUY2enEvMUliUG9X?=
 =?utf-8?B?MnhKbFhTemJIQ1hZQndlWWY5a3V5VWhCRXNmZlBHNHdjdzNZM1pkMjlKaGFL?=
 =?utf-8?B?R2xlZ2YyV0ZhTDBJQjg1Umk0Sk1MYXIwK2IycUJPekVUUFBWbERsTzJoS1Fr?=
 =?utf-8?B?cHNNek1CK0psSXgrZ2NRKzZ2Q0hLdmZKNkdpWmhYbk9HODFrdm5QYjV5S09S?=
 =?utf-8?B?K2VnQ0VYSVlmb1d0Mjg5aTI3Nk1TUFc0aEF4TFM1b2VuYkJJdm16Vlp6TFZr?=
 =?utf-8?B?aDliR3lmNFpSaTYrK0xDaWdRcmgvcWU2YzJiQS9wcGZXZEl1YjdvV0o4Q3Bp?=
 =?utf-8?Q?IGV0=3D?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d82dc-a1c0-4e61-1b4d-08dd05541aef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7625.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 09:01:34.8173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7+YYO6T1mx+3O6w8Rd2Q1BgsIcI6HDsUfxZVRgW/Ota/DZChdOcy/erCJGbTGio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6262
X-Mailman-Approved-At: Sat, 16 Nov 2024 09:51:27 +0000
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

On 11/15/24 09:10, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 08:40:15AM +0100, Stefan Ekenberg wrote:
>> Reset DSI receiver logic during power on. The need for this change was
>> discovered when investigating issue with ADV7535. The symptom of the
>> problem was that ADV7535 continuously outputs a black image. This
>> happened for about 10% of the times that ADV7535 was powered on. The
>> rest of the times the image was as expected.
>>
>> The solution in this patch (placement of reset and sleep time of 200ms)
>> is implemented as outlined by the Analog Devices support team.
> 
> Is this reset sequence specific only to adv7535? Is it applicable to
> adv7533? adv7511?

I know that it is not applicable for ADV7511 (that chip doesn't have any 
MIPI DSI receiver). It might be applicable for ADV7533 but unfortunately 
I don't know. I have only used AD7535 and therefore never tested 
anything on ADV7533.

> 
>>
>> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
>> ---
>>   drivers/gpu/drm/bridge/adv7511/adv7533.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
>> index 4481489aaf5ebf164313c86cbf3447d2d7914ab9..93085c2b872ed98f4ee394236dc66c568c0e5ccf 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
>> @@ -67,6 +67,15 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
>>   {
>>   	struct mipi_dsi_device *dsi = adv->dsi;
>>   
>> +	/*
>> +	 * Reset DSI receiver block logic to avoid ADV7535 startup problem.
>> +	 * Without this reset it sometimes continuously fails to receive
>> +	 * incoming DSI packets and outputs black image.
>> +	 */
>> +	regmap_write(adv->regmap_cec, 0x26, 0x18);
>> +	msleep(200);
>> +	regmap_write(adv->regmap_cec, 0x26, 0x38);
>> +
>>   	if (adv->use_timing_gen)
>>   		adv7511_dsi_config_timing_gen(adv);
>>   
>>
>> ---
>> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
>> change-id: 20241108-adv7533-dsi-reset-488c6fbb5e42
>>
>> Best regards,
>> -- 
>> Stefan Ekenberg <stefan.ekenberg@axis.com>
>>
> 

