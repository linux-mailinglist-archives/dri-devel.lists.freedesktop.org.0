Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C54A5D2E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930C710E187;
	Tue,  1 Feb 2022 13:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818FC10E187
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643720956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Swdbs0KGcPDJP8bHPLb5XLPBG6TEyMwLGc8obCIfC/8=;
 b=LEGsYCBg7TXAAfayGgTaQjj9Vzdj4ieCDTShYxGeR3lcaRXgrGEKNDhBXkPSKQa14zEFQl
 YTKGADDAU6zX18sAdMuO6OPgCfYxE+ppUvRFnZ/q4Zm67ZnQkiYv4YZeN1wQN69YMMW3SE
 FbZJ4y/TUFDJZApCGjb93w3Hj96rUdU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-VUGULBmzPUaVaeMby3w1cg-1; Tue, 01 Feb 2022 08:09:15 -0500
X-MC-Unique: VUGULBmzPUaVaeMby3w1cg-1
Received: by mail-wm1-f70.google.com with SMTP id
 q127-20020a1ca785000000b00352a4860babso963086wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 05:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Swdbs0KGcPDJP8bHPLb5XLPBG6TEyMwLGc8obCIfC/8=;
 b=D3dheybFV2NsM5onRB2dHXYwjsNxoaq1RcRWdzquVFDewjJlIheSnl5er9F5+oRmtf
 8/ks4m4ofpooFLW3ELsIPu8gh/oV2TwdFDdTzDYUPcpJm2Wf0IB4D9McvU5M880p9L/a
 greAQlYg7P7x9/hXb6JznFtbtcQeXFTkhTC8o+FUGrXSzE1iROk6b+U5rLwCgPkbNNWO
 ot4LtZLkJS9E6wuEme0flIEPJTcRMlKppP54Y2+O5O+Symjp5MU1ZgbflVtHHXccHbl9
 zpThIIFMf6UncvsT1ngJLMP4SL2bnndHwmje+ouiddLwBN3OSqe6gDcRw7h6Le83w9pB
 9bJA==
X-Gm-Message-State: AOAM5339bV2mhxptMaCJPMFKGvQ7pRh3sosK1bQ0EXz1QRfEkv3Nojx7
 +Sbu/fdO7Gm6OY3VpjqoK3NyvWm9QFuHP0YjXMvls8ZhGSNPXnFcceJx6eKAlyvoQJ+qSOXkEVS
 5XMSjAXloGBGq0CaZt8UkJwlC2kg7
X-Received: by 2002:adf:e352:: with SMTP id n18mr21470528wrj.186.1643720954339; 
 Tue, 01 Feb 2022 05:09:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOn1oxGJgGYrZTitNon0Jegeh+MsCQ2kZKpT+TAayFOqeP9U5cQ7Py9fW0vZeynCe+/FW0Dg==
X-Received: by 2002:adf:e352:: with SMTP id n18mr21470498wrj.186.1643720954131; 
 Tue, 01 Feb 2022 05:09:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l29sm3177560wms.1.2022.02.01.05.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 05:09:13 -0800 (PST)
Message-ID: <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
Date: Tue, 1 Feb 2022 14:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org> <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
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
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/1/22 12:38, Geert Uytterhoeven wrote:

[snip]

>>
>> Since the current binding has a compatible "ssd1305fb-i2c", we could make the
>> new one "ssd1305drm-i2c" or better, just "ssd1305-i2c".
> 
> DT describes hardware, not software policy.
> If the hardware is the same, the DT bindings should stay the same.
> 

Yes I know that but the thing is that the current binding don't describe
the hardware correctly. For instance, don't use a backlight DT node as a
property of the panel and have this "fb" suffix in the compatible strings.

Having said that, my opinion is that we should just keep with the existing
bindings and make compatible to that even if isn't completely correct.

Since that will ease adoption of the new DRM driver and allow users to use
it without the need to update their DTBs.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

