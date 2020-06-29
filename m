Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8920CDA6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 11:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C8289F3B;
	Mon, 29 Jun 2020 09:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC9C89F3B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593423542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7ru80Xuhrpvz+a+Wg1Lsi6BcSsR20WQgLQl/yb2O7c=;
 b=DuW85i8ZP9PrRHlvsZOAjWJF7QykYXFsqWO9uNUlIId13fkG4JbyYvRZfyQlKPwoEAaATq
 FgzMXo8Gb9d59e+ro9bFcBmSVnXgu9Xxq28j8ZdbcpRziaqrMNsBRvVIepgm88yf8Q0rYc
 JkT+1D+b9v5lPpJljArI2v5cRP0VRNw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-0RUtcvjPMrOXuiLBSVreJw-1; Mon, 29 Jun 2020 05:38:57 -0400
X-MC-Unique: 0RUtcvjPMrOXuiLBSVreJw-1
Received: by mail-ej1-f72.google.com with SMTP id b14so10758298ejv.14
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 02:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+7ru80Xuhrpvz+a+Wg1Lsi6BcSsR20WQgLQl/yb2O7c=;
 b=V7K15RS5xuFxnB9eDLxoQimUcUZr2CRYGhPfH87N0p1J0BASD3iuZ+IpAy0a53Kgah
 O78MOQUIbKy7QEMHJFXKgEKsT1L69K+NySBJzh2f2LZ7hNf/vz2r3oIGBET2WZsIHIYg
 5a2YVwk6GLtJgLqptImUk/M9H0tNjhPhxfgBr7YUWPpEk6vIMIYPZkHGPvUbDzJFlu6o
 l5mztUA5LNnLL86g7EvvkEd4NHiVoI4rt60ovXIYULvNjEj8T0wHsqmxbjVW5QqUUWge
 1hUkxV1FXREWUZAvPVNbI7qCWVJXPs5rNO5HcyMdrDQnNVjqHCWKeDqKwPAoPThW44QU
 1VQg==
X-Gm-Message-State: AOAM5307IJ0HyEh8yUuHakdAqQ+WF8305J4zOfETvusDJPapcifpTmYO
 Zya2JpkB1sdJwvIoT/eVS1pPJlgdIeRxhX+5dBNyTz4tX/xpO89z7gLx20c9LpbBgOpZDxVhLZC
 /Ho53vrs8Kkf1AgjTwoQpsaEEl/6l
X-Received: by 2002:a17:906:2b12:: with SMTP id
 a18mr13017685ejg.186.1593423535732; 
 Mon, 29 Jun 2020 02:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwthfD9C0w4wr8MwBbFdDmrCVNwX8cPF43Wf2eSblNSsAVEBVF7UarFOEBk2gO+DZOewOTrsw==
X-Received: by 2002:a17:906:2b12:: with SMTP id
 a18mr13017666ejg.186.1593423535445; 
 Mon, 29 Jun 2020 02:38:55 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id c9sm20821183edv.8.2020.06.29.02.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:38:54 -0700 (PDT)
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, sam@ravnborg.org, emil.l.velikov@gmail.com,
 noralf@tronnes.org, geert+renesas@glider.be
References: <20200625120011.16168-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
Date: Mon, 29 Jun 2020 11:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625120011.16168-1-tzimmermann@suse.de>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
> This patchset adds support for simple-framebuffer platform devices and
> a handover mechanism for native drivers to take-over control of the
> hardware.
> 
> The new driver, called simplekms, binds to a simple-frambuffer platform
> device. The kernel's boot code creates such devices for firmware-provided
> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> loader sets up the framebuffers. Description via device tree is also an
> option.
> 
> Simplekms is small enough to be linked into the kernel. The driver's main
> purpose is to provide graphical output during the early phases of the boot
> process, before the native DRM drivers are available. Native drivers are
> typically loaded from an initrd ram disk. Occationally simplekms can also
> serve as interim solution on graphics hardware without native DRM driver.

Cool, thank you for doing this, this is a very welcome change,
but ... (see below).

> So far distributions rely on fbdev drivers, such as efifb, vesafb or
> simplefb, for early-boot graphical output. However fbdev is deprecated and
> the drivers do not provide DRM interfaces for modern userspace.
> 
> Patches 1 and 2 prepare the DRM format helpers for simplekms.
> 
> Patches 3 to 7 add the simplekms driver. It's build on simple DRM helpers
> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
> to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
> regulators. It's based on the simplefb drivers, but has been modified for
> DRM.
> 
> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
> framebuffer's I/O-memory range and provides a callback function to be
> removed by a native driver. The native driver will remove simplekms before
> taking over the hardware. The removal is integrated into existing helpers,
> so drivers use it automatically.
> 
> I tested simplekms with x86 EFI and VESA framebuffers, which both work
> reliably. The fbdev console and Weston work automatically. Xorg requires
> manual configuration of the device. Xorgs current modesetting driver does
> not work with both, platform and PCI device, for the same physical
> hardware. Once configured, X11 works.

Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just go
around and break userspace. OTOH this does seem like an userspace issue
and not something which we can (or should try to) fix in the kernel.

I guess the solution will have to be to have this default to N for now
in Kconfig and clearly mention in the Kconfig help text that this needs
a fixed Xorg modesetting driver before it can be enabled.

Any chance you have time to work on fixing the Xorg modesetting driver
so that this will just work with the standard Xorg autoconfiguration
stuff?

> One cosmetical issue is that simplekms's device file is card0 and the
> native driver's device file is card1. After simplekms has been kicked out,
> only card1 is left. This does not seem to be a practical problem however.
> 
> TODO/IDEAS:
> 
> 	* provide deferred takeover

I assume you mean akin to CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER ?
I don't think you need to do anything for that, as long as you just
leave the fb contents intact until requested to change it.

Right now with flickerfree boot we have fbcon on top of efifb and
efifb does not do anything special wrt
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
ATM it does draw/restore the ACPI BGRT logo since since some firmwares
don't draw that themselves, but that is not necessary in most cases
and other then that all the deferred takeover magic is in the fbcon
code, it does not bind to the fbdev (and thus does not draw to it)
until the first time the kernel tries to output text to the console,
together with the "quiet" kernel commandline argument that ensures
that the fb is kept unmodified until e.g. a panic happens.

With simplekms we would replace "fbcon on top of efifb" with
"fbcon on top of emulated-fbdev on top of simplekms" so as long
as the emulated-fbdev and simplekms code defer from say clearing
the screen to black, but keep it as is. Then the fb contents
should be preserved until fbcon decides to takeover the fbdev
and draw to it.

> 	* provide bootsplash DRM client

Hmm, I guess this might be interesting for simple cases, but
although I would love to kill plymouth (I've become one of the
upstream maintainers for it) I'm afraid it is not that easy,
it does a bunch of stuff which will be tricky to do in the kernel:

1) Ask the user for diskcrypt passwords:
https://ic.pics.livejournal.com/hansdegoede/13347631/1496/1496_900.png

2) Show a nice splash + progressbar when installing updates in
offline updates mode:
https://ic.pics.livejournal.com/hansdegoede/13347631/899/899_900.png

Still this would be nice for the non diskcrypt case I guess, then
we could not use plymouth during normal boot and only use it
for offline updates and it would also be nice for various embedded
cases.

Regards,

Hans





> 	* make simplekms usable with ARM-EFI fbs
> 
> Thomas Zimmermann (9):
>    drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
>    drm/format-helper: Add blitter functions
>    drm: Add simplekms driver
>    drm/simplekms: Add fbdev emulation
>    drm/simplekms: Initialize framebuffer data from device-tree node
>    drm/simplekms: Acquire clocks from DT device node
>    drm/simplekms: Acquire regulators from DT device node
>    drm: Add infrastructure for platform devices
>    drm/simplekms: Acquire memory aperture for framebuffer
> 
>   MAINTAINERS                            |   6 +
>   drivers/gpu/drm/Kconfig                |   6 +
>   drivers/gpu/drm/Makefile               |   1 +
>   drivers/gpu/drm/drm_format_helper.c    |  96 ++-
>   drivers/gpu/drm/drm_platform.c         | 118 ++++
>   drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
>   drivers/gpu/drm/tiny/Kconfig           |  17 +
>   drivers/gpu/drm/tiny/Makefile          |   1 +
>   drivers/gpu/drm/tiny/cirrus.c          |   2 +-
>   drivers/gpu/drm/tiny/simplekms.c       | 906 +++++++++++++++++++++++++
>   include/drm/drm_fb_helper.h            |  18 +-
>   include/drm/drm_format_helper.h        |  10 +-
>   include/drm/drm_platform.h             |  42 ++
>   13 files changed, 1217 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_platform.c
>   create mode 100644 drivers/gpu/drm/tiny/simplekms.c
>   create mode 100644 include/drm/drm_platform.h
> 
> --
> 2.27.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
