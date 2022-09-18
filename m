Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07365BBF63
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 20:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9409610E0B7;
	Sun, 18 Sep 2022 18:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C0910E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663527260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0Ed6+dAiqMjqkv8l9LDrgvelUcSQtnInCgt8FvkDgQ=;
 b=fwB0fXBc8ZO3chec1Eu+uPp4Lzan6DJfeFlRFiala2ihPnRgZTWc3CiA9Gs/3SSh/Ii3Rg
 5gyLE2VrGLzuii+3MKIOFtObMVIPSZ92s5B+BrWi/PBvzaP1/iEPWA1ftsw4wuGu8q2uGw
 o31ksgwmJeB0nS69EKm4FpiA+m3fTtE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-Bc9MO83uMxKJ7PKVl_-_pg-1; Sun, 18 Sep 2022 14:54:18 -0400
X-MC-Unique: Bc9MO83uMxKJ7PKVl_-_pg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z2-20020a056402274200b004516734e755so16267576edd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 11:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=B0Ed6+dAiqMjqkv8l9LDrgvelUcSQtnInCgt8FvkDgQ=;
 b=uqfCHJNfgnGwIqHbhxjg4/nhQb3ONiOOQGqZYVtJd8AKVULKl2f0Z+elKbEML10kZ/
 bSH5JdWucMRbaIX0O8BYqTJl8nR/RbPTD2L4fV1DR5Hz6xhJec1V6enLXebf0Ei3cww2
 sQh87OHSoxhvZVjWjucPdOtcanxS24yTKBdJyTz/gwMsYnH2a49vqpFO/2Yhjsclpj1X
 J12iueyuD9r1oXCK+yCwk6J/hJgOcTWSaNofh8fYT9iZ8/oB5TjQz3f0H0H09gyMh+wr
 7jKvRGN+UoywZdnF9SMgjrx0WTGp0XWqLSIRRNMbdzTVOfTDm/wkZaV0zYQjFGOTkoQl
 Q58g==
X-Gm-Message-State: ACrzQf3DPuN+i4J1f5PKCiQOXWGhnunpyk+r+kU7qL9G2puhWN8D4vrF
 KFgBJ1ni/Ys4gewVXIDjxG7bI3l+BISsCMubkie2KoPLWRE03tVXXy7MzreU0U5lRnMwf7iprc9
 ZSbO0Tv4PYfWmN/RqT0nxNOZB/bRZ
X-Received: by 2002:a17:907:7da3:b0:776:a0ae:5147 with SMTP id
 oz35-20020a1709077da300b00776a0ae5147mr10154928ejc.662.1663527257433; 
 Sun, 18 Sep 2022 11:54:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Pp+5e7MK2b86K+0vt+uG2XRLcfmV+T0tA5XeCmkKPLJ6TCWn1UpW3oYHGP5aG2aM5oOV+7Q==
X-Received: by 2002:a17:907:7da3:b0:776:a0ae:5147 with SMTP id
 oz35-20020a1709077da300b00776a0ae5147mr10154919ejc.662.1663527257118; 
 Sun, 18 Sep 2022 11:54:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 er7-20020a056402448700b004528db1e834sm10814700edb.57.2022.09.18.11.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 11:54:16 -0700 (PDT)
Message-ID: <87514142-21ea-ee21-fe47-a51239494493@redhat.com>
Date: Sun, 18 Sep 2022 20:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 0/5] drm/gma500: Backlight handling changes
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220917205920.647212-1-hdegoede@redhat.com>
 <CAMeQTsZ3Z76QFWgCVPxKdaZ+=KK-9Dqxx9R0G3fs8i3Bob7B6Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMeQTsZ3Z76QFWgCVPxKdaZ+=KK-9Dqxx9R0G3fs8i3Bob7B6Q@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

On 9/18/22 20:22, Patrik Jakobsson wrote:
> On Sat, Sep 17, 2022 at 10:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is a patch-series changing gma500's backlight handling to match
>> the changes done to the other major x86 GPU drivers in the just landed
>> backlight detection refactor patch series:
>> https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/
>>
>> The main goal is here is to only register one backlight class device instead
>> of registering both "acpi_video0" and "psb-bl" backlight class devices;
>> in preparation for implementing the new backlight userspace-API from:
>> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/
> 
> Hi Hans,
> 
> Quite some time ago I wrote a backlight driver [1] for a MacBook to
> work around an issue in the i915 driver. My driver spoke directly to
> an external backlight driver chip. By doing so I could turn off the
> signal coming from the GPU and instead program my own PWM value
> directly. I remember it being a bit tricky to make my driver get
> priority over the i915 driver. Not sure what the actual issue was but
> I did get it to work properly in the end (perhaps with an xorg.conf
> change).
> 
> I understand that this is a corner case but I'm just curious how/if
> this can be handled with the new API. Is it possible to kick out an
> existing non-acpi backlight driver if you know yours is better?
> 
> [1] https://github.com/patjak/mba6x_bl

After the main refactoring series which is in linux-next now:
https://lore.kernel.org/all/20220825143726.269890-1-hdegoede@redhat.com/
this should be possible, it should be easy even.

On x86/ACPI platforms the idea is that all backlight-drivers there
call acpi_video_get_backlight_type() which returns one of:

enum acpi_backlight_type {
        acpi_backlight_none = 0,
        acpi_backlight_video,
        acpi_backlight_vendor,
        acpi_backlight_native,
        acpi_backlight_nvidia_wmi_ec,
        acpi_backlight_apple_gmux,
};

(defined in include/acpi/video.h)

And then when acpi_video_get_backlight_type() returns a type which
does not match the driver which calls it, then that driver will
return without registering its backlight sysfs interface.

E.g. drivers/acpi/acpi_video.c does:

        if (acpi_video_get_backlight_type() != acpi_backlight_video)
                return 0;

before registering the /sys/class/backlight/acpi_video# interface(s).

And likewise the i915 driver now does:

        if (!acpi_video_backlight_use_native())
                return 0;

(Note native (GPU) backlight drivers use a special helper since that
helper also lets the video-detect code now that the GPU driver is
capable of doing native backlight control which is part of the heuristics
to pick which backlight control method to use).

So getting i915 out of the way now is as simple as making
acpi_video_get_backlight_type() return something else then 
acpi_backlight_native which can be done through e.g. a DMI quirk.

The acpi_backlight_vendor type here is typically used by backlight code
in drivers like dell-laptop acer-wmi, asus-wmi, thinkpad_acpi, etc.
None of which I expect to load on your macbook.

So you could make your mba6x_bl have a:

        if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
                return 0;

Check to avoid registering. All backlight drivers used on x86/acpi
platforms should have such a check going forward so that
acpi_video_get_backlight_type() is the sole place in the kernel
which decides which backlight-control method actually gets registered.

And then pass: "acpi_backlight=vendor" on the kernel commandline to
switch from the default to your driver (and users can also use this
to switch back once you have made vendor the default on affected
macbooks).

If this works (which I expect it will) and once you have your driver
merged into the mainline kernel you can then add DMI based quirks to
drivers/acpi/video_detect.c to default to acpi_backlight=vendor on
these macbooks (I see that you already use DMI based auto-loading
in your driver).

So as you can hopefully see in linux-next with my refactoring in
place having another driver take over from the i915 driver should
be simple since there is a single point now
(acpi_video_get_backlight_type()) which controls which driver will
load and which ones will not load.

Regards,

Hans


p.s.

Note the above has nothing to do with the new userspace API for
backlight control. But sorting out there being multiple drivers
loaded/registered at the same time for a single panel/backlight
was a prerequisite for the new userspace API.
For the proposed new userspace API see:
https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/









> 
>>
>> Changes in v2:
>> - Add "Use backlight_get_brightness() to get the brightness" patch
>>
>> Changes in v3:
>> - Fix unused variable warnings when CONFIG_BACKLIGHT is not selected by
>>   marking the 2 variables as  __maybe_unused.
> 
> This looks good to me. I don't have access to my DIM setup in a couple
> of days so please push these yourself if possible.
> 
> For the entire series:
> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (5):
>>   drm/gma500: Refactor backlight support (v2)
>>   drm/gma500: Change registered backlight device type to raw/native
>>   drm/gma500: Use backlight_get_brightness() to get the brightness
>>   drm/gma500: Don't register backlight when another backlight should be
>>     used
>>   drm/gma500: Call acpi_video_register_backlight()
>>
>>  drivers/gpu/drm/gma500/backlight.c       | 102 +++++++++++++++--------
>>  drivers/gpu/drm/gma500/cdv_device.c      |  50 ++---------
>>  drivers/gpu/drm/gma500/oaktrail_device.c |  65 ++-------------
>>  drivers/gpu/drm/gma500/opregion.c        |   6 +-
>>  drivers/gpu/drm/gma500/psb_device.c      |  73 +---------------
>>  drivers/gpu/drm/gma500/psb_drv.c         |  15 +---
>>  drivers/gpu/drm/gma500/psb_drv.h         |  13 +--
>>  7 files changed, 97 insertions(+), 227 deletions(-)
>>
>> --
>> 2.37.3
>>
> 

