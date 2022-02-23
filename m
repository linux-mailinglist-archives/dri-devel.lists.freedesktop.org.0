Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0AF4C191B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF0F10F00C;
	Wed, 23 Feb 2022 16:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E0E10F00C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645635299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGsFxlL4JeFa1QdhcUJScvi/ilLeoFbRM78k1G2b9hU=;
 b=Tl1J67Jeoh2rJl6U0NNdA9vnV/A4XRdzrKJNx9hLLlIAz6ri0ZsyDGfzBbgwuuaWYNaRso
 B4x9wgRfbJpfKf45gIMZ72wSExzLJcJEe45iJdloLsKezWYDu7PHVgjUFSYmuChyogVGRr
 biImOL2eyRnNSj3ZXm2UYusa1brmJWU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-UIikDLTGN5WwYTs6A_8wWQ-1; Wed, 23 Feb 2022 11:54:57 -0500
X-MC-Unique: UIikDLTGN5WwYTs6A_8wWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v24-20020adf8b58000000b001eda5c5cf95so1129498wra.18
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VGsFxlL4JeFa1QdhcUJScvi/ilLeoFbRM78k1G2b9hU=;
 b=TL3adkSlDOxiExqrFc7R2y+kX8q9AE4MddF0sHrUbGNb6GwjgCFN+SJRDiTxRZ+ow8
 PgZEWi8xUvugcMxRNym65+FAnDyMIxBMCPmaF60PfLqHe/u4WW+dNZzj51tnWZuvsYz8
 sPlBdTUdyLlxhPZcSjLFDZpKVisZiSLyVHRFDll4j8tk87JI1auYKjongOenrAIUBhH0
 cZRo9d+JOuCL/vcHPjS3SZKCKWKjjZ+GdaDVn2qc1/B3hDDtpmJkECZGu8nup43EUeO3
 uizsXuRUsgQLwUWodWfeMzFHCZL6rjj2W5TzzqlushkYqM+/KNRR6hPqLGCw2bNrZvs+
 v1Ag==
X-Gm-Message-State: AOAM5300ONYO/dLuyPFXSPylOsEjxXu16CPefvGXRKRWPRaFnyrufHk6
 Im00NFZSDs8xjx4B/gHfMyK7LYEbZ02HG6+DbFEfPzfZKgyWOWd4ox/7JM2VCG7YxnL+HinYOYU
 NnNx7caKqx/+Z0ZuxscQgWKYk+//w
X-Received: by 2002:a05:6000:11c9:b0:1ed:b92d:8c68 with SMTP id
 i9-20020a05600011c900b001edb92d8c68mr387249wrx.692.1645635296722; 
 Wed, 23 Feb 2022 08:54:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh2m/1l5+uIPpemZfPkQyC83sbpmuOCBmgtWvmNNgg8mQBYxAIW77Ao8GytoqMFEHFUp6k6Q==
X-Received: by 2002:a05:6000:11c9:b0:1ed:b92d:8c68 with SMTP id
 i9-20020a05600011c900b001edb92d8c68mr387231wrx.692.1645635296423; 
 Wed, 23 Feb 2022 08:54:56 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n2sm79430wmq.6.2022.02.23.08.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:54:56 -0800 (PST)
Message-ID: <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
Date: Wed, 23 Feb 2022 17:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220223164528.GE3113@kunlun.suse.cz>
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
Cc: linux-fbdev@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 17:45, Michal Suchánek wrote:

[snip]

>>>
>>> To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
>>
>> I think you meant "VESA modes with the sysfb driver" ? or something like
>> that since otherwise it seems that you meant to use it with the simplefb
>> (drivers/video/fbdev/simplefb.c) fbdev driver, which doesn't support the
>> "vga=" param as far as I understand (it just uses whatever was setup).
> 
> And the vga= is whatever was set up by the realmode code. And the config
> option for realmode code to do that is selected by vesafb and not
> simplefb so it does not wotk for simplefb/simpledrm/whatewer when efifib
> is not built into the kernel.
>

Yes, that's what I tried to say. But your commit message says "To enable
use of VESA modes with simplefb in legacy BIOS boot mode" and that isn't
accurate AFAIU (unless you meant sysfb instead).
 Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

