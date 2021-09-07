Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49A40291B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 14:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04889F45;
	Tue,  7 Sep 2021 12:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB689F45
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KH4d7to2qGxsGFbI6vW2JkFkW7XP4klDMzdSwOEJlM0=;
 b=Cf/3pPOAULtQdzUlOEgcFM+pP2gTJgwES1hvKH6ZXsCBenoOXcDPlK/ZsUP3mj6YvUJFL+
 4p8qZCx3M0b8awHz+njyc/Hk5btJvPaVBauI02vwzxaZngHna4XdicGg0+X80miqgB/jsF
 55ImVxBCfpTMCizTZULFD3TVdnHGEyI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-2QwJfYx3P8Okiv738n4u9A-1; Tue, 07 Sep 2021 08:42:58 -0400
X-MC-Unique: 2QwJfYx3P8Okiv738n4u9A-1
Received: by mail-ed1-f70.google.com with SMTP id
 bf22-20020a0564021a5600b003c86b59e291so5067445edb.18
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 05:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KH4d7to2qGxsGFbI6vW2JkFkW7XP4klDMzdSwOEJlM0=;
 b=GQkEgX+TIv7uVrXlWDuK/cEZsrz8ZzIXTMDzFbIXDesMgkXeQ6UqFgYjTZUSw6VG+e
 qlyufTXrqNdKkk4OJ3owzm1e/jRZEqNt+v81zeT+BP3sdl2ECPY4wMOTkuL49sRn2tCz
 h/zIgcO+XIaJAOvWLNcSS2uR8Ul6uOdRxJ1yEwoE2ySyqetAMaSYfFQBv8C0OmP8z/SY
 v4xBwnW2pp6eqRTbsdosW0ysDUlvnznGWo1HuwWrXN6PTSvfBEgkJMmLaTTrRkuLF8FX
 sLIr0Hvc/FcI7upScPbe6gur019BSp7rHvEJWhLgbuXMBYSC1aw7p1+R4X+WVWemQB6e
 3k3Q==
X-Gm-Message-State: AOAM532RP4YnvjfuiLYmivIOxK99xkaWjWHRt7PuPzAJHqIjWMdQHu0+
 lY4YJFW0YuKFuz42tZOpnU5CyV4UZsXL8vUiYbMwABI/sEn2790LDICYd9cyOGHDwXGerikNZu1
 Y3j4Rz7Bx+c25bxbzLR4oKMg+UfUjxZgZfVz6hdP6nrz37EhrgKL8tgINNHOunXQsaJItrQJzDL
 7uvOmm
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr18439052edv.384.1631018577479; 
 Tue, 07 Sep 2021 05:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVbKB7AFNgvovf1cAmiRm9S6rSeahi0EBMFkvP485WVc4eH2gVNUmT0Ner78wx3GlcDh3Yyw==
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr18439030edv.384.1631018577268; 
 Tue, 07 Sep 2021 05:42:57 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id u16sm5523681ejy.14.2021.09.07.05.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 05:42:56 -0700 (PDT)
Subject: Re: Handling DRM master transitions cooperatively
To: Pekka Paalanen <ppaalanen@gmail.com>, Dennis Filder <d.filder@web.de>
Cc: dri-devel@lists.freedesktop.org
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
Date: Tue, 7 Sep 2021 14:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907130746.7b667dac@eldfell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/7/21 12:07 PM, Pekka Paalanen wrote:
> On Fri, 3 Sep 2021 21:08:21 +0200
> Dennis Filder <d.filder@web.de> wrote:
> 
>> Hans de Goede asked me to take a topic from a private discussion here.
>> I must also preface that I'm not a graphics person and my knowledge of
>> DRI/DRM is cursory at best.
>>
>> I initiated the conversation with de Goede after learning that the X
>> server now supports being started with an open DRM file descriptor
>> (this was added for Keith Packard's xlease project).  I wondered if
>> that could be used to smoothen the Plymouth->X transition somehow and
>> asked de Goede if there were any such plans.  He denied, but mentioned
>> that a new ioctl is in the works to prevent the kernel from wiping the
>> contents of a frame buffer after a device is closed, and that this
>> would help to keep transitions smooth.
> 
> Hi,
> 
> I believe the kernel is not wiping anything on device close. If
> something in the KMS state is wiped, it originates in userspace:
> 
> - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
>   output off, you need to be careful to "leak" your FB if you want a
>   smooth hand-over)

The "kernel is not wiping anything on device close" is not true,
when closing /dev/dri/card# any remaining FBs from the app closing
it will be dealt with as if they were RmFB-ed, causing the screen
to show what I call "the fallback fb", at least with the i915 driver.

> - Xorg doing something (e.g. resetting instead of inheriting KMS state)
> 
> - Something missed in the hand-off sequence which allows fbcon to
>   momentarily take over between Plymouth and Xorg. This would need to
>   be fixed between Plymouth and Xorg.
> 
> - Maybe systemd-logind does something odd to the KMS device? It has
>   pretty wild code there. Or maybe it causes fbcon to take over.
> 
> What is the new ioctl you referred to?

It is an ioctl to mark a FB to not have it auto-removed on device-close,
instead leaving it in place until some some kernel/userspace client
actively installs another FB. This was proposed by Rob Clark quite
a while ago, but it never got anywhere because of lack of userspace
actually interested in using it.

I've been thinking about reviving Rob's patch, since at least for
plymouth this would be pretty useful to have.

Regards,

Hans

