Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CB2776E4E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 05:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28110E4A6;
	Thu, 10 Aug 2023 03:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B419410E4A3;
 Thu, 10 Aug 2023 03:03:45 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a1ebb85f99so386748b6e.2; 
 Wed, 09 Aug 2023 20:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691636625; x=1692241425;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mqIn1UxvvxNgWiVAxgUjE9nunV+x1Ajw+4mnlJTJ2U=;
 b=WNBWdcyt8GmLswbKFdavF/RRxcjB8H9Ndg+oRoiWchhneNSVpQlS6RHec6/ympBFJe
 FWHW/UlLcXifYRrvNjNLHfVzzwu/pmZdgy89xgYTSW5C3iVOo/6QlDttftUVk2JoUV5N
 nT/09vw131HU5ZSuk9pkzXPdvzolaTsL/PrOV9UUQ5Q1neoAJHPUhKltz4DJFTB5vqvF
 hThWEzmOOfsKG1YAK/+IKK9GGuQGbmcP6h8TlzxN/O4D6TzVb9pi6NPX6hKCk+DUpHL4
 0k47pSB9gCoHwD9YjICcJQOegmti6N3yiXYAXJR8aXWFwyxVJAueDwrEZBt8xmaoJrUJ
 kKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691636625; x=1692241425;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/mqIn1UxvvxNgWiVAxgUjE9nunV+x1Ajw+4mnlJTJ2U=;
 b=A/9xQL62gJxmZh2gXkPmTQJbR4AlmPihUMeT9T/0RM94iahun3q+JkFI6lRDJW3LnT
 eIGLqSbzB77wZiAMeTg1WtClS0rr8a826atqhW6QCPlgFbgcnmYdOtdpdiu3nqnKN9LP
 MW9gcTYeEy1uEo8ZeRI8uGC47uQcUOYkFcYxv4JpSv6aSavcaRdMxjGRTP8kgr1GxYkV
 8FZ7h4vFLY3dX2sZ/jV4zlrkysFc8s3epy3dHcR/6dojFwcHBt0MSTvjqjDvurO6xTiN
 4kqHm5PK5h0mcf1p1IE9/qU0oDaOwUyIGMXYYcUq3hag7R/14futugbNfB2U8Ho1wJ57
 hBdg==
X-Gm-Message-State: AOJu0YzqBUgHsZ+WExhanFiKhp3IFlloGyAnolLiPulBx6fedwbP1kCa
 snIRjXP0JGmJ9ebbQFPpxjo=
X-Google-Smtp-Source: AGHT+IF5FU/JqU6UdZo+3G+ycZQ/zMVVJwtMWzxJGHt8Fe4jF3F8mmZ5iIWq3IoZaC0yDjckn2dghg==
X-Received: by 2002:a05:6808:14c8:b0:3a7:8a1:9cdd with SMTP id
 f8-20020a05680814c800b003a708a19cddmr1414926oiw.28.1691636624853; 
 Wed, 09 Aug 2023 20:03:44 -0700 (PDT)
Received: from [192.168.0.105] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090a2ac800b0026307fa0442sm2334344pjg.49.2023.08.09.20.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 20:03:44 -0700 (PDT)
Message-ID: <4b0c06ba-b05c-071c-d494-67775bd7250f@gmail.com>
Date: Thu, 10 Aug 2023 10:03:38 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Peter Bottomley <peebee@gmx.com>,
 peter@peebee.org.uk
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: System (Xeon Nvidia) hangs at boot terminal after kernel 6.4.7
Content-Type: text/plain; charset=UTF-8
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
Cc: Linux Nouveau <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Kernel 6.4.6 compiled from source worked AOK on my desktop with Intel Xeon cpu and Nvidia graphics - see below for system specs.
> 
> Kernels 6.4.7 & 6.4.8 also compiled from source with identical configs hang with a frozen boot terminal screen after a significant way through the boot sequence (e.g. whilst running /etc/profile). The system may still be running as a sound is emitted when the power button is pressed (only way to escape from the system hang).
> 
> The issue seems to be specific to the hardware of this desktop as the problem kernels do boot through to completion on other machines.
> 
> A test was done with a different build (from Porteus) of kernel 6.5-RC4 and that did not hang - but kernel 6.4.7 from the same builder hung just like my build.
> 
> I apologise that I cannot provide any detailed diagnostics - but I can put diagnostics into /etc/profile and provide screenshots if requested.
> 
> Forum thread with more details and screenshots:
> https://forum.puppylinux.com/viewtopic.php?p=95733#p95733
> 
> Computer Profile:
>  Machine                    Dell Inc. Precision WorkStation T5400   (version: Not Specified)
>  Mainboard                  Dell Inc. 0RW203 (version: NA)
>  • BIOS                     Dell Inc. A11 | Date: 04/30/2012 | Type: Legacy
>  • CPU                      Intel(R) Xeon(R) CPU E5450 @ 3.00GHz (4 cores)
>  • RAM                      Total: 7955 MB | Used: 1555 MB (19.5%) | Actual Used: 775 MB (9.7%)
>  Graphics                   Resolution: 1366x768 pixels | Display Server: X.Org 21.1.8
>  • device-0                 NVIDIA Corporation GT218 [NVS 300] [10de:10d8] (rev a2)
>  Audio                      ALSA
>  • device-0                 Intel Corporation 631xESB/632xESB High Definition Audio Controller [8086:269a] (rev 09)
>  • device-1                 NVIDIA Corporation High Definition Audio Controller [10de:0be3] (rev a1)
>  Network                    wlan1
>  • device-0                 Ethernet: Broadcom Inc. and subsidiaries NetXtreme BCM5754 Gigabit Ethernet PCI Express [14e4:167a] (rev 02)

See Bugzilla for the full thread.

FYI, this is stable-specific regression since it doesn't appear on mainline.
Also, I have asked the reporter to also open the issue on gitlab.freedesktop.org
tracker (as it is the standard for DRM subsystem).

To the reporter (on To: list): It'd been great if you also have netconsole
output on your Bugzilla report, providing that you have another machine
connecting to your problematic one.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: v6.4.6..v6.4.7 https://bugzilla.kernel.org/show_bug.cgi?id=217776
#regzbot link: https://forum.puppylinux.com/viewtopic.php?p=95733#p95733

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217776

-- 
An old man doll... just what I always wanted! - Clara
