Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1749304F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 23:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E4F10E295;
	Tue, 18 Jan 2022 22:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7A310E65A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 22:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642543670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0sGw2ZPYXzHKweBVhujAqyZsD9cCnAGET6DRlSS3ng=;
 b=P3O32oUZWQd/9w4q5Z4NWe+p5VtaCdxnN9ztApzmyybZdEO+DeonIJF2bjuVwWnxZ9jXGJ
 oQXv3Intxw5TnHm8OC13iuUoX3zPkQ7/w2f7XUaeTzY9n+uO5fkIpJN/ON05qAMoMBdRsI
 BURPD+9ijnQEFVFgoSYq604jH2onm7k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-34oJlbudOxqEPE3VBy4r7g-1; Tue, 18 Jan 2022 17:07:48 -0500
X-MC-Unique: 34oJlbudOxqEPE3VBy4r7g-1
Received: by mail-wm1-f70.google.com with SMTP id
 b2-20020a7bc242000000b00348639aed88so211195wmj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 14:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=d0sGw2ZPYXzHKweBVhujAqyZsD9cCnAGET6DRlSS3ng=;
 b=POMkmHOaGydap/tyVa5f7QuwXSsZ4X0whtPFiqcQP72c5zJHp71NEftHekauYNbyf8
 hcylN2nP6tis2c2gmyHGs96DYrCxpXxSO+k+jtt5F/H/H1w0bSeptYVRQpdMP82e1MDp
 jo/kzeBFaEP4zSpIVc2hTJUP+viJy9wOjqSQJ9y3wb7rhqTdVfgmFzTjPWx9DUX00tzQ
 EFnAc05R6Arhrkqtb04eRxZeZjPYyhVLB3QZ9als8g/J9EYEK0V4dao6uyN33fvtHXGl
 lV/O1/AMeOrYUT0xNjlGmZM66YjNM/fWXG7Kn+kGieACJTzR06voUsloU4KaO/Pzy5R5
 eOOw==
X-Gm-Message-State: AOAM533HDGz8xsOXpgsNZo9eywq3PzT5qjC1bGAseOP4FOAhJGZYd8Ut
 Xmzd4wrmGsatb4Yft67YUQNKv6hS2iz8ywGuIXVpjXJgZ4dwdgJ+Ch7rTaNIeOYeAa0HrtLFiTD
 rGDe+ou1KzEjBc6Bz28+PE+LQCLzh
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr534859wmg.80.1642543667240; 
 Tue, 18 Jan 2022 14:07:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmsLGGsfiN9P0Bu5mv4S4OEuLIMtNzK5eJHhUjfMgF1/wws1jiVjLlCMibHenYl081/ffkoA==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr534847wmg.80.1642543666981; 
 Tue, 18 Jan 2022 14:07:46 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id az32sm3619067wmb.2.2022.01.18.14.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 14:07:46 -0800 (PST)
Message-ID: <34f43b01-bcaf-fb93-9148-5d65a35b974e@redhat.com>
Date: Tue, 18 Jan 2022 23:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/vmwgfx: Stop requesting the pci regions
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220117180359.18114-1-zack@kde.org>
 <1c177e79-d28a-e896-08ec-3cd4cd2fb823@redhat.com>
In-Reply-To: <1c177e79-d28a-e896-08ec-3cd4cd2fb823@redhat.com>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/22 20:00, Javier Martinez Canillas wrote:
> Hello Zack,
> 
> On 1/17/22 19:03, Zack Rusin wrote:
>> From: Zack Rusin <zackr@vmware.com>
>>
>> When sysfb_simple is enabled loading vmwgfx fails because the regions
>> are held by the platform. In that case remove_conflicting*_framebuffers
>> only removes the simplefb but not the regions held by sysfb.
>>
> 
> Indeed, that's an issue. I wonder if we should drop the IORESOURCE_BUSY
> flag from the memory resource added to the "simple-framebuffer" device ?
>
> In fact, maybe in sysfb_create_simplefb() shouldn't even attempt to claim
> a memory resource and just register the platform device with no resources ?
>  

Answering my own question, this would mean adding that platform specific
logic to the drivers matching the "simple-framebuffer" device so it should
remain in sysfb_create_simplefb().

But I still wonder if dropping the IORESOURCE_BUSY flag is something that
will be reasonable to prevent other drivers having the the issue reported
in this patch.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

