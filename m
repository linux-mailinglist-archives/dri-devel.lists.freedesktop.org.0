Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC47E8A00
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 10:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ECA10E25E;
	Sat, 11 Nov 2023 09:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36F810E25E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699693849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7c/Lm/uJDATCAgPRHFNpVgc8PBzSucZIj3Gj3ErqE9E=;
 b=ZGNoxyrgCVI+tISyX3/mx2xbRK6ZHfkdRnyVAIORUZOGGX6cA5SyxO+PWpDEorjlWjN87t
 5zs2hhXe9NNxQwkGPk/MRPjGX4rKkECuoPZD9gQuin12ebsRghe5Lp14Z9FUKymOzWJYwU
 qzV49FEAmQ62E1Mdy5Sqb7OdyPEK/10=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-hruLtRzYPlK5fB33MkUw2w-1; Sat, 11 Nov 2023 04:10:47 -0500
X-MC-Unique: hruLtRzYPlK5fB33MkUw2w-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-507cb169766so2685222e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 01:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699693846; x=1700298646;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7c/Lm/uJDATCAgPRHFNpVgc8PBzSucZIj3Gj3ErqE9E=;
 b=pSLGzkLPFO0wdvk5PwIPuGX7WNlxY1CvHqKaJFOCA/oDiJystVpcUvZEdehDyhhMic
 VdfZijAApOlSjG+KeOB6+DYHWKGx6hx8mxSJtyzyWBFmiFd+j0j4ebIxxN94YsYNrMRU
 MLexboqFP7rDXzabeP7YapaC447ohYXn/TQ9ieX2FKsxc2hnfSCbON2ZYqHxXk1lNc6R
 pJpCqqvMyPd+yIisrDG8Dx4efEK0uvBN/m61euYsSq7bVX6w1ABy4F7WGoFsdxKUtChB
 DbKwpBLiKFWg84IxnBk75Cazn90Hr13Ih4Xrcu8AlrUyrUtURzOflZizPdOIQwa5eO64
 RJ/Q==
X-Gm-Message-State: AOJu0YyIITPqWQLHsixWQnBCw9QOpnAd1+P/Ev4DJM5CQEoOdSQ70djP
 rO630ne4hMo+qiJuCiJo/MpIhZJTWcDlKrjOOMfbhEuokr2t24MZ9CcTyvEdVe5WOF2OO1u3G7+
 Ei8oLF9UMXBK3e9yqgO/Hps1vZVMA
X-Received: by 2002:ac2:5551:0:b0:509:2b80:f90c with SMTP id
 l17-20020ac25551000000b005092b80f90cmr749738lfk.68.1699693845889; 
 Sat, 11 Nov 2023 01:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPc9NJxiye/TNgxXuVbWNyzEeyOp6micERKdg2Co2s8cthNpH2I7hrfr/C39Ll0Y6NaWzR1A==
X-Received: by 2002:ac2:5551:0:b0:509:2b80:f90c with SMTP id
 l17-20020ac25551000000b005092b80f90cmr749726lfk.68.1699693845545; 
 Sat, 11 Nov 2023 01:10:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l5-20020adfa385000000b0032da8fb0d05sm1070611wrb.110.2023.11.11.01.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 01:10:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Worsley <amworsley@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "open
 list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix failure of simpledrm probe when trying to grab FB
 from the EFI-based Framebuffer
In-Reply-To: <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
References: <20231111042926.52990-1-amworsley@gmail.com>
 <20231111042926.52990-2-amworsley@gmail.com>
 <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
Date: Sat, 11 Nov 2023 10:10:44 +0100
Message-ID: <87cywgac4r.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Andrew Worsley <amworsley@gmail.com> writes:

> It's inline - part of the email - not an attachment?
>
> I can see it in the copy that went to me...
>
> Andrew
>
> On Sat, 11 Nov 2023 at 15:30, Andrew Worsley <amworsley@gmail.com> wrote:
>>
>>    The simpledrm.c does not call aperture_remove_conflicting_devices() in it's probe
>>    function as the drivers/video/aperture.c documentation says it should. Consequently
>>    it's request for the FB memory fails.
>>

The current behaviour is correct since aperture_remove_conflicting_devices()
is for native drivers to remove simple framebuffer devices such as simpledrm,
simplefb, efifb, etc.

>> ...
>> [    3.085302] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff6e1d8629d580-0x2a5000001a7 flags 0x0]: -16
>> [    3.086433] simple-framebuffer: probe of bd58dc000.framebuffer failed with error -16
>> ...
>>

This is -EBUSY. What is your kernel configuration? Can you share it please.

>>    In my case no driver provided /dev/dri/card0 device is available on boot up and X
>>    fails to start as per this from X start up log.
>>
>> ...
>> [     5.616] (WW) Falling back to old probe method for modesetting
>> [     5.616] (EE) open /dev/dri/card0: No such file or directory
>> ...
>>
>>    Fault confirmed and fixed on Asahi 6.5.0 kernel with both CONFIG_FB_EFI and
>>    CONFIG_DRM_SIMPLEDRM config options set.
>>
>> Signed-off-by: Andrew Worsley <amworsley@gmail.com>
>> ---

I wonder if this is anothe side effect of commit 60aebc955949
("drivers/firmware: Move sysfb_init() from device_initcall to
subsys_initcall_sync").

Can you try reverting that one and see if it helps?

>>  drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
>> index 5fefc895bca2..e55a536b04cf 100644
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/aperture.h>
>>
>>  #include <drm/drm_aperture.h>
>>  #include <drm/drm_atomic.h>
>> @@ -828,6 +829,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>>         if (mem) {
>>                 void *screen_base;
>>
>> +               ret = aperture_remove_conflicting_devices(mem->start, resource_size(mem),
>> +                       DRIVER_NAME);
>> +               if (ret) {

DRM drivers should use drm_aperture_remove_framebuffers() instead. But
this shouldn't be needed for the simpledrm driver as mentioned, since
there shouldn't be another device grabbing this aperture at this point.

I would rather try to understand what is going on in your setup and why 
the acquire is returning -EBUSY.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

