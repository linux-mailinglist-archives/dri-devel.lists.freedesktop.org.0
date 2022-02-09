Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF64AF681
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8910E28E;
	Wed,  9 Feb 2022 16:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329FF10E28E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644423965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9tzfRXX9aIJ3ddS/ncBHLRQCL4mho0HZX6VdWoJ+48=;
 b=bD/01IxV8Gfo6Ps5+btDBzwNy6BzV+TEssYStrtPZ9hJ6no62Pcgl9F94kgkw4eTTZgoUp
 uPU7NvlVkGhpCsAWAnzBPCU1nyT/UcH55JDWSMEVAXYlyrJ8PGB7L87O3/0zHzg5pl/dSY
 GOZ7iRqByp6zGoUA1aB3+q/lFrP3Ld4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-1srR2DeMMdywPBH09nse9A-1; Wed, 09 Feb 2022 11:26:04 -0500
X-MC-Unique: 1srR2DeMMdywPBH09nse9A-1
Received: by mail-wr1-f70.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso1313593wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9tzfRXX9aIJ3ddS/ncBHLRQCL4mho0HZX6VdWoJ+48=;
 b=iAkyzVkgkYNCX2m+ksng9FJyq1OUnnKVLi173560m16trQjowNnT9e7+pr2b2CphoT
 MOxxxzG7ywo40EsPCyNz/8FlFp2uyso7AXOz/jrtbXB6zGSMCHpeKFU+PA0rpg6uKHEx
 9ogDKKq7KyFS7pR01tymQV6A8skaqmmasFmkrMkWc87ahCq0Oai6gK6dGjI9AGps8zRG
 fYZuxn/2VqiMWobvHRCsEVX3w2xsbshgWcGjuAGUAQ9DaQAp8uiZdN0dMgzCUcYLgekY
 YH1tYPtB4AZsqcQiJ8ZXtqfyq+OA78hlHMnXKxR2q2cCgPbhnHOVy0LuRelukJhwT9Qo
 frIQ==
X-Gm-Message-State: AOAM53366MB+NMvuyv0DTrSJKebjS056lTPbHX0eEjX+6t4ZChCkdrFW
 UsxHAyAsa8sIDOKEeyAsnepAudACI0b43ylNPYWBWJSCNaRO2G+U8wcqb0wwNGC74k2RSp0J3LA
 ZWVIvDf70mikV1fAXXpNwElkyWCsa
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr2759716wmq.23.1644423962960; 
 Wed, 09 Feb 2022 08:26:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKaf2S5vQEeUlpONN8Lw24iZWfuG6UcC4phWOJMjQWloR3GX0YNxop48TsjVq5kgNCNsqZBA==
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr2759672wmq.23.1644423962457; 
 Wed, 09 Feb 2022 08:26:02 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p14sm17885082wrr.7.2022.02.09.08.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:26:02 -0800 (PST)
Message-ID: <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
Date: Wed, 9 Feb 2022 17:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
 <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
 <YgPnE0yj0Y0OJxq6@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPnE0yj0Y0OJxq6@smile.fi.intel.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 17:08, Andy Shevchenko wrote:

[snip]

>> Agreed, as mentioned I'll give it a try to sending all the data as a
>> bulk write with regmap.
> 
> Ah, it might be that it should be noinc bulk op. Need to be checked anyway.
>

Yeah, I'll give it a try for v4. Let's see how it goes.

[snip]

>>>
>>> A-ha, why not in the callee?
>>>
>>
>> I think is easier to read when doing it in the caller, specially since there
>> is only a single call. Than calling it unconditionally and making it a no-op
>> if there isn't a reset GPIO.
> 
> It doesn't matter where the check is and checking that in the callee seems
> better as it relies on the reset functionality. Caller in such case shouldn't
> even think if it's supported or not, not their business.
>

Ok, no strong opinions really so I will change it.
 
> Last, but not least, if you think of power management, you probably want to
> assert reset there as well, means additional checks?
> 
>>>> +		ssd130x_reset(ssd130x);
> 
> ...
> 
>>>> +	if (IS_ERR(ssd130x)) {
>>>
>>>> +		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
>>>> +		return ssd130x;
>>>
>>> return dev_err_probe() ?
>>>
>>
>> No, because this isn't a resource provided by other driver. If this
>> failed is mostly due a memory allocation error.
> 
> Is it a problem? dev_err_probe() got update in the documentation explaining
> that's fine to call even in such cases. The outcome is less amount of LOCs.
>

Thanks for pointing out. In my mind that was a way to denote in the code that
a probe deferral was possible and that the message should be debug but now I
went and read the comment as you suggested:

 * Note that it is deemed acceptable to use this function for error
 * prints during probe even if the @err is known to never be -EPROBE_DEFER.
 * The benefit compared to a normal dev_err() is the standardized format
 * of the error code and the fact that the error code is returned

So you are correct and using it is preferred even when no probe defer error
will be returned. I'll do that here and in the other places you mentioned.

[snip] 

>>> I have feelings that half of my comments were ignored...
>>> Maybe I missed the discussion(s).
>>
>> I assure you that no comments from you or anyone were ignored.
>>
>> I may had missed something but if if I did was a mistake and
>> not intentionally. I keep a changelog for each revision in
>> the patches with the name of the reviewer so people can check
>> and compare.
>>
>> If something that you mentioned is not there, I apologize and
>> please point me out so I can address it in v4.
> 
> It's just a feeling, because I repeating that dev_err_probe() a lot :-)
> Nevertheless, now I see at least your point why you went that way.
> But see my comments on it.

And I did use dev_err_probe() in the places that could cause a probe
deferral so it wasn't (completely) ignored.

On that topic, I even typed a SPI driver because of your feedback :)

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

