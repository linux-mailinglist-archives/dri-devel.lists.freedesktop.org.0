Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C849CB48
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F34410E67D;
	Wed, 26 Jan 2022 13:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8C910E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xq9qXfs6mYq/UfTYZlfXKoJk7bb8Idtqn7KKr27tJeY=;
 b=bONizZyyC0bqldXQ+kQWfVadWSdBtWVCsGeCwthShSsmCqf8yDxPQwrnUdKRhSpRp7IwED
 SZhUzDu7E8ved0F/j6YK1Ec4ljsEAxhc/qiFroHjkTmKzJg6kvvToaZRBsIH4Kca2VXfnm
 dN4pmZqTgF798E9FCndcEbn+kXclC/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-r_3QPJS9M72946bsh2p4UQ-1; Wed, 26 Jan 2022 08:47:36 -0500
X-MC-Unique: r_3QPJS9M72946bsh2p4UQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i16-20020adfa510000000b001d7f57750a6so4306256wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 05:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xq9qXfs6mYq/UfTYZlfXKoJk7bb8Idtqn7KKr27tJeY=;
 b=U9jqJhKBb6t6PGVmBeSQ+2PcGFKBKFNWfzgbvsRNuzFB2BXzZl49vMv3+AkFALsO6H
 Km3XjMxj/tjXbj3AySCJRvWXthNvQKaA3c7AGx7M7vhiVBpQS/7H1sGMl8IIeK8HzXWV
 NNHhLSmBmY+yV8HKQmdZw2SSP0kCKmbIOvsr5JUdT3qXiHWFxIQa2ozB5no56AEmX8eD
 tzGsw+1VtgDv7vVLJhOYlxHyk6VC7NSDNOATfqIbtxFJHQBiqXQoLgUDTg5bVTI8o4t4
 DMo6h3hTVqJ+UyAf+QvfsPKyR7bA3+kVWHDnjE2WeWfB/kaATEfxnRQtTgUkI72MlLZb
 gkSw==
X-Gm-Message-State: AOAM532ZRQIZ8KXq/Whn8qeCM8pEQLOxNy1TWzZoX+Ul5PjY6q7OTzCY
 OisVqYyS7FYLVtqMBikIwob6knLhYOCGewBe0bqZgXP8TciNTct2dm++wpWw6UhczTRThwiPexH
 ekoVjixYKRE/yqD5clyNOJFb99KNr
X-Received: by 2002:a1c:f404:: with SMTP id z4mr7537092wma.165.1643204854941; 
 Wed, 26 Jan 2022 05:47:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs81KYxiPF/pMoFmGo74Ky9xgWpfukUAN7+fK2cyeIPPH1/2P88Q/Z9OzeoSa7tZySgGcZpA==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr7537069wma.165.1643204854684; 
 Wed, 26 Jan 2022 05:47:34 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n2sm22869132wrw.63.2022.01.26.05.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:47:34 -0800 (PST)
Message-ID: <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
Date: Wed, 26 Jan 2022 14:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 14:27, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 12:18:30PM +0100, Javier Martinez Canillas wrote:
>> On 1/26/22 11:59, Helge Deller wrote:
>>> On 1/26/22 11:02, Andy Shevchenko wrote:
>>
>> [snip]
>>
>>>> P.S. For the record, I will personally NAK any attempts to remove that
>>>> driver from the kernel. And this is another point why it's better not
>>>> to be under the staging.
>>>
>>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
>>> features or even attempting to remove fbdev altogether (unless all
>>> relevant drivers are ported to DRM).
>>>
>>
>> But that will never happen if we keep moving the goal post.
>>
>> At some point new fbdev drivers should not be added anymore, otherwise
>> the number of existing drivers that need conversion will keep growing.
> 
> This thread is not about adding a new driver.
> 

It was about adding a new drivers to drivers/video/ (taken from staging).

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

