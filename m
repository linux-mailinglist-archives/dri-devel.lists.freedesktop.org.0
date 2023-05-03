Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD286F5A8E
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C23E10E13C;
	Wed,  3 May 2023 15:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EED310E13C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTmjx7bBxLOxnATUt6nrg2g2X0LEsEn/BWYlHHvcdubEASYg2SYVmW/UcBxjNEelWuR3EYXJbZO0aokx0YVZ1Q4kxezfiVBPxcZrlUS1ueb3pjVWxGBYl4FmehIDTTjpQ1pxwFZLbWYGyI9186sFRsQLlKwFylstg2LfJZPBvhRtZZFtGtpQNUW5WsN3tEpjRoKl6sWLO9Bs+XWj7dsaIS/DV9Efw1XVY96ZjXZAsYIQG9JBX3XdWaCHouHFPB2aDnGhrL8ucjLFUs9TXPMvbfN0ARU8UDNmiICkKiD3R7zleEpe7cFVERD43voTD01GWjrdOHo7Zx3IMh+2Da7Rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS/SZBQJzIzLxjSafGZeU5R6M7VWnbYqFU6UdbfCBaE=;
 b=JH4YYA3xzkTUo3A8mNTIAsAmBqBqJRhfkNH2U/1GfAsDvdfIPrH1Uvwn1mGYhqkTQ276V7uws3fH4wOj+1sYDokvH7N/9fYZ+gPPCIwMvtoC2zgK7+GgTdqR5q/IwPwwo3Xt7ws97Zt/9GC5bTP/s4qnOa5sDLYWFJRjyeJYUfO1tXeZc5akF1r4CDpSGFIx6fGhVUO+7GKy8lWT9HcYhISRWFcQyNDpIEMpnLMyMvTG9N1ERaKu3qL41JCvHhZgsZta2oTWJE4VGHIGyOouCmrP4KL7fCSCQRp2yoSwD7zyQsPc9V6pWRMszS0DVee6+UCotYIoZvx2+L2yWbGoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS/SZBQJzIzLxjSafGZeU5R6M7VWnbYqFU6UdbfCBaE=;
 b=wdaunR/GQuNr/WPHDDbQJFl7VdxMZvj3FUDckPnr9ZmRvRPDRIjSYY8aPXuIXXO7tXRgu4DxcgrsNHSVrcMnqn0d2E+cc78fSEaYCr7AujEefukWYnZOMPh0ALZhDTM2UvTOJ+JbkCSnPb2FAxcVpnjzUzgD+0BOyrox438UjtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Wed, 3 May
 2023 15:01:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:01:54 +0000
Message-ID: <a496a121-a6aa-cce1-238f-6986f3e07db1@amd.com>
Date: Wed, 3 May 2023 17:01:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
 <2ff0d221ed6033bd03c30fdd25abd2a41fb06fb2.camel@pengutronix.de>
 <420b8443-912e-b942-fadf-f80b57998014@amd.com>
 <cfd433ef31f172a15876970ed9d72ff3ed10813f.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cfd433ef31f172a15876970ed9d72ff3ed10813f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: eec2e8d6-3dec-433f-2cdc-08db4be7553b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkmlwZlfXdOmEn7SqiU4m2KRhmzbKfF5Mxi2O17g9u4Ta7fMvlIMWGBDSyYNWxUbFfLN3Z5/BfREjAkcGb3SY1nyQiyppZFgK6+kKiEZKNKbMCXho/rONzu95JO2RRlQDa6vB2U//9hSzDyOJ2cEZX7EKkby2eBeXq6MZepZyXL+GWRo5XYJHXy2ZAYiIPbMgejjgXVAWyoKcvUuX/iVvi0Q1365QC+rqSRi9ZW8O3phtvIw7JW0Qrnww3qdPZpCznrgLqCfVC9j2NFjAh7pDlYal+gDmvFlDpHF2/7UoItTRyni7ON3u42cnbneSJu4yv2hULcjk0IAJwPuynwSLF5yIcgeLHq3ivnUSxpefEs/kYb8NXOdq0gVQt0sayVGT+smqnEyNV953m72igFnOU3i6jj02EWIlN0ypa8oObmj3Nis92AFvp9SSMQtVbW5bpWPck206CMptelZfv+VXVwx1HcTatBnd+tFU+jlcCDDQUMwm85noFUtAGfa+GDUzPHVjQI9Bg/uoOyGsFueBVfoww7SJsfzeRDn7u1O2YVcmULsBo9E44mDxJyGZs//5jFjdFzsTwqJcYjEL7i5LmVGDYigT7TJsERRmXcNUMKoWPA3kUQ5FfJzCS3U2o/nSumM4HqULBEfEfMwg30BNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199021)(2906002)(478600001)(66574015)(66556008)(66476007)(110136005)(31686004)(66946007)(5660300002)(8676002)(38100700002)(8936002)(83380400001)(41300700001)(54906003)(316002)(4326008)(6666004)(66899021)(31696002)(2616005)(6506007)(36756003)(186003)(86362001)(6512007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJVL1daU2x4S1E0U1JLNTYzY0RrVWdOSE93QTU2YmJmVzJGazRqaDZrd1Bv?=
 =?utf-8?B?aU9sQzdUQnFJUjc0V25MTElxVFBYTXlPWXVXdTJPVzdmcHdsd1VDM2lHd3Ji?=
 =?utf-8?B?TXlvM3Z1cFgxc1AzN1gveVpWUUNOMVRZdXN5RlIzWU5YeVVOakRTY3JRQnlw?=
 =?utf-8?B?aVJxWWIweWc5d3NuQjZGRjBWc0tCREFPa1FxaTFKMXBDc1AxSm5ycDgwTFhS?=
 =?utf-8?B?NnJDeEYrK1VtdXcxS1VrYkhDblB2aUFLdFMrUXVUZGVsNm9MTTEyVG90TnZP?=
 =?utf-8?B?R0E0NXhRbjVCMU5BbHB0UDdRTzhWd3VncTV0bHVzYnVWNUtPS2lSc29PNHMw?=
 =?utf-8?B?NGM0RFg4YVkxSEtMR2Z2NlNhcURlTThiTEErRTh6c3dwNnQ2c1ZRaGlwRERP?=
 =?utf-8?B?aEI3SGwzZzhOeWFjWEd6bzRlYUdFSUtPTEdZK21CdkVhcS83WTdqOEt0aTEw?=
 =?utf-8?B?c2hKQys5NlB4NVFVSVNMWUNFZm5XMFgvaldJdTZWcEVuQVg0UHh0RFlvRXBY?=
 =?utf-8?B?SXlVcWZ0US9uMTVEZ1VtNDVja3h5TEpMVFdJY0krUFVUQjUyVVVDTERJZWlF?=
 =?utf-8?B?YURTamc2SE1ZUG9lbThkMmFtVUszYUt2eVNRaXc3UGhZZEFvclVudEs3dTRt?=
 =?utf-8?B?UDJNU2JlaUpqM0VWdFNIcjFqMUJjNDBZcjBkUklueTNaYm5pMlNtWElDa3gw?=
 =?utf-8?B?OHNxZGxlYmlybHBaNk1SN09iYW9jZXg1RmE0REhpYy9xWGRJNHpXZU1lT0tT?=
 =?utf-8?B?bUVhaC8wMFhka25UbzNJL1NWbjFVRVFodXNiQU0rbmk4NjFJSXNpcXgxREZQ?=
 =?utf-8?B?THcwUlpQT3JndWcxR21XSmRsTUMxUGQ4RUVSQm1CL1ZqNklJQlNHS2NIRFB3?=
 =?utf-8?B?L2xUZW1vbEtoRHFKRDR4dWt0bEdSVW9yQWgrZGk1S05Dcm05N2lJNUhnd0xz?=
 =?utf-8?B?MGlDUlh0WEhwTndZaUtRV0dReVJwM0laSUxLalFndnR5bVBtZEtMZmQ4MzJt?=
 =?utf-8?B?YUc4MlBZdEgyV0pWSTZBellLa3QweW1tREdTTTRENm9ZeHUrODQxV0txWGFK?=
 =?utf-8?B?aUg0eGNsL3BSZGR5NjlUeHliQ1BaQ1cvb3dMRWFIdURLSDBLYUJRM0cxM0la?=
 =?utf-8?B?RlpydzE1RUR5N0NRQ0J3eEY1Y1djWTVtSDhhV3pqS2ZTUXBQWWVoeW9JVmN4?=
 =?utf-8?B?K3NvakRMeTR6b1lHbWV6L0xJVWpsTVdCakMzR044V3VqUjdpdlhZUDNpWkZj?=
 =?utf-8?B?Wm8yVDhKdHp5bHZRbXA3am5FaTJ4K3cxNlpaS3JOMkxaeDhCOWZ4TE1LcWtk?=
 =?utf-8?B?QW1xckx5ZWRRWlF6REhhamhXSFMxSmtiVE10NzdGVzEyN2FveFI1UDQxTFdu?=
 =?utf-8?B?VVlqWGc3aitlQndsNGtITk5lV3ZTakROaGh6NEZzZmRjdXVSSWxJMzlSc3Jm?=
 =?utf-8?B?MndlUENmNktla0JjZFhnYzVGWlVjWnVhK3hCTkVMZVNQemVoN0NUd3VSVVNF?=
 =?utf-8?B?eTQxMEllc0orZ0IxNkZGc3U2UHB1ZmRLWVp5ZVRxRGd6OGhGZFhSaE82ZVo5?=
 =?utf-8?B?WStrTlNVcEVya3BFWTdSUFBGQTNjQjNGUjBwenFVYVEvMHhkMVZ5YVNibk51?=
 =?utf-8?B?bVlreGxKZnJ2NDVPdFRLLzVhSDJ4WTMrM01jNzI1Nm5ZMXlyY3VRSGZIS3Nq?=
 =?utf-8?B?endidHk2Y2Q1V3pVWFcxZ1BxWXViMW9ZNTNnTEJqRzBDN2FldUtubEdTU21l?=
 =?utf-8?B?TEFkSkdrS0hBNm80SnZpY3p0VTUwclB1Zy92Q2hBa2hsWnB1aGFUazlIL0NG?=
 =?utf-8?B?RFNiQmU4TkpvSWVCb0dkYmdSd1dTamZGS21zV3VOSVNEaU9wUHVTQk1EQzIx?=
 =?utf-8?B?eW16U0xaOHNtVCtxS0svT1FBWDFUNTR2Z0hoQWZtRHlJRnB4WEgvdzVZTkNI?=
 =?utf-8?B?UmJrQW0zbWRNRTFHSklGVW9JZ0dYU1luZ21ERXVpVDlNNWtyTWI0em1lMTJv?=
 =?utf-8?B?SGl5akxjN3F0U3F3bXpjZWJ1TlEwWmM3c3o0ZkdaWFdZcjVoTDBPVzJ2RHhj?=
 =?utf-8?B?S0FHVDRoR1hGT3h2bktjNzBHZXFuaFE1aHRnTjdVN3hGT3VVQ1lmMHFHNW1T?=
 =?utf-8?B?c05MTS9uTnBHcEJDeUZsL0c2SHVHckdVYjllUUhwQlRkQjBSa25tL0ZBNkdT?=
 =?utf-8?Q?U7uCa5wbboWHihKupQzeCxoX3++9iJnyjfLbXloGBl+w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec2e8d6-3dec-433f-2cdc-08db4be7553b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:01:54.5250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/ISjsawwZu/yhDeaESNpZeHosP/u6Hn3e40+9cgzvsWqVzmSsn0rsetN6Bvagsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.05.23 um 15:10 schrieb Lucas Stach:
> Am Mittwoch, dem 03.05.2023 um 13:40 +0200 schrieb Christian König:
>> Hi Lucas,
>>
>> Am 03.05.23 um 12:28 schrieb Lucas Stach:
>>> Hi Christian,
>>>
>>> Am Mittwoch, dem 03.05.2023 um 10:47 +0200 schrieb Christian König:
>>>> Adding Luben as well.
>>>>
>>>> Am 03.05.23 um 10:16 schrieb Boris Brezillon:
>>>>> [SNIP]
>>>>>> To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
>>>>> After the discussion I had with Matthew yesterday on IRC, I
>>>>> realized there was no clear agreement on this. Matthew uses those 3
>>>>> helpers in the Xe driver right now, and given he intends to use a
>>>>> multi-threaded wq for its 1:1 schedulers run queue, there's no way he
>>>>> can get away without calling drm_sched_{start,stop}().
>>>>> drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
>>>>> wondering if it wouldn't be preferable to add a ::resubmit_job() method
>>>>> or extend the ::run_job() one to support the resubmit semantics, which,
>>>>> AFAIU, is just about enforcing the job done fence (the one returned by
>>>>> ::run_job()) doesn't transition from a signaled to an unsignaled state.
>>>>>
>>>>> But probably more important than providing a generic helper, we should
>>>>> document the resubmit semantics (AKA, what should and/or shouldn't be
>>>>> done with pending jobs when a recovery happens). Because forbidding
>>>>> people to use a generic helper function doesn't give any guarantee that
>>>>> they'll do the right thing when coding their own logic, unless we give
>>>>> clues about what's considered right/wrong, and the current state of the
>>>>> doc is pretty unclear in this regard.
>>>> I should probably talk about the history of the re-submit feature a bit
>>>> more.
>>>>
>>>> Basically AMD came up with re-submission as a cheap way of increasing
>>>> the reliability of GPU resets. Problem is that it turned into an
>>>> absolutely nightmare. We tried for the last 5 years or so to get that
>>>> stable and it's still crashing.
>>>>
>>>> The first and most major problem is that the kernel doesn't even has the
>>>> information if re-submitting jobs is possible or not. For example a job
>>>> which has already been pushed to the hw could have grabbed a binary
>>>> semaphore and re-submitting it will just wait forever for the semaphore
>>>> to be released.
>>>>
>>> I can follow this argument, but concluding that job resubmission is
>>> impossible is punishing simple GPUs. On Vivante GPUs we have exactly
>>> one job running at a time and all dependencies are visible to the
>>> scheduler, as we don't have/use any hardware synchronization mechanism,
>>> so all synchronization is piped through kernel visible fences.
>>>
>>> It's reasonably easy for the etnaviv driver to find the guilty job to
>>> skip but resubmit all other jobs in the current hardware queue. I'm not
>>> really fond of having to make all applications deal with innocent
>>> context resets, while we can solve this via resubmission on simple HW.
>>>
>>> I know that more complex hardware and use-cases might still require the
>>> kernel driver for this HW to give up and shoot all contexts active at
>>> the time of the GPU reset, but that's the price you pay for the
>>> hardware being more capable. I don't see why we should also pay that
>>> price on really simple HW.
>> You can still re-create the hw state inside your driver to continue work
>> from some point if know that this will work.
>>
>> As I wrote below the scheduler component can even provide help with with
>> that in the form of providing all the unsignaled hw or scheduler fences
>> for example.
>>
>> But what we absolutely should *not* do is to have this re-submission
>> feature, because that requires re-using the dma_fence objects. In other
>> words this dance with detaching the scheduler fence from the hw fence
>> and attach a new one is what absolutely doesn't work.
>>
>>>> The second problem is that the dma_fence semantics don't allow to ever
>>>> transit the state of a fence from signaled back to unsignaled. This
>>>> means that you can't re-use the hw fence and need to allocate a new one,
>>>> but since memory allocation is forbidden inside a reset handler as well
>>>> (YES we need to better document that part) you actually need to keep a
>>>> bunch of hw fences pre-allocated around to make this work. Amdgpu choose
>>>> to illegally re-use the hw fence instead which only works with quite
>>>> extreme hacks.
>>>>
>>> I'm with Boris here. Could you please explain when a fence would be
>>> already signaled in a GPU reset scenario and would need to go back to
>>> unsignaled, so we are on the same page here?
>> Take a look at how this re-submission feature of the scheduler works.
>> The approach is basically that you detach the hw fence from the
>> scheduler fence and then attach a new one.
>>
> Right, but this shouldn't be a problem, as long as the old fence isn't
> signaled yet, right? It becomes a problem when the GPU reset and fence
> signaling are racing each other, due to insufficient hardware/software
> state synchronization.

Exactly that.

> I'm sure that the necessary synchronization can be hard to get right,
> but it's not the act of switching one unsignaled fence to a new one or
> reusing the old unsignaled fence that's causing problems, but the
> complications of making sure that old fences don't signal after the
> timeout detection, right?

Well sort of, switching the fences is the root of the problem.

Basically the initial hw fence for a submission should never signal 
until the hw is done with that submission. Either completed it or 
aborted it.

The concept that the GPU reset aborts the existing fences then re-submit 
which gives you new hw fences is what doesn't work.

Either you re-use the old hw fence (in which case you wouldn't have to 
switch it in the first place) or you allocate a new one (which violates 
the no-memory allocation requirements).

> To be clear: I'm not asking those questions because I think I know any
> better, but because I'm actually not sure and would like to understand
> your line of thought and background information when you say "this
> dance with detaching the scheduler fence from the hw fence and attach a
> new one is what absolutely doesn't work" above.

And that is really appreciated, we don't have enough people looking into 
this and especially pushing back on bad ideas.

> Driver writers need to understand the limitations of the current
> resubmission scheduler code to do better in their driver
> implementation, otherwise we just end up with (worse) open-coded
> variations of that code in each driver.

Yes, completely agree.

Regards,
Christian.

>
> Regards,
> Lucas

