Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993434AF4F1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A82010E29F;
	Wed,  9 Feb 2022 15:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E818F10E273
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644419826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZD9dCqlbkWPQFIsrIeQChrUtyGkYhsH8g7u08/+oBc=;
 b=LfvE4fEkE2vjAdNDFLd0GiiIMckQHn3L5/8ZhYdyJs0knwylfBbWgLnfCAs8jQbo+CxxyZ
 r5jbuyejRvZALiZJtP0xmyjmK2GaMCxe5kOFd6pC6jNiJirjEFOx2qE1SK2LB6w4kEbaci
 sMwHkgchUpkLlg7nzlHfPd+hskmqXRk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-k2wpLaElMDOQa1M5YokZBA-1; Wed, 09 Feb 2022 10:17:04 -0500
X-MC-Unique: k2wpLaElMDOQa1M5YokZBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1213508wrg.19
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 07:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZD9dCqlbkWPQFIsrIeQChrUtyGkYhsH8g7u08/+oBc=;
 b=TxzfWGlZgQukjyeL8TZpvnyueqVnc5XmAwcUvJIVIfkXREgoODX9ztqdaO+rV3bHYz
 JydmfU1LOeP/frG1iLlVrnuyDFR+QRvlhTQHNxuM4YzfP8dNO0QwIZID55XWD+oufDB4
 +4Plyfaqzxq8h+oKWFiLAX2Qdw3zymPsuVGJAI7ghTBlootyaEOVyGqoJB4ViMYgROQy
 EUtNRS35Ne+eEMW+pn2tEvRKJsAsRKNdC2DgE0LWt88VvWcmCPttrGIYedLfniap4UcA
 h9G/XHOB5rV4Lh+z1UREBXOfgJRZo5R/8UxRKu/i2n3Pp5OeEXITyEfqJVzmiQAW8aSh
 iOng==
X-Gm-Message-State: AOAM53046WrbZDbVHSRJ4oDrTxdevEq94Jrctp8AaIcjHdDF+teYMhe+
 KiGRuYXG2eE4AIfwJVrhecWsCS3CA7gUwiG2il/dYdNZRLP10wosYjslO2+XhG+QKGVjLjMsj3+
 ZcU0zgYWq9yUgOh/IelAEGbes2fZN
X-Received: by 2002:a5d:400a:: with SMTP id n10mr2558440wrp.603.1644419823606; 
 Wed, 09 Feb 2022 07:17:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwBI5JHyrlxNbjKeheaShrdmdoiXX+Yt+7r3vslDt7sGcUMaDwOeXIfrlF8TXqbtzjMD2TuQ==
X-Received: by 2002:a5d:400a:: with SMTP id n10mr2558428wrp.603.1644419823415; 
 Wed, 09 Feb 2022 07:17:03 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p8sm18149378wrr.16.2022.02.09.07.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 07:17:03 -0800 (PST)
Message-ID: <600f0f72-4af8-1c43-33a5-a0b5ef97c3c7@redhat.com>
Date: Wed, 9 Feb 2022 16:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
To: Mark Brown <broonie@kernel.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPE8Z7HxU2wv7J/@sirena.org.uk>
 <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
 <YgPOKf1QcOCtTisx@sirena.org.uk>
 <561e1f22-2741-b414-0267-14587d59d5de@redhat.com>
 <YgPX3WZRvnWBuV18@sirena.org.uk>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPX3WZRvnWBuV18@sirena.org.uk>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 16:03, Mark Brown wrote:
> On Wed, Feb 09, 2022 at 03:50:13PM +0100, Javier Martinez Canillas wrote:

[snip]

> 
>> But I understand why the Device Tree binding and fbdev driver used VBAT
>> since that's what the documentation mentions.
> 
> What is "the documentation" in this context and how is that distinct
> from the datasheet for the display controller?  In general the consumer
> driver should be using the name from the datasheet and the regulator
> itself should get a regulator-name reflecting the name in the schematic.
>

For "documentation" I meant the datasheet that mentions VBAT but I got
what you mean and will also propose a change to the binding to rename
the property to vcc-supply instead to match the pin name in the device.

>>> It is depressingly common to see broken code here, unfortunately
>>> graphics drivers seem like one of the most common offendors.
> 
>> I'll include a patch for the existing DT binding and mark the vbat-supply
>> property as required. Probably we won't be able to change the fbdev driver
>> without causing regressions, and I'm not interested in that driver anyways.
> 
> There should be little danger of causing regressions given that a dummy
> regualtor will be provided when one is missing.

Right, I forgot that a dummy regulator is provided in that case. Perfect.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

