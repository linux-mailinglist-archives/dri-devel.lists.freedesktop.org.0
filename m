Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1794B259B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8E10EB2B;
	Fri, 11 Feb 2022 12:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E8810EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644582436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1jepOygsJ0wYycqVUlKRQbdzNQ74bbTHpehDmycDkk=;
 b=EAhFS3IgC2BMRH9zRewutnPBEsrinK0oh0rBMk4F+rpLgBHpn656Lddz2uBsfsPSmWehlp
 9p+dDp8HLB7QtYp8KQ+/pj4/IQwmnC3rx1ue5b3vAEPqu0z8pyqQHWn3J5qTMqcl1fA+U6
 sZCRnKRn/wVnhRpssyA26o/qJ2YQASA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-hylnLeKNOYiwe6rjVUrZ3g-1; Fri, 11 Feb 2022 07:27:15 -0500
X-MC-Unique: hylnLeKNOYiwe6rjVUrZ3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 r187-20020a1c44c4000000b0037bb51b549aso2338371wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r1jepOygsJ0wYycqVUlKRQbdzNQ74bbTHpehDmycDkk=;
 b=GSNEhqZSFakKZOrgAi2geJqqDNSgEnbPG1gt00TJ5hudKuz4L2K7mwjkjTVsY4hLQ+
 rh37O+ys4RXnghFfP5PGpj4N+ASeCxW8ZY3b2PQwxUtWZ/DfNqSUP7ehfPufgEvQoti2
 PpqFViNHrtdkDqNVPj1wim0Nma0Z16yDlyj4iXDoyFNkGoBNjC7WD34Yv3vGi4huw0MM
 TDSbVNSBecdbEn6nOJ60QgvlIFHQvXOrVUyHS7Siuol++XdEWL/i/VbCkqns+g0Sgf6I
 wLNmIRuqpEimXTwB1JmcbqBvM/TnT6JBXBf/G3IIWylVaDJckbvtg6aPrq5Nxi17EGDm
 D97g==
X-Gm-Message-State: AOAM530pwjT9GsoZeJYdZTgedfvP6AbEr37OyupdYlTFnfSb4hkP3o/I
 8v/pp057bnPLNGN3yj2OtvdgY70sYiz34OeN5R1yeio3HSvpPWYh5etQAVocV3fw6Kjgth7Jq2M
 qL/HxhiXvt1J1+IJC/NhsHhlJHI0n
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr123164wmq.44.1644582434719; 
 Fri, 11 Feb 2022 04:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaaXjuAalsbgKE6EbrXu5SqtOSmJENkbXZFXygd5mgtIEYu0s5C8pQoelvrRAkNY3tZZipuA==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr123141wmq.44.1644582434492; 
 Fri, 11 Feb 2022 04:27:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id t18sm22645638wri.34.2022.02.11.04.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:27:14 -0800 (PST)
Message-ID: <5b451266-0217-fc4c-794b-453c4e6439f6@redhat.com>
Date: Fri, 11 Feb 2022 13:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-4-javierm@redhat.com>
 <YgZJpi4llqr93U9Y@smile.fi.intel.com>
 <eed8200c-7716-ce4f-dac5-bd6f0345b631@redhat.com>
 <CAMuHMdVLmUwgCWui4OiZqvqpVWzA-d9QhjZLa_idgC19XeEEjA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVLmUwgCWui4OiZqvqpVWzA-d9QhjZLa_idgC19XeEEjA@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/11/22 13:23, Geert Uytterhoeven wrote:

[snip]

>>>> +    if (IS_ERR(bl)) {
>>>
>>>> +            ret = PTR_ERR(bl);
>>>> +            dev_err_probe(dev, ret, "Unable to register backlight device\n");
>>>> +            return ERR_PTR(ret);
>>>
>>>               dev_err_probe(dev, PTR_ERR(bl), "Unable to register backlight device\n");
>>>               return bl;
>>>
>>> ?
>>
>> No, because this function's return value is a struct ssd130x_device pointer,
>> not a struct backlight_device pointer.
> 
> Hence
> 
>     return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
>                                  "Unable to register backlight device\n"));
> 
> ?
> 

Thanks, that would work.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

