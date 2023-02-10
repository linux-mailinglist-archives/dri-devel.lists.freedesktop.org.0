Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32A691ED8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 13:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9227F10ED05;
	Fri, 10 Feb 2023 12:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1CA10ED05
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 12:07:43 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fj20so4603953edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 04:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YgzapotT0CPgicBu7X793HHDnE5xeXagjJSgYutZ5KI=;
 b=MltZqPDdJVTDzgv8pLVb+GdQ4PX/WhmqFZaImDJJStupfyPyHQLgusrVCoNVUE4Not
 w1uiDaJwfJ0uWnjPNWxFRBesEgxYYwZxWqYQwDCazjRZ2TzLLbBTxKe+GO6NIlws5Jyp
 nUW0Wovl8Lt5jQeaAY/znNUAgI1h5zrokBURDjvr+t4dg7eAXHVJ6oO4kGBf76EyxmYw
 F8sI9DyzfEqcbFXYnDL6hnYyPzrf11Gnl3b4DiE9DG0hGJ2M4XcQxh93JVcPfWxaIvy2
 aDV+jvqSjN4DRJBEBcwvWY9//3mRLR93AKz/vgJpsxC/KFqgb1HFzt/XC9fZiKS8hT6m
 pJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YgzapotT0CPgicBu7X793HHDnE5xeXagjJSgYutZ5KI=;
 b=OA00cbmUsyPsVaWvx9rP1ukOMLqHQ9G74zqvu9J5d8dbG2Gw00vEPMejWDCUcU99WO
 +kWjqyQdNmReG0/IV9AUO0yVzc5W934IN9CBtdKa+v1qq/2sAP026ZtK11FBSwHFDhzR
 TpR742oohuZdBrLQCJUyZCoT3JW5DXF2tmXOx0ikjW9aosv/1DTWwzAL3NQ3s8H5WcfM
 PzoqOKZXUqZOkaIzaYE7Ms7l8q099tHX8Q/9Rf6Xi49mhchCRF4FiFP/FOiw+SgLftfk
 9Tas7k61oDhk6wTXMP55A7FoiWOnq4Q0eXlD9Ug4sFH9OMwCVHYP/i1pedijtuIgwH6G
 4BDQ==
X-Gm-Message-State: AO0yUKWV9aUeGFBQfZBtmYVR43bka8CoaDAIqD/+fhfXYzsnisHuLjt7
 E7vKwbSWUVVzBYC9kIpPOfs=
X-Google-Smtp-Source: AK7set/m9kgvgMA+Lma/ZSAg4u/SJml2Qu53cwzF144xLu6REWf8xxAqUAs120dm/iw7ZtWk0aOU4Q==
X-Received: by 2002:a50:cd1d:0:b0:4ab:265c:1517 with SMTP id
 z29-20020a50cd1d000000b004ab265c1517mr3902647edi.27.1676030861408; 
 Fri, 10 Feb 2023 04:07:41 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:c3a8:7f10:6721:9ce3?
 ([2a02:908:1256:79a0:c3a8:7f10:6721:9ce3])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a50c2c1000000b004a21263bbaasm2095059edf.49.2023.02.10.04.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:07:40 -0800 (PST)
Message-ID: <67e10f56-15b3-a4f0-b5b3-23e878c1f12a@gmail.com>
Date: Fri, 10 Feb 2023 13:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
 <20230209141923.4n4ffsqchdrx5vnp@houat>
 <95e7f52a-46ce-5e16-b686-5e4011693287@gmail.com>
 <20230209184841.axndkk66geoopr6d@houat>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230209184841.axndkk66geoopr6d@houat>
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
Cc: daniel.vetter@ffwll.ch, =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.23 um 19:48 schrieb Maxime Ripard:
> On Thu, Feb 09, 2023 at 04:52:54PM +0100, Christian König wrote:
>> Am 09.02.23 um 15:19 schrieb Maxime Ripard:
>>> On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian König wrote:
>>>> Am 09.02.23 um 14:06 schrieb Maíra Canal:
>>>>> On 2/9/23 09:13, Christian König wrote:
>>>>>> Am 09.02.23 um 12:23 schrieb Maíra Canal:
>>>>>>> On 2/9/23 05:18, Christian König wrote:
>>>>>>>> Hello everyone,
>>>>>>>>
>>>>>>>> the drm_debugfs has a couple of well known design problems.
>>>>>>>>
>>>>>>>> Especially it wasn't possible to add files between
>>>>>>>> initializing and registering
>>>>>>>> of DRM devices since the underlying debugfs directory wasn't
>>>>>>>> created yet.
>>>>>>>>
>>>>>>>> The resulting necessity of the driver->debugfs_init()
>>>>>>>> callback function is a
>>>>>>>> mid-layering which is really frowned on since it creates a horrible
>>>>>>>> driver->DRM->driver design layering.
>>>>>>>>
>>>>>>>> The recent patch "drm/debugfs: create device-centered
>>>>>>>> debugfs functions" tried
>>>>>>>> to address those problem, but doesn't seem to work
>>>>>>>> correctly. This looks like
>>>>>>>> a misunderstanding of the call flow around
>>>>>>>> drm_debugfs_init(), which is called
>>>>>>>> multiple times, once for the primary and once for the render node.
>>>>>>>>
>>>>>>>> So what happens now is the following:
>>>>>>>>
>>>>>>>> 1. drm_dev_init() initially allocates the drm_minor objects.
>>>>>>>> 2. ... back to the driver ...
>>>>>>>> 3. drm_dev_register() is called.
>>>>>>>>
>>>>>>>> 4. drm_debugfs_init() is called for the primary node.
>>>>>>>> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>>>>>>>       drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
>>>>>>>> to add the files
>>>>>>>>       for the primary node.
>>>>>>>> 6. The driver->debugfs_init() callback is called to add
>>>>>>>> debugfs files for the
>>>>>>>>       primary node.
>>>>>>>> 7. The added files are consumed and added to the primary
>>>>>>>> node debugfs directory.
>>>>>>>>
>>>>>>>> 8. drm_debugfs_init() is called for the render node.
>>>>>>>> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>>>>>>>       drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
>>>>>>>> to add the files
>>>>>>>>       again for the render node.
>>>>>>>> 10. The driver->debugfs_init() callback is called to add
>>>>>>>> debugfs files for the
>>>>>>>>        render node.
>>>>>>>> 11. The added files are consumed and added to the render
>>>>>>>> node debugfs directory.
>>>>>>>>
>>>>>>>> 12. Some more files are added through drm_debugfs_add_file().
>>>>>>>> 13. drm_debugfs_late_register() add the files once more to
>>>>>>>> the primary node
>>>>>>>>        debugfs directory.
>>>>>>>> 14. From this point on files added through
>>>>>>>> drm_debugfs_add_file() are simply ignored.
>>>>>>>> 15. ... back to the driver ...
>>>>>>>>
>>>>>>>> Because of this the dev->debugfs_mutex lock is also
>>>>>>>> completely pointless since
>>>>>>>> any concurrent use of the interface would just randomly
>>>>>>>> either add the files to
>>>>>>>> the primary or render node or just not at all.
>>>>>>>>
>>>>>>>> Even worse is that this implementation nails the coffin for
>>>>>>>> removing the
>>>>>>>> driver->debugfs_init() mid-layering because otherwise
>>>>>>>> drivers can't control
>>>>>>>> where their debugfs (primary/render node) are actually added.
>>>>>>>>
>>>>>>>> This patch set here now tries to clean this up a bit, but
>>>>>>>> most likely isn't
>>>>>>>> fully complete either since I didn't audit every driver/call path.
>>>>>>> I tested the patchset on the v3d, vc4 and vkms and all the files
>>>>>>> are generated
>>>>>>> as expected, but I'm getting the following errors on dmesg:
>>>>>>>
>>>>>>> [    3.872026] debugfs: File 'v3d_ident' in directory '0'
>>>>>>> already present!
>>>>>>> [    3.872064] debugfs: File 'v3d_ident' in directory '128'
>>>>>>> already present!
>>>>>>> [    3.872078] debugfs: File 'v3d_regs' in directory '0' already
>>>>>>> present!
>>>>>>> [    3.872087] debugfs: File 'v3d_regs' in directory '128'
>>>>>>> already present!
>>>>>>> [    3.872097] debugfs: File 'measure_clock' in directory '0'
>>>>>>> already present!
>>>>>>> [    3.872105] debugfs: File 'measure_clock' in directory '128'
>>>>>>> already present!
>>>>>>> [    3.872116] debugfs: File 'bo_stats' in directory '0' already
>>>>>>> present!
>>>>>>> [    3.872124] debugfs: File 'bo_stats' in directory '128'
>>>>>>> already present!
>>>>>>>
>>>>>>> It looks like the render node is being added twice, since this
>>>>>>> doesn't happen
>>>>>>> for vc4 and vkms.
>>>>>> Thanks for the feedback and yes that's exactly what I meant with
>>>>>> that I haven't looked into all code paths.
>>>>>>
>>>>>> Could it be that v3d registers it's debugfs files from the
>>>>>> debugfs_init callback?
>>>>> Although this is true, I'm not sure if this is the reason why the files
>>>>> are
>>>>> being registered twice, as this doesn't happen to vc4, and it also uses
>>>>> the
>>>>> debugfs_init callback. I believe it is somewhat related to the fact that
>>>>> v3d is the primary node and the render node.
>>>> I see. Thanks for the hint.
>>>>
>>>>> Best Regards,
>>>>> - Maíra Canal
>>>>>
>>>>>> One alternative would be to just completely nuke support for
>>>>>> separate render node debugfs files and only add a symlink to the
>>>>>> primary node. Opinions?
>>>> What do you think of this approach? I can't come up with any reason why we
>>>> should have separate debugfs files for render nodes and I think it is pretty
>>>> much the same reason you came up with the patch for per device debugfs files
>>>> instead of per minor.
>>> They are two entirely separate devices and drivers, it doesn't make much
>>> sense to move their debugfs files to one or the other.
>> Well exactly that isn't true.
> Ok.
>
>> The primary and render node are just two file under /dev for the same
>> hardware device and driver.
>>
>> We just offer different functionality through the two interfaces, but
>> essentially there isn't any information we could expose for one which
>> isn't true for the other as well.
> I'd like to know what criteria you're using to say that they are the
> same hardware device then, because they don't share the same MMIO
> mappings, interrupts, clocks, IOMMUs, power domains, etc. They can also
> operate independently.

Well you don't seem to understand what I'm talking about.

This is about the primary and render node under /dev/dri/, not some 
separate hw device.

So you really have only one hardware device. E.g. clocks, IOMMU, power 
etc... is all the same. It's just one physical device which only one 
drm_device structure.

Regards,
Christian.

>
> So unless that criteria is that they share the RAM, they cannot be
> considered the same hardware device.
>
> Maxime

