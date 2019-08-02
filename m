Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B47F3F0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 12:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575FC6ED9E;
	Fri,  2 Aug 2019 10:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730066.outbound.protection.outlook.com [40.107.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D226ED9E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 10:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHLZcMjjkoocINDM+zAhjRsVaSlvq9Rhd0taPmc/g+BhCXmMygJJR1DZ1edBRSlZsDFEvve1CryYwrv36g8EEcudww5TsFIKq+yd0grPbuNq563ibs8/EqyDP7aUzsK1L91IhapDfPO6Wozjg5iTMKU+24RoH6+nGbUrPjKmQIgVrmXwDSbiwj7mkp8wnLZ1JenIsiitQ3szLjokBlJdLJmYHojyXe2T+/ry6nncCu8rzuOFMBVLMDY+xKYe+RsnQCb1BNjvo0KCpRKH8ht026QvRzBc8lDw4SFP8+LzYPJ1mGpdVgeApeXs8CmLF78JhvcREMNY576BqY46WEQ9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPKEgr1R/rn4UevN7akq98jYpDGNuEkncdMA23WPeQY=;
 b=kMVs8uxJFkzFV+CRiOAfYMmlaPZ7kQ+wkPQQt1RHrHHZ5hKDyrkQNp5DOpbsHPAF7mmK09hkvDN/L0x5Oqims9/LiE1TzoZVQdHGmqkzERnkqe+hw94GMXZDaK6X7ivnL2ydRgLncJWo9h+JjDrlMTv4gejJZVUXTLSJ+HFXneykj1bjl0165TO/zVHQJThDIVJYpGTCCLIOyPKFsYVtD5f4qHRmOgXHoJchcvQO9lgzX+WoaBWBDJzL3qj/DXQj5arWeWcsAKZImeO6JAknDcnH3FxUp3YVRrs7LjXg4IHKCPPot2PmAKq2iQg96WzX5Ttui/R/PsHm2luvGJx1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0068.namprd12.prod.outlook.com (2603:10b6:802:20::39)
 by DM5PR12MB1148.namprd12.prod.outlook.com (2603:10b6:3:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Fri, 2 Aug
 2019 10:01:38 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0068.outlook.office365.com
 (2603:10b6:802:20::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Fri, 2 Aug 2019 10:01:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 10:01:37 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 2 Aug
 2019 05:01:33 -0500
Subject: Re: Threaded submission & semaphore sharing
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
References: <e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com>
 <9bd985bb-1dfb-b28d-e1da-efa5b41464c8@intel.com>
 <d23455fe-c74a-2ee0-a954-af86963e4d2f@amd.com>
 <3b9f5b4c-827b-dfec-e7c8-a784b0573e85@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <8f20d7ed-fdb8-4c13-4b3e-a978064863bc@amd.com>
Date: Fri, 2 Aug 2019 18:01:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3b9f5b4c-827b-dfec-e7c8-a784b0573e85@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(13464003)(58126008)(76176011)(37036004)(31696002)(64126003)(2906002)(16586007)(316002)(6116002)(33964004)(30864003)(70586007)(70206006)(3846002)(14444005)(356004)(6666004)(6306002)(54896002)(65956001)(65806001)(68736007)(71190400001)(16576012)(486006)(81156014)(53936002)(606006)(11346002)(8676002)(336012)(426003)(81166006)(446003)(8936002)(186003)(4326008)(7736002)(236005)(26005)(2616005)(478600001)(126002)(65826007)(476003)(6246003)(53546011)(5660300002)(36756003)(54906003)(966005)(31686004)(110136005)(16526019)(53946003)(6636002)(229853002)(559001)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1148; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37fef110-a6e0-4198-8d51-08d7173068da
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB1148; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1148:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM5PR12MB11489A391D4827DF0A9D001AB4D90@DM5PR12MB1148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: q42UtuLXYE3rlYJ8w2vBQXfvfo+JzKUeDPhzfqEirYOGCeZXIYDlR8kUOH9eh9Klll4FnapNjO78NeEIJBg+4Ch1waZcEoixZm6KcAwu8YLxN0umampICn8ZDnDtgRLMNfZ5FAhn27yJ8+MPRPBIoU6TRKAL9jvicElm517jhPmPYx9Au5JIKcsG+N9g/SyTD8LPPNO9NmYJOX5ymwrr/BWSRsn89pHb3d9jKLb4KyYbkUgX+Cr7+xBdBlIO8yZBNFoE4JLuoaqW+/CkUfoFHSEithaZqtnWnD6IgelCDrgPUYbJgdlKHsKXhOWYvIQEiqcn8eNyL4bYAdzwQg1QvWhDNF036WPPoDP2j64bmqNwzGzlRoFCD1aVH4XA8hKCdjIMavKc8fImsOHBXCA1bcy+63LtSq/C0s67NGQzcsA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 10:01:37.9445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fef110-a6e0-4198-8d51-08d7173068da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPKEgr1R/rn4UevN7akq98jYpDGNuEkncdMA23WPeQY=;
 b=hhiUB/wSbqIbZ9vCxiwzwbJtBa7tcM0gs1PH5oGJgx3q1yLfeqY7bumEOrO/53C3rzSTGmFxdjeXqV1PnkFnbszBaJtLM5NU7FUr+2QwjWOBHq+ayrqbwzVvIDCH/QiC0FtL31PTd/8kefBKiyo/mbyeWtclj5iPS2lqDnjXJyM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1219885018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1219885018==
Content-Type: multipart/alternative;
	boundary="------------51487C0D30CE328267698CDB"
Content-Language: en-US

--------------51487C0D30CE328267698CDB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年08月02日 17:41, Lionel Landwerlin wrote:
> Hey David,
>
> On 02/08/2019 12:11, zhoucm1 wrote:
>>
>> Hi Lionel,
>>
>> For binary semaphore, I guess every one will think application will 
>> guarantee wait is behind the signal, whenever the semaphore is shared 
>> or used in internal-process.
>>
>> I think below two options can fix your problem:
>>
>> a. Can we extend vkWaitForFence so that it can be able to wait on 
>> fence-available? If fence is available, then it's safe to do 
>> semaphore wait in vkQueueSubmit.
>>
>
> I'm sorry, but I don't understand what vkWaitForFence() has to do with 
> this problem.
>
> They test case we're struggling with doesn't use that API.
>
>
> Can you maybe explain a bit more how it relates?
>
vkQueueSubmit()
vkWaitForFenceAvailable()
vkQueueSubmit()
vkWaitForFenceAvailable()
vkQueueSubmit()
vkWaitForFenceAvailable()

Sorry, that could lead application program very ugly.
>
>
>> b. Make waitBeforeSignal is valid for binary semaphore as well, as 
>> that way, It is reasonable to add wait/signal counting for binary 
>> syncobj.
>>
>
> Yeah essentially the change we're proposing internally makes binary 
> semaphores use syncobj timelines.
>
Will you raise up a MR to add the language of waitBeforeSignal support 
of binary semaphore to vulkan spec?

-David
>
> There is just another u64 associated with them.
>
>
> -Lionel
>
>
>>
>> -David
>>
>>
>> On 2019年08月02日 14:27, Lionel Landwerlin wrote:
>>> On 02/08/2019 09:10, Koenig, Christian wrote:
>>>>
>>>>
>>>> Am 02.08.2019 07:38 schrieb Lionel Landwerlin 
>>>> <lionel.g.landwerlin@intel.com>:
>>>>
>>>>     On 02/08/2019 08:21, Koenig, Christian wrote:
>>>>
>>>>
>>>>
>>>>         Am 02.08.2019 07:17 schrieb Lionel Landwerlin
>>>>         <lionel.g.landwerlin@intel.com>
>>>>         <mailto:lionel.g.landwerlin@intel.com>:
>>>>
>>>>             On 02/08/2019 08:08, Koenig, Christian wrote:
>>>>
>>>>                 Hi Lionel,
>>>>
>>>>                 Well that looks more like your test case is buggy.
>>>>
>>>>                 According to the code the ctx1 queue always waits
>>>>                 for sem1 and ctx2 queue always waits for sem2.
>>>>
>>>>
>>>>             That's supposed to be the same underlying syncobj
>>>>             because it's exported from one VkDevice as opaque FD
>>>>             from sem1 and imported into sem2.
>>>>
>>>>
>>>>         Well than that's still buggy and won't synchronize at all.
>>>>
>>>>         When ctx1 waits for a semaphore and then signals the same
>>>>         semaphore there is no guarantee that ctx2 will run in
>>>>         between jobs.
>>>>
>>>>         It's perfectly valid in this case to first run all jobs
>>>>         from ctx1 and then all jobs from ctx2.
>>>>
>>>>
>>>>     That's not really how I see the semaphores working.
>>>>
>>>>     The spec describe VkSemaphore as an interface to an internal
>>>>     payload opaque to the application.
>>>>
>>>>
>>>>     When ctx1 waits on the semaphore, it waits on the payload put
>>>>     there by the previous iteration.
>>>>
>>>>
>>>> And who says that it's not waiting for it's own previous payload?
>>>
>>>
>>> That's was I understood from you previous comment : "there is no 
>>> guarantee that ctx2 will run in between jobs"
>>>
>>>
>>>>
>>>> See if the payload is a counter this won't work either. Keep in 
>>>> mind that this has the semantic of a semaphore. Whoever grabs the 
>>>> semaphore first wins and can run, everybody else has to wait.
>>>
>>>
>>> What performs the "grab" here?
>>>
>>> I thought that would be vkQueueSubmit().
>>>
>>> Since that occuring from a single application thread, that should 
>>> then be ordered in execution of ctx1,ctx2,ctx1,...
>>>
>>>
>>> Thanks for your time on this,
>>>
>>>
>>> -Lionel
>>>
>>>
>>>>
>>>>     Then it proceeds to signal it by replacing the internal payload.
>>>>
>>>>
>>>> That's an implementation detail of our sync objects, but I don't 
>>>> think that this behavior is part of the Vulkan specification.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>>     ctx2 then waits on that and replaces the payload again with the
>>>>     new internal synchronization object.
>>>>
>>>>
>>>>     The internal payload is a dma fence in our case and signaling
>>>>     just replaces a dma fence by another or puts one where there
>>>>     was none before.
>>>>
>>>>     So we should have created a dependecy link between all the
>>>>     submissions and then should be executed in the order of
>>>>     QueueSubmit() calls.
>>>>
>>>>
>>>>     -Lionel
>>>>
>>>>
>>>>
>>>>         It only prevents running both at the same time and as far
>>>>         as I can see that still works even with threaded submission.
>>>>
>>>>         You need at least two semaphores for a tandem submission.
>>>>
>>>>         Regards,
>>>>         Christian.
>>>>
>>>>
>>>>
>>>>                 This way there can't be any Synchronisation between
>>>>                 the two.
>>>>
>>>>                 Regards,
>>>>                 Christian.
>>>>
>>>>                 Am 02.08.2019 06:55 schrieb Lionel Landwerlin
>>>>                 <lionel.g.landwerlin@intel.com>
>>>>                 <mailto:lionel.g.landwerlin@intel.com>:
>>>>                 Hey Christian,
>>>>
>>>>                 The problem boils down to the fact that we don't
>>>>                 immediately create dma fences when calling
>>>>                 vkQueueSubmit().
>>>>                 This is delayed to a thread.
>>>>
>>>>                 From a single application thread, you can
>>>>                 QueueSubmit() to 2 queues from 2 different devices.
>>>>                 Each QueueSubmit to one queue has a dependency on
>>>>                 the previous QueueSubmit on the other queue through
>>>>                 an exported/imported semaphore.
>>>>
>>>>                 From the API point of view the state of the
>>>>                 semaphore should be changed after each QueueSubmit().
>>>>                 The problem is that it's not because of the thread
>>>>                 and because you might have those 2 submission
>>>>                 threads tied to different VkDevice/VkInstance or
>>>>                 even different applications (synchronizing
>>>>                 themselves outside the vulkan API).
>>>>
>>>>                 Hope that makes sense.
>>>>                 It's not really easy to explain by mail, the best
>>>>                 explanation is probably reading the test :
>>>>                 https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788
>>>>
>>>>                 Like David mentioned you're not running into that
>>>>                 issue right now, because you only dispatch to the
>>>>                 thread under specific conditions.
>>>>                 But I could build a case to force that and likely
>>>>                 run into the same issue.
>>>>
>>>>                 -Lionel
>>>>
>>>>                 On 02/08/2019 07:33, Koenig, Christian wrote:
>>>>
>>>>                     Hi Lionel,
>>>>
>>>>                     Well could you describe once more what the
>>>>                     problem is?
>>>>
>>>>                     Cause I don't fully understand why a rather
>>>>                     normal tandem submission with two semaphores
>>>>                     should fail in any way.
>>>>
>>>>                     Regards,
>>>>                     Christian.
>>>>
>>>>                     Am 02.08.2019 06:28 schrieb Lionel Landwerlin
>>>>                     <lionel.g.landwerlin@intel.com>
>>>>                     <mailto:lionel.g.landwerlin@intel.com>:
>>>>                     There aren't CTS tests covering the issue I was
>>>>                     mentioning.
>>>>                     But we could add them.
>>>>
>>>>                     I don't have all the details regarding your
>>>>                     implementation but even with
>>>>                     the "semaphore thread", I could see it running
>>>>                     into the same issues.
>>>>                     What if a mix of binary & timeline semaphores
>>>>                     are handed to vkQueueSubmit()?
>>>>
>>>>                     For example with queueA & queueB from 2
>>>>                     different VkDevice :
>>>>                     vkQueueSubmit(queueA, signal semA);
>>>>                     vkQueueSubmit(queueA, wait on [semA,
>>>>                     timelineSemB]); with
>>>>                     timelineSemB triggering a wait before signal.
>>>>                     vkQueueSubmit(queueB, signal semA);
>>>>
>>>>
>>>>                     -Lionel
>>>>
>>>>                     On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:
>>>>                     > Hi Lionel,
>>>>                     >
>>>>                     > By the Queue thread is a heavy thread, which
>>>>                     is always resident in driver during application
>>>>                     running, our guys don't like that. So we switch
>>>>                     to Semaphore Thread, only when waitBeforeSignal
>>>>                     of timeline happens, we spawn a thread to
>>>>                     handle that wait. So we don't have your this issue.
>>>>                     > By the way, I already pass all your CTS cases
>>>>                     for now. I suggest you to switch to Semaphore
>>>>                     Thread instead of Queue Thread as well. It
>>>>                     works very well.
>>>>                     >
>>>>                     > -David
>>>>                     >
>>>>                     > -----Original Message-----
>>>>                     > From: Lionel Landwerlin
>>>>                     <lionel.g.landwerlin@intel.com>
>>>>                     <mailto:lionel.g.landwerlin@intel.com>
>>>>                     > Sent: Friday, August 2, 2019 4:52 AM
>>>>                     > To: dri-devel
>>>>                     <dri-devel@lists.freedesktop.org>
>>>>                     <mailto:dri-devel@lists.freedesktop.org>;
>>>>                     Koenig, Christian <Christian.Koenig@amd.com>
>>>>                     <mailto:Christian.Koenig@amd.com>; Zhou,
>>>>                     David(ChunMing) <David1.Zhou@amd.com>
>>>>                     <mailto:David1.Zhou@amd.com>; Jason Ekstrand
>>>>                     <jason@jlekstrand.net>
>>>>                     <mailto:jason@jlekstrand.net>
>>>>                     > Subject: Threaded submission & semaphore sharing
>>>>                     >
>>>>                     > Hi Christian, David,
>>>>                     >
>>>>                     > Sorry to report this so late in the process,
>>>>                     but I think we found an issue not directly
>>>>                     related to syncobj timelines themselves but
>>>>                     with a side effect of the threaded submissions.
>>>>                     >
>>>>                     > Essentially we're failing a test in crucible :
>>>>                     > func.sync.semaphore-fd.opaque-fd
>>>>                     > This test create a single binary semaphore,
>>>>                     shares it between 2 VkDevice/VkQueue.
>>>>                     > Then in a loop it proceeds to submit workload
>>>>                     alternating between the 2 VkQueue with one
>>>>                     submit depending on the other.
>>>>                     > It does so by waiting on the VkSemaphore
>>>>                     signaled in the previous iteration and
>>>>                     resignaling it.
>>>>                     >
>>>>                     > The problem for us is that once things are
>>>>                     dispatched to the submission thread, the
>>>>                     ordering of the submission is lost.
>>>>                     > Because we have 2 devices and they both have
>>>>                     their own submission thread.
>>>>                     >
>>>>                     > Jason suggested that we reestablish the
>>>>                     ordering by having semaphores/syncobjs carry an
>>>>                     additional uint64_t payload.
>>>>                     > This 64bit integer would represent be an
>>>>                     identifier that submission threads will
>>>>                     WAIT_FOR_AVAILABLE on.
>>>>                     >
>>>>                     > The scenario would look like this :
>>>>                     >       - vkQueueSubmit(queueA, signal on semA);
>>>>                     >           - in the caller thread, this would
>>>>                     increment the syncobj additional u64 payload
>>>>                     and return it to userspace.
>>>>                     >           - at some point the submission
>>>>                     thread of queueA submits the workload and
>>>>                     signal the syncobj of semA with value returned
>>>>                     in the caller thread of vkQueueSubmit().
>>>>                     >       - vkQueueSubmit(queueB, wait on semA);
>>>>                     >           - in the caller thread, this would
>>>>                     read the syncobj additional
>>>>                     > u64 payload
>>>>                     >           - at some point the submission
>>>>                     thread of queueB will try to submit the work,
>>>>                     but first it will WAIT_FOR_AVAILABLE the u64
>>>>                     value returned in the step above
>>>>                     >
>>>>                     > Because we want the binary semaphores to be
>>>>                     shared across processes and would like this to
>>>>                     remain a single FD, the simplest location to
>>>>                     store this additional u64 payload would be the
>>>>                     DRM syncobj.
>>>>                     > It would need an additional ioctl to read &
>>>>                     increment the value.
>>>>                     >
>>>>                     > What do you think?
>>>>                     >
>>>>                     > -Lionel
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>
>


--------------51487C0D30CE328267698CDB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2019年08月02日 17:41, Lionel Landwerlin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3b9f5b4c-827b-dfec-e7c8-a784b0573e85@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">Hey David,</div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">On 02/08/2019 12:11, zhoucm1 wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:d23455fe-c74a-2ee0-a954-af86963e4d2f@amd.com">
        <p>Hi Lionel,</p>
        <p>For binary semaphore, I guess every one will think
          application will guarantee wait is behind the signal, whenever
          the semaphore is shared or used in internal-process. <br>
        </p>
        <p>I think below two options can fix your problem:<br>
        </p>
        <p>a. Can we extend vkWaitForFence so that it can be able to
          wait on fence-available? If fence is available, then it's safe
          to do semaphore wait in vkQueueSubmit.</p>
      </blockquote>
      <p><br>
      </p>
      <p>I'm sorry, but I don't understand what vkWaitForFence() has to
        do with this problem.</p>
      <p>They test case we're struggling with doesn't use that API.</p>
      <p><br>
      </p>
      <p>Can you maybe explain a bit more how it relates?<br>
      </p>
    </blockquote>
    vkQueueSubmit()<br>
    vkWaitForFenceAvailable()<br>
    vkQueueSubmit()<br>
    vkWaitForFenceAvailable()<br>
    vkQueueSubmit()<br>
    vkWaitForFenceAvailable()<br>
    <br>
    Sorry, that could lead application program very ugly.<br>
    <blockquote type="cite"
      cite="mid:3b9f5b4c-827b-dfec-e7c8-a784b0573e85@intel.com">
      <p> </p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:d23455fe-c74a-2ee0-a954-af86963e4d2f@amd.com">
        <p>b. Make waitBeforeSignal is valid for binary semaphore as
          well, as that way, It is reasonable to add wait/signal
          counting for binary syncobj.<br>
        </p>
      </blockquote>
      <p><br>
      </p>
      <p>Yeah essentially the change we're proposing internally makes
        binary semaphores use syncobj timelines.</p>
    </blockquote>
    Will you raise up a MR to add the language of waitBeforeSignal
    support of binary semaphore to vulkan spec?<br>
    <br>
    -David<br>
    <blockquote type="cite"
      cite="mid:3b9f5b4c-827b-dfec-e7c8-a784b0573e85@intel.com">
      <p>There is just another u64 associated with them.<br>
      </p>
      <p><br>
      </p>
      <p>-Lionel<br>
      </p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:d23455fe-c74a-2ee0-a954-af86963e4d2f@amd.com">
        <p> </p>
        <p><br>
        </p>
        <p>-David<br>
        </p>
        <br>
        <div class="moz-cite-prefix">On 2019年08月02日 14:27, Lionel
          Landwerlin wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:9bd985bb-1dfb-b28d-e1da-efa5b41464c8@intel.com">
          <div class="moz-cite-prefix">On 02/08/2019 09:10, Koenig,
            Christian wrote:<br>
          </div>
          <blockquote type="cite"
            cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
            <div dir="auto">
              <div><br>
                <div class="gmail_extra"><br>
                  <div class="gmail_quote">Am 02.08.2019 07:38 schrieb
                    Lionel Landwerlin <a class="moz-txt-link-rfc2396E"
                      href="mailto:lionel.g.landwerlin@intel.com"
                      moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br
                      type="attribution">
                    <blockquote class="quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <div>
                        <div>On 02/08/2019 08:21, Koenig, Christian
                          wrote:<br>
                        </div>
                        <blockquote>
                          <div dir="auto">
                            <div><br>
                              <div><br>
                                <div class="elided-text">Am 02.08.2019
                                  07:17 schrieb Lionel Landwerlin <a
                                    href="mailto:lionel.g.landwerlin@intel.com"
                                    moz-do-not-send="true">
                                    &lt;lionel.g.landwerlin@intel.com&gt;</a>:<br
                                    type="attribution">
                                  <blockquote style="margin:0 0 0
                                    0.8ex;border-left:1px #ccc
                                    solid;padding-left:1ex">
                                    <div>
                                      <div>On 02/08/2019 08:08, Koenig,
                                        Christian wrote:<br>
                                      </div>
                                      <blockquote>
                                        <div dir="auto">Hi Lionel,
                                          <div dir="auto"><br>
                                          </div>
                                          <div dir="auto">Well that
                                            looks more like your test
                                            case is buggy.</div>
                                          <div dir="auto"><br>
                                          </div>
                                          <div dir="auto">According to
                                            the code the ctx1 queue
                                            always waits for sem1 and
                                            ctx2 queue always waits for
                                            sem2.</div>
                                        </div>
                                      </blockquote>
                                      <p><br>
                                      </p>
                                      <p>That's supposed to be the same
                                        underlying syncobj because it's
                                        exported from one VkDevice as
                                        opaque FD from sem1 and imported
                                        into sem2.<br>
                                      </p>
                                    </div>
                                  </blockquote>
                                </div>
                              </div>
                            </div>
                            <div dir="auto"><br>
                            </div>
                            <div dir="auto">Well than that's still buggy
                              and won't synchronize at all.</div>
                            <div dir="auto"><br>
                            </div>
                            <div dir="auto">When ctx1 waits for a
                              semaphore and then signals the same
                              semaphore there is no guarantee that ctx2
                              will run in between jobs.</div>
                            <div dir="auto"><br>
                            </div>
                            <div dir="auto">It's perfectly valid in this
                              case to first run all jobs from ctx1 and
                              then all jobs from ctx2.</div>
                          </div>
                        </blockquote>
                        <p><br>
                        </p>
                        <p>That's not really how I see the semaphores
                          working.</p>
                        <p>The spec describe VkSemaphore as an interface
                          to an internal payload opaque to the
                          application.</p>
                        <p><br>
                        </p>
                        <p>When ctx1 waits on the semaphore, it waits on
                          the payload put there by the previous
                          iteration.</p>
                      </div>
                    </blockquote>
                  </div>
                </div>
              </div>
              <div dir="auto"><br>
              </div>
              <div dir="auto">And who says that it's not waiting for
                it's own previous payload?</div>
            </div>
          </blockquote>
          <p><br>
          </p>
          <p>That's was I understood from you previous comment : "there
            is no guarantee that ctx2 will run in between jobs"</p>
          <p><br>
          </p>
          <blockquote type="cite"
            cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
            <div dir="auto">
              <div dir="auto"><br>
              </div>
              <div dir="auto">See if the payload is a counter this won't
                work either. Keep in mind that this has the semantic of
                a semaphore. Whoever grabs the semaphore first wins and
                can run, everybody else has to wait.</div>
            </div>
          </blockquote>
          <p><br>
          </p>
          <p>What performs the "grab" here?</p>
          <p>I thought that would be vkQueueSubmit().</p>
          <p>Since that occuring from a single application thread, that
            should then be ordered in execution of ctx1,ctx2,ctx1,...<br>
          </p>
          <p><br>
          </p>
          <p>Thanks for your time on this,</p>
          <p><br>
          </p>
          <p>-Lionel<br>
          </p>
          <p><br>
          </p>
          <blockquote type="cite"
            cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
            <div dir="auto">
              <div dir="auto"><br>
              </div>
              <div dir="auto">
                <div class="gmail_extra">
                  <div class="gmail_quote">
                    <blockquote class="quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <div>
                        <p>Then it proceeds to signal it by replacing
                          the internal payload.</p>
                      </div>
                    </blockquote>
                  </div>
                </div>
              </div>
              <div dir="auto"><br>
              </div>
              <div dir="auto">That's an implementation detail of our
                sync objects, but I don't think that this behavior is
                part of the Vulkan specification.</div>
              <div dir="auto"><br>
              </div>
              <div dir="auto">Regards,</div>
              <div dir="auto">Christian.</div>
              <div dir="auto">
                <div class="gmail_extra">
                  <div class="gmail_quote">
                    <blockquote class="quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <div>
                        <p><br>
                        </p>
                        <p>ctx2 then waits on that and replaces the
                          payload again with the new internal
                          synchronization object.</p>
                        <p><br>
                        </p>
                        <p>The internal payload is a dma fence in our
                          case and signaling just replaces a dma fence
                          by another or puts one where there was none
                          before.</p>
                        <p>So we should have created a dependecy link
                          between all the submissions and then should be
                          executed in the order of QueueSubmit() calls.<br>
                        </p>
                        <p><br>
                        </p>
                        <p>-Lionel<br>
                        </p>
                        <p><br>
                        </p>
                        <blockquote>
                          <div dir="auto">
                            <div dir="auto"><br>
                            </div>
                            <div dir="auto">It only prevents running
                              both at the same time and as far as I can
                              see that still works even with threaded
                              submission.</div>
                            <div dir="auto"><br>
                            </div>
                            <div dir="auto">You need at least two
                              semaphores for a tandem submission.</div>
                            <div dir="auto"><br>
                            </div>
                            <div dir="auto">Regards,</div>
                            <div dir="auto">Christian.</div>
                            <div dir="auto">
                              <div>
                                <div class="elided-text">
                                  <blockquote style="margin:0 0 0
                                    0.8ex;border-left:1px #ccc
                                    solid;padding-left:1ex">
                                    <div>
                                      <p><br>
                                      </p>
                                      <blockquote>
                                        <div dir="auto">
                                          <div dir="auto"><br>
                                          </div>
                                          <div dir="auto">This way there
                                            can't be any Synchronisation
                                            between the two.</div>
                                          <div dir="auto"><br>
                                          </div>
                                          <div dir="auto">Regards,</div>
                                          <div dir="auto">Christian.</div>
                                        </div>
                                        <div><br>
                                          <div class="elided-text">Am
                                            02.08.2019 06:55 schrieb
                                            Lionel Landwerlin <a
                                              href="mailto:lionel.g.landwerlin@intel.com"
                                              moz-do-not-send="true">
&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br type="attribution">
                                          </div>
                                        </div>
                                        <div>
                                          <div>Hey Christian,</div>
                                          <div><br>
                                          </div>
                                          <div>The problem boils down to
                                            the fact that we don't
                                            immediately create dma
                                            fences when calling
                                            vkQueueSubmit().</div>
                                          <div>This is delayed to a
                                            thread.</div>
                                          <div><br>
                                          </div>
                                          <div>From a single application
                                            thread, you can
                                            QueueSubmit() to 2 queues
                                            from 2 different devices.</div>
                                          <div>Each QueueSubmit to one
                                            queue has a dependency on
                                            the previous QueueSubmit on
                                            the other queue through an
                                            exported/imported semaphore.</div>
                                          <div><br>
                                          </div>
                                          <div>From the API point of
                                            view the state of the
                                            semaphore should be changed
                                            after each QueueSubmit().</div>
                                          <div>The problem is that it's
                                            not because of the thread
                                            and because you might have
                                            those 2 submission threads
                                            tied to different
                                            VkDevice/VkInstance or even
                                            different applications
                                            (synchronizing themselves
                                            outside the vulkan API).</div>
                                          <div><br>
                                          </div>
                                          <div>Hope that makes sense.</div>
                                          <div>It's not really easy to
                                            explain by mail, the best
                                            explanation is probably
                                            reading the test : <a
href="https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788"
                                              moz-do-not-send="true">
https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788</a></div>
                                          <div><br>
                                          </div>
                                          <div>Like David mentioned
                                            you're not running into that
                                            issue right now, because you
                                            only dispatch to the thread
                                            under specific conditions.</div>
                                          <div>But I could build a case
                                            to force that and likely run
                                            into the same issue.<br>
                                          </div>
                                          <div><br>
                                          </div>
                                          <div>-Lionel<br>
                                          </div>
                                          <div><br>
                                          </div>
                                          <div>On 02/08/2019 07:33,
                                            Koenig, Christian wrote:<br>
                                          </div>
                                          <blockquote>
                                            <div>
                                              <div dir="auto">Hi Lionel,
                                                <div dir="auto"><br>
                                                </div>
                                                <div dir="auto">Well
                                                  could you describe
                                                  once more what the
                                                  problem is?</div>
                                                <div dir="auto"><br>
                                                </div>
                                                <div dir="auto">Cause I
                                                  don't fully understand
                                                  why a rather normal
                                                  tandem submission with
                                                  two semaphores should
                                                  fail in any way.</div>
                                                <div dir="auto"><br>
                                                </div>
                                                <div dir="auto">Regards,</div>
                                                <div dir="auto">Christian.</div>
                                              </div>
                                              <div><br>
                                                <div>Am 02.08.2019 06:28
                                                  schrieb Lionel
                                                  Landwerlin <a
                                                    href="mailto:lionel.g.landwerlin@intel.com"
moz-do-not-send="true">
&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br type="attribution">
                                                </div>
                                              </div>
                                            </div>
                                            <font size="2"><span
                                                style="font-size:11pt">
                                                <div>There aren't CTS
                                                  tests covering the
                                                  issue I was
                                                  mentioning.<br>
                                                  But we could add them.<br>
                                                  <br>
                                                  I don't have all the
                                                  details regarding your
                                                  implementation but
                                                  even with <br>
                                                  the "semaphore
                                                  thread", I could see
                                                  it running into the
                                                  same issues.<br>
                                                  What if a mix of
                                                  binary &amp; timeline
                                                  semaphores are handed
                                                  to vkQueueSubmit()?<br>
                                                  <br>
                                                  For example with
                                                  queueA &amp; queueB
                                                  from 2 different
                                                  VkDevice :<br>
                                                      
                                                  vkQueueSubmit(queueA,
                                                  signal semA);<br>
                                                      
                                                  vkQueueSubmit(queueA,
                                                  wait on [semA,
                                                  timelineSemB]); with <br>
                                                  timelineSemB
                                                  triggering a wait
                                                  before signal.<br>
                                                      
                                                  vkQueueSubmit(queueB,
                                                  signal semA);<br>
                                                  <br>
                                                  <br>
                                                  -Lionel<br>
                                                  <br>
                                                  On 02/08/2019 06:18,
                                                  Zhou, David(ChunMing)
                                                  wrote:<br>
                                                  &gt; Hi Lionel,<br>
                                                  &gt;<br>
                                                  &gt; By the Queue
                                                  thread is a heavy
                                                  thread, which is
                                                  always resident in
                                                  driver during
                                                  application running,
                                                  our guys don't like
                                                  that. So we switch to
                                                  Semaphore Thread, only
                                                  when waitBeforeSignal
                                                  of timeline happens,
                                                  we spawn a thread to
                                                  handle that wait. So
                                                  we don't have your
                                                  this issue.<br>
                                                  &gt; By the way, I
                                                  already pass all your
                                                  CTS cases for now. I
                                                  suggest you to switch
                                                  to Semaphore Thread
                                                  instead of Queue
                                                  Thread as well. It
                                                  works very well.<br>
                                                  &gt;<br>
                                                  &gt; -David<br>
                                                  &gt;<br>
                                                  &gt; -----Original
                                                  Message-----<br>
                                                  &gt; From: Lionel
                                                  Landwerlin <a
                                                    href="mailto:lionel.g.landwerlin@intel.com"
moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
                                                  &gt; Sent: Friday,
                                                  August 2, 2019 4:52 AM<br>
                                                  &gt; To: dri-devel <a
href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
                                                  Koenig, Christian <a
href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                                                  Zhou, David(ChunMing)
                                                  <a
                                                    href="mailto:David1.Zhou@amd.com"
moz-do-not-send="true">&lt;David1.Zhou@amd.com&gt;</a>; Jason Ekstrand <a
href="mailto:jason@jlekstrand.net" moz-do-not-send="true">
&lt;jason@jlekstrand.net&gt;</a><br>
                                                  &gt; Subject: Threaded
                                                  submission &amp;
                                                  semaphore sharing<br>
                                                  &gt;<br>
                                                  &gt; Hi Christian,
                                                  David,<br>
                                                  &gt;<br>
                                                  &gt; Sorry to report
                                                  this so late in the
                                                  process, but I think
                                                  we found an issue not
                                                  directly related to
                                                  syncobj timelines
                                                  themselves but with a
                                                  side effect of the
                                                  threaded submissions.<br>
                                                  &gt;<br>
                                                  &gt; Essentially we're
                                                  failing a test in
                                                  crucible :<br>
                                                  &gt;
                                                  func.sync.semaphore-fd.opaque-fd<br>
                                                  &gt; This test create
                                                  a single binary
                                                  semaphore, shares it
                                                  between 2
                                                  VkDevice/VkQueue.<br>
                                                  &gt; Then in a loop it
                                                  proceeds to submit
                                                  workload alternating
                                                  between the 2 VkQueue
                                                  with one submit
                                                  depending on the
                                                  other.<br>
                                                  &gt; It does so by
                                                  waiting on the
                                                  VkSemaphore signaled
                                                  in the previous
                                                  iteration and
                                                  resignaling it.<br>
                                                  &gt;<br>
                                                  &gt; The problem for
                                                  us is that once things
                                                  are dispatched to the
                                                  submission thread, the
                                                  ordering of the
                                                  submission is lost.<br>
                                                  &gt; Because we have 2
                                                  devices and they both
                                                  have their own
                                                  submission thread.<br>
                                                  &gt;<br>
                                                  &gt; Jason suggested
                                                  that we reestablish
                                                  the ordering by having
                                                  semaphores/syncobjs
                                                  carry an additional
                                                  uint64_t payload.<br>
                                                  &gt; This 64bit
                                                  integer would
                                                  represent be an
                                                  identifier that
                                                  submission threads
                                                  will
                                                  WAIT_FOR_AVAILABLE on.<br>
                                                  &gt;<br>
                                                  &gt; The scenario
                                                  would look like this :<br>
                                                  &gt;       -
                                                  vkQueueSubmit(queueA,
                                                  signal on semA);<br>
                                                  &gt;           - in
                                                  the caller thread,
                                                  this would increment
                                                  the syncobj additional
                                                  u64 payload and return
                                                  it to userspace.<br>
                                                  &gt;           - at
                                                  some point the
                                                  submission thread of
                                                  queueA submits the
                                                  workload and signal
                                                  the syncobj of semA
                                                  with value returned in
                                                  the caller thread of
                                                  vkQueueSubmit().<br>
                                                  &gt;       -
                                                  vkQueueSubmit(queueB,
                                                  wait on semA);<br>
                                                  &gt;           - in
                                                  the caller thread,
                                                  this would read the
                                                  syncobj additional<br>
                                                  &gt; u64 payload<br>
                                                  &gt;           - at
                                                  some point the
                                                  submission thread of
                                                  queueB will try to
                                                  submit the work, but
                                                  first it will
                                                  WAIT_FOR_AVAILABLE the
                                                  u64 value returned in
                                                  the step above<br>
                                                  &gt;<br>
                                                  &gt; Because we want
                                                  the binary semaphores
                                                  to be shared across
                                                  processes and would
                                                  like this to remain a
                                                  single FD, the
                                                  simplest location to
                                                  store this additional
                                                  u64 payload would be
                                                  the DRM syncobj.<br>
                                                  &gt; It would need an
                                                  additional ioctl to
                                                  read &amp; increment
                                                  the value.<br>
                                                  &gt;<br>
                                                  &gt; What do you
                                                  think?<br>
                                                  &gt;<br>
                                                  &gt; -Lionel<br>
                                                  <br>
                                                  <br>
                                                </div>
                                              </span></font></blockquote>
                                          <p><br>
                                          </p>
                                        </div>
                                      </blockquote>
                                      <p><br>
                                      </p>
                                    </div>
                                  </blockquote>
                                </div>
                                <br>
                              </div>
                            </div>
                          </div>
                        </blockquote>
                        <p><br>
                        </p>
                      </div>
                    </blockquote>
                  </div>
                  <br>
                </div>
              </div>
            </div>
          </blockquote>
          <p><br>
          </p>
        </blockquote>
        <br>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------51487C0D30CE328267698CDB--

--===============1219885018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1219885018==--
