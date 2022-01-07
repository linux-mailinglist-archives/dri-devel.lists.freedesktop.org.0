Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4448718F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 04:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019B711221B;
	Fri,  7 Jan 2022 03:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE25112215;
 Fri,  7 Jan 2022 03:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyFWBj0RP5zgLptlhCnW+iLJsxOjREBLNoJ1t4Dw53A7fGu95GOeWu1Yy2mQOMu5qBMakZfrcEgZzoAPF/T+EOs2RSqshaz8QwA1+l1TILBKzrXM7rglHDo6B0n0w+PV8iEzi7+NtNj+aPsNG3ydmHivPz6K+3sUpcrUKgK0+y1CUJmqYP7Cgymd7fYCYbCIKBxQy2dQyyfRqHlTORHyNSyj3JZLPBGmDMgqRAeSBzoap/7XGhYQW3/Fq8aRkGSiqn5YPT+/V+EwdMR97UQmxD/Sojoot3QM87mRs6GTcdPaM8wAa+aDTGB8xZMfdLVmUsH2wU0tw+LwscVHjV4ioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BDJsOqI+Gp5Y9Ipa3Y1QNu0csVrCmLDL1utLyxBtVM=;
 b=kDCJ5AtV5yNB3BC9JxbjqyBfJsx50MomgZOabLjosmzky6r4l8MbhMmN5D4flloMyNLq8Tw1rchl9tGN/I+RMugl+WAMe+tjM8gTILrxHkOsPzs+4p0D95M4T9ZU4BTypEZ16ADWmn+UguZrziJ9cIxwinpyq49DOwWbfw8ESfEHlVq/zww3u0TdJAdm2Cwd8Y9Ni5xxJ30Llwaf4cwg5wGeskhX8xRlTBb9bsUMeoiahL8i0O1weIl6OBdFdVdCgzOd5iKqR4RdWiXfR71lQnBdgBJyOMT3uETR50aoSWG3EPUjGaq7vgcLJnM3XhMd67w3XonlAVvMFrQkBxR0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BDJsOqI+Gp5Y9Ipa3Y1QNu0csVrCmLDL1utLyxBtVM=;
 b=SHBmHZfQyWflSBEnDm9Pq/9z2HgXZcGP7P9nYWw/Wwp74UxH+nzRc6hM0EVuFOy+GnsoWq7lcmb/qnyqsC8muHQmjQUgHDgVL6d7Y0hzHTxVJDv47TWAunXtsBeTFfLggw5LmRKn03hRpcQ/0hwijk4Jhgwa29i6JDBnjwxgPk8=
Received: from BN9PR03CA0268.namprd03.prod.outlook.com (2603:10b6:408:ff::33)
 by SJ0PR12MB5422.namprd12.prod.outlook.com (2603:10b6:a03:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 7 Jan
 2022 03:58:03 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::41) by BN9PR03CA0268.outlook.office365.com
 (2603:10b6:408:ff::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Fri, 7 Jan 2022 03:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Fri, 7 Jan 2022 03:58:02 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 21:57:59 -0600
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
 <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
 <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
 <a74c1198-6027-6a0f-55a8-24227c868704@amd.com>
 <c41f0294-fd64-cf16-8c22-994a7a2ed157@amd.com>
 <821c0b66-8c9c-9dff-a328-bfbc2233d4ef@gmail.com>
 <eecdf721-bdd1-0bc1-70c0-29bc8b844d68@amd.com>
 <b23a5387-7bb1-ef1a-82f5-a012cc530203@amd.com>
 <1f876e45-964e-3796-b7b7-24a7ac40fa90@amd.com>
 <a40beb3f-5ace-1932-8918-18c10339afdc@amd.com>
From: JingWen Chen <jingwech@amd.com>
Message-ID: <3dad24dc-b060-1739-a0de-0904e70ddaf6@amd.com>
Date: Fri, 7 Jan 2022 11:57:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a40beb3f-5ace-1932-8918-18c10339afdc@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 843fcd1a-4557-4566-8357-08d9d191e71c
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5422:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5422E5A0146F4876ECA6C21EB74D9@SJ0PR12MB5422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2DAl1Ck8rDSNqwow6vTtTPDExu7JUViys2dV4Ljr7hjLixbV8nQ6nqjkkZtIYwYl+tebzWTyDk1C1jcEb6wC5qqZOJvOwEPzbzttPp//IO4hO4zvu9jwMKfZQccpA2REtPneQ83kg/AM7AWdd6jT+pCWkoqKkQBIPCzehpT3nnGPOsYUBj9tiI82AJrBVmJhN5IvpUMi1YjtEJV/unjBbjEYUv1LJpX7w2MlmCa8lrTKN9Ibxxr6WkydblnEpviKDKz0E4V2voPiIFVThKaM47CkH97MUvaLnLxzQ7GmvX+0b2B7HAlDfK4C0nDBzngXQ4xP8Ni61RbNFjnro1kEu1Xy3pZ/KWM0RgiWU8iIeUcfQgrOx0bkKxMsQmOD9m9vaeIvA5bX9brSxUHr+CENeZeWHQb/jSgnGH2Moyymc+mZos3tFiE54YFYAsWcBwEI1qmiuCLGkK95Ay8cQdyRNd+F89TRhv/kKbA5eaxXotHEKrIABXyteg6efSwTw/mlGyrw5DX9XmML1u/Rjbj4279K9EWytS9bNCWiIETLIIgz4rFF3RfwcN1kyjfycNCyzHxmSnex0k8yrVcMPZYNAzO15Uadvpf+n+6q504GVYqamfEAop3xWmz+ZgMCQH/pjAdtCvG6fQJyyvCA0RHBbUcrbYNFu8OLgyLh+vt+VjIwel6r5gLWGWfc2DJx7Jtuz5nOIyDHASgniH8J60w1h5fDEW7GFZRvFUyguCYjKtMgAfnsttTH0eZDfEOeHbYzeCZ5we5gNaaJGMkBisP5G3FyyzwLSjNSb2p1yS5V8qsXauVXS3LfsYcAxRZT4biNl6KF+RqkuRvQGSWmo3JVzJRfF1EwFFkGhtBMomrjBW0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(356005)(36860700001)(47076005)(30864003)(336012)(5660300002)(2616005)(70206006)(36756003)(8936002)(81166007)(53546011)(6636002)(31696002)(921005)(316002)(16526019)(16576012)(4001150100001)(426003)(26005)(508600001)(31686004)(40460700001)(4326008)(82310400004)(110136005)(186003)(83380400001)(2906002)(8676002)(70586007)(6666004)(66574015)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 03:58:02.7191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843fcd1a-4557-4566-8357-08d9d191e71c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5422
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


On 2022/1/7 上午3:13, Andrey Grodzovsky wrote:
>
> On 2022-01-06 12:18 a.m., JingWen Chen wrote:
>> On 2022/1/6 下午12:59, JingWen Chen wrote:
>>> On 2022/1/6 上午2:24, Andrey Grodzovsky wrote:
>>>> On 2022-01-05 2:59 a.m., Christian König wrote:
>>>>> Am 05.01.22 um 08:34 schrieb JingWen Chen:
>>>>>> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>>>>>>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>
>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>>
>>>>>>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>>>>>>
>>>>>>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>>>>>>
>>>>>>>> As far as I can see the procedure should be:
>>>>>>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>>>>>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>>>>>>> 3. One of those work items execute first and prepares the reset.
>>>>>>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>>>>>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>>>>>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>>>>>>
>>>>>>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>>>>>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>>>>>>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>>>>>>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>>>>>>
>>>>>> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.
>>>>> Yeah, agree completely with JingWen. The hypervisor is the one in charge here, not the guest.
>>>>>
>>>>> What the hypervisor should do (and it already seems to be designed that way) is to send the guest a message that a reset is about to happen and give it some time to response appropriately.
>>>>>
>>>>> The guest on the other hand then tells the hypervisor that all processing has stopped and it is ready to restart. If that doesn't happen in time the hypervisor should eliminate the guest probably trigger even more severe consequences, e.g. restart the whole VM etc...
>>>>>
>>>>> Christian.
>>>> So what's the end conclusion here regarding dropping this particular patch ? Seems to me we still need to drop it to prevent driver's MMIO access
>>>> to the GPU during reset from various places in the code.
>>>>
>>>> Andrey
>>>>
>>> Hi Andrey & Christian,
>>>
>>> I have ported your patch(drop the reset_sem and in_gpu_reset in flr work) and run some tests. If a engine hang during an OCL benchmark(using kfd), we can see the logs below:
>
>
> Did you port the entire patchset or just 'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV' ?
>
>
I ported the entire patchset
>>>
>>> [  397.190727] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.301496] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.406601] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.532343] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.642251] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.746634] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.850761] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  397.960544] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  398.065218] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  398.182173] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  398.288264] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  398.394712] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>> [  428.400582] [drm] clean up the vf2pf work item
>>> [  428.500528] amdgpu 0000:00:07.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:8 pasid:32771, for process xgemmStandalone pid 3557 thread xgemmStandalone pid 3557)
>>> [  428.527576] amdgpu 0000:00:07.0: amdgpu:   in page starting at address 0x00007fc991c04000 from client 0x1b (UTCL2)
>>> [  437.531392] amdgpu: qcm fence wait loop timeout expired
>>> [  437.535738] amdgpu: The cp might be in an unrecoverable state due to an unsuccessful queues preemption
>>> [  437.537191] amdgpu 0000:00:07.0: amdgpu: GPU reset begin!
>>> [  438.087443] [drm] RE-INIT-early: nv_common succeeded
>>>
>>> As kfd relies on these to check if GPU is in reset, dropping it will hit some page fault and fence error very easily.
>> To be clear, we can also hit the page fault with the reset_sem and in_gpu_reset, just not as easily as dropping them.
>
> Are you saying that the entire patch-set with and without patch 'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
> is casing this GPUVM page fault during testing engine hang while running benchmark ?
>
> Do you never observe this page fault when running this test with original tree without the new patch-set ?
>
> Andrey
>
I think this page fault issue can be seen even on the original tree. It's just drop the concurrent GPU reset will hit it more easily.

We may need a new way to protect the reset in SRIOV.

>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>
>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>>
>>>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>> It makes the code to crash ... how could it be a fix ?
>>>>>>>>>
>>>>>>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>> we are hiring software manager for CVS core team
>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>>>>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>>>>>>
>>>>>>>>> Hi Jingwen,
>>>>>>>>>
>>>>>>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>>>>>>
>>>>>>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>>>>>>
>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>
>>>>>>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>>>>>>
>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>>>>>>> Hi Christian,
>>>>>>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>>>>>>
>>>>>>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>>>>>>
>>>>>>>>>>     From my point of view, we can directly use amdgpu_device_lock_adev
>>>>>>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>>>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>>>>>>
>>>>>>>>>> Best Regards,
>>>>>>>>>> Jingwen Chen
>>>>>>>>>>
>>>>>>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>>>>>>
>>>>>>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>>>>>>
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>>>>>>
>>>>>>>>>>>> Andrey
>>>>>>>>>>>>
>>>>>>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Best wishes
>>>>>>>>>>>>>> Emily Deng
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Thanks
>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>> -- 
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>>>>>>> need for this.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>>>>>>        2 files changed, 22 deletions(-)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>            struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>>            int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>            xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>            } while (timeout > 1);
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>        flr_done:
>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>            /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>            if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>>                && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>            struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>>            int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>            xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>            } while (timeout > 1);
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>        flr_done:
>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>            /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>            if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>>                && (!amdgpu_device_has_job_running(adev) ||
