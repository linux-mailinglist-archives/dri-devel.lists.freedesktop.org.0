Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC349CC0F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0E910E57F;
	Wed, 26 Jan 2022 14:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D2510E57F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643206556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBufRetUEaFHPWc7iYpkpHHqiA9eXNXD6Bgulr6vvjA=;
 b=E32LYDdrJgwi0AwAMS6rUpGjIXuwq40Gqd+naGS7MjQoYxH0mlxt80pepuZ/7eBsY1kTkt
 /bNEL1v44RBdWTd+79gD0SCuluS5MomHY5RVuQE4s3wKsFkidUgAq2TwRrQxWrshsvuBLq
 V1ZbGRj7MYs/kdwJd+fTyeo5IoR0jCY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Rgg3VbkvPvaTmxwyjaNquw-1; Wed, 26 Jan 2022 09:15:55 -0500
X-MC-Unique: Rgg3VbkvPvaTmxwyjaNquw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso4384959wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 06:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TBufRetUEaFHPWc7iYpkpHHqiA9eXNXD6Bgulr6vvjA=;
 b=mdfrKtt3vqf/t71spZ9INlHESPmlECAwN5O1nK1GsG/fr9Ve1xVZAQ18YK+X3K7VMk
 aEwXWj7/RszfDzhoPUkqq9vSI5dxSOfivaJwWNrH32ZVN88oymLgIuFvXRQrkVDDXN+R
 tTVbmI5/pnJkAYMNeb4jG/7KAtTrY/TUt7oNGiaJ1JB8o2I8NAxBypRwe3DFl2N8GMYl
 NdKjHLEZhqKxO1mhWqh8+Gn3mmewUgAe5Nc5aMcaVyY5I70irNXb/VSZblWBKoYf2T1i
 U6Vdo4WRfBxPet1CDGzCriW3NAzpvWWWqntSel14dessf9WcGLLbMnvwWJX8ELM339rn
 eJxA==
X-Gm-Message-State: AOAM530AGs3deDqTbQNc+zJODtzOPPL5Ic2fnLPLcnircKcaA7jLJRo6
 i9yR36npLxW5kTHFZTq9UASVlT1XvH4se05mQCQUJ/MhSsd7m2kxNLvCq8teKT1MiUCjbM53JJO
 ak03qAiz1qETtr7bfjJD52bt1qPgL
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr21723789wrp.419.1643206554173; 
 Wed, 26 Jan 2022 06:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+mct3ymMu2U64GGPDGP0AtbI/8Ig4CtqRTRDC/RwNHy3hYZxdpTXJYSMFcmQfPRXBYMePRg==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr21723776wrp.419.1643206553991; 
 Wed, 26 Jan 2022 06:15:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 1sm11923387wry.52.2022.01.26.06.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 06:15:53 -0800 (PST)
Message-ID: <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
Date: Wed, 26 Jan 2022 15:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFWPmG2D093gz4N@smile.fi.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 15:10, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 04:08:32PM +0200, Andy Shevchenko wrote:
>> On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
>>> On 1/26/22 14:12, Andy Shevchenko wrote:
> 
> ...
> 
>>> I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
>>> driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.
>>
>> You should take ssd1307fb.c instead. And basically create a MIPI based driver
>> for I2C. Then we won't go same road again for other similar devices.
> 
> For the record it supports your device:
> 
> static const struct i2c_device_id ssd1307fb_i2c_id[] = {
> { "ssd1305fb", 0 },
> { "ssd1306fb", 0 },
> { "ssd1307fb", 0 },
> { "ssd1309fb", 0 },
> 
> 

Thanks a lot for the pointer. I was only looking at drivers/staging
and didn't check drivers/video. I'll try to convert that one then
once I get the display.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

