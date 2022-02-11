Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020DC4B2545
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393AB10EA9F;
	Fri, 11 Feb 2022 12:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAA510EA87
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644581490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbeS5Q0QdhSeqbBe2L7Sp2F6l+GpdK7iWbNe2W3yu0w=;
 b=Jkk5JIUtiTJQ91JlidV11G+xGEvtzGNzpGHKfueu9qRFskfvcuBwAYnP7K2ULgYJsBiAtQ
 yClh4gzwRfWiv4DgZZzGLEMNjDxSwRxC6CcM+p82FEql4cKpAVOpTSEy/D/+tMDWSSy5cO
 5AMhE7pVIuzVp2L/7iT1VFn0FPWmOdw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-VWG6609dOHmAmctN2-sqyw-1; Fri, 11 Feb 2022 07:11:28 -0500
X-MC-Unique: VWG6609dOHmAmctN2-sqyw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso2433192wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rbeS5Q0QdhSeqbBe2L7Sp2F6l+GpdK7iWbNe2W3yu0w=;
 b=bFVur68J+JJlok4hn//RGn0okQh8QNRp1ioGGgK+jn8vH8V9ZozAHo0XsnFQIx9r1G
 ADFkrY1tyM5UirBEDQ4v580+Igt4+gXGAopOlyU2LsX3qVJQxFS0uvWj0OgXE4sNDvY/
 /mIJvtCgZt+0FHSr1WaWhgnKCg5CmNO3OW7nMCPWOnZBaApFdN07epgQUf5DnrUabA3t
 LQABBz1SwBnHjw3pZciUsrA1uLe9FutAuIkcD6ow7qvfYAE0MFKzRm0iIK67KCrEUr0j
 WNqpNfFecJIX2X9lOz1YnTD+TfajTCP1Lzx/eqwgaqRKXI7kPiS2/hPrKDtaGHsYfLMa
 Y7Lw==
X-Gm-Message-State: AOAM531xb/+s1RerQ+VH5pzl0o/Y25s6YbbjtAwcyzohDlwcQY7KofFc
 WbEha9VfxtO4tBUsfFhWuMq2UQ7fWa/IeSgE9LZJr3fnbnWdP1bSum+m/qHCrVRGY0B5h4Gkpci
 He+ioTVxFXnR95yuQ5EFX94JlpKvO
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr1244668wrq.2.1644581487722;
 Fri, 11 Feb 2022 04:11:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySb3y5ME4crlsH+b8xOVBwDu7OcH0jhhdufGAdmsHfpAHWgWr7LCf0VAonkSs7ThGU8Oo4sg==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr1244650wrq.2.1644581487542;
 Fri, 11 Feb 2022 04:11:27 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id v9sm9980052wrw.84.2022.02.11.04.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:11:27 -0800 (PST)
Message-ID: <431f26fb-5943-eb58-9ad5-eda787966ad2@redhat.com>
Date: Fri, 11 Feb 2022 13:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87pmnt7gm3.fsf@intel.com>
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
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jani,

On 2/11/22 13:05, Jani Nikula wrote:

[snip]

>>>> I don't see why a while loop would be an improvement here TBH.
>>>
>>> Less letters to parse when reading the code.
>>
>> It's a simple refactoring of code that has worked well so far. Let's 
>> leave it as-is for now.
> 
> IMO *always* prefer a for loop over while or do-while.
> 
> The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> instantly know how many times you're going to loop, at a glance. Not so
> with with the alternatives, which should be used sparingly.
> 
> And yes, the do-while suggested above is buggy, and you actually need to
> stop and think to see why.
>

Absolutely agree.

These format conversion helpers are not trivial to read and understand (at
least for me). In my opinion the code should be written in a way that ease
readability and make as robust and less error prone as possible.
 
> 
> BR,
> Jani.
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

