Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7FE5B3AD1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9A10EDD9;
	Fri,  9 Sep 2022 14:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D8F10EDD9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662734347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfeqREWZa2fIbuJz7HqverwIC0Dsg+GN4EgIU9IhkpI=;
 b=ULow2RkyTRtMltRy6u8ji/veoKdUtBrZW0hDFJZK6DJf6SaIyV8GWEEIFi4I0VQeYScFa9
 LUKZT1p21qr2/2gZyiqNPbCJDjZi4wbrQxy9TvW3N9+TNgKSGgs5ZpBvR1ss3FKK6NiMXJ
 XrtMbPd7oshI6zwyuCIlIniypQfxeLo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-E748vzdxOiqQaqKi90TCKQ-1; Fri, 09 Sep 2022 10:39:06 -0400
X-MC-Unique: E748vzdxOiqQaqKi90TCKQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 b16-20020a056402279000b0044f1102e6e2so1442808ede.20
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 07:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mfeqREWZa2fIbuJz7HqverwIC0Dsg+GN4EgIU9IhkpI=;
 b=Fm4ofvT8evIJ7Vt8TlNSYCvnjfmndoA9vLjsX2VTy1hAakooWKGbihBq0yBMdj/jp0
 tfWLFVgweQCp3RgkFln5s16lP8jaiOaq5eeOa+hxPEBTR/7nglgMY6HuEQOQNOxjCqXI
 Rswh+SGl6Z8XdoHdZpwHrYOle2fqYXF5ilR4SQ8Uo8bFt6WsR0t+u7SsSNXYPR1mRRZ1
 c6wBwBuUSOeO6shcvFg+OdnY+EBDElXp7tna2y49teFDJEYTO/3+Whjbl5bl/Q1Dtk80
 0/KuPUUp0bzwZrnVouanl9dSvWXGSKMDZQxncdVlglKKMjvMRiPhx4o4WcKKxjoeRiw0
 R4zQ==
X-Gm-Message-State: ACgBeo3Huib326fyh/pgo5zTRfviLj1QKoWjhooC6ztT2DGkZ2/4GHpA
 bw2OQGzTk1f73E4oGrzYTkRKQeQid09wejd7ygjtS7/ifrDdpH6dYWOkLAS9ktK7yzJODXA/Llb
 GmsOhdIGtFQzfsB2+IYciwaU8edLx
X-Received: by 2002:aa7:c61a:0:b0:44e:7d1d:7814 with SMTP id
 h26-20020aa7c61a000000b0044e7d1d7814mr11620487edq.44.1662734345370; 
 Fri, 09 Sep 2022 07:39:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xB6x3ayxSbngTByD9x5Rtd05MZz+84q29GXxlw+/2OJo0zzdpP6qnmdnlvyNSEQCIEmaGeQ==
X-Received: by 2002:aa7:c61a:0:b0:44e:7d1d:7814 with SMTP id
 h26-20020aa7c61a000000b0044e7d1d7814mr11620464edq.44.1662734345154; 
 Fri, 09 Sep 2022 07:39:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6?
 (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a17090791d200b007308bdef04bsm352871ejz.103.2022.09.09.07.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 07:39:04 -0700 (PDT)
Message-ID: <0d876c8e-234e-7e0f-bb5c-862408f9828f@redhat.com>
Date: Fri, 9 Sep 2022 16:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: Simon Ser <contact@emersion.fr>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <KBKl__LKqWb8-i0ErjSYiqJRJOf2AK48SVFIvyOYM-aGG_uZOal8BAm3VbkFJHc6Vquz1mFNugZkoFyz490r6N5UIM1a8JthAgFyDnQBtqk=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <KBKl__LKqWb8-i0ErjSYiqJRJOf2AK48SVFIvyOYM-aGG_uZOal8BAm3VbkFJHc6Vquz1mFNugZkoFyz490r6N5UIM1a8JthAgFyDnQBtqk=@emersion.fr>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/9/22 15:39, Simon Ser wrote:
> On Friday, September 9th, 2022 at 12:12, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Phase 3: Deprecate /sys/class/backlight uAPI
>> ============================================
>>
>> Once most userspace has moved over to using the new drm_connector
>> brightness props, a Kconfig option can be added to stop exporting
>> the backlight-devices under /sys/class/backlight. The plan is to
>> just disable the sysfs interface and keep the existing backlight-device
>> internal kernel abstraction as is, since some abstraction for (non GPU
>> native) backlight devices will be necessary regardless.
>>
>> It is unsure if we will ever be able to do this. For example people using
>> non fully integrated desktop environments like e.g. sway often use custom
>> scripts binded to hotkeys to get functionality like the brightness
>> up/down keyboard hotkeys changing the brightness. This typically involves
>> e.g. the xbacklight utility.
>>
>> Even if the xbacklight utility is ported to use kms with the new connector
>> object brightness properties then this still will not work because
>> changing the properties will require drm-master rights and e.g. sway will
>> already hold those.
> 
> I replied to this here in another thread [1].
> 
> tl;dr I think it would be fine even for Sway-like compositors.

Ok, that is good to know.

> (Also note the utilities used right now are not xbacklight, but
> brightnessctl/light/brillo/etc [2])

Ah I thought that xbacklight got patched at one point to support
the sysfs API, but I see now that instead alternative utilities
have popped up.

Regards,

Hans


> 
> [1]: https://lore.kernel.org/dri-devel/bZJU9OkYWFyaLHVa4XUE4d5iBTPFXBRyPe1wMd_ztKh5VBMu-EDNGoUDpvwtFn_u9-JMvN8QmIZVS3pzMZM_hZTkTCA9gOBnCGXc5HFmsnc=@emersion.fr/
> [2]: https://github.com/swaywm/sway/wiki#xbacklight
> 
>> The drm_connector brightness properties
>> =======================================
>>
>> The new uAPI for this consists of 2 properties:
>>
>> 1. "display brightness": rw 0-int32_max property controlling the brightness setting
>> of the connected display. The actual maximum of this will be less then
>> int32_max and is given in "display brightness max".
>>
>> Unlike the /sys/class/backlight/foo/brightness this brightness property
>> has a clear definition for the value 0. The kernel must ensure that 0
>> means minimum brightness (so 0 should never turn the backlight off).
>> If necessary the kernel must enforce a minimum value by adding
>> an offset to the value seen in the property to ensure this behavior.
>>
>> For example if necessary the driver must clamp 0-255 to 10-255, which then
>> becomes 0-245 on the brightness property, adding 10 internally to writes
>> done to the brightness property. This adding of an extra offset when
>> necessary must only be done on the brightness property,
>> the /sys/class/backlight interface should be left unchanged to not break
>> userspace which may rely on 0 = off on some systems.
>>
>> Note amdgpu already does something like this even for /sys/class/backlight,
>> see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
>>
>> Also whenever possible the kernel must ensure that the brightness range
>> is in perceived brightness, but this cannot always be guaranteed.
>>
>>
>> 2. "display brightness max": ro 0-int32_max property giving the actual maximum
>> of the display's brightness setting. This will report 0 when brightness
>> control is not available.
>>
>> The value of "display brightness max" may change at runtime, either by
>> a legacy drivers/platform/x86 backlight driver loading after the drm
>> driver has loaded; or when plugging in a monitor which allows brightness
>> control over DDC/CI. In both these cases the max value will change from 0
>> to the actual max value, indicating backlight control has become available
>> on this connector.
> 
> The kernel will need to ensure that a hotplug uevent is sent to
> user-space at this point. Otherwise user-space has no way to figure out
> that the prop has changed.
> 
> Overall this all looks very solid to me!
> 
> Simon
> 

