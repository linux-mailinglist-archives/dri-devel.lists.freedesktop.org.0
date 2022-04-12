Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A584FD2D1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5110FEFB;
	Tue, 12 Apr 2022 08:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBA910FEFF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649750828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VdMWR774a5F73y+bEiFyStJDpalZ9pO+6CFy328lrI=;
 b=RpTvHffQV3dFHiGr/ba+DCK3usB3JxWkZ4n1f+lZYMIJ6SLM4WTHchCknMa0/6Tt+532+h
 OiqhM+j04HSOjbl84WngBqZ2k4hpnJw5NUIqUr/d/2nopo9oGGer9QGTxkYabF7HIH7gPB
 XM6sYd7bURPJCXp977ZNNZWFm0wP9ns=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-Wh-XkQezMJKiAHMI3DVhYg-1; Tue, 12 Apr 2022 04:07:05 -0400
X-MC-Unique: Wh-XkQezMJKiAHMI3DVhYg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r10-20020adfc10a000000b00207a2c7bcf6so1224972wre.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2VdMWR774a5F73y+bEiFyStJDpalZ9pO+6CFy328lrI=;
 b=PMcjmjmAFKTLxdNF4TjzI8ydQ0wXX3KoafMvdMQ10yrVg483swKfovKcXu0CF+yW08
 OtbFm0Bkq7lGs239OeVVE5oT7wsbZidV4mv18zJTRRjc5iZ6qRkghpWwwMQRMrS7ndwQ
 RSv/qHkTKx6/TWCffjRgN5bCi8LqRDliL7il0FXdgZQerg6Ak734miDWNYbF9hbZprAo
 SAzowNTCls+VXysxlpw2TryA70Tw1Ij6pxM8Nr2UvGtUIHReqsixXLGwhiNICE+z8soc
 jkoYrAolcsc4zyUVJtq2DkUj7WKTGSXH1nxB0UkmosUAmlFZ4Z1wkZMBNfGcOCP/Oq8s
 MioQ==
X-Gm-Message-State: AOAM531wXN6+Y39EPtQuRGCCeJZ3HxISTf1z38MpqYgI7//oYAPgpc9S
 6gJjbSU6OA9I6qXqkob9xUR2OGOYZ0tdvmnulrFc7QDcWc/L/hdU7eZR+rk9z5UTDCTtdQvW/Ci
 5xEQRVlRir+r3I0eRZMLgqGasrMgU
X-Received: by 2002:adf:ff86:0:b0:207:a89b:f532 with SMTP id
 j6-20020adfff86000000b00207a89bf532mr5744867wrr.558.1649750823916; 
 Tue, 12 Apr 2022 01:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpE+YrfgLKSaqQEucvAkzmjqLKY3AuURrxrIAYziIUmLTk+AXPmEsg4Tb3dLG4rGjFxW+4jA==
X-Received: by 2002:adf:ff86:0:b0:207:a89b:f532 with SMTP id
 j6-20020adfff86000000b00207a89bf532mr5744843wrr.558.1649750823604; 
 Tue, 12 Apr 2022 01:07:03 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600001cc00b00207aac5d595sm3027586wrx.38.2022.04.12.01.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:07:03 -0700 (PDT)
Message-ID: <4128b288-2b9a-f9cd-01f3-a1d50d3e10bb@redhat.com>
Date: Tue, 12 Apr 2022 10:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-5-javierm@redhat.com>
 <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 09:23, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> Thanks for your patch!
> 
> On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> These are declared in the ssd130x-i2c transport driver but the information
>> is not I2C specific, and could be used by other SSD130x transport drivers.
>>
>> Move them to the ssd130x core driver and just set the OF device entries to
>> an ID that could be used to lookup the correct device info from an array.
>>
>> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
>> bytes. Since even though are used by the I2C interface, it could also be
> 
> though they are ... they could
>

Right, will fix it.
 
>> useful for other transport protocols such as SPI.
>>
>> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> 
>> @@ -860,7 +890,14 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>>
>>         ssd130x->dev = dev;
>>         ssd130x->regmap = regmap;
>> -       ssd130x->device_info = device_get_match_data(dev);
>> +
>> +       variant = (enum ssd130x_variants)device_get_match_data(dev);
> 
> (uintptr_t), to avoid a cast from pointer to integer of different
> size warning.
>

Indeed. The kernel test robot reported the same.
 
>> +
> 
> Please drop the blank line.
>

Ok.
 
>> +       if (variant >= NR_SSD130X_VARIANTS)
>> +               return ERR_PTR(dev_err_probe(dev, -EINVAL,
>> +                                            "Invalid SSD130x variant\n"));
>> +
>> +       ssd130x->device_info = &ssd130x_variants[variant];
>>
>>         if (ssd130x->device_info->page_mode_only)
>>                 ssd130x->page_address_mode = 1;
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

