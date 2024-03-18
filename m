Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F187E848
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2A510F581;
	Mon, 18 Mar 2024 11:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hlmdLOVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA6510F5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710760303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCRrLRgzcFtsj04jmn2kcF48w7FCWYzPNjCCNXWwhN8=;
 b=hlmdLOViuolPGWd/IsZNI5nzakY4Fi3Y2G+b6SaUceH75tR5wurCCV+choVAGk2kY3q4Vy
 PYljugOfsrMBbfrj6S6+/s6S90tOIZ4x2vWFqRtPAytyMQJ+yRQc8ldSyK6wG9BVFw+uCP
 GnhGj0REFXbI/bxvFiRj7zJZFj16Vqo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-DIy9Wr8VP_2dY-ZYclv4sA-1; Mon, 18 Mar 2024 07:11:42 -0400
X-MC-Unique: DIy9Wr8VP_2dY-ZYclv4sA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a46b8564800so80412266b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 04:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710760301; x=1711365101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KCRrLRgzcFtsj04jmn2kcF48w7FCWYzPNjCCNXWwhN8=;
 b=JZXlp5PE1xqUelp80HbSFzvBjjDpdrssBhYQgnmrd+ZlmgNVgOPiVHZK/Qh+hcuVBv
 TZ/zcNMXO+wx47OO6Hh/JfhCuglA0U042/5m62r1ZHxzgaHfqApUtGO7tsWxfpiOFGOB
 KlbOxhbJL1ebWm4zvBQgnADP/YHKgoIY+28U4oJEiJ+aPo3IQWJ3a0wbn1C6Kb0NeT+A
 WHZ24UrJbcVWxuNKWwBSA7SfLwiVhb1S+JSs9af5wicAXKMhOBWQHfV+Zo4T3Q8d64ZB
 K3iUfWFqxc8cUsri2g4qhAFoSOEo53arlz6DK156GkPFQCgskdHY8rj/6uoyXKoprSrA
 pDag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFo7Y4xVmDkcpK983PBCEqF5pffPacz8itjKeRGOCpv8sMpfrHLHKPHTc2mWqn0rCbi4LUgcJtDFcH39GvQDQEzrqlk5+b6VJp3R8YXcQn
X-Gm-Message-State: AOJu0YxQeP/NN8a5JrN2FqZCcCEgwioiuAE+I/3B4UAij8xUzX+rm6v1
 jGGh2nPv3tAIfdI0Cnm3pMKopBsmZi4kfA+JpQPcapj5gPPe35+MKrn4tMwhQcN/kwy7Dh5M1AK
 CwA0rhMTTZCV/SVjx2NTWVphkgoQJhP7J3avUvrgdj6VW84qv3S4oub67HebhItTgzw==
X-Received: by 2002:a17:906:ddb:b0:a46:a1f7:156d with SMTP id
 p27-20020a1709060ddb00b00a46a1f7156dmr4019163eji.2.1710760301083; 
 Mon, 18 Mar 2024 04:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEknhYpk/UoBbIXiSyWkooZJA3/ywR9QXOka5TQQi9XFr2kwrDhiLCZltxYyDrNnVlq8/TlEA==
X-Received: by 2002:a17:906:ddb:b0:a46:a1f7:156d with SMTP id
 p27-20020a1709060ddb00b00a46a1f7156dmr4019152eji.2.1710760300703; 
 Mon, 18 Mar 2024 04:11:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 sd9-20020a170906ce2900b00a4628cacad4sm4722437ejb.195.2024.03.18.04.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 04:11:40 -0700 (PDT)
Message-ID: <281f9b71-a565-4ff3-8343-ca36d604584d@redhat.com>
Date: Mon, 18 Mar 2024 12:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v3
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Werner,

Sorry for the late reply.

On 2/22/24 2:14 PM, Werner Sembach wrote:
> Hi,
> 
> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
> 
> To recap the hopefully final UAPI for complex RGB lighting devices:
> 
> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.

Ack this sounds good.

> 
> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.

You don't need a char misc device here, you can just make this sysfs attributes on the LED class device's parent device by using device_driver.dev_groups. Please don't use a char misc device just to attach sysfs attributes to it.

Also I'm a bit unsure about most of these attributes, "use_leds_uapi" was discussed before
and makes sense. But at least for HID devices the rest of this info is already available
in sysfs attributes on the HID devices (things like vendor and product id) and since the
userspace code needs per device code to drive the kbd anyways it can also have device
specific code to retrieve all this info, so the other sysfs attributes just feel like
duplicating information. Also there already are a ton of existing hidraw userspace rgbkbd
drivers which already get this info from other places.

>     - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
> 
>     - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.

Ack, if this finds it way into some documentation (which it should) please make it
clear that this is about the "use_leds_uapi" sysfs attribute.

> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.

IMHO this is the only case where actually using a misc device makes sense, so that
you have a chardev to do the ioctls on. misc-device-s should really only be used
when you need a chardev under /dev . Since you don't need the chardev for the e.g.
hidraw case you should not use a miscdev there IMHO.

> 
>     - The actual logic interacting with this low level UAPI is implemented by a userspace driver
> 
> Implementation wise: For the creation of the misc device with the use_leds_uapi switch a helper function/macro might be useful? Wonder if it should go into leds.h, led-class-multicolor.h, or a new header file?

See above, I don't think we want the misc device for the hidraw case, at which
point I think the helper becomes unnecessary since just a single sysfs write
callback is necessary.

Also for adding new sysfs attributes it is strongly encouraged to use
device_driver.dev_groups so that the device core handled registering /
unregistering the sysfs attributes which fixes a bunch of races; and
using device_driver.dev_groups does not mix well with a helper as you've
suggested.

> 
> - Out of my head it would look something like this:
> 
> led_classdev_add_optional_misc_control(
>     struct led_classdev *led_cdev,
>     char* name,
>     char* device_type,
>     char* firmware_version_string,
>     char* serial_number,
>     void (*deregister_led)(struct led_classdev *led_cdev),
>     void (*reregister_led)(struct led_classdev *led_cdev))
> 
> Let me know your thoughts and hopefully I can start implementing it soon for one of our devices.

I think overall the plan sounds good, with my main suggested change
being to not use an unnecessary misc device for the hid-raw case.

Regards,

Hans


