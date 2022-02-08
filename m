Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5214ADD02
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D0910E64E;
	Tue,  8 Feb 2022 15:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112E910E64E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3+ygx7WT3LgjARaNLFe1zhALwKjcISILkzjd4t3g78=;
 b=QrBnP80borMCiE9iMIYH0/RL+5dFSfYpD2wxs02qMZFaeCYJRgeAuHDrlEpf8YzRGS2Y0T
 +jgpSyp+MOifsvLvBjyA+TvQCSoSjXRkKHGPvFMUNEGDrGXTiVsONPs/yz7yChXnMvjEAS
 9nF+157J6zhEEr8TrSh2SjNhn0OF0z0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-gOc3cbvxN2e5qnZHyz6-Zg-1; Tue, 08 Feb 2022 10:40:15 -0500
X-MC-Unique: gOc3cbvxN2e5qnZHyz6-Zg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so1382988wrp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 07:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R3+ygx7WT3LgjARaNLFe1zhALwKjcISILkzjd4t3g78=;
 b=BiBvjxnUEufR+GctQqRTOolCg8huEvOHcCwva4YbnV90yme5uS5MJTlrXOc1z7ksn2
 y1tkjCuhfNOzk6xI8/g5+0a7a4VOnlY3/yqDWeZsyfTBQuFnAY7GRbIuNp831tnCJ0hi
 U99Hx+y5anGIqnr864x8mU1Faq8FbokCYbCfmPOGZE7SR+fIU4/C4iqQe40+C4ZcLUxq
 hnZ5QshU5i4oQDmJIYjXHP1xlfhGyHBoeDM/9L9IG4bBbn8J482QkHnlRqQp1+cRqVBe
 0TWdbEKVFtwcu4omvrL2XOAEF0K2ltaA6Blzav8d00jYt0qsbPzCjfKtlBhjuymUFYjE
 1Y3w==
X-Gm-Message-State: AOAM531wQoVrkRaR23Rnew1StwR1pm/09bczFWcRdr6Ky68R/IzV4uGH
 b1Md5OWByhqJFP3ULhLXOoQg2YCS6cyAyBhNfbIqQQHsIx6iqkjz3rmDcyQIWgyC5C7+NXChSbZ
 PYlk1viJcmq6LZA8D3eTVXJkLp2iY
X-Received: by 2002:a5d:588e:: with SMTP id n14mr4244921wrf.45.1644334814511; 
 Tue, 08 Feb 2022 07:40:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgsRW+lrC/D9yn6NeNRRQqunCaYEb9CMC26g+Mn3KPfiRrXRhLKFGC8C3j1dq2BkDZsEKSLg==
X-Received: by 2002:a5d:588e:: with SMTP id n14mr4244901wrf.45.1644334814281; 
 Tue, 08 Feb 2022 07:40:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id v18sm9972089wrm.105.2022.02.08.07.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 07:40:14 -0800 (PST)
Message-ID: <02d5b225-e1a8-77f6-7e4e-18d6a1df5e48@redhat.com>
Date: Tue, 8 Feb 2022 16:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
 <CAMuHMdWvrJip+W6ZZoO2ZURLc5CYmFno3=Sa2mL4xJE8gMzFqg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWvrJip+W6ZZoO2ZURLc5CYmFno3=Sa2mL4xJE8gMzFqg@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/22 16:23, Geert Uytterhoeven wrote:

[snip]

>>>   - The logo (I have a custom monochrome logo enabled) is no longer shown.
>>
>> I was able to display your tux monochrome with ./fbtest -f /dev/fb1 test004
> 
> I meant the kernel's logo (FB_LOGO_*),. Obviously you need to enable
> a smaller one, as the default 80x80 logo is too large, and thus can't
> be drawn on your 128x64 or my 128x32 display.
>

That makes sense.
 
>>>   - The screen is empty, with a (very very slow) flashing cursor in the
>>>     middle of the screen, with a bogus long line next to it, which I can
>>>     see being redrawn.
>>>   - Writing text (e.g. hello) to /dev/tty0, I first see the text,
>>>     followed by an enlargement of some of the characters.
>>
>> So far I was mostly testing using your fbtest repo tests and all of them
>> (modulo test009 that says "Screen size too small for this test").
>>
>> But I've tried now using as a VT and I see the same visual artifacts. I
>> wonder what's the difference between fbcon and the way your tests use
>> the fbdev API.
> 
> Fbcon does small writes to the shadow frame buffer, while fbtest
> writes to the mmap()ed /dev/fbX, causing a full page to be updated.
>

I see. Thanks for the information.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

