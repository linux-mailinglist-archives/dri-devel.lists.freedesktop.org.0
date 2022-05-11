Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3052330C
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101E10E441;
	Wed, 11 May 2022 12:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769310E441
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652271868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StKeixQ3rsAMa6ZFGvWGBr2LGTsx9ja9jzeia2Tii80=;
 b=eSZM72NuFUhtHp/8qG91ayUWMsvTxamhHsoq8+HQQwgM6QkJzwjSW/gzG+ssclD1PsWEb+
 N6xogxguhvyrtYFcq5bnnGG6Z8+xgFAvKGjjFzPAfbe9y6YvEthig74A509GGNRUpxYwN8
 E/8YqD85SxCGX9ZaDc1wffrxK+SqG1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-8tAeLvB7PwCx4td19HVtxQ-1; Wed, 11 May 2022 08:24:25 -0400
X-MC-Unique: 8tAeLvB7PwCx4td19HVtxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so638138wmh.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=StKeixQ3rsAMa6ZFGvWGBr2LGTsx9ja9jzeia2Tii80=;
 b=x3JLgHGdebuRkEfs4qh1Lq8jUh0vRcXSIo8eeCm5w/Kulp5YGCivlWN+dIJqazyMKi
 PsJ5Nem4703mtD1Ilqs0YNNwOJd5ZeZa2QzQfqBxqw23rUxCB8x0elJfOWV4+pbwFFoM
 KMMDPTqZ/vqDrAeswGj5aAscYbhpSAzVfzc0fnWNogIB/mO5LB37Vz8BY1a03HLcm+Pe
 ux3dUdsrtBJO4jZ8DmE6DXyw4I6Y3vATropRHskdG814PYJinAnfns6uCOeaFSE0qUBe
 DILZW8T9KBBeoxaO5/B84Q+9+s6lO5sEhjr4wrgL6gxZjC/b7qfmoW1jfd1548sdm1FP
 3FYg==
X-Gm-Message-State: AOAM533N8THuKu5tdjptD6cev85zzCr/2Fm0aiVLhII1LPjN6SoURik+
 QCm7HfqARp6J9bt5JwLxAcNjtRMhUTlILkERybmGUkAOjqZ2hPQq2N6B88lIAIMTGFtNspKRrNr
 JZXo9lfvwoh4lYte7cSzrb7m5QD4K
X-Received: by 2002:a5d:64ae:0:b0:20c:6030:d6f0 with SMTP id
 m14-20020a5d64ae000000b0020c6030d6f0mr22641353wrp.298.1652271864003; 
 Wed, 11 May 2022 05:24:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj/yczfYQv2d8rR90uXHwUui4saVslbeigPoq1BVFw07uRYvJAhRqIieGGIQuhaIXCbGy9Fg==
X-Received: by 2002:a5d:64ae:0:b0:20c:6030:d6f0 with SMTP id
 m14-20020a5d64ae000000b0020c6030d6f0mr22641315wrp.298.1652271863436; 
 Wed, 11 May 2022 05:24:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b0020cd2e8d3b1sm1614780wrp.5.2022.05.11.05.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 05:24:23 -0700 (PDT)
Message-ID: <99a8b131-8e30-4ff1-3561-4ccbfa538a60@redhat.com>
Date: Wed, 11 May 2022 14:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <67ed69d1-ebea-c9d0-45be-3c6c7e5ea1e5@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <67ed69d1-ebea-c9d0-45be-3c6c7e5ea1e5@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/11/22 14:02, Thomas Zimmermann wrote:

[snip]

>> +
>> +/**
>> + * sysfb_disable() - disable the Generic System Framebuffers support
>> + *
>> + * This disables the registration of system framebuffer devices that match the
>> + * generic drivers that make use of the system framebuffer set up by firmware.
>> + *
>> + * It also unregisters a device if this was already registered by sysfb_init().
> 
> Why? I still cannot wrap my mind around, why we need to store *pd at all 
> and use sysfb_try_unregister() for unregistering.
>

Because on sysfb_disable(), the registered platform device has to unregistered.

And sysfb has no way to know if it was unregistered already or not unless that
stage is maintained in sysfb itself.

Let's have some examples assuming that we don't have this helper in sysfb
(will use the vc4 DRM driver just to avoid typing "a real DRM driver).

a) simplefb probed and then vc4

   1) "simple-framebuffer" pdev is registered by sysfb
   2) simplefb is registered and matches "simple-framebuffer"
   3) a vc4 device is registered by OF when parsing the DTB
   4) vc4 driver is registered, matches vc4 and probes
   5) vc4 requests the conflicting framebuffers to be removed
      and fbmem unregisters "simple-framebuffer"
   6) fbmem calls sysfb_disable()
   7) sysfb_disable() should unregister the pdev but can't
      because has no way to know that fbmem already did that.
 
b) vc4 probed and then simplefb.ko module is loaded

   1) "simple-framebuffer" pdev is registered by sysfb
   2) a vc4 device is registered by OF when parsing the DTB
   3) vc4 driver is registered, matches vc4 and probes
   4) vc4 requests the conflicting framebuffers to be removed
      and fbmem unregisters "simple-framebuffer"
   5) fbmem calls sysfb_disable()
   6) sysfb_disable() should unregister the pdev but can't
      because has no way to know that fbmem already did that.
   7) simplefb.ko is loaded and simplefb driver registered
   8) simplefb matches the registered "simple-framebuffer"
      and will wrongly probe and register a DRM device.

In option (a), making sysfb_disable() to attempt to unregister the device
that register in sysfb_init() will lead to a use-after-free if this was
already unregistered by fbmem in remove_conflicting_framebuffers(), so
it can't attempt to do that.

Same for option (b), but sysfb_disable() can't rely on fbmem to do the
unregistration because it only does for devices that are associated with
an already registered fbdev.

[snip]

>> + * Return:
>> + * * true          - the device was unregistered successfully
>> + * * false         - the device was not unregistered
>> + */
>> +bool sysfb_try_unregister(struct device *dev)
> 
> As it stands, I strongly object the use of this function as still don't 

No worries, it's my bad since I clearly failed to explain the rationale in
the commit message and comments.

> really get the purpose. It looks like a glorified wrapper around 
> platform_device_unregister(). Do we need disable_lock to serialize with 
> something else?
>

Yes, it has to serialize with sysfb_init() and sysfb_disable().
 
> Best regards
> Thomas
> 
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

