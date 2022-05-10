Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DBA520F10
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 09:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57F10E9C0;
	Tue, 10 May 2022 07:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE89710E9C0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652169045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8I80A1MFc0J/yZVJgHBHlpH5enDkuIotq+SGXDDvEU=;
 b=bh7KvezmkVqI45BViCMLgB3s2sMUqvOyQ60mgJLE0v42sGa9TyqBU7gRMCmOY328j0cug8
 gq65+mBfRx4cA6Qvlhpk1Bkk5d2uaIPICBZRpa6k210oqk/CVvR0yzokjYewMN3G/X+szh
 CzTsZ5t5//QyZ0YF7WfYibLRk4mLauw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ltrdvO0AOBWMNB7L8yoOCw-1; Tue, 10 May 2022 03:50:41 -0400
X-MC-Unique: ltrdvO0AOBWMNB7L8yoOCw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so6692475wrh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 00:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X8I80A1MFc0J/yZVJgHBHlpH5enDkuIotq+SGXDDvEU=;
 b=3ZZFvAwPsZwfLSSXjGafWqR37WXPbLngZ/ALZ3bl8a7IdSVKtQlZigOyUWB7dM7lzN
 wfcErc4PLVI9VwkD20CMb1R7q70Ee++sO/YManxuwwGYEvpdZipy0XVl25RTZ0sUvbxa
 46ZUynKZXdqwfqWv2ynFunpHKTH+6g6Mwid/A53Op9k/zoNL7QtHDwfO43r7s5p5bmvP
 V4wAGqZxTofeceOY/aBJySnDcXyz6m3PJqa3TJTqhcx33rskxPeCc2cq2T3AuRpnHvwK
 Hpj0kNz/4sDaq3kGcS9xLs18RaPO8BT/+xLtQzuL0n+kue/Pe675Ru0al9ibOEuPlm9K
 2LVg==
X-Gm-Message-State: AOAM53377HrGNrrb+pqbqBOPzJF8Y/HPRjFUhaXD+47zyATa4wZc9219
 eaug2ggJcbxAkB6Fm2AoFwcPUAPBYjUbXibr18haoj8bS29PUpks60w++CgetFJK75aFYK0cFMw
 z88WKfUqrAFBD0LBm7wgJ4La2j3j1
X-Received: by 2002:adf:e0cc:0:b0:207:b690:acb8 with SMTP id
 m12-20020adfe0cc000000b00207b690acb8mr17049521wri.412.1652169040385; 
 Tue, 10 May 2022 00:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt1PXXZ4GfsjU4JVU3VAyn3tFLEyxIj8zvNpeAQhxz0Dh39tYNxE2S/Hqlk3T8BEeisJpmCQ==
X-Received: by 2002:adf:e0cc:0:b0:207:b690:acb8 with SMTP id
 m12-20020adfe0cc000000b00207b690acb8mr17049501wri.412.1652169040086; 
 Tue, 10 May 2022 00:50:40 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b19-20020a05600c4e1300b003942a244ec7sm1700839wmq.12.2022.05.10.00.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 00:50:39 -0700 (PDT)
Message-ID: <42fe44ae-de02-5506-d1b4-059af0419366@redhat.com>
Date: Tue, 10 May 2022 09:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <8401c328-ed67-8d5e-4ba2-b487f256e139@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8401c328-ed67-8d5e-4ba2-b487f256e139@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/22 09:19, Andrzej Hajda wrote:
> 
> 
> On 10.05.2022 00:42, Javier Martinez Canillas wrote:
>> On 5/10/22 00:22, Andrzej Hajda wrote:
>>
>> [snip]
>>
>>>>    static void drm_fbdev_fb_destroy(struct fb_info *info)
>>>>    {
>>>> +       if (info->cmap.len)
>>>> +               fb_dealloc_cmap(&info->cmap);
>>>> +
>>>>           drm_fbdev_release(info->par);
>>>> +       framebuffer_release(info);
>>> I would put drm_fbdev_release at the beginning - it cancels workers
>>> which could expect cmap to be still valid.
>>>
>> Indeed, you are correct again. [0] is the final version of the patch I've
>> but don't have an i915 test machine to give it a try. I'll test tomorrow
>> on my test systems to verify that it doesn't cause any regressions since
>> with other DRM drivers.
>>
>> I think that besides this patch, drivers shouldn't need to call to the
>> drm_fb_helper_fini() function directly. Since that would be called during
>> drm_fbdev_fb_destroy() anyways.
>>
>> We should probably remove that call in all drivers and make this helper
>> function static and just private to drm_fb_helper functions.
>>
>> Or am I missing something here ?
> 
> This is question for experts :)

Fair. I'm definitely not one of them :)

> I do not know what are user API/ABI expectations regarding removal of 
> fbdev driver, I wonder if they are documented somewhere :)

I don't know. At least I haven't found them.

> Apparently we have some process of 'zombification'  here - we need to 
> remove the driver without waiting for userspace closing framebuffer(???) 
> (to unbind ops-es and remove references to driver related things), but 
> we need to leave some structures to fool userspace, 'info' seems to be 
> one of them.

That's correct, yes. I think that any driver that provides a .mmap file
operation would have the same issue. But drivers keep an internal state
and just return -ENODEV or whatever on read/write/close after a removal.

The fbdev subsystem is different though since as you said it, the fbdev
core unconditionally calls to the driver .fb_release() callback with a
struct fb_info reference as argument.

I tried to prevent that with commit aafa025c76dc ("fbdev: Make fb_release()
return -ENODEV if fbdev was unregistered") but Daniel pointed out that
is was wrong since could leak memory allocated and was expected to be
freed on release.

That's why I instead fixed the issue in the fbdev drivers and just added
a warn on fb_release(), that is $SUBJECT.

> So I guess there should be something called on driver's _remove path, 
> and sth on destroy path.
>

That was my question actually, do we need something to be called in the
destroy path ? Since that could just be internal to the DRM fb helpers.

In other words, drivers should only care about setting a generic fbdev
by calling drm_fbdev_generic_setup(), and then do any HW cleanup in the
removal path, but let the fb helpers to handle the SW cleanup in destroy.
 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

