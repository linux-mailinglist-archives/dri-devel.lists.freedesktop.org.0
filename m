Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C3B34D88
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5B10E573;
	Mon, 25 Aug 2025 21:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oRyENVlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703BB10E572;
 Mon, 25 Aug 2025 21:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNicmt95pnbscHIaVUlDLOg7hxeVTzhU0rYXFX9WBGWyL9JzUustvG+pL5E6Pk831Q5x3C0Rm2q5XKS8SJ2S+q58jnrcUfOScWM0h+lztwv9eipZMtf44fFwJmn/7PCF/ada2z+/blG8gsCLezWe2mEIZst6CT4WKTsmfe/aVHF7vJKVrP8w2RECbQm89ZM1ejbPGvVYfaYw45iF9fUwwfqPKHBLKHeY7Tdl9xWmUBcIjtqgadczpWUsGFszAklRsfXKmX7Yi3d0uiR02wQhecTGhlZe3rHi5opzjnGXKc3AO5Q3fiICPaSwJo1WG7xtARTsoOmyJ8WQN5XxNm6CTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ziipn1JWQz8KeSv1JUUU9xsyN5JZpPhQBYi0hrC5/NQ=;
 b=M68Pkx8K6H7HNPrmfDKnoMwQAehbpG4b8/m2UuqEBbY8I8oYB5RQuE1YlsZF0VQ6fcHCtWCZQx1cLl/91LJA7arwdLbH512DJU+dZnIIh+EHKaAUYaobrSpCW7x/RFGi87vuZvkEn2AbPyvuAHHk053ZFvnFz9bJA9oJXB+bsA/Eriz2EqmpSndkoKaA/aTeifqRRzjoeitz8nteOQKdN4QIhxYae2DCbxvFle8CQTnoWvKB17CNWt8I5sp4poQdppAx5EDXXcpqITcms9Bj5bXb1ekTuffqGnyQ08zODobcq3BvjUv46EVCeS2psFKjZkFEdWhxpfVOsJnxHkBbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ziipn1JWQz8KeSv1JUUU9xsyN5JZpPhQBYi0hrC5/NQ=;
 b=oRyENVlQN8WLdbbslspGi3vMTbgifgjyjWBvFZVzEZEODdkMuxocerUhzVxnftRVxIMuCNm0Kn1Wq7fufA4qWGYGPBaV39I1rwlfKxiHr3StSuQV9ERmJIsLKl40QFfm9/fhJL4XdhyhcOeOg240GS/o2FBeREk+dw+1PuqlAoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS2PR12MB9711.namprd12.prod.outlook.com (2603:10b6:8:275::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 21:05:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 21:05:43 +0000
Message-ID: <0e1e33a6-70a0-40a0-86d9-b8f636b19455@amd.com>
Date: Mon, 25 Aug 2025 16:05:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] drm: panel-backlight-quirks: Add Steam Decks
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, philm@manjaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-6-lkml@antheas.dev>
 <f1ba9808-64a5-4d64-a4ef-b2a95cebae94@amd.com>
 <CAGwozwEGdcyFnOADrCTb2cUDvq8H0kxtA+KRb_Kz5De1eFXztQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwEGdcyFnOADrCTb2cUDvq8H0kxtA+KRb_Kz5De1eFXztQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ROAP284CA0135.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:42::8)
 To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS2PR12MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: b391aed7-2faa-4f04-c813-08dde41b2724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2EzeDYrNVlWYmRxbVVQT2tiLzZXWjh1ZXV0NnJuZnd2bUh2OWhrTTNwc1Ez?=
 =?utf-8?B?czVGWjhpamFlSzNKMXdseFZaVzVHM0EyOWNHNkFLanBlL2l6ZlM0ZVhVVUdQ?=
 =?utf-8?B?V3EwdFJRbm1zRUN6eGZKUEgzYy9tRzJBcnNiSHJGY05ZTFZvSVZBYmxMS0Vh?=
 =?utf-8?B?OC9uSjVXWXJSN3pyaDhlVldSdGhtQTYvRk1OY1N1eTFhbDdydFg1VnhRSGFY?=
 =?utf-8?B?UjVtenhGd3doRk5sUWxjZE4xZ2hob3hScnI1Yk1LMFZrSUNTdlRlYmllb25q?=
 =?utf-8?B?dnNvZnhMcW9jSm1DQ0QxOEg0Zm82VlZ6MW5XRFFBWWZuTEZIMy80SGIyYXhO?=
 =?utf-8?B?cE9mSVZWelFRaWhXVG4zUUV5cHpmZWlUMWFQYTRmR3FSWVdvYWJaN2huUk43?=
 =?utf-8?B?dzZYZjBHRFFTRCtBSTB2cXQ3cmxBTnpMdDVuV2JlSm5SN3hyWDhCU3hKQ1dD?=
 =?utf-8?B?TXpxVXNBQmJTV3FhenBjUHg3MXY2QW5xWExCcGJxM2c5eitXdEZnRmFvcmQ4?=
 =?utf-8?B?czZzNFNhRTFtNmFvSzBRSWZtRHJna3ptWmkzVXNxS012d2ZSa0F2dDBiRmtx?=
 =?utf-8?B?aHRpZmZBMEdzKzA4alVGNWVJYk4vTzFuWXE3bi9PcVdab2UrY3QyUlhCdjZp?=
 =?utf-8?B?aDNDNUp3UmdRRzV0S1MyZ0tyMjZMSUpGRm0rU1lBSEdGMlpWQUVIcWRmaW0x?=
 =?utf-8?B?eHI4OWc4V043OTBDTFhmNk50SFNpMGNOVGlZMmcrajBzWE1LSC9TdG1OeXRr?=
 =?utf-8?B?RVM5dXRydUkwSEJPdXBSYUcveWo0dVR1TDZJMm85WmFQeHF6NUR0TUxxMzhK?=
 =?utf-8?B?R3UzeGNmNHFuYmEyYUp3a2lRVlFPeHBVNTY4K0FUajI3UlpEZks1ZHpEcnB2?=
 =?utf-8?B?WDVNN3YrUFM5NGVmZFZMU3Z1eFlFS09WMjNHbHY2RDZLdDJWSGVzeXE1b2ZM?=
 =?utf-8?B?bjFoUjdsNDMrRnlCa0dEV0ZpbGtpM0VKZmpDTWVmQzFqQ05pTWxWUkJtdnVa?=
 =?utf-8?B?cys5Qm5QTUtCeUJ4K2pJNUg4eUtHbEJ2S0JpZ3htTG56eENXcVcwbERoWnZp?=
 =?utf-8?B?cElYN3VOZk5MREVZR2RZbHZHd1oxbm9DWmlMSERxVDdCaGxyeWJzZ3pTeXJP?=
 =?utf-8?B?Tmo0RHEzQVhhUXl1aXlWd0pTRFpubFkzNGZKQnhXSlAvaCtDSmkxdWFQdlhJ?=
 =?utf-8?B?RGN3L0dqbjV4ZzU4aXU5c0k2R01EcEUxZVcvQUNtM1JZMUFwYlBKOVBRaWc4?=
 =?utf-8?B?R2lUZXpOUXJ6ZEJYVjIxUEhCd3l3MDhPOWQzK1VJbHdmUEhKaDBYQ2xCMWgx?=
 =?utf-8?B?OE5pay9naW1QVHM2OWpjVHVJdy9yZHBkSlFnK2QxclAzTm5VU1NqT0g0Y0VR?=
 =?utf-8?B?WkM5djM0bWFLeWNjckJubDdvaVFyeW5RSTBieStkNlp2aFJ2d2pWV0kvM0Nj?=
 =?utf-8?B?T1Q4Qm91eTRWYXFWcEM2dkJrMVVTbG84OFZVRHBGOEpQZlFlN2JHRmhvdDhQ?=
 =?utf-8?B?ZGpLZXlrSEhaLytOMEV4NTlCOUQ5Vzk0V2VIbHJyeVlFOWN2NjY2MzgvUkts?=
 =?utf-8?B?Nk13S1ZObXhaeHRVZ3lsLzJRN0cvTEdLK1J3OFd4UWRuVzRnM1RObzg1b3kz?=
 =?utf-8?B?VHNlQ2RCaFFneTY0RTRqUFhxWDA1WS9OSlk1UmRkTU1mS3c5NnQ4V2p0aUlt?=
 =?utf-8?B?SmhjTDNVdDhtblRXL1JmZ2pvVUlkYU90eHhLV1dGV1Fmd2thMkV3czRpSzNZ?=
 =?utf-8?B?SlE3UEUyak9qTlJ3cnorQjlyUEs4R2l3WEVwaHpKeklYYlFLRngrak0rcXFR?=
 =?utf-8?B?Z1E2MTlVT1BuY0R1cVI0NTJYcmZPZjJZVXpCNDNpVHFLMFFEaThQQlpGcFVh?=
 =?utf-8?B?bmhEbEVpQlhNMlBzK0IyK3QvMjBzcm5pVzNXKytvdkNpRFJDd2tFNldmRDZ2?=
 =?utf-8?Q?P8h3AUTDOLw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUcrTlhzaGc1bFNuSUYvUmY3cmpKdkJPTEx4TThqS21ZRUZGNUprL3RXU1dJ?=
 =?utf-8?B?cTV3enNIblFHS3haOUFaaDJLeXlvUGdJUEhBTzUyR0l0Z0RuWFpCUlM4TXlM?=
 =?utf-8?B?VkhBOGhFTFBMRkwwbUp1U1dieDhEbHNqa094TlEySXdxYzBnQ3BsbTE1MHEy?=
 =?utf-8?B?TkZWTGZ0YUJlS2ZHV2lGb3pIV1BabW9LTFdEN2NFdWVzOGd6UHB2c3NiN01W?=
 =?utf-8?B?U1VtRkNYV2hVRExlS0xUbENuOTBQTjBYZnBIZzVabmFzeEM3MlVOckJ0QzJP?=
 =?utf-8?B?NWZ2YjU4bGgwYVN6Vk5HcjRZZUpLZTkxdk51bTlUeE42anlmK1dvMjFpWEhO?=
 =?utf-8?B?Wmo3WTJjRlpPTGlvZGI1YW0vb2RZWVpIWE1yVmlKcTg0elRKUW84aHlyQTNO?=
 =?utf-8?B?N2JWQURKMWlVQXpDcGNrYjAyaXprQTIramdlaE4zRDVlYVpGL3YrUE10WlJ6?=
 =?utf-8?B?SXRmSEZORlFuM1NYUm55cmRXT0VpVEk0azJBRnptZStZckZ3WHBXL05wczhK?=
 =?utf-8?B?Ly8wa282OGhPLytGRTFOYUNzYU5lVTJkOHBzelFpZG0ranoxOStoa04yY05P?=
 =?utf-8?B?cjkyQnl2dUhFQk1OZkdHU09uV1BLTUNBWTliTzZ0UTAwL3l3YlNseG14MFFj?=
 =?utf-8?B?VzRtTzBoeVFlSFpLcGxGUkhPYnVObEo0TFlCSmROcmpXVWdHMTZPeG05SlJL?=
 =?utf-8?B?SWZrVFN4dkxDWVVrT1FrK2lvZVZHUUVib2ZJU1QvMjA0Q3g1Qk5ZNFY1cjNG?=
 =?utf-8?B?WXFaakNDQ2w5KzRPQmxobVpGTnQ4a2FiNzh5Q0NONnRtT0hOSHhVMXllRmps?=
 =?utf-8?B?WVNXVU1QUjJnd0RBempIU1M0L2lNSFZWNjU5UERHZWNaZi9JZ3YzTDNjQjVr?=
 =?utf-8?B?OWxQZ0RsQ2VKTlFSRTFmckhRWWlSQTczVTRmR1FLSSsyV0RiVWNDaUNZQk5E?=
 =?utf-8?B?OHdPN0hENlpvVURoN2lFbzhNaTdSVWhNU0w4RzQ3VWdVaW1BbytvLzA5d0Mx?=
 =?utf-8?B?SGFlZ2RVeng1Wk5nMzdWcXhxSnExK0M2K3VMOTFIZXc4eHA0MzdXcTNvUExq?=
 =?utf-8?B?MEhNRzJBb2dvOUVwVXpyaUx1b3lsRm1JSUZIMUVOZG5wcGcyODRaUlVtWnY2?=
 =?utf-8?B?RytZU0pBZVI2WlJWTVdmYzFCMng2ZE52WEJqNllZYlBvVWZ3YVg1cHpxOGsy?=
 =?utf-8?B?SE9qbkU0Wm1KSGZJTW1sRkRZVjN4alhFbUlTVTJVM2NTRGRHdjZPNFo3TUFX?=
 =?utf-8?B?SG5zOHZ6S2tvWGlWVVJCMnFWaUprbjNVSjVhZGtibm8vMHg5dWtKVVpiUDZ2?=
 =?utf-8?B?YkwyTFRuSmZYVkpUTDJJR0huczE3amFvOTk0SVdZOGJXWitiTnQ2VmJJM3pP?=
 =?utf-8?B?UCt0aHR2bi95QnAyNjlUSWt0SWVKUGtaeXhVV0Q4OWJMUExlSGtOTTBOaUtP?=
 =?utf-8?B?UzJkUE9YUnNLVVFmNXdxMFVuZHRjdGJBZHVsWUIrOXoyZGFiUjRZNmdUZUdG?=
 =?utf-8?B?cGV3bXJXU1lIR3diYWcyZlBsZjRMdXNWQnoxMkgrYWkyVFFMeTg0MGdVRDU4?=
 =?utf-8?B?emxFUFBzVThHNkU4RzlaTXdSVXl1SFMvV1RDWWJnNlZqVENIL1NQM1Q5QVBO?=
 =?utf-8?B?ZjB5UXc3NTdvYmNta2kwM3A1d0JtUlRwb3JZWTRub29hNjkrdkUwUWpIL2pL?=
 =?utf-8?B?bjNjZ2hiaUlERmZhUWYrMkdRcXRybllqS2ZreFBic0tEWStpQkdpREltOElK?=
 =?utf-8?B?bitTY09MUE1mUXZmakZ3QkdKUGNZL1Y2Y1QwTGx0YkQ1ZVBVTXFUbjZwM1ZO?=
 =?utf-8?B?OEoxRXlZRHlxd2VXc1hCeHJzZnZMeFVFTll1UEZmUzQyaUtPRWhHdnpYMTk0?=
 =?utf-8?B?aWFFTFF5ZDBHN05wc0pKOUVRK05kVTFwazJ0Mmdvc05HaWFyMjVBWUdybFFl?=
 =?utf-8?B?d3drdkFUOUZQVy9pZzRrYmQzSVVVV0xlZUkrRkdXM3RwRWRDdjYraE5LUzJ2?=
 =?utf-8?B?WWYxcjE5T3NXdThoa3RmRGUxZGRwRXFHNDZIUys3UmxhaldHdkxpcEFFdFlL?=
 =?utf-8?B?bzlqQXJiWUxzeGJpdHFNdUl3YmdRT2p5K1diS3RvbVBvdkkvRWord3N4aHVn?=
 =?utf-8?Q?IvELZmVMaxnc7qVEIJRVccwnh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b391aed7-2faa-4f04-c813-08dde41b2724
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 21:05:43.0860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYa74nSn5YQIsoDzTUr/jTYZDVeg8PQ8RkckSHU+vgF9hK6C7qbG7jIEH+D9Sw+Oe7NSUKqENpxLuOuE9rzS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9711
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

On 8/25/2025 4:02 PM, Antheas Kapenekakis wrote:
> On Mon, 25 Aug 2025 at 18:47, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 8/24/2025 3:02 PM, Antheas Kapenekakis wrote:
>>> On the SteamOS kernel, Valve universally makes minimum brightness 0
>>> for all devices. SteamOS is (was?) meant for the Steam Deck, so
>>> enabling it universally is reasonable. However, it causes issues in
>>> certain devices. Therefore, introduce it just for the Steam Deck here.
>>>
>>> SteamOS kernel does not have a public mirror, but this replaces commit
>>> 806dd74bb225 ("amd/drm: override backlight min value from 12 -> 0")
>>> in the latest, as of this writing, SteamOS kernel (6.11.11-valve24).
>>> See unofficial mirror reconstructed from sources below.
>>>
>>> Link: https://gitlab.com/evlaV/linux-integration/-/commit/806dd74bb225
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>
>> Directionally I agree with this commit in favor of what the downstream
>> kernel tree has that you linked above.
>>
>> But I would rather see it sent alone and not tied to a series to
>> overhaul how quirks work.  If it's sent alone we should be able to get
>> it reviewed pretty easily and in drm-misc-fixes.
> 
> That's a good idea. However, this commit relies on patch 1 and 3, as
> it has no edid information and uses a second match.

The EDID half should be a solvable problem.  IE the EDIDs for Steam Deck 
and Steam Deck OLED are known quantities, or a least trivial to dump.

And once you have the EDID in place I'm not sure if you need a second 
match anymore or not really (at least for SD/SD OLED).

> 
> Antheas
> 
>>>    drivers/gpu/drm/drm_panel_backlight_quirks.c | 17 ++++++++++++++++-
>>>    1 file changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> index 78c430b07d6a..5c24f4a86519 100644
>>> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> @@ -73,7 +73,22 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
>>>                .dmi_match_other.field = DMI_PRODUCT_NAME,
>>>                .dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
>>>                .quirk = { .brightness_mask = 3, },
>>> -     }
>>> +     },
>>> +     /* Steam Deck models */
>>> +     {
>>> +             .dmi_match.field = DMI_SYS_VENDOR,
>>> +             .dmi_match.value = "Valve",
>>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
>>> +             .dmi_match_other.value = "Jupiter",
>>> +             .quirk = { .min_brightness = 1, },
>>> +     },
>>> +     {
>>> +             .dmi_match.field = DMI_SYS_VENDOR,
>>> +             .dmi_match.value = "Valve",
>>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
>>> +             .dmi_match_other.value = "Galileo",
>>> +             .quirk = { .min_brightness = 1, },
>>> +     },
>>>    };
>>>
>>>    static bool drm_panel_min_backlight_quirk_matches(
>>
>>
> 

