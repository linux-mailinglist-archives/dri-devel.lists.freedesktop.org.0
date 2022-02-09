Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91834AF60A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA2710E2E1;
	Wed,  9 Feb 2022 16:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828E10E2E1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644422827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GmtaJHp/xTHNMpzFHAgFBMiYKYYWVV2IEV+4sk5uqg=;
 b=BaLjw1ZAJBsdZh+i7zjT4nOcKDwY6/ucTiVQbhKI9X1YNKubOYmc13EWduLcNLy3ppZifm
 QdiYCvSqewJFT7F+LsvMtXCc7tCtSeXWC5iJnpiyu7YC5mr9yJjJCfnxh+N3p2JLqfykCB
 L1EJVvwLBqeffO/YHLqQ0SnLPPPogLw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-RDv5dttmOMaZLF9g6NDWXA-1; Wed, 09 Feb 2022 11:07:06 -0500
X-MC-Unique: RDv5dttmOMaZLF9g6NDWXA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so1269142wrd.22
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9GmtaJHp/xTHNMpzFHAgFBMiYKYYWVV2IEV+4sk5uqg=;
 b=uhL4jceQvepkI3+2kA6y0eEATcOdXe0Dzj3cEuwQA59RIcH3hERG/fE9DXmYcP8wQ4
 hb+m+Q1DV9olEMMz3qWrmSy+w5OmhV7mUOAtBMsyYiVjThkdaws0r3/CVoyLJhnqXyR6
 B+FCvwZZaNZBHm3MpnCHn8Ud0IbKhG7CHkPU2bx3DE54CirfMsx96Rlouqi3pkp4xsC7
 xL/ec6q+kVXOEdJw2Y2eSptEuXi6ynBfHbE8j0HMHzsH01rBPCaayDjfHhbIWKAWfKe8
 iwKIBiJWlAIJJjx/5kYzhnxnnTRx4grAZA75IR6hzmILKpObieZBfh7L1ahO3v8ha9gx
 y7Bw==
X-Gm-Message-State: AOAM530y9+iHSr209X4yY6h9BsoKSO6flClX49hvU5utP5CNic/GTuc/
 mKWiOhkmIOSAKOTuJkuJZpP98Bj9vZ0tpgcQg50qaOxas7RBONPzgK1yT0t0anO7LfkqYoI757e
 SEh0mnUf+zeB2XvmKflMVH/ec5MtX
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2694168wrz.518.1644422825077; 
 Wed, 09 Feb 2022 08:07:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSOdYMsb8yEAJ80HG2zpe/vuSpys4t0RlhZKdpTZvQG5sQ5JJ8V2gZ2pWwI7Y/pRJze0jM/A==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2694154wrz.518.1644422824917; 
 Wed, 09 Feb 2022 08:07:04 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f20sm7148775wmg.2.2022.02.09.08.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:07:04 -0800 (PST)
Message-ID: <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
Date: Wed, 9 Feb 2022 17:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
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
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 16:17, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 01:25:46PM +0100, Geert Uytterhoeven wrote:
>> On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
> 
> ...
> 
>>> +               .compatible = "solomon,ssd1305fb-spi",
>>
>> This needs an update to the DT bindings.
>> Hence this may be a good time to deprecate the existing
>> "solomon,ssd130*fb-i2c" compatible values, and switch to
>> "solomon,ssd130*fb" instead, for both I2C and SPI.
> 
> Agree!
> 

Did you see my comment about automatic module loading ? I think
that would be an issue if we use the same compatible for both
I2C and SPI drivers.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

