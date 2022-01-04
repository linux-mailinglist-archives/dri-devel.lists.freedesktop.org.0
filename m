Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6421B483EDC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 10:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418AE10E51D;
	Tue,  4 Jan 2022 09:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2992D10E51D;
 Tue,  4 Jan 2022 09:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AavxHBxqXNWZq25GKyl/1Bh5p5FvPkMOVmD+7GTgVibflzgtUY2bS86QhqCTHXVtBq45cMKKvIL6jwMgHXf7G4IjR4I/OYjyKgydRjErqO0lqV7/0C2WdFwkX1wFNDOefY1gjksF9CINH32tnMGcVT4CMhk6eN0A/GVd+Y/KuDUhJXU5bcTNQ6MCIVNRfRmbouzvciahzHqhBdLBoHtlvMuvq2oIcHuuq8EFLB+GUvdoO2WXqLGrJqwZrIfWPVgukxH7/V6eHkp6qp7KxM/6iknCBuvu3hVe/SR7a+vybzcSmeUdq/FD9zVg7KXCkVAZUfOQZeCQCFCPlVIeCKhJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nhc5jFRrk9U89L37p9IH2HNCa9pvC78F3lGzLQngscQ=;
 b=kdo5CH7IqMPoK3NDEREPh6pkTSqLBlGpiPLb6QIZT2ETqF21JBa32V1gqdqgdLHmk7nUw/p1oxA5jhqVqjeAkpRpTSqJQ6qAxC8s0GWQLf1XXiShjfH44ZiGcq5umOVpdX2CkicxahlZWSk9d4jzq+sly6JIIbuSjzzKTeSsqqwbBpIsRHD24Y0RDL1/AKdNMa8eVxVtdMXAFvreYnZRLssARIY9WdCMCFWp5qnfTO7QX2a+Yo7sdaLXllBWfA/yuUcVipaYS2SAyFjqDK8uJZoYBpo2Ufw80Z43p996M6fruZoGZ2gaNbTGIBDe4d8KzvfU8myRLaqF6Wdn9HA56A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhc5jFRrk9U89L37p9IH2HNCa9pvC78F3lGzLQngscQ=;
 b=P2Ud10k1M5r/TajpyHt/V+CGSfBiKHjVu1PY3Lhqubb8APswabBkrzQZrW++AyKEhfnK3zpgM5ayRYDVGGH2KzfF8aWh2qcJMJzlGBzYzFNyjoi8vonx4DIJibODCGnHVWOY2nRjd3c3ja9aNCGGwLRot8ry+Ll/FAG0WUfqn4A=
Received: from BN6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:405:2::26)
 by PH0PR12MB5449.namprd12.prod.outlook.com (2603:10b6:510:e7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 09:08:04 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::b6) by BN6PR11CA0016.outlook.office365.com
 (2603:10b6:405:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Tue, 4 Jan 2022 09:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 09:08:04 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 03:07:59 -0600
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Horace" <Horace.Chen@amd.com>, "Chen, 
 JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
From: JingWen Chen <jingwech@amd.com>
Message-ID: <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
Date: Tue, 4 Jan 2022 17:07:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09d1b4fb-4fbf-4902-4b0f-08d9cf61b767
X-MS-TrafficTypeDiagnostic: PH0PR12MB5449:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB544980C548B6932CCD883E8DB74A9@PH0PR12MB5449.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sknU8VxsGDCT7OZpT7KaY1R6qxLaGXqi7GtGP9rqSI4n8wnaJAfIBVXYrD5htWYxF2GH8dzNylJws6VBJRtxtRv4vGrL87+Z2scX0xYJA6yr1jK9eeri87QgMTKve/sxHyjw6RRPmeNUGctglifeKQCCpfaw70COKhOEli4CLSxsy1E2k/WY+pYvRH05W/UrobIDoBLazZZGO/jUr6nkexoOdhiOeytUHlujIIK/vwMj9arOTTuGdZU+6iZWlWtn761ZBVHmIGmLhJHke3VH0Y4nsC0EsZIM+NANVU/wdwNs8euUfx8K7qgth4xlxNbI8RBuYz1ydDmYfsgcYoA/sqPmZaVfz9XHaB0RtSk9L/04NIN3qVkaFbrK03MFMzqMt9U3UYp4aye+f2H7NGM2rP7kMAtCSgsA0IxSA52YRW7i+o7FbRTDyg/sdF9P+UMiGUj7jd2AApxk/iNhQwBBuTagvwc0O+wIiUWp4SeF4BMMNdOiIWICvX4qDkyx/AbsB3OuBffpbaHqR4arcnqteMobBUREeuoKM+l4fusP1LXnLSDy9qRTgVGbsV+sx3cue9VXlOJT4971/Ac6zybBA0j+0uWWbNkILlHwlTP3QmScZRTUEEyhHUUjP+PGJCRvSh7wqEzzAjWzXLIyO5MdEBBSEbuS4etwJKaaqf8K62l49G94pdvpHvnIGfVYouFVVwbypP/EjZJRaWE3g53esJHfKkvqJ3eG/uF+EKOD2VTqT89hLZSNewJUXh15NHnoj4vaha5qkKZ01v5P+bxTofAW2bytO2JzjWD9b2DSHIh8U2D2uwbACk1KJ9AxGgE43BYE/yWbjaU1pIJ6uWnWmNftA8PAdsnETo9/DTEQWF8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(110136005)(83380400001)(921005)(8936002)(66574015)(8676002)(26005)(6666004)(40460700001)(316002)(336012)(6636002)(4326008)(5660300002)(426003)(82310400004)(36860700001)(16526019)(31696002)(16576012)(186003)(31686004)(70206006)(2616005)(356005)(70586007)(47076005)(53546011)(2906002)(36756003)(4001150100001)(508600001)(81166007)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:08:04.4944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d1b4fb-4fbf-4902-4b0f-08d9cf61b767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5449
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

Hi Christian,
I'm not sure what do you mean by "we need to change SRIOV not the driver".

Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.

From my point of view, we can directly use
amdgpu_device_lock_adev and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.

Best Regards,
Jingwen Chen

On 2022/1/3 下午6:17, Christian König wrote:
> Please don't. This patch is vital to the cleanup of the reset procedure.
>
> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>
> Christian.
>
> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>> Sure, I guess i can drop this patch then.
>>
>> Andrey
>>
>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>
>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>
>>>> Best wishes
>>>> Emily Deng
>>>>
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>>>>> <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-
>>>>> gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen,
>>>>> JingWen <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>> Cc: daniel@ffwll.ch
>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>>>>> for SRIOV
>>>>>
>>>>> [AMD Official Use Only]
>>>>>
>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>
>>>>> Please take a review on Andrey's patch
>>>>>
>>>>> Thanks
>>>>> -------------------------------------------------------------------
>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>> -------------------------------------------------------------------
>>>>> we are hiring software manager for CVS core team
>>>>> -------------------------------------------------------------------
>>>>>
>>>>> -----Original Message-----
>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>> <Horace.Chen@amd.com>
>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>>>>> for SRIOV
>>>>>
>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>> Since now flr work is serialized against  GPU resets there is no need
>>>>>> for this.
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>    2 files changed, 22 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>> work_struct *work)
>>>>>>        struct amdgpu_device *adev = container_of(virt, struct
>>>>> amdgpu_device, virt);
>>>>>>        int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>
>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>> -     * the VF FLR.
>>>>>> -     */
>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>> -        return;
>>>>>> -
>>>>>>        amdgpu_virt_fini_data_exchange(adev);
>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>
>>>>>>        xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>>>
>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>> work_struct *work)
>>>>>>        } while (timeout > 1);
>>>>>>
>>>>>>    flr_done:
>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>> -    up_write(&adev->reset_sem);
>>>>>> -
>>>>>>        /* Trigger recovery for world switch failure if no TDR */
>>>>>>        if (amdgpu_device_should_recover_gpu(adev)
>>>>>>            && (!amdgpu_device_has_job_running(adev) || diff --git
>>>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>> work_struct *work)
>>>>>>        struct amdgpu_device *adev = container_of(virt, struct
>>>>> amdgpu_device, virt);
>>>>>>        int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>
>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>> -     * the VF FLR.
>>>>>> -     */
>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>> -        return;
>>>>>> -
>>>>>>        amdgpu_virt_fini_data_exchange(adev);
>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>
>>>>>>        xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>>>
>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>> work_struct *work)
>>>>>>        } while (timeout > 1);
>>>>>>
>>>>>>    flr_done:
>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>> -    up_write(&adev->reset_sem);
>>>>>> -
>>>>>>        /* Trigger recovery for world switch failure if no TDR */
>>>>>>        if (amdgpu_device_should_recover_gpu(adev)
>>>>>>            && (!amdgpu_device_has_job_running(adev) ||
>
