Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0E67CE02
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1925610E12E;
	Thu, 26 Jan 2023 14:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6369E10E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:26:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b7so1959819wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t1/JjCfUV4G/mMWbnmuwWHSBTbJl+zoO5rhvUB5iflQ=;
 b=Ufr2WG1COeYfJcBo1ENaeIAmeDLABK2h/Yntv83TLQs/XOPtJiql0pMQPnOYAStFbM
 Hrn4dNZo1vxp1EvxxPsp54riadFH+abYDB0UwhzECKRcvQuob+zLcA94YEgTGhV8PFcO
 JoaLO70xQQvwoKBDoQcTgFC2ak/VCkf9jdqGMPIG9B6NL8JdtYb1E8TAYpGrhpAyxUO9
 JlHlpOjfSndPJQIdEku1eCr4SQM4X4hKOR3im4i/W8QsQBlS7fZ4JUfyjhMT0wcmzaWW
 RBtlJiO6fTckz0OtkQUssF/8EHS5nMSYGtnEJcw/JsoYHlU3TLyYBZDGjljmAkDKuP8L
 xLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t1/JjCfUV4G/mMWbnmuwWHSBTbJl+zoO5rhvUB5iflQ=;
 b=Q5tNNY0pkjku4O/VzR9oR2qnY4wojpPP0xpwJJzYhxwpBLYq4zy69jBLFULPH8sgH5
 EdiJSKCwsC8O4CB+XShDajebfA+Mx/6wUFYbVPkUH/B3omihcA7pcjF1KxQWf83u5RfW
 rJ35MUTymJ4ll4IeJSJOID95YSjUbEpdUWypmOcFzN/E6VI/GGfJcbVqzdBV2ld0g7oU
 GMXyhJsPj/37IC+8hVNeossj1ZqalyrTpQbUWzy9E6LqOeuIzTHtgW2Jr8z+MxtflKF7
 LKbXg5CRxgqZv6WIdQPb1SBtF7kyqkiNMnGwBM5GbutyAOyXQunN3kzPV508BXpoNNi5
 SbOQ==
X-Gm-Message-State: AO0yUKV7B1sEUk0sMWNs/DsLW4Oh1uRKFAUs39Z9S2zm/9EFXDYUhRK0
 cRdNRG6EnoHnNUpsXWU2g6k=
X-Google-Smtp-Source: AK7set+8OojuOyirP7fjibhpbDwDqmOv75ds9Jg37zmbYe8meXKdoFfbO8+r+b1viVQPhwDm1cTohQ==
X-Received: by 2002:adf:e842:0:b0:2bf:c58b:9cba with SMTP id
 d2-20020adfe842000000b002bfc58b9cbamr2293746wrn.60.1674743187794; 
 Thu, 26 Jan 2023 06:26:27 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 a2-20020adff7c2000000b002bfb29d19e4sm1508584wrq.88.2023.01.26.06.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 06:26:27 -0800 (PST)
Message-ID: <5eab412c-decd-a0a5-cbc1-a99c3bccfd57@gmail.com>
Date: Thu, 26 Jan 2023 15:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
 <BYAPR12MB3094B0D8166231D88609CA6998CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <0e985a2e-8bd8-c488-6a21-15a57fb1720a@gmail.com>
 <MW4PR12MB566730E74F7E1D33CA90D838F2CF9@MW4PR12MB5667.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <MW4PR12MB566730E74F7E1D33CA90D838F2CF9@MW4PR12MB5667.namprd12.prod.outlook.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh, yeah. Very good point as well.

Christian.

Am 26.01.23 um 15:13 schrieb Sharma, Shashank:
> [AMD Official Use Only - General]
>
> I would also highly recommend this to be tested with another compositor (Like Weston/Sway etc)
>
> Regards
> Shashank
> -----Original Message-----
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> Sent: 26 January 2023 15:12
> To: Slivka, Danijel <Danijel.Slivka@amd.com>; Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; dri-devel <dri-devel@lists.freedesktop.org>; Sharma, Shashank <Shashank.Sharma@amd.com>
> Subject: Re: Amdgpu module is references even after unbinding the vtcon
>
> Hi Danijel,
>
> can you also double check that GDM/X is still capable of acquiring a DMA-buf file descriptor for the buffer (e.g. that we have a DMA-buf handle for it while they are started).
>
> And that handover from fbdev to GDM/X is flicker free?
>
> Thanks,
> Christian.
>
> Am 26.01.23 um 14:44 schrieb Slivka, Danijel:
>> [AMD Official Use Only - General]
>>
>> Hi Christian,
>>
>> I have tested the proposed patch, the issue is not reproducible and everything else seems to work fine.
>>
>> BR,
>> Danijel
>>
>>> -----Original Message-----
>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>> Sent: Thursday, January 26, 2023 1:20 PM
>>> To: Slivka, Danijel <Danijel.Slivka@amd.com>; Thomas Zimmermann
>>> <tzimmermann@suse.de>
>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; dri-devel <dri-
>>> devel@lists.freedesktop.org>; Sharma, Shashank
>>> <Shashank.Sharma@amd.com>
>>> Subject: Re: Amdgpu module is references even after unbinding the
>>> vtcon
>>>
>>> Am 26.01.23 um 10:49 schrieb Slivka, Danijel:
>>>> [AMD Official Use Only - General]
>>>>
>>>> Hi Thomas,
>>>>
>>>> I have checked what you mentioned.
>>>> When loading amdgpu we call  drm_client_init() during fbdev setup
>>>> [1], the
>>> refcnt for drm_kms_helper increases from 3 -> 4.
>>>> When we unbind vtcon, refcnt for drm_kms_helper drops 4 -> 3, but
>>>> the
>>> drm_client_release() [2] is not called.
>>>> The drm_client_release() is called only when unloading the amdgpu driver.
>>>>
>>>> Is this expected?
>>> Yes, the client can't be released because it is possible that the
>>> vtcon is bound to this fbdev again.
>>>
>>> Please test the handle work around I've send around internally. At
>>> least for me that approach seems to work.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> There is a comment for drm_client_release with regards to fbdev :
>>>> * This function should only be called from the unregister callback. An exception
>>>>     * is fbdev which cannot free the buffer if userspace has open file descriptors.
>>>>
>>>> Could this be relevant for our use case, although as
>>>> Application/X/GDM are
>>> stopped at that point and no fd should be open.
>>>> Thank you,
>>>> BR,
>>>> Danijel
>>>>
>>>>> -----Original Message-----
>>>>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Sent: Wednesday, January 25, 2023 8:48 PM
>>>>> To: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Slivka, Danijel
>>>>> <Danijel.Slivka@amd.com>; dri-devel
>>>>> <dri-devel@lists.freedesktop.org>; Sharma, Shashank
>>>>> <Shashank.Sharma@amd.com>
>>>>> Subject: Re: Amdgpu module is references even after unbinding the
>>>>> vtcon
>>>>>
>>>>> Hi Christian
>>>>>
>>>>> Am 24.01.23 um 15:12 schrieb Christian König:
>>>>>> Hi Thomas,
>>>>>>
>>>>>> we ran into a problem with the general fbcon/fbdev implementation
>>>>>> and though that you might have some idea.
>>>>>>
>>>>>> What happens is the following:
>>>>>> 1. We load amdgpu and get our normal fbcon.
>>>>>> 2. fbcon allocates a dump BO as backing store for the console.
>>>>>> 3. GDM/X/Applications start, new framebuffers are created BOs
>>>>>> imported, exported etc...
>>>>>> 4. Somehow X or GDM iterated over all the framebuffer objects the
>>>>>> kernels knows about and export them as DMA-buf.
>>>>>> 5. Application/X/GDM are stopped, handles closed, framebuffers
>>>>>> released etc...
>>>>>> 6. We unbind vtcon.
>>>>>>
>>>>>> At this point the amdgpu module usually has a reference count of 0
>>>>>> and can be unloaded, but since GDM/X/Whoever iterated over all the
>>>>>> known framebuffers and exported them as DMA-buf (for whatever
>>>>>> reason
>>>>>> idk) we now still have an exported DMA-buf and with it a reference
>>>>>> to the
>>> module.
>>>>>> Any idea how we could prevent that?
>>>>> Here's another stab in the dark.
>>>>>
>>>>> The big difference between old-style fbdev and the new one is that
>>>>> the old fbdev setup (e.g., radeon) allocates a GEM object and puts
>>>>> together the fbdev data structures from the BO in a fairly hackish
>>>>> way. The new style uses an in-kernel client with a file to allocate
>>>>> the BO via dumb buffers; and holds a reference to the DRM module.
>>>>>
>>>>> Maybe the reference comes from the in-kernel DRM client itself. [1]
>>>>> Check if the client resources get released [2] when you unbind vtcon.
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>> [1]
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_
>>>>> cl
>>>>> ient.c#L87
>>>>> [2]
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_
>>>>> cl
>>>>> ient.c#L16
>>>>> 0
>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>> --
>>>>> Thomas Zimmermann
>>>>> Graphics Driver Developer
>>>>> SUSE Software Solutions Germany GmbH Maxfeldstr. 5, 90409 Nürnberg,
>>>>> Germany (HRB 36809, AG Nürnberg)
>>>>> Geschäftsführer: Ivo Totev

