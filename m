Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FDB1B0A7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 11:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CE510E616;
	Tue,  5 Aug 2025 09:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ocd7IayW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ECE10E61A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 09:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF9Mruo4ArbKWBFJZryok96/IQGn5QT5ukJUnu/EKx0YHtePePNs0Q5yAGon4JYRYPNJaiP/rDRgXbB7VnLtGqOKJ0MznIl+giloCk/gtxbnbLCn8JPfbwZTmKraY/YTN9BCBv+gZ7bkz/fnwCZQCChEer/ckwJu/QbuOtyO2ED7TG2zWzI4Kk0smdbLJ30dIuDlyoDMkkKAvnfXakUVGzJiAp8pJy0UbjlvMFBpEBSLLV8jIjaKNGFVEg+IJfk4hX3FVBrmDh2R7ePbrnZbku8oWjD041YZmzim/guSXWDgOxwaKeoPcz8s8EYUM/NUQgWQtgxbZBYSevScdMep/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUiNhU9pME8bYZlm7TEDFJwLeqF0IA73GiwhMvwLrIE=;
 b=c+S4Vy8zIgRBeWjaOos9bkZgQAsR25hOPxQmacjRrl+8vVXe1tnzwJqfuxpIhD58GobjDmwg9gRJ5bZTT/cyIzbMCUBx9ux+sMHjz/vfyz//L8HHh/3f9lm917EnKHvhLlgGyWdonCQl2efSdB/03hulzV/4aWET0ADrwK7sYpAFe4jMSple+GDiXcetkwj8bSxpoDR4LV5hS2ldIM7gL221ACtfuYmjLrhjcFHReBzXlETPQC+tU0JbcifDvD0rSUMll7xmzITvJpc3ZkbhEON4yZIsF4dOgZITG5W89FuAJ5B6SRDOGQIK9cIy5yfkqktpax/dxHpIZA7eb35Jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUiNhU9pME8bYZlm7TEDFJwLeqF0IA73GiwhMvwLrIE=;
 b=ocd7IayW7X8K0u6iLADtaKnU4/dB1YQg3nKEwrDQyj3a3UDfnN4MaR0Af8IbAiS+4lX6ovHz3uIYm+T3PIbtcmkuaU+WKDJzVXmiQ/w7BCy4fnTIyATavxKBXcosSUPUSTqrNnf4L2ccMgVUEz7L0G0X/hj0PU5EYdaohDbLtZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 09:05:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 09:05:25 +0000
Message-ID: <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
Date: Tue, 5 Aug 2025 11:05:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Extend and update documentation
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250724140121.70873-2-phasta@kernel.org>
 <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b26ea9-529b-45d9-1a98-08ddd3ff36e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWIrUHVBTXFiN2NOb0h6aHI4c0dGM0h4eVFqYjVJb0Z1c0RhV1p5N3lKV294?=
 =?utf-8?B?V2p6RXRmT3cva3pWWlByMU13TWU5L21wT3YrZUN6RFo2N2tWTHZmRVRyK0dB?=
 =?utf-8?B?ZmhDcTRSSkNLb0JSZVUweXVQNFJ2bFVNWXM0M3Q4R1lWZGMvWUxUajcydE14?=
 =?utf-8?B?TGRrTzBuYW5MbnFIZTNSbVlIT3JLdlM4MCthSWtMaGFsc1ZuNlFNZjQ3NThw?=
 =?utf-8?B?S2xKVjJMQ1JYcjAyYnRiaWxWcnR0QW1uVG5FOWdOVTFoSXNtZ25ZNnFZUElG?=
 =?utf-8?B?NER4Y3ExZU5jdkRJaldLMFYxeFM1bGZNYjV6Vk5CajIvNWQ2cTA5RnFJTEZu?=
 =?utf-8?B?SWdYb1RmaVBKbVNPNllVMUNMbUhyeWhaQTRVMitBQlhTNHdPV1lHdUo5empl?=
 =?utf-8?B?Y0dqVyt1OFphUTVVbWpIZGU4RFc3LzJJekhrdzBPaGpjclVWNjI1RHlxV2Qw?=
 =?utf-8?B?R0lBYytRT2dLK1B6Kzh3WndIbElrVU9uS0VuVkE4ai9yYXBtQXhOR3RpdG1V?=
 =?utf-8?B?NWI1NUpqSVNRRlZzTm1kN2d2aFVyUHNBNW9wRFNyQVFLS1BXY1E5cjJpeVQy?=
 =?utf-8?B?ZjhZekRxUEd1S0dNUXBySGlBVDJteThlY2lGOGZnV0VPZnR2QUZqejBLVlBL?=
 =?utf-8?B?Z0JPWFphUGhvS2NzcHBtMVlSOWxaRGYvZHhsM2RCMmVHTjRlWGwxeUE0ZGN2?=
 =?utf-8?B?Rm1aODBFVnMzeHRORVp0dlByS0I2bnI3LzdzUzIyNXJpZjFsdm9nOVFaOEpo?=
 =?utf-8?B?Nzc0cktNeU1iOGRiaDlDSmlxS1liV2gvTS9lY2lVT0Q0enFSWktHR09tcnRB?=
 =?utf-8?B?MUVzbEhqekhHdGh1MG5CeXRoSE5Ud09OMHEyVlZ5WVpwRmF1WGlEY0hkdVg3?=
 =?utf-8?B?K3JqUG83ZVp0WVN0RGw1Y2tSM1JCTmdsV1RsRy9YUGZpWmIwbGxWN21XVHdk?=
 =?utf-8?B?SW5yaHJkWm5xTk14ODlzNGg4dlpBVUdDZFJ6TXBSNGVXWnpMU1QwL0ZLTmRY?=
 =?utf-8?B?WTcvdzlqY2F2Z0d0SDVrbGt4TXR5TUFoU0RQNVo0MzF2azBqUmE2ZmRvYnBS?=
 =?utf-8?B?dW5ZN3Y1SDBrU0VtMCt6SnpnazlCd0VXQWRCT29oZEFOV2lRRDhrSWgzMHEw?=
 =?utf-8?B?L2lmUUZiNzhoUVpJOHZSend4Tkg5dzhrSTI3MjZLZ0t6bjZzMGVGUlRYOWpV?=
 =?utf-8?B?L2JwMk1vWVRnMURNNnhaTjg2NDZ6V0xuNm5tRngwUXE0LzRQRDRoTlFqKzZN?=
 =?utf-8?B?Y1BMTTJQc3JxQ01tS0ZiTmFUUnN0c1hNSjIxVVpESEhrNEduR0N2RXhPdTRP?=
 =?utf-8?B?dHM2YUQzbmgxalhzWEFOR3lCaklGVjdReXVqdUlWaW4yTXpydnNxc09NNW9n?=
 =?utf-8?B?dnBKQkZJdjlDUnI0LzMzYmdXb01hOXhFbnZidnVMa282NjBIMnk0U1NPSG9R?=
 =?utf-8?B?SlBUcjg1QlVEK21uV0tsQ1p1dUVKbDVtTmh0T083dWNZQ3lVdmJWbDY0dnU1?=
 =?utf-8?B?bzdtNElaQUlkd21ZMENhazN6NFVmYytVNkltNHFRamw0S1Vid3RUemhETDBm?=
 =?utf-8?B?cHVMNVZZR1FvVWVyVVZmQTFLRmNtR2NGQ2RlZk44R1g3bG95RmIvVVh2aVZN?=
 =?utf-8?B?N29NdXg5b1ExVmZNQ2o0ZDl5TkNGUUdUeHR3RVRVQ3kxbjBEUVpLM2g5Q2tw?=
 =?utf-8?B?M0RWK2x5Y0piNjJPMFZTSC9nOWp3QkVIZHhXUDE2bWZOTmJ5NlVNU29KaGVM?=
 =?utf-8?B?SHNrdHZuNmFLc3FkM1UwYVhiZ1dVVUhrQ0FkVjhlejBTL1phcVUzUEkrdTdF?=
 =?utf-8?B?T1h1N3p6a1JleTFFdEYrOE56YUVXMnFpRzE2SkFjbnU3dlE3dGc3RmJ4Z3lL?=
 =?utf-8?B?dkxScnV3cnZ2OGV2alg2dVJQQXU4N0tFZGlKWFVvc093ajBLRzVXU0kvMHhJ?=
 =?utf-8?B?cG5HZ205Vlk1cEtucExNMkc1V2dJM2JidDdNZlNxa1dPbWFVb0pMWHBrL2Fy?=
 =?utf-8?B?VUtnK0dldjFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVmOXhLdnA5R2JCQ2EyYmF0WlRiVnVaRm1jcmhZZlpuekRVQ0pRZlZUczVZ?=
 =?utf-8?B?QVo1SEZ6REQyZFdkZnJXbXRxWk9INlQ1dGRwZEtMc3czdGw2dXhSWlJQR2VE?=
 =?utf-8?B?bFBIWWU4dFVGNnduL1Y0SEtvdHE0K1dwOEQ4TEtsMERTWld5TTNTUVhnQmlS?=
 =?utf-8?B?SDdTRGhWR3Z6NFRwUUwzR29zYWZZY0Rzb3FJY0pCRGVZbnlIR2tmWnBpKzRB?=
 =?utf-8?B?Skk5d3FHY0Zqa1pKM0I1dHRBeUJKMmpDSDdjMllMZ29ONmRJeDdxY2MwdXJk?=
 =?utf-8?B?QUJUUndhWEt2a2hSRHJCKzZ2R09haVNuMGkwczlSOFdYTS94QVhQNWpuelA1?=
 =?utf-8?B?ck45NFlCK1VQZ2NkY0greW1zVS81TXRhTjVGWFdHdEhjR3hGWTBYcUlCc0Fv?=
 =?utf-8?B?UThXdWhrZmlMM3QzKzZIQm1ralpJajh0V2hTejV0VCtROUZ5MzZHRHd1RDM5?=
 =?utf-8?B?aHdCajI0OENGVTRxbzRDNmVtcUZ4emtjQ2d5dTcwS2RmeWJHeUFSQ2tzL25u?=
 =?utf-8?B?MkNTY3ZHTU0yVm9ERUkvSFJQazY1MndJdytXOVdQcy8wZHZLWlh6K0llOHZN?=
 =?utf-8?B?b0U4SmJxUDkyWVJ1L2tkSXJRQ1JEVU9iL3ViNlZPeEJtMGRUQUwyY29GRFE1?=
 =?utf-8?B?Zm1tY2hia3pUUkx6emhUbnZpNWdBeUFCRlN0WTduWE5rK1JWSkEzUTZLNDYr?=
 =?utf-8?B?dkJRTUlUQ2NXaGR0NVpPazYrK3pGc2wxUnN3bUhZTTM2alhhUWtDRVFOMG9k?=
 =?utf-8?B?WjViNWs4TE92SVNudlBRVkVudUkwZmFEaitYTkdrWVhQcjN5bUJRODNSN1Iw?=
 =?utf-8?B?YWtGSlZmdG1mL3I5bjN0dHlLcXA5bXlYWmtKY0VzR3dudXIrUmNUNm1VbFR5?=
 =?utf-8?B?S0wyVWlkaWJwSHZZcG5NQTNHL3NML0pyV2pkdEFzRXMvNU9xck5VaVhWdmFC?=
 =?utf-8?B?QmpsaHNUMGlmaUJJbWYwRkVsQW5VMjI0dTN4cWpRYVhqQjU4c0phRE15WkVV?=
 =?utf-8?B?VEM3bjUrSUxxbHJOWE01WkgxMytmN3RVSW1iT25DbFFCY2M2SjFLU3QyL0th?=
 =?utf-8?B?eWVYQ3djYmhHaTNMZSs1cytLcFVCTzBiNWNXOVVoZHM2ZGNWbUJkd3IyQkhu?=
 =?utf-8?B?aklXTDNUOVRRL1pIeWZOUzZKeXdXbVdFRUhkcXR0YmJwVzRxT1NLcXBNZzA4?=
 =?utf-8?B?bndNU3hRSlNvWkxTdEI4MTN4QWhLa3BtSHZUM3dmT3NHcW9EdWtNSTc4VHNs?=
 =?utf-8?B?dG0wVm9ZVGVqWGthYlZPRlRJRDdRV245UFZNQnZ6NE41cURGRVdyZ05KS25R?=
 =?utf-8?B?b1hQNklIdHNDZm9zZGV6YWhDWUxaLzFIZUtkd2tmN0JCMVpwb0pyZDRSR0lM?=
 =?utf-8?B?d1VJQkE2dU9rTmZqdG1QaUJvU0JMdlJKdHlTZ29CRzBpZk5kZ0hSUkwvc1Zs?=
 =?utf-8?B?RWZvYVZFWkdhaGVyRUNpZDArVGpuS2hkYW1Tekt4Zi80b0JDdnM2ZVpJeUpa?=
 =?utf-8?B?NW1ML3JqT2tHQWFYeW5MNFZ6Z2xOSXpjZ3hvWE1FSmpDSXp1c2FUNnNiTTRp?=
 =?utf-8?B?ZE1RREJhRVN6Y0hISEQ2MHZLZ2MvRW9rVHpUZnJVLy9WU1ZnNEVtelhZTU9V?=
 =?utf-8?B?QlhEVWZ4SUJZdGVxeTJWblRtemtwSTQwdmZieitRakRoZDNCMW4zSlVOcklD?=
 =?utf-8?B?ZDJma0tlcEhKQkQzU2JPS3hFT0hiRDh5bTYvaGFNK2h2Z1RKMTY5VXNSV05H?=
 =?utf-8?B?Z21wSDNrQ29DMFN6T1JzY0Z0SWNxRGFJTlBEOTVPTktGM2pBMXVpWGFtWlI3?=
 =?utf-8?B?RXp5RnlLc3JsNGdtN3MwNVhSdmpVaWJnaGpDdnNuOFRLeWVmL0xoa0ZLcnpt?=
 =?utf-8?B?NFNmM1RlcUtLNi9xdE80T0dORHBKTWpBK2lNQjU0V09Gb0tvWjJXTHdJOU9Q?=
 =?utf-8?B?cUlSb043ZytMVHhKRkpvSWFPckpoK0ZEY0RjbnRKVThQNFc3YTBXQ2NhbjA1?=
 =?utf-8?B?L3liZ0hWcnZVaGtmOG54VHNrb3JXL0RKQjNtbEY5VTA3cDdzNFVEWm4wV3Np?=
 =?utf-8?B?TzNsNTlJeTdKU3paYm53dVhLa3d1anA3ditIdi8yNi9yUFNUaG8zSEJwOFJj?=
 =?utf-8?Q?nzR7d09YI4ByWwpoYqrrgp2R1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b26ea9-529b-45d9-1a98-08ddd3ff36e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:05:24.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsIr9Wfmbv2qogTyBA0c25AqwQQQ+dk/f0JZ78MN699TMFoKhtWh0+asp5bERgLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
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

On 24.07.25 17:07, Philipp Stanner wrote:
>> +/**
>> + * DOC: Scheduler Fence Object
>> + *
>> + * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
>> + * time from pushing the job into the scheduler until the hardware has finished
>> + * processing it. It is managed by the scheduler. The implementation provides
>> + * dma_fence interfaces for signaling both scheduling of a command submission
>> + * as well as finishing of processing.
>> + *
>> + * The lifetime of this object also follows normal dma_fence refcounting rules.
>> + */
> 
> The relict I'm most unsure about is this docu for the scheduler fence.
> I know that some drivers are accessing the s_fence, but I strongly
> suspect that this is a) unncessary and b) dangerous.

Which s_fence member do you mean? The one in the job? That should be harmless as far as I can see.

> But the original draft from Christian hinted at that. So, @Christian,
> this would be an opportunity to discuss this matter.
> 
> Otherwise I'd drop this docu section in v2. What users don't know, they
> cannot misuse.

I would rather like to keep that to avoid misusing the job as the object for tracking the submission lifetime.

>> +/**
>> + * DOC: Error and Timeout handling
>> + *
>> + * Errors are signaled by using dma_fence_set_error() on the hardware fence
>> + * object before signaling it with dma_fence_signal(). Errors are then bubbled
>> + * up from the hardware fence to the scheduler fence.
>> + *
>> + * The entity allows querying errors on the last run submission using the
>> + * drm_sched_entity_error() function which can be used to cancel queued
>> + * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
>> + * pushing further ones into the entity in the driver's submission function.
>> + *
>> + * When the hardware fence doesn't signal within a configurable amount of time
>> + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
>> + * then follow the procedure described in that callback's documentation.
>> + *
>> + * (TODO: The timeout handler should probably switch to using the hardware
>> + * fence as parameter instead of the job. Otherwise the handling will always
>> + * race between timing out and signaling the fence).
> 
> This TODO can probably removed, too. The recently merged
> DRM_GPU_SCHED_STAT_NO_HANG has solved this issue.

No, it only scratched on the surface of problems here.

I'm seriously considering sending a RFC patch to cleanup the job lifetime and implementing this change.

Not necessarily giving the HW fence as parameter to the timeout callback, but more generally not letting the scheduler depend on driver behavior.

Regards,
Christian.

> 
> 
> P.
> 
>> + *
>> + * The scheduler also used to provided functionality for re-submitting jobs
>> + * and, thereby, replaced the hardware fence during reset handling. This
>> + * functionality is now deprecated. This has proven to be fundamentally racy
>> + * and not compatible with dma_fence rules and shouldn't be used in new code.
>> + *
>> + * Additionally, there is the function drm_sched_increase_karma() which tries
>> + * to find the entity which submitted a job and increases its 'karma' atomic
>> + * variable to prevent resubmitting jobs from this entity. This has quite some
>> + * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
>> + * function is discouraged.
>> + *
>> + * Drivers can still recreate the GPU state in case it should be lost during
>> + * timeout handling *if* they can guarantee that forward progress will be made
>> + * and this doesn't cause another timeout. But this is strongly hardware
>> + * specific and out of the scope of the general GPU scheduler.
>> + */
>>  #include <linux/export.h>
>>  #include <linux/wait.h>
>>  #include <linux/sched.h>
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 323a505e6e6a..0f0687b7ae9c 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
>>  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>>  
>>  	/**
>> -	 * @timedout_job: Called when a job has taken too long to execute,
>> -	 * to trigger GPU recovery.
>> +	 * @timedout_job: Called when a hardware fence didn't signal within a
>> +	 * configurable amount of time. Triggers GPU recovery.
>>  	 *
>>  	 * @sched_job: The job that has timed out
>>  	 *
>> @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
>>  	 * that timeout handlers are executed sequentially.
>>  	 *
>>  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
>> -	 *
>>  	 */
>>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>>  
> 

