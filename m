Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76522627239
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 20:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC05010E242;
	Sun, 13 Nov 2022 19:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A7D10E241;
 Sun, 13 Nov 2022 19:27:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w14so13801398wru.8;
 Sun, 13 Nov 2022 11:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GF5RzMJMs9NPVLVo5QxgAEH2Ji74ZSRxPWbyjtgOf7M=;
 b=fOEXtlRZ2x/xBdza1x78DhYez7gMWhzcUdmyJQztGuqWD/Mj7nUZ0bcVV1nql6n3F/
 SNbENEvfvtGVr85OVKSsJYi14W21S46zk1rUUK0ikrrqzjlFUFaIuNkiB7uCW/bS1Npe
 LoUJg2lJWr0gj1/VviTXqQ2C8WLGbkFsDBDYk+vdu4McyULKHQ5cShetum4Zc8pIsOcf
 TSJYGeqb+py3QuYsW5zK5HLjVtBNNT+SEDcrilwdt13xAdQu9dEqWzoaWMohlkt1FfMe
 U/FQ2rSgtXRw1c3faBq0qfCIWqXSabIuQ8RtQIFa5vP2fMxxyUAFA/X5LinoMks8M2bR
 BNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GF5RzMJMs9NPVLVo5QxgAEH2Ji74ZSRxPWbyjtgOf7M=;
 b=tGpnuBGL9qhGzdA/Sw7Drc2K5C5+ZeYKuDV3HqcN4E2UongkdSbQHP+pORIL6Bjymk
 5B7g7GYAx0VF738mBFiOlY1z9BeCxYb2GSui9ZDKAw30SBmK5PXJMzL+zM24493rHmmi
 VeOW9iwFlp5L/6N88n6bb5NeQgZ9Z9Bt0SkuQbPmmgQkhypPYZJfmUCgYPLo9IZPL7Xq
 PN6vmqQle5Zh6dNC22I7/rVF55+Xe4FtJoU2GKH0DhleG2km2EMWrtPhmw4rJMD/uFca
 Ivt1JTxQoOrULCybShade6cmEAyPi15zvtrgZUU9f+j1V62eArL6drmKZFMnms5LBPsT
 xeQA==
X-Gm-Message-State: ANoB5pnqhPnLNWakpaL0OHVj+yAnqIJf7KCKFABtrfWD1wRxv/H0Cnb3
 bxezQvUlHmRiCGTwGIHhndI=
X-Google-Smtp-Source: AA0mqf54aRZWi288k13HpNT8O5ikGcCVzLZ3/bY4oXwCcOMGj2HLd7UJD+HSI2YK33kvj5UICnp+LA==
X-Received: by 2002:a5d:524f:0:b0:236:77f4:6e19 with SMTP id
 k15-20020a5d524f000000b0023677f46e19mr5992395wrc.638.1668367626768; 
 Sun, 13 Nov 2022 11:27:06 -0800 (PST)
Received: from matebook-d-15 ([2a01:e0a:1d2:1f90:be95:f3a2:4d99:a3b3])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d54c3000000b0022efc4322a9sm7637158wrv.10.2022.11.13.11.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 11:27:06 -0800 (PST)
Date: Sun, 13 Nov 2022 20:26:59 +0100
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Message-Id: <ZOWALR.8HILT50E5STE1@gmail.com>
In-Reply-To: <4WC1LR.VI6JX5V2DJ96@gmail.com>
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
 <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
 <87v8opwiqw.fsf@intel.com> <HBHNJR.ME9DMISWT3961@gmail.com>
 <0TLXKR.MU9V2CJGXH05@gmail.com> <875yfpadp6.fsf@intel.com>
 <4WC1LR.VI6JX5V2DJ96@gmail.com>
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

Hi,

I've tested the patch and I can confirm that it fixed the issue.
Tested on Fedora 36 with kernel 6.0.8.

Thanks,
Matthieu

On Tue, Nov 8 2022 at 04:40:52 PM +0100, Matthieu CHARETTE 
<matthieu.charette@gmail.com> wrote:
> I didn't test the patch yet. I will do. But even without testing I 
> can tell you that it will work (It will not crash).
> Currently when the crash occurs, all screens remain black after 
> resume. I'm not able to login with ssh neither. And logs end before 
> the suspend. So the crash seems to be some kind of kernel panic.
> 
> Matthieu
> 
> On Tue, Nov 8 2022 at 01:27:33 PM +0200, Jani Nikula 
> <jani.nikula@intel.com> wrote:
>> On Sun, 06 Nov 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> 
>> wrote:
>>>  Hi,
>>> 
>>>  Can you tell me what are we waiting for? Maybe I can help.
>> 
>> Have you tried the patch? Is it an improvement over the status quo?
>> 
>> The "crash" is still ambiguous to me. Do you observe it with the 
>> patch?
>> Do you have logs? Etc.
>> 
>> BR,
>> Jani.
>> 
>> 
>>> 
>>>  Thanks.
>>> 
>>>  Matthieu
>>> 
>>>  On Wed, Oct 12 2022 at 07:16:29 PM +0200, Matthieu CHARETTE
>>>  <matthieu.charette@gmail.com> wrote:
>>>>  By crash, I mean that an error is returned here:
>>>>  
>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git/+/refs/heads/master/drivers/gpu/drm/drm_edid_load.c#195
>>>>  I don't really know what happens next, but on my machine the 
>>>> built-in
>>>>  screen and the external remains dark. Also the kernel seems to
>>>>  freeze. I suspect a kernel panic, but I'm not sure. Anyway, the 
>>>> error
>>>>  is definitely not well handled, and a fix would be great.
>>>>  Also, request_firmware() will crash if called for the first time 
>>>> on
>>>>  the resume path because the file system isn't reachable on the 
>>>> resume
>>>>  process. And no cache is available for this firmware. So I guess 
>>>> that
>>>>  in this case, request_firmware() returns an error.
>>>>  Suspend-plug-resume case is not my priority nether as long as it
>>>>  doesn't make the system crash (Which is currently the case).
>>>> 
>>>>  On Wed, Oct 12 2022 at 11:25:59 AM +0300, Jani Nikula
>>>>  <jani.nikula@intel.com> wrote:
>>>>>  On Tue, 11 Oct 2022, Matthieu CHARETTE 
>>>>> <matthieu.charette@gmail.com>
>>>>>  wrote:
>>>>>>   Currently the EDID is requested during the resume. But since 
>>>>>> it's
>>>>>>   requested too early, this means before the filesystem is 
>>>>>> mounted,
>>>>>>  the
>>>>>>   firmware request fails. This make the DRM driver crash when
>>>>>>  resuming.
>>>>>>   This kind of issue should be prevented by the firmware caching
>>>>>>  process
>>>>>>   which cache every firmware requested for the next resume. But
>>>>>>  since we
>>>>>>   are using a temporary device, the firmware isn't cached on 
>>>>>> suspend
>>>>>>   since the device doesn't work anymore.
>>>>>>   When using a non temporary device to get the EDID, the firmware
>>>>>>  will
>>>>>>   be cached on suspend for the next resume. So requesting the
>>>>>>  firmware
>>>>>>   during resume will succeed.
>>>>>>   But if the firmware has never been requested since the boot, 
>>>>>> this
>>>>>>   means that the monitor isn't plugged since the boot. The kernel
>>>>>>  will
>>>>>>   not be caching the EDID. So if we plug the monitor while the
>>>>>>  machine
>>>>>>   is suspended. The resume will fail to load the firmware. And 
>>>>>> the
>>>>>>  DRM
>>>>>>   driver will crash.
>>>>>>   So basically, your fix should solve the issue except for the 
>>>>>> case
>>>>>>   where the monitor hasn't been plugged since boot and is plugged
>>>>>>  while
>>>>>>   the machine is suspended.
>>>>>>   I hope I was clear. Tell me if I wasn't. I'm not really good at
>>>>>>  explaining.
>>>>> 
>>>>>  That was a pretty good explanation. The only thing I'm missing is
>>>>>  what
>>>>>  the failure mode is exactly when you claim the driver will 
>>>>> crash. Why
>>>>>  would request_firmware() "crash" if called for the first time on 
>>>>> the
>>>>>  resume path?
>>>>> 
>>>>>  I'm not sure I care much about not being able to load the 
>>>>> firmware
>>>>>  EDID
>>>>>  in the suspend-plug-resume case (as this can be remedied with a
>>>>>  subsequent modeset), but obviously any errors need to be handled
>>>>>  gracefully, without crashing.
>>>>> 
>>>>>  BR,
>>>>>  Jani.
>>>>> 
>>>>> 
>>>>>  --
>>>>>  Jani Nikula, Intel Open Source Graphics Center
>>>> 
>>>> 
>>> 
>>> 
>> 
>> --
>> Jani Nikula, Intel Open Source Graphics Center
> 
> 


