Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D2690D9E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CAB10EB41;
	Thu,  9 Feb 2023 15:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3926F10EB3C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:52:59 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v13so2441016eda.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PlDRqIzNfRpmS0D/1XZG8irCj5DR1jdxtMH8/taj2Wg=;
 b=h1Q9xXb/QHlNb+RCceeZTaQaz8xXORmkPssZHBAtE+jVFIigMaYwSBvHPuryIdxzjj
 PgNtHFCeapJJN2HndutHgoTw/Q9dYlFaT7VoZi1+DxBAZqXtlK/bQ6V98aDYthK2s1bU
 A3HZPyH+oJuhcalqPLpDTPTDdJtiusVCGl/dpZEuKijJjekbcqjXo24ekZ+GaW9v9fB+
 LcwNgOzCtdMnAFkWhNIawFfdAN/Q8/WFM9MHXQLPTWNvBtfNcxPVNcMNcLytSqdfhm+E
 dGaHFNHgRyKxc0lurROivycJ+MKprJlqiSumVkOJFNAcKdNeGpi9UmBw/9syoBcpGZRS
 AVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PlDRqIzNfRpmS0D/1XZG8irCj5DR1jdxtMH8/taj2Wg=;
 b=RrrO0RJtVLmFeduQjXyAmDefA/liED/P3TwOGtjUaniVvAMgIh+AHE4uuHfs8dTCnt
 ie4opXcc4yOyMRQS7izLnfIe1eUqd1koOIogbs9IoFWOnhCYiKZj4RGzXlqIZ6BIJwEu
 FHVxVfe8YpeyK2cdmI//8hqIeUjIkPGdZS9J2cODOdzDlRUWN1eCaDoJY6rMYMbvg2pr
 SwC1u9WHCoRHJNOl5BGSpJy/+Xdo/DYhbOnMVqTSIYhU2KGpu3PeUVhjo9Mqa6mHlcau
 qKkUj7/13a8hLaZsKxsvY7JhQd4vQvzyhqwIZGkLwMiszCLeRVAs/md0mY4rpUSd2Y9t
 4B/Q==
X-Gm-Message-State: AO0yUKXcGFj5CQS4FqYtC2bJYzSiemVuiPSneCRRKwuFtr+lLwg9LIbM
 xs54My5Apq1CaMkq7TD41D7JW1szfRzQQw==
X-Google-Smtp-Source: AK7set8//MB8g6bE18vhBY6yspRljnY5sXdckp/JbGz1I/BRLtuP5Cg7pknMZnz1r9F1zMGtYHhlaQ==
X-Received: by 2002:a50:9b0d:0:b0:4ab:ec2:3cd1 with SMTP id
 o13-20020a509b0d000000b004ab0ec23cd1mr5829797edi.25.1675957977597; 
 Thu, 09 Feb 2023 07:52:57 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d1a:f894:9f34:a0dd?
 ([2a02:908:1256:79a0:d1a:f894:9f34:a0dd])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a50d641000000b004ab1d683d3dsm902056edj.32.2023.02.09.07.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:52:56 -0800 (PST)
Message-ID: <95e7f52a-46ce-5e16-b686-5e4011693287@gmail.com>
Date: Thu, 9 Feb 2023 16:52:54 +0100
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230209141923.4n4ffsqchdrx5vnp@houat>
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

Am 09.02.23 um 15:19 schrieb Maxime Ripard:
> On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian König wrote:
>> Am 09.02.23 um 14:06 schrieb Maíra Canal:
>>> On 2/9/23 09:13, Christian König wrote:
>>>> Am 09.02.23 um 12:23 schrieb Maíra Canal:
>>>>> On 2/9/23 05:18, Christian König wrote:
>>>>>> Hello everyone,
>>>>>>
>>>>>> the drm_debugfs has a couple of well known design problems.
>>>>>>
>>>>>> Especially it wasn't possible to add files between
>>>>>> initializing and registering
>>>>>> of DRM devices since the underlying debugfs directory wasn't
>>>>>> created yet.
>>>>>>
>>>>>> The resulting necessity of the driver->debugfs_init()
>>>>>> callback function is a
>>>>>> mid-layering which is really frowned on since it creates a horrible
>>>>>> driver->DRM->driver design layering.
>>>>>>
>>>>>> The recent patch "drm/debugfs: create device-centered
>>>>>> debugfs functions" tried
>>>>>> to address those problem, but doesn't seem to work
>>>>>> correctly. This looks like
>>>>>> a misunderstanding of the call flow around
>>>>>> drm_debugfs_init(), which is called
>>>>>> multiple times, once for the primary and once for the render node.
>>>>>>
>>>>>> So what happens now is the following:
>>>>>>
>>>>>> 1. drm_dev_init() initially allocates the drm_minor objects.
>>>>>> 2. ... back to the driver ...
>>>>>> 3. drm_dev_register() is called.
>>>>>>
>>>>>> 4. drm_debugfs_init() is called for the primary node.
>>>>>> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>>>>>      drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
>>>>>> to add the files
>>>>>>      for the primary node.
>>>>>> 6. The driver->debugfs_init() callback is called to add
>>>>>> debugfs files for the
>>>>>>      primary node.
>>>>>> 7. The added files are consumed and added to the primary
>>>>>> node debugfs directory.
>>>>>>
>>>>>> 8. drm_debugfs_init() is called for the render node.
>>>>>> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>>>>>      drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
>>>>>> to add the files
>>>>>>      again for the render node.
>>>>>> 10. The driver->debugfs_init() callback is called to add
>>>>>> debugfs files for the
>>>>>>       render node.
>>>>>> 11. The added files are consumed and added to the render
>>>>>> node debugfs directory.
>>>>>>
>>>>>> 12. Some more files are added through drm_debugfs_add_file().
>>>>>> 13. drm_debugfs_late_register() add the files once more to
>>>>>> the primary node
>>>>>>       debugfs directory.
>>>>>> 14. From this point on files added through
>>>>>> drm_debugfs_add_file() are simply ignored.
>>>>>> 15. ... back to the driver ...
>>>>>>
>>>>>> Because of this the dev->debugfs_mutex lock is also
>>>>>> completely pointless since
>>>>>> any concurrent use of the interface would just randomly
>>>>>> either add the files to
>>>>>> the primary or render node or just not at all.
>>>>>>
>>>>>> Even worse is that this implementation nails the coffin for
>>>>>> removing the
>>>>>> driver->debugfs_init() mid-layering because otherwise
>>>>>> drivers can't control
>>>>>> where their debugfs (primary/render node) are actually added.
>>>>>>
>>>>>> This patch set here now tries to clean this up a bit, but
>>>>>> most likely isn't
>>>>>> fully complete either since I didn't audit every driver/call path.
>>>>> I tested the patchset on the v3d, vc4 and vkms and all the files
>>>>> are generated
>>>>> as expected, but I'm getting the following errors on dmesg:
>>>>>
>>>>> [    3.872026] debugfs: File 'v3d_ident' in directory '0'
>>>>> already present!
>>>>> [    3.872064] debugfs: File 'v3d_ident' in directory '128'
>>>>> already present!
>>>>> [    3.872078] debugfs: File 'v3d_regs' in directory '0' already
>>>>> present!
>>>>> [    3.872087] debugfs: File 'v3d_regs' in directory '128'
>>>>> already present!
>>>>> [    3.872097] debugfs: File 'measure_clock' in directory '0'
>>>>> already present!
>>>>> [    3.872105] debugfs: File 'measure_clock' in directory '128'
>>>>> already present!
>>>>> [    3.872116] debugfs: File 'bo_stats' in directory '0' already
>>>>> present!
>>>>> [    3.872124] debugfs: File 'bo_stats' in directory '128'
>>>>> already present!
>>>>>
>>>>> It looks like the render node is being added twice, since this
>>>>> doesn't happen
>>>>> for vc4 and vkms.
>>>> Thanks for the feedback and yes that's exactly what I meant with
>>>> that I haven't looked into all code paths.
>>>>
>>>> Could it be that v3d registers it's debugfs files from the
>>>> debugfs_init callback?
>>> Although this is true, I'm not sure if this is the reason why the files
>>> are
>>> being registered twice, as this doesn't happen to vc4, and it also uses
>>> the
>>> debugfs_init callback. I believe it is somewhat related to the fact that
>>> v3d is the primary node and the render node.
>> I see. Thanks for the hint.
>>
>>> Best Regards,
>>> - Maíra Canal
>>>
>>>> One alternative would be to just completely nuke support for
>>>> separate render node debugfs files and only add a symlink to the
>>>> primary node. Opinions?
>> What do you think of this approach? I can't come up with any reason why we
>> should have separate debugfs files for render nodes and I think it is pretty
>> much the same reason you came up with the patch for per device debugfs files
>> instead of per minor.
> They are two entirely separate devices and drivers, it doesn't make much
> sense to move their debugfs files to one or the other.

Well exactly that isn't true. The primary and render node are just two 
file under /dev for the same hardware device and driver.

We just offer different functionality through the two interfaces, but 
essentially there isn't any information we could expose for one which 
isn't true for the other as well.

Christian.

>
> Maxime

