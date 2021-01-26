Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1FA30464C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 19:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209D2893A3;
	Tue, 26 Jan 2021 18:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121F789A72
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611686012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqMbFBiR5bxTo9dvjO6KoLK8PoaeAMT7uahfFjAtB40=;
 b=Zz2gV7HAD1g+eXpeNZ21icdGX00Q8q68R21qc6pLcti9HwucvGJukOmEL0YoWZOx6MCHqF
 LVayIFVhPi/XeyDlSdYbW71Iiptv4y649/OFYTRAbYIAwWXhx/7ncMnSRiq3Y+MbQoqjck
 ayUvjEchmcWO/sKrph6C+TpPy3OdKog=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-HWTtZlX9NQWFrP0ao7G4MA-1; Tue, 26 Jan 2021 13:33:28 -0500
X-MC-Unique: HWTtZlX9NQWFrP0ao7G4MA-1
Received: by mail-ed1-f72.google.com with SMTP id j12so9775065edq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 10:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WqMbFBiR5bxTo9dvjO6KoLK8PoaeAMT7uahfFjAtB40=;
 b=ktEMgtWYQ6/KcmciGkjwLX+7/w/TWrsZYtxv60mAeOKoj2Piyc0c77UJzY1wuPII6a
 0KgOcsH1YA0dO7XfAIGIWzFrEvvqSwLYLIXhbXzWkdR8uzGR7oFzk2z2uq75QZHHu+2t
 ytQQHmwxZBwRV7LvZLuEoY5Tcum/pLZexW0fpdGWPoO8040hHWRp2/OnTTZYwvtdQj+N
 xsKaRGB0wx0vy6j9/aYi2OfJ7F9aUbXZldSY7yF75tzK7OdPAqUpJGC8XDNxwrmyZto2
 sWw4cyiyv66XxQAgL2483ivXy01ir5KTxmiuJrWkqEQZodBJbt3RrLOl9n4MKTlnXHKu
 IbVg==
X-Gm-Message-State: AOAM533TjR1vVTfqKNkVvZFSmoMz45NMOJ2aRzSe/vKqI4IUSCJI7fdl
 o3zOOplHd/MDuFeM9NiMxu31P8cKn4hygF3TZD77RZKga4daMKAhlg2PMh3hadJxW4QahJEItjO
 RwYmOcw1kGNDmT1k1QAEr/jYuse1T
X-Received: by 2002:a17:906:1c13:: with SMTP id
 k19mr4334526ejg.338.1611686007767; 
 Tue, 26 Jan 2021 10:33:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN194XtVlCKAdXK5VKIvZ0VfeTCUimiW4/dTBZnu6yHH6IeYtTZlE3OE5MXYja0RwyxasFow==
X-Received: by 2002:a17:906:1c13:: with SMTP id
 k19mr4334512ejg.338.1611686007623; 
 Tue, 26 Jan 2021 10:33:27 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id k22sm13162485edv.33.2021.01.26.10.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 10:33:27 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
Date: Tue, 26 Jan 2021 19:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
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

On 1/26/21 6:14 PM, Andy Shevchenko wrote:
> On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
>> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>>
>>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>
>>>>> Hi guys,
>>>>>
>>>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>>>> immutable branch with a given tag, please pull to yours subsystems.
>>>>
>>>> Hi Andy,
>>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
>>>> then I should probably start looking at removing the corresponding
>>>> parts in GMA500.
>>>
>>> Nope. It is related to only Medfield / Clovertrail platforms.
>>>
>>> There are other (MID) platforms that may / might utilize this driver
>>> in the future.
>>
>> Right, there's still Oaktrail / Moorestown with hardware in the wild.
> 
> Actually Moorestown had to be removed a few years ago (kernel won't
> boot on them anyway from that date when Alan removed support under
> arch/x86 for it).
> 
> I'm talking about Merrifield and Moorefield that can utilize it and
> also some other platforms that are not SFI based (Cedar something...
> IIRC).

Yes at least there are some 64 bit capable SoCs with GMA500 which were
used in NAS like devices. These NAS-es actually have a VGA output
(and maybe also DVI?) which is attached to the GMA500.

I know people are running Fedora on these, so we should at least keep
these supported.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
