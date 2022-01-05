Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C2484EB3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 08:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DBF10F4B2;
	Wed,  5 Jan 2022 07:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2088.outbound.protection.outlook.com [40.107.212.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F5410E866;
 Wed,  5 Jan 2022 07:25:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hghnuF+qCR2UAlJYYSJqvjpApx3rUiPy/gu24oO7aFtJnaZ2YVYNyBo+cVfuRHUWPDTERSFCKQHsZ3hsyb4SRwSAogSbp8EJq8qIly3SeJbJFVGmiWW9mPtUTuG7fDisJIRHbeEQglKnxoq/of+e5kbQP7A9iIU7b72BfjSCY/ljTEsoKD9hIDdQ+s+znfY0oW17wco6s+l1iLaUeUlrhSwW1vleF7+1If80o24QXpVacvYlP87wgJGqXUi6HZm+J8lFPzJZ0mBZiq5hZ/wKxyiY1+8aPGDO9TQkszeJ/c/yO1A6RPyli+g7QrXVrzMWLTXsEmrRIoFW+Qz5t22trA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYleE1/WFkVbutW4Qc0eDWITFSjJyMlGtZqRXyxN7xw=;
 b=AaVodn402/EcSkylsr29Ri+gl0bbZYU9Ygewf774CSgEvEBHwhKjU61Y3O3OKPYPwHhUGun+1qocP3gJfNXN1F8Nr/XoKQ1ftiEIyesePoGaqWlHN+BsZERcLxisAJO44bcgdVfucqj1i2U2j638sR3ZSdm4aKjiWPHiD17FTY70yUvdA2R6X8xlsLQJ11gIGMgtSW8mjonMtAtEPmn18ic8gScP7xv4Bv2B8uxtA5W8KZwZIYrML2PevtcrJq0Bp+hzqV05B8jAlveaaNLe4prE4QtPPMC6Tv/SNiA/cElJ4B4cU39eBYppU+eP910ZNHpzdQi03c5419/XZXYksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYleE1/WFkVbutW4Qc0eDWITFSjJyMlGtZqRXyxN7xw=;
 b=WvQ5ca4jzNxwHGfCJ4FzI+hdfP9I3Xw7jShSyuuWW6ymQeqdsRnwQfGIwOV4lMMgC3VBxOSTlH0yDvv8v6M7fraKC0f8/QhzGhKq5fkddjU+ytatBaab3jT/KhAzCy8D13jh05kKzi0x+sxByml6p38DgurqAOhGAYwHnmD/UoM=
Received: from MW4PR04CA0369.namprd04.prod.outlook.com (2603:10b6:303:81::14)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 07:25:16 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::26) by MW4PR04CA0369.outlook.office365.com
 (2603:10b6:303:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Wed, 5 Jan 2022 07:25:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Wed, 5 Jan 2022 07:25:14 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 01:25:11 -0600
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Deng, Emily"
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
From: JingWen Chen <jingwech@amd.com>
Message-ID: <3239734a-fe16-2948-ce53-5b6df88f5ba9@amd.com>
Date: Wed, 5 Jan 2022 15:25:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eae02e00-f7e2-4302-5939-08d9d01c84a2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5208:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5208DB6D06D2700AED9DAB75B74B9@BL1PR12MB5208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYvPXV6ACRXnuqaGQ82f7vI4wYPXQwFpAJXyacl6L6WSxDyOMl9+Z2OMV7RqaYxIjVLLuLBtQ7pCaiB2HGsoF/7eTutJqvgCeVoOk2emfPLwGIOHzGjFXxA0opGfEnpL35y/VC9onCcP7UkwZNpHRxFSzapM4BOTuKoJJfYqBkV03n9GLW5Rd2awLJ7F1p6pv5LQCGuBEMD0f4Y7xJ7Ejne/dP3wMpqy1UlVszTC/LZRiYVZdul+gzmtK5uK9TLNMhentG7YItWBI8JDFQI09O/nM7qwIFtLwjKYO+9kc/h2nb2ZHm+1M5/Mzee9aSaNoz5rZhQbzEM26sN4puCzq90eMka8H+yl8tYARX3D21HEfkVcCE68LuDKejbmCiTSuQQruHwVxdgCAyxwPc+lsRfrGYfIiGPxDRf2SpbfXPpiDUDwwBmalLEmX+pCAaAOchuof/AYrE/hLM4pTY6BVkmDGsRGZT+DXQvyJEE58/81P8HUhT64rVJIMHc5y4gfkrkOcwF5B20qO5re5doaWgdQe/ORg5etywxXekbIm3oS6RPqN6n5DR44WwLlse803x/76yI23sxgdTBLIdYMhacCOVpu8HwAX2cqHjRciowcB37TSPEpF0Uhzs21cd6cThgUj2R2RVO2akg0G13ayVM4yovork+NmNYpmq9Htvt9/rPvseOawbQ35BI8HSeypNLSK3mKe+UHEo+PyCfjJ1BpC3Rp8c8A6heCdkwvHjTw1G0w8GGock1eJi2HUEaPvUgldBYYQR81WBUjmk6tu/eXhtJ2+zG6ZkIUdlsG3OjQ41CkCl3Sdo82wUQ4i9Pk/PtPt6/iGG6q9M57wJFYwl2EF5Ars8+cLvtAy3b/gr8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(83380400001)(6636002)(47076005)(110136005)(8936002)(70586007)(5660300002)(8676002)(16576012)(186003)(66574015)(40460700001)(30864003)(82310400004)(6666004)(70206006)(316002)(31696002)(81166007)(921005)(508600001)(31686004)(36860700001)(2906002)(356005)(4001150100001)(4326008)(336012)(36756003)(16526019)(26005)(53546011)(2616005)(426003)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:25:14.9248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae02e00-f7e2-4302-5939-08d9d01c84a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
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


On 2022/1/4 下午7:36, Christian König wrote:
> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>
>
> Then we have a major design issue in the SRIOV protocol and really need to question this.
>
> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>
> As far as I can see the procedure should be:
> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
> 2. For each of those potential reset sources a work item is send to the single workqueue.

I think Andrey has already used the same ordered work queue to handle the reset from both ring timeout and hypervisor. (Patch 5)

So there should be no race between different reset sources. As ring timeout is much longer than the world switch time slice(6ms), we should see a reset from hypervisor queued into reset domain wq first and after the flr work done, then the ring timeout reset queued into reset domain.

> 3. One of those work items execute first and prepares the reset.
> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
> 5. Cleanup after the reset, eventually resubmit jobs etc..
> 6. Cancel work items which might have been scheduled from other reset sources.
>
> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.

So the reset_sem and in_gpu_reset is to prevent race between reset_domain(mostly hypervisor source) and other user spaces(e.g. kfd).

>
> Regards,
> Christian.
>
> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>
>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>> It makes the code to crash ... how could it be a fix ?
>>
>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>
>> Thanks
>> -------------------------------------------------------------------
>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>> -------------------------------------------------------------------
>> we are hiring software manager for CVS core team
>> -------------------------------------------------------------------
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Tuesday, January 4, 2022 6:19 PM
>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>> Cc: daniel@ffwll.ch
>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>
>> Hi Jingwen,
>>
>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>
>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>
>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>
>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>
>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>
>> Regards,
>> Christian.
>>
>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>> Hi Christian,
>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>
>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>
>>>   From my point of view, we can directly use amdgpu_device_lock_adev
>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>
>>> Best Regards,
>>> Jingwen Chen
>>>
>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>
>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>
>>>> Christian.
>>>>
>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>> Sure, I guess i can drop this patch then.
>>>>>
>>>>> Andrey
>>>>>
>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>
>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>
>>>>>>> Best wishes
>>>>>>> Emily Deng
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>> protection for SRIOV
>>>>>>>>
>>>>>>>> [AMD Official Use Only]
>>>>>>>>
>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>
>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> -----------------------------------------------------------------
>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>> -----------------------------------------------------------------
>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>> -----------------------------------------------------------------
>>>>>>>> -- 
>>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>> protection for SRIOV
>>>>>>>>
>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>> need for this.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>      2 files changed, 22 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>> amdgpu_device, virt);
>>>>>>>>>          int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>
>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>> -     * the VF FLR.
>>>>>>>>> -     */
>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>> -        return;
>>>>>>>>> -
>>>>>>>>>          amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>
>>>>>>>>>          xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>> 0, 0);
>>>>>>>>>
>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          } while (timeout > 1);
>>>>>>>>>
>>>>>>>>>      flr_done:
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>> -
>>>>>>>>>          /* Trigger recovery for world switch failure if no TDR
>>>>>>>>> */
>>>>>>>>>          if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>              && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>> amdgpu_device, virt);
>>>>>>>>>          int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>
>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>> -     * the VF FLR.
>>>>>>>>> -     */
>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>> -        return;
>>>>>>>>> -
>>>>>>>>>          amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>
>>>>>>>>>          xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>> 0, 0);
>>>>>>>>>
>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          } while (timeout > 1);
>>>>>>>>>
>>>>>>>>>      flr_done:
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>> -
>>>>>>>>>          /* Trigger recovery for world switch failure if no TDR
>>>>>>>>> */
>>>>>>>>>          if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>              && (!amdgpu_device_has_job_running(adev) ||
>
