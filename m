Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFDD482FCF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 11:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01F289415;
	Mon,  3 Jan 2022 10:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB71689415;
 Mon,  3 Jan 2022 10:17:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k18so32219404wrg.11;
 Mon, 03 Jan 2022 02:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zetGDyokpfvcxqVgPNpLxot+jThxtAiM48HjKzZhJr8=;
 b=jBjCvWkjUPShGV9M7iITvQY9VA1vc6DDV4714b3AFQVV6JnP5fPyV8S1uz9s2SXzJQ
 N8TEjFiZCWk4k3zj5OMDPw6ey8KU+5utR2En33EvNFaAOlDeuo9R3Cg8JqbkpTECtARD
 KSR0pLIZOgEiMMFc2yJ1WdXHDeGbqQfiUEqZjKoYv47QiKF6O+2v5LyQlkfwC4NEUOuE
 rzJwrrjyqP0OGJ9KPF1c1mmDpvVng/RX1Z4tLtJzIz3vBek3D1BHaZDDesczfqsSJlZe
 4ViZE0Sp8ueL9ofmVEQe3euolM4cSEMcUXfglY4lxaPHh0n1pHK5kggOqqafhH5iNtDC
 xP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zetGDyokpfvcxqVgPNpLxot+jThxtAiM48HjKzZhJr8=;
 b=CiWabhVHiu2NgVeLHa9oMD8WS7m1R5WwSOzRSUOXekX+GuDMJ+gaK3BuBhw489tO7M
 jt/46S2eWLQtwVH7Ssaepht1UhatC7h0Owzpw8XKbUjK1DtE/aHOmqTDr+CYROY7cqAs
 JrCdWO8kMeY08MKR8hgkAb1rBIKAeGlGiPiSlYvnqm9pOi/Y8L+AHFCEVQg1hb8AZG4H
 jRnzxZejrIH6Q/C50UZZbY8GjT7Fy9Xr3LDxu1kYustJAJaV7Os1nO5PcskgltusoatE
 y+5AlEgu4FTn28X2KF0gqI5NgDkuP0i9Iz9ZA5QfRK4azVmM8deqemYvDy7mB5/HncX3
 52yA==
X-Gm-Message-State: AOAM532HEo2ndj85Al42hZbNZGDOhbTl2kOwM35N5+pTN3g1wQqImHZN
 HSWNUyosWYkonWhARv2NlXw=
X-Google-Smtp-Source: ABdhPJzh3wnuRutRlmKvhIiGqPInXO/n8mrm338cm/qhgC0bHesHH6kS31YaePQeOr28Jv+mA96Xvw==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr30294155wru.456.1641205029426; 
 Mon, 03 Jan 2022 02:17:09 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:4bf5:8542:f955:f736?
 ([2a02:908:1252:fb60:4bf5:8542:f955:f736])
 by smtp.gmail.com with ESMTPSA id m12sm37425806wrp.49.2022.01.03.02.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 02:17:08 -0800 (PST)
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 JingWen Chen <jingwech@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
Date: Mon, 3 Jan 2022 11:17:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Please don't. This patch is vital to the cleanup of the reset procedure.

If SRIOV doesn't work with that we need to change SRIOV and not the driver.

Christian.

Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
> Sure, I guess i can drop this patch then.
>
> Andrey
>
> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>> I do agree with shaoyun, if the host find the gpu engine hangs first, 
>> and do the flr, guest side thread may not know this and still try to 
>> access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to 
>> identify the reset status). And this may lead to very bad result.
>>
>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>> These patches look good to me. JingWen will pull these patches and 
>>> do some basic TDR test on sriov environment, and give feedback.
>>>
>>> Best wishes
>>> Emily Deng
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>>>> <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-
>>>> gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen,
>>>> JingWen <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>> Cc: daniel@ffwll.ch
>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset 
>>>> protection
>>>> for SRIOV
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>
>>>> Please take a review on Andrey's patch
>>>>
>>>> Thanks
>>>> -------------------------------------------------------------------
>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>> -------------------------------------------------------------------
>>>> we are hiring software manager for CVS core team
>>>> -------------------------------------------------------------------
>>>>
>>>> -----Original Message-----
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>> <Horace.Chen@amd.com>
>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset 
>>>> protection
>>>> for SRIOV
>>>>
>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>> Since now flr work is serialized against  GPU resets there is no need
>>>>> for this.
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>    2 files changed, 22 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>> work_struct *work)
>>>>>        struct amdgpu_device *adev = container_of(virt, struct
>>>> amdgpu_device, virt);
>>>>>        int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>
>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>> -     * the VF FLR.
>>>>> -     */
>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>> -        return;
>>>>> -
>>>>>        amdgpu_virt_fini_data_exchange(adev);
>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>
>>>>>        xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>>
>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>> work_struct *work)
>>>>>        } while (timeout > 1);
>>>>>
>>>>>    flr_done:
>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>> -    up_write(&adev->reset_sem);
>>>>> -
>>>>>        /* Trigger recovery for world switch failure if no TDR */
>>>>>        if (amdgpu_device_should_recover_gpu(adev)
>>>>>            && (!amdgpu_device_has_job_running(adev) || diff --git
>>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>> work_struct *work)
>>>>>        struct amdgpu_device *adev = container_of(virt, struct
>>>> amdgpu_device, virt);
>>>>>        int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>
>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>> -     * the VF FLR.
>>>>> -     */
>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>> -        return;
>>>>> -
>>>>>        amdgpu_virt_fini_data_exchange(adev);
>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>
>>>>>        xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>>
>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>> work_struct *work)
>>>>>        } while (timeout > 1);
>>>>>
>>>>>    flr_done:
>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>> -    up_write(&adev->reset_sem);
>>>>> -
>>>>>        /* Trigger recovery for world switch failure if no TDR */
>>>>>        if (amdgpu_device_should_recover_gpu(adev)
>>>>>            && (!amdgpu_device_has_job_running(adev) ||

