Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9B621892
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1310E496;
	Tue,  8 Nov 2022 15:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1D710E496;
 Tue,  8 Nov 2022 15:41:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso1269794wmb.0; 
 Tue, 08 Nov 2022 07:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=i4+HYZLfqzslDjvkRvX2gV7AGNUZjXK88k3M5DO1Ba0=;
 b=WJq7/UaU4zc2k+LIsZNA0njt7RpI8db7XX09AmGHN8eet6Gf/tb+1zm0ACJyC8xFTX
 A5Sr42FgF0JWiN7Fhq6uo6/90sFClKr8GoU6GcgxRQYpVvBeRFJIh4TfHK4/sMzUKXGP
 L/PIG5mD3H3QAveSRRRzWQa+K2mO0q6gAEh9C2UHkwI4g5u+3tGMPgFfqhQsAA8wa66l
 gOUmuI/Z10KSCgn8MO7g99oNvpArmvjjKgwCBgns5DDgB2/J8RisCoWTFdZFs01Rr77k
 iIrKVdeCuQK2EWPcvZSafk43LzAxyZnKQCOg1mB7IX5lL6Xb7oub+j7WRIoouMAwL7lz
 g2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4+HYZLfqzslDjvkRvX2gV7AGNUZjXK88k3M5DO1Ba0=;
 b=ig1jPbMYOlToy7f9SM+T526PVlD9LP+osZzwZdeU/FyodXqTMzvKBxusq+ubhehkS0
 CcbNIN/NwZOfrAg7x8hDc4pKgAXyQ74OOa0DpJ6qAmyDIas8dviwO/ND1mtVhQWOpVPB
 Q36TFTiW0EuCDIfymoNisTP4La4Rc4ha404m73JISYOi0hkTze52rkirNlaqdeEnpVRV
 VsHMUyGbXwP8Jw0HAMpPMANWGi/CXZ5uVH3B8flp92e92UEl1HKefZWHNPHRmR713DHE
 NBFMflRgE1kGtV1nUD2PNHI4iqDt6aRJdLT5zVCNozUJy5kc6sNB5rnaLAn4g22ACzzr
 gumQ==
X-Gm-Message-State: ACrzQf0AvaWeEGPwF/MVdXXxi0Dbww8yNVT72Vj/PpiNP0a03uGvTdwt
 SyVfz5iE+OmKrv9+0cXWzdM=
X-Google-Smtp-Source: AMsMyM6KE4eDXhiyZ6mAsAX3b+IbI/IsoGOIvfXATfN4zBPtZGLvTD+kTfwhxJUlx3wBAZv84hI0Rg==
X-Received: by 2002:a05:600c:2287:b0:3cf:4dfb:c223 with SMTP id
 7-20020a05600c228700b003cf4dfbc223mr44590749wmf.19.1667922058779; 
 Tue, 08 Nov 2022 07:40:58 -0800 (PST)
Received: from matebook-d-15 ([2a01:e0a:1d2:1f90:be95:f3a2:4d99:a3b3])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003c6c3fb3cf6sm11596954wml.18.2022.11.08.07.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 07:40:58 -0800 (PST)
Date: Tue, 08 Nov 2022 16:40:52 +0100
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Message-Id: <4WC1LR.VI6JX5V2DJ96@gmail.com>
In-Reply-To: <875yfpadp6.fsf@intel.com>
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
 <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
 <87v8opwiqw.fsf@intel.com> <HBHNJR.ME9DMISWT3961@gmail.com>
 <0TLXKR.MU9V2CJGXH05@gmail.com> <875yfpadp6.fsf@intel.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I didn't test the patch yet. I will do. But even without testing I can 
tell you that it will work (It will not crash).
Currently when the crash occurs, all screens remain black after resume. 
I'm not able to login with ssh neither. And logs end before the 
suspend. So the crash seems to be some kind of kernel panic.

Matthieu

On Tue, Nov 8 2022 at 01:27:33 PM +0200, Jani Nikula 
<jani.nikula@intel.com> wrote:
> On Sun, 06 Nov 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> 
> wrote:
>>  Hi,
>> 
>>  Can you tell me what are we waiting for? Maybe I can help.
> 
> Have you tried the patch? Is it an improvement over the status quo?
> 
> The "crash" is still ambiguous to me. Do you observe it with the 
> patch?
> Do you have logs? Etc.
> 
> BR,
> Jani.
> 
> 
>> 
>>  Thanks.
>> 
>>  Matthieu
>> 
>>  On Wed, Oct 12 2022 at 07:16:29 PM +0200, Matthieu CHARETTE
>>  <matthieu.charette@gmail.com> wrote:
>>>  By crash, I mean that an error is returned here:
>>>  
>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git/+/refs/heads/master/drivers/gpu/drm/drm_edid_load.c#195
>>>  I don't really know what happens next, but on my machine the 
>>> built-in
>>>  screen and the external remains dark. Also the kernel seems to
>>>  freeze. I suspect a kernel panic, but I'm not sure. Anyway, the 
>>> error
>>>  is definitely not well handled, and a fix would be great.
>>>  Also, request_firmware() will crash if called for the first time on
>>>  the resume path because the file system isn't reachable on the 
>>> resume
>>>  process. And no cache is available for this firmware. So I guess 
>>> that
>>>  in this case, request_firmware() returns an error.
>>>  Suspend-plug-resume case is not my priority nether as long as it
>>>  doesn't make the system crash (Which is currently the case).
>>> 
>>>  On Wed, Oct 12 2022 at 11:25:59 AM +0300, Jani Nikula
>>>  <jani.nikula@intel.com> wrote:
>>>>  On Tue, 11 Oct 2022, Matthieu CHARETTE 
>>>> <matthieu.charette@gmail.com>
>>>>  wrote:
>>>>>   Currently the EDID is requested during the resume. But since 
>>>>> it's
>>>>>   requested too early, this means before the filesystem is 
>>>>> mounted,
>>>>>  the
>>>>>   firmware request fails. This make the DRM driver crash when
>>>>>  resuming.
>>>>>   This kind of issue should be prevented by the firmware caching
>>>>>  process
>>>>>   which cache every firmware requested for the next resume. But
>>>>>  since we
>>>>>   are using a temporary device, the firmware isn't cached on 
>>>>> suspend
>>>>>   since the device doesn't work anymore.
>>>>>   When using a non temporary device to get the EDID, the firmware
>>>>>  will
>>>>>   be cached on suspend for the next resume. So requesting the
>>>>>  firmware
>>>>>   during resume will succeed.
>>>>>   But if the firmware has never been requested since the boot, 
>>>>> this
>>>>>   means that the monitor isn't plugged since the boot. The kernel
>>>>>  will
>>>>>   not be caching the EDID. So if we plug the monitor while the
>>>>>  machine
>>>>>   is suspended. The resume will fail to load the firmware. And the
>>>>>  DRM
>>>>>   driver will crash.
>>>>>   So basically, your fix should solve the issue except for the 
>>>>> case
>>>>>   where the monitor hasn't been plugged since boot and is plugged
>>>>>  while
>>>>>   the machine is suspended.
>>>>>   I hope I was clear. Tell me if I wasn't. I'm not really good at
>>>>>  explaining.
>>>> 
>>>>  That was a pretty good explanation. The only thing I'm missing is
>>>>  what
>>>>  the failure mode is exactly when you claim the driver will crash. 
>>>> Why
>>>>  would request_firmware() "crash" if called for the first time on 
>>>> the
>>>>  resume path?
>>>> 
>>>>  I'm not sure I care much about not being able to load the firmware
>>>>  EDID
>>>>  in the suspend-plug-resume case (as this can be remedied with a
>>>>  subsequent modeset), but obviously any errors need to be handled
>>>>  gracefully, without crashing.
>>>> 
>>>>  BR,
>>>>  Jani.
>>>> 
>>>> 
>>>>  --
>>>>  Jani Nikula, Intel Open Source Graphics Center
>>> 
>>> 
>> 
>> 
> 
> --
> Jani Nikula, Intel Open Source Graphics Center


