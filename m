Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A06DA587
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CF510E05A;
	Thu,  6 Apr 2023 22:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938310E05A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 22:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9B4291J6JKZmFcG5mxWtBCmbiqBoI9Jb1mNKEetDaumAjDYJjRCZRh7RGk1aEQfEvdkahGsM7NI9MRxuOHwV1cyU/TvqlAwoVVIS0tNS8mMeH0wzPKu/qu007xgIVd51k/5uovPVmvK6VtpqV3/BvsnuXtqMznNeRcI1EpH50rPg0hYGTsqsdtr9QKrkJ32lgEBcWi0RD/DfPokCM8j3TFXHq0jAhJf5o89mALzQ10wnrt1cfXkGl/keTnX2msU6xbagtHfzErfzTpYzxKkdsuhq8VzfXX1LpUze86i8pHbgzDh6Ogd3A9162qEyJK5MrTN7Vl1E78FF6CBT80miQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNOmR5FDstWaywEjBxqHOUQSQFeQ0u0WjM0ChnvwZok=;
 b=JzRuNR8NlN1WhgQNzMhmA+xD7Yh/2e2h+HEXNkZoSdgu/aWXTaAzvJ7ZiG8S45D7Il+Jqct9R2+Q4BDtdjxY+MhbSf2HMltuqI/62bfWXa0xsu0PkbLfB/2Y3rGF/l3QqAKsTSoiExrJi3Cn3AUT+wcU6+8CypFOLnE7Y5wqvkbIVqdRurg4oM2gi/e0ZCB7rl7Xv9h5WBgtwXyLSpvBQe2NpeZIVIH1sxZ3oG38KzCJlonsEPDbPu1bLzdN6bQ3D4Rwo+Bg5rfmyGzSVW9We8kiYYVpORRbxqYj9NRGVDclH6AVXSxeLMpey3EPK+Puxajq1r5Sbk9TRVlISHwNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNOmR5FDstWaywEjBxqHOUQSQFeQ0u0WjM0ChnvwZok=;
 b=Q0mL/qz9Q8jzjUJZQ2P1jwfqU39raycatjG0YG34Cs8R0k0315AEMu4Tjkv/vZCZYC56E23KyOnOfs3PAgCPoJ/Q/mxF6O1vi+6PD/6Lmew0d9yBh6Z4pFfxKuhExXmCkAYnYIO3rfEWNzYAf6xE+Fgxd0aszOv5sIPWjpQlnco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.31; Thu, 6 Apr 2023 22:06:22 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 22:06:22 +0000
Message-ID: <5374f5aa-fa88-11e6-e38c-9d104c5a6c50@amd.com>
Date: Thu, 6 Apr 2023 18:06:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Lucas Stach <l.stach@pengutronix.de>, Danilo Krummrich <dakr@redhat.com>, 
 daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <c952a63a2c0c7377e1e15b1d06c1a941f3456d60.camel@pengutronix.de>
 <3215dfb9-8f7f-625f-44a9-85320cd32019@amd.com>
 <8312fa88a3929b83a8ccdca1a0ab33bef15fa0ae.camel@pengutronix.de>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
In-Reply-To: <8312fa88a3929b83a8ccdca1a0ab33bef15fa0ae.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0338.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c2c04b-1ec5-4679-20fa-08db36eb27d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dxI1cZ5Z8Sd2nZT2fYNL3/p7GktCUVR9XLnPlmCo9vQ6VzHgxub4VA0uPcspDkgB0zeVazTnhBgmhj4zSQtQxc6f+1u44a/ZJHTfMH8/ubkt5kGA7fMJqL7zKpwc7b2HHYslmpFEtnxGEiVia18P74KLK66Cly7lMr8SjRn9Xj22OvSADBpR5ppAaRSuZ1ZyxQXzLVj32Q8wyw/wihfQUe213Yh9adVX9Ly/9vr/GUaWJmuXEIWoEw2yvM/HbKwQ9NRmVKnaQMY67aQhzAUAxXEw8WiA4q07noL8rqpsBw428i6TnkWrE1SynWzvug0Unk3rm2SOd5Lu3RHHSboqBmAm7XQz5mel6Ux+bsLqZ+WZWhXEjPQzxMcmeyhwEFzFpO/kC3osSnapoI8rKBNeFkimoZMlXrkugyiMvtXrxis1zz9cOgKA3498RxpCmwYPBbKzHfHgVX3lANZ/BmoluW66ZgCqPHMm0xJOzEqJXhzaiseUah9ppw8EtdZyc/8GGQI375k+FCdgTQ0wsliuu7SUYdEBF6RvPW/4mC+dZLMWqWLkDUpI6X2TkT9l+N7/56GnR1p9ZtFT1/DFYUnjJ5Lt4NmrkinwOxl3OE7Zx+I4aalFY0A7Z7GKb/rttw0OIw+Wi8MDNgWdun6lTr6Bmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(66899021)(31686004)(38100700002)(36756003)(5660300002)(2906002)(44832011)(31696002)(8936002)(41300700001)(8676002)(86362001)(66556008)(66946007)(66476007)(6486002)(2616005)(83380400001)(110136005)(6512007)(6506007)(53546011)(26005)(6666004)(186003)(316002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldwRis5UzZiSFVCcnRTOXZBeGVlcXNYLzJ2WW9DNmlyZXd6ZXUvcllSYkpo?=
 =?utf-8?B?N2o2YU9ZMU9VM1p6N1lUbEE5Z0tSVDY1T2FNMndBRFl4ZCtqU0RuanAreW54?=
 =?utf-8?B?VHVXRzJqcjJBTUpyL0htZUM5Um83YWVEK3NOc2xYTjZqeitJS2xRc2RyajJD?=
 =?utf-8?B?U0cwSng4bTZqSERUMndqcUUybzFSVis1R091Y1FpdDQ2NnZBQ3NrUUhOcjR6?=
 =?utf-8?B?SzdhdFlhelF1MFRaMmozZytTSU4zT25rR3RyYS9iYjBGQnZjQ2pkK2VIRVNZ?=
 =?utf-8?B?eHFsM0MwSmtKaFJzOGZvVUNUdVFhbGxPWXkzeDVBNmd0SmNaaVlxME9qdm9S?=
 =?utf-8?B?dHowMWJJU29NellIcUMyd0NBaHZYM2Y0TSt0V3diZUhRWGJGN0x3UTRNOWJB?=
 =?utf-8?B?TTJXNmJLOFVBUG4vUlBZajUxTWF2ODVGTzJVZ2kzNXFhMGpxS1d2ck5ZM01w?=
 =?utf-8?B?VDhSSnpQWW5scmNncXo2U3FOWDVhL1phRThDbGs4WDdod2hsSE9IRlFtbmJE?=
 =?utf-8?B?c01IYVZpaGhSY3lTWmlZazF6YUxCUWxRMlNQamNuUzNOcXBiUWprTHRXZDVW?=
 =?utf-8?B?REpROG8zWnFvdnRHek8vN0pJVWVYaFFhN3lwYVdGcjJObUxhZVlHSmpCRy9j?=
 =?utf-8?B?aFJMN2NiaHYyVXlFVkhVdVpUa1MybTc3ZGo4Z2VrcjRCdlZtZnNCQlFubnVE?=
 =?utf-8?B?TlRKQ29nOHh5eDJsUFgybTk1M25xZE9jUngrYUN3Ky96YUF3YmZHbnQrczdn?=
 =?utf-8?B?SitrSzZqei9MZHF2L09iN3RDU0dITWFKa21mS1pSbHZFQ1llamREVVVlVUZr?=
 =?utf-8?B?Yzh3dml2MW5YSGhJUy90VFJ0dW1KT1Vqdm9POFc4cEltaWY0VnRpVG9XaEtS?=
 =?utf-8?B?cnQ0ZnU1SnV6U012amw3TXh0SXZ4ODUrRkpnTWhiYm5GMmc2U0pQY3ZkMjBI?=
 =?utf-8?B?bUlnSllRazUvVERjdW5nVzExQmlaaE5rTkNmVzFWNFkrTExld3M2dG81b0x4?=
 =?utf-8?B?OHFReFBBRFZ6QUFPTm14d2I5a3NYWFJVRVJUQ1lTVlZTSHkrVHF1WEFEK0VD?=
 =?utf-8?B?WmpIVGNtUlRwWWkvajdLSnZRazU1R2l2Y2s4Y0V4M1Rocmo4TzFHVnF2b0dI?=
 =?utf-8?B?VjFWMDVyYjFNRSs1OUMzVCtRYTFyOGdsRVJoMVRBWkl3dkw1WHk0MXovV21w?=
 =?utf-8?B?aHpiNnpmNzRMVDBZdzkra3BnRDQxMk5RcE5qTys3VXRhZnpGSHVRN3VNcThD?=
 =?utf-8?B?UkFXWWZLOTFBYzhKOVM1TEp0THNXajFJaUk5ZExvSFJzVnorcVNLQTBya0cw?=
 =?utf-8?B?S25saUFkTWxlUzlBYUNmcXhyNFdHQVo5UlExVFMzM1c0eFR4VGlveS84ZFZx?=
 =?utf-8?B?aSs0SHRJRkVyOHdOWEhiQzgzWnhmNWZxeUhKY2FkZFFoM081YzMxWjhqUzJH?=
 =?utf-8?B?RlBBUkFXZlVNZWxXZnRJWGl6NWVuMnp1OExnQldMY2JvS001dTRXaHJUQTRZ?=
 =?utf-8?B?cVVMNWhsSzNpeDNDREVmMFlXUkJUZmtOU2lHa29nRHhwVXZLZk1UWllCZkI5?=
 =?utf-8?B?Ym5SZWFlTCtTT0RQajBCbng5SEQwL0Jway9wNnpSYlYzWGhUQUlXYWdIMGhO?=
 =?utf-8?B?Q0E0enVlMWo3c3NqZlJLZld0anFvNUFBaXJCSWNDMU4ralNUNGcwVVpiTXBr?=
 =?utf-8?B?VnI0UGFhRzl4Z3cwUUQvd0JGREJsZzgwak9TY2pieEhtOFgxRC9ZR254TjRM?=
 =?utf-8?B?M1N4MnZ1cnZtaU9wdmlnTWJkSWYzSnA1NExadFFIN3ZxUUwzbFhveFlsSmlR?=
 =?utf-8?B?VjhETjNYZTd2Wk15dDRpNWwvRXJUc1UvSWdjTDNJNDFyUjFQOHA4SXJ5djEy?=
 =?utf-8?B?TzFDNzIyVlV2eXp5NlBHWmlnbXNUa0F2THRpZ05yU0JqRUJuRWV0QUIwTm0w?=
 =?utf-8?B?ajJGenRBcTBhcWpIUDVIL2tvSWx6WUJnWExhSTZCOE1xQ0hkOWs1ai90aHRN?=
 =?utf-8?B?dmJHQllOT0lRM29BRTU4Q1hjYXl5a0lBR0lKTHROaWxYZ3psN2NBZFRTZCtS?=
 =?utf-8?B?eXlyUWY2UzBHOS9tUjNIazh6aUovWUcyWlBYK1QzQlZwVEpaa3QwSGZGK0tU?=
 =?utf-8?Q?xOC1WacxMkxKrgfoWcCvjmJjj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c2c04b-1ec5-4679-20fa-08db36eb27d2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 22:06:21.9228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4++WE8STcRc0mbrpHi/15FnML9Q78SWS35/9bTp9ZYq2ala5cQriuTMpD5YYBYSO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8479
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

On 2023-04-06 11:58, Lucas Stach wrote:
> Am Mittwoch, dem 05.04.2023 um 16:44 -0400 schrieb Luben Tuikov:
>> On 2023-04-05 13:44, Lucas Stach wrote:
>>> Hi Luben,
>>>
>>> Am Dienstag, dem 04.04.2023 um 00:31 -0400 schrieb Luben Tuikov:
>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>> Hi Danilo,
>>>>>
>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>> Hi all,
>>>>>>
>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity") 
>>>>>> tries to track the accumulated time that a job was active on the GPU 
>>>>>> writing it to the entity through which the job was deployed to the 
>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job() 
>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>
>>>>>> Doing this can result in a race condition where the entity is already 
>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed 
>>>>>> once the job is fetched from the pending_list.
>>>>>>
>>>>>> After drm_sched_entity_destroy() being called it should be safe to free 
>>>>>> the structure that embeds the entity. However, a job originally handed 
>>>>>> over to the scheduler by this entity might still reside in the 
>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy() 
>>>>>> already being called and the entity being freed. Hence, we can run into 
>>>>>> a UAF.
>>>>>>
>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>
>>>>>> In my case it happened that a job, as explained above, was just picked 
>>>>>> from the schedulers pending_list after the entity was freed due to the 
>>>>>> client application exiting. Meanwhile this freed up memory was already 
>>>>>> allocated for a subsequent client applications job structure again. 
>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to 
>>>>>> reproduce the same corruption over and over again by just using 
>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>
>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless 
>>>>>> I miss something), which is why I'm writing this mail instead of sending 
>>>>>> a fix directly.
>>>>>>
>>>>>> Spontaneously, I see three options to fix it:
>>>>>>
>>>>>> 1. Rather than embedding the entity into driver specific structures 
>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and 
>>>>>> reference count it, such that it's only freed up once all jobs that were 
>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>
>>>>> My vote is on this or something in similar vain for the long term. I
>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>> more fairness than the current one sometime in the future, which
>>>>> requires execution time tracking on the entities.
>>>>
>>>> Danilo,
>>>>
>>>> Using kref is preferable, i.e. option 1 above.
>>>>
>>>> Lucas, can you shed some light on,
>>>>
>>>> 1. In what way the current FIFO scheduling is unfair, and
>>>> 2. shed some details on this "scheduling algorithm with a bit
>>>> more fairness than the current one"? 
>>>
>>> I don't have a specific implementation in mind yet. However the current
>>> FIFO algorithm can be very unfair if you have a sparse workload compete
>>> with one that generates a lot of jobs without any throttling aside from
>>> the entity queue length.
>>
>> Ah, that's interesting, let's see, a "sparse workload compete with one that
>> generates a lot of jobs", so basically we have a sparse workload compete
>> with a dense workload. So we can represent this with two entities, A, B,
>> whose jobs we're going to represent by the entities, names A and B.
>> So if we let A be the sparse workload and B the dense workload,
>> we have this, wlog,
>>
>>       First/oldest job, .........................., latter/new jobs.
>> Subm: A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...
>> Time: t0,t1,t2,t3,t4,t5,t6,t7,t8,t9, .....
>>
>> The current FIFO algorithm, would prefer to execute those jobs
>> in order of submission, i.e. oldest-ready-first job. Assume
>> that all jobs are ready. Then we'll execute them in order.
>> This is desirable and fair. We want to execute the jobs
>> in the order they were submitted, given also that they are
>> ready to be executed. So perhaps we want to execute them like this:
>>
>>       First/oldest job, .........................., latter/new jobs.
>> Subm: A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...
>> Time: t0,t1,t2,t3,t4,t5,t6,t7,t8,t9, ....
>> Exec:          A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...   
>>
>> Any other ordering would starve either A, or B. If we executed the 2nd A
>> job at t6 or t7, then that would starve the 3rd/4th job in B, since the 2nd A job
>> arrives at the same time as that of the 3rd B job, at time t6.
>> The time t3-t0 is some delta > 0, some initial scheduler-start up time.
>>
> For simplicity now also assume that all jobs from A take 5ms of GPU
> time, while jobs from B take 50ms of GPU time.
> 
>> IOW, we don't want to delay a job any more than it should wait--the oldest
>> job, which is also ready, should execute next, so that we're fair how
>> it executes in real time. We cannot boot B at t6, so that we execute A,
>> just because it is sparse, but just arrived.
>>
>> From A's point of view, it shouldn't expect its job execution time distribution
>> to be any different than its submission time distribution.
>>
>> Do you think there's a job permutation which offers a fairer scheduling
>> than the Exec line above for the Submission line above?
>>
> Yes, if we try to keep some fairness of actual GPU time made available
> to each entity by tracking the time spent over a sampling interval, we
> would see that at t6 B has already spent 100ms of GPU time, while A has
> only spent 5ms, so naturally we would prefer the newly submitted job
> from entity A when choosing the next job to schedule.

The problem is that you cannot inquire a priori about the actual
time the next task (job) would take. It might be the case
that the next A job would take a long time while the next B would take
very small amount of time.

> 
>>> By tracking the actual GPU time consumed by
>>> the entities we could implement something with a bit more fairness like
>>> deficit round robin (don't pin me on the specific algorithm, as I
>>> haven't given it much thought yet).
>>
>> Since there's no preemption, this would be hard to achieve--you're at the mercy
>> of the execution time of job A_i for an entity A job i. (Assuming there's no
>> preemption as it is the current state of the GPU scheduler.)
>>
>> The only thing you can do, is punish the next job from this entity, A_i+1,
>> to execute much later. However, you don't know how long A_i+1 would take. If A_i+1
>> takes very little time, then you're better off executing it at the next opportune
>> time, i.e. when it would normally execute. But such an algorithm, which doesn't
>> know a priori the execution time of a job, would punish A_i+1 to execute much later.
>>
>> But if A_i+1 takes time as long or longer than A_i, then punishing it to execute much
>> later, would simply delay it, from an observer's point a view, it wouldn't teach
>> the context to submit smaller jobs, so that GPU sharing is more fair.
> 
> Without preemption we can't really make the scheduling absolutely fair,
> but we can still do better than the simple FIFO. If a entity has taken

This is exactly my point as I stated above "Since there's no preemption..."

> up a disproportionate amount of GPU time over the last sampling
> interval, we can derate it when picking the next job to schedule to
> allow other entities to take up more GPU time in the next sampling
> interval.

The problem is that you don't know how long that new/other job would
take--it may be a long-time job as well. What if the punished context's
next job was a small quick job, but because of its previous job, it's now
been punished to wait a long time. What exacerbates the problem is if
the favourite new context picked has a big long job as the next job
because its previous job was a quick one.

The base problem with DRR, and similar scheduling algorithms when
applied to the GPU scheduling is that you don't know how long the next
job would take, a priori, and make decisions on context's past jobs. In
classical DRR applied to networking, you send bytes (the work done) until its
quanta is exhausted and then you move on to another one--which is preemption.

This approach would work if you get a hint from userspace as to the size
of jobs a context would send, i.e. knowing a priori. Then you can formulate
a context permutation which would achieve fairness, somewhat.

Are you seeing contexts sending lots of big jobs very frequently and other
contexts sending small jobs very infrequently?

What you could do, is use an adjusted-time-spent scheduling algorithm,
where you calculate the running average of a context's (past) jobs,
and schedule it with a frequency, such that the average time spent on the GPU
is about the same as that of other context's jobs.

Regards,
Luben

