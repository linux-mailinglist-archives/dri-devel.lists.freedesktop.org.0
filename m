Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6A60D593
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7294D10E350;
	Tue, 25 Oct 2022 20:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3910E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666729960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4P2ABpjEqSTVTEkx9cKhWwG+CP5X9PoCvvt9+EPcxqQ=;
 b=MTkkPxaTKtu/MiUIR0osdLO6KMJWMXFXamt5pavAwXjjLPAw0p4bO6YWtBxK+qVtBbfKb0
 UZnBEn+ry0JJVFoTFPAnDXaTNY4GPNL9u+itX+SUUdyH7fLA9gRNi9BLYq/gTKPXhrvubI
 y7oaZk4m6Rk50Y15Ee9REqZNCRvqYP4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-xEuzvRrRNeOFpxMUQhdRAg-1; Tue, 25 Oct 2022 16:32:38 -0400
X-MC-Unique: xEuzvRrRNeOFpxMUQhdRAg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sa6-20020a1709076d0600b0078d84ed54b9so3347031ejc.18
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 13:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4P2ABpjEqSTVTEkx9cKhWwG+CP5X9PoCvvt9+EPcxqQ=;
 b=faMeI75rAKnfA/140yvhOq1+u1gy0Jf6x+L7mn9lhNyylIB0dTTiNm9gvnnT4sd2h3
 CPUvxpYzfX2ZfREEdsIv8ON0inv3EF3eociFKfpOSemrPq7DNfaUWRlZrwCLfJQb9MgX
 S3czxvgtTDSG2cQn1/PDnc2/IM7OyPfBUKmOkKu02xPuJ0uMH5R3UyvDZXooquUGL/o+
 umLQ382BgY9vQzeViuM9QRCctmt9+1H16trqyBe9mP+JHC9dj9RKlqJP/tLdM/leh7PO
 5F1gXawZlfak+LzXaNqOkKC7/BdQoU0ZRXojTXESOjHh+FB39QVLeKJJqfpEmBH+FBdM
 qFUg==
X-Gm-Message-State: ACrzQf1dTt15WGtMbJ3sfusjTR7AtVbDjoAt3w52QFsFR/Xahy6dU/MQ
 w9McAWH5zI/as0dHlPBdIAzqgQPcltIJsUtmLtz6/ibK3xo4bgI8AtW2DLJJdTUteqbQcIJ4yQy
 lnuDYJM+djPhvsBZKyLNSupkAOzTT
X-Received: by 2002:a05:6402:a46:b0:461:ed76:cb56 with SMTP id
 bt6-20020a0564020a4600b00461ed76cb56mr8670258edb.264.1666729957454; 
 Tue, 25 Oct 2022 13:32:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rX3+ePQsTyJYF+i2iWFugymXxMZcnRY2gE9uairsp91rDdpSyc8kecBPMFXy/fx1WVWo3tg==
X-Received: by 2002:a05:6402:a46:b0:461:ed76:cb56 with SMTP id
 bt6-20020a0564020a4600b00461ed76cb56mr8670233edb.264.1666729957267; 
 Tue, 25 Oct 2022 13:32:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a1709063f8c00b0078d4e39d87esm1863438ejj.225.2022.10.25.13.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 13:32:36 -0700 (PDT)
Message-ID: <ed0f7d4a-3fa4-1be6-85fa-54dd82dce56b@redhat.com>
Date: Tue, 25 Oct 2022 22:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
From: Hans de Goede <hdegoede@redhat.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-3-hdegoede@redhat.com>
 <f914ceb3-94bd-743c-f8b6-0334086e731a@gmail.com>
 <42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com>
 <20221024203057.GA28675@srcf.ucam.org>
 <8f53b8b6-ead2-22f5-16f7-65b31f7cc05c@redhat.com>
 <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
In-Reply-To: <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi (again),

On 10/25/22 22:25, Hans de Goede wrote:
> Hi Matthew,
> 
> On 10/25/22 21:32, Matthew Garrett wrote:
>> On Tue, Oct 25, 2022 at 08:50:54PM +0200, Hans de Goede wrote:
>>
>>> That is a valid point, but keep in mind that this is only used on ACPI
>>> platforms and then only on devices with a builtin LCD panel and then
>>> only by GPU drivers which actually call acpi_video_get_backlight_type(),
>>> so e.g. not by all the ARM specific display drivers.
>>>
>>> So I believe that Chromebooks quite likely are the only devices with
>>> this issue.
>>
>> My laptop is, uh, weird, but it falls into this category.
>>  
>>>> I think for this to work correctly you need to have 
>>>> the infrastructure be aware of whether or not a vendor interface exists, 
>>>> which means having to handle cleanup if a vendor-specific module gets 
>>>> loaded later.
>>>
>>> Getting rid of the whole ping-ponging of which backlight drivers
>>> get loaded during boot was actually one of the goals of the rework
>>> which landed in 6.1 this actually allowed us to remove some quirks
>>> because some hw/firmware did not like us changing our mind and
>>> switching backlight interfaces after first poking another one.
>>> So we definitely don't want to go back to the ping-pong thing.
>>
>> Defaulting to native but then having a vendor driver be able to disable 
>> native drivers seems easiest? It shouldn't be a regression over the 
>> previous state of affairs since both drivers were being loaded already.
> 
> Part of the reason for the ACPI backlight detect refactor is
> because of a planned new backlight uAPI where the brightness
> control becomes a property on the drm connector object, for a
> RFC including the rationale behind this planned uAPI change see:
> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/
> 
> These plans require that there is only 1 backlight device
> registered (per panel).
> 
> Having the native driver come and then go and be replaced
> with the vendor driver would also be quite inconvenient
> for these planned changes.
> 
> As such I would rather find a solution for your "weird"
> laptop so that acpi_video_get_backlight_type() just always
> returns vendor there.

I just realized that your have vendor driver unregister
the native one is suggested as an alternative for
the new behavior where the i915 driver no longer
registers its native backlight in cases where
acpi_video_get_backlight_type() does not return native,
and that you probably actually want the native backlight
device, right ?

So the above should read:

"so that acpi_video_get_backlight_type() just always
returns native there."

> Note that drivers/acpi/video_detect.c already has a DMI
> quirk tables for models where the heuristics from
> acpi_video_get_backlight_type() don't work. In general
> we (mostly me) try to make it so that the heuristics
> work on most models, to avoid needing to add every model
> under the sun to the DMI quirk table, but if your laptop
> is somehow special then adding a DMI quirk for it should
> be fine ?
> 
> Can you perhaps explain a bit in what way your laptop
> is weird ?

I guess it is weird in that it does not have the ACPI video,
or at least does not offer ACPI video bus backlight control
in its ACPI tables?

Can you perhaps email me an acpidump of the laptop ?

> Note that technically if the native backlight does not work,
> then the GPU driver really should not even try to register
> it. But sometimes the video-bios-tables claim the backlight
> pwm input is attached to the GPU while it is not and things
> have evolved in such a way that the DMI quirks for that
> live in acpi/video_detect.c rather then in the GPU driver.

And this bit can be ignored then because it certainly
is not relevant if you actually want the native driver.

Regards,

Hans


