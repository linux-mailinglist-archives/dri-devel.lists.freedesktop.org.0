Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E94144FA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB866EB3C;
	Wed, 22 Sep 2021 09:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142D6EB3C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632302480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZygdXyE1+ST5hu/kv1HUFKn43QIZVMQNq10EQr20vbw=;
 b=WH/NYYHXpw/dyZlAIbDFvl4mVpilR3MPBGrcthwROq9DD6Kebs5dNfY8lG3a4k/V3KusDx
 HU0LptkNOajFSY74x1B66AmxcCH/mkTbZbpqDxDZvXAm+q+Ovgz8PJZO4Nxxhusr9FYRgX
 1UZ8pKRXYTWX1hNZLM2QW44YqwezToo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-pqC5W8OMOTSVnZi1h7WQDg-1; Wed, 22 Sep 2021 05:21:19 -0400
X-MC-Unique: pqC5W8OMOTSVnZi1h7WQDg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w24-20020a056402071800b003cfc05329f8so2314986edx.19
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 02:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZygdXyE1+ST5hu/kv1HUFKn43QIZVMQNq10EQr20vbw=;
 b=NEmSb70+nwd8wRqJrbd0fnq5DD68FVlykiEwaMh9lT/v4J2CvRzLO80EUyQ8qHhN1x
 wVX0c9b8vFijYaLOMJrazbYECLC4kFq9L2G5JTSINcpo9arMZO+yP7wOhwmTXpEW5eDV
 CdXn7txO2cNJcNgMFt1xq4rvgJ7JRp2oh1Zw6XNUFcSyeLNRtkKQ1JbcGM1tZE8GN66a
 hhSsw1+b2fLiZIeN90W9mm1B24bIUZsKodNruWCS8BXSmzKj0K1Xi1LmmiN2r+THNb8k
 1myVFmC88NeUedecKfIZR0V3cmSjzOD3dV09JVD/Ex35xBKfldhBkyYXyLVfZlVTE6Je
 p7hQ==
X-Gm-Message-State: AOAM533pgMveMw24gTnduzbtQF+Sy+lGBuAsu83jWBX7OiYUV856x4wN
 0J9d+Ozd4Ele8XnPp7n7u/4okcosJS5vpq9lI8204qT2kUEXu5ViCBn/WN/uv7akVi7flwGIBJL
 rLa1qixiR7i1k7FAzSSox0OCnQMDQ6AAxDLqiM98PsPFuoJRgJZzo4acORZtzvZeR6ytgYm+ZKL
 2wY9on
X-Received: by 2002:a50:d844:: with SMTP id v4mr6896014edj.378.1632302478228; 
 Wed, 22 Sep 2021 02:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz0ISdKmYRyHKMIMULXa1r/9IiZeWgYPLrk1fmaXv6FxEVILrKzEpQvOHzyqWLg/TAqDdWQQ==
X-Received: by 2002:a50:d844:: with SMTP id v4mr6895988edj.378.1632302477991; 
 Wed, 22 Sep 2021 02:21:17 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id f25sm761929ejl.32.2021.09.22.02.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 02:21:17 -0700 (PDT)
Subject: Re: Handling DRM master transitions cooperatively
To: Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell> <YUCncex3woPlAhI6@phenom.ffwll.local>
 <20210922115657.17006ed1@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
Date: Wed, 22 Sep 2021 11:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922115657.17006ed1@eldfell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/22/21 10:56 AM, Pekka Paalanen wrote:
> On Tue, 14 Sep 2021 15:45:21 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
>> On Thu, Sep 09, 2021 at 10:37:03AM +0300, Pekka Paalanen wrote:
>>> On Wed, 8 Sep 2021 18:27:09 +0200
>>> Daniel Vetter <daniel@ffwll.ch> wrote:
>>>   
>>>> On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:  
>>>>>
>>>>> On Tue, 7 Sep 2021 14:42:56 +0200
>>>>> Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>    
>>>>>> Hi,
>>>>>>
>>>>>> On 9/7/21 12:07 PM, Pekka Paalanen wrote:    
>>>>>>> On Fri, 3 Sep 2021 21:08:21 +0200
>>>>>>> Dennis Filder <d.filder@web.de> wrote:
>>>>>>>    
>>>>>>>> Hans de Goede asked me to take a topic from a private discussion here.
>>>>>>>> I must also preface that I'm not a graphics person and my knowledge of
>>>>>>>> DRI/DRM is cursory at best.
>>>>>>>>
>>>>>>>> I initiated the conversation with de Goede after learning that the X
>>>>>>>> server now supports being started with an open DRM file descriptor
>>>>>>>> (this was added for Keith Packard's xlease project).  I wondered if
>>>>>>>> that could be used to smoothen the Plymouth->X transition somehow and
>>>>>>>> asked de Goede if there were any such plans.  He denied, but mentioned
>>>>>>>> that a new ioctl is in the works to prevent the kernel from wiping the
>>>>>>>> contents of a frame buffer after a device is closed, and that this
>>>>>>>> would help to keep transitions smooth.    
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> I believe the kernel is not wiping anything on device close. If
>>>>>>> something in the KMS state is wiped, it originates in userspace:
>>>>>>>
>>>>>>> - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
>>>>>>>   output off, you need to be careful to "leak" your FB if you want a
>>>>>>>   smooth hand-over)    
>>>>>>
>>>>>> The "kernel is not wiping anything on device close" is not true,
>>>>>> when closing /dev/dri/card# any remaining FBs from the app closing
>>>>>> it will be dealt with as if they were RmFB-ed, causing the screen
>>>>>> to show what I call "the fallback fb", at least with the i915 driver.    
>>>>>
>>>>> No, that's not what should happen AFAIK.
>>>>>
>>>>> True, all FBs that are not referenced by active CRTCs or planes will
>>>>> get freed, since their refcount drops to zero, but those CRTCs and
>>>>> planes that are active will remain active and therefore keep their
>>>>> reference to the respective FBs and so the FBs remain until replaced or
>>>>> turned off explicitly (by e.g. fbcon if you switch to that rather than
>>>>> another userspace KMS client). I believe that is the whole reason why
>>>>> e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
>>>>> would not have anything to scrape.
>>>>>
>>>>> danvet, what is the DRM core intention?    
>>>>
>>>> Historical accidents mostly. There's two things that foil easy
>>>> handover to the next compositor:
>>>> - RMFB instead of CLOSEFB semantics, especially when closing the
>>>> drmfd. This is uapi, so anything we change needs to be opt-in  
>>>
>>> What does this mean and refer to?
>>>
>>> Are you trying to say, that closing the DRM device fd (freeing the file
>>> description) causes an implicit RmFB on all the FBs tied to that DRM
>>> device file description?
>>>
>>> I never realised that before.  
>>
>> Yes, final close does iterate over fb and do an RMFB. Which is why we've
>> had this discussion whether closefb semantics should be an ADDFB2 flag at
>> creation time instead.
> 
> Hi Daniel,
> 
> such flag would make sense to me.

Hmm, I was thinking having a separate call to mark a FB to switch to
closefb semantics. But both plymouth (because of end of animation)
and GNOME (because a mostly empty gnome-shell needs to be rendered
to avoid leaking privacy sensitive info) will need to prepare a
special FB on exit anyways, so then an ADDFB2 flag would work fine.

I would be happy to work on the plymouth side of this, so that we
have at least one consumer of such a flag lined up for merging.

Regards,

Hans

