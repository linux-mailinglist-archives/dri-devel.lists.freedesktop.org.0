Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183034F139F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 13:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977EF10EF2C;
	Mon,  4 Apr 2022 11:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C210EF2C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649070623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6A01dDxN4AhfWeci3IfqR+D+i/Vo38DEq8zB5JTGSTo=;
 b=VXPpsvSRCt1fXTaeHAk5xZCB3LG3fBed1jKZT65ClN2hHhKXdBgwgnd5UGJKEHjoENUTxl
 in6iGbsgCXWs9D9z1MQFhL1z+m3OZkhj2J34kmud+IIyR/G/UhaN4dDWLHaKcCVGCE8p2Y
 L89WQIIr0LMXFWgikrwKRnhwu0LTQpA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255--WSC_fgtOV-EmrL1I9bjTw-1; Mon, 04 Apr 2022 07:10:22 -0400
X-MC-Unique: -WSC_fgtOV-EmrL1I9bjTw-1
Received: by mail-ed1-f70.google.com with SMTP id
 d19-20020aa7d5d3000000b0041cd772fb03so1161705eds.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 04:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6A01dDxN4AhfWeci3IfqR+D+i/Vo38DEq8zB5JTGSTo=;
 b=k2xVsVIMCr+QGsAyGWwpxsk4jlU5/TF+okHTppMkHGDGb/apJ/haQilydmruTyudTW
 gBlJ3FvwhnldWb5pFwTJHc6rKMJgvBTPKt561gSJVXb3nr0KcOJhfieO0wMcg2xrCkks
 TSdOZb/g1TCk8dakk6XQ+Vyap60ev61w4VKhoGC6JmROU55Kmm836ZUjFltnbYZdZ4QU
 Aw+qQN51TfvcATcDDTg4E5lmr8pCJGoHvQfg8tSQ1vEFZy0fLSSbTrGWHhlYk3FSHvsO
 bKsebdt4sVQkR5nbYB4zbYV3PN2l7NwsU2JynRi8bROxwkOMx4L5xXqPCqAtTDh+TtUX
 3Opw==
X-Gm-Message-State: AOAM532oOSYYgcv2RWeHjNsPjf/QGSLv8w6z2V+L+3xD98BMtpULlLuh
 +KN3n0RlNIo/px4Pw2W/kmtp+vOHYbuGfHIHJs5tpPe2kM8c0ktlY8pdrV3cV6EVbD98T/7HE/F
 fiEUycspJS2RNKYKhp1JaYTWNaOaN
X-Received: by 2002:a17:907:7252:b0:6df:75cc:615e with SMTP id
 ds18-20020a170907725200b006df75cc615emr10348705ejc.683.1649070621329; 
 Mon, 04 Apr 2022 04:10:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfPjSGUTP7GT/ripRbE1qttsE5IB0zwM5i7Vj4d6y9queZLJfj6nGefOPOpRNW0SE0YoMpWg==
X-Received: by 2002:a17:907:7252:b0:6df:75cc:615e with SMTP id
 ds18-20020a170907725200b006df75cc615emr10348669ejc.683.1649070620966; 
 Mon, 04 Apr 2022 04:10:20 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a170906725500b006e10a7d6d03sm4160148ejk.219.2022.04.04.04.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 04:10:20 -0700 (PDT)
Message-ID: <7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com>
Date: Mon, 4 Apr 2022 13:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v10 0/3] drivers: ddcci: add drivers for DDCCI
To: Yusuf Khan <yusisamerican@gmail.com>, linux-kernel@vger.kernel.org,
 Sebastian Wick <sebastian.wick@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Peres <martin.peres@linux.intel.com>
References: <20220403230850.2986-1-yusisamerican@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220403230850.2986-1-yusisamerican@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: axboe@kernel.dk, javier@javigon.com, kernel test robot <lkp@intel.com>,
 arnd@arndb.de, mst@redhat.com, gregkh@linuxfoundation.org, jasowang@redhat.com,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>, mikelley@microsoft.com,
 will@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yusuf,

On 4/4/22 01:08, Yusuf Khan wrote:
> This patch adds the DDCCI driver by Christoph Grenz into the kernel.
> The original gitlab page is loacted at https://gitlab.com/ddcci-driv
> er-linux/ddcci-driver-linux/-/tree/master.
> 
> DDC/CI is a control protocol for monitor settings supported by most
> monitors since about 2005. A chardev and sysfs interface is provided.
> A backlight driver using DDCCI is also provided in the seccond patch.
> 
> Signed-off-by: Yusuf Khan <yusisamerican@gmail.com>
> Signed-off-by: Christoph Grenz <christophg+lkml@grenz-bonn.de>

Thank you for your submission of this patch series.

I must say that I'm a bit surprised that this series was NOT
also send to the drm/kms subsystem maintainers and mailinglists
since this deals with monitors and thus is highly relevant for
those folks. Luckily I saw an article about this at Phoronix
(you write in the changelog that you believe that there is
no interaction with the DRM/KMS subsystems but that is wrong).

One very important thing which I'm missing in this cover-letter
is why you want to have this in the kernel at all? There are
already various tools which do DDCCI from userspace just fine.

I guess you may be interested in offering /sys/class/backlight
functionality for external monitors. That is actually something
which I'm interested in too, but it is not that simple.

The current /sys/class/backlight interface does not offer a
way for userspace to map a /sys/class/backlight device to
a specific display-output / monitor. So userspace currently
assumes that there is only 1 (1 valid) /sys/class/backlight
device and that that *always* belongs to the internal LCD
panel of a laptop.

So just adding /sys/class/backlight device(s) for internal
monitors without addressing the short-comings of the existing
userspace interface is simply not possible because it would
break existing userspace which is something which is not
allowed.

So NACK from me for the backlight part at least and without
that, I really see no reason to do this in the kernel rather
then userspace.

I've recently been discussing this with a colleague of mine,
Sebastian Wick and as a result of that I'm giving a talk
with a proposal for a better userspace API for this at
kernel-recipes:
https://kernel-recipes.org/en/2022/talks/new-userspace-api-for-display-panel-brightness-control/

I hope to start working on a RFC patch series for this soon.

IMHO merging this series should be put on hold until we
have a better idea of how we want to solve the userspace
API challenges, esp. the monitor <-> /sys/class/backlight
mapping problem.

Regards,

Hans



p.s.

This is not the first time this has come up:

https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/



> ---
> v2: Fix typos.
> 
> v3: Add documentation, move files around, replace semaphores with
> mutexes, and replaced <asm-generic/fcntl.h> with <linux/fcntl.h>.
> "imirkin"(which due to his involvement in the dri-devel irc channel
> I cant help but assume to be a DRM developer) said that the DDC/CI
> bus does not intefere with the buses that DRM is involved with.
> 
> v4: Move some documentation, fix grammer mistakes, remove usages of
> likely(), and clarify some documentation.
> 
> v5: Fix grammer mistakes, remove usages of likely(), and clarify
> some documentation.
> 
> v6: Change contact information to reference Christoph Grenz.
> 
> v7: Remove all instances of the unlikely() macro.
> 
> v8: Modify documentation to provide updated date and kernel
> documentation, fix SPDX lines, use isalpha instead of redefining
> logic, change maximum amount of bytes that can be written to be
> conformant with DDC/CI specification, prevent userspace from holding
> locks with the open file descriptor, remove ddcci_cdev_seek, dont
> refine sysfs_emit() logic, use EXPORT_SYMBOL_GPL instead of
> EXPORT_SYMBOL, remove ddcci_device_remove_void, remove module
> paramaters and version, and split into 2 patches.
> 
> v9: Fix IS_ANY_ID matching for compilers and archs where char is
> unsigned char and use the cannonical patch format.
> Reported-by: kernel test robot <lkp@intel.com>
> 
> v10: Change patch title to "drivers: ddcci: add drivers for DDCCI
> and change" and change patch descriptions to add more detailed
> explanations of function.
> 
> Patch 1: Add the main DDCCI component.
> 
> Patch 2: Add the backlight driver that utilizes the DDCCI driver.
> 
> Patch 3: Add documentation for the DDCCI drivers.
> 
> Yusuf Khan (3):
>   drivers: ddcci: add drivers for DDCCI
>   drivers: ddcci: add drivers for DDCCI
>   drivers: ddcci: add drivers for DDCCI
> 
>  Documentation/ABI/testing/sysfs-driver-ddcci |   57 +
>  Documentation/driver-api/ddcci.rst           |  122 ++
>  drivers/char/Kconfig                         |   11 +
>  drivers/char/Makefile                        |    1 +
>  drivers/char/ddcci.c                         | 1805 ++++++++++++++++++
>  drivers/video/backlight/Kconfig              |   11 +
>  drivers/video/backlight/Makefile             |    1 +
>  drivers/video/backlight/ddcci-backlight.c    |  411 ++++
>  include/linux/ddcci.h                        |  163 ++
>  9 files changed, 2582 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-ddcci
>  create mode 100644 Documentation/driver-api/ddcci.rst
>  create mode 100644 drivers/char/ddcci.c
>  create mode 100644 drivers/video/backlight/ddcci-backlight.c
>  create mode 100644 include/linux/ddcci.h
> 

