Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08549CC24
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582E210E593;
	Wed, 26 Jan 2022 14:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEAC10E593
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643206700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ezLTX17xe1yXWdb0ZwpAiPVrESUBhrTwQn5+FJRhKI=;
 b=OFzkd+CTLIo/dDX9A0rMeXaSMTyevB7c0Huuwnmgoe1HpsMJw/QK4r8lsYZIu8ymTLHsLx
 JQnM5Kuwd9mPduRnkoqmCfzsHZsyRNbRXCl9kN6DrS2UoFApAZr4KKZCB+/XtD4hsT0khA
 jXaKNyXs4ZIJsuywdc7F2AiO3ufJ9HQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-9oUSWS1rNHiGz9fJ0MKlPQ-1; Wed, 26 Jan 2022 09:18:17 -0500
X-MC-Unique: 9oUSWS1rNHiGz9fJ0MKlPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 d184-20020a1c1dc1000000b00350769d4bcfso1307023wmd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 06:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ezLTX17xe1yXWdb0ZwpAiPVrESUBhrTwQn5+FJRhKI=;
 b=Nr45HWIwuCo4ivMuFNcz1tsZBdWsvT1oMF8ygzxw0xPHqz5v+s9Sc7iwl5C4yOf9Ud
 86KeBwYf2tz15aP3xsYI26l/PIY0pBUfj31NmJS1/5WHgaeIViK/17dc33nYmWI1ob8l
 igdeH8M73jvFNHLfH6CAK5x1hB+QVAKnHJ2PXzRQUzNShrSwgGUSN8bTCzYxFmm0pi8t
 o4s64FDkcxhidKKsapO2v7pCBv/aw5RQsLvwg/p+IxtqBJ7v5VhZV76ce9ndBnXXd/c1
 FZvV7M3oBnxn7yxQF/O46weNXr/XIoQw0ZNL9HwJLjEYrkqlY/z7c+NydhiFb/79fOgr
 eQdw==
X-Gm-Message-State: AOAM531bSbVmL8wq6uLXNV+UpzLzfEf6G28KYAzGHOTGyt/Z3HgWVXDA
 dubdQgnOgsqVlF2mwM8Dq6FkRYhNso/0zgIkAh8Tjixv3UDFVZPRrOGofHtgmHFw4dgTmGIxe3B
 oi/ek0Y45X3YLZY63jZvfgcZ1mGv7
X-Received: by 2002:a5d:6f10:: with SMTP id
 ay16mr14738840wrb.183.1643206696018; 
 Wed, 26 Jan 2022 06:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxksbfhCZ7SXr+6tjwoPU4RHnla2jY/kkMOPccD237O672NRHo7t0lUaWXxaaOjf6TiGCJImw==
X-Received: by 2002:a5d:6f10:: with SMTP id
 ay16mr14738822wrb.183.1643206695782; 
 Wed, 26 Jan 2022 06:18:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o14sm9828896wry.104.2022.01.26.06.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 06:18:15 -0800 (PST)
Message-ID: <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
Date: Wed, 26 Jan 2022 15:18:14 +0100
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
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFWmmJFtEB93jUi@smile.fi.intel.com>
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

On 1/26/22 15:11, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 02:47:33PM +0100, Javier Martinez Canillas wrote:
>> On 1/26/22 14:27, Andy Shevchenko wrote:
>>> On Wed, Jan 26, 2022 at 12:18:30PM +0100, Javier Martinez Canillas wrote:
>>>> On 1/26/22 11:59, Helge Deller wrote:
>>>>> On 1/26/22 11:02, Andy Shevchenko wrote:
> 
> ...
> 
>>>>>> P.S. For the record, I will personally NAK any attempts to remove that
>>>>>> driver from the kernel. And this is another point why it's better not
>>>>>> to be under the staging.
>>>>>
>>>>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
>>>>> features or even attempting to remove fbdev altogether (unless all
>>>>> relevant drivers are ported to DRM).
>>>>
>>>> But that will never happen if we keep moving the goal post.
>>>>
>>>> At some point new fbdev drivers should not be added anymore, otherwise
>>>> the number of existing drivers that need conversion will keep growing.
>>>
>>> This thread is not about adding a new driver.
>>
>> It was about adding a new drivers to drivers/video/ (taken from staging).
> 
> Does it mean gates are open to take any new fbdev drivers to the staging?
> If not, I do not see a point here.
> 

Good question. I don't know really.

But staging has always been more flexible in what's accepted there and
that's why some distros avoid to enable CONFIG_STAGING=y in the kernel.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

