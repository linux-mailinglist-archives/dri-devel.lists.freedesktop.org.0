Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E67306491
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 20:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF116E877;
	Wed, 27 Jan 2021 19:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76026E877
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 19:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611777552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/UsaQpy9owGSAnCeo3VsEu5JuZEkF1vXo3NykuqkpE=;
 b=Udjd4fAlaAtw3/4p73103h3QUVF8ZFcw+fgC8aw0pIEM8kuVQ1qpS/rF8nWxWXHhe4vkRE
 sELM3rGm1r+gxvnio8gdxJycyXhBloemghjRdCTTXtChSzZfIuaBArA278LPip9LeXn3sO
 4TKHGjOEN6fZhVu5NbIyVUO09b3g20c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-vHM0YS1rM6q-8-kIBIgIpw-1; Wed, 27 Jan 2021 14:59:09 -0500
X-MC-Unique: vHM0YS1rM6q-8-kIBIgIpw-1
Received: by mail-ed1-f72.google.com with SMTP id m18so1957341edp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 11:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/UsaQpy9owGSAnCeo3VsEu5JuZEkF1vXo3NykuqkpE=;
 b=KBZjhq6kknqqWCS4l5vFAjzZ1+xK4JMeB14bVTcKacUBRpZAKkwFjZtnpfbYCwsnM1
 W6BKcpCpW3KopO5QppOZV2lInhCXPqUtqA9FZz/cECtbgj3OascY8JZ1NMY6Vaf/tB33
 K/9cRE/125kaDOvaxcDLuKUZT0JjClmEWgMGZnj8k71ee3saBE5ayIKEtaB6WgxD5quv
 sIAh1dyZjphq8sE8/H11ujjEHC31w64M39jyOi5LVKCL+4IrXu0GNMHa0a8e8n3X0jJf
 5/VsbB0Q1dAnnqHwLNxBmaAo7gYiDJs7FoumQBjNRbPnMJoizl/69RlYj75szzif309x
 eKMg==
X-Gm-Message-State: AOAM530eud/EFu46ZYho7+Eo9+PKCS3KwyPdsiWZHEeP0hnkIpXGCmlW
 0v8vTg68ABH2XSR8a+Nc+PzEM4z5zSk+znRAkcZZxzDDbqvCxeoABZTI1g/YBY9vIBsLHQcuTMr
 xy/yVg8xCVO/8nCYxWi5E2MY9S7fA
X-Received: by 2002:a17:906:708f:: with SMTP id
 b15mr8139591ejk.267.1611777548268; 
 Wed, 27 Jan 2021 11:59:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlaO5BzU++0K+fbZ4fszfnZHOzoIQSWZSqrmuYdsQcWzs897KjBJMn22JCj/RJRaVwvpFeVw==
X-Received: by 2002:a17:906:708f:: with SMTP id
 b15mr8139580ejk.267.1611777548103; 
 Wed, 27 Jan 2021 11:59:08 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id v9sm1275522ejd.92.2021.01.27.11.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 11:59:07 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
 <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
 <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c860f9a-f007-e7c6-6142-dbeed10c40ba@redhat.com>
Date: Wed, 27 Jan 2021 20:59:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Gross <mgross@linux.intel.com>,
 linux-watchdog@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/26/21 9:54 PM, Andy Shevchenko wrote:
> On Tue, Jan 26, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/26/21 6:14 PM, Andy Shevchenko wrote:
>>> On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
>>>> <andy.shevchenko@gmail.com> wrote:
>>>>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
>>>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>>
>>>>>>> Hi guys,
>>>>>>>
>>>>>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>>>>>> immutable branch with a given tag, please pull to yours subsystems.
>>>>>>
>>>>>> Hi Andy,
>>>>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
>>>>>> then I should probably start looking at removing the corresponding
>>>>>> parts in GMA500.
>>>>>
>>>>> Nope. It is related to only Medfield / Clovertrail platforms.
>>>>>
>>>>> There are other (MID) platforms that may / might utilize this driver
>>>>> in the future.
>>>>
>>>> Right, there's still Oaktrail / Moorestown with hardware in the wild.
>>>
>>> Actually Moorestown had to be removed a few years ago (kernel won't
>>> boot on them anyway from that date when Alan removed support under
>>> arch/x86 for it).
>>>
>>> I'm talking about Merrifield and Moorefield that can utilize it and
>>> also some other platforms that are not SFI based (Cedar something...
>>> IIRC).
>>
>> Yes at least there are some 64 bit capable SoCs with GMA500 which were
>> used in NAS like devices. These NAS-es actually have a VGA output
>> (and maybe also DVI?) which is attached to the GMA500.
> 
> Since you are talking about 64-bit, definitely they are *not*
> Moorestown, Medfield, Clovertrail since the mentioned never were
> 64-bit. But it would be nice to see the CPU model number to be sure.

My info on this comes from this bugreport:
https://bugzilla.redhat.com/show_bug.cgi?id=1665766

And the machine that bugreport is about is a "Thecus N5550 NAS box (Intel Atom D2550/Cedarview platform)"

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
