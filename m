Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB09452E96
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC7C6EC1B;
	Tue, 16 Nov 2021 10:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AC76EC1B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637056903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=533DJPrDDxlMGTv0pnxjgO+BwgxyEzDlbPhO6HwlUb4=;
 b=IMJbRc71ULBSUHRPlKAJ1ahgAjNowOWQB2GmfGP+vIwUepZsFkxjbpNP7vsa+u23uSzUzw
 IhsYXBYXk8eMPmSWezzdYvK0kjNCJZ3/DPkgs4g6wLAuBj8OvOEm1W9TwdLqBTFhtcVeUT
 VzDSNKR+SMFOf7JUZ6ZlejVOT3dh0uo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-VQybe3dsNOedTvtoNa79ow-1; Tue, 16 Nov 2021 05:01:41 -0500
X-MC-Unique: VQybe3dsNOedTvtoNa79ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso503770wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 02:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=533DJPrDDxlMGTv0pnxjgO+BwgxyEzDlbPhO6HwlUb4=;
 b=ohRJVYzTvePnsIsm+GI2CQHY8i2ZIkhsbn6OTPBCVUu8eoAydaUsSVEBnytoskEsAl
 xUESwnGn2EZV94RLME9iBIaeZr57NiunUyHWcUYSGfbh9Bhc30fACtH4GJKyiYkepYb1
 A49E/T48rl7cGPiEUmApZvu4iodv7wyswRllim+RruxPt4Ia5W124VLm0fDbf1hZSch9
 P5YR6zP0bVvnmD1RTPCMg40t97RX3vhs1fDNZRYPKG9BAkf0i6CgR8rYJRal82C0tzh4
 zu9bs0U/i22w8L3vqVb+XwkXjeIaLhsWdbrwQs4ysUdvvKMoM9wdgJOKpLKGLbL39eyi
 g1VA==
X-Gm-Message-State: AOAM533p/OyFYTTbOGTFd4bGh58jTStTT+us1jUnEXtOonhF5TPwq5No
 5wmfIFkrM+VNmjExJ9B3weg10lEKef0CZifC9k/q9y4uEWQKPNfOSrN4nF3N/vbMkKcZY//EiGy
 MpIKbLZ7SvRn1mwN8hmaJEYSUE0eM
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr6163764wmj.156.1637056900562; 
 Tue, 16 Nov 2021 02:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlGjWi8alUIqPMmPz5/NWCmPlLiqtCNyw7It2G0hrbpLCRkisY1dNBJt1D//kFA9f//Tcinw==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr6163736wmj.156.1637056900360; 
 Tue, 16 Nov 2021 02:01:40 -0800 (PST)
Received: from [192.168.1.102] (91.pool90-171-47.dynamic.orange.es.
 [90.171.47.91])
 by smtp.gmail.com with ESMTPSA id t11sm16568630wrz.97.2021.11.16.02.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:01:39 -0800 (PST)
Message-ID: <7cbadb2a-b6e9-f264-9d95-b76c7071af27@redhat.com>
Date: Tue, 16 Nov 2021 11:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211111111120.1344613-1-javierm@redhat.com>
 <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
 <579a584a-68af-d5c9-0547-30cb1592d46f@redhat.com>
 <CAMuHMdWotEN1TtTr7douLkQPkpXE-rQgamM3GOYO1XNHbUiguw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWotEN1TtTr7douLkQPkpXE-rQgamM3GOYO1XNHbUiguw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 11/16/21 10:43, Geert Uytterhoeven wrote:

[snip]

>>
>> So this is already a fragile solution and $SUBJECT doesn't make things worse
>> IMO. Since not having something like this can lead to issues as reported by:
>>
>> https://lore.kernel.org/all/20211110200253.rfudkt3edbd3nsyj@lahvuun/
>>
>> We could probably do some smarter here by providing a function that checks
>> if the registered fbdev drivers matches the aperture base. But I'm unsure
>> if that's worth it. After all, fbdev drivers are likely to be disabled by
>> most distros soon now that we have the simpledrm driver.
> 
> Checking the aperture base is what was done in all other cases of
> preventing generic (fbdev) drivers from stepping on specific drivers'
> toes...
> 

Ok, I can re-spin the patch checking if the aperture ranges overlap. There's
an apertures_overlap() function in drivers/video/fbdev/core/fbmem.c that can
be exported for fbdev drivers to use.

Another option is to just say that DRM drivers should be built as a module if
the {efi,simple}fb driver are built-in.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

