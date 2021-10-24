Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D0438BD4
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 22:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FAF89DE6;
	Sun, 24 Oct 2021 20:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AD489DE6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635108030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S62pM1ohcY8e8P01zse8Po1jAUiccAa7aWTPnRXvvVk=;
 b=gsDYLEaeV5CAQwxyYV5JH5GFfVXagi3yS9yMlj2v/QDu/0rvJwE7zj6KzqS2DUlFQgVsl4
 8zypc8C2wu4zrrrM9syeZndFcZ0Rbbf3PlsHlHC0bHEyWlzeF85GWO6ukXT6juZnMGfv5H
 eAHwxlv5z+CuR9ScxbIYRqHurzl6Rbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-4qhTcNxKMPSJ0RT6J0WYzw-1; Sun, 24 Oct 2021 16:40:29 -0400
X-MC-Unique: 4qhTcNxKMPSJ0RT6J0WYzw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adffd8a000000b00167f0846597so1888445wrr.16
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 13:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S62pM1ohcY8e8P01zse8Po1jAUiccAa7aWTPnRXvvVk=;
 b=IpM1l6FTzXRlDsZIE6QfNwDoNL9DItYqxSURalOBiEG/tBunr6h0QUgki/D3kDnNcI
 nO9JoyfOrQ1RzsIhLXQFaOJbubHvrK9hZ9jKPpK6DH5Soi830Xbk5/CapvSZPOJ7ob+h
 LUBZhQVrFvZzTJJtf7QJyZ2IfwKmH2W/z/4UELLIm/aRVMvZdCa81BGlTN9t7ShsMRTt
 FXEQFV62j/kA2uXn96JOdSypq+DStuxJPqPsyabE5HYp+zYj0k+J0n4J0Q9n4kU/+EgI
 LL38ZS9m/PIwz+cVqTyPpZrCa9PeKpPdWoNhuJhIlZVkPuQwKYG5YQpKtvy6/uwcufmt
 ypdQ==
X-Gm-Message-State: AOAM532knatntil/+dTe/+0d8VOjYBw+4TlEF6CJYNKubSM5DV6S1idV
 Y41clP0IsPYkx5al+Q0nwqGKhZfY2b6HmsxnPImQhLbzCfG9QgViUysEmkiz76o0QMKT40tz9+A
 T5qEGgU5noFgzcqXueZ/QBjRNOmme
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr17926492wrr.323.1635108027830; 
 Sun, 24 Oct 2021 13:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwafyIMrMKsWMMn1otBqZ6m/7/4jVXo25xOl1XMuzc3+NuLOqwWG5EYYeqWjRR8IIRsVuDpxg==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr17926470wrr.323.1635108027528; 
 Sun, 24 Oct 2021 13:40:27 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id e17sm870217wrx.18.2021.10.24.13.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 13:40:27 -0700 (PDT)
Message-ID: <015855d9-62f3-be81-a4c1-b8439534ec06@redhat.com>
Date: Sun, 24 Oct 2021 22:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20211022144040.3418284-1-javierm@redhat.com>
 <14a41bd8-cd70-b9d0-ce1c-869cfde8bdcb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <14a41bd8-cd70-b9d0-ce1c-869cfde8bdcb@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks a lot for your feedback.

On 10/22/21 21:05, Thomas Zimmermann wrote:

[snip]

>>   
>> +static bool drm_aperture_remove_fb = true;
> 
> Global variables should default to zero if somehow possible. This way, 
> they can all be stored in the BSS segment and backed by a single shared 
> zero-filled page. Otherwise they require actual memory. In the worst 
> case, you'd allocate a full page to hold a single boolean.
> 
>> +module_param_named(remove_fb, drm_aperture_remove_fb, bool, 0600);
>> +MODULE_PARM_DESC(remove_fb,
>> +		 "Allow conflicting framebuffers removal [default=true]");
>> +
> 
> And with variables set to zero, a command-line parameter enables 
> non-default behavior (i.e., "drm-param=1"). That more logical than the 
> other way around IMHO.
>

Agreed. I'll change that.
 
>>   /**
>>    * DOC: overview
>>    *
>> @@ -283,6 +288,9 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
>>    * This function removes graphics device drivers which use memory range described by
>>    * @base and @size.
>>    *
>> + * The conflicting framebuffers removal can be disabled by setting the drm.remove_fb=0 kernel
>> + * command line option. When this is disabled, the function will return an -EINVAL errno code.
> 
> Please use -EBUSY for the error. That's what the acquire function 
> returns in case of a conflict.
>

Sure, makes sense. I was pondering between -EINVAL, -EBUSY and -EPERM.

>> + *
>>    * Returns:
>>    * 0 on success, or a negative errno code otherwise
>>    */
>> @@ -292,7 +300,12 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
>>   #if IS_REACHABLE(CONFIG_FB)
> 
> Rather not split up this block. It's better style to put the 
> fbdev-related code into a helper and call it unconditionally.
>
> static drm_aperture_remove_conflicting_fbdev_framebuffers()
> {
> #if (FB)
> 	...
> #endif
> 	return 0;
> }
>

Ok.

>>   	struct apertures_struct *a;
>>   	int ret;
>> +#endif
>> +
>> +	if (!drm_aperture_remove_fb)
>> +		return -EINVAL;
> 
> There's still the question of the semantics of this parameter. It's a 
> bit fuzzy.
> 
> If you use 'disable_handover' (as you mentioned in another mail), it 
> would mean that only the handover itself is disabled. So if simpledrm is 
> not bound to the device, then a native driver should load. That would be 
> hard to implement with the current code base, where we have to take old 
> fbdev drivers into account.
> 
> (And to be pedantic, we don't really do a handover of the device. We 
> hot-unplug the generic platform device, so that the driver for the 
> native device can operate the HW without interference.)
> 
> Simpledrm only acquires an aperture, but never removes a driver. If 
> there is a driver already, simpledrm would fail. Only native drivers try > to remove drivers and would trigger the test. So your patch is more 
> something like 'disable_native_drivers'.
> 
> I'd go with 'disable_native_drivers', or maybe 'disable_device_handover' 

That works for me and "drm.disable_native_drivers" is also what Neal meant
with his "drm.noplatformdrv", but yours is much easier to remember / type.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

