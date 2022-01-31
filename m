Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED74A4699
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 13:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC5E10E299;
	Mon, 31 Jan 2022 12:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E2110E299
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643630916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHCsLAta/MrnmBGDia3vIQcCGWeVAhBjLYDNsArZji0=;
 b=hSll4ygTTE1M/cbUHdqELAGX+CVlhiATDBBf2KFZoRjlgDOc/KxHLccf3U+jaHNR2VniTc
 Rv4vUn5VjvXy2wPF96RPRdMRvnpHpHI1WaAz5uPU5V4rMBxZeNP0m7W93Yg4XR18SWAzDa
 5pymTT11JCSbJ66BOg0dKeCYQ+g92OA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-WUXH4tg-PgWgxTWWwAJNXg-1; Mon, 31 Jan 2022 07:08:35 -0500
X-MC-Unique: WUXH4tg-PgWgxTWWwAJNXg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso4770491wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 04:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uHCsLAta/MrnmBGDia3vIQcCGWeVAhBjLYDNsArZji0=;
 b=GeNha65R7XkuR1cwjMhoYuRSt4VSlNRZXIBkkxfH9NpU45dRIjqb1d+OUPzwfB2N/I
 uYWlsCfBVFbmFx8KTcOFfaFLOF5O5COEzcNb5HekUWSbuv40LMbKoFa4r5FvCX2A9y2s
 H1Mgqm+lBqVn/s/mCwnNNoj6FisqRibloJD1vWFOUtKvmjnCSIe2EnfpI+GYwV6BealC
 2AHJDz82PxaIts26X2hsuMl1vZih7SlppieXlaRWTwiz6KAX23euvnnH4dIBFsNCUHgd
 iJ5bzVOD4Gz7JmVjj446b2V8fuxIrwxOzIzwWe3aaEE78SoLD6r8BZncu/8Axk+4fT1a
 2ZHQ==
X-Gm-Message-State: AOAM533F9ghF89Be3dw95Xiq/Lc31An2f/9Iu0wZGpwmAf6xfzjjNRUr
 Y61xd5t+aXUCaNeMQG8CV2YHkOFWrqekXAFuwLvucEAANi9DTWrBIDfVgRN0PeokGxng1TuMBYl
 lMxDxd/JJpm+ZYj+AWTQ06b9zCiHU
X-Received: by 2002:a5d:4888:: with SMTP id g8mr17557007wrq.555.1643630913958; 
 Mon, 31 Jan 2022 04:08:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOkunZZ+NozHmO2zpg9dYPVUqcOa3zg1KoXbyOc53eC4f8o5sv32htjcm8qKyMeiwchXjSIQ==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr17556980wrq.555.1643630913738; 
 Mon, 31 Jan 2022 04:08:33 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id t5sm12054594wrw.92.2022.01.31.04.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 04:08:33 -0800 (PST)
Message-ID: <5a3fffc8-b2d8-6ac3-809e-e8e71b66a8ea@redhat.com>
Date: Mon, 31 Jan 2022 13:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <YffJujbpUGUqpIk/@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YffJujbpUGUqpIk/@smile.fi.intel.com>
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

Hello Andy,

Thanks a lot for your feedback.

On 1/31/22 12:36, Andy Shevchenko wrote:

[snip]

>>
>> Another hack is that I am just hardcoding the {width, height}_mm, but I don't
>> know what DPI could be used for these panels nor how I could calculate the mm.
> 
> I think the hacks is the first what should be eliminated, also see below.
>

Yes, agreed. But as we discussed with Thomas I'll post anyways since these could
be addressed as a follow-up.
 
> ...
> 
>> +config TINYDRM_SSD130X
>> +	tristate "DRM support for Solomon SSD130X OLED displays"
>> +	depends on DRM && OF && I2C
> 
> Please, make sure that it does NOT dependent on OF.
> 

I actually added this dependency deliberative. It's true that the driver is using
the device properties API and so there isn't anything from the properties parsing
point of view that depends on OF. And the original driver didn't depend on OF.

But the original driver also only would had worked with Device Trees since the
of_device_id table is the only one that contains the device specific data info.

The i2c_device_id table only listed the devices supported to match, but then it
would only had worked with the default values that are set by the driver.

So in practice it *does* depend on OF. I'll be happy to drop that dependency if
you provide an acpi_device_id table to match.

> ...
> 
>> +obj-$(CONFIG_TINYDRM_SSD130X)		+= ssd130x.o
> 
> I would keep the original name since we have I2C (fbdev) implementation, SPI
> and platform (fbtft), and now i2c (drm). I would like to avoid more confusion
> that we already have.
> 

I see. That makes sense. Will I keep the original ssd1307 name then and not
rename it to ssd130x (even though it would be more precise since supports a
family of displays).

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

