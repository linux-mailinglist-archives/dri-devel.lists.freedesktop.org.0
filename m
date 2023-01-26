Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A867CACF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F036410E8EC;
	Thu, 26 Jan 2023 12:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FBE10E679
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:20:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k16so1002216wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 04:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wD0/cBpMURP3T6AehYqTMFEC2Qt1ePlfnXmped2kUx8=;
 b=m26II++3ant9U9Ei8vYt6lJg2+2odFOKYF+wFg/1SWgIFCB0UeHY+wTxczp9tnWLqg
 DGs8LpXfckBk1afLkVIUq0DDwuAAAcCsj5nWxZ46R8MmxDO295ZS7dD6usQ6Ch7lT2ft
 1FBxhsBF7XWHjyn7etHP0q0Vgy5W/T1YNCxN76nJzOl6r+q5gILUi+IOLNA/E+aM2qPi
 epB2RlsAqjdyhwPVIJMO9g4I2zigoXxhJN2HuPssi4pBU4NJbXpgKyHfoJeaAxx/TDKf
 qh1fOrpb2Q+TDRCAOYimEqKVp19UsMQJ1rXgA8IqYzARpwvBEy6AGJYLNBELZKVynOHp
 L7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wD0/cBpMURP3T6AehYqTMFEC2Qt1ePlfnXmped2kUx8=;
 b=7MfUZ6o6h6pKIaFp+/xtBXPODe3a0mugRB/Lf3jDVvw2Eo1I8EzuAvDx3j4en1aory
 RvKkhG6X7+LWkOuxYI8ckQghu3MhUGfvqunt71cLwStjSsarmtEYzs9Jnv10j7cSd6Rq
 KLyjz70NHFi4UCk3Fe2cHOHEXrnKwhLu7pQtGIbVzj+9GBMApy4YR0sMn1k4xl25zEQW
 vWzozRVuIA/mSo//LQKQxzLJR14w65U2nZagq6/AEMmVNIArDHwlFZJwbTfF2sFv28Nb
 twaWLWOyTHKk+0AOCfqPeZ8WeUyoIqQiarEhEf6NnGIiHaphWUy0BWRKLWdSwt3MtI16
 /SOg==
X-Gm-Message-State: AFqh2krHdHjLNJOSrEqG9Hf9c0kOY7USmsjooFokNP17TSaAKgmsGWeO
 ovdoV+UKRwrykiR0p6OZMoE=
X-Google-Smtp-Source: AMrXdXvaYKgcBn8xjhmKL7TlKxBht7t+vaOGOyN17/RKNeomU5jqE9s7Y74rc4pGQw2IxJJf2WHppQ==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id
 y25-20020a1c4b19000000b003dafb5c8754mr32200696wma.2.1674735617012; 
 Thu, 26 Jan 2023 04:20:17 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 a11-20020a5d508b000000b002be099f78c0sm1126042wrt.69.2023.01.26.04.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:20:16 -0800 (PST)
Message-ID: <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
Date: Thu, 26 Jan 2023 13:20:15 +0100
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
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

Am 26.01.23 um 10:49 schrieb Slivka, Danijel:
> [AMD Official Use Only - General]
>
> Hi Thomas,
>
> I have checked what you mentioned.
> When loading amdgpu we call  drm_client_init() during fbdev setup [1], the refcnt for drm_kms_helper increases from 3 -> 4.
> When we unbind vtcon, refcnt for drm_kms_helper drops 4 -> 3, but the drm_client_release() [2] is not called.
> The drm_client_release() is called only when unloading the amdgpu driver.
>
> Is this expected?

Yes, the client can't be released because it is possible that the vtcon 
is bound to this fbdev again.

Please test the handle work around I've send around internally. At least 
for me that approach seems to work.

Regards,
Christian.

>
> There is a comment for drm_client_release with regards to fbdev :
> * This function should only be called from the unregister callback. An exception
>   * is fbdev which cannot free the buffer if userspace has open file descriptors.
>
> Could this be relevant for our use case, although as Application/X/GDM are stopped at that point and no fd should be open.
>
> Thank you,
> BR,
> Danijel
>
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Wednesday, January 25, 2023 8:48 PM
>> To: Christian König <ckoenig.leichtzumerken@gmail.com>
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Slivka, Danijel
>> <Danijel.Slivka@amd.com>; dri-devel <dri-devel@lists.freedesktop.org>; Sharma,
>> Shashank <Shashank.Sharma@amd.com>
>> Subject: Re: Amdgpu module is references even after unbinding the vtcon
>>
>> Hi Christian
>>
>> Am 24.01.23 um 15:12 schrieb Christian König:
>>> Hi Thomas,
>>>
>>> we ran into a problem with the general fbcon/fbdev implementation and
>>> though that you might have some idea.
>>>
>>> What happens is the following:
>>> 1. We load amdgpu and get our normal fbcon.
>>> 2. fbcon allocates a dump BO as backing store for the console.
>>> 3. GDM/X/Applications start, new framebuffers are created BOs
>>> imported, exported etc...
>>> 4. Somehow X or GDM iterated over all the framebuffer objects the
>>> kernels knows about and export them as DMA-buf.
>>> 5. Application/X/GDM are stopped, handles closed, framebuffers
>>> released etc...
>>> 6. We unbind vtcon.
>>>
>>> At this point the amdgpu module usually has a reference count of 0 and
>>> can be unloaded, but since GDM/X/Whoever iterated over all the known
>>> framebuffers and exported them as DMA-buf (for whatever reason idk) we
>>> now still have an exported DMA-buf and with it a reference to the module.
>>>
>>> Any idea how we could prevent that?
>> Here's another stab in the dark.
>>
>> The big difference between old-style fbdev and the new one is that the old fbdev
>> setup (e.g., radeon) allocates a GEM object and puts together the fbdev data
>> structures from the BO in a fairly hackish way. The new style uses an in-kernel
>> client with a file to allocate the BO via dumb buffers; and holds a reference to the
>> DRM module.
>>
>> Maybe the reference comes from the in-kernel DRM client itself. [1] Check if the
>> client resources get released [2] when you unbind vtcon.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_client.c#L87
>> [2]
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_client.c#L16
>> 0
>>
>>> Thanks,
>>> Christian.
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Ivo Totev

