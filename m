Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EBE38E49F
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 12:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515386E1A4;
	Mon, 24 May 2021 10:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6B16E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621853575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFtn2RHOEYss0CsLYkuce8tbA8oq7IWTJChBbEjpcfU=;
 b=FmxiKnjoxDtH4t1ypWkogl7Q/osBEvsedoq5oRAHfUTQ4Ru5ztR+S5vvO8kTrOBhcb36Ox
 wncHFzFaiol/1O2RLIJCmuUowLS5EV0JZkfzRmh9eyJv/4A8Otg2QK02nCQ0c1uPAQgp7O
 SPOkgh4taEzzgG25DevunLyslweYr5U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-IliSVtYoMAyEnZIZXrRb9w-1; Mon, 24 May 2021 06:52:53 -0400
X-MC-Unique: IliSVtYoMAyEnZIZXrRb9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso12909062wrh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 03:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HFtn2RHOEYss0CsLYkuce8tbA8oq7IWTJChBbEjpcfU=;
 b=JtiTGfxRktZ6nuw7RgZeXJMucvpARvZLYIB5i7ZUwyyvS02/pZVbiEVwUG2sPBtpyh
 htYKXQmF3BqfqsP7OOWr9xtrm1GVpWCNqiVolsMGEXUoh1agzd8/Q2rqOecRJLQ+eTAR
 fvKYM6zTI3cq8XIYrAwz2Vzm9N594Bu7eVMFVNAuEqOYOsSM5vjDmOAW3iVWxGcF2yhQ
 8t8OJhJoO83RFDdbxxznOOxCjDfplRieGViRiw416cB24K9dAkB2oV5J436EGyXCSHOs
 KgGVyphIkMsq1fALIKwGIAljY3SU6ddRtyyA1vnFpPdUG7/QlwaAAPYrZ19yTYA0KatC
 DdGg==
X-Gm-Message-State: AOAM5317RtcW1NhBy/cGQLEY8iTkWNrkNmWMS3DylaIv6K2F2/cbmPFb
 zZpgtTzavkYun0s/GFAZPLhEVEFT7ZPgUkZZ5Hfhy0zMOdtUmyQHtqFwCNzVMqp6d0TJdTcJ/w7
 zJE/fSFdniM6++LVfBWgz5WT9zCjJ
X-Received: by 2002:adf:cd0b:: with SMTP id w11mr20622275wrm.178.1621853572523; 
 Mon, 24 May 2021 03:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBBAfkXTMs2YQFUS4bUXgvPMEgtCieGtjpbUoBA1QSYRX/jn26s0lewHHOil8Ex/lxYcBBJg==
X-Received: by 2002:adf:cd0b:: with SMTP id w11mr20622252wrm.178.1621853572312; 
 Mon, 24 May 2021 03:52:52 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r11sm11966441wrp.46.2021.05.24.03.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 03:52:51 -0700 (PDT)
Subject: Re: [PATCH 0/2] allow the sysfb support to be used in non-x86 arches
To: Ard Biesheuvel <ardb@kernel.org>
References: <20210521192907.3040644-1-javierm@redhat.com>
 <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <0613bc6b-31b4-93f6-b111-4692778f76c0@redhat.com>
Date: Mon, 24 May 2021 12:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: x86@kernel.org, linux-efi@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Hans de Goede <hdegoede@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Robinson <pbrobinson@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ard,

On 5/24/21 12:24 PM, Ard Biesheuvel wrote:

[snip]

>> Since this touches both arch/{x86,arm,arm64,riscv} and drivers/firmware, I
>> don't know how it should be merged. But I didn't find a way to split these.
>>
> 
> We could merge this via the EFI tree without too much risk of
> conflicts, I think.
>

Great, thanks.
 
> However, I'd like to see a better explanation of why this is an improvement.
> The diffstat does not show a huge net win, and it does not enable
> anything we didn't already have before, right?
> 
> 

I mentioned a little in the cover letter but you are correct that wasn't that
clear. My motivation was to use the simpledrm driver instead of efifb for the
early console, so I could boot without using fbdev at all.

The register_gop_device() in drivers/firmware/efi/efi-init.c only register an
"efi-frambuffer" platform device, which means that it will only allow to use
the efifb driver for the early framebuffer on EFI systems.
 
The "simple-framebuffer" platform device is only registered by OF if there's
a DT node with this compatible string, but it won't be registered for EFI.
 
So the simplefb or newly added simpledrm driver won't be matched and probed
with the current EFI support in aarch64 or riscv. In contrast, the x86 code
does register a "simple-framebuffer" device that uses the GOP framebuffer.
 
One option is to add the same logic in register_gop_device(), but that would
require even more code duplication. Another option would be to make the simple
drivers to match against "efi-framebuffer", but that would be an ugly solution.
 
But even without taking the lack of "simple-framebuffer" into account, I wonder
what would be the benefit of keeping two code paths that do basically the same.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

