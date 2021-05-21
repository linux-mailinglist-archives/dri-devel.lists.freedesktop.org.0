Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136538C0B6
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 09:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125536F5C6;
	Fri, 21 May 2021 07:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFD46F5C6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 07:27:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u21so28963998ejo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UQaPOa5D+8Li4cnoSM0j4EXnaw0wdTp0q6CdG4+4etc=;
 b=UR9C/wIhq+LqMiWRrE0z1jsZVVFRHjaaeU/k3xy0cSM4JL1Vd7DebVSAHZBGoZuBZM
 8DuO0cZcK9sVbSVeanpHNbEQaz3zpd2kH+Oh5Ss1vl5LUquOSW7JAx/5uaOI2p6ufpHb
 5Dpaf70FJG0drmqJXGcpscNxNXTT1cdLUh6OihCq9pNvBFpeVUeJmlVsZ+Y0H8GJKgie
 Rz564XpNgYwAn++mCfnnq984PmFq7b1GheZlah1rhVRkdZ7/y4HmRdkvQNVOjQc7Tl6X
 jQ85guVjbferpCXPycYMAfl3uIR2SKO5mwGAjk8OeHn1O0zq8LzuaT93x4q+ONkx0h3x
 TNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UQaPOa5D+8Li4cnoSM0j4EXnaw0wdTp0q6CdG4+4etc=;
 b=JjT6Pm6MViT3CtTaSMEwMECWF3HrIiq1lSh/G9XVXdWn3604DtofzKph/4jmsLuTuO
 Vup0EAUxL1MTRcS3rdQBRq+up3Pv1XvDXvCSNHHNiiWW8+a1Q2VUWouzAfngEugNdNvC
 UP8ClFWIuE3C4zU6USQijDnGTLLOahMSahdg4ww+9zZhUnM6Mgie4Tp3vUYZWM0gh/2r
 Xye3C52CVjXpvi9BNLL9MvB0OOTTYNtOLPOzU32sc0bY+JXbSrXGyfZ7L0d6AeSZx7g5
 5/05BDALBCfiz41Kgt9MQAJ0q0HXWaKKBexhSVsvBniwf8v0ECmK9MPqOLObMZfyvYTF
 QWYg==
X-Gm-Message-State: AOAM530qJFY2IaXeX4xMZDUngaqQ9hkrxneesH2l1JpLqaqIMViGNdC1
 qLQ2mRlJBsPql1Erk54SPxZWHa9g+94=
X-Google-Smtp-Source: ABdhPJyxMqC60N3TVNQmonoKNi9VaQTT+Z/A/+vr32ydo8BNMMcNLQkfYByvwBPuzvI7DsCP92pnJw==
X-Received: by 2002:a17:906:fccc:: with SMTP id
 qx12mr8955828ejb.21.1621582025951; 
 Fri, 21 May 2021 00:27:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id g4sm3383249edw.8.2021.05.21.00.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 00:27:05 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
 <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
 <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
 <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
 <a8d0acd9-6a0e-58bb-1f2d-e85f00ad9677@gmail.com>
 <CAOFGe96tzhp+=NX8TdPmGpq8L+FrQcOzgPUDdtog4MQ72RJv2w@mail.gmail.com>
 <CAOFGe94Ck3JT2JZ+6-pFrwLx6XEoz8Dq5hReccy4F2_dzRt_oA@mail.gmail.com>
 <CAKMK7uHp8SanT-Eu-HZP-R65nYCPoa=0sCDwyLXBjxxQcOgY3g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1e2db9ec-86e9-b74a-5a53-baca9d38dcaa@gmail.com>
Date: Fri, 21 May 2021 09:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHp8SanT-Eu-HZP-R65nYCPoa=0sCDwyLXBjxxQcOgY3g@mail.gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 21:14 schrieb Daniel Vetter:
> On Thu, May 20, 2021 at 9:04 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Thu, May 20, 2021 at 12:23 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>> On Thu, May 20, 2021 at 5:50 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 20.05.21 um 09:55 schrieb Daniel Vetter:
>>>>> On Wed, May 19, 2021 at 5:48 PM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
>>>>>>> On Wed, May 19, 2021 at 5:52 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
>>>>>>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>>> On Tue, May 18, 2021 at 7:40 PM Christian König
>>>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
>>>>>>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian König
>>>>>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> And as long as we are all inside amdgpu we also don't have any oversync,
>>>>>>>>>>>>> the issue only happens when we share dma-bufs with i915 (radeon and
>>>>>>>>>>>>> AFAIK nouveau does the right thing as well).
>>>>>>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anymore and
>>>>>>>>>>>> have to use the one atomic helpers use. Which is also the one that
>>>>>>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
>>>>>>>>>>>> so as soon as that lands and someone starts using it, something has to
>>>>>>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it's
>>>>>>>>>>>> shared with another device.
>>>>>>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
>> I just re-sent my dma-buf sync_file import/export series.  Assuming we
>> can sort out what implicit sync looks like on the inside of dma-buf,
>> would that alleviate some of your uAPI fears?  The idea would be that
>> radeonsi and RADV would use amdgpu explicit sync primitives for
>> everything and then, at the very end, fetch a sync_file and stuff it
>> in the dma-buf's implicit sync container.  No nasty new uAPI for you.
>> We still get implicit sync.  Everyone wins?
> You still need the implicit fencing opt-out, which currently amdgpu
> lacks completely.

Well we do have a per BO flag for this! We just don't do this on command 
submission, but rather on BO creation.

> But I also thought through the security implications of the patch set
> (including the exclusive injection patch 4), and I think even with
> current amdgpu that's perfectly fine. Not very useful since the fences
> you get out aren't reflecting status accurately, but that's not a
> correctness/security issue. You'll simply hit stalls when you don't
> expect, because the kernel is allowed to throw random other exclusive
> fences in whenever it feels like.

Yes, exactly that was my concern. I think what you noted with the moving 
fence from TTM would solve that.

Regards,
Christian.

>
>> Of course, that still leaves the question of what read and write
>> fences are, what they mean, and where they go in the dma_resv.  But
>> I'm trying to separate problems here.
> Yeah I'll dump my patch set for clarifying status quo tomorrow for that.
> -Daniel
>
>> --Jason
>>
>>
>>>>>>>>>>> This doesn't works for amdgpu at all for the reasons outlined above.
>>>>>>>>>> Uh that's really not how uapi works. "my driver is right, everyone
>>>>>>>>>> else is wrong" is not how cross driver contracts are defined. If that
>>>>>>>>>> means a perf impact until you've fixed your rules, that's on you.
>>>>>>>>>>
>>>>>>>>>> Also you're a few years too late with nacking this, it's already uapi
>>>>>>>>>> in the form of the dma-buf poll() support.
>>>>>>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
>>>>>>>>> there.  It just lets you take a snap-shot of a wait instead of doing
>>>>>>>>> an active wait which might end up with more fences added depending on
>>>>>>>>> interrupts and retries.  The dma-buf poll waits on all fences for
>>>>>>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
>>>>>>>> Note that the dma-buf poll support could be useful to Wayland compositors for the same purpose as Jason's new ioctl (only using client buffers which have finished drawing for an output frame, to avoid missing a refresh cycle due to client drawing), *if* it didn't work differently with amdgpu.
>>>>>>>>
>>>>>>>> Am I understanding correctly that Jason's new ioctl would also work differently with amdgpu as things stand currently? If so, that would be a real bummer and might hinder adoption of the ioctl by Wayland compositors.
>>>>>>> My new ioctl has identical semantics to poll().  It just lets you take
>>>>>>> a snapshot in time to wait on later instead of waiting on whatever
>>>>>>> happens to be set right now.  IMO, having identical semantics to
>>>>>>> poll() isn't something we want to change.
>>>>>> Agreed.
>>>>>>
>>>>>> I'd argue then that making amdgpu poll semantics match those of other drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely that the ioctl will be widely adopted.
>>>>> This seems backwards, because that means useful improvements in all
>>>>> other drivers are stalled until amdgpu is fixed.
>>>> Well there is nothing to fix in amdgpu, what we need to is to come up
>>>> with an DMA-buf implicit syncing model which works for everyone.
>>>>
>>>> I've pointed this problem out at FOSDEM roughly 6 years ago, before
>>>> DMA-buf was even merged upstream and way before amdgpu even existed. And
>>>> the response was yeah, maybe we need to look at this as well.
>>>>
>>>> Over the years I've mentioned now at least 5 times that this isn't going
>>>> to work in some situations and came up with different approaches how to
>>>> fix it.
>>>>
>>>> And you still have the nerves to tell me that this isn't a problem and
>>>> we should fix amdgpu instead? Sorry, but I'm really running out of ideas
>>>> how to explain why this isn't working for everybody.
>>> I'm trying really hard to not fuel a flame war here but I tend to lean
>>> Daniel's direction on this.  Stepping back from the individual needs
>>> of amdgpu and looking at things from the PoV of Linux as a whole, AMD
>>> being a special snowflake here is bad.  I think we have two problems:
>>> amdgpu doesn't play by the established rules, and the rules don't work
>>> well for amdgpu.  We need to solve BOTH problems.  Does that mean we
>>> need to smash something into amdgpu to force it into the dma-buf model
>>> today?  Maybe not; stuff's working well enough, I guess.  But we can't
>>> just rewrite all the rules and break everyone else either.
>>>
>>>> That amdgpu wants to be special is true, but it is a fundamental problem
>>>> that we have designed the implicit sync in DMA-buf only around the needs
>>>> of DRM drivers at that time instead of going a step back and saying hey
>>>> what would be an approach which works for everyone.
>>> How else was it supposed to be designed?  Based on the needs of
>>> non-existent future drivers?  That's just not fair.  We (Intel) are
>>> being burned by various aspects of dma-buf these days too.  It does no
>>> good to blame past developers or our past selves for not knowing the
>>> future.  It sucks but it's what we have.  And, to move forward, we
>>> need to fix it.  Let's do that.
>>>
>>> My concern with the flags approach as I'm beginning to digest it is
>>> that it's a bit too much of an attempt to rewrite history for my
>>> liking.  What do I mean by that?  I mean that any solution we come up
>>> with needs ensure that legacy drivers and modern drivers can play
>>> nicely together.  Either that or we need to modernize all the users of
>>> dma-buf implicit sync.  I really don't like the "as long as AMD+Intel
>>> works, we're good" approach.
>>>
>>>> You just need to apply my example from FOSDEM with ring buffers in a
>>>> single BO to the DMA-buf implicit sync model and immediately see how it
>>>> falls apart.
>>>>
>>>>> I think we need agreement on what the rules are, reasonable plan to
>>>>> get there, and then that should be enough to unblock work in the wider
>>>>> community. Holding the community at large hostage because one driver
>>>>> is different is really not great.
>>>> Well forcing a drivers into a synchronization model not ideal for their
>>>> hardware isn't great either.
>>> As I said above, we're feeling the pain too.
>>>
>>> --Jason
>
>

