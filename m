Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4FA61E2D7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 16:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F345610E190;
	Sun,  6 Nov 2022 15:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09CE10E190;
 Sun,  6 Nov 2022 15:03:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k8so12998308wrh.1;
 Sun, 06 Nov 2022 07:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wm7hxLz7zkOClOud0pc0lu34j5j8vm934zPKvsA7X0Y=;
 b=m1N/Evw2STCBq3dChhkwQfApVHdNAQJv/+yzDju7tcYvwGBMNkIq54aJIU2ScGVmBX
 chDpi6V7mEwb2as+Q+T4815I+sqkz1EyG3zyJbtUClPBI/EzoKHPLZKrH78WY0Io1/sk
 lshWyJ/YYR4Je063i8QVdQxaRfazNap4BfJ7QW2oyo2iw0m8+cyKJbEIi1PxNHgdBZHG
 VMe8/snyEpUUkV8b1Crz1wVSGMPIzFCupMOnfyFHSXSmtzgstiTqmzthwgsudb0TVrLv
 lgxfN+13lGWegvlmQdTAMabkZfard/ork/XSsJ9YS5TbCpk79a658wh7QyZvmlsmbZgQ
 dkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wm7hxLz7zkOClOud0pc0lu34j5j8vm934zPKvsA7X0Y=;
 b=CcUIwAptKHkH2z8tIumWIAg7eysHetSW22bm3gjpWZCAaAaYLwbAgGQBoVaOJx2WVW
 iacGxFenncMYreNrSBf6EBpYhV5HNblLHfhDF6KXGXNEJ8uA7lS5M1iWhqN1iqudsKKU
 /mWsmWDf9AY0adBcMO+Av/rHk65Z0b3jglewZak5eSxTi86zr8RvIIGR3hll9rc1yDec
 VO72f6va95TcRHuMOz6jBreY/yvQcSFLAAJTL0rAPnAesYb5dyunPXVF0IyijeX5E1cB
 mrMHigGhsN+53+QODgkxrDBeZWwMIuFF5IS+6YSje6KLJ6EuWUGMOFrM6BbyyfIuvuBk
 7xvg==
X-Gm-Message-State: ACrzQf2vI2+0Boyn8L/7O7EvTkk0HaQQ8LLFy4ubgncJN4o8piHxbAqi
 mStYacQm9y7IEPap5KMjvr4=
X-Google-Smtp-Source: AMsMyM43WhknTyd6kQLB0cTjqWfzZIA7Svc6Gq7F4l1aUqjnmFgDJzQDSoZyxawttPhFrBXuneagyw==
X-Received: by 2002:a5d:42c4:0:b0:236:637c:6c71 with SMTP id
 t4-20020a5d42c4000000b00236637c6c71mr28766554wrr.499.1667746987177; 
 Sun, 06 Nov 2022 07:03:07 -0800 (PST)
Received: from matebook-d-15 ([2a01:e0a:1d2:1f90:be95:f3a2:4d99:a3b3])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b00236e834f050sm4789807wro.35.2022.11.06.07.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:03:06 -0800 (PST)
Date: Sun, 06 Nov 2022 16:03:00 +0100
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Message-Id: <0TLXKR.MU9V2CJGXH05@gmail.com>
In-Reply-To: <HBHNJR.ME9DMISWT3961@gmail.com>
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
 <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
 <87v8opwiqw.fsf@intel.com> <HBHNJR.ME9DMISWT3961@gmail.com>
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

Can you tell me what are we waiting for? Maybe I can help.

Thanks.

Matthieu

On Wed, Oct 12 2022 at 07:16:29 PM +0200, Matthieu CHARETTE 
<matthieu.charette@gmail.com> wrote:
> By crash, I mean that an error is returned here: 
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git/+/refs/heads/master/drivers/gpu/drm/drm_edid_load.c#195
> I don't really know what happens next, but on my machine the built-in 
> screen and the external remains dark. Also the kernel seems to 
> freeze. I suspect a kernel panic, but I'm not sure. Anyway, the error 
> is definitely not well handled, and a fix would be great.
> Also, request_firmware() will crash if called for the first time on 
> the resume path because the file system isn't reachable on the resume 
> process. And no cache is available for this firmware. So I guess that 
> in this case, request_firmware() returns an error.
> Suspend-plug-resume case is not my priority nether as long as it 
> doesn't make the system crash (Which is currently the case).
> 
> On Wed, Oct 12 2022 at 11:25:59 AM +0300, Jani Nikula 
> <jani.nikula@intel.com> wrote:
>> On Tue, 11 Oct 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> 
>> wrote:
>>>  Currently the EDID is requested during the resume. But since it's
>>>  requested too early, this means before the filesystem is mounted, 
>>> the
>>>  firmware request fails. This make the DRM driver crash when 
>>> resuming.
>>>  This kind of issue should be prevented by the firmware caching 
>>> process
>>>  which cache every firmware requested for the next resume. But 
>>> since we
>>>  are using a temporary device, the firmware isn't cached on suspend
>>>  since the device doesn't work anymore.
>>>  When using a non temporary device to get the EDID, the firmware 
>>> will
>>>  be cached on suspend for the next resume. So requesting the 
>>> firmware
>>>  during resume will succeed.
>>>  But if the firmware has never been requested since the boot, this
>>>  means that the monitor isn't plugged since the boot. The kernel 
>>> will
>>>  not be caching the EDID. So if we plug the monitor while the 
>>> machine
>>>  is suspended. The resume will fail to load the firmware. And the 
>>> DRM
>>>  driver will crash.
>>>  So basically, your fix should solve the issue except for the case
>>>  where the monitor hasn't been plugged since boot and is plugged 
>>> while
>>>  the machine is suspended.
>>>  I hope I was clear. Tell me if I wasn't. I'm not really good at 
>>> explaining.
>> 
>> That was a pretty good explanation. The only thing I'm missing is 
>> what
>> the failure mode is exactly when you claim the driver will crash. Why
>> would request_firmware() "crash" if called for the first time on the
>> resume path?
>> 
>> I'm not sure I care much about not being able to load the firmware 
>> EDID
>> in the suspend-plug-resume case (as this can be remedied with a
>> subsequent modeset), but obviously any errors need to be handled
>> gracefully, without crashing.
>> 
>> BR,
>> Jani.
>> 
>> 
>> --
>> Jani Nikula, Intel Open Source Graphics Center
> 
> 


