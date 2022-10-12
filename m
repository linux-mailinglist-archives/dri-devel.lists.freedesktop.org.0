Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BF5FC9C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 19:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADE710E1C9;
	Wed, 12 Oct 2022 17:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591FD10E1C9;
 Wed, 12 Oct 2022 17:16:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso1647321wmb.5; 
 Wed, 12 Oct 2022 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nfv8Emkdemptja7sqhf+nCS18RTGuj08h8amedIiRFo=;
 b=FuRwTo9shnYA86gVY2kkAPUji0ZSorVuPOMXWESKh2mVpdFT5lK5Pu9DTZa/nMGWM0
 dYBBRi5HW//1ngTtq4Di/HCEMqQb1H4ykUsQOjVzBTVwNGZ/prVb8B4GVk6o0isoREqj
 9Rw/LNTcP4QiKN5zZ1zHvLQ6T9o9k/JQZUJpsAcx0Gyx6nshlmPY/eDkg5YGEI3lWjqd
 KinEZ9GLBoCTFhrjYU3BqcPiydHKCQlit6UOu4s9uD9YHoi5oLbT51nS/B9L1rF032Cd
 y5ichoaH4vUb8OI/Sa+Z2JMpeGZergkck1TYmqklKr2jFvRIwG8JL8uqq9gpDPEiGf0u
 5lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nfv8Emkdemptja7sqhf+nCS18RTGuj08h8amedIiRFo=;
 b=KM1x5dn+fF/c2X0IvHV/7RvsFQOAEqTPsv3SWI0pREmA5i7XoXW9gmmyfAYFfuCaps
 EcxD6OkG3NQTgu2zGP7P8d8nfidOUxwd1JxtdM+SsgD1Vb1zabuOTua0iKHTdFDgC82P
 zDmkhynz/BBTCopvXUc9iihZqiyBK9XuKFI25UQQHbMLtvajLrh+gKe3pkQC3NAWe1jy
 ZaE6O4YDmLmPTelCQEAmhaHquhqkOJvT5kHlhGcPjOdhULSkWaiofnXu/23Ez0k7dpP3
 bB23OUpM7VtN1SYO6QEC4NF+luMuZR2B2fESe7ukm05VAT5SN3M1y68bFdwToQPDjtlw
 fe/A==
X-Gm-Message-State: ACrzQf1hwZAnkTbgaQB/6pDTogcvDjC83qdTmbsyX9AOeC33g3/wcg7Y
 mcW0ZlIL+b420tBxV0Z0Kos=
X-Google-Smtp-Source: AMsMyM6ZK7P2+4ybLieVaGIvLxOiuzMnfFa0H0Qh58ZMYatdysNofUI+fFhyRXj1jk8keEiYm8kNiw==
X-Received: by 2002:a05:600c:524a:b0:3b5:290:1a7c with SMTP id
 fc10-20020a05600c524a00b003b502901a7cmr3550691wmb.75.1665594995662; 
 Wed, 12 Oct 2022 10:16:35 -0700 (PDT)
Received: from [192.168.0.181] (82-64-129-2.subs.proxad.net. [82.64.129.2])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0a4300b003b4fdbb6319sm2497563wmq.21.2022.10.12.10.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 10:16:35 -0700 (PDT)
Date: Wed, 12 Oct 2022 19:16:29 +0200
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Message-Id: <HBHNJR.ME9DMISWT3961@gmail.com>
In-Reply-To: <87v8opwiqw.fsf@intel.com>
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
 <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
 <87v8opwiqw.fsf@intel.com>
X-Mailer: geary/40.0
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

By crash, I mean that an error is returned here: 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git/+/refs/heads/master/drivers/gpu/drm/drm_edid_load.c#195
I don't really know what happens next, but on my machine the built-in 
screen and the external remains dark. Also the kernel seems to freeze. 
I suspect a kernel panic, but I'm not sure. Anyway, the error is 
definitely not well handled, and a fix would be great.
Also, request_firmware() will crash if called for the first time on the 
resume path because the file system isn't reachable on the resume 
process. And no cache is available for this firmware. So I guess that 
in this case, request_firmware() returns an error.
Suspend-plug-resume case is not my priority nether as long as it 
doesn't make the system crash (Which is currently the case).

On Wed, Oct 12 2022 at 11:25:59 AM +0300, Jani Nikula 
<jani.nikula@intel.com> wrote:
> On Tue, 11 Oct 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> 
> wrote:
>>  Currently the EDID is requested during the resume. But since it's
>>  requested too early, this means before the filesystem is mounted, 
>> the
>>  firmware request fails. This make the DRM driver crash when 
>> resuming.
>>  This kind of issue should be prevented by the firmware caching 
>> process
>>  which cache every firmware requested for the next resume. But since 
>> we
>>  are using a temporary device, the firmware isn't cached on suspend
>>  since the device doesn't work anymore.
>>  When using a non temporary device to get the EDID, the firmware will
>>  be cached on suspend for the next resume. So requesting the firmware
>>  during resume will succeed.
>>  But if the firmware has never been requested since the boot, this
>>  means that the monitor isn't plugged since the boot. The kernel will
>>  not be caching the EDID. So if we plug the monitor while the machine
>>  is suspended. The resume will fail to load the firmware. And the DRM
>>  driver will crash.
>>  So basically, your fix should solve the issue except for the case
>>  where the monitor hasn't been plugged since boot and is plugged 
>> while
>>  the machine is suspended.
>>  I hope I was clear. Tell me if I wasn't. I'm not really good at 
>> explaining.
> 
> That was a pretty good explanation. The only thing I'm missing is what
> the failure mode is exactly when you claim the driver will crash. Why
> would request_firmware() "crash" if called for the first time on the
> resume path?
> 
> I'm not sure I care much about not being able to load the firmware 
> EDID
> in the suspend-plug-resume case (as this can be remedied with a
> subsequent modeset), but obviously any errors need to be handled
> gracefully, without crashing.
> 
> BR,
> Jani.
> 
> 
> --
> Jani Nikula, Intel Open Source Graphics Center


