Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A950DB53
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E028210E01F;
	Mon, 25 Apr 2022 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8723910E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcJjktltsy20pk/1TUGpfeSXdGLoP34V6e5SW63r+UU=;
 b=jUmP/IhbgGNglEKcaXPUaH1NKp/VZBxGpTIIurcnSmyrAffLcYVJ3UIMkz4NKi1hmcKGGq
 LJXSLyjVVYioETCKI9TYvQTb5anUrNJkILliUQUfZ7Jt+WXgYqJjkzGjKa4EGLfdijjCdN
 aH56pC2y86SXWWyaPgrPlAhAZ3yssHw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-zW5Y9yLpPsehi_OKOBUdmQ-1; Mon, 25 Apr 2022 04:37:46 -0400
X-MC-Unique: zW5Y9yLpPsehi_OKOBUdmQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so3396817wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 01:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hcJjktltsy20pk/1TUGpfeSXdGLoP34V6e5SW63r+UU=;
 b=6EqVKyAD0socslV55TUS/cMODiMUpns951VQbX+9rydFLHm9ACRZS0e1yF+ocbXmT5
 FteuffEtycr3znVDi8S7F8gTKjHqme4NWktX5QBYfGfWcBG8qIszxsxlfljfD3Pxq7mT
 kHkUrRgsKbwmMFPelM0OaNzm8MYeFz31vVJGK0/ZBltyqXa43gpsyg6JkBFRYmErQenE
 e6GGPDbr7OEcdSXXiyo6RFd0AUVf+lr8Fpd2dc1nBxN6oLr5K4zSegp1CGRxXjjmmOWT
 p4PDrVxdKIIwJ4VfFPM0w452YUb5Ym3H2Y9u+gTNs38vlmjDMKIwpK90detxB7flzSwt
 5fUw==
X-Gm-Message-State: AOAM532BxwekmBBjxitjFhl1Yu3hIy5K2xS6DuTHOzivWk8u8w6oGkod
 42cojOKSQlRISnSwbBnHgfqCJBZRDQSkZuDgoAskWa2R3uSNAonKuPgeCwrUS9nKTwExKIX+s6/
 chL3rL+fCBT2HoM1GyIqZGtqwTKTt
X-Received: by 2002:a1c:3b89:0:b0:38e:b37f:52d with SMTP id
 i131-20020a1c3b89000000b0038eb37f052dmr15325215wma.197.1650875865758; 
 Mon, 25 Apr 2022 01:37:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkDkiuHJY5bNGU58CjLV3AycTkBgdIf0DyWp+hIAcCSv4pw19dJ8Ap5RCImavOptKADqXHsg==
X-Received: by 2002:a1c:3b89:0:b0:38e:b37f:52d with SMTP id
 i131-20020a1c3b89000000b0038eb37f052dmr15325190wma.197.1650875865524; 
 Mon, 25 Apr 2022 01:37:45 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 d29-20020adf9b9d000000b0020ada099ed5sm2698552wrc.17.2022.04.25.01.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 01:37:45 -0700 (PDT)
Message-ID: <41362e99-820c-727c-019a-11ec5f38083c@redhat.com>
Date: Mon, 25 Apr 2022 10:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/5] fbdev: Restart conflicting fb removal loop when
 unregistering devices
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-4-javierm@redhat.com>
 <44804419-0e83-b584-96d9-a35939b715bf@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <44804419-0e83-b584-96d9-a35939b715bf@suse.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks for the feedback.

On 4/25/22 10:27, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.04.22 um 10:53 schrieb Javier Martinez Canillas:
>> Drivers that want to remove registered conflicting framebuffers prior to
>> register their own framebuffer, calls remove_conflicting_framebuffers().
>>
>> This function takes the registration_lock mutex, to prevent a races when
>> drivers register framebuffer devices. But if a conflicting framebuffer
>> device is found, the underlaying platform device is unregistered and this
>> will lead to the platform driver .remove callback to be called, which in
>> turn will call to the unregister_framebuffer() that takes the same lock.
>>
>> To prevent this, a struct fb_info.forced_out field was used as indication
>> to unregister_framebuffer() whether the mutex has to be grabbed or not.
>>
>> A cleaner solution is to drop the lock before platform_device_unregister()
>> so unregister_framebuffer() can take it when called from the fbdev driver,
>> and just grab the lock again after the device has been registered and do
>> a removal loop restart.
> 
> I don't see how this patch improves the situation. So far, 
> do_remove_conflicting_framebuffers() had no business in maintaining 
> locks. And now it's doing this in in a goto-loop where it keeps 
> getting/dropping locks.  That's asking for bugs IMHO.
>

It's true that do_remove_conflicting_framebuffers() gets more complicated
with all the locks release/re-acquire but OTOH unregister_framebuffer()
doesn't do conditionally locking, and more importantly the drivers .remove
callback isn't called with the lock held, which IMHO is also quite fragile.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

