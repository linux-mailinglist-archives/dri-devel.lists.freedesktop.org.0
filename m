Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0275E6F5AE9
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1BE88C3D;
	Wed,  3 May 2023 15:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419488C3D;
 Wed,  3 May 2023 15:23:35 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50b383222f7so7428026a12.3; 
 Wed, 03 May 2023 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683127414; x=1685719414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dhDKDeVvIIcyVSoI0Q7SQy/SoT7BeRHrFaibMKbsE1c=;
 b=fS+Og3Lh+XmnS0ELaglWBWPwSrdpWsl65t/lHTdwL8loYIlJ8h9ECR02lpKbbe4IDH
 +gVg0ecWqiYsYqn6I7QWpPT4O4eydRjQ6D8wFrqxEvpDz5lYc7Jd3qXx9Y7BY8byFZRK
 5Dwk5T0D65XjCE0phB2xSpKIbgQzflGtVgp3kTCkAqfORaI8Jh8pxO5YjywkhvV9YiYM
 oixhlkYIh1y2lUXvTIfyhnMh1j48YBnhX3xEtZaAp2zJ6/8amCN66iMLqd2OMtdAjLWe
 ZIvelngraBDlo5E89HJ1wFysn0h4a1dIK/o0a0FNW3g+ZTFBg+ONALdGqxL8RdmN0x6Y
 AXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683127414; x=1685719414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dhDKDeVvIIcyVSoI0Q7SQy/SoT7BeRHrFaibMKbsE1c=;
 b=dCHYgTz+Y8X1lmV6+XKa+qsg8tIZkMv6qL+jffZELpiNfr1b2HMjjwqP5+clPONTZc
 jgFpsoQVjvEUfhl1pTYIZm3Rrs8EI4src2M5Lksfznhvo1FwqhrJuCVKMDNt/gRxwcyj
 NwibIKODSwHT3kZups8mGR2FewYV3GWF+CaNcJZwTnrFo+TQd3dhTVWVpWVRxsGFhZf4
 aGFSqvrT6DK27ux/rpnWTzmv2f8bdGruyE/rAJPYJ/GzkmtnZrfQ+XRgCXPjYcq1JreT
 oV+2upb2wn2Gl76hU+gsgM0Lztn/of8kdKrGZn6ANtMI3+7UQmbFUbJ4mNyiXqruOH2O
 gW8g==
X-Gm-Message-State: AC+VfDwDbRZS9MoAHOTKwfOnPC+ZTh7yngvRbFfvfSGbh70P5et3X6t1
 UVWeJDNXmrNXbnmet1tgC54=
X-Google-Smtp-Source: ACHHUZ4lsR0rROauodPbBoICpecvV2OQJKKw+Cdqc5V4Bze9yu/24nhppjPlAziDdob7f+cOGIpwhw==
X-Received: by 2002:a17:906:da8c:b0:956:fdb6:bc77 with SMTP id
 xh12-20020a170906da8c00b00956fdb6bc77mr3410999ejb.30.1683127413483; 
 Wed, 03 May 2023 08:23:33 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:130a:3ed0:3dbc:854b?
 ([2a02:908:1256:79a0:130a:3ed0:3dbc:854b])
 by smtp.gmail.com with ESMTPSA id
 hx4-20020a170906846400b009659ad1072fsm7651ejc.113.2023.05.03.08.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 08:23:33 -0700 (PDT)
Message-ID: <76bd16ac-9251-c71f-8da3-4c4c14d3bdcf@gmail.com>
Date: Wed, 3 May 2023 17:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?Q?Timur_Krist=c3=b3f?=
 <timur.kristof@gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
 <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.05.23 um 17:08 schrieb Felix Kuehling:
> Am 2023-05-03 um 03:59 schrieb Christian König:
>> Am 02.05.23 um 20:41 schrieb Alex Deucher:
>>> On Tue, May 2, 2023 at 11:22 AM Timur Kristóf 
>>> <timur.kristof@gmail.com> wrote:
>>>> [SNIP]
>>>>>>>> In my opinion, the correct solution to those problems would be
>>>>>>>> if
>>>>>>>> the kernel could give userspace the necessary information about
>>>>>>>> a
>>>>>>>> GPU hang before a GPU reset.
>>>>>>>>
>>>>>>>   The fundamental problem here is that the kernel doesn't have
>>>>>>> that
>>>>>>> information either. We know which IB timed out and can
>>>>>>> potentially do
>>>>>>> a devcoredump when that happens, but that's it.
>>>>>>
>>>>>> Is it really not possible to know such a fundamental thing as what
>>>>>> the
>>>>>> GPU was doing when it hung? How are we supposed to do any kind of
>>>>>> debugging without knowing that?
>>
>> Yes, that's indeed something at least I try to figure out for years 
>> as well.
>>
>> Basically there are two major problems:
>> 1. When the ASIC is hung you can't talk to the firmware engines any 
>> more and most state is not exposed directly, but just through some 
>> fw/hw interface.
>>     Just take a look at how umr reads the shader state from the SQ. 
>> When that block is hung you can't do that any more and basically have 
>> no chance at all to figure out why it's hung.
>>
>>     Same for other engines, I remember once spending a week figuring 
>> out why the UVD block is hung during suspend. Turned out to be a 
>> debugging nightmare because any time you touch any register of that 
>> block the whole system would hang.
>>
>> 2. There are tons of things going on in a pipeline fashion or even 
>> completely in parallel. For example the CP is just the beginning of a 
>> rather long pipeline which at the end produces a bunch of pixels.
>>     In almost all cases I've seen you ran into a problem somewhere 
>> deep in the pipeline and only very rarely at the beginning.
>>
>>>>>>
>>>>>> I wonder what AMD's Windows driver team is doing with this problem,
>>>>>> surely they must have better tools to deal with GPU hangs?
>>>>> For better or worse, most teams internally rely on scan dumps via
>>>>> JTAG
>>>>> which sort of limits the usefulness outside of AMD, but also gives
>>>>> you
>>>>> the exact state of the hardware when it's hung so the hardware teams
>>>>> prefer it.
>>>>>
>>>> How does this approach scale? It's not something we can ask users to
>>>> do, and even if all of us in the radv team had a JTAG device, we
>>>> wouldn't be able to play every game that users experience random hangs
>>>> with.
>>> It doesn't scale or lend itself particularly well to external
>>> development, but that's the current state of affairs.
>>
>> The usual approach seems to be to reproduce a problem in a lab and 
>> have a JTAG attached to give the hw guys a scan dump and they can 
>> then tell you why something didn't worked as expected.
>
> That's the worst-case scenario where you're debugging HW or FW issues. 
> Those should be pretty rare post-bringup. But are there hangs caused 
> by user mode driver or application bugs that are easier to debug and 
> probably don't even require a GPU reset? For example most VM faults 
> can be handled without hanging the GPU. Similarly, a shader in an 
> endless loop should not require a full GPU reset. In the KFD compute 
> case, that's still preemptible and the offending process can be killed 
> with Ctrl-C or debugged with rocm-gdb.

We also have infinite loop in shader abort for gfx and page faults are 
pretty rare with OpenGL (a bit more often with Vulkan) and can be 
handled gracefully on modern hw (they just spam the logs).

The majority of the problems is unfortunately that we really get hard 
hangs because of some hw issues. That can be caused by unlucky timing, 
power management or doing things in an order the hw doesn't expected.

Regards,
Christian.

>
> It's more complicated for graphics because of the more complex 
> pipeline and the lack of CWSR. But it should still be possible to do 
> some debugging without JTAG if the problem is in SW and not HW or FW. 
> It's probably worth improving that debugability without getting 
> hung-up on the worst case.
>
> Maybe user mode graphics queues will offer a better way of recovering 
> from these kinds of bugs, if the graphics pipeline can be unstuck 
> without a GPU reset, just by killing the offending user mode queue.
>
> Regards,
>   Felix
>
>
>>
>> And yes that absolutely doesn't scale.
>>
>> Christian.
>>
>>>
>>> Alex
>>

