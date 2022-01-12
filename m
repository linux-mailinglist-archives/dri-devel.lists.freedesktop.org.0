Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983448BE91
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 07:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAB510E537;
	Wed, 12 Jan 2022 06:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC35D10E537;
 Wed, 12 Jan 2022 06:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQTIF4/jbwo7mvmiMF6R4Oq92WGIIzYVzGUSC2xW0RuSG7yHTJ7mhVhWbk1fW1iQs/uW2c2/PaQw/m1fKrP1Vxj19Y6CQpeUIHqnOhuDqBttqBGH+hK2v2s+wMR5EkP+IdIvskeLhAjqw+JLGa+c3txdg1M2JSgbbNS9/H3ShkGzxvmTZbecb02Iz+kAoABX+BUGskLrN548EI7gx+Y4Z6Qb2PMvHxiT2Qwi4v6T5gpczjhXnhzE4EibqVm0c076g52zUeFviXYHGYA4T0HZWt/pi2T2O1F+XCtAoYzLrUuWSFXZdTsdST1dnY79CxKN68/4oLvkempQi+0VUkIvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80odTjt+edlWDmeu1+962i19j6eCcuNlE3md1MUZP7A=;
 b=oItJdEe8OYj4TXG6/zIODB8Zar7vGyUQ6UHeOJZs6xZrZ2vIr26FGwwd9O524vFxj3OdaZeV2+qqcepWNbdffjbU0I7+gpAZLRCkv0UwqzcJFCFX8jmD7mGadVzfMIPLxqJ3BFyf3zggvV5xg7jZwmBvbHHopmSvw1urpTp9F+tPMQ+PukUOoxQBCkA05sndH29xkM62UxUgwKzxTI+HS/jOrtYeMgo25hgg1oXzdAhrEWXeJphMys6P1b6uxC8cntbYSZE3ogpg22aBqaY5GWv9qKPn4KmIivZz39eGq9pICXTKyouPl27z6P0IOc68DpGnO08+X3oFnf9G4QVNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80odTjt+edlWDmeu1+962i19j6eCcuNlE3md1MUZP7A=;
 b=SDxhFYKOiubTW2sfDh8CF0UOdcidF0CEBd+jD7H65XNFTdpjcMsahdlQxvofOXxcWGQLCKkvxWK7T6/cq9holjmFoTROi3nx+0XLtzmEGsuzjp56z5YfYTRZMBNDUJJ5oHMLEbZ30+OBMW04hsb+PKs+p4t2VqN6wFZ+ittVAIA=
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by DM6PR12MB4563.namprd12.prod.outlook.com (2603:10b6:5:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 06:28:42 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::48) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Wed, 12 Jan 2022 06:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Wed, 12 Jan 2022 06:28:41 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 12 Jan
 2022 00:28:37 -0600
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Horace" <Horace.Chen@amd.com>,
 <kaili.wang@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
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
 <3dad24dc-b060-1739-a0de-0904e70ddaf6@amd.com>
 <a04dfafb-e65c-451d-e429-ae596d35a98b@amd.com>
 <b0711077-9f41-3b2f-5e4e-b8bf97f54809@amd.com>
From: JingWen Chen <jingwech@amd.com>
Message-ID: <af474db1-b40f-b365-beba-3f964b84cf90@amd.com>
Date: Wed, 12 Jan 2022 14:28:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b0711077-9f41-3b2f-5e4e-b8bf97f54809@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b423edd-c46d-4d1b-f7e2-08d9d594c6fa
X-MS-TrafficTypeDiagnostic: DM6PR12MB4563:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB456342DBA5C639B036A8415BB7529@DM6PR12MB4563.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 19cuOdx+PYHtASnecj2FrQIBdO6s6oMX2CmvrigES0QOALh+MmNezIx7vTjMxeigrL5W2/d2KTnASBp5LzyFJIL/rmVZnTWHjzHwYZQRRSB6EFuCzgMGint7Miu7bFsRwwN+A24Zg575xpjBffKygNNc1mLMaxG+rSWRCQwaXrDkjLtk0DB9rtEv5p+nWO6rIVYiMRiVFEmjj7bbwfH1BIV3DPNTelkH7AntKH43HeAiWgcrziDTpggYH/htf+RVqk0mCAGikAwp9Bim0Prj3Dp4/46y9vPC1f39Lx5wbMFD7NRFno/1CnMTV47wO6KzR2K27ax0Lo4MiNEpibXc4BkkUrCijnMs02kQL5t6m+9XwJYuRkbXxr771ZB/VCwzi/pRecJo36ujPhPsvJsQfTx4gQqpgkG8L6AqB07zpgKxdRFYzvBdHzIOD/XMRRTddhPmactCxSPE1MQGzDvxZHlRKZjWEv66WzVD9+SxCuC0SzPUhCzhgJrbIKOZ1QwLbXuL7V/JlXmSu7w2+18WKQDfV7uVK+eemg30ZLZrxjlMMVrosZpiUk38GWNTbIAdvLGq5brKFO/JjabbwaT+kFUJKFj5uavhMfyYH3WcnHEuwUBRg5Sk894T9AWcVa69FwlsZ6F68NM5W/891tUvPKeiBtUV+80JSPUJl89mos3dlEu8Dk25khIFMOL2+16sfn+iuRmMlk9zO/vFr+DEVD0GouFYBfxCkPp931rAvnYRNzAtSpE3O3Y76Y3rDpd6lz5fLyWgjkn9mtISAD4I+1T4y6AiL1UNusrnuceT8U14ncrm9G5CYCefROI9iFSPn53ZRD9feqJ1jeFTlouLrPqrLRNAHVztMTLgazRZ1D8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(336012)(31696002)(40460700001)(47076005)(8676002)(921005)(6636002)(4326008)(53546011)(82310400004)(31686004)(4001150100001)(316002)(36756003)(16576012)(81166007)(70206006)(426003)(36860700001)(186003)(356005)(66574015)(83380400001)(16526019)(508600001)(5660300002)(110136005)(30864003)(8936002)(70586007)(2906002)(2616005)(26005)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 06:28:41.9379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b423edd-c46d-4d1b-f7e2-08d9d594c6fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4563
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

Hi Andrey,

Please go ahead and push your change. I will prepare the RFC later.

On 2022/1/8 上午12:02, Andrey Grodzovsky wrote:
>
> On 2022-01-07 12:46 a.m., JingWen Chen wrote:
>> On 2022/1/7 上午11:57, JingWen Chen wrote:
>>> On 2022/1/7 上午3:13, Andrey Grodzovsky wrote:
>>>> On 2022-01-06 12:18 a.m., JingWen Chen wrote:
>>>>> On 2022/1/6 下午12:59, JingWen Chen wrote:
>>>>>> On 2022/1/6 上午2:24, Andrey Grodzovsky wrote:
>>>>>>> On 2022-01-05 2:59 a.m., Christian König wrote:
>>>>>>>> Am 05.01.22 um 08:34 schrieb JingWen Chen:
>>>>>>>>> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>>>>>>>>>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>>>>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>
>>>>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>>>>>
>>>>>>>>>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>>>>>>>>>
>>>>>>>>>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>>>>>>>>>
>>>>>>>>>>> As far as I can see the procedure should be:
>>>>>>>>>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>>>>>>>>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>>>>>>>>>> 3. One of those work items execute first and prepares the reset.
>>>>>>>>>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>>>>>>>>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>>>>>>>>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>>>>>>>>>
>>>>>>>>>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>>>>>>>>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>>>>>>>>>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>>>>>>>>>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>>>>>>>>>
>>>>>>>>> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.
>>>>>>>> Yeah, agree completely with JingWen. The hypervisor is the one in charge here, not the guest.
>>>>>>>>
>>>>>>>> What the hypervisor should do (and it already seems to be designed that way) is to send the guest a message that a reset is about to happen and give it some time to response appropriately.
>>>>>>>>
>>>>>>>> The guest on the other hand then tells the hypervisor that all processing has stopped and it is ready to restart. If that doesn't happen in time the hypervisor should eliminate the guest probably trigger even more severe consequences, e.g. restart the whole VM etc...
>>>>>>>>
>>>>>>>> Christian.
>>>>>>> So what's the end conclusion here regarding dropping this particular patch ? Seems to me we still need to drop it to prevent driver's MMIO access
>>>>>>> to the GPU during reset from various places in the code.
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>> Hi Andrey & Christian,
>>>>>>
>>>>>> I have ported your patch(drop the reset_sem and in_gpu_reset in flr work) and run some tests. If a engine hang during an OCL benchmark(using kfd), we can see the logs below:
>>>> Did you port the entire patchset or just 'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV' ?
>>>>
>>>>
>>> I ported the entire patchset
>>>>>> [  397.190727] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.301496] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.406601] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.532343] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.642251] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.746634] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.850761] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  397.960544] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  398.065218] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  398.182173] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  398.288264] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  398.394712] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>>> [  428.400582] [drm] clean up the vf2pf work item
>>>>>> [  428.500528] amdgpu 0000:00:07.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:8 pasid:32771, for process xgemmStandalone pid 3557 thread xgemmStandalone pid 3557)
>>>>>> [  428.527576] amdgpu 0000:00:07.0: amdgpu:   in page starting at address 0x00007fc991c04000 from client 0x1b (UTCL2)
>>>>>> [  437.531392] amdgpu: qcm fence wait loop timeout expired
>>>>>> [  437.535738] amdgpu: The cp might be in an unrecoverable state due to an unsuccessful queues preemption
>>>>>> [  437.537191] amdgpu 0000:00:07.0: amdgpu: GPU reset begin!
>>>>>> [  438.087443] [drm] RE-INIT-early: nv_common succeeded
>>>>>>
>>>>>> As kfd relies on these to check if GPU is in reset, dropping it will hit some page fault and fence error very easily.
>>>>> To be clear, we can also hit the page fault with the reset_sem and in_gpu_reset, just not as easily as dropping them.
>>>> Are you saying that the entire patch-set with and without patch 'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>> is casing this GPUVM page fault during testing engine hang while running benchmark ?
>>>>
>>>> Do you never observe this page fault when running this test with original tree without the new patch-set ?
>>>>
>>>> Andrey
>>>>
>>> I think this page fault issue can be seen even on the original tree. It's just drop the concurrent GPU reset will hit it more easily.
>>>
>>> We may need a new way to protect the reset in SRIOV.
>>>
>> Hi Andrey
>>
>> Actually, I would like to propose a RFC based on your patch, which will move the waiting logic in SRIOV flr work into amdgpu_device_gpu_recover_imp, host will wait a certain time till the pre_reset work done and guest send back response then actually do the vf flr. Hopefully this will help solving the page fault issue.
>>
>> JingWen
>
>
> This makes sense to me, you want the guest driver to be as idle as possible before host side starts actual reset. Go ahead and try it on top of my patch-set and update with results.
> I am away all next week but will try to find time and peek at your updates.
>
> Another question - how much the switch to single threaded reset makes SRIOV more unstable ? Is it OK to push the patches as is without your RFC or we need to wait for your RFC before push ?
>
> Andrey
>
>
>>
>>>>>>>>>> Andrey
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>
>>>>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>>>>>
>>>>>>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>>>>> It makes the code to crash ... how could it be a fix ?
>>>>>>>>>>>>
>>>>>>>>>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks
>>>>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>>>> we are hiring software manager for CVS core team
>>>>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>>>>
>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>>>>>>>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>>>>>>>>>
>>>>>>>>>>>> Hi Jingwen,
>>>>>>>>>>>>
>>>>>>>>>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>>>>>>>>>
>>>>>>>>>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>>>>>>>>>
>>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>>>>
>>>>>>>>>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>>>>>>>>>
>>>>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>>>>>>>>>> Hi Christian,
>>>>>>>>>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>>>>>>>>>
>>>>>>>>>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>>>>>>>>>
>>>>>>>>>>>>>      From my point of view, we can directly use amdgpu_device_lock_adev
>>>>>>>>>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>>>>>>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Best Regards,
>>>>>>>>>>>>> Jingwen Chen
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>>>>>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>>>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Best wishes
>>>>>>>>>>>>>>>>> Emily Deng
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Thanks
>>>>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>>>>> -- 
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>>>>>>>>>> need for this.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>>>>>>>>>         2 files changed, 22 deletions(-)
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>             struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>>             int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>             xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>             } while (timeout > 1);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>         flr_done:
>>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>>             /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>>>>             if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>>>>>                 && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>             struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>>             int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>             xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>             } while (timeout > 1);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>         flr_done:
>>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>>             /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>>>>             if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>>>>>                 && (!amdgpu_device_has_job_running(adev) ||
