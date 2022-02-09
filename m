Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560C4AF602
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC97310E210;
	Wed,  9 Feb 2022 16:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651310E210
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644422762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEFCqKCSxGi9whZ4JcEN5a7NElBGZhBjkZkBGJeeZak=;
 b=HAeQnG9zGRYf3Vk1WDDDN6FqSbmiqqmDfxjdt4BmR52Pu5LZX4pF/a6EREX3Si8GKV+d6D
 TZStNHjtKklM0euRLn/ufFcohAwOae/jQimVkK0g7kzQrT3ZW44D6yBn5hXhXSSRBmehzQ
 j9Q/g15D5pzHmt5VWkuAYXAlZAsa2Do=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-0D3hArXrOFSJRY00lBH7Iw-1; Wed, 09 Feb 2022 11:05:22 -0500
X-MC-Unique: 0D3hArXrOFSJRY00lBH7Iw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so2861683wmb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LEFCqKCSxGi9whZ4JcEN5a7NElBGZhBjkZkBGJeeZak=;
 b=pDu31xxyMn5/Aib3JWzet4YrwFB9nwqkTfno4EuSuPMY/UP4e9wgO7HRJn+KK4E4P9
 s8tellzYqr68eYuwOqRVWAucQvttMZzmc1WI0K4fzQXyJIpnOVWff4+7nh/Yhq0jBJyz
 hHriH5Jzlwno2dHio5dpkvh0b7UFRWigZ9jCep5sajldBzay8bQUPNcEqV2YWkgqvZ9W
 EAhZQ1EMgt7cn9a6pdifKyNia/maag0aynLrMqAQZjFDzSD47KAc3ARa2WCjYZgMDXtK
 ZCLLI4JvSvQUK/n/0cXkd1So/sYfv0F/tjQsbQVBiekzeMkLVJm6cq3rXIsf3oGpdz/n
 NLgQ==
X-Gm-Message-State: AOAM532/TM8MLShDrEva4xfgO/N9miI8uiD2vSVAwtI6dIeuugkNIHLn
 WPJlsZHYL0IdI9iF3tmCnJ+LTbHHp40lKU4lHCUt18za7uXuXLnC/i19Xl/c/0zg0VSPqyX4pR1
 judWOIIk/auspMQW52Oj0TWnFEqOh
X-Received: by 2002:a1c:2942:: with SMTP id p63mr2673407wmp.75.1644422721358; 
 Wed, 09 Feb 2022 08:05:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+j9ANRMCysRCXC83SlIGGD+b29Hyb7iOR9cmkjVggSgqjPJ0r7Mq6unfGb1nTB3jvtmr0qA==
X-Received: by 2002:a1c:2942:: with SMTP id p63mr2673393wmp.75.1644422721161; 
 Wed, 09 Feb 2022 08:05:21 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i15sm1276298wmq.23.2022.02.09.08.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:05:20 -0800 (PST)
Message-ID: <f3096131-4285-6e06-8e0a-47b23f8feb9c@redhat.com>
Date: Wed, 9 Feb 2022 17:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/7] drm/solomon: Add SSD130X OLED displays I2C support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-5-javierm@redhat.com>
 <YgPanXaAYQxHTjMd@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPanXaAYQxHTjMd@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 16:15, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 10:03:11AM +0100, Javier Martinez Canillas wrote:
>> The ssd130x driver only provides the core support for these devices but it
>> does not have any bus transport logic. Add a driver to interface over I2C.
> 
> Thanks!
> 
> ...
> 
>> + * Authors: Javier Martinez Canillas <javierm@redhat.com>
> 
> s?!
>

Right.
 
> ...
> 
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
> 
> regmap.h ?
> err.h?
>

The regmap.h header is included in ssd130x.h and err.h in regmap.h.

> ...
> 
>> +	ssd130x = ssd130x_probe(&client->dev, regmap);
> 
>> +
> 
> Redundant blank line.
> 

Ok.

>> +	if (IS_ERR(ssd130x))
>> +		return PTR_ERR(ssd130x);
> 
> ...
> 
>> +	{ /* sentinel */ },
>
> No comma for terminator entry.
> 
> 

Right. I removed in one place bug forgot here.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

