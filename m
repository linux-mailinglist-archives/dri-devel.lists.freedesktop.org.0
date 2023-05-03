Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB356F526C
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB6010E1DB;
	Wed,  3 May 2023 07:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F0210E1D8;
 Wed,  3 May 2023 07:59:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so5564362a12.1; 
 Wed, 03 May 2023 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683100757; x=1685692757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n2lIatLtxS/6Cq5Ij16t1kjY3cuWYBdjoqqifNQbzJ0=;
 b=DOS/xq+cYgi2rm7lNlZXy9XxJnguOr4ukDE7HlwSSGNfuchYEibFzGrCDB4JCmZDpP
 +Vp88JXbD9SBlbhs+0GhYf52FYivkDHS2VGGJyjmQr2yRAlrJOm8uVQAvGJnDxjrkxfV
 StCf39JolnezT8H3ADMXoPkBKlp7wB9bo5CkvVg3QZfKF4JGJA5j+hVU4296EqrccSzH
 NgzK+/qVIN43BzAVnOg/cOe94u/MnVVWBDmdra5++VtKRiBDY2VMMCetOpNJQ+WDDUgh
 pSufUDhgScQVCXzfAWIbWWE+DI9bwyEScM4kHig6AsUNHxQsLnGzwFFprTPaVG21aMu1
 Pccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683100757; x=1685692757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n2lIatLtxS/6Cq5Ij16t1kjY3cuWYBdjoqqifNQbzJ0=;
 b=B8xjhdiM5TfjS4A2JDbjfHogR4ZBA+avqrGlUUX6dJjnSWOHrSAkkl08Syj7SdU1vz
 vOhx5z+DkHHZGNwxW1za0PU5CfTH6xX1A5m186Er+7CUbOnQTjJW8r2abCa9bMbPSsnB
 KxZwoTnZu6lc9/z1Mb8DLWrsDSnVJQcdjjpFrGIZd4meUJ20WykRAP8V9mH/YoEH7ILc
 RuGSDhOoACjg/MvAtYgGxHRb0AEhoUMee3sKZPxUylYmQm4r9ycgEG9mE94u+zX8qptm
 xq7OfvVGNYf2+TdA1htLCRgAyym4r52pFSFF4ZETIFN/IKnMGEqbZQ2eRhgPgVPHHLk2
 1aOA==
X-Gm-Message-State: AC+VfDw7FMRnXsyIiBbPiwFXVmys+9Bven6UhJqUJqoaal1euiLRdW8z
 7P5vnc2VY1WEAB+LNUsSKz0=
X-Google-Smtp-Source: ACHHUZ7QonMKpXLDNMvlR5g3wCXfj/KqGphX90kcj6y7J15I6kLWmqF8/fe8tRNYkuvkR5VIxL/NWQ==
X-Received: by 2002:a17:907:2da9:b0:94e:bd38:49bb with SMTP id
 gt41-20020a1709072da900b0094ebd3849bbmr2734381ejc.23.1683100757340; 
 Wed, 03 May 2023 00:59:17 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:56ef:355f:bcc8:d6a8?
 ([2a02:908:1256:79a0:56ef:355f:bcc8:d6a8])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a1709060c0100b0094f66176208sm17145771ejf.95.2023.05.03.00.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 00:59:16 -0700 (PDT)
Message-ID: <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
Date: Wed, 3 May 2023 09:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
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
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.05.23 um 20:41 schrieb Alex Deucher:
> On Tue, May 2, 2023 at 11:22 AM Timur Kristóf <timur.kristof@gmail.com> wrote:
>> [SNIP]
>>>>>> In my opinion, the correct solution to those problems would be
>>>>>> if
>>>>>> the kernel could give userspace the necessary information about
>>>>>> a
>>>>>> GPU hang before a GPU reset.
>>>>>>
>>>>>   The fundamental problem here is that the kernel doesn't have
>>>>> that
>>>>> information either. We know which IB timed out and can
>>>>> potentially do
>>>>> a devcoredump when that happens, but that's it.
>>>>
>>>> Is it really not possible to know such a fundamental thing as what
>>>> the
>>>> GPU was doing when it hung? How are we supposed to do any kind of
>>>> debugging without knowing that?

Yes, that's indeed something at least I try to figure out for years as well.

Basically there are two major problems:
1. When the ASIC is hung you can't talk to the firmware engines any more 
and most state is not exposed directly, but just through some fw/hw 
interface.
     Just take a look at how umr reads the shader state from the SQ. 
When that block is hung you can't do that any more and basically have no 
chance at all to figure out why it's hung.

     Same for other engines, I remember once spending a week figuring 
out why the UVD block is hung during suspend. Turned out to be a 
debugging nightmare because any time you touch any register of that 
block the whole system would hang.

2. There are tons of things going on in a pipeline fashion or even 
completely in parallel. For example the CP is just the beginning of a 
rather long pipeline which at the end produces a bunch of pixels.
     In almost all cases I've seen you ran into a problem somewhere deep 
in the pipeline and only very rarely at the beginning.

>>>>
>>>> I wonder what AMD's Windows driver team is doing with this problem,
>>>> surely they must have better tools to deal with GPU hangs?
>>> For better or worse, most teams internally rely on scan dumps via
>>> JTAG
>>> which sort of limits the usefulness outside of AMD, but also gives
>>> you
>>> the exact state of the hardware when it's hung so the hardware teams
>>> prefer it.
>>>
>> How does this approach scale? It's not something we can ask users to
>> do, and even if all of us in the radv team had a JTAG device, we
>> wouldn't be able to play every game that users experience random hangs
>> with.
> It doesn't scale or lend itself particularly well to external
> development, but that's the current state of affairs.

The usual approach seems to be to reproduce a problem in a lab and have 
a JTAG attached to give the hw guys a scan dump and they can then tell 
you why something didn't worked as expected.

And yes that absolutely doesn't scale.

Christian.

>
> Alex

