Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6A62138FB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 12:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FD56E1D2;
	Fri,  3 Jul 2020 10:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2220B6E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593773709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhxOO2gqQ0NFwuS3TIYKoJ9dJzJ+OArmtW2kW46Pl88=;
 b=PwvTL8BuxpZX0eIPTzwhfuuar7FzZSzz++RNoR8Q1Hv16CTaTsUWaq3UpTYK7QmeqkegEs
 XnIxD2lybvSNKvq+F2WBYIdqmbrV8xZvs+8ddyP2kMmh2eCWSjyqCbKJhKwaM95zOMKXgR
 fLoF76K0R9ZFqKJemN0PYwXlYX5udN4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-J5mqw_QxNc6Ss7xC2rK16A-1; Fri, 03 Jul 2020 06:55:07 -0400
X-MC-Unique: J5mqw_QxNc6Ss7xC2rK16A-1
Received: by mail-wm1-f69.google.com with SMTP id g138so25848701wme.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 03:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vhxOO2gqQ0NFwuS3TIYKoJ9dJzJ+OArmtW2kW46Pl88=;
 b=Cz7ooRbNvzpz3TQiyfWJe+g3e9xSiz9J+IL66zurU+A7hrMk8QRVwQNspm4PsZGP9a
 qhDPf2UeGRQ4tQMMEvZw13DbLj1YSCVqC6Tc114NTkUnI97NhXJVRVda6RtYfhECaV0Z
 TwF8kZuuGO2iST9xQ2eyR6msG4NkkkOb/6T6GwHtnrKkW+gfcDqtMscbx2piQvdwbDPT
 VlCdQp8K+YBsej4lmNGvgQSdzo9KljEBarai74Dpx7ed+CLEQssLsE687ZTDiT8V+wIM
 NbN9nlveoDNuHuLR9tFVzbIuUnvfYjS12LrFhOQhtkyWwZ/saWy0o24rMppxbsRzTcC4
 U8gA==
X-Gm-Message-State: AOAM532+7QJ7QZahgpVAsqsZ1UuCk4OMw0ftQmsz2wRy+woolGhm0Y/v
 roTjtkmv6f6tMLczip+9Wxaqnewwr02inzUpjlyyRKL5trucyOZhgtV3PcmummDfZfU0tfnrQra
 NxpEkay2A4nQjKmYwMY0agGcvGNuh
X-Received: by 2002:a1c:3c82:: with SMTP id
 j124mr38596094wma.155.1593773706422; 
 Fri, 03 Jul 2020 03:55:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZn0Mu0TqYY2icOkprxjZ8MyjOB0RqOqlsTKQ2IB4Pr9jCEmLxhslXB6W55Tqmn3akadO4Tw==
X-Received: by 2002:a1c:3c82:: with SMTP id
 j124mr38596061wma.155.1593773706137; 
 Fri, 03 Jul 2020 03:55:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id o9sm13785160wrs.1.2020.07.03.03.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 03:55:05 -0700 (PDT)
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
 <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>
Date: Fri, 3 Jul 2020 12:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/1/20 4:10 PM, Thomas Zimmermann wrote:
> Hi Daniel,
> 
> thanks for reviewing most of the patchset.
> 
> Am 30.06.20 um 11:06 schrieb Daniel Vetter:
>> On Mon, Jun 29, 2020 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
>>>> This patchset adds support for simple-framebuffer platform devices and
>>>> a handover mechanism for native drivers to take-over control of the
>>>> hardware.
>>>>
>>>> The new driver, called simplekms, binds to a simple-frambuffer platform
>>>> device. The kernel's boot code creates such devices for firmware-provided
>>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
>>>> loader sets up the framebuffers. Description via device tree is also an
>>>> option.
>>>>
>>>> Simplekms is small enough to be linked into the kernel. The driver's main
>>>> purpose is to provide graphical output during the early phases of the boot
>>>> process, before the native DRM drivers are available. Native drivers are
>>>> typically loaded from an initrd ram disk. Occationally simplekms can also
>>>> serve as interim solution on graphics hardware without native DRM driver.
>>>
>>> Cool, thank you for doing this, this is a very welcome change,
>>> but ... (see below).
>>>
>>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
>>>> simplefb, for early-boot graphical output. However fbdev is deprecated and
>>>> the drivers do not provide DRM interfaces for modern userspace.
>>>>
>>>> Patches 1 and 2 prepare the DRM format helpers for simplekms.
>>>>
>>>> Patches 3 to 7 add the simplekms driver. It's build on simple DRM helpers
>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
>>>> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
>>>> to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
>>>> regulators. It's based on the simplefb drivers, but has been modified for
>>>> DRM.
>>>>
>>>> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
>>>> framebuffer's I/O-memory range and provides a callback function to be
>>>> removed by a native driver. The native driver will remove simplekms before
>>>> taking over the hardware. The removal is integrated into existing helpers,
>>>> so drivers use it automatically.
>>>>
>>>> I tested simplekms with x86 EFI and VESA framebuffers, which both work
>>>> reliably. The fbdev console and Weston work automatically. Xorg requires
>>>> manual configuration of the device. Xorgs current modesetting driver does
>>>> not work with both, platform and PCI device, for the same physical
>>>> hardware. Once configured, X11 works.
>>>
>>> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just go
>>> around and break userspace. OTOH this does seem like an userspace issue
>>> and not something which we can (or should try to) fix in the kernel.
>>>
>>> I guess the solution will have to be to have this default to N for now
>>> in Kconfig and clearly mention in the Kconfig help text that this needs
>>> a fixed Xorg modesetting driver before it can be enabled.
>>>
>>> Any chance you have time to work on fixing the Xorg modesetting driver
>>> so that this will just work with the standard Xorg autoconfiguration
>>> stuff?
>>
>> Hm, why do we even have both platform and pci drivers visible at the
>> same time? I thought the point of this is that simplekms is built-in,
>> then initrd loads the real drm driver, and by the time Xorg is
>> running, simplekms should be long gone.
>>
>> Maybe a few more details of what's going wrong and why to help unconfuse me?
> 
> I tested simplekms with PCI graphics cards.
> 
> Xorg does it's own scanning of the busses. It supports a platform bus,
> where it finds the simple-framebuffer device that is driven by
> simplekms. Xorg also scans the PCI bus, where is finds the native PCI
> device; usually driven by the native driver. It's the same hardware, but
> on different busses.
> 
> For each device, Xorg tries to configure a screen, the Xorg modeset
> driver tried to open the DRM device file and acquire DRM master status
> on it. This works for the first screen, but DRM master status can only
> be acquired once, so it fails for the second screen. Xorg then aborts
> and asks for manual configuration of the display device.
> 
> This can be solved by setting the platform device's bus id in the
> xorg.conf device section. It just doesn't happen automatically.
> 
> I found it hard to find a solution to this. Weston just opens a DRM
> device file and uses whatever it gets. Ideally, Xorg would do the same.
> That whole bus-scanning exercise gives it a wrong idea on which graphics
> devices are available.
> 
> One idea for a fix is to compare the device I/O-memory ranges and filter
> out duplicates on the Xorg modeset driver. I don't know how reliable
> this works in practice or if their are false positives.

I think that this should work nicely, although I wonder how Xorg will
get the memory-range for the simplefb platform device, it looks like
it will need to parse /dev/iomem for this, or we need to add a
new sysfs attr to the simplefb device for this. Adding the new sysfs
attr has the added bonus that we only enable the duplicate based
resource check for simplefb devices.

Hmm, I think we can actually fix this quite simply, for the platform
device, check the basename of where the
/sys/bus/platform/devices/XXXX/driver symlink points to and if it
is simplekms ignore it, assuming that there will be another PCI
or platform device which is the actual GPU.

I guess that might cause a problem where the output-device driven
through simplekms is not visible to Xorg in any other way, but
I don't think that that ever happens?  And even if it does, then it
is probably better to teach Xorg about it, since we likely want to
replace simplekms with a more full-featured driver at some point
anyways.

Can you try commenting out the platform bus scanning code in Xorg's
autoconfigure code and see if that fixes the no Xorg.conf case ?

If it does the driver symlink trick will probably fix 99.9 %
of all cases here, and we can worry about the others if we
ever encounter them.

> A more fundamental solution is to introduce a DRM bus in Xorg that
> enumerates all available DRM device files. If there are any, no other
> busses would be scanned.

That would break the case where there are 2 cards and 1 has a kms
driver and the other only supports fbdev. Admittedly this is a
corner case, but I do believe that we cannot just go and break this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
