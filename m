Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A049494F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081F10E8A1;
	Thu, 20 Jan 2022 08:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E2010E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642666962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLVHq+ON4LJE7JdXE+L05OdMvflHcDcxIWOwnu+S7Gc=;
 b=I7JzvtPrWJEVuFSju1E43vyhy+GdtCvvk4BwWGX1ReO+Oq5lL/lybpozjpDUDdeGhGLsjW
 DIU1q4wXVduf2deRXz2PmD7qFSkVufd1klRA5lvLZy+FM7asrs5MnUpkGVTdniVjvCXOhc
 lxk+G9/QAZCsXG5C41CcoXHlTOor0H4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-5DtMPW_HOiqkt9ZeQDT_zg-1; Thu, 20 Jan 2022 03:22:41 -0500
X-MC-Unique: 5DtMPW_HOiqkt9ZeQDT_zg-1
Received: by mail-wm1-f69.google.com with SMTP id
 az10-20020a05600c600a00b0034d64b1203aso4870663wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sLVHq+ON4LJE7JdXE+L05OdMvflHcDcxIWOwnu+S7Gc=;
 b=8Hvv6xQOM+ZZ2WB3ZJl27IqpJAEx94Gv5FigkA8btmyAYZO219XRhGAVjKnDAj3iIj
 zhFEU3AUzyBb35DUhv+MVUCKf9xLyYfPYaP2ndKNOWCd/LKLRQ1ax+bY3M0zDEosWSvK
 9u8bXcqoQbczxO9Hu6nTXHBNqi5/Ph1NvCxDNXQjpV/tdf/iM+bxAieHlo8zTlXZUq4k
 biCKWCK0wlM7PkOhkQI758C3CVhE2C7nBohgafq9r0iyERH0R0ulWNqaQ6IM+dD+PZDJ
 TH5n+pvONq2HLu5jBqeor8uBCfx95ugktlghCQJzo9iq2HWJExHvC4elL8ZanIDt1Mp1
 6+rA==
X-Gm-Message-State: AOAM530Q9anroMeVKNL0lmYNAf4JtMZcZZZfrZlqIzPAs7bFJu0hja58
 YwR2kx42QEw4kqcMU2vaYYReV5/3/HKdCzWoq3B24pMYTRtDY37dakWiZxjW3hE1sm8h3gTgc4p
 4hJnKtHE+iMS+zLEqemSx78UHgi5x
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr11714868wrz.576.1642666960463; 
 Thu, 20 Jan 2022 00:22:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsUSO/2Cv1v6+Q1pCa19+tTZf9I52ScmsQbQsC/NvC6BIjCFVbX7+dGbVGporFx9c8Wqeazg==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr11714850wrz.576.1642666960250; 
 Thu, 20 Jan 2022 00:22:40 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n10sm557719wrf.96.2022.01.20.00.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 00:22:39 -0800 (PST)
Message-ID: <dc8fc064-f43b-8f36-43ea-7c837a49caf9@redhat.com>
Date: Thu, 20 Jan 2022 09:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/vmwgfx: Stop requesting the pci regions
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
References: <20220117180359.18114-1-zack@kde.org>
 <1c177e79-d28a-e896-08ec-3cd4cd2fb823@redhat.com>
 <da4e34772a9557cf4c4733ce6ee2a2ad47615044.camel@vmware.com>
 <5292edf8-0e60-28e1-15d3-6a1779023f68@suse.de>
 <afc4c659-b92e-3227-634f-7c171b7a74b3@suse.de>
 <80fc6b88d659dd7281364daccfed1fd294e785dc.camel@vmware.com>
 <89f1b9df-6ace-d59c-86a4-571cd92d0a4c@suse.de>
 <e9f42f83d7966952c8c0ff78be7e510a2aebdf01.camel@vmware.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e9f42f83d7966952c8c0ff78be7e510a2aebdf01.camel@vmware.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zack,

On 1/20/22 05:06, Zack Rusin wrote:

[snip]

>>>
>>> Hmm, the patch looks good but it doesn't work. After boot:
>>> /proc/iomem
>>> 50000000-7fffffff : pcie@0x40000000
>>>    78000000-7fffffff : 0000:00:0f.0
>>>      78000000-782fffff : BOOTFB
>>>
>>> and vmwgfx fails on pci_request_regions:
>>>
>>> kernel: fb0: switching to vmwgfx from simple
>>> kernel: Console: switching to colour dummy device 80x25
>>> kernel: vmwgfx 0000:00:0f.0: BAR 2: can't reserve [mem 0x78000000-
>>> 0x7fffffff 64bit pref]
>>> kernel: vmwgfx: probe of 0000:00:0f.0 failed with error -16
>>>
>>> leaving the system without a fb driver.
>>
>> OK, I suspect that it would work if you use simpledrm instead of 
>> into the kernel binary.
> 
> Yes, simpledrm works fine. BTW, is there any remaining work before
> distros can enable it by default?
> 

Alpine already did AFAIK, OpenSUSE and Fedora are doing it soon

I don't know about the others distros but I guess they will follow.

>>
>> If that works, would you consider protecting pci_request_region()
>> with
>>   #if not defined(CONFIG_FB_SIMPLE)
>>   #endif
>>
>> with a FIXME comment?
> 
> Yes, I think that's a good compromise. I'll respin the patch with that.
> 

Agreed. Thanks a lot for testing the other patches anyways.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

