Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F10954A6CEE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1F410EE0A;
	Wed,  2 Feb 2022 08:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78B210E61D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643790571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0bztKGpIcohzL9Sc0p+LBRUNxZykmedDS+Nu+iWafY=;
 b=jP3FogmUpSQMnIc6qVTwgcY24oY0sPwkWTyVBBlp0tOfuO3iA/WzHUzaOolZWeby4SgYkj
 Ez4/ND3mxocMHMyu2Bn5MopW+LzXO9ndUHqYZX0fgI9AnKoK13DcHQl1UJj1OtnNlUrg/b
 MSfcchOM9iypwh+AdVKzLhc6dBwDrDI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-PmxsmsvxNkqYBvkYgTWJlA-1; Wed, 02 Feb 2022 03:29:30 -0500
X-MC-Unique: PmxsmsvxNkqYBvkYgTWJlA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n6-20020a05600c3b8600b00350f4349a19so1007614wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 00:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W0bztKGpIcohzL9Sc0p+LBRUNxZykmedDS+Nu+iWafY=;
 b=GBkKXpg2zSIm9PP+XF5CXKMeq+MKO0J6edKCRA2dh5mGTmyCA/LaPbHvQgWdnVpxjO
 /pxMr8Taepxw0S+oCXEEzvP8nWR6WSl4Tfk2XsN5jp0HPLgOyuqYLAOVeYApXGyeDOuB
 Ka9R3adAIowVNPad/sfGyhptjodwK8K07TMXW2KzFT4kU4l4GC4ziR/dasV2Di/ngViU
 +ku8RnMimt42S7IGqVz/hndNm8hLD8zWNgxchPPlfeFSjXZ7h4ndquAgv11GEWUGb2my
 ueGWJN9Fy/L08aM9FbiPjm6z+IZypAHr6z5ujfDJ5R7/sxm1ClJSBZbddGo8A8dvh5J0
 r61A==
X-Gm-Message-State: AOAM532AmF7Z4ve2brsO1+P0w3B2MapFsZc7AkxFV5qZ3AzfimNVRoTN
 fQZ3Aqwb4BVlCTTX/2jr9N5fDJ15pVUoejrqR6oZe+qR16DKv8x+m7VmQKvmw1dNWcb5wx7+dHM
 ldohzMEs55In9+3XIX2K+MwDuC5Vi
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr14123805wrw.483.1643790569358; 
 Wed, 02 Feb 2022 00:29:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyZ+ZXpYCgyI5AjaHIrkAs/aXj0KAcVKPE7/o7d9nr5TSaq8+Wpfx9p5zSxXVdSNWJTBqZEw==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr14123791wrw.483.1643790569132; 
 Wed, 02 Feb 2022 00:29:29 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n13sm4185614wms.8.2022.02.02.00.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 00:29:28 -0800 (PST)
Message-ID: <042a42a9-0446-1b29-beae-493882cc18ca@redhat.com>
Date: Wed, 2 Feb 2022 09:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
 <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
 <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
 <3df2add7-6034-0527-825a-74e62e76dace@redhat.com>
 <946f8fbb-cd64-12d0-ecd9-13af18a00590@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <946f8fbb-cd64-12d0-ecd9-13af18a00590@suse.de>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 2/2/22 09:23, Thomas Zimmermann wrote:

[snip]

> 
> Thanks to both of you. I was asking because I found the code to be 
> repetitive and it's not clear that these 3 statements belong together.
> 
> I'd like to suggest to add a function
> 
>    ssd1307_write_cmds(client, len, const u8 *cmds)
> 
> that loops through cmds and sends the values one by one. A call would 
> look like this:
> 
>    const u8 set_col_range[] = {
>      SSD1307_SET_COL_RANGE,
>      col_start,
>      col_end
>    };
> 
>    ssd1307_write_cmds(client, ARRAY_SIZE(set_col_range), set_col_range);
> 
> AND/OR
> 
> You could have functions that take a command with arguments; either as 
> va_args or with one function per number of arguments. Or you could 
> combine all these somehow.
>

Thanks for the suggestion, that a makes sense to me. I'll look into
it when working on v2. Probably during the weekend.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

