Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65D51BFFA
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66CF10E52D;
	Thu,  5 May 2022 12:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F421D10E4EA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651755440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTd20GZszus523uhiNPKiPtuh2Omx+Yn3OmwG/k7wIo=;
 b=Sa7mHQ4mYa7Dm+f3Q5wEEWZhDHvaqZbxw0MKwQh8/fFZczZoSpQSzpYx0d5U3AuMFIs9IR
 S01PMfmvqet3jH8CtHadzm9naoCMkAhfghZeTJpsaJxqtCipKNsMpbPZnuE6JUX+oq6GPa
 JdVdBt7lnhaeWg4jumXWYPk+t2pwEjM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-Bt-TtoVvNAOZ_Mb30ZIc0w-1; Thu, 05 May 2022 08:57:19 -0400
X-MC-Unique: Bt-TtoVvNAOZ_Mb30ZIc0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso4469055wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LTd20GZszus523uhiNPKiPtuh2Omx+Yn3OmwG/k7wIo=;
 b=HGl/BBp+t1z6CER8EyFja2azHLTfcI5RkM7QYrcPA/b+uuCeDTZQ4LeGhFZdigRxBA
 kmHGeuOqFi4Kb/t76yvtkBLRxh+Qt+fVcWSz1UOIkMX6nUcwuNIYXePzm4GXHJo/ukYN
 0puZpF/qW6B4Oa4lxob6YLfBAIWIYf7EmGKmG77cWUp06KxCXqIQ9PK+M64TgaNTY6Qq
 1BkNWVXb8z9UDyU6yex4rAFslQeGVffBmN0hRrAdnhEpxR0nlcUgup9oz4zJcX4HxbCb
 ULb5YqkG+3zmMPa4azKnV71R+MRa3TWQEpYuPAw3hz4ljifNFOWIeJ0JfKZufuBoZihR
 0FEg==
X-Gm-Message-State: AOAM530tIN4K3jHutw/4covIFnG5nOvLS8t+CrBr+8x7389muxTONa3e
 7osJC1jbZi7fJwiT2wjQ3VgZC6VVXytJ3FlF9hg2T13Ki+7X3mCaibmA6pZh16K/sbdGali32s5
 3KvKuSallbidAGnNMiPXd2jZP1I1r
X-Received: by 2002:adf:e847:0:b0:20c:24f9:57d7 with SMTP id
 d7-20020adfe847000000b0020c24f957d7mr21058180wrn.284.1651755438721; 
 Thu, 05 May 2022 05:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNlA3f3CBGEHq3DExbENcRrELKVU9/LhEDR+qaqJ59JtiE6tFlZkZ+L9bNnPC7veaW19r8Lw==
X-Received: by 2002:adf:e847:0:b0:20c:24f9:57d7 with SMTP id
 d7-20020adfe847000000b0020c24f957d7mr21058161wrn.284.1651755438443; 
 Thu, 05 May 2022 05:57:18 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b0020c5253d8e0sm1143692wrv.44.2022.05.05.05.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 05:57:18 -0700 (PDT)
Message-ID: <54ade5e4-d277-1831-06f5-da482c76601f@redhat.com>
Date: Thu, 5 May 2022 14:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Hans de Goede <hdegoede@redhat.com>
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <YnPInuayAYQa1jmz@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnPInuayAYQa1jmz@phenom.ffwll.local>
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

Hello Daniel,

On 5/5/22 14:52, Daniel Vetter wrote:
> On Wed, May 04, 2022 at 11:57:22PM +0200, Javier Martinez Canillas wrote:
>> The driver is calling framebuffer_release() in its .remove callback, but
>> this will cause the struct fb_info to be freed too early. Since it could
>> be that a reference is still hold to it if user-space opened the fbdev.
>>
>> This would lead to a use-after-free error if the framebuffer device was
>> unregistered but later a user-space process tries to close the fbdev fd.
>>
>> The correct thing to do is to only unregister the framebuffer in the
>> driver's .remove callback, but do any cleanup in the fb_ops.fb_destroy.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> I think this should have a Fixes: line for the patch from Thomas which
> changed the remove_conflicting_fb code:
> 
> 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
>

Ok.
 
> I think we should also mention that strictly speaking the code flow is now
> wrong, because hw cleanup (like iounmap) should be done from ->remove
> while sw cleanup (like calling framebuffer_release()) is the only thing
> that should be done from ->fb_destroy. But the current code matches what
> was happening before 27599aacbaef so more minimal "fix"
>

Yes, I tried to make it as small as possible. Thomas pointed out that vesafb
has the same issue and I included in v2. I had move things around more there
though.
 
> With those details added Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Same for the next patch.

Thanks. I'll post a v3 adding what you suggested but probably not today.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

