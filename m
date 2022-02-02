Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44654A6D07
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9552510EF5E;
	Wed,  2 Feb 2022 08:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD9689E03
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643791135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQ96plJnExVz4IofZgZgy11FIOo1veP7nuoBU4KJMcA=;
 b=BQmHESqj7So+lESTgNlrXx12KcqJ3SGlSnqbUdeIlnOt3tKjzBvXxDV41RnR54R0yfUfJu
 06JSlQkc7butqaeEC/TdQ5eYG6XMhfZ5Ywga6YikkPbmvlchYrs9qMwMh2bDRLSn21JkoT
 /d9U9GsE9K1hS1tBz4jgxYb70LQz5Vc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-16G7k0M_MIuA-d8B5_YaPA-1; Wed, 02 Feb 2022 03:38:54 -0500
X-MC-Unique: 16G7k0M_MIuA-d8B5_YaPA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so6579141wrg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 00:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IQ96plJnExVz4IofZgZgy11FIOo1veP7nuoBU4KJMcA=;
 b=S1AkhssntzslOjUfJ+3W42xKiZSeBxKTjZvp3vcQtyOOIW/6S1hy0X8w/O9sCMi+nQ
 OSorxpH4V6HDExiujDS7s1TicGikU+IwiNqJjUf6ojhNy2CP+L2gzbKZ95zKBZPrIjmu
 XGErIMtV4wNJ2gALwZ0k/uJ25dMwDcUAukkj6p9yyoEvdqNAaTw21qsDGV0DTNYj5DJJ
 3wN1ey8yRfzKh9qmwwOioRvldjvvwvg9ohOu7gZDlGu2uriy4lTfct5xkVyonPyuWyo7
 ZWf2RQQdWttIZ9kQlJyO0xO4A+EOtoSXXTeI5PqHqaZNt/hkyklQSIYfRV5UK7rwlICq
 yLhA==
X-Gm-Message-State: AOAM532QMj7nifHcOktjAdDoWWbT0HUAy+ivQRwJnHHk0phGPDH8dPJk
 LQM2mOevSzv8F4XUebxaqwpAX1iQgAmNHYCzlWhAGxXGDFb6bT/afhF0pEUKPlpgHhyNvUC1E/X
 AJwEtg/FakDNaIdtUA6+im0yAqjdb
X-Received: by 2002:a05:600c:21c1:: with SMTP id
 x1mr5150566wmj.59.1643791133573; 
 Wed, 02 Feb 2022 00:38:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC9orog6Z8LfxDGH06ODz7grjUoMzfg+w2FlDgm3DeIkMP38HoKyw95IAqRi1WUhNTRJi28Q==
X-Received: by 2002:a05:600c:21c1:: with SMTP id
 x1mr5150546wmj.59.1643791133371; 
 Wed, 02 Feb 2022 00:38:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id z17sm3963598wmf.47.2022.02.02.00.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 00:38:52 -0800 (PST)
Message-ID: <e552caec-5136-f4b2-12dc-23b182ab8af6@redhat.com>
Date: Wed, 2 Feb 2022 09:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org> <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
 <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
 <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
 <YfmaqUBqCrgp0QdO@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfmaqUBqCrgp0QdO@ravnborg.org>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 2/1/22 21:40, Sam Ravnborg wrote:

[snip]

> 
> I took a look at the datasheets - and all ssd1305, ssd1306 and ssd1307
> are the same. They have timing constrains on the Vcc.
> The random schematic I found on the net showed me that a PWM was used to
> control the Vcc voltage - which again is used to control the brightness.
> 
> All the above has nothing to do with backlight - I had this mixed up in
> my head.
>

Yes, same here. I was leaning towards fixing the DT binding but then due
Geert comment and after reading the datasheets for ssd130{5,6,7} like you
I had the same understanding.

Glad that you agree.

[snip] 

> 
> Last I recommend to drop the fbdev variant - if the drm driver has any
> regressions we can fix them. And I do not see any other way to move
> users over. Unless their setup breaks then they do not change.
>

As I mentioned in this thread I wouldn't propose to drop the fbdev variant.
I prefer to use the carrot and not the stick. Peter Robinson suggested to
make the driver mutually exclusive and add !FB_SSD1307 in the config symbol.

I think that makes sense and will do it in v2.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

