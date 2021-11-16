Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F84452DFD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E906F457;
	Tue, 16 Nov 2021 09:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99ED6F457
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637055033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSJuWcsoneSy8n7p/CMH5CiBgKa6pj13KM6UjkRVYgQ=;
 b=ZNuw90pTNo8VJXxz7jytgIOtMXeoDb4DbUHAGdahSP8vRwHAmGwfZGKZBZwHU/MeHpkhZ/
 xNSSa13UmHXu20euuyTvHp1oK2pcwzIz4pX49X2ZgQUrlJBPk1I53JXypZDih8s43l3jBX
 je44eTgQy+Yl+yCqbLiqHFpaMNaHcPk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-XQ-PuuI-P_ajQishl92I-Q-1; Tue, 16 Nov 2021 04:30:32 -0500
X-MC-Unique: XQ-PuuI-P_ajQishl92I-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so1169082wmq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSJuWcsoneSy8n7p/CMH5CiBgKa6pj13KM6UjkRVYgQ=;
 b=CGXBXEBRL4YO+XDLi71aqyHScuarK96HCeahWXgjONxSZq9qKG6GNIPtuz8ShFD54Q
 S5yQRROUmUKv0sX8/rsKp9TCv4teddmDGvbMH6KO2Q687pFwM0W8dKoece0uqeFFww2M
 oakQfOoLMDPPacW6ecqcd5i++gtbl1NDZv0i30BwKHuWiPEI2wF/w1YNm9NjDXdThdKK
 ijhfnzDTp6KButHCCvb3I0TckaJm9SFcIhvw+npk3kmbzWUb3iSXGIdP3EUE/VjUoS2I
 W8JmQrsRLeHP99zPQo7PrJVb8FOh96IVaY+fQ+q7VwqWG3ucT7PQfQYEB3CPTCsfIdwS
 E5Fg==
X-Gm-Message-State: AOAM530SZ8NAVoarsGQ+mPEtLk8akhw/yoF5WWVvW0GcPoHGwk/KZJcd
 Ig5/CcEl7gPYW5jV+mK/+ZjM06UUPMJZpWLvDVl5bvuuvEi4H7eaeN7qN/hya7WFYhI9sB2aj5I
 6M3xxkfz5a/47NcXvLuF9135V2BaQ
X-Received: by 2002:adf:a389:: with SMTP id l9mr7555785wrb.121.1637055031193; 
 Tue, 16 Nov 2021 01:30:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgwiZj0DgXvYqrW2sWMV/yCu3WNu9rReMDFw4j3A00MnBKJ5k23ydvxJPOILvWBidIQ2S8/A==
X-Received: by 2002:adf:a389:: with SMTP id l9mr7555735wrb.121.1637055030865; 
 Tue, 16 Nov 2021 01:30:30 -0800 (PST)
Received: from [192.168.1.102] (91.pool90-171-47.dynamic.orange.es.
 [90.171.47.91])
 by smtp.gmail.com with ESMTPSA id p2sm1944790wmq.23.2021.11.16.01.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:30:30 -0800 (PST)
Message-ID: <579a584a-68af-d5c9-0547-30cb1592d46f@redhat.com>
Date: Tue, 16 Nov 2021 10:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211111111120.1344613-1-javierm@redhat.com>
 <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
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
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 11/15/21 17:20, Geert Uytterhoeven wrote:

[snip]

>> @@ -351,6 +351,17 @@ static int efifb_probe(struct platform_device *dev)
>>         char *option = NULL;
>>         efi_memory_desc_t md;
>>
>> +       /*
>> +        * Generic drivers must not be registered if a framebuffer exists.
>> +        * If a native driver was probed, the display hardware was already
>> +        * taken and attempting to use the system framebuffer is dangerous.
>> +        */
>> +       if (num_registered_fb > 0) {
> 
> Who says this registered fbdev is driving the same hardware as efifb?
> This might be e.g. a small external display connected to i2c or spi.
> 
>> +               dev_err(&dev->dev,
>> +                       "efifb: a framebuffer is already registered\n");
>> +               return -EINVAL;
>> +       }
>> +

That's true, although I wonder if the {efi,simple}fb drivers should even be
probed in that case. As I see it, these are always a best effort that are
only useful for earlycon or if there isn't another display driver supported.

Since there may be other conditions needed in order for these to work. For
example, when using the u-boot EFI stub in most cases the unused clocks and
power domains can't be gated or otherwise the firmware frame buffer could go
away (e.g: will need to boot with "clk_ignore_unused" and "pd_ignore_unused").

Same for the simplefb driver, if the DT node is missing resources that are
needed by the display controller to continue working (clocks, regulators,
power domains), the firmware setup framebuffer will go away at some point.

So this is already a fragile solution and $SUBJECT doesn't make things worse
IMO. Since not having something like this can lead to issues as reported by:

https://lore.kernel.org/all/20211110200253.rfudkt3edbd3nsyj@lahvuun/

We could probably do some smarter here by providing a function that checks
if the registered fbdev drivers matches the aperture base. But I'm unsure
if that's worth it. After all, fbdev drivers are likely to be disabled by
most distros soon now that we have the simpledrm driver.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

