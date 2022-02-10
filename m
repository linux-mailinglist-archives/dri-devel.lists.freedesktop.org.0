Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757704B14AE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 18:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477D710E8BD;
	Thu, 10 Feb 2022 17:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4EA10E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644515754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pgYKgbH/aywvATf7zLUXZmomBX6TKWirDhHOAVvfKM=;
 b=eVQR5uF659s7XLAChq095rh4WV2hA0Pt7WCDVdLLkD7oqZv9p7Giljh167D/s7TlIU3zYH
 kPDfxGUhhKtzcXK0fUEhdxRwOaYjvlDosMVJXhVuR6OUBMItCYhkzeGdw+o0rx76QvqjyI
 3JNpYDD6UhohgkTGwTkTHYAgNzUk2/s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-OraBOEtOOA-KK7Uc4nTAPA-1; Thu, 10 Feb 2022 12:55:51 -0500
X-MC-Unique: OraBOEtOOA-KK7Uc4nTAPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r187-20020a1c44c4000000b0037bb51b549aso1164825wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2pgYKgbH/aywvATf7zLUXZmomBX6TKWirDhHOAVvfKM=;
 b=lESeaXHCDaKL/ejxUssJWNT/txfaSfQ7h4vxk83c8/ajGQO3ByPFaL7tNlqmmYMZVK
 g8j/Ca0d3jEXaDYM1Y7UiDmSOJdEG4bZ7NJhFIn34+md87b07+p34/Ddqz9yHq8MmC/d
 8ayDyudeJgSq9KaxrfLmYsTl9KWpd1R5WUQ0SP/j2SxIIEZBqR7+VeSawJMubHtwksoz
 +EIyQUPISNUt6JfcjjOlBbPf49n5WL2GZrlyB5DBHgRNqRmCFk6ICr9GY5sYtbyAWoiX
 se5a809PDge6kr6NkbCXVDcL3s5/uS1Gh8SxgRvMl0izb5tSDAwIHkcvY9F50FQNPN8e
 d/ew==
X-Gm-Message-State: AOAM531YIN2uw0CeqMunAcqQ8v6HBbOyvSM4Ru2zLRSd9G7Gq6x/WtG5
 CxRCpkBG9PJSeMm/1c+AFIp9Xh4jEStUwrXXNauSRFjrDIYVEgsWNHv4903vSNAEPDL6GpVEHHN
 Lzoi8og4CCSCaO7VQyyztKWlv89KK
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr3110923wmr.141.1644515750098; 
 Thu, 10 Feb 2022 09:55:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzztOtP2nPNM37UZbRdKgmrkAzYQV0Pr1R7MI99JcWycnjK/AG6TWJyvSRPiuS1u8x26j6AYA==
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr3110886wmr.141.1644515749879; 
 Thu, 10 Feb 2022 09:55:49 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p8sm21716128wrr.16.2022.02.10.09.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 09:55:49 -0800 (PST)
Message-ID: <e910fc2f-2acb-b81d-4b8c-532562952aeb@redhat.com>
Date: Thu, 10 Feb 2022 18:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/7] drm: Add driver for Solomon SSD130X OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
 <CAMuHMdVKmfOAdTG70KF+eAw3noXHSGCPyGjw3cSVyQOvzUafhQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVKmfOAdTG70KF+eAw3noXHSGCPyGjw3cSVyQOvzUafhQ@mail.gmail.com>
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
 Linux PWM List <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

On 2/10/22 18:06, Geert Uytterhoeven wrote:
> On Wed, Feb 9, 2022 at 1:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Wed, Feb 9, 2022 at 10:03 AM Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
>>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
>>
>> [...]
> 
>> The logo is not shown, even when I create a 16-color or 224-color
>> version of the small monochrome logo I'm using.
> 
> My mistake, I messed up the hook-up, causing it to pick a different
> logo that was too large to be displayed.
>

Great, thanks for all the testing.
 
> Of course it's using the 224-color logo reduced to monochrome instead
> of the real monochrome logo, as fbcon thinks it's running on XRGB8888.
>

Right. Once the patch lands, I'll look at wiring up the needed support in
DRM for the drivers to be able to advertise 8-bit grayscale and monochrome
to avoid the unnecessary conversions and to have feature parity with fbdev.

But I just wanted to do it incrementally and first port to DRM as first step.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

