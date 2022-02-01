Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FEA4A5B63
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2C910E805;
	Tue,  1 Feb 2022 11:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FCF10E805
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643715959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULqxq85+QXgVuXkXrsFWoQ+Jj3hdrBT3Ayah3/h4Tac=;
 b=A200oP9YDg0A4yGinYPpKw+zfkprWugR9W6JticmAxJ0+00uvm8jx89jyubCrWsIOeikIb
 IWMBb0sggHeZgIddUDdvWa9bGej/fUU3cUVFh3aQUFr7Z9/jjVTrz5sDtUYArKJXL0SJL3
 qYKOmmhD5+DqFIAbJVtxPtmxPTWBKAI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-vebyl5rxM0exWPlZSdOAEw-1; Tue, 01 Feb 2022 06:45:56 -0500
X-MC-Unique: vebyl5rxM0exWPlZSdOAEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso847872wmb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ULqxq85+QXgVuXkXrsFWoQ+Jj3hdrBT3Ayah3/h4Tac=;
 b=bUGxLJVjs6yNT5m3fMKW90prBXeRQiS722FDMaXLRIrOheuf3qugd33pt487W+l/XP
 UgGNKwfE62p+mfHw/DUFdJYWlkxVvjig60qtfhMValo51hUHfFp4u9E2pU5DmLu1FuQB
 Tvxiht9jfhyPZvFTJC2hOBnJ3q7T/CxHJFHvN913cKz8uz/VkjEm/NRmMMAYLeuB1zT0
 HoVBXrREYAsnPX571SRv6gHoLQMuCHOtHqd+e9+cfAdOQXX97t0GFu+qfnXwMnnN0NWN
 7ZDq7w/D1j+agI0bEENZsQoH9Th1V3zW2Rz4Ecz+jWemZSf2Mf51/3tTU64EzCHls1jU
 v4Mg==
X-Gm-Message-State: AOAM531xJTul3jHEuKcL1/YxY+NW8VGODAEasPRTicBLvEsrO1SDDR5T
 iM23/u1z4QpmrQZ+qS0pcbr62i5b3g6XD0nMLATGDNdRAwZAhrqirNRmGK0MPBftHtImL/m+uxV
 ltWzIY0VVmXp2x33NkzAQ8Wwtl5Cw
X-Received: by 2002:a05:6000:42:: with SMTP id
 k2mr20919093wrx.79.1643715954914; 
 Tue, 01 Feb 2022 03:45:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu53NCCBkPLUIyYKlJCJN/UR7WXCnqrTa2SCyLCQ+kIZ18n0Z2nEp2RQQD+B1odXGUsfHjbw==
X-Received: by 2002:a05:6000:42:: with SMTP id
 k2mr20919072wrx.79.1643715954648; 
 Tue, 01 Feb 2022 03:45:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h11sm1811015wmb.12.2022.02.01.03.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:45:54 -0800 (PST)
Message-ID: <9ddd8a8c-4aa9-bc4a-5637-66197a7342d1@redhat.com>
Date: Tue, 1 Feb 2022 12:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org>
 <3aac291a-b30e-2775-336f-66dd08d634e2@redhat.com>
 <YfkA4ER/52I2v1JP@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfkA4ER/52I2v1JP@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 10:44, Andy Shevchenko wrote:
> On Tue, Feb 01, 2022 at 01:14:22AM +0100, Javier Martinez Canillas wrote:
>> On 1/31/22 22:30, Sam Ravnborg wrote:
>>> On Mon, Jan 31, 2022 at 09:29:16PM +0100, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> The driver uses the pwms property for the backlight.
>>> It would have been much better to bite the bullet and require the
>>> backlight to be specified using a backlight node in the DT.
>>> This is the standard way to do it and then the driver could use the
>>> existing backlight driver rather than embedding a backlight driver here.
>>>
>>
>> I did consider that. Because that would allow me to use a struct drm_panel
>> and as you said make the core to manage the backlight. But then decied to
>> just keep the backward compatibility with the existing binding to make it
>> easier for users to migrate to the DRM driver.
>>
>> I wonder if we could make the driver to support both ? That is, to query
>> if there's a backlight with drm_panel_of_backlight() and if not found then
>> registering it's own backlight like the driver is currently doing.
> 
> If we keep 100% backward compatibility, just drop the old driver.
> After all module name is not so important as compatibility strings.
>

As mentioned I don't believe those two things are related. You could make it
backward compatible but still keep the old driver around until no one else
would care about it.

This DRM driver is brand new and there may be bugs, performance issues and
whatnot. At least I won't propose to remove the old fbdev driver but would
want people using DRM to have a choice.
 
> The problem with no backward compatibility means that removal of old driver
> makes users unhappy since DT is kinda ABI and we do not break it.
> 

I think that's the crux of the issue. Do we want people to update their
kernel but using their existing Device Tree and be able to switch to the
DRM driver ?

My take is that we should and that's why I kept the backward compatibility.

Maybe we could do that in the meantime and at some point introduce new DT
bindings (with a different compatible string) that would use the latest
and greatest conventions in DT ? That seems to be a good compromise.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

