Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D24A5B02
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40AD10E674;
	Tue,  1 Feb 2022 11:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EEC10E68D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643714259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vjw//fLkAQ84TIDAJkx8fTRjA3gXymjff0vArIKpGDA=;
 b=R8+z0Hg5S4kdg+0BcfbBfd0XcQtTDbiS6G/flwcOkL5YDe+4t/HU+Xrq0W5myQPHdGY1fy
 RpEwpdVEKGESqjSUQW7P6KYptyeD8UHmskS533ieAjCZnglJVEpTMTHH8GTGBJC6fPYuCr
 MJhUxnMdO2lQrrpy+M9wI+JHzMIdrG8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-VsXowWemMAqeoYigFNC8LA-1; Tue, 01 Feb 2022 06:17:37 -0500
X-MC-Unique: VsXowWemMAqeoYigFNC8LA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a1c4d03000000b003539520b248so758122wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vjw//fLkAQ84TIDAJkx8fTRjA3gXymjff0vArIKpGDA=;
 b=8NAsxQvUcYnIkTK9PaBrVUYfmbkM9EL9Njjn76UMDxllRvgLar4aijuOqKqrbbWagN
 ntN/4yVJFW5+I1z5+dluFHVej7g2KtIQv7UAH6vldo5WVy4QCjq1OJwTcH6yFWaQIlVP
 /TBP4QasNser+Jdcaqbu4gaZOgGXE+JfQzwTdjb8Rv+5CLuUh9H2o93Ec+wtJIlGIzP1
 ZCiK23SVqGuF27DvGMEFvX0CXAMM4NUvOCgv5vHXVNY23kJ42uHtyrEl2ptu1NMd32Ql
 aFUmyddfTqaylXPDAxz1acLXcz8D9fu27kYYFcLAdAzYLAqMokUfe22UbA3BWLOcRp1A
 x86w==
X-Gm-Message-State: AOAM531jcI1lPsqC0miwzvFINsiFwIBXQjgecLdhrfk0g9+rqfoAL6Wc
 J7VMeTFM2KAgSasaw8gZPpHQEa8vTZxSG0Z4+HEjJfdX1wkqiv89rV3/nZMxJ0Oop3ymlChNGPC
 4bbvjxxhH+1VlpBRz4ZOvlzs0NIKT
X-Received: by 2002:adf:f045:: with SMTP id t5mr21095370wro.385.1643714256622; 
 Tue, 01 Feb 2022 03:17:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbcg9U2rYIsyfcakZ9zSjonoBgrdJ/oOcSUdMbVuNhLqDn/9NnvNfRqe0QXRW90Ej8ByOWhg==
X-Received: by 2002:adf:f045:: with SMTP id t5mr21095354wro.385.1643714256365; 
 Tue, 01 Feb 2022 03:17:36 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p7sm1824109wmq.20.2022.02.01.03.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:17:36 -0800 (PST)
Message-ID: <273132fb-cf11-93a6-6bfd-3cc8b19f8fa9@redhat.com>
Date: Tue, 1 Feb 2022 12:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] MAINTAINERS: Add entry for Solomon SSD1307 OLED
 displays DRM driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220131201537.2325487-1-javierm@redhat.com>
 <Yfj+FOELlbtdhvRa@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yfj+FOELlbtdhvRa@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

On 2/1/22 10:32, Andy Shevchenko wrote:
> On Mon, Jan 31, 2022 at 09:15:37PM +0100, Javier Martinez Canillas wrote:
>> To make sure that tools like the get_maintainer.pl script will suggest
>> to Cc me if patches are posted for this driver.
>>
>> Also include the Device Tree binding for the old ssd1307fb fbdev driver
>> since the new DRM driver was made compatible with the existing binding.
> 
> Dunno why you have patches 3 and 4 missed references (in terms of email
> thread).
>

Yeah, I use the patman tool [0] to post patches and something went wrong
after sending the first patch and I had to manually post the others with
git-send-email. I could had used --in-reply-to, but didn't feel like it.

[0]: https://gitlab.com/u-boot/u-boot/tree/master/tools/patman
 
>> +DRM DRIVER FOR SOLOMON SSD1307 OLED DISPLAYS
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +S:	Maintained
>> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>> +F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> +F:	drivers/gpu/drm/tiny/ssd1307.c
> 
> I think it makes sense to add ssd1307fb as well. At least you may point out
> people patching old driver about new one until it's gone completely.
> 

That's a good idea. I also found some issues in the ssd1307fb driver when
doing the port, so I could dig more to fix them and propose myself as a
co-maintainer for the fbdev driver.

But I'll do that as a separate patch-set.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

