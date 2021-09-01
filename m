Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6033FD25A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 06:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E06E10E;
	Wed,  1 Sep 2021 04:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C46E10E;
 Wed,  1 Sep 2021 04:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MORY9Y+q4IutPJLVUKuCRGP6zxLK9y60k6jsP0w/hblCqxTBX8vTqvDNeQzWpwMt7TH8fmT1VxO+xTS2fVIPlXM237euaTmKd+N5DKVnHYDTQgOArCAQuwEqQkg/FwJmnrjCxDO3sGHNP+HvM4klEhk6y1pRgc42IiDNfgVEG798eiNHiyqN1H9CV439snqndgju/pwtMGKpBx6pN9HPU+mQuH7uhlTPSWQ8jo8ERHAGu7DW/Yh4w6YySG4LzNfT/kwC4B4xm3Vre3uxU5K0Cup75VHcgj+EPAYaHJ4OvUPRQlNy4epLpzjEdiG12iO5zvWTsdzUybZpUYegE20rRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tR6fcWIZBdq1E/6v1XViLzWZL8JXBAhUKBVUYsZYsWE=;
 b=D5zsN/wjUw2V/p3O9L0iUsingd9JEsHO0+vMHGmgvzoNC+CgLONFH9fJgMk4y/1xvfKMOkDiTQWGDtpHSAG8GkuoA5g44rn00A7WLmEqYmJNQvEtE97KNc3zxziqDQyegBW+cEQC4V9n/lGrIUFkF2kB/hDJPhBUNtyr7Er2ehBFvJh0V5G8CxowJipbK/Xa4l7O1o8qPPePXJUfghyIz+zRWzJj1SPB8Zl0e+NrGhEoaDVH+10wVXc0qXiDe0WIs6eSU0k+CzcKlapeWSV8TX+qH+1PEl+bFxBv6+fS8lLh4S0R4CmwIs0QMaR90hocZH3i/cTqTNEOkH8WhYGMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR6fcWIZBdq1E/6v1XViLzWZL8JXBAhUKBVUYsZYsWE=;
 b=itfbu5Lg1AbA65AL8X6EFAGAlHDXD8ZZvBlwV5QlxyOAXI+Wk5eyuGl26GBvhTk7C41GQv91cqH3qMjmEoEa+vsxQJIRpzA4/qSGw0CBq+6NW8lqgWTzdwoaicskCryaxiXEq/uPTHRciaWiDu77+S4ujNm7fzWQcTQvUqtnIks=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 04:29:02 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 04:29:02 +0000
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: Jingwen Chen <Jingwen.Chen2@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <abf7b9de-67ef-25d4-a4be-11df93d2f799@amd.com>
 <20210901042513.nn3kdnh6xqkrbarn@wayne-dev>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <9ee69f03-5636-0171-a3f8-bd3c5d79b592@amd.com>
Date: Wed, 1 Sep 2021 00:28:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210901042513.nn3kdnh6xqkrbarn@wayne-dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 1 Sep 2021 04:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cb33211-832d-4294-14b3-08d96d010675
X-MS-TrafficTypeDiagnostic: SA0PR12MB4494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4494C132BF0140B2A4B2F518EACD9@SA0PR12MB4494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPn/qJ4ikNU/wr8Yjct/unctDmbO7M2ZK379F/A7zVbn/w33or/cEMGMfJVCQ3wDWAIt7sZwkuUmLSzRgd6QZLxyeq3Sdekxw7L3cPu1iv0U+qcV/yG4JxJU4g0l8M9CffV5vBihDZXeczoLz6vH+nn5yFWNxZfWASD3iqLFUjMx46mKKF+C8diAF2ULluxf4sv32OhKfEWXPeWt1lsBJ77I6TkG/5KJqyI+cXMp5ae/mS9CHQb25yFn2E24cXbLkPYUgxk7JsszH/3R9zl/DSgSUepIt2+qfQs1xMEa69qVylOV8X6kGDPeLhOIdntZly0wC56OcH28OVvQYYIvaon+lvcEpCVWHoISjJ9xUOMrrTOSX6DU54VrK1dsGuCGVdSv/x1elPvrSplHXapiWzxpjdr9VgNiGXRetXpH1YFGxzoFNlVzySkQy5slVQZCLCCAcDKb2VOvGhdnTPyhFKSsijlzDzsAJLBtGvZZghouDL2Rp0xzm1W3yeJyN5+qKo12rP3CStLhQNnL0NUhg3dvaWXOm6+Jgpw4JCzU37hlkpkJFRL94dewvDwCpjEqbcN96baOk9uypW9LmDr8X1Oq1Q30b9x1yMRs8fFwT+kSwjLqPZNX9qt8PfHHJR22dgN/mgcQ80mjU8vsAMQoP1vnZoBUgX3s5O6IJ9/3qAXql60PCgdFyL9BahPNft8F9MnbRHQeNy4K5EpdNDEwXqE+quNY+pOStJ1DZN/TZd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(84040400005)(86362001)(83380400001)(31696002)(5660300002)(44832011)(316002)(8936002)(36756003)(2906002)(54906003)(6486002)(8676002)(38100700002)(31686004)(66476007)(66556008)(4326008)(66946007)(2616005)(478600001)(186003)(53546011)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3RiOG42ZWhsQVh2S2I3dWdINzJ3Q1FpQlQrNEk3Mkp2alRUQktBelMrNC9i?=
 =?utf-8?B?b3d5NUNCTDdJZHk5bWdNSkNOU3ZmSHA0ZWNaazRkbmR0bjFKNGI2ditCK2RY?=
 =?utf-8?B?WHVNeWdpbE9yVjlCWmxVbDA4S1U4NmltYk5sTjBteGFhbjdubFQ4dnN1bGF5?=
 =?utf-8?B?SDNQaDFnL1NneE80aXArMlhlVVVMb1EvUDVrZHczVkRWRFk3Nnd4VDJHSlNu?=
 =?utf-8?B?YisrZ1dJK2dWMXdNUHFDaDJmL3Yrc2NpdEp4dEtMWUQ2a0JsWDhmSE9XUExa?=
 =?utf-8?B?WGR4bVQyVXlQZkVmQ08xaEh6SlZ0bFVRVEZsZHR1RGRPRy9ybVVWZnphSGYx?=
 =?utf-8?B?eFkxR3paK0EvUW55RmFLdFhZc0xpZnpia2NtZExQdUxOcGFDeEYxM1dWWU1v?=
 =?utf-8?B?UUpsdlJFQWpSdGxCdnVzcmxtRDA3N0h5ejBROExyOFlnWStCVmJvS2JKMG16?=
 =?utf-8?B?bGE4UGZySGV2MU9KOUlQZUx2azliU2I1OG1YVU5HNDVqeTlwZzJXRDhyWE5T?=
 =?utf-8?B?Nm02SWEyMDBHa05SR2JqempNeFZJZE9rZEp0Z3d3NjFoak11SzZGblhJVUFQ?=
 =?utf-8?B?a2JncGtMVUR6UzFCdGJwTXE4d3FmSmdXR2FNWktMWC9UMVRUK3d3UWhVbGVl?=
 =?utf-8?B?VXBhTGY1bkl2Y1dta1daZi8vY1Z3aiswNjk2alQwaTh2ZWcwQTgxcXdQUDBs?=
 =?utf-8?B?UXVrZ1lZSCsrMTZPWkZ6ZHdnQ3ZzeDdUU3ZUbTY0NmU4SmlkeVFvZjJJYXVJ?=
 =?utf-8?B?QlB6c0pPN1lXdFVJM2M2eGp4TjQvNUJCV21NYmt5UVorU1daUitZYzBjMUNa?=
 =?utf-8?B?OVlkZGNWY3BmK3VIMUlBZ2xUYXJDQnNXbmc4eC9nRjkrQWppYlZsZUhtMlF0?=
 =?utf-8?B?bU1tZ1Nldi9ScEVJWks3N1dqcDEweFlKT09jcm52OXJVVGFIZ04vTklIYzRJ?=
 =?utf-8?B?bitWaU8rTUFxL1JGelJFRnZQcEZ0QmJ5ekk0WWdtL3F0QW5qSzNqM1drcjV1?=
 =?utf-8?B?TGFCZkdWVFZTY2oyem4rQjc2ZC9uZG5pUkVDTlc5b1RDZ1IzMngyb2xpVTEx?=
 =?utf-8?B?MHlkMzY5MXgydUtVb1NRSitsckhMVnRCL3ZzK2NybFhraTNTamIxUEY2RHhm?=
 =?utf-8?B?aWxiMmdPMFhhTDZoS2YrR3VXNk9Nc2pNUEdWNE04cVhkUXZmWU9IOEd2R1Jq?=
 =?utf-8?B?a1hCUC9wWVZXcDdsUmtacnA2VjM5QmU1djNzSWtPUnEweFJNM3dCU0phZ3Bw?=
 =?utf-8?B?UnpIOW1MMGd1TXg4Tlg0TjNYanFPcitURVJnbkZIRzdCUjVrb1YyQ0xydlRO?=
 =?utf-8?B?akpJVVZ6MDF1Sng0bXVjRjQ4UkNNaDBXUytLQXFjcmVDY0xIb0Z3QUFjc2R6?=
 =?utf-8?B?MjNLT0ladGhQZGxSd2tZd3VUWGFJREZWMHJBK1lGaVRNVXBaNUhVdFBCZHEv?=
 =?utf-8?B?N2tlUlh0VUhFZXFGb0laMmxUTDZZZVpDSDdVYVFvR3hWRURGbHd1SlhFa3Rs?=
 =?utf-8?B?ekwvU2ZRNk8xOHJpbjMwRWJKOTZzQWxYNmV1MTRDdkpHcHovL1l4WU02NStF?=
 =?utf-8?B?eUxKRzNvcWU3UnltQ1JUUlp1NVZSdDF0OWFobHc0OWNKQUNoL3J1SS9TUWhL?=
 =?utf-8?B?Sk5HTHBWMnRndktlK0RScXU5U0RDWGZBcU5PRDZNTFVUN0dGNVI3NXNQeVcw?=
 =?utf-8?B?dzB4elV6ait0Q01EaXFYaEhsenROZ1RqUTFZOC9ZN1ZkcTlrQ3FWbEl5eEl3?=
 =?utf-8?B?YlJBUVNOZnhZZTNyOXczN1RnQ0tWMllPNWRER0oxTzE2RHNRUnd5Yi91a2s2?=
 =?utf-8?B?NGtyVThZUkxiaC9rM2lZZ1g0MDVpT04rNVNoV0JhVlkyUC9JamVGYS9lUGVN?=
 =?utf-8?Q?e6x+lmRTTQIQK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb33211-832d-4294-14b3-08d96d010675
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 04:29:02.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7v2ZGiaoCapYkRTz5L4MueFWaQoE9RFtKu0kBYBHK4RsgmzsBcWZ5iLgUREs/E9ayKLbVuu3SRyu6FUfHM5oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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


On 2021-09-01 12:25 a.m., Jingwen Chen wrote:
> On Wed Sep 01, 2021 at 12:04:47AM -0400, Andrey Grodzovsky wrote:
>> I will answer everything here -
>>
>> On 2021-08-31 9:58 p.m., Liu, Monk wrote:
>>
>>
>>      [AMD Official Use Only]
>>
>>       
>>
>>      In the previous discussion, you guys stated that we should drop the
>>      “kthread_should_park” in cleanup_job.
>>
>>       
>>
>>      @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler
>>      *sched)
>>
>>      {
>>
>>              struct drm_sched_job *job, *next;
>>
>>       
>>
>>      -       /*
>>
>>      -        * Don't destroy jobs while the timeout worker is running  OR
>>      thread
>>
>>      -        * is being parked and hence assumed to not touch pending_list
>>
>>      -        */
>>
>>      -       if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>
>>      -           !cancel_delayed_work(&sched->work_tdr)) ||
>>
>>      -           kthread_should_park())
>>
>>      -               return NULL;
>>
>>       
>>
>>      But I suddenly have a question here: if return the timedout job no matter
>>      kthread_should_park() or not, then we are backing to the original problem
>>      again: that the timedout_job is suddenly signaling and cleanup_job still
>>      returns it to sched_main and job is freed while it is still handling by
>>      vendor’s timeout callback
>>
>>       
>>
>>      If we return NULL when kthread_should_park() in cleanup_job, we can prevent
>>      above scenario from happening: once a job is processed by job_timedout we
>>      can stop its scheduler, and after that even this job suddenly signaled the
>>      cleanup_job won’t return it so sched_main won’t free it in parallel …
>>
>>       
>>
>>      What do you think ?
>>
>>
>> Is your analysis above takes into account that you also submit
>> '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' then I don't see a
>> problem -
> Hi Andrey,
> Monk has talked to me and we agreed that as there're multiple opinions about the
> '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' and patch
> 1 is an independent patch to fix some error. So we should not take the patch 2 into
> analysis.
>
>> I think that as long as you put kthread_park(sched->thread) BEFORE
>> fetching next bad job from pending list (under spinlock) there is no
>> such issue as in the case you describe because this potential bad job
>> that became signaled will be removed from pending list before you
>> even fetch the next job and by the time you fetch it the scheduler
>> thread is already stopped anyway
>>
>> If you don't submit and we keep the removal hack for now then also no problem
>> because
>> we temporary remove the job we fetch for TDR from pending list under spinlock
>> exactly to avoid this race
>>
> So can you help review [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)?
> patch v3 keeps this kthread_should_park check.


But since in both cases looks like there is no danger of use after free
then I see no reason to keep kthread_should_park check.

Andrey


>
> Best Regards,
> JingWen
>>
>>      Thanks
>>
>>       
>>
>>      ------------------------------------------
>>
>>      Monk Liu | Cloud-GPU Core team
>>
>>      ------------------------------------------
>>
>>       
>>
>>      From: Liu, Monk
>>      Sent: Wednesday, September 1, 2021 9:23 AM
>>      To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>>      <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Chen, JingWen
>>      <JingWen.Chen2@amd.com>
>>      Cc: DRI Development <dri-devel@lists.freedesktop.org>;
>>      amd-gfx@lists.freedesktop.org
>>      Subject: [diagnostic TDR mode patches] unify our solution opinions/
>>      suggestions in one thread
>>
>>       
>>
>>      [AMD Official Use Only]
>>
>>       
>>
>>      Hi Daniel/Christian/Andrey
>>
>>       
>>
>>      It looks the voice from you three are spread over those email floods to me,
>>      the feature we are working on (diagnostic TDR scheme) is pending there for
>>      more than 6 month (we started it from feb 2021).
>>
>>       
>>
>>      Honestly speaking the email ways that we are using now is not friendly and
>>      quite painful to me ….
>>
>>      Can we try to put all our opinions, suggestions, or even objects here
>>      together, let’s go through them one by one, it’s too hard for us to reply
>>      each email on different questions .
>>
>>       
>>
>>      For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
>>
>>       
>>
>>      This is a fixing patch on the timeout timer in scheduler, can we complete
>>      this one first ? it should already resolved all the questions and
>>      suggestions.
>>
>>
>> I have no objections for this one besides getting rid of the
>> kthread_should_park()) return null part,
>> if my answer above is not wrong then it seems superfluous to me
>>
>>
>>       
>>
>>      For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
>>
>>       
>>
>>      I think I already explained the questions raised by Daniel in other thread
>>      , regarding why I use __kthread_should_park()
>>
>>
>> Is this race free ? Can't the other thread execute kthread_park after the check
>> ?
>>
>>
>>      For other aspects, can we put all our opinion synthesized here ?
>>
>>
>> So to summarize from previous threads I think that the best solution
>> to the problem being solved in this patch is if we do HW fence embedding
>> at the drm_sched_job level instead of doing it only for amdgpu, and modifying
>> all
>> the drivers to support this we can both remove this hack and solve the race
>> against concurrent drm_sched_cleanup_jobs job freeing just by taking reference
>> to the hw fence of the job at the beginning of drm_sched_job_timedout
>>
>> If doing this refactoring for all the drivers is not an option now and you need
>> a quick
>> solution such as the serialization you do here then take into account other
>> concurrent
>> TDR handlers that might run, as mentioned before, without serializing against
>> other TDR handlers from other
>> schedulers you just race here against them, e.g. you parked it now but another
>> one in progress will unpark it as part of calling  drm_sched_start for other
>> rings.
>> So you either need a global lock or dedicated single threaded queue as Daniel
>> suggested.
>> At minimum we should change cancel_delayed_work in drm_sched_stop to
>> cancel_delayed_work_sync
>> to cancel and flush all concurrent TDRs and probably move it to the begining of
>> the function, after kthread_park
>> and before we start playing with the pending list.
>>
>> P.S One comment I had regarding single threaded queue is that in case we have
>> multiple TDR
>> arising from same event we will proceed to resetting multiple times - something
>> that with trylock
>> we mostly avoid today within amdgpu (see amdgpu_device_lock_adev and
>> amdgpu_device_lock_hive_adev)
>> Daniel mentioned it's not a problem but I still haven't understood why not.
>>
>> Andrey
>>
>>
>>       
>>
>>      Thanks !
>>
>>       
>>
>>      ------------------------------------------
>>
>>      Monk Liu | Cloud-GPU Core team
>>
>>      ------------------------------------------
>>
>>       
>>
