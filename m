Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C405C222E71
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 00:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD56ED08;
	Thu, 16 Jul 2020 22:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506346ED09
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594937455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TEVgJ4JhQjZ31sqNGbZ6d8ZiBPexCKDIqhrWk+8SyBo=;
 b=Sm9zh0Jw9P38phiH5IhsFg457wKh8MKrvy/6YD8k3mnMqPwG9tRUxA6rCXy3newP87u6mS
 3UYVwXZR0smPXGurzZrCZ4PTXLnXhtKuqMezvw7tFi2qbDZj9HTyD1EiU9mh4HOcG4TL0U
 gG57aMejLtdGdupq062KZZSOOn8ADdI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-OwQkzoUFNNGDMxKkTX2ukA-1; Thu, 16 Jul 2020 18:10:51 -0400
X-MC-Unique: OwQkzoUFNNGDMxKkTX2ukA-1
Received: by mail-qv1-f70.google.com with SMTP id u10so4315951qvj.23
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 15:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TEVgJ4JhQjZ31sqNGbZ6d8ZiBPexCKDIqhrWk+8SyBo=;
 b=qZoIO1ez1llnsLrvz2a9WbIVOuuLDmRoc6AAmEFW5qDBCHUjyszxK3ovedo1PacsWP
 ISmG2VFncfEPMR9Om0CK8ipenVkYcaZffMA6S3puaQ997B6d18mZBbkeJjwfdUHOI1eY
 +SiPjksBxpF3SNHcniR+gtzm1M95oKjg/cvjtIbF25OsQDqm7E0CEJtTLSObczV16ZM8
 i98kgyywoKdEJfmAMY/iAWlTXjQFCdCt9hPO9Tp1334Zw0NIBekpY8u4xK1VaRjFHKGK
 +C9pYao3bk/7VZZ02v+SdpS58CxBb+p4aD2x3+Nyx7KyXspzgBbQOH6aXMv8459RBoe4
 n9Ew==
X-Gm-Message-State: AOAM531QEumPSsL8GBd9zpSoabaH9NI5WAIoRmd991bKHVgKw6749wwX
 dM286gnhmp4C6RKAS5VxFKTIErf8WS5GeQkJOPXgz8Y6cyOPM0yse9awdTYB5Mi4iN/ObcJRdtn
 qfhEppQb/RpppX7Gx8m7sxPaPs4/AEM0uM6KAiuB4ADaE
X-Received: by 2002:a37:6d4:: with SMTP id 203mr6191545qkg.62.1594937451028;
 Thu, 16 Jul 2020 15:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxYEeBzIs2bCnV423qUOLrPEFFdlKIbzBy5X5m3dvPlokO3/fmqeYPShXYfvK7oHLdpmv1M7E/0JgXl4Q6rQ4=
X-Received: by 2002:a37:6d4:: with SMTP id 203mr6191519qkg.62.1594937450726;
 Thu, 16 Jul 2020 15:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tsAEa5GXw5oeJPG=mcn+qxNvspXreJYWDJGZBy5v82JDA@mail.gmail.com>
In-Reply-To: <CACO55tsAEa5GXw5oeJPG=mcn+qxNvspXreJYWDJGZBy5v82JDA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 00:10:39 +0200
Message-ID: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
To: Linux PCI <linux-pci@vger.kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Hi everybody,
>
> with the mentioned commit Nouveau isn't able to load firmware onto the
> GPU on one of my systems here. Even though the issue doesn't always
> happen I am quite confident this is the commit breaking it.
>
> I am still digging into the issue and trying to figure out what
> exactly breaks, but it shows up in different ways. Either we are not
> able to boot the engines on the GPU or the GPU becomes unresponsive.
> Btw, this is also a system where our runtime power management issue
> shows up, so maybe there is indeed something funky with the bridge
> controller.
>
> Just pinging you in case you have an idea on how this could break Nouveau
>
> most of the times it shows up like this:
> nouveau 0000:01:00.0: acr: AHESASC binary failed
>
> Sometimes it works at boot and fails at runtime resuming with random
> faults. So I will be investigating a bit more, but yeah... I am super
> sure the commit triggered this issue, no idea if it actually causes
> it.
>

so yeah.. I reverted that locally and never ran into issues again.
Still valid on latest 5.7. So can we get this reverted or properly
fixed? This breaks runtime pm for us on at least some hardware.

> git bisect log (had to do a second bisect, that's why the first bad
> and good commits appear a bit random):
>
> git bisect start
> # bad: [a92b984a110863b42a3abf32e3f049b02b19e350] clk: samsung:
> exynos5433: Add IGNORE_UNUSED flag to sclk_i2s1
> git bisect bad a92b984a110863b42a3abf32e3f049b02b19e350
> # good: [4da858c086433cd012c0bb16b5921f6fafe3f803] Merge branch
> 'linux-5.7' of git://github.com/skeggsb/linux into drm-fixes
> git bisect good 4da858c086433cd012c0bb16b5921f6fafe3f803
> # good: [d5dfe4f1b44ed532653c2335267ad9599c8a698e] Merge tag
> 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> git bisect good d5dfe4f1b44ed532653c2335267ad9599c8a698e
> # good: [b24e451cfb8c33ef5b8b4a80e232706b089914fb] ipv6: fix
> IPV6_ADDRFORM operation logic
> git bisect good b24e451cfb8c33ef5b8b4a80e232706b089914fb
> # good: [d843ffbce812742986293f974d55ba404e91872f] nvmet: fix memory
> leak when removing namespaces and controllers concurrently
> git bisect good d843ffbce812742986293f974d55ba404e91872f
> # good: [be66f10a60e3ec0b589898f78a428bcb34095730] staging: wfx: fix
> output of rx_stats on big endian hosts
> git bisect good be66f10a60e3ec0b589898f78a428bcb34095730
> # good: [a4482984c41f5cc1d217aa189fe51bbbc0500f98] s390/qdio:
> consistently restore the IRQ handler
> git bisect good a4482984c41f5cc1d217aa189fe51bbbc0500f98
> # good: [bec32a54a4de62b46466f4da1beb9ddd42db81b8] f2fs: fix potential
> use-after-free issue
> git bisect good bec32a54a4de62b46466f4da1beb9ddd42db81b8
> # bad: [044aaaa8b1b15adb397ce423a6d97920a46b3893] habanalabs: increase
> timeout during reset
> git bisect bad 044aaaa8b1b15adb397ce423a6d97920a46b3893
> # good: [6fe8ed270763a6a2e350bf37eee0f3857482ed48] arm64: dts: qcom:
> db820c: Fix invalid pm8994 supplies
> git bisect good 6fe8ed270763a6a2e350bf37eee0f3857482ed48
> # good: [363e8bfc96b4e9d9e0a885408cecaf23df468523] tty: n_gsm: Fix
> waking up upper tty layer when room available
> git bisect good 363e8bfc96b4e9d9e0a885408cecaf23df468523
> # bad: [afaff825e3a436f9d1e3986530133b1c91b54cd1] PCI/PM: Assume ports
> without DLL Link Active train links in 100 ms
> git bisect bad afaff825e3a436f9d1e3986530133b1c91b54cd1
> # good: [be0ed15d88c65de0e28ff37a3b242e65a782fd98] HID: Add quirks for
> Trust Panora Graphic Tablet
> git bisect good be0ed15d88c65de0e28ff37a3b242e65a782fd98
> # first bad commit: [afaff825e3a436f9d1e3986530133b1c91b54cd1] PCI/PM:
> Assume ports without DLL Link Active train links in 100 ms

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
