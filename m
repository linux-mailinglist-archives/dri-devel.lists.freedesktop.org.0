Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E316348601D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 06:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A5210FA57;
	Thu,  6 Jan 2022 05:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D276E10FA56;
 Thu,  6 Jan 2022 05:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSE36E4Qouy/AuP5CciDqjD8SAdARM6IYbO1cGvAB9EwntXx1qTqFJZf8Zdu6BFoj/VVZuZwo2ggVFjS48PVLS5M5D+wdqNdM5s8IrYp2DGWIZ6bE13Sal6lzQnyYiqAajgkCin7xZPJF+D2cYUBpbJ8OObkIWOn+QZOz6XWR5kFo3NykWUl51IxJHD37yRJCG97ogGHLx3UCOPLc2ps6NnlDm/KykNNgSa2PKFIGGr/oqvIDfY46A7hX2JhQaoz2fbnAX/yLbfkQQgkUSswjbZ4JkLwVr7tOg3+hUSPS664eH5/aWGa8615dnR/ZqKYF/kIfRGZEjaPUi0GJX4hEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KaAAo197U5+FjCwF/rc73xvoaT1cxDm862XiQx2G+A=;
 b=YKOAWq561Z7T03wrqSGp+CCiRNomDjEQUylCPSFkRsDkKWDuPzGaq9PbG8TTYPIhF984KBJegifimOZPQE6TxB+nMMr5oPqcmfYKz0zjUcWIzWlH7pQmB4zfuQES2k526Z01ptlVz7FBZlks+lCho3Cq1//+HVzKrhFOWkcQaMFgSs6Oi1ELFF/BWiv+jm1cFh+RWns2C0PGyXKqDN1KRqcFgP8OAa6xNeukgrBn9iTawDGW38GmYlzMU7VeEkdrdnOLHvRzMAzm8L9eHQRySc1XdObNOiGrOESkmQe7weCxdPr9r1NJpUjOe1MUyKJtvfUQ7hD8fQNUNtUjGvVVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KaAAo197U5+FjCwF/rc73xvoaT1cxDm862XiQx2G+A=;
 b=ac/WMrmZyd7VL47v/LPO6pQQLth3YGZJZSEe7kUanb6XmgTHxF2TQSvS4MefxhKU4BLRKKvhWEXYV4dzKhkzvOIZknCH9h36HLrT1kZNi0ABRelHQmDXE2PgeZ+COGdTyp5FVGyejO7AbTg55Ok6v8j4ZNW4asC0T6E6bHt6DAg=
Received: from DM5PR15CA0032.namprd15.prod.outlook.com (2603:10b6:4:4b::18) by
 BY5PR12MB3876.namprd12.prod.outlook.com (2603:10b6:a03:1a7::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 05:18:37 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::2) by DM5PR15CA0032.outlook.office365.com
 (2603:10b6:4:4b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Thu, 6 Jan 2022 05:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Thu, 6 Jan 2022 05:18:37 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 23:18:32 -0600
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
From: JingWen Chen <jingwech@amd.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
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
Message-ID: <1f876e45-964e-3796-b7b7-24a7ac40fa90@amd.com>
Date: Thu, 6 Jan 2022 13:18:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b23a5387-7bb1-ef1a-82f5-a012cc530203@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52bcb1dd-b4ed-49ea-8f98-08d9d0d3fe4c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3876:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB38767B594F95F35CCFD7A4A1B74C9@BY5PR12MB3876.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vBMEVgJng+Cpg8rKr1bYUqFb3oWvZRDsbtjIG6481fzXdX/E1cXKj8yQeMmNWwPl5MPOO4NCApr2N2MOvF29fqAkh03n0XsbPagg2YgOI6g9GCTMXAOGAn67vnezwSxv98ynKz11lBkKwyXmY5SbL9IimiKb6HFtWjWcw/xdVs8xUWcAPFm4+mgh6Ng0uv4b/7KYsT/gwUhiVz2ulStcO0utA2OZjrYYIYmNFkmZd8VhuPJvRIpT1pwiG8/5H1jvMTsGjHfZhQkGb+CrcIgtysDdDd+M5hGIKKuh94+JBY+3GnfSoQmG3YrjUHp9Yn3IfxQkSYL2NyteF8Phwt/TwpMw8e7+Cdnv/2pU404TYOBSEEyk14lGzEc/cP1GX8UlRiWQMFmnM6QF2JZcO8wtN+G5WsH5uCm/BGMQED1vVgTJxl9PhlD8Uu+ZJgurJwMAbj4ul2qkVSGpmVmq5IwwgXtDsMn9sGzinrLcVpBZPl3q48Dr+EyZ4uizd7aE3v7Fq8iJ5IoRLIbxBE1QUdlJjuKiiWI0MAQxtf86a9hGj/yoJX2g7mjJo2npHMBdyUWkx6Xd3G6k9mzaIDRBPEF7EtnCiBA6Ft8IHQi6aHU7lZ4U1ZookKV0k8mcXa+w3MunsHpCvni55qKVTJoMsR5RTBQfDC1NVRABZsoubOgXoG9mlOv1EZnHhPDTuTPFyGp2xjqQdRZ+LHeXEGtKlOnU4FavkkJp/86dIIQSR8z5YSHVWA13LfLaqdC/fFizzN8Uqw9pnfM20Jyc8YroWjOrjWof/Cip1/AXm8ir0EKoZbFczTy99gb+y9Qah1HSC0lot1w/dfG0bRYBa3TnFRJ70zHxjY4bEvX4uEMGwJxVEpc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(316002)(2906002)(26005)(186003)(508600001)(83380400001)(921005)(31686004)(66574015)(53546011)(36860700001)(81166007)(8676002)(8936002)(36756003)(6636002)(110136005)(4326008)(30864003)(82310400004)(31696002)(70206006)(70586007)(426003)(2616005)(40460700001)(4001150100001)(47076005)(356005)(5660300002)(16576012)(6666004)(16526019)(336012)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 05:18:37.1959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bcb1dd-b4ed-49ea-8f98-08d9d0d3fe4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3876
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


On 2022/1/6 下午12:59, JingWen Chen wrote:
> On 2022/1/6 上午2:24, Andrey Grodzovsky wrote:
>> On 2022-01-05 2:59 a.m., Christian König wrote:
>>> Am 05.01.22 um 08:34 schrieb JingWen Chen:
>>>> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>>>>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>> [AMD Official Use Only]
>>>>>>>
>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>
>>>>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>>>>
>>>>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>>>>
>>>>>> As far as I can see the procedure should be:
>>>>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>>>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>>>>> 3. One of those work items execute first and prepares the reset.
>>>>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>>>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>>>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>>>>
>>>>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>>>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>>>>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>>>>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>>>>
>>>> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.
>>> Yeah, agree completely with JingWen. The hypervisor is the one in charge here, not the guest.
>>>
>>> What the hypervisor should do (and it already seems to be designed that way) is to send the guest a message that a reset is about to happen and give it some time to response appropriately.
>>>
>>> The guest on the other hand then tells the hypervisor that all processing has stopped and it is ready to restart. If that doesn't happen in time the hypervisor should eliminate the guest probably trigger even more severe consequences, e.g. restart the whole VM etc...
>>>
>>> Christian.
>>
>> So what's the end conclusion here regarding dropping this particular patch ? Seems to me we still need to drop it to prevent driver's MMIO access
>> to the GPU during reset from various places in the code.
>>
>> Andrey
>>
> Hi Andrey & Christian,
>
> I have ported your patch(drop the reset_sem and in_gpu_reset in flr work) and run some tests. If a engine hang during an OCL benchmark(using kfd), we can see the logs below:
>
> [  397.190727] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.301496] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.406601] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.532343] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.642251] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.746634] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.850761] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  397.960544] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  398.065218] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  398.182173] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  398.288264] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  398.394712] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
> [  428.400582] [drm] clean up the vf2pf work item
> [  428.500528] amdgpu 0000:00:07.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:8 pasid:32771, for process xgemmStandalone pid 3557 thread xgemmStandalone pid 3557)
> [  428.527576] amdgpu 0000:00:07.0: amdgpu:   in page starting at address 0x00007fc991c04000 from client 0x1b (UTCL2)
> [  437.531392] amdgpu: qcm fence wait loop timeout expired
> [  437.535738] amdgpu: The cp might be in an unrecoverable state due to an unsuccessful queues preemption
> [  437.537191] amdgpu 0000:00:07.0: amdgpu: GPU reset begin!
> [  438.087443] [drm] RE-INIT-early: nv_common succeeded
>
> As kfd relies on these to check if GPU is in reset, dropping it will hit some page fault and fence error very easily.
To be clear, we can also hit the page fault with the reset_sem and in_gpu_reset, just not as easily as dropping them.
>
>>>>> Andrey
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>> [AMD Official Use Only]
>>>>>>>
>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>
>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>> It makes the code to crash ... how could it be a fix ?
>>>>>>>
>>>>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>>>>
>>>>>>> Thanks
>>>>>>> -------------------------------------------------------------------
>>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>> -------------------------------------------------------------------
>>>>>>> we are hiring software manager for CVS core team
>>>>>>> -------------------------------------------------------------------
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>>>>> Cc: daniel@ffwll.ch
>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>>>>
>>>>>>> Hi Jingwen,
>>>>>>>
>>>>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>>>>
>>>>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>>>>
>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>
>>>>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>>>>
>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>>>>> Hi Christian,
>>>>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>>>>
>>>>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>>>>
>>>>>>>>    From my point of view, we can directly use amdgpu_device_lock_adev
>>>>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>>>>
>>>>>>>> Best Regards,
>>>>>>>> Jingwen Chen
>>>>>>>>
>>>>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>>>>
>>>>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>>>>
>>>>>>>>>> Andrey
>>>>>>>>>>
>>>>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>>>>
>>>>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>>>>
>>>>>>>>>>>> Best wishes
>>>>>>>>>>>> Emily Deng
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>
>>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>>
>>>>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>>>>
>>>>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks
>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>> -- 
>>>>>>>>>>>>>
>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>
>>>>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>>>>> need for this.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>>>>       2 files changed, 22 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>           int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>           xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>       flr_done:
>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>           int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>           xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>       flr_done:
>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) ||
