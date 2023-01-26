Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD367CD4D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178F910E909;
	Thu, 26 Jan 2023 14:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C2710E119
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:11:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso3305376wmn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NSd3CU5XKWl6QG79E5Cg3GXFFPI2KG0M/KBU3d31VDA=;
 b=pZkgGilf1O6JEZFp4Ey+utwbmsaHlt6zkmtsqxKa1/qo/w9EPhQ7kYD34uXuZ+hjXz
 Z/AezrLm72cdAjV3xyUpaOz/yOHZMAnQaFW80a4oiFjmNhK80qAJYH0bTXrhcW9XxkG3
 2rQ3Yd8OvhkWuCrxex1NTJ1KTnxha7NMmebVs5ZPFZS7VwgY1iEbq/pVc/fQm2dYJQu6
 r8iQggggwgG/jIdATm/bb2HtAlyaBbBSA4LUv0GbYp3JaxP/VEQ7BSoFQj0kX37tzQNU
 2blpmQFOk59lLgfW+1bqIMNobaSGmg6I9HhltrNq4QJGvKvl5y2TK5qkkle05eM8l8uU
 BeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NSd3CU5XKWl6QG79E5Cg3GXFFPI2KG0M/KBU3d31VDA=;
 b=QbsD9J7CJsrlFYjhwpeMaSklHuiCNW3crrjPUwh217hcsG+aHi50alStAOEPPb5qqX
 G20uTwmwU6Uwzzjf2jrbKYFhT+1MMF642P30k3asUpQDNIoMimBvQk/ywiyD1H9/z5wB
 uLGb2Im41D118jB7g+Bc2oQoio29izMoon1eavSHHuddrmfHwLBuK946q7ofq0qGraia
 Oo1NY5WtRwrwFBDnQmu94W+gh25DdSplWrXdGTM1lFitF52E4SU4leFlFYK41C//spLW
 SoTchIamab/H1o7EMMUiD/NngLybq7731LyVU2kcsKXMHpnMes2UEdAD6i225QPLm4JH
 3ZpQ==
X-Gm-Message-State: AFqh2kp94BVm81iUN0LEEcMUPlB4fPZXL4j+NaWD+aTUBFMEhFPlhr1D
 Hw/RkLnTVaWXX88r8hw8O+Evr7Wwdyw=
X-Google-Smtp-Source: AMrXdXsOHBBq2vFtI5gUFQBB/fucy3o7zbO+r16aZRFTtFEZeVF7SJrc7BaDFG+k0022bxcPEBLnBA==
X-Received: by 2002:a05:600c:214f:b0:3d9:ecae:84f2 with SMTP id
 v15-20020a05600c214f00b003d9ecae84f2mr34255570wml.25.1674742297771; 
 Thu, 26 Jan 2023 06:11:37 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 q12-20020a056000136c00b002882600e8a0sm1440042wrz.12.2023.01.26.06.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 06:11:37 -0800 (PST)
Message-ID: <0e985a2e-8bd8-c488-6a21-15a57fb1720a@gmail.com>
Date: Thu, 26 Jan 2023 15:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
 <BYAPR12MB3094B0D8166231D88609CA6998CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <BYAPR12MB3094B0D8166231D88609CA6998CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danijel,

can you also double check that GDM/X is still capable of acquiring a 
DMA-buf file descriptor for the buffer (e.g. that we have a DMA-buf 
handle for it while they are started).

And that handover from fbdev to GDM/X is flicker free?

Thanks,
Christian.

Am 26.01.23 um 14:44 schrieb Slivka, Danijel:
> [AMD Official Use Only - General]
>
> Hi Christian,
>
> I have tested the proposed patch, the issue is not reproducible and everything else seems to work fine.
>
> BR,
> Danijel
>
>> -----Original Message-----
>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>> Sent: Thursday, January 26, 2023 1:20 PM
>> To: Slivka, Danijel <Danijel.Slivka@amd.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; dri-devel <dri-
>> devel@lists.freedesktop.org>; Sharma, Shashank <Shashank.Sharma@amd.com>
>> Subject: Re: Amdgpu module is references even after unbinding the vtcon
>>
>> Am 26.01.23 um 10:49 schrieb Slivka, Danijel:
>>> [AMD Official Use Only - General]
>>>
>>> Hi Thomas,
>>>
>>> I have checked what you mentioned.
>>> When loading amdgpu we call  drm_client_init() during fbdev setup [1], the
>> refcnt for drm_kms_helper increases from 3 -> 4.
>>> When we unbind vtcon, refcnt for drm_kms_helper drops 4 -> 3, but the
>> drm_client_release() [2] is not called.
>>> The drm_client_release() is called only when unloading the amdgpu driver.
>>>
>>> Is this expected?
>> Yes, the client can't be released because it is possible that the vtcon is bound to
>> this fbdev again.
>>
>> Please test the handle work around I've send around internally. At least for me
>> that approach seems to work.
>>
>> Regards,
>> Christian.
>>
>>> There is a comment for drm_client_release with regards to fbdev :
>>> * This function should only be called from the unregister callback. An exception
>>>    * is fbdev which cannot free the buffer if userspace has open file descriptors.
>>>
>>> Could this be relevant for our use case, although as Application/X/GDM are
>> stopped at that point and no fd should be open.
>>> Thank you,
>>> BR,
>>> Danijel
>>>
>>>> -----Original Message-----
>>>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Sent: Wednesday, January 25, 2023 8:48 PM
>>>> To: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Slivka, Danijel
>>>> <Danijel.Slivka@amd.com>; dri-devel
>>>> <dri-devel@lists.freedesktop.org>; Sharma, Shashank
>>>> <Shashank.Sharma@amd.com>
>>>> Subject: Re: Amdgpu module is references even after unbinding the
>>>> vtcon
>>>>
>>>> Hi Christian
>>>>
>>>> Am 24.01.23 um 15:12 schrieb Christian König:
>>>>> Hi Thomas,
>>>>>
>>>>> we ran into a problem with the general fbcon/fbdev implementation
>>>>> and though that you might have some idea.
>>>>>
>>>>> What happens is the following:
>>>>> 1. We load amdgpu and get our normal fbcon.
>>>>> 2. fbcon allocates a dump BO as backing store for the console.
>>>>> 3. GDM/X/Applications start, new framebuffers are created BOs
>>>>> imported, exported etc...
>>>>> 4. Somehow X or GDM iterated over all the framebuffer objects the
>>>>> kernels knows about and export them as DMA-buf.
>>>>> 5. Application/X/GDM are stopped, handles closed, framebuffers
>>>>> released etc...
>>>>> 6. We unbind vtcon.
>>>>>
>>>>> At this point the amdgpu module usually has a reference count of 0
>>>>> and can be unloaded, but since GDM/X/Whoever iterated over all the
>>>>> known framebuffers and exported them as DMA-buf (for whatever reason
>>>>> idk) we now still have an exported DMA-buf and with it a reference to the
>> module.
>>>>> Any idea how we could prevent that?
>>>> Here's another stab in the dark.
>>>>
>>>> The big difference between old-style fbdev and the new one is that
>>>> the old fbdev setup (e.g., radeon) allocates a GEM object and puts
>>>> together the fbdev data structures from the BO in a fairly hackish
>>>> way. The new style uses an in-kernel client with a file to allocate
>>>> the BO via dumb buffers; and holds a reference to the DRM module.
>>>>
>>>> Maybe the reference comes from the in-kernel DRM client itself. [1]
>>>> Check if the client resources get released [2] when you unbind vtcon.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_cl
>>>> ient.c#L87
>>>> [2]
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_cl
>>>> ient.c#L16
>>>> 0
>>>>
>>>>> Thanks,
>>>>> Christian.
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 Nürnberg, Germany (HRB 36809, AG Nürnberg)
>>>> Geschäftsführer: Ivo Totev

