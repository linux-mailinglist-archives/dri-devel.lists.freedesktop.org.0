Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264249C9D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 13:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4666E10E51B;
	Wed, 26 Jan 2022 12:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF46310E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643200625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TS0TGM1vcAom1pyqONn2J8siKmdxKUcGnkktOHArQk=;
 b=Pj6r588LXzcVpW9mIhT/S65C6shHD+GNcMEZpfXBFPbqT4YY4AizPdYwAHFcjpfecXmTQC
 jvbiVdA7WAFMhPqK+t24v9OxGv9C5DVWd9qImhXlght8wE/EL6404sre+BoEPqOY+MP86P
 Yy4eCW3WTELwOCPcfNiIHjnMIl0lRUc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-YzxCmeIMNMWgboQec99svw-1; Wed, 26 Jan 2022 07:37:03 -0500
X-MC-Unique: YzxCmeIMNMWgboQec99svw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j26-20020adfb31a000000b001d8e22f75fbso4252214wrd.20
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 04:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4TS0TGM1vcAom1pyqONn2J8siKmdxKUcGnkktOHArQk=;
 b=Dnaw9Irowr5Qb18S5jOyiJuUnU0BnFppenJFh8IRoxoWemeVl1zedJVfVvqnwm+mfZ
 rnwc3uJt4ta43h6Dr1w02MXJZXDRIPIL2nwHkc4/i424ZDw2eXiHHZ8RKk27pNXzaAvv
 giIvCPo6O7HXsSiJqhrQFR+kfRTLGw//DDcQGc+pBqRcK6kf12VLOWJIxSburOkKIe+b
 Rf7ek71sBfjMHORrpLjbPQFc5OL5Tccj5hrO/pimLCexYCf9srXE5TkCdf6WypinpJqn
 CYHT2LROphFGGw0C21a5Oi41xJqtOyW5LRpGjzfueXlIMB4ANQLqabB8yOiTzdKkNnpN
 W+DQ==
X-Gm-Message-State: AOAM531iDyQu1Hm+s2ygwL5zF3oM/rwLB3UEBBwhXQFQGXWVkOhru2Ey
 eSqUsIntcF6RvLuBkzvkwnS0esR0QvGTrWXkuXxRAt6UuWI5AmzkVcawrZLNZ+KY4MZ3HHcBIke
 ctR04KMBVSrU/zTNUgL80P2Sm6OiY
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr7129432wmk.100.1643200622737; 
 Wed, 26 Jan 2022 04:37:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFeRqcMR4sp5TihDa0aCwBpHf/6PAChPHR3bf/s902hBLlOchViJcHCwGI8NoHTi6Uqd/TdQ==
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr7129411wmk.100.1643200622473; 
 Wed, 26 Jan 2022 04:37:02 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i6sm3207248wma.22.2022.01.26.04.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:37:01 -0800 (PST)
Message-ID: <1b665bb8-7acb-519b-0a02-ef0f2dd4b524@redhat.com>
Date: Wed, 26 Jan 2022 13:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
 <20220126102858.GX1951@kadam>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220126102858.GX1951@kadam>
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
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 11:28, Dan Carpenter wrote:
> On Wed, Jan 26, 2022 at 12:04:26PM +0200, Andy Shevchenko wrote:
>> On Wed, Jan 26, 2022 at 12:02 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
>>
>> ...
>>
>>>> But why? We already have DRM drivers for some of these devices.
>>>
>>> No, we do not (only a few are available).
>>
>> Sorry, I missed your word 'some'. Some == almost none from the list (I
>> don't remember exact numbers but something like 2 out of 10 are
>> supported by tiny DRM and see about interfaces).
> 
> Could we get an exact list?
> 

The list AFAICT is the following. I'm not familiar with these so please
feel free to correct anything I got wrong here.

I've marked with '?' if found references to the device supported by the
fbdev driver in a DRM driver, but it's not clear if support the same HW.

Drivers in drivers/staging/fbtft:

   fb_agm1264k-fl.c
   fb_bd663474.c
   fb_hx8340bn.c
   fb_hx8347d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
   fb_hx8353d.c
   fb_hx8357d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
   fb_ili9163.c (DRM driver in drivers/gpu/drm/tiny/ili9163.c)
   fb_ili9320.c
   fb_ili9325.c
   fb_ili9340.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)
   fb_ili9341.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)
   fb_ili9481.c
   fb_ili9486.c (DRM driver in drivers/gpu/drm/tiny/ili9486.c)
   fb_pcd8544.c
   fb_ra8875.c
   fb_s6d02a1.c
   fb_s6d1121.c
   fb_seps525.c
   fb_sh1106.c
   fb_ssd1289.c
   fb_ssd1305.c
   fb_ssd1306.c
   fb_ssd1325.c
   fb_ssd1331.c
   fb_ssd1351.c
   fb_st7735r.c (DRM driver in drivers/gpu/drm/tiny/st7735r.c)
   fb_st7789v.c (DRM driver in drivers/gpu/drm/panel/panel-sitronix-st7789v.c)
   fb_tinylcd.c
   fb_tls8204.c
   fb_uc1611.c
   fb_uc1701.c
   fb_upd161704.c
   fb_watterott.c


Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

