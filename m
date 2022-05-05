Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4587351B966
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8A10EE58;
	Thu,  5 May 2022 07:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 07:46:02 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651A510EE58
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651736761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhRL0x5JxNjh9559awUlQzavmJp0VQ+2PFdUhFoZcIo=;
 b=YE+E/wMfI2VAHzwS4wt9hBWFmSJMW6bOb5ymBor3H2Eh+YanaxSYowGJ86DyBQOJhbUGDJ
 s5WBtXI7TmrIkg4YHRS4Me57SqZW+zdzySknhArvP3TWC4PguZqXQQH63bekkxr+BcARWS
 CKWsRUbPYqCzAh0CZ7/v03NKWVbnqtc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-auxWLxw8NiCgmBTrqiuSXA-1; Thu, 05 May 2022 03:38:52 -0400
X-MC-Unique: auxWLxw8NiCgmBTrqiuSXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so1151113wra.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 00:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NhRL0x5JxNjh9559awUlQzavmJp0VQ+2PFdUhFoZcIo=;
 b=kimHRg7BtlbVEnHHVM9e4AHWr+920ANIFBI6ttG3+ZOzTRHr/oim1djN3qWQTOFcf7
 kyeSWkGUmJwgZclOrXdo2zKTwrTpaX4gburvKhApR2dapmm/1Ab58GPgrGqzONQG/fUI
 KydOJmHiNWOjlk3sBRBPCxaVmaQQPLWqBmryDr1yBMYGp46u4WfH4Kk4zSyAIqD7vYcy
 fJrgYNstSEoJg/tL8nlD9nDEeG2xs0pGo1/fPKiBQdkeGQU8eIpNCtbbSVr5r5BGUVNW
 0ZtKnWrJddvujLXQj/0wlPZb24N0BI7LGFIAuTBw7/tlE85m++FP9ZIi30ZTSM7+41eg
 ScsQ==
X-Gm-Message-State: AOAM531eKL++cqvaQ0IItxiA4GglUSf2IgYBoTkw7r/eFt9J/lOKLngy
 flez0xnTBTURXJIkgQn9Z5V6gWVuCIF6zDiMo0R+SybpOQ8gayTU0XgBrzS0PK7h48jFlGFaS8e
 lFZx4+Xw2K/I1VZNzvVjlUdAsjTXp
X-Received: by 2002:a5d:4585:0:b0:20a:da03:7131 with SMTP id
 p5-20020a5d4585000000b0020ada037131mr19047526wrq.693.1651736331458; 
 Thu, 05 May 2022 00:38:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOiVrqfx6icK3c6hK4kQWSA8M7R4dWtYNn2w4VZryyBpTxL+R3XPp9/Z57KoRlU/8Sy+vNog==
X-Received: by 2002:a5d:4585:0:b0:20a:da03:7131 with SMTP id
 p5-20020a5d4585000000b0020ada037131mr19047508wrq.693.1651736331173; 
 Thu, 05 May 2022 00:38:51 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x8-20020a7bc768000000b003942a244f2fsm5546131wmk.8.2022.05.05.00.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 00:38:50 -0700 (PDT)
Message-ID: <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
Date: Thu, 5 May 2022 09:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/5/22 09:29, Thomas Zimmermann wrote:

[snip]

>>   static void simplefb_destroy(struct fb_info *info)
>>   {
>>   	struct simplefb_par *par = info->par;
>> @@ -94,6 +98,8 @@ static void simplefb_destroy(struct fb_info *info)
>>   	if (info->screen_base)
>>   		iounmap(info->screen_base);
>>   
>> +	framebuffer_release(info);
>> +
>>   	if (mem)
>>   		release_mem_region(mem->start, resource_size(mem));
> 
> The original problem with fbdev hot-unplug was that vmwgfx needed the 
> framebuffer region to be released. If we release it only after userspace 
> closed it's final file descriptor, vmwgfx could have already failed.
> 
> I still don't fully get why this code apparently works or at least 
> doesn't blow up occasionally. Any ideas?
>

I believe that vmwgfx doesn't fail to probe (or any other DRM driver)
only when there are not user-space processes with a fbdev node opened
since otherwise as you said the memory wouldn't be released yet.

unregister_framebuffer() is called from the driver's .remove handler
and that decrement the fb_info refcount, so if reaches zero it will
call to the fb fops .destroy() handler and release the I/O memory.

In other words, in most cases (i.e: only fbcon bound to the fbdev)
the driver's removal/ device unbind and the memory release will be
at the same time.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

