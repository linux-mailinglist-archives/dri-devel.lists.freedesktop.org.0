Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7450A0B0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB8310E834;
	Thu, 21 Apr 2022 13:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D3310E834
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650547378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJojMIzm435XzabOfDtYuG0zr6ejdW43VXmGBccZZNg=;
 b=DzzPr3kaGVjo5nhRpCRmPFGITEIZK4EAEgCSUVbf3QCneU1a/HcdODnILT3NbwklQTvzND
 DyEb6GHLpHELBPA1veABtEGUwhFZuoYh/HBNxF+mF4/pjB6MgWtcHIGAvaN/ELfP3hKWrY
 Lettolki99P7l4iKh49UpqNVHQCa6NA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-fKafUlR1OpG6iNlJ8-zdQA-1; Thu, 21 Apr 2022 09:22:57 -0400
X-MC-Unique: fKafUlR1OpG6iNlJ8-zdQA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j30-20020adfb31e000000b0020a9043abd7so1128411wrd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BJojMIzm435XzabOfDtYuG0zr6ejdW43VXmGBccZZNg=;
 b=rZqwiP3t3h+Nd5DZbZ3B8jGQGfOcJwy0oU8VXu4GlAc4sL7AjXVKNnjMVp+Mzo2Oe5
 K/i4CVY/A429gYcVZfzzDaVR/vSKCmdeYdCzh988Gg7YXIhx8erc2vGrZsj0HeTpSh7G
 KTF2vNyfPwHQSE4gervNH7CmN3dkH8KB+btalqIgHbq73Y1pWn1c9RpwURUxhQ6kzsKP
 rVGrAY3KtLs+pjyKQLJsduZ+0tEBTr+RQ51b8ErDMlC3U3s5lmhnK8W4vdNuHFJDoWZu
 u0PZKUnO5drWbCyYqlLkoP6d0yI26GYEDcbTDgBFSIzkJx4DulutgR9/EYyAbm2UJg9u
 uaKg==
X-Gm-Message-State: AOAM5302YXkebe9E5n7Ugunr4mB80DG+lGbMx7SsaUinaUyVFFS8I0Hf
 oEhqfa5kAThoZ+kXolEtxAS/42zgfdd2bEmqCVwvUG02aiqIlNk4SkLmH84DDis7LyGgH3t+YjK
 gtVTOQ1fPj0X0c5bztb7iN4kIv7d4
X-Received: by 2002:a1c:e916:0:b0:37c:f44f:573 with SMTP id
 q22-20020a1ce916000000b0037cf44f0573mr8663742wmc.179.1650547376598; 
 Thu, 21 Apr 2022 06:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn3A3s5KnRy+9aLB72aBChb71Yy22EwcgU2Ux1UhqHDMPpPRcfl9e7aAlABnXQkQlFn6odPw==
X-Received: by 2002:a1c:e916:0:b0:37c:f44f:573 with SMTP id
 q22-20020a1ce916000000b0037cf44f0573mr8663714wmc.179.1650547376244; 
 Thu, 21 Apr 2022 06:22:56 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d64ca000000b0020aa97b0383sm2267705wri.113.2022.04.21.06.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 06:22:55 -0700 (PDT)
Message-ID: <10c81e57-2f09-f4f8-dc2f-6bd05ef819d7@redhat.com>
Date: Thu, 21 Apr 2022 15:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/21/22 14:54, Patrik Jakobsson wrote:
> On Thu, Apr 21, 2022 at 2:47 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[snip]

>>>>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
>>>>> index 0cff20265f97..a422fa84d53b 100644
>>>>> --- a/drivers/gpu/drm/gma500/Kconfig
>>>>> +++ b/drivers/gpu/drm/gma500/Kconfig
>>>>> @@ -2,11 +2,13 @@
>>>>>   config DRM_GMA500
>>>>>       tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
>>>>>       depends on DRM && PCI && X86 && MMU
>>>>> +     depends on FB
>>>>
>>>> Why do we need FB here? Framebuffer support should be hidden by DRM's
>>>> fbdev helpers.
>>>
>>> It is not needed but gives him video output since it enables the drm
>>> fbdev emulation.
>>>
>>
>> I'm not sure to understand this. Shouldn't depend on DRM_FBDEV_EMULATION then?
> 
> No, it shouldn't depend on any FBDEV stuff since it's not actually
> required. It just happens to help in this case since weston + fbdev
> backend works but not weston with drm backend (or whatever config
> James have set).

I see. Then the correct approach for them would be to just enable CONFIG_FB
and DRM_FBDEV_EMULATION in their kernel config, rather than making this to
depend on anything FB related as you said.

> 
>>
>>> I looked some more at the logs and it seems weston doesn't work on his
>>> system without the fbdev backend. So the question is why weston isn't
>>> working without fbdev? Perhaps this is just a Weston configuration
>>> issue?
>>>
>>
>> But is weston using the fbdev emulated by DRM or the one registered by
>> efifb? I thought that the latter from what was mentioned in this thread.
> 
> It's using drm fbdev emulation with gma500 so EFIFB has nothing to do
> with this. I believe it was just simply incorrectly reported. If I'm
> correct then "depends on FB" is what makes video output work for
> James.
> 

Got it. Thanks for the clarification.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

