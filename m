Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCD49CB21
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2018D10E30B;
	Wed, 26 Jan 2022 13:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122D710E30B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HO8OojRGDxiniZjv6SrW57XV+ZtoIr3bX0tnTNyRlq8=;
 b=RDkWD/Tk08hyfSBlCF3GFQp4ub3SduL52vmneWASFiJ7gGqLIux25sbbyXn32kJBxFKfrZ
 RPpPiWkAF84KNz5ow90pu7Fb0MYceHyU9ql8DoVo290OJuRmZu/vaHm2Bs8fp+uAck0X3t
 fGpP1NwdzvtVVH/AoFwr3DV6HhY2fUo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-4i80sNu8MumxIDUIgXr9vw-1; Wed, 26 Jan 2022 08:44:15 -0500
X-MC-Unique: 4i80sNu8MumxIDUIgXr9vw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i26-20020a1c541a000000b0034dc8bd7078so6602007wmb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 05:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HO8OojRGDxiniZjv6SrW57XV+ZtoIr3bX0tnTNyRlq8=;
 b=rzRpzddQodtOpdf7aTK2N3EKhNBC2usTCTykpspLDfM6lNe9HZy7ZQoVpHZgQq7iIq
 JP+zarsftdFniABANGTZd9PhqrhKS2Iqk4EzQjKtDUtYwCbjybUONIRRu2L0bqktc7QJ
 4hmCl/yHYPKLYVsZ5IUDD6yfIZZGBu/tjujSGFvgxAucGOfXz53qNMubPyKK3oZurA79
 KlI/mf/WHIcF4Z03oOD9mmFfruwc1QYesJ3ruL9gFEX0DrYi6huiIWMu61yFcSKX3ElQ
 rupldIXM4cVzM5H6bfjcJBhj7M7AB6igMAVtBR/+L7bXzergQe3BqIeEoV6OUdTMixX9
 wT0g==
X-Gm-Message-State: AOAM531kGanWxr1h7O+yvomEQjVbBnV74g3SXljhDzGQfNMlTubOvKGM
 dg5QrMfb7U4LZyd6awro10SLXu5vjrTMXrcfpng20sNSbEgD32BYlR7zun8Wp/ye+zPpqKEqqyW
 E/ZPeDbrEuXq03h3vszsNye2BfC4B
X-Received: by 2002:a5d:588d:: with SMTP id n13mr553774wrf.690.1643204654459; 
 Wed, 26 Jan 2022 05:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybzQqjbMputeacc2RjhaPfXtnrHwBB3Q4bMgXV2bO3BAQz7ZnwzmTspSR3f1GLZrNkoUbXJg==
X-Received: by 2002:a5d:588d:: with SMTP id n13mr553763wrf.690.1643204654263; 
 Wed, 26 Jan 2022 05:44:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 11sm902476wrb.30.2022.01.26.05.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:44:13 -0800 (PST)
Message-ID: <9b426301-bf41-0312-c34e-856938b196fd@redhat.com>
Date: Wed, 26 Jan 2022 14:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
 <20220126102858.GX1951@kadam>
 <1b665bb8-7acb-519b-0a02-ef0f2dd4b524@redhat.com>
 <YfFE61IQus3SMQRZ@kroah.com> <YfFKLfSKUdo1UVfF@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFKLfSKUdo1UVfF@smile.fi.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 14:18, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 01:56:11PM +0100, Greg Kroah-Hartman wrote:
>> On Wed, Jan 26, 2022 at 01:37:00PM +0100, Javier Martinez Canillas wrote:
>>> On 1/26/22 11:28, Dan Carpenter wrote:
> 
> ...
> 
>>>    fb_hx8347d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
>>>    fb_hx8357d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
>>>    fb_ili9163.c (DRM driver in drivers/gpu/drm/tiny/ili9163.c)
>>>    fb_ili9341.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)
>>>    fb_ili9486.c (DRM driver in drivers/gpu/drm/tiny/ili9486.c)
>>>    fb_st7735r.c (DRM driver in drivers/gpu/drm/tiny/st7735r.c)
>>>    fb_st7789v.c (DRM driver in drivers/gpu/drm/panel/panel-sitronix-st7789v.c)
>>
>> I'll gladly take a patch that deletes the fb_* files that are already
>> handled by a DRM driver like you list here.
> 
> None of the DRM driver supports parallel interface for these devices.
> 

Thanks for the info. Then we can't remove any of these drivers indeed.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

