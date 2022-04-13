Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD84FF567
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 13:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ACD10E05C;
	Wed, 13 Apr 2022 11:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EE710E008
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649847845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAKFvcf+P6d2EsRST5nUXnt0HSC5cHGQEXD7juEAlB0=;
 b=I5x9gW5DEP8Y6GUQVfOo2upJxOuOSPN6vLtIn9cTW7NR5MveUo8fTwhPnw9B6W+OV8W4Mo
 6uuXHLQit3CwZMNKCWnnlsbhTwQ+7bsZ7G7McT8NdmmlCosoAvKC6Z++9RWjI+DRyrpkz6
 dQuS9ZtnrBetzEW8kVneP3TQFYuIv2M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-Rt3g-sqQP7Sdj06Mz47FOA-1; Wed, 13 Apr 2022 07:04:02 -0400
X-MC-Unique: Rt3g-sqQP7Sdj06Mz47FOA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n37-20020a05600c502500b0038fdc1394c6so117641wmr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 04:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SAKFvcf+P6d2EsRST5nUXnt0HSC5cHGQEXD7juEAlB0=;
 b=XFiZ8N2e8RyEj8h+MBg5NY16Lm3CzRN8ARxj5OqezjV6CsIkV6Baz02CLjCQ/56cyK
 IeYll+QKs0jvj5YxMxh7230dc60bzFKIyqQDJMCjD+tQMupOfFVIGMriCe0jFHSo3DsB
 Cti/MQTDFg1Gr+WEeakAZ1BVClW9RB/UL/2dEqDhy5MYD3KHfs5dhGLHNIPOfTOm8Uw4
 90FopWsOC70nsDHy7lWcMls29OvW4fqakKozeuiYHn6dy8hVNnV5lVV3aEUOCbBxQgRP
 moVLksVt+KE0VYC9cQoJWpvHUq8wy6x+t3aM1j8NyZ94Gwr5VVSttzYk2w7NEcTvxJxH
 AvJg==
X-Gm-Message-State: AOAM533BP5FThZutDysesrAvV62ctisLCu0tVZF868p7cKxt8jtz1ZHp
 cXguQsGfr/0udQRO725h6yEbZWnAVKQZUDEQsaVDsG6r9VDGw4pFlF6K3nWVZzJJlGosuwbBBhn
 PAGm4WX4HuMrGNVMwGV3Nj44RKuCT
X-Received: by 2002:a05:600c:4ecb:b0:38e:d223:b0b4 with SMTP id
 g11-20020a05600c4ecb00b0038ed223b0b4mr4066666wmq.92.1649847840978; 
 Wed, 13 Apr 2022 04:04:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbKeAp/60xVQlTIHBbb+L6Qv1XJBF2V0iIuW2htHB09yVazdm0LN0gRH3CTTu5mRCCDlS02A==
X-Received: by 2002:a05:600c:4ecb:b0:38e:d223:b0b4 with SMTP id
 g11-20020a05600c4ecb00b0038ed223b0b4mr4066645wmq.92.1649847840796; 
 Wed, 13 Apr 2022 04:04:00 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 10-20020a5d47aa000000b00207afc4bd39sm5100081wrb.18.2022.04.13.04.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 04:04:00 -0700 (PDT)
Message-ID: <e65378b2-eaba-e3b8-4bd7-0fb87f343d7b@redhat.com>
Date: Wed, 13 Apr 2022 13:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220412162729.184783-1-javierm@redhat.com>
 <20220412162729.184783-5-javierm@redhat.com>
 <Ylap8rTKbXp80Woc@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Ylap8rTKbXp80Woc@smile.fi.intel.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

On 4/13/22 12:46, Andy Shevchenko wrote:
> On Tue, Apr 12, 2022 at 06:27:28PM +0200, Javier Martinez Canillas wrote:
>> These are declared in the ssd130x-i2c transport driver but the information
>> is not I2C specific, and could be used by other SSD130x transport drivers.
>>
>> Move them to the ssd130x core driver and just set the OF device entries to
>> an ID that could be used to lookup the correct device info from an array.
>>
>> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
>> bytes. Since even though they are used by the I2C interface, they could
>> also be useful for other transport protocols such as SPI.
> 
> ...
> 
>> +EXPORT_SYMBOL_GPL(ssd130x_variants);
> 
> What I meant is to use EXPORT_SYMBOL_NS_GPL() here. It might require a separate
> patch to move other exports to that namespace first.
> 

Oh, I wasn't aware of the namespace aware variant of these. Thanks for
pointing it out! I'll change and use that one instead for v4.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

