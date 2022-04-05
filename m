Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC184F343C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EDF10E917;
	Tue,  5 Apr 2022 13:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865D10E911
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649165150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVwNzNitG33HKNZ/ddogzhAKEzWphu605lg3oK1brLg=;
 b=hMf5rBNxfkMM2V8frQoa1xQ8stqOCpjX7Nhjn/HWhQpP39KXUcegOzd0COkdGLEUibLiAw
 yKggbuHrgRVdvhGLrEp0CxBsjdkyDawFuCaCZsx3nzVBZSyoxeTnmvYXnhuziI8HS1/Fp2
 NPGdOxRULn2Ge6P6vvi0cf6MdLJ/y5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-X8pQkel6PryQOP87usqPhQ-1; Tue, 05 Apr 2022 09:25:49 -0400
X-MC-Unique: X8pQkel6PryQOP87usqPhQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so2456691wrg.19
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 06:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AVwNzNitG33HKNZ/ddogzhAKEzWphu605lg3oK1brLg=;
 b=gZuse6hnkOshrF5f+N41CxfzWI+u1lIjFZxI1pmw3mEKYLxUvz2HK2LMw052PKwFZA
 dnkj7T6b5aR+8LFyN6xsW9dB8YHU+hCu5L/ONfk8NFhfKjDhF+a2jRSweyaCxbqwyBif
 GHk13yYE4TPPo7BRqvAKjxdjtxLyXc32rhYeM4y+eu9F20C2Ve0Nz61OdeIuIZyDh7Rz
 2OKO0KtOrs9QROxEVeetkSZp6i3p86tlE91TqYtv9xE58SlG8xZqdMRqq7NAwNvxmtgF
 Rfxors2Id9ijZZ1xRiWYdwmn8PRT549SnQK/IQ0jJ831DXqc6emBpwi/AkqilFMg7FJf
 /wlA==
X-Gm-Message-State: AOAM532W5C1U23pEDHGpwOUq3M7507znhEXGnbBF6X4IBgnP2MVdTmrs
 dhAqFb6/olwtc3JGmxPsK9VasLA6A7ueNFTGGijIiuwEgEIlVe4S4/vXW0OZYzlA14GomqhfEl7
 eq2jKoq8ZeXHlwj26mC+du7Ba4sD4
X-Received: by 2002:adf:a394:0:b0:206:1cfd:13f6 with SMTP id
 l20-20020adfa394000000b002061cfd13f6mr2933792wrb.604.1649165148404; 
 Tue, 05 Apr 2022 06:25:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywL4YFUMFLKEGNJyDnDhZAXs0fvhVQ+PmfmqjWs4+T5znYDxv/BEV3ZRmK9KLv1H6lO/13xA==
X-Received: by 2002:adf:a394:0:b0:206:1cfd:13f6 with SMTP id
 l20-20020adfa394000000b002061cfd13f6mr2933768wrb.604.1649165148093; 
 Tue, 05 Apr 2022 06:25:48 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b0038cbdf5221dsm2294778wmq.41.2022.04.05.06.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 06:25:47 -0700 (PDT)
Message-ID: <54f4cb72-1640-939d-0b7b-9a1b989cd5eb@redhat.com>
Date: Tue, 5 Apr 2022 15:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
To: Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local> <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
 <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com>
 <CAKMK7uHf6H8mhSm6eDHUruWK5Xc2cSPkJUX6v-jpeQfjS19dKw@mail.gmail.com>
 <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
 <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/22 12:34, Daniel Vetter wrote:
> On Tue, 5 Apr 2022 at 11:52, Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[snip]

>>
>> I believe the correct fix would be for the fbdev core to keep a list of
>> the apertures struct that are passed to remove_conflicting_framebuffers(),
>> that way it will know what apertures are not available anymore and prevent
>> to register any fbdev framebuffer that conflicts with one already present.
> 
> Hm that still feels like reinventing a driver model, badly.
>

Yeah, you are correct.
 
> I think there's two cleaner solutions:
> - move all the firmware driver platform_dev into sysfb.c, and then
> just bind the special cases against that (e.g. offb, vga16fb and all
> these). Then we'd have one sysfb_try_unregister(struct device *dev)
> interface that fbmem.c uses.

I think this is the cleaner option. And makes sense to consolidate all
the firmware drivers platform device registration to sysfb.c.

Already does for VIDEO_TYPE_EFI ("efi-framebuffer") and VIDEO_TYPE_VLFB
("vesa-framebuffer"), so need to also make it cope with VIDEO_TYPE_EGAC
and VIDEO_TYPE_VGAC ("vga16fb").

For offb is less clear since currently the offb driver does not really
use the Linux device model, that is the driver does not match a device
that's registered, there's no device which is the bug that was reported
to Thomas in the other thread.

It's unclear how to properly fix that since we will need to convert the
offb driver to register a platform driver and match against a device that
is registered by some platform code that parses the OF...

> - let fbmem.c call into each of these firmware device providers, which
> means some loops most likely (like we can't call into vga16fb), so
> probably need to move that into fbmem.c and it all gets a bit messy.
> 

Yup, that would get messy indeed so not a good option.

>> Let me know if you think that makes sense and I can attempt to write a fix.
> 
> I still think unregistering the platform_dev properly makes the most
> sense, and feels like the most proper linux device model solution
> instead of hacks on top - if the firmware fb is unuseable because a
> native driver has taken over, we should nuke that. And also the
> firmware fb driver would then just bind to that platform_dev if it
> exists, and only if it exists. Also I think it should be the
> responsibility of whichever piece of code that registers these
> platform devices to ensure that platform_dev actually still exists.
> That's why I think pushing all that code into sysfb.c is probably the
> cleanest solution.
>

Agreed. Not registering the platform devices if there is already a DRM
driver for the same device is what makes the most sense. What I don't
understand is how sysfb would know that if run after a DRM registration.

The only way that could know is if sysfb would keep a list of apertures
for all the DRM drivers registered or if the DRM core somewhat notifies
to sysfb that a native driver was already registered.

Another option and probably the cleanest although the harder solution is
to finally bite the bullet and make all the DRM drivers to request their
memory region.

Or as you mentioned in the past, to move that logic into the device model
and then not allow to register devices that require an overlapping region.

And there could be a request_mem_region_remove_conflicting() or something
that real DRM drivers could use to force a memory region request and make
the device model to unregister any device that may already have that mem.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

