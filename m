Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BA48600C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 06:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A9310F68C;
	Thu,  6 Jan 2022 05:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFA210F687;
 Thu,  6 Jan 2022 05:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7Q92qkTGmvOsDxnOaBN8KYT9Cl6pyfQEXCud2c+VXHnfl4GQhCa6nXQvEmDkV2RFrAqcr1sjhikE73ftALakYNFDTcdV+u9vjhgBJn6CXGhFjof++VCg1c3YSMrKPM7yorFfM1BwhH89XoshJTcJZypy1PNd/s2pX4oDzEV/qbvw/XD7zR8GTpHuZGcwurOYkFV/jg/euDw1/jii6ujWiwdgFcSwUgjCyZp8G9iXq61VcSaalvqKWPaMuJwtzJYrffzeVRemOysT/YpXwRnpi571lpVfSWPOC5ZWBMuD7JU+tL/RtC6dCYItCSDSrMetjXJhwz26Z//yRSQY51RWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ub1gp+ws7aWNB8W8ZDdE5kWO61aKQQEAQn4NVg4fp4=;
 b=FX8BT9coMOODCoiEA5rR1eh5i3DDqoFD1dANmAUm/oPG8NlH3ACpDimiG9y78fFRvDoUOIGaD+tZp0MPsLgCKP+Zw3KHqKg+232oDn4MxWjmz9W3YT28briOX5Ky1jwqPsCVik3CRLHNO8IKt7A7nMV3prX+o1D1ZrGaKVLeeET9cuxH5E79Fge1SZKUy8fu4qIOhdO9qP+WG8xfuolmxp20YRmxS1X4FWBZCeh935XkvpAXfF2Bjl51fsPf33ZIqVhYmMgl4o7ThxwclticKjoabihulcDO6WmTQpFHklQTUkRFuAFENwNzqqqdZsD3cfMmgStWSpOCnErwweBzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ub1gp+ws7aWNB8W8ZDdE5kWO61aKQQEAQn4NVg4fp4=;
 b=Dktbx8Vw0IF4JfRUjXGbJIUowIb+CqBMbXRLoDsSB2ke3dwoMt5dFqCz1d1M0+VOTPtPEYwM9cgqm7vz6J2TVk9zY6CTzVLkBTx9wm9/SpTrryvGnPedJa4EDUi8fB2cs3QFAVjxZxogyRH2zMoNPVxXBI1H/9/PJVJQwDDBCc8=
Received: from CO2PR06CA0074.namprd06.prod.outlook.com (2603:10b6:104:3::32)
 by CY4PR1201MB0087.namprd12.prod.outlook.com (2603:10b6:910:1b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 05:00:05 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::99) by CO2PR06CA0074.outlook.office365.com
 (2603:10b6:104:3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Thu, 6 Jan 2022 05:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Thu, 6 Jan 2022 05:00:04 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 22:59:58 -0600
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
From: JingWen Chen <jingwech@amd.com>
Message-ID: <b23a5387-7bb1-ef1a-82f5-a012cc530203@amd.com>
Date: Thu, 6 Jan 2022 12:59:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <eecdf721-bdd1-0bc1-70c0-29bc8b844d68@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 183dd7af-4de2-4755-0c25-08d9d0d16701
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0087:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0087B5C18038E03BAAAE8500B74C9@CY4PR1201MB0087.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjwvvS71vn+o8n54aMoXDovnXO2IjP6bngEgmASu/JnkFX0Yf3CbWz04NsbfX9/AB7Rp4I9kLycEyh8azRVkMcivrR8x4p83W9OQmH5x4cD0QcTGntf/z7UutVDQLP5XEuRQBs+9hGUleHkpcz7OqCbjYxUGcIiBd0JSM0UmBwG5Vv3YaXN7e7Jva7kwLLqa75vuv6JKUxGuy9eiBeb/ZQM17UXAnuIxgdAoEcWr86bsX2M+bT+c8u87T8fOYGIiLgdIwXVUQ0s3oImw4kE4er9ammjXNrMjuo5LE1/OOA1VFLauInGUlT/xdX07Ft6ACxwWkyLh4n+4xbDBbwL39P3frwwf6dWa9HsNtTEcdvxvuDHzRfdq86xdxZKM3iye1bkvHj6LoAAd+VkhXtZFnsvZ3B4opkfbM57ApS/9T1RYfRBlLtCfZhh1E/bjeQ4k7JPEYlHDdfbzIJCY8wubGdkTpnPy1RXeLYrvHyU5dM7akOAFqf/PcWhitxg6H4bTp1pGGyJB20zyxQIyzwJMVe+JllKuYbV3L+djIA2QvDsIfpl7DteajRxHFg9gj2zcF+LSbnVWz/aceoW8MqnK0HG2fqJWnYPOJHAWWy69Ftm3qCiYh0emoEWF9BeoUyDx5z4EbTV8/FOfDC9p7f+qQM3QjYOgiW41mJhz/TlMEDDe3/yT0iYX6Mng1ZOEYgVlHB+au/LUV1w0tyiIx1MOyBfULXjUrIuALrxBifBVlP/oSWuC09tWvFAu+egF9kUWHYCxeYIvfd7CrSQRFZAsuhL4tXnwu9rA5jy0fP6gcMRsebNCMlgoxdImobhRngVhLYyvFUJURrElywsy2/aPwu3CY9JNfCCAsDJlm4UYFrg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(4001150100001)(110136005)(6666004)(31696002)(36860700001)(53546011)(426003)(5660300002)(336012)(316002)(356005)(47076005)(83380400001)(30864003)(40460700001)(2906002)(2616005)(82310400004)(16576012)(81166007)(186003)(66574015)(16526019)(921005)(26005)(36756003)(508600001)(4326008)(8676002)(70586007)(8936002)(6636002)(70206006)(31686004)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 05:00:04.2937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183dd7af-4de2-4755-0c25-08d9d0d16701
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0087
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


On 2022/1/6 上午2:24, Andrey Grodzovsky wrote:
>
> On 2022-01-05 2:59 a.m., Christian König wrote:
>> Am 05.01.22 um 08:34 schrieb JingWen Chen:
>>> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>>>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>> [AMD Official Use Only]
>>>>>>
>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>
>>>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>>>
>>>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>>>
>>>>> As far as I can see the procedure should be:
>>>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>>>> 3. One of those work items execute first and prepares the reset.
>>>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>>>
>>>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>>>
>>>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>>>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>>>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>>>
>>> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.
>>
>> Yeah, agree completely with JingWen. The hypervisor is the one in charge here, not the guest.
>>
>> What the hypervisor should do (and it already seems to be designed that way) is to send the guest a message that a reset is about to happen and give it some time to response appropriately.
>>
>> The guest on the other hand then tells the hypervisor that all processing has stopped and it is ready to restart. If that doesn't happen in time the hypervisor should eliminate the guest probably trigger even more severe consequences, e.g. restart the whole VM etc...
>>
>> Christian.
>
>
> So what's the end conclusion here regarding dropping this particular patch ? Seems to me we still need to drop it to prevent driver's MMIO access
> to the GPU during reset from various places in the code.
>
> Andrey
>
Hi Andrey & Christian,

I have ported your patch(drop the reset_sem and in_gpu_reset in flr work) and run some tests. If a engine hang during an OCL benchmark(using kfd), we can see the logs below:

[  397.190727] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.301496] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.406601] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.532343] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.642251] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.746634] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.850761] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  397.960544] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  398.065218] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  398.182173] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  398.288264] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  398.394712] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
[  428.400582] [drm] clean up the vf2pf work item
[  428.500528] amdgpu 0000:00:07.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:8 pasid:32771, for process xgemmStandalone pid 3557 thread xgemmStandalone pid 3557)
[  428.527576] amdgpu 0000:00:07.0: amdgpu:   in page starting at address 0x00007fc991c04000 from client 0x1b (UTCL2)
[  437.531392] amdgpu: qcm fence wait loop timeout expired
[  437.535738] amdgpu: The cp might be in an unrecoverable state due to an unsuccessful queues preemption
[  437.537191] amdgpu 0000:00:07.0: amdgpu: GPU reset begin!
[  438.087443] [drm] RE-INIT-early: nv_common succeeded

As kfd relies on these to check if GPU is in reset, dropping it will hit some page fault and fence error very easily.

>
>>
>>>> Andrey
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>> [AMD Official Use Only]
>>>>>>
>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>
>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>> It makes the code to crash ... how could it be a fix ?
>>>>>>
>>>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>>>
>>>>>> Thanks
>>>>>> -------------------------------------------------------------------
>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>> -------------------------------------------------------------------
>>>>>> we are hiring software manager for CVS core team
>>>>>> -------------------------------------------------------------------
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>>>> Cc: daniel@ffwll.ch
>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>>>
>>>>>> Hi Jingwen,
>>>>>>
>>>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>>>
>>>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>>>
>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>
>>>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>>>
>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>>>> Hi Christian,
>>>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>>>
>>>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>>>
>>>>>>>    From my point of view, we can directly use amdgpu_device_lock_adev
>>>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>>>
>>>>>>> Best Regards,
>>>>>>> Jingwen Chen
>>>>>>>
>>>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>>>
>>>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>>>
>>>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>>>
>>>>>>>>>>> Best wishes
>>>>>>>>>>> Emily Deng
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>
>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>
>>>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>>>
>>>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks
>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>> -- 
>>>>>>>>>>>>
>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>
>>>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>>>> need for this.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>>>       2 files changed, 22 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>           int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>
>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>> -     */
>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>> -
>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>
>>>>>>>>>>>>>           xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>
>>>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>>>>>
>>>>>>>>>>>>>       flr_done:
>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>> -
>>>>>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>> */
>>>>>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>           int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>
>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>> -     */
>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>> -
>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>
>>>>>>>>>>>>>           xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>
>>>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>>>>>
>>>>>>>>>>>>>       flr_done:
>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>> -
>>>>>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>> */
>>>>>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) ||
>>
