Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589584FE0C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DD510E9F2;
	Tue, 12 Apr 2022 12:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9257D10E9F2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649767673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMp2oMMI19CzMX6iZstGkcYLomzwrXcccsJxHhfXPhs=;
 b=Vv0RjNhXo/LGNqdDqpjSpu4e7WoEv57/I6JlpspI3GHhU/VIRsgOHAkhigJxCvxOWPQNCu
 zL4K+ZE+ET76Aq0bFR4IDeViZU7+m3sQlTFIdJQJ02B2uJuvqTvPE0xE01CP3QU+XlRtdc
 vVAU1ol/5hYvSDeik44AumjtgDPiYUM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-tNxZR67EMwO5hK-VMDDJJQ-1; Tue, 12 Apr 2022 08:47:52 -0400
X-MC-Unique: tNxZR67EMwO5hK-VMDDJJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r83-20020a1c4456000000b0038ebc45dbfcso1729150wma.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 05:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FMp2oMMI19CzMX6iZstGkcYLomzwrXcccsJxHhfXPhs=;
 b=jXSYqUMOBwNBjAIX9ti7r+/0zd4lVhB3inKHrP+ZszFXb3SknzRJC6P2/nhXc0GhPm
 jzUY0QRKiZSA4d6hNeAqBHyW2VdZmlXwCfktLSPoQUyzBKEwWzSQJ3Og41LvhYG0kd4F
 g2ceYQutabreIyaQMac0/4KIEXo7EErrs9NiPI0u4MF5fczfElKhDPi/86N8n89Px2ap
 7OOnf0WGXusHvHAye00Z/oBJtaN6D7zWeLJVSU/CmsXIsewvAPjUqtUQDRz+JIhXQA46
 7TkV5fWJW0x0L8LdCO+ggFzt+ravcL78zNEavXukRyKdEn3mHOCeBf/s8qeVurTEW49s
 lwwg==
X-Gm-Message-State: AOAM531Q7O9QQp1PhyJJqDOUd9UXbg6HyfpHXjZw5WLUGtK1Gdh23PLt
 GO78k9YgeCNr9hyjDt+gisTqZUpn+U8fN8lRpHYZXf+iWN6mLZQMiFUHfeA1FPFqnrDspizv5Vn
 /iVCW+Srm0zzXSYv3nZEME09iSctw
X-Received: by 2002:a05:600c:1e11:b0:38c:b316:e6f5 with SMTP id
 ay17-20020a05600c1e1100b0038cb316e6f5mr3957217wmb.93.1649767671357; 
 Tue, 12 Apr 2022 05:47:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSkWhDIignmxXyAnDO0ScbN/QuD6EP6hkvM1u+QuSX0qwvbJHTPBW68CS/aavtXCIxO1Rnvw==
X-Received: by 2002:a05:600c:1e11:b0:38c:b316:e6f5 with SMTP id
 ay17-20020a05600c1e1100b0038cb316e6f5mr3957202wmb.93.1649767671079; 
 Tue, 12 Apr 2022 05:47:51 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d64e7000000b00204a13925dcsm31349422wri.11.2022.04.12.05.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:47:50 -0700 (PDT)
Message-ID: <dd918de6-aaf3-a9d1-0504-4b6a3f3d4e9c@redhat.com>
Date: Tue, 12 Apr 2022 14:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-5-javierm@redhat.com>
 <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
 <4128b288-2b9a-f9cd-01f3-a1d50d3e10bb@redhat.com>
 <YlVgpHqqqFy43L37@smile.fi.intel.com> <YlVg8PE6SBzhmqjI@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YlVg8PE6SBzhmqjI@smile.fi.intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 13:22, Andy Shevchenko wrote:
> On Tue, Apr 12, 2022 at 02:21:08PM +0300, Andy Shevchenko wrote:
>> On Tue, Apr 12, 2022 at 10:07:02AM +0200, Javier Martinez Canillas wrote:
>>> On 4/12/22 09:23, Geert Uytterhoeven wrote:
>>>> On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
>>>> <javierm@redhat.com> wrote:
> 
> ...
> 
>>>>> -       ssd130x->device_info = device_get_match_data(dev);
>>>>> +
>>>>> +       variant = (enum ssd130x_variants)device_get_match_data(dev);
>>>>
>>>> (uintptr_t), to avoid a cast from pointer to integer of different
>>>> size warning.
>>>>
>>>
>>> Indeed. The kernel test robot reported the same.
>>
>> Not only because of this, but also with the non-NULL pointers I prefer the old
>> style without ugly castings.
>>
>> Instead, you may export the array (in the driver's namespace) and use
>> &info[ID] pointer for the specific device info.
> 
> Note that device_get_match_data() has no clue if the data is absent or
> data == (void *)0.
>

Yep, we could make the enum start at 1 and check for !variant but that's
something that will also be prevented by your suggestion to just use the
&info[ID] instead.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

