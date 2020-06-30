Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D356220F14A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C91C89E41;
	Tue, 30 Jun 2020 09:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9272F89E41
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593508432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPsNaqJIh5cyrMLDehUMPdvlmkZzEG/juxPh4KB5ubI=;
 b=EisD40EFyjpwVHxwIhNg6alYg/agqV8C0VACvTvt3O1NnwDRDKkFKVfymGXQagfoFPIHZS
 R0BTCpaVnSYPbUNiaVQxVY2QW3QTMRGSxlZ2qSSsWJc4yvDxpHEcQWymDyHbfdbpfyVxxQ
 tx7C6KzMOts3tLoOQVuPfUodXaSZZ5s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-MSwiCEzpOSKboswZWB9C1g-1; Tue, 30 Jun 2020 05:13:51 -0400
X-MC-Unique: MSwiCEzpOSKboswZWB9C1g-1
Received: by mail-ed1-f72.google.com with SMTP id a21so16617181edy.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JPsNaqJIh5cyrMLDehUMPdvlmkZzEG/juxPh4KB5ubI=;
 b=EpXv0okap3DHIyQxTcwAxEd+YYRFonqMxOAdja8ylT3sn7lQQ0lnv4G2R0duWL9keg
 FBJqBtmw/wdqT56hZRC2ScrfR4SCODasoAdC8wHUE3mtcP8MPAtHynStRnHKFUvD/I7k
 rIRXVWB0FoDs6/negw95/fRd3EDwcJAtpp9mb4aPNaXNjDK10dNUzt1w6yywxhog6xoP
 ZJl1VICy59KGbhqc7sbtcSvKnn/YXphDKaA14wzAwiFQ7mJY8DF7rnJYHQnER9RtuYum
 I1AGNAg3fjcnj/bg/Nb735lhGbocgGb+yCPJC9+2GCF/5Te/7oiPiVBTHBxGHYWr0s15
 f8vg==
X-Gm-Message-State: AOAM532AU1Xkf9lhZfJs0Snowy6KxDp/HmJy7alDkUo83Kdp9XcyO24z
 LqfoBQST+MBG8Mwhe1aq2jm9AI+8VQ2ONNyJDaZyJ7IK31My6L/oV7x3ubY6l+dg2sA+P83WB/D
 cIUbmr/PaYo857eu0gRJwj097MkcE
X-Received: by 2002:a17:906:1e85:: with SMTP id
 e5mr9703839ejj.76.1593508429467; 
 Tue, 30 Jun 2020 02:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIVCl3zEyMOK+9dKK37tifwNjnrdPOzMfjmxYJFrmrgs9As9hGJvPNDf+ETXi51uEeE45zrw==
X-Received: by 2002:a17:906:1e85:: with SMTP id
 e5mr9703823ejj.76.1593508429239; 
 Tue, 30 Jun 2020 02:13:49 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y11sm1530410ejw.63.2020.06.30.02.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 02:13:48 -0700 (PDT)
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <74765a16-34f2-329a-3991-0a431abd6ff4@redhat.com>
Date: Tue, 30 Jun 2020 11:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/30/20 11:06 AM, Daniel Vetter wrote:
> On Mon, Jun 29, 2020 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
>>> This patchset adds support for simple-framebuffer platform devices and
>>> a handover mechanism for native drivers to take-over control of the
>>> hardware.
>>>
>>> The new driver, called simplekms, binds to a simple-frambuffer platform
>>> device. The kernel's boot code creates such devices for firmware-provided
>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
>>> loader sets up the framebuffers. Description via device tree is also an
>>> option.
>>>
>>> Simplekms is small enough to be linked into the kernel. The driver's main
>>> purpose is to provide graphical output during the early phases of the boot
>>> process, before the native DRM drivers are available. Native drivers are
>>> typically loaded from an initrd ram disk. Occationally simplekms can also
>>> serve as interim solution on graphics hardware without native DRM driver.
>>
>> Cool, thank you for doing this, this is a very welcome change,
>> but ... (see below).
>>
>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
>>> simplefb, for early-boot graphical output. However fbdev is deprecated and
>>> the drivers do not provide DRM interfaces for modern userspace.
>>>
>>> Patches 1 and 2 prepare the DRM format helpers for simplekms.
>>>
>>> Patches 3 to 7 add the simplekms driver. It's build on simple DRM helpers
>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
>>> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
>>> to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
>>> regulators. It's based on the simplefb drivers, but has been modified for
>>> DRM.
>>>
>>> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
>>> framebuffer's I/O-memory range and provides a callback function to be
>>> removed by a native driver. The native driver will remove simplekms before
>>> taking over the hardware. The removal is integrated into existing helpers,
>>> so drivers use it automatically.
>>>
>>> I tested simplekms with x86 EFI and VESA framebuffers, which both work
>>> reliably. The fbdev console and Weston work automatically. Xorg requires
>>> manual configuration of the device. Xorgs current modesetting driver does
>>> not work with both, platform and PCI device, for the same physical
>>> hardware. Once configured, X11 works.
>>
>> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just go
>> around and break userspace. OTOH this does seem like an userspace issue
>> and not something which we can (or should try to) fix in the kernel.
>>
>> I guess the solution will have to be to have this default to N for now
>> in Kconfig and clearly mention in the Kconfig help text that this needs
>> a fixed Xorg modesetting driver before it can be enabled.
>>
>> Any chance you have time to work on fixing the Xorg modesetting driver
>> so that this will just work with the standard Xorg autoconfiguration
>> stuff?
> 
> Hm, why do we even have both platform and pci drivers visible at the
> same time? I thought the point of this is that simplekms is built-in,
> then initrd loads the real drm driver, and by the time Xorg is
> running, simplekms should be long gone.
> 
> Maybe a few more details of what's going wrong and why to help unconfuse me?

I guess that Thomas deliberately disabled the normal kms driver to test this.

Still we should make sure that this (Xorg on simpledrm) works, a user might
see this because of running an older kernel with a newer GPU, or when
using the nvidia binary and thus having nouveau disabled and then installing
a newer kernel which breaks the dkms nvidia module building because of API
changes.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
