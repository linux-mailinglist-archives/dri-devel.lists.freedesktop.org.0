Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79D449A8F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329D96E17B;
	Mon,  8 Nov 2021 17:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D676E17B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636391578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6hX5iOFKAcrjKGc/UHz+vVFm2dnArXEWAbvtqOlqkw=;
 b=MbIaiqyuXpmvztpa5tgPuWty3wrMmdKXfPIAdRuL1X1sxlnodEqDKiKN5pI1dUmEiGIihc
 mIkw4DdCthj9Ta72JKK42NFHLt5shy9g1FXWOfDiMw+GlTiIAqiCKcsxhNzLXhtvbCHkkP
 BddJm0RQ0cc6z4cjIpD3mtR36LHCBaY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-lnT7i2oRNV-NExr13-7MFw-1; Mon, 08 Nov 2021 12:12:57 -0500
X-MC-Unique: lnT7i2oRNV-NExr13-7MFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso4228584wrx.15
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 09:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o6hX5iOFKAcrjKGc/UHz+vVFm2dnArXEWAbvtqOlqkw=;
 b=D/J1o5Dc13FOYBpxtaoFVDZDuSqstrOTgdv9Xa+wqXUaVPXD0ISEejSWGDSaxwtd/m
 XjExnNlQ71hiurDuNsD+A7jjsmahqlUxfeXfZq0o6Pi/V17X+F/IqMBc8NuTl9m6gC4M
 b6gJCJ0rli9UUpIWsJnAvgwv5ChtHbmD9uDmvO6sC8+R4QuE5s2V0qoaOWhcr1e8vjUp
 zQdUjq3x8+ExtnrSat8mtS3mq0/XlJ25bFYqvmqqKoIx/2JboQAlinBjYYQ3oY8jWCZv
 xiAmGl3ok5zblIYpoCrmkeM6kE2xjAQC6/sworls3HAPHw9mhV1h3LHPgF21CLDlo3C2
 edNQ==
X-Gm-Message-State: AOAM531vNF6q2Pm3j3VFlGw9OriZBrR/cZlq/HXOqOvUl8X0FUjm9BrC
 gAFbx4MijpNpnpwlBWa4UJ7CfCBQLTOemh1vVIFsV79qWqmcWJ0D7SXL0ffhpzMvKprwnt1jEX5
 NSVGtEel2w0i0qPrgos0iL5tFHIZD
X-Received: by 2002:adf:f489:: with SMTP id l9mr886441wro.268.1636391575546;
 Mon, 08 Nov 2021 09:12:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDVy3qUzMu3LwiViItnFnsYS9bCK2XcZOAChSaDhAn5sEwOFkZAeS/DWBvbgcMZGrBZdyxcg==
X-Received: by 2002:adf:f489:: with SMTP id l9mr886411wro.268.1636391575317;
 Mon, 08 Nov 2021 09:12:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:cb60:a1c5:8a09:190d?
 ([2a01:e0a:c:37e0:cb60:a1c5:8a09:190d])
 by smtp.gmail.com with ESMTPSA id v191sm16663967wme.36.2021.11.08.09.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 09:12:54 -0800 (PST)
Message-ID: <10749a4d-7bd7-2d3a-2c99-f6dbd0cbec37@redhat.com>
Date: Mon, 8 Nov 2021 18:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm/fb-helper: Call drm_fb_helper_hotplug_event() when
 releasing drm master
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211108153453.51240-1-jfalempe@redhat.com>
 <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: michel@daenzer.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2021 17:00, Daniel Vetter wrote:
> On Mon, Nov 08, 2021 at 04:34:53PM +0100, Jocelyn Falempe wrote:
>> When using Xorg/Logind and an external monitor connected with an MST dock.
>> After disconnecting the external monitor, switching to VT may not work,
>> the (internal) monitor sill display Xorg, and you can't see what you are
>> typing in the VT.
>>
>> This is related to commit e2809c7db818 ("drm/fb_helper: move deferred fb
>> checking into restore mode (v2)")
>>
>> When switching to VT, with Xorg and logind, if there
>> are pending hotplug event (like MST unplugged), the hotplug path
>> may not be fulfilled, because logind may drop the master a bit later.
>> It leads to the console not showing up on the monitor.
>>
>> So when dropping the drm master, call the delayed hotplug function if
>> needed.
>>
>> v2: rewrote the patch by calling the hotplug function after dropping master
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Lastclose console restore is a very gross hack, and generally doesn't work
> well.
> 
> The way this is supposed to work is:
> - userspace drops drm master (because drm master always wins)
> - userspace switches the console back to text mode (which will restore the
>    console)
> 
> I guess we could also do this from dropmaster once more (like from
> lastclose), but that really feels like papering over userspace bugs. And
> given what a massive mess this entire area is already, I'm not eager to
> add more hacks here.
> 
> So ... can't we fix userspace?

But the kernel still needs to support older version of userspace 
applications anyway ?
> 
> Ofc if it's a regression then that's different, but then I think we need a
> bit clearer implementation. I'm not clear on why you clear the callback
> (plus the locking looks busted).

It's a race condition, in the current code there are two workarounds:

[1] e2809c7db818df6bbd0edf843e1beb2fbc9d8541 which introduced delayed 
hotplug for MST
[2] dc5bdb68b5b369d5bc7d1de96fa64cc1737a6320 which introduced a 
workaround for Xorg and logind, and add a force parameter to
__drm_fb_helper_restore_fbdev_mode_unlocked() in this case.

The problem here is when we need both workarounds at the same time, it 
doesn't work (so using Xorg, and playing with MST monitor).

v1 patch, was to also force hotplug() after forcing the restore()
v2 patch is to call the hotplug() after the drm drop. it's a bit hacky, 
because I replaced the boolean "delayed_hotplug" with a callback, that's 
why it's cleared. A cleaner way would be to have a function in 
drm_auth.c to register a callback on drm_drop().

For the locking, the hotplug() function should be called without the
dev->master_mutex, because it will try to take it.


-- 

Jocelyn



> -Daniel
> 
>> ---
>>   drivers/gpu/drm/drm_auth.c      | 7 +++++++
>>   drivers/gpu/drm/drm_fb_helper.c | 6 +++---
>>   include/drm/drm_fb_helper.h     | 4 +++-
>>   3 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 60a6b21474b1..73acf1994d49 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -35,6 +35,7 @@
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_lease.h>
>>   #include <drm/drm_print.h>
>> +#include <drm/drm_fb_helper.h>
>>   
>>   #include "drm_internal.h"
>>   #include "drm_legacy.h"
>> @@ -321,6 +322,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>>   	}
>>   
>>   	drm_drop_master(dev, file_priv);
>> +
>> +	mutex_unlock(&dev->master_mutex);
>> +	if (dev->fb_helper && dev->fb_helper->delayed_hotplug)
>> +		dev->fb_helper->delayed_hotplug(dev->fb_helper);
>> +	return ret;
>> +
>>   out_unlock:
>>   	mutex_unlock(&dev->master_mutex);
>>   	return ret;
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 8e7a124d6c5a..e8d8cc3f47c3 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -252,9 +252,9 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>>   		ret = drm_client_modeset_commit(&fb_helper->client);
>>   	}
>>   
>> -	do_delayed = fb_helper->delayed_hotplug;
>> +	do_delayed = (fb_helper->delayed_hotplug != NULL);
>>   	if (do_delayed)
>> -		fb_helper->delayed_hotplug = false;
>> +		fb_helper->delayed_hotplug = NULL;
>>   	mutex_unlock(&fb_helper->lock);
>>   
>>   	if (do_delayed)
>> @@ -1966,7 +1966,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>>   	}
>>   
>>   	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
>> -		fb_helper->delayed_hotplug = true;
>> +		fb_helper->delayed_hotplug = drm_fb_helper_hotplug_event;
>>   		mutex_unlock(&fb_helper->lock);
>>   		return err;
>>   	}
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>> index 3af4624368d8..c2131d1a0e23 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -160,8 +160,10 @@ struct drm_fb_helper {
>>   	 * A hotplug was received while fbdev wasn't in control of the DRM
>>   	 * device, i.e. another KMS master was active. The output configuration
>>   	 * needs to be reprobe when fbdev is in control again.
>> +	 * NULL, or a pointer to the hotplug function, so it can be called
>> +	 * by the drm drop function directly.
>>   	 */
>> -	bool delayed_hotplug;
>> +	int (*delayed_hotplug)(struct drm_fb_helper *helper);
>>   
>>   	/**
>>   	 * @deferred_setup:
>> -- 
>> 2.33.1
>>
> 

