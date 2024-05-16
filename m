Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0038C7E22
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 23:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B6E10E139;
	Thu, 16 May 2024 21:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C8uXA8Zk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2076.outbound.protection.outlook.com [40.107.95.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BB810E139
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 21:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNxraCjUIlh3JFPccut3tbSJqhAoJmDu25gsxT/vC/htLGGDDnEu406A9NESGodHYUKEaBv/OHo5diPz25HBrr5/0MrwwheJX+VUu7l8+fZxeE+Yu0Ob+OHd+l4Gss/Yqtik45TDX74wr8VotQNoNzPq6Esy+/VHCHAi26M5SVL19B7Fx8TZwkWo8kbA3t/rPmInSTNOZ577ZGayUXHeJ/OPdzGIFWTwZsko0Tt5YueU4nbYR/qYPl46snMSBNJbNBwKA5cA0nCk0PfLGteHtaH2lpNLEvAA1W5VYtUevJ9glWVxx4u5rkJaWSQ9RnS9PA4igDRxuGiYz3nklpiTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26lvoL+i0do2wye5lD2AN3dsOzb+oVLBI7lwAGwSq00=;
 b=F4/+nvsM3K3u+0SsmiZiFCVAKWYKfNi1XT53kiYdcbhYvKbp2EC4cQuJ/nq3mtZJPILXtHi1S8FGjpQF1jfPwMoPbqnKLEXSaRc5UFXLYTRSLkpjeJEe7ZgBK87r3NKvdAZzd3qp7+cpaIe5fmtcW8yg5MD0jP532MktfPCf5g+H7AJ2erK150Y5g0bL/kHQzw6qffDADZGW38rW8a7v4qsf6rS7I5RpAPJvEXTE+3ZD4pQEA/dmr5yUsiIYlZZxbuSXRk2GAH91BskBg6ly2v04pttjrhRLAXZO8onikZOB9ZnHkzec1Gd+i5XhFDurCgTqInC+1nShkV5U7WwZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26lvoL+i0do2wye5lD2AN3dsOzb+oVLBI7lwAGwSq00=;
 b=C8uXA8Zks+czOA1SA6CadsDCthCdzaxOBKi3oCbrXyMYqnv5YHUJ7lqbaMYa9iRMApoXcifkvfbsGb/1n+H66fLXVn3WIYCgyzAjfO7b+hfw1E2K89+/mW6Tdh9sZ5v2ULqZlq1atueCK4zOP8tc10gLwgBmTX3YXdoo5/FZse8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 21:58:03 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 21:58:03 +0000
Message-ID: <6225ecf4-f4ca-4ed7-a316-69c86f4ade7f@amd.com>
Date: Fri, 17 May 2024 03:27:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm urgent for 6.10-rc1
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
 <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
 <CADnq5_NmC9bYkPFUD35gBtxsk_9jYhOTugni-q4WGXggf6=rLA@mail.gmail.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CADnq5_NmC9bYkPFUD35gBtxsk_9jYhOTugni-q4WGXggf6=rLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|LV8PR12MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1f735e-a623-463d-9032-08dc75f34275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1dwQnhianJBZklxNElEOUZEVFo0TzQ3S0dKTHRWazdhWGJudGRKRWs1RVp6?=
 =?utf-8?B?ZWozWDhpQllxMmh6SHBET3JlMC9PcUkwbGI5eDNpTm5ZaUpETkJXTGhwbURU?=
 =?utf-8?B?ellNK3p0djFOajhRcDc2RVVnZTlEMFdyeFM0YVk0Y1IyLysva1JHVDJPWkM0?=
 =?utf-8?B?RnNKNEY1aXBrVytQbDUxWjNSUzlhOVZPbUZ4dDFaY1ZwaWlQdmFiczl6aEl3?=
 =?utf-8?B?d1BlcjVJMkJqZWticmxlcXcyN3BxNEQyZkp4R1lCZmNONVFQaUpucnBpS2t2?=
 =?utf-8?B?WkorbkVoVHg0cjdkQjRxZHc5QitVSHE1a3g5M1RyS1QyUTdpVzd3RG43VU5E?=
 =?utf-8?B?amppK2JPWFRtL0hsV3RCd1BsaFJBYnBSYTl0aTl5b2RrTHpKQ3pIY0ZYVE5D?=
 =?utf-8?B?RWZjaVc5UVBvZTJJYVV0UHIvTlFoY3RTUHJsMHZKa0Zoc2xvNC9VUVlLN2U5?=
 =?utf-8?B?WWp1UlVVS3l2UUZkcU0wS1pTbXk0azhXbW9qMnFjeVhqUjJrNkJWTGVKQnNl?=
 =?utf-8?B?MW9OL3BHM1VmQTRIaGxEeVpjc0ZIaVZhVkVEaEI3bjhVTm92SStFWlM4UEpB?=
 =?utf-8?B?THRJTHZlL0tVTWxUU2RtNWpUMDczOWxoaS9KYnZBcTl3VnpRT2tkR3FjV2ht?=
 =?utf-8?B?eDMweitYMW5kMXk1NHBaM1hVdFNHTmd3b3BLdEc2Mm4rMzRkZmpUUUdiRWV0?=
 =?utf-8?B?Skk2eVkvcHowNnJRdnJqc3IwazE5MFlyeCtNRWs4WkV2ZkVqSXVSWThjYk5a?=
 =?utf-8?B?RmpZeGhUMTBoRFZLVGNDNjVYdnBNOGlJcWt1RnpvMmgyK2xJT2tKcWRZUHpT?=
 =?utf-8?B?WjNSMEpicEFzdHFmT0JJWHpsZjJCZFhuaFBZUjdad04rQmNQMUxWa3FLcjZJ?=
 =?utf-8?B?NU5ha1dkL0lrdUZpczRTbkU2anJ6cTJ5cHdOcnN0clRUS29NT2R3ZzcrZnA1?=
 =?utf-8?B?UlVqOG9yb0ZhcHJlVHBZb1VaZWVxYi83RXcxMWVlQ2hteWk2Qit6VGxRQU5x?=
 =?utf-8?B?bitTdzNOOTlIbWdWVklNUjMxT0E1ZFVJb2ZPSzRlSWRWT0grcVRrRWovQmFt?=
 =?utf-8?B?UW96c0M4OCt5MjNYNFl1RHBzTFNVdFlTa2hNVktybVJJSkVSR25jT2VOL0VY?=
 =?utf-8?B?WkViU25qNnpMSC9FaDdaT0R5MlZXZ3dPOVAwMzdUWmFJZlZ2cWRwZU8yZzdw?=
 =?utf-8?B?R1plS1VvenJ4WmR2YXpVOURQVDd5TFU2ZVVsclVqYnVSbjZDUWVBd0FBVjhQ?=
 =?utf-8?B?QjZSclBNWjk1aGRQR0pMWjl2UDd4eUJKRHd4UWtzbmRRMno1NVdJZkZVelNW?=
 =?utf-8?B?L05IMkdmOEdrOVp4VitQcllGMS9WaE50UTZoNkFBMmhHUmlFbExaMy9hUzda?=
 =?utf-8?B?RWFRZ3pTcGRwRnZyRjhqMFRKSXhWVThpeWFxK3QwTWVsWGdtSG9xT1p5WUVP?=
 =?utf-8?B?eDNXN3JSUVdCRyt5N2tVS2RiVXFYZVRaRWY0ckE1T3I1dmtSNXhYdS8rbERi?=
 =?utf-8?B?N0o4aVNQNUhsdjlHT0QwSWdhME1Xd1pYaU1NcDFXZ2RMWWJEUjZKajR2bVk2?=
 =?utf-8?B?WS8zRlpjS2FBWHVOSkVNS25Hb1ZYSUlwbzQ3UllaSjgxN1R1M2hUbHFiSTBX?=
 =?utf-8?Q?tF9DKK5iXQLJNGdIvnX/iJ73zrTZFs/5rtVJVoMvcqWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE1zMUdzY2g0MDBNMFg3TlBYTDBzQUZtaUxHZFRyVzEvRE93dG5EQlYrSlps?=
 =?utf-8?B?bWJEM1pTUXpGRTFOMlFuUFovU2tMK1h6ZG9TMUZ5cUM5V3RDQUNIclpENFZ1?=
 =?utf-8?B?a3pOQzRKdlBtNmtYbzRFa0NFUExoT0w3SzRCelVqeE91Sy80aFBoeHFpWnFF?=
 =?utf-8?B?RHZ3TC9ETWczY1JlMXM2MHR6alFrMkRjS1Q3NUEzZXF3amEweWpGUHFaYXd3?=
 =?utf-8?B?alF5VEJuTEx4Y21COExOSWVqMXRDbVArLzQ0ekt3ZkxoQzVUenpGbkZMSlBG?=
 =?utf-8?B?UFFnNWRTOVdoRmwxOGwzdk5EQjgwaFFNcnVmbzU4UzBCK0ZTRTkzdWV1UnJU?=
 =?utf-8?B?TUlZQmkycDYvV0luTk13cmJudEgwOGtqM0lwd1BIWkd0VW85RTNKMnBnM3ZS?=
 =?utf-8?B?aHFrWFVWQTBrNWtDd0oyMzhJY3VobGJKdlYwN1BmaWVvYzBTSkVxSlN0cGs5?=
 =?utf-8?B?UTRiRHlwSmNNVEZ1VWppN1BkY2lTRENkTmVnTHFRVkgyMU1KZERRZ2ZvaXZM?=
 =?utf-8?B?SlpyTVNSYVBBdzN2MzE3RzA3Ym5CL0VZVU9JcmxibnhmTERuUmd3R2xRK3RI?=
 =?utf-8?B?Vm5aTXdGUzVwQ3orTGlHTFFUR0tBektnVFZ0VC9ZTWU0cEdYSm84czIvdDZz?=
 =?utf-8?B?UU1IT3pmVjdRbzNtd3VPSzZNRjcxQ0hkQ3Nuc3JadVlEcUlEbHZqVzg1bHhS?=
 =?utf-8?B?MzV5dDFNdnZvNHcySzRYcEd3TWV5TzFuUyt4WTZBaUQ1V0UyZmlNYVdvMWQ5?=
 =?utf-8?B?ZGc2K2cxWTVrT2JMTnhQd213bktOZVdobFhnUDRDeG5aMUh4WHdqVHpsMmp4?=
 =?utf-8?B?RWY0M3lEUDE4WFJjaGM1anlVNnE0bGxqSnJMT1lPL0ZiNC9oSFVCYnJBTU9j?=
 =?utf-8?B?QUtzYlhmT2dOUFpjVE51dHlHU05WUmwydXExRk9ndmxTR0tqd2ZWa0ZQN2JH?=
 =?utf-8?B?N1VlUmJnV200QWg3NEdYdHN4SExMU3BncmxYampoNTh6TW1uZFN5eU1pTWJq?=
 =?utf-8?B?Rzd2bzlSbnVXMHhlOHV1blZrVW5aQThmY0tFVDhIRm5xN0dpZG1YU21jdnJK?=
 =?utf-8?B?eXYwOSs0ajRMbEIwYXBKN25qWXoxbm5TUXNkU1BwMXZYWThiRUZRblgvU3Bj?=
 =?utf-8?B?WFpvWTgraU01UXdmUXFtdXJPbmNmWlFqajVBYTdvcmF4MkJtUnpGY01odVN5?=
 =?utf-8?B?QmNETkJOYXVOVlEyeFI0aGIyMzJmMEJtT0diMnVabnZYK1ZKYVNmbEttQ0pG?=
 =?utf-8?B?ZTFHTDlrYTkxdUJSS3lwdUNsWXl0VnJtZjh3MGdoOHZwSEUxODZ5UjVlaFN6?=
 =?utf-8?B?SU5SSUNDMXJTYUNoMC9zdVExa05WMkJJU3hjbzZDZHZuUXUwdU9TNlhJRXBj?=
 =?utf-8?B?NjJmMXdUY05KcW1VVDZqekhlMVJXbW1BSnBRQ1JGMHdWOEQ3bkhjMEdhanZ2?=
 =?utf-8?B?TkdFNTAvdHVVU0ZqZFBZYWcyZVIzbUp5TkR2eWd0OHJKaDlvdGJ5aW1aWGJk?=
 =?utf-8?B?aUJKd1FscitJSXlFVEd3a3htTy9ReVErZkpTR3pPekJsT08zSElWNzNMVmJa?=
 =?utf-8?B?Q0tDUkJjTlUxRkdld3hRdHlHUlgyVFBIMUdMZFZhUXZ2cGdIdXhPaG1TeXJn?=
 =?utf-8?B?dHdob3hhOWgrS2lRZ3RmTU16dnlGK09zZkdvK1dTc0FUaVBqYWRoYjZ0bEt0?=
 =?utf-8?B?eHdlR1gyaXFwSnVKdTh6dUlWT01sZlV3WGpCNzN5VHZuZkNVMU1KZkN2cTBR?=
 =?utf-8?B?ZVFkMm5kQ052anB6UTlWWi9NdW9EaHFiQS90RUp5eHBmTWRXajJXZDdoTlVh?=
 =?utf-8?B?NlNHQ0daU0dhamNhNkRIZVdZMFFyTWZNWVVVSnhLZmtHUGdNUFBIZDg5NDRI?=
 =?utf-8?B?WGtFVDV2c0VDVHZXVVJQMFNhMFo1Rmo2VUxiTTFtUE9uVWo5K3hZYmZIYmZ0?=
 =?utf-8?B?d0Rqa0NQTWRRV3NYYVVCUVY1eWJlN1hMWjA5SUpibHFUZE96Nmc0ejFHcWlS?=
 =?utf-8?B?NjcwUWl2WnByR0xTUXBVcmdySHIrREc1M3pFTlVMTTFqWjNrbTZST01VQUU1?=
 =?utf-8?B?b0ZkWmcyamtRbTNiSlkwdTY5L1ZKTkVpZ3BHekxtZERpMVJndy82cmkrRjdy?=
 =?utf-8?Q?O0vNod1dXgN8N9ptjin2y2s02?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1f735e-a623-463d-9032-08dc75f34275
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 21:58:03.5410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hClYKh2QyrPopkhsQWGfuCQwjhRlf4F0NfTf5DiUGgjVAhNUdW7zTgxEcN9HtcLK43+5xvOH1WchNXpLTjoBew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232
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



On 5/17/2024 12:01 AM, Alex Deucher wrote:
> On Thu, May 16, 2024 at 2:02 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> On Wed, 15 May 2024 at 19:54, Dave Airlie <airlied@gmail.com> wrote:
>>> Here is the buddy allocator fix I picked up from the list, please apply.
>> So I removed my reverts, and am running a kernel that includes the
>> merge 972a2543e3dd ("Merge tag 'drm-next-2024-05-16' of
>> https://gitlab.freedesktop.org/drm/kernel") but I still see a lot of
>> warnings as per below.
>>
>> I was going to say that the difference is that now they trigger
>> through the page fault path (amdgpu_gem_fault) while previously they
>> triggered through the system call path and amdgpu_drm_ioctl. But it
>> turns out it's both in both cases, and it just happened to be one or
>> the other in the particular warnings that I cut-and-pasted.
>>
>> As before, there are tens of thousands of them after being up for less
>> than an hour, so this is not some kind of rare thing.
>>
>> The machine hasn't _crashed_ yet, though. But I'm going to be out and
>> about and working on my laptop the rest of the day, so I won't be able
>> to test.
>>
>> (And that kernel version of "6.9.0-08295-gfd39ab3b5289" that is quoted
>> in the WARN isn't some official kernel, I have about ten private
>> patches that I keep testing in my tree, so if you wondered what the
>> heck that git version is, it's not going to match anything you see,
>> but the ~ten patches also aren't relevant to this).
>>
>> Nothing unusual in the config, although this is clang-built. Shouldn't
>> matter, never has before.
> Arun is investigating and trying to repro it.  You still have a
> polaris based GPU right?
We haven't been able to reproduce it across variety of GPU's. Would it 
please be possible
to send your dmesg logs and kernel config, I will check this on the same 
GPU you are using.

Thanks,
Arun.
>
> Thanks,
>
> Alex
>
>>              Linus
>>
>> ---
>> CPU: 28 PID: 3326 Comm: mutter-x11-fram Tainted: G        W
>> 6.9.0-08295-gfd39ab3b5289 #64
>> Hardware name: Gigabyte Technology Co., Ltd. TRX40 AORUS MASTER/TRX40
>> AORUS MASTER, BIOS F7 09/07/2022
>> RIP: 0010:__force_merge+0x14f/0x180 [drm_buddy]
>> Code: 74 0d 49 8b 44 24 18 48 d3 e0 49 29 44 24 30 4c 89 e7 ba 01 00
>> 00 00 e8 9f 00 00 00 44 39 e8 73 1f 49 8b 04 24 e9 25 ff ff ff <0f> 0b
>> 4c 39 c3 75 a3 eb 99 b8 f4 ff ff ff c3 b8 f4 ff ff ff eb 02
>> RSP: 0000:ffff9e350314baa0 EFLAGS: 00010246
>> RAX: ffff974a227a4a00 RBX: ffff974a2d024b88 RCX: 000000000b8eb800
>> RDX: ffff974a2d024bf8 RSI: ffff974a2d024bd0 RDI: ffff974a2d024bb0
>> RBP: 0000000000000000 R08: ffff974a2d024b88 R09: 0000000000001000
>> R10: 0000000000000800 R11: 0000000000000000 R12: ffff974a2198fa18
>> R13: 0000000000000009 R14: 0000000010000000 R15: 0000000000000000
>> FS:  00007f56a78b6540(0000) GS:ffff97591e700000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f5688040000 CR3: 0000000198cc9000 CR4: 0000000000350ef0
>> Call Trace:
>>   <TASK>
>>   ? __warn+0xc1/0x190
>>   ? __force_merge+0x14f/0x180 [drm_buddy]
>>   ? report_bug+0x129/0x1a0
>>   ? handle_bug+0x3d/0x70
>>   ? exc_invalid_op+0x16/0x40
>>   ? asm_exc_invalid_op+0x16/0x20
>>   ? __force_merge+0x14f/0x180 [drm_buddy]
>>   drm_buddy_alloc_blocks+0x249/0x400 [drm_buddy]
>>   ? __cond_resched+0x16/0x40
>>   amdgpu_vram_mgr_new+0x204/0x3f0 [amdgpu]
>>   ttm_resource_alloc+0x31/0x120 [ttm]
>>   ttm_bo_alloc_resource+0xbc/0x260 [ttm]
>>   ? memcg_account_kmem+0x4a/0xe0
>>   ? ttm_resource_compatible+0xbb/0xe0 [ttm]
>>   ttm_bo_validate+0x9f/0x210 [ttm]
>>   ? __alloc_pages+0x129/0x210
>>   amdgpu_bo_fault_reserve_notify+0x98/0x110 [amdgpu]
>>   amdgpu_gem_fault+0x53/0xd0 [amdgpu]
>>   __do_fault+0x41/0x140
>>   do_pte_missing+0x453/0xfd0
>>   handle_mm_fault+0x73c/0x1090
>>   do_user_addr_fault+0x2e2/0x6f0
>>   exc_page_fault+0x56/0x110
>>   asm_exc_page_fault+0x22/0x30

