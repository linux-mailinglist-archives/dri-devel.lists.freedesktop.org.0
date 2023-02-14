Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF903695F2B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8608710E0C1;
	Tue, 14 Feb 2023 09:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8610E0C1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:28:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id r18so10501735wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 01:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hQm3tDa2Mx8uOfDHC97cnghMrM0UwRqwZ82JnGY2dxs=;
 b=EPNFtMA+eYDuAw2kIHTfcVvNOwooh89vjPlWVQ/XnqoWH+GSLp9WwjfPf+9J2ili/G
 2AOv8945jGmK0LSnkshSo9S4slG0sOGNy1qjjrxvv3BDbqIiGXcBw78hxnq7w95Ca99h
 79K4ngrGh0wIBVU+Zfzms8AJ/laUIPcV0V9ALvpaX1XtGZyeATY3/EnUKVX0oe62HCwU
 yOI/Rq0Wbep6VYxKrVk/ddREpUUARtQtvYEMNswRBIYShv33M3+pIJak2ZvabbrYiPz2
 EJ5U91qfyGsN7FfWSqI82FsaGu0LQzlj92kuOsk2Gws3Pj3T3nyhfBb5ORg13axejzeK
 rd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hQm3tDa2Mx8uOfDHC97cnghMrM0UwRqwZ82JnGY2dxs=;
 b=NZgr6O3bBchKwbEH1r+hoheMM4DXcR4en07zuBaRsQ0JGLOzrxyRMgzF7Z1PIAvmMZ
 RymjqACelObliksz1koS5+NIsGDfILyVeC/muohhkWyc/fRx839aociUSDH/xITDSH/d
 3LHkmuIvD5TKs1UUQLj8Yh9tOhTrrtimORqBzJkaCdO1YPJcJOBs0nPbFR+wpmgwgYMn
 weh2h3KTaF45kTklhKZ8+POhfjn2LMgxGoNs/cUGLY15BKbj9oZ8pqueLwKvGO4Anisi
 7rzFNMggXmUHXhc2j3D1UHydpzvq0l+brd3A/Kfh66qhPgUgo0Jl4E+JR/1p2633U2xh
 68rg==
X-Gm-Message-State: AO0yUKVOAfH6U1tTUlui9mh2r6b3JmMmpmkHeYlEvyZM6Ezv9THfURiY
 3R6u3+A6vGGXc+D34bL+gCvwNvxGR7k=
X-Google-Smtp-Source: AK7set9z77rd4UioeWnIHL6SxyweejWq+xLSDY1W1N66vDBA6uHncXY7kdnWY47Kf0A5rBOIo3xvEg==
X-Received: by 2002:a05:600c:4b19:b0:3df:e549:da54 with SMTP id
 i25-20020a05600c4b1900b003dfe549da54mr1430020wmp.17.1676366907109; 
 Tue, 14 Feb 2023 01:28:27 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm21074918wms.20.2023.02.14.01.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 01:28:26 -0800 (PST)
Message-ID: <c953dfe6-cdfc-92af-fabe-309e1af9f5d8@gmail.com>
Date: Tue, 14 Feb 2023 10:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230214085957.GA2824715@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230214085957.GA2824715@linux.intel.com>
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
Cc: jacek.lawrynowicz@linux.intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 daniel.vetter@ffwll.ch, Oded Gabbay <ogabbay@kernel.org>, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.02.23 um 09:59 schrieb Stanislaw Gruszka:
> On Thu, Feb 09, 2023 at 09:18:35AM +0100, Christian König wrote:
>> Hello everyone,
>>
>> the drm_debugfs has a couple of well known design problems.
>>
>> Especially it wasn't possible to add files between initializing and registering
>> of DRM devices since the underlying debugfs directory wasn't created yet.
>>
>> The resulting necessity of the driver->debugfs_init() callback function is a
>> mid-layering which is really frowned on since it creates a horrible
>> driver->DRM->driver design layering.
>>
>> The recent patch "drm/debugfs: create device-centered debugfs functions" tried
>> to address those problem, but doesn't seem to work correctly. This looks like
>> a misunderstanding of the call flow around drm_debugfs_init(), which is called
>> multiple times, once for the primary and once for the render node.
>>
>> So what happens now is the following:
>>
>> 1. drm_dev_init() initially allocates the drm_minor objects.
>> 2. ... back to the driver ...
>> 3. drm_dev_register() is called.
>>
>> 4. drm_debugfs_init() is called for the primary node.
>> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>>     for the primary node.
>> 6. The driver->debugfs_init() callback is called to add debugfs files for the
>>     primary node.
>> 7. The added files are consumed and added to the primary node debugfs directory.
>>
>> 8. drm_debugfs_init() is called for the render node.
>> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>>     again for the render node.
>> 10. The driver->debugfs_init() callback is called to add debugfs files for the
>>      render node.
>> 11. The added files are consumed and added to the render node debugfs directory.
>>
>> 12. Some more files are added through drm_debugfs_add_file().
>> 13. drm_debugfs_late_register() add the files once more to the primary node
>>      debugfs directory.
>> 14. From this point on files added through drm_debugfs_add_file() are simply ignored.
>> 15. ... back to the driver ...
>>
>> Because of this the dev->debugfs_mutex lock is also completely pointless since
>> any concurrent use of the interface would just randomly either add the files to
>> the primary or render node or just not at all.
>>
>> Even worse is that this implementation nails the coffin for removing the
>> driver->debugfs_init() mid-layering because otherwise drivers can't control
>> where their debugfs (primary/render node) are actually added.
>>
>> This patch set here now tries to clean this up a bit, but most likely isn't
>> fully complete either since I didn't audit every driver/call path.
>>
>> Please comment/discuss.
> What is end goal here regarding debugfs in DRM ? My undersigning is that
> the direction is get rid of debugfs_init callback as described in:
> https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511
> and also make it driver/device-centric instead of minor-centric as
> described here:
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a	

Well my main goal is to get rid of the debugfs_init() mid-layering in 
the mid term, everything else is just nice to have.

> I'm asking from accel point of view. We can make things there as they
> should look like at the end for DRM, since currently no drivers have
> established their interfaces and they can be changed.
>
> Is drivers/device-centric mean we should use drm_dev->unique for debugfs
> dir entry name instead of minor ?

Oh, good idea! That would also finally make it a bit less problematic to 
figure out which PCI or platform device corresponds to which debugfs 
directory.

Only potential problem I see is that we would need to rename the 
directory should a driver every decide to set drm_dev->unique to 
something else than the default. But a quick check shows no users of 
drm_dev_set_unique(), so we could potentially just unexport the function

> Or perhaps we should have 2 separate dir entries: one (old dri/minor/)
> for device drm debugfs files and other one for driver specific files ?

How about we just create symlinks between the old and the new directory 
for now which we remove after everything has settled again?

> Also what regarding sysfs ? Should we do something with accel_sysfs_device_minor ?

I see sysfs as a different and probably even more complicated topic.

Regards,
Christian.

>
> Regards
> Stanislaw

