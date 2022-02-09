Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286854AF248
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A4510E14C;
	Wed,  9 Feb 2022 13:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9200E10E14C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644411863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUzAJD5kbTchlL+gjCOgw4eKuUNlJh2PUtfBXKNWAAo=;
 b=aCrBp+9SuSpreQB+O6e8IYfaHB64C2+3LuEntDiF8/3IsaFqIhT0r2OLqv2XV9H+P9Z/4y
 s45lHWB5mTbd3Dp4B5cWtv0viq/gkh4XUjqsRurNK+V/4RWxN/mJazQ0cnMl/L4uoRNDYL
 rCinQxoHCQWiLrE6uWvL4C3kfBFbOcc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-W0a-qPxvMTahGigcGR1YzA-1; Wed, 09 Feb 2022 08:04:21 -0500
X-MC-Unique: W0a-qPxvMTahGigcGR1YzA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso462596wmb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 05:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aUzAJD5kbTchlL+gjCOgw4eKuUNlJh2PUtfBXKNWAAo=;
 b=0liO6GIXsgu61q7Hhae3fJzweivZYRtiAB/+Qjv8goZMepWOBYWr9eV7+INIvjlAhn
 5k+FtE6XwqYHhAQYKtpVu50nxH7+btAdBVmyX1odW6lI2wkmymy1Aac4chb2NMN0zVqk
 nrwZd2McSjt8v0a1i+TGZXXlJHYdUxjML394wvOWTGd6upMGoJc7OLb7J70oYOElYvDP
 xRNAWkVUISqAYNPFRNiFsYtsvSbrKqLAUDnjWFDjTcz736DVXSCv9b3BFtgycGUo3Te2
 40ldIOwrOH8l83Y1uCMUt7h3gIQFjiz625eyGTqZjocNpQNA1KF2DHrhjiaHpuseJakh
 Twlg==
X-Gm-Message-State: AOAM532YY2UeMzrkeueK8QuLdwaLHkh3+9lIy7sGyfWreu7i8yxFud3s
 NKeSIKAkIojG2Ug6ycGvIaAeHSRBaG7lxnW+GlWyeZs9/HKkqaf543YJVPBIiCWG9GNQ5dL94w6
 XTtrnhG4IfrVfEGOcmjjdM0z+Hu2L
X-Received: by 2002:adf:f384:: with SMTP id m4mr2089453wro.619.1644411859840; 
 Wed, 09 Feb 2022 05:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiO4EFMylBV1d9vxTXEoIqL6kXbZmHBfOW0Qxtx/E3aYbo8p+lRqr/HlGnFxDb8si5vo3ofg==
X-Received: by 2002:adf:f384:: with SMTP id m4mr2089432wro.619.1644411859577; 
 Wed, 09 Feb 2022 05:04:19 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id s26sm1994270wmh.47.2022.02.09.05.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 05:04:19 -0800 (PST)
Message-ID: <e6efb2fd-300e-5282-1f2e-a68130d0b45a@redhat.com>
Date: Wed, 9 Feb 2022 14:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
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

On 2/9/22 13:25, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The ssd130x driver only provides the core support for these devices but it
>> does not have any bus transport logic. Add a driver to interface over SPI.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
> 
>> +static const struct of_device_id ssd130x_of_match[] = {
>> +       {
>> +               .compatible = "solomon,ssd1305fb-spi",
> 
> This needs an update to the DT bindings.

Yes, I know. Didn't feel like it, because the patch is a WIP anyways
(I haven't tested it but was included just for illustration purposes).

If someone confirms that works then I will include a proper DT binding
in the next revision.

> Hence this may be a good time to deprecate the existing
> "solomon,ssd130*fb-i2c" compatible values, and switch to
> "solomon,ssd130*fb" instead, for both I2C and SPI.

Is this the preferred approach ? Asking because most of the drivers I
know use this -$bus suffix. From a device <--> driver matching point
of view, shouldn't be an issue to have two different drivers to use
the same compatible strings, as long as these are for different buses.

Since AFAIK the match only happens within the same struct bus_type. But
I wonder if this could cause issues in other places, for example the
module loading. IIRC the OF modaliases don't include the device type.

If instead the drivers were old platform drivers and have an i2c_device_id
and spi_device_id tables, then using the same device name would not be an
issue due the modalias having a i2c: and spi: prefix to make a distinction.

What I think we should do is drop the "fb" part, since that seemed to me
that was included because it was an fbdev driver. And not really hardware
description.

> Of course the I2C subdriver still has to bind against the old values,
> too, for backwards compatibility.
>

Yes, agreed.
 
>> +               .data = (void *)&ssd130x_ssd1305_deviceinfo,
> 
> The casts are not needed.
>

Ok.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

