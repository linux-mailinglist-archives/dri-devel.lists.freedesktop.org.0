Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 935F8699A0D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2CE10E06B;
	Thu, 16 Feb 2023 16:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0CF10E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 16:31:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o15so2403375wrc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 08:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jEMZzjzf85lsmHq6eqsYN15umSUmqqkDjPR9zLByQ54=;
 b=ZxGqavK3dLM2MaP75GFelZsP+wmXD0Qel6u/oPqXV8kWAK6sQJYnZd7Aqb4F8XGL1/
 zyJDewmSBjvu0NlO26CasB/184BcL8tKYJ3cNdPdPi4FWvTL/o59dwKYAN52V+IvFIot
 OZgQ3KzWYCmhx7C5J7F3vD4l7zHvPO54JhNAUDnfaeXGEGDCuT2fsH02oowWsOulvQ1x
 LAIJlKtFSYQ8tW0zoxZVGBcDqm/SkNa1kBAMMZibbMPbkLvwek9gLcrp4qo0fpKiD5e7
 BDgBqQmJBs8PDhpShk63nBVmX68q3o30ID6KXFae9ecMwa0QBcYZv4IAweuuSQcXDGTJ
 4GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jEMZzjzf85lsmHq6eqsYN15umSUmqqkDjPR9zLByQ54=;
 b=za6V5q/K+mHxWy2pS5JjH1KMBLLn0Z0j4FdEGSZRGgtpvcgBHww2kGB3dlv+TJ0d9I
 1HHEVb5+r4DN6Yr2E78KdpYvbJFlJ57ILVvrRyrON51CIu91gGrPxDangfAap6irvLfK
 n+c4zXd+58u9umRxPlz/E58RG9aQx2Co6Ow/ZfNRr/F6m43KtcLcLb8x9TylWS7pkC+p
 HZ89NsuA1wScMa/LI3i3fI1CzdibDnJrGzJXtgY71zzhsdxQHv0fcQhHJS/L6aeiKFd2
 O0Z23i1Fiu1JULGdJg+h7J3lWNLxuKfdXxG2+SeadIsLwJZQx1nMvVDn7RvjbSOeJBnU
 46Pw==
X-Gm-Message-State: AO0yUKXcFHVxur5x+ykxQC8dEDO5Oey2yiDbYvwbAjmH51WEuERqdH2S
 T56lM5JFNyA/qMUckwrE+1rLe2cSVJF/HA==
X-Google-Smtp-Source: AK7set9/Ltis2IktfAIUaLXndU2aE8DhrEcrrd8FHeCBABjcMxWHanCZR+MZ0H2SdVEAyELFSidfHw==
X-Received: by 2002:a5d:4f81:0:b0:2bf:e443:ea70 with SMTP id
 d1-20020a5d4f81000000b002bfe443ea70mr4648592wru.1.1676565112830; 
 Thu, 16 Feb 2023 08:31:52 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:431e:b458:66b1:218?
 ([2a02:908:1256:79a0:431e:b458:66b1:218])
 by smtp.gmail.com with ESMTPSA id
 k13-20020adfe3cd000000b002c54a2037d1sm1949890wrm.75.2023.02.16.08.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:31:52 -0800 (PST)
Message-ID: <d53e294b-2447-8692-f4e3-dbc46439b3cf@gmail.com>
Date: Thu, 16 Feb 2023 17:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
 <Y+4Uz4KM3S9QCDqA@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y+4Uz4KM3S9QCDqA@phenom.ffwll.local>
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
 maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.02.23 um 12:34 schrieb Daniel Vetter:
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
> Yeah I think best is to symlink around a bit for compat. I thought we
> where doing that already, and you can't actually create debugfs files on
> render nodes? Or did I only dream about this?

No, we still have that distinction around unfortunately.

That's why this went boom for me in the first place.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Otherwise, the patchset looks good to me, but maybe Daniel has
>>>>> some other
>>>>> thoughts about it.
>>>>>
>>>>> Best Regards,
>>>>> - Maíra Canal
>>>>>
>>>>>> Please comment/discuss.
>>>>>>
>>>>>> Cheers,
>>>>>> Christian.
>>>>>>
>>>>>>

