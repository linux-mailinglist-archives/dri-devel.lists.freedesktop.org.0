Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96D5A12B7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F2610E1A0;
	Thu, 25 Aug 2022 13:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0510E1F6;
 Thu, 25 Aug 2022 13:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifD3Gg3xktmk1LpHie/YvXutoKVaEz7DoE2EeFmgTYX1ADJCCS8u7VEjenDGMnOnKAAwYCCQkkl5p1eaHiNWHi/LrqVhwq9pxviaE/Vs+in65HWDNKNV8qPX8tx3p1AuCTYELyQBhOh1qs+PP+feqH7TmIIppkd6XkXIR2t1CRORYA6Kxij/8EIzx2JxI0w9OM0ETCnd/Cv9vcFmARQ4FryFN5vtnfwnRC01h4Dmc27IismNdewxc3+Gprs2yUiKh4j5MjQQA3/h2HJLD7BX5IVKHvNT3u+PLey42Ed3F7ft+wH6ekBuE1CD96bT2146bwJUdeyVM0nzZxer7s07Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opjQSTOWFmxhNo+PcdedJIKv3g5HVjY7bh4/evP+Iqo=;
 b=j/Hv3e68c3j7Pt4B4ICm2mTZVpGX0eU41iKRCbKFTPI/eR+dMQu5WTNDtbm8jjBrXEzJwvaSZRtDHWS9lnaB6phPQIZNNAmFIACoaVYypfG2iuV/eWuFyNaSK2O58R8qtH7a/UOpdyjtVP/rdAdTGP3YGTLxlyQoMb7Jmf/cqxyTcIf+znB/e/g20O0P514EDZOaBm8h31nrZv+bilk6pD3YrqAbskBO0dcYhNWM1ZfRIBnh6SW8/3yvWAB6qyfvvEMgBv8QyHiPngQhvhczNBhL+RpMQGbp10fNYpikqzBL9gR4/YU4ADJqSlL8k2fEmVvOOQ1lEp46szBgfp5Z/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opjQSTOWFmxhNo+PcdedJIKv3g5HVjY7bh4/evP+Iqo=;
 b=R6FkC3oboi/JtQOyMmhwo07tcl3/Z2u4iK67/56FFxEjXBg4zkVrjtUP5Rrc2zFECKWoppkDM6dlJIYlO7xoEsPirllhtp2LJuY/Dkos1lf296ucyYakY7+owewxEguygYXCz3LatstRS69Smimc8Gsh3XF7LZVpUgZnt7zteTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 13:49:39 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 13:49:39 +0000
Message-ID: <57bfcf5b-eec4-07ce-597a-187b10238a3c@amd.com>
Date: Thu, 25 Aug 2022 09:49:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
 <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
 <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
 <65722ac9-e76b-8473-e1d5-3209c2d59a89@amd.com>
 <3adcc1ce-434b-3e2e-8748-697addcb7aa3@amd.com>
 <34ea8549-f459-2074-2bd7-945601f5ef9b@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <34ea8549-f459-2074-2bd7-945601f5ef9b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::19) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 343983ef-3ea7-4b78-c4cb-08da86a0a78f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3737:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/o4PpcWJUKQuuatFbp0sKnILtgSLrVO79ZpgpBEYw/HXlp/8OTESoNBQmVvxDuz1fGgmPLDEOANBuaLgg0y9I73rEL0voPfnWETqQCPoxUxV+q4bebP8eUgFh27OQ2g1oesylq1oyQXGal/EM3tNajIEaOMxAbJXj8HsP7T1baIOexQ9eY+c29fMMiNZlnuwiE/d4tS/U+QIrEskpFT+zMaS/PUQqwyx6uwAERP8Ou+wJns8G8CgFSd4gCkyNx1IC633R/BupDdu0NjbU74X0PicT20l2twHaj8pXj4knejpUtARYWcVuooOCNmWnWof6sk2ZmdwyWiYKx3yxwBAzKhAhisCv0obCIjdCStU4dAsiPrRhMFYhyBrkTVQ/6fccsHoRwCqg6L8UqaXWUdz9+wInhLMwfPjm4KI3JGWByfJwRxjnBzNeF8Vw6Zwcba8+IUlnMLChp431g73omTMFts/2XvuwOKuAbRT9/rqmU4UkN9O8oJYbGVy/Fniin9hXx+6OjiTUX8Gto3OG/rLLbQNzI6vVHS4dUQH2Lh3DaeRC+FszuismqTofeHAcLHed3P/EUuX/UfcsFdWOzlSNi5gjx7KZuK/f5NYYc5/ub1NYu7/8t8iRb0TwF1UZyn99dXOoNAlKRCnSD8Txw34DLYsbgWEAlIGbau8bkLqtu22oWqUKLqFRVLWQKEbgHyAafESrcU8SQWlTdcGNip8rr+UE8l+0B5W4152/U8cDhUDz5ZOR4kFlyZSB8bOpuOwIt7m1x18Hct/3J1LkldNoxnY9US8H3sg/saI6ShtD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(6506007)(6512007)(41300700001)(53546011)(6666004)(31696002)(36756003)(86362001)(31686004)(2616005)(186003)(6486002)(478600001)(66556008)(8676002)(66946007)(4326008)(83380400001)(66476007)(316002)(38100700002)(44832011)(8936002)(30864003)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WThhenNGNVdwMWgrUmEwY3EvZlNhRXBDSzRQNU8xbXErVnBjbXo0YzNqbUZr?=
 =?utf-8?B?ZVgyaTJ2ZlFWa0lJbFN1Z2NnM0E3Y1NoSHpQbUpLK1I5cVNMUjU2QWpheGp2?=
 =?utf-8?B?TEk0WTdVM1lqb0Vldjk5VWlucjFDekNrK0dOT0pnRG96SnFoSlpxVHpIL2tx?=
 =?utf-8?B?ajVaNWJlY1M3bGNQaGRmaTBBOWxqejVETy9OQ1czYWdZVW03NWJTWnZEZlpY?=
 =?utf-8?B?YVUzdmxOUDRqaWpDN3pHUENyVXN6N2E1SzFUdmVzMnFrZDZqODNjbWM1bXZR?=
 =?utf-8?B?MzJOUkpCVk54K1NDek4wTWx5R1lDeUl4WHdIaUtGZittU3FmRm52VlV5RXBq?=
 =?utf-8?B?dFpJWS8wTXl3dG9WZml3Z01WaDNGMTJxYVBtYkc2V2tMUjBoQzRYbnlTRzJI?=
 =?utf-8?B?aVIvMUs4YXd2RGlOM0JUdXZOODU3U2crOWhwb2k5b3laL3dwb0llcTR4aDV0?=
 =?utf-8?B?VFVNdHl0Tlh6L20reVhuOE5xZXVITHhqUHNESDhTcTVaRjNmMlFoekYvbzhY?=
 =?utf-8?B?K3Jjc0c2SXZkaDJ3OE1qc01VMGR1alZsK29hTU8zL0hhZW1ESUlpNFZDb0lW?=
 =?utf-8?B?RmN5UDhpOEIrcXlHbXJsaytHRGplajJmNXJSanpTai9kNXhZMi9CV24rT21s?=
 =?utf-8?B?cFFob2hRYm5LRVM2eXBMalhUM1lKbXhwSW9TS2hxTE1WM1VNQ01Dd2I5WC9x?=
 =?utf-8?B?amUyTWlDL0UvOWF4aXM3MzJWaS9QTGdYVGhQSythQytMdXJmQUNqN2dqVWR3?=
 =?utf-8?B?UDdxN3NKcGx4Wjh2SEF1bGhaeUd6YTlDaVF6cVU0MlZpeTd4U3F6WUtnRS9s?=
 =?utf-8?B?cXA1NkZha2M1WGtEOHZZVHhiMFJUUVhIZmhuaXA5RVdvdWxpZHUzaEpSQjdQ?=
 =?utf-8?B?VlhoU3FvbndFd3IvQ3doaUFOVHdCcVhBbGlrZE5GeE9MbDVkV0hvd0ZhWHJJ?=
 =?utf-8?B?VllpVVFnTFhRQVUxdTNNcm5YWWNMRCtRV0dNUllqSmU2TlVQc2dwWVVyTGRC?=
 =?utf-8?B?Z2NyMFRFYmZIZUZiN2RWZG03NXRtY0hsdjJvQVBXL3pKS1B2cy9DdUFjL1Vh?=
 =?utf-8?B?YUxPZlFqUTlWNTNJMEt6V0hjZlpyYndGeFRCQTE1MlBUbFd3Tms0bXFpeHMw?=
 =?utf-8?B?ekR6VUM3VjliSTF6SGV2bnhxSkN1U2Q1K05jdVZwZlU4aVBTTFVJdkFSY3No?=
 =?utf-8?B?U09xNCthN0Q0eE1RZmlBVE51a084ZGxvbjljUTl4LzEyWVg4c3IxVEpyV2N6?=
 =?utf-8?B?VUtQYmZGenBnajZyRWJkelB3OUVVdzY3TGhrb3hOSkw5N0YvbVVRN1Rkd1JH?=
 =?utf-8?B?Um1pN2tyVUx3UGh5SU1sclZDZTZKNXYzcHp2ckZoSHNkOERCUzJ6bmk4OXpV?=
 =?utf-8?B?bFI1ZGptSmFpQUgyd0RaU3lpYXFuSmdqcHB1UFMzcVN4ZjlQQUVxY0Fic2Rv?=
 =?utf-8?B?enVaa1llTThzOUpvbjd0cVpSbmJhOUpVNkp3REVEWWhweTgrcDhCUTdacGx0?=
 =?utf-8?B?NHdmaWZFMnFtWjFIMkVsUjRPVEdXS09kNjYyNTlOSmlsMVM5aEFNZ3NCVU5r?=
 =?utf-8?B?K1JndGhrMWphUUd2YTlDZ3ZBUm82em9mUlRFYlJDMDJvOHVsNDBlREZZOGRi?=
 =?utf-8?B?UllSSVlzaWg4ZHdsTTY4eCtDUTFFK1NlTldETjNXeElZemFpM01Vam1heUov?=
 =?utf-8?B?RXdVTExjQk9KOExMQTlVeFJndENJVjdNSkpIa1A2TWE5NTdJSXdpbHJpTHMy?=
 =?utf-8?B?anNFUk51NXp0U1p6VzFSd3dkWXpPdGtSMkEvRFBJTjlwU2tpZittcHN4aGpV?=
 =?utf-8?B?VDhIeDNmajlzRjIwVXRQZzYxZU5Wc0l2bm5lMzNyUDg2ZllFazY0QmJRczMy?=
 =?utf-8?B?Y0pGS0dWMEQ0bFMrY1ZXRjY4QUkyK0JXUVl4aWFzcjhhdGsyb2dKR1V0RGh5?=
 =?utf-8?B?Lzk4aWJ4S2g4Q211dTJHMGkvRlRMd2kzZ0xsUUVQWE9QdXJuN0NtZXZYajFZ?=
 =?utf-8?B?aU1FMDl4V1ZpeFFSeWl4Lzh2NHhiMVFYQ05DSmZnak5QaGlycjFhMUdrWWRK?=
 =?utf-8?B?K0Z4d0dEUWRKc0pVVm1PZCt5M3M4VGMweGludlR6TFJQeDNIblBQaGpKeEdp?=
 =?utf-8?B?Wk96RGIvWmpuNVNWU3F5K21KTlJ5R1VhRHQ0VGt5aGVnUDZTL2hhUW4rT2ZP?=
 =?utf-8?Q?UBZehcK/ZubstL2n6e9BZqgANSXk/E/zPcA0iUkSQJ58?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343983ef-3ea7-4b78-c4cb-08da86a0a78f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:49:39.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epaPHCpNKJOwMC9PwizKPsrEEJ5NgN5tZieMDnZ/VGjf7vY4BvaeRLFam8zmjrt2QzozluMUovhEchlYM4pnnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3737
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-08-24 22:29, Luben Tuikov wrote:
> Inlined:
>
> On 2022-08-24 12:21, Andrey Grodzovsky wrote:
>> On 2022-08-23 17:37, Luben Tuikov wrote:
>>> On 2022-08-23 14:57, Andrey Grodzovsky wrote:
>>>> On 2022-08-23 14:30, Luben Tuikov wrote:
>>>>
>>>>> On 2022-08-23 14:13, Andrey Grodzovsky wrote:
>>>>>> On 2022-08-23 12:58, Luben Tuikov wrote:
>>>>>>> Inlined:
>>>>>>>
>>>>>>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>>>>>>> Poblem: Given many entities competing for same rq on
>>>>>>> ^Problem
>>>>>>>
>>>>>>>> same scheduler an uncceptabliy long wait time for some
>>>>>>> ^unacceptably
>>>>>>>
>>>>>>>> jobs waiting stuck in rq before being picked up are
>>>>>>>> observed (seen using  GPUVis).
>>>>>>>> The issue is due to Round Robin policy used by scheduler
>>>>>>>> to pick up the next entity for execution. Under stress
>>>>>>>> of many entities and long job queus within entity some
>>>>>>> ^queues
>>>>>>>
>>>>>>>> jobs could be stack for very long time in it's entity's
>>>>>>>> queue before being popped from the queue and executed
>>>>>>>> while for other entites with samller job queues a job
>>>>>>> ^entities; smaller
>>>>>>>
>>>>>>>> might execute ealier even though that job arrived later
>>>>>>> ^earlier
>>>>>>>
>>>>>>>> then the job in the long queue.
>>>>>>>>
>>>>>>>> Fix:
>>>>>>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>>>>>>> on rq in such order that if job on one entity arrived
>>>>>>>> ealrier then job on another entity the first job will start
>>>>>>>> executing ealier regardless of the length of the entity's job
>>>>>>>> queue.
>>>>>>>>
>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>>>>>>      include/drm/gpu_scheduler.h              |  8 +++
>>>>>>>>      3 files changed, 71 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>>>>>      	atomic_inc(entity->rq->sched->score);
>>>>>>>>      	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>>>>>      	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>>>>>> +	sched_job->submit_ts = ktime_get();
>>>>>>>> +
>>>>>>>>      
>>>>>>>>      	/* first job wakes up scheduler */
>>>>>>>>      	if (first) {
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index 68317d3a7a27..c123aa120d06 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -59,6 +59,19 @@
>>>>>>>>      #define CREATE_TRACE_POINTS
>>>>>>>>      #include "gpu_scheduler_trace.h"
>>>>>>>>      
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +int drm_sched_policy = -1;
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * DOC: sched_policy (int)
>>>>>>>> + * Used to override default entites scheduling policy in a run queue.
>>>>>>>> + */
>>>>>>>> +MODULE_PARM_DESC(sched_policy,
>>>>>>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>>>>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>>>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>>>>>>> say the RR.
>>>>>>>
>>>>>>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
>>>>>> Christian is not against it, just against adding 'auto' here - like the
>>>>>> default.
>>>>> Exactly what I said.
>>>>>
>>>>> Also, I still think an O(1) scheduling (picking next to run) should be
>>>>> what we strive for in such a FIFO patch implementation.
>>>>> A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
>>>>> element.
>>>>>
>>>>> Regards,
>>>>> Luben
>>>> The only solution i see for this now is keeping a global per rq jobs
>>>> list parallel to SPCP queue per entity - we use this list when we switch
>>>> to FIFO scheduling, we can even start building  it ONLY when we switch
>>>> to FIFO building it gradually as more jobs come. Do you have other solution
>>>> in mind ?
>>> The idea is to "sort" on insertion, not on picking the next one to run.
>>>
>>> cont'd below:
>>>
>>>> Andrey
>>>>
>>>>>>>> +
>>>>>>>> +
>>>>>>>>      #define to_drm_sched_job(sched_job)		\
>>>>>>>>      		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>>>>>      
>>>>>>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>>>      }
>>>>>>>>      
>>>>>>>>      /**
>>>>>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>>>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>>>>       *
>>>>>>>>       * @rq: scheduler run queue to check.
>>>>>>>>       *
>>>>>>>> - * Try to find a ready entity, returns NULL if none found.
>>>>>>>> + * Try to find a ready entity, in round robin manner.
>>>>>>>> + *
>>>>>>>> + * Returns NULL if none found.
>>>>>>>>       */
>>>>>>>>      static struct drm_sched_entity *
>>>>>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>>      {
>>>>>>>>      	struct drm_sched_entity *entity;
>>>>>>>>      
>>>>>>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>>>      	return NULL;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +/**
>>>>>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>>>>>>> + *
>>>>>>>> + * @rq: scheduler run queue to check.
>>>>>>>> + *
>>>>>>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>>>>>>> + *
>>>>>>>> + * Returns NULL if none found.
>>>>>>>> + */
>>>>>>>> +static struct drm_sched_entity *
>>>>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>> +{
>>>>>>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>>>>>>> +	ktime_t oldest_ts = KTIME_MAX;
>>>>>>>> +	struct drm_sched_job *sched_job;
>>>>>>>> +
>>>>>>>> +	spin_lock(&rq->lock);
>>>>>>>> +
>>>>>>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>>>>>>> +
>>>>>>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>>>>>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>>>>>>> +
>>>>>>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>>>>>>> +				oldest_ts = sched_job->submit_ts;
>>>>>>>> +				entity = tmp;
>>>>>>>> +			}
>>>>>>>> +		}
>>>>>>>> +	}
>>>>>>> Here I think we need an O(1) lookup of the next job to pick out to run.
>>>>>>> I see a number of optimizations, for instance keeping the current/oldest
>>>>>>> timestamp in the rq struct itself,
>>>>>> This was my original design with rb tree based min heap per rq based on
>>>>>> time stamp of
>>>>>> the oldest job waiting in each entity's job queue (head of entity's SPCP
>>>>>> job queue). But how in this
>>>>>> case you record the timestamps of all the jobs waiting in entity's the
>>>>>> SPCP queue behind the head job ?
>>>>>> If you record only the oldest job and more jobs come you have no place
>>>>>> to store their timestamps and so
>>>>>> on next job select after current HEAD how you will know who came before
>>>>>> or after between 2 job queues of
>>>>>> of 2 entities ?
>>>>>>
>>>>>>
>>>>>>> or better yet keeping the next job
>>>>>>> to pick out to run at a head of list (a la timer wheel implementation).
>>>>>>> For suck an optimization to work, you'd prep things up on job insertion, rather
>>>>>>> than on job removal/pick to run.
>>>>>> I looked at timer wheel and I don't see how this applies here - it
>>>>>> assumes you know before
>>>>>> job submission your deadline time for job's execution to start - which
>>>>>> we don't so I don't see
>>>>>> how we can use it. This seems more suitable for real time scheduler
>>>>>> implementation where you
>>>>>> have a hard requirement to execute a job by some specific time T.
>>> In a timer wheel you instantly know the "soonest" job to run--it's naturally
>>> your "next" job, regardless of in what order the timers were added and what
>>> their timeout time is.
>>>
>>>>>> I also mentioned a list, obviously there is the brute force solution of
>>>>>> just ordering all jobs in one giant list and get
>>>>>> naturally a FIFO ordering this way with O(1) insertions and extractions
>>>>>> but I assume we don't want one giant jobs queue
>>>>>> for all the entities to avoid more dependeies between them (like locking
>>>>>> the entire list when one specific entity is killed and
>>>>>> needs to remove it's jobs from SW queue).
>>> You can also have a list of list pointers. It'd be trivial to remove a whole
>>> list from the main list, by simply removing an element--akin to locking out a rq,
>>> or should you need to edit the rq's entity list.
>>
>> So you do mean some kind of FIFO list. I really would want to avoid
>> maintaining an
>> extra data structure, we already have jobs stored in entity SPSC queue,
>> and now we will have to add
>> to a job struct  a pointer to another,  rq wide FIFO list, seems to me
>> like a recipe for problems.
> Maybe.
>
>> Thinking more about it, if I do let each job have it's original
>> submission timestamp stored I can go back to my original design
>> of storing sched entities themself in min heap structure based on
>> timestamp of the next job to run in the entity
>> (head of job list), this way we get O(1) extraction of next job to run
>> and it will still be FIFO. The cost will be O(log(# entites in rq))
>> for updating the min heap on each job extraction based on next head
>> timestamp. Still better then linear. On the downside we need to maintain
>> an rb tree structure
> O(1) would be ideal, and the "sorting" can be had when the jobs are submitted,
> which could take O(log N), as in sorting.
>
> But O(log N) on a balanced tree, such as you're using an R-B tree for a min heap,
> is a great metric and way faster than O(N).
>
>> to store the entitles in parallel to holding them in linear list for
>> round robin as it's tpday.
> You could choose to store one way or another, exclusively, depending on what
> scheduling policy had been chosen.
>
>> I am attaching my original patch to give sense of
>> it with TODO section were I added this new code. There are actually some
>> corner cases with empty SPCP queue becoming full and sampling not the
>> head of the
>> queue but the next one is what we need but i think it's solvable.
> Your WIP patch looks good.
>
>> In general it seems to me that before doing more complicated design we
>> actually need to measure and see if there is really a substantial
>> performance hit compared to current RR
>> or even  compared to possible O(1) extraction solution. No point to
>> complicate design if we don't get significant performance improvement
>> from it.
> WLOG, assuming all jobs are ready to be executed, then, for graphics, I'd imagine
> we'd want to pick the next job to run in O(1) time complexity. However O(log N) is
> still good and preferable. O(N) is slow. FWIW, the RR we have right now is O(1) given
> the job readiness assumption above.


You convinced me, going to try to rework my original patch. I asked 
Yunxiang to measure
performance delta anyway, just in case this rework get stuck and then we 
will just use
the primitive linear search for the client needs at least.

Andrey


>
>>
>>>>>>> I'm also surprised that there is no job transition from one queue to another,
>>>>>>> as it is picked to run next--for the above optimizations to implemented, you'd
>>>>>>> want a state transition from (state) queue to queue.
>>>>>> Not sure what you have in mind here ? How this helps ?
>>> I think I've explained this a few times now--each list represents a state and a job/entity
>>> travels through lists as it travels through states, which states more or less represent
>>> the state of execution in the hardware--it could be as simple as incoming --> pending --> done.
>>>
>>> It allows a finer grain when resetting the hardware (should the hardware allow it).
>>>
>>> Note that this isn't directly related to the O(1) mechanism I brought up here. As I said, I was surprised
>>> to find out none such distinction existed--that's all. Don't fixate on this.
>>>
>>> Regards,
>>> Luben
>>
>> Right, so this one is a separate  topic regarding the pending job list
>> refactoring which we need to discuss and fix separately - i have TODO to
>> come back
>> to your patches from a year ago or so which were addressing this.
>> Probably will try to get to this after finishing this work.
> Excellent!
>
> Regards,
> Luben
>
>> Andrey
>>
>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Luben
>>>>>>>
>>>>>> In my origianl design
>>>>>>
>>>>>>>> +
>>>>>>>> +	if (entity) {
>>>>>>>> +		rq->current_entity = entity;
>>>>>>>> +		reinit_completion(&entity->entity_idle);
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	spin_unlock(&rq->lock);
>>>>>>>> +	return entity;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * drm_sched_job_done - complete a job
>>>>>>>>       * @s_job: pointer to the job which is done
>>>>>>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>>>      
>>>>>>>>      	/* Kernel run queue has higher priority than normal run queue*/
>>>>>>>>      	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>>>>>> +		entity = drm_sched_policy != 1 ?
>>>>>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>>>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>>>>>> +
>>>>>>>>      		if (entity)
>>>>>>>>      			break;
>>>>>>>>      	}
>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>> index addb135eeea6..95865881bfcf 100644
>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>>>>>>      
>>>>>>>>      	/** @last_dependency: tracks @dependencies as they signal */
>>>>>>>>      	unsigned long			last_dependency;
>>>>>>>> +
>>>>>>>> +       /**
>>>>>>>> +	* @submit_ts:
>>>>>>>> +	*
>>>>>>>> +	* Marks job submit time
>>>>>>>> +	*/
>>>>>>>> +       ktime_t				submit_ts;
>>>>>>>> +
>>>>>>>>      };
>>>>>>>>      
>>>>>>>>      static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>>>>> Regards,
>>> Regards,
