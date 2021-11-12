Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9544E4B2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810236E8FB;
	Fri, 12 Nov 2021 10:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23D26E917
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636713330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESxUrrp2niyFj2SEQ95J4I3ux91XqFDjhDdEg5bTD3A=;
 b=cfh/ywy7zy+BNX1+M9TKxGD7TlBKxvRz6am8vttfxpzsVArcoAOu10pVOP2djptIOD0yY3
 nRRG2DYjws11l+/eQnaLCumBw+1FASJNiOHIqrN1C1dayOvY32M1mx+g3Y/t5b5bwIqreM
 rWJ0o1lNSEh84PCN2pRGbNv1N9UggvY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-7-3gfM6GPK6tfKBz5Sa6qQ-1; Fri, 12 Nov 2021 05:35:28 -0500
X-MC-Unique: 7-3gfM6GPK6tfKBz5Sa6qQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 a67-20020a1c7f46000000b00333629ed22dso2533142wmd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 02:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ESxUrrp2niyFj2SEQ95J4I3ux91XqFDjhDdEg5bTD3A=;
 b=vizzedmbr78y7eJgTBOWQglJRWBMp7uWw6AfM+lz9gnDb6th9kbMbY4AlmC5hXVxU5
 Bqmal7tcAF3wj6AcMFP5NTZaBkAMg2ImEHo4CaFQQ7JobYQypD0CFin5gmvKK21NPuUX
 CP4oR0rZU2EpU7wS7VvT7ohzG6QCBdH+C+ZgGKSdRLVgpMDB7GJUi2SJdPrO4XxJoqXh
 0z2eo15khZaGqA/m8K8lzyVzyvW5JaVv0RhEu5agG0YcmTJaqzqhgju9OwkZdInMjYBx
 4/SLUcLcyHSMwIAMXndTeRxrGwK7T7mP+PkssRVlRJs8hOdW9EGyB3ZEGCL9EtGxgO3L
 BG2w==
X-Gm-Message-State: AOAM531oCgPTBYxcfYPj66EqTxfEz/M6bcZNUbgn0KYWh8z7knU3GbLv
 NfTGrD/PN9CvoGY/NKo1WtH5NiLfijfLJDTbSbb7RRtPsnGZrbHMCM3GvEndT2wzhzjVPLa8fKX
 kbyIXGKPxywNH1DrCQxdcmva8eqY+
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr32408331wmc.75.1636713327591; 
 Fri, 12 Nov 2021 02:35:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwWdS92Od66yS5RBjeycg9X/6oCyhiCqM6XuUuk5jzs1h7kYu2mZ9skqVRQyYXAq/StNZz2g==
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr32408298wmc.75.1636713327316; 
 Fri, 12 Nov 2021 02:35:27 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l11sm5167018wrp.61.2021.11.12.02.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 02:35:26 -0800 (PST)
Message-ID: <c1cbe6b4-0c86-b7a5-c2df-0ac3052dec6a@redhat.com>
Date: Fri, 12 Nov 2021 11:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211112122239.26b3787c@eldfell>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/21 11:22, Pekka Paalanen wrote:

[snip]

>>>   
>>>> As this is just returning bool without changing anything, the usual
>>>> word to use is "is". Since this function is also used at most once per
>>>> driver, which is rarely, it could have a long and descriptive name.
>>>>
>>>> For example:
>>>>
>>>> bool drm_is_modeset_driver_allowed(void);  
>>
>> I'd nominate
>>
>>    bool drm_native_drivers_enabled()
>>
>> This is what HW-specific drivers want to query in their init/probing 
>> code. The actual semantics of this decision is hidden from the driver. 
>> It's also easier to read than the other name IMHO
> 
> Ok, but what is a "native driver"? Or a "non-native driver"?
> Is that established kernel terminology?
>

For me the term "native" is also vague. I would prefer to call it platform
specific driver or non-generic driver instead. A problem is that "platform
driver" has a very specific meaning in the kernel, which are drivers for
devices in the "platform" bus (which is also a very overloaded term).
 
> I'd think a non-native driver is something that e.g. ndiswrapper is

Yeah, that's why I think that "generic" and "non-generic" is a better way
to describe the drivers that could be used for any platform as long as the
hardware was already initialized and a struct screen_info filled with data.

> loading. Is simpledrm like ndiswrapper in a sense? IIRC, simpledrm is
> the driver that would not consult this function, right?
>

Correct.

Or maybe just 'bool drm_modeset_enabled()' ? After all, that's really what
the "nomodeset" kernel param disables. The fact that DRM drivers abuse that
boolean semantics to also prevent the drivers to load is a different topic.
 
> 
> Thanks,
> pq
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

