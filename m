Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D03D72FB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 12:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9E46E073;
	Tue, 27 Jul 2021 10:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC266E073
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627381337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQZXv7YDIM5TQ5OrBLbbL+WGAuwVTroA459zUHGAT1o=;
 b=M4posc6LS1Q+hQKbCGt07aDCPlvNWguXE/MwV3Ri2K40i2wL717f7u91f+wmFuJoa126DL
 AdOeavUrCG34Q4dY4nWUHnLKdShjvvuQHIbzitgZwWaaqLL2Rlp6dS6O2Rf0IsPq+5RdoX
 d4lfrjB4XPTWlVtnLKOQ/UYqttEBtSc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-FmJq2mHcPE2Q4w2DMl5fgg-1; Tue, 27 Jul 2021 06:22:15 -0400
X-MC-Unique: FmJq2mHcPE2Q4w2DMl5fgg-1
Received: by mail-wm1-f72.google.com with SMTP id
 25-20020a05600c0219b029024ebb12928cso1174244wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 03:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQZXv7YDIM5TQ5OrBLbbL+WGAuwVTroA459zUHGAT1o=;
 b=eN5Gxh7ZGxMCfuwltZ48wgbomCug15ZSBsTXabe9Z7KZu48iMqTQbtMEP1cYUCaSKh
 7MSk8YWc5FoBGdDB6B+N/PNs6e0K7ELA9GCLnZamGKF1DQAG545f9PKjlevHnlKn1eNH
 DpgHr9/x6x0/1Gr1VaY73xxI/ula+ulGZsg8SRl8lfCCSagJfrE0Jj03etnw8yunbf++
 Ly06iwCVch34e/Xm3K6Op71nbSFNIAUU71jwlF2b7Oi2hI8uLzF8cgY+Rh9duTLdmEQS
 lL279bPHM/sXa7J3F+z0h8u1sET47d/PNhgP62rmyx5xBtpGIfXoFTD1l+UWorj9BLiT
 H1iA==
X-Gm-Message-State: AOAM530NzUKqme4PCgTem8IoBaSQGwEL/PgoIZvssIe337W2E7T32kJL
 6xMhOrT3muI8JUfsXOs27kDkjHHW4QCztEzrr4/LHy77kaVst7+cGDeRdeNpzrM9GfmW76clJp3
 Hrjza+GzpPMiAsWSgTWxriZgw1w8c
X-Received: by 2002:adf:fb05:: with SMTP id c5mr23489054wrr.55.1627381334045; 
 Tue, 27 Jul 2021 03:22:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMDLvsPAQ3/6709sjhKocYSoBlg8BJ99SqGvfztQWeRAwUiHvmVo2wGEG1XsdFbpJKIe4grg==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr23489026wrr.55.1627381333707; 
 Tue, 27 Jul 2021 03:22:13 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id p7sm2842383wmq.5.2021.07.27.03.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 03:22:13 -0700 (PDT)
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210727093015.1225107-1-javierm@redhat.com>
 <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
Date: Tue, 27 Jul 2021 12:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 7/27/21 12:03 PM, Geert Uytterhoeven wrote:

[snip]

> Thanks for your patch!
>

You are welcome.

>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -254,7 +254,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
>>  config SYSFB
>>         bool
>>         default y
>> -       depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
>> +       depends on X86 || EFI
> 
> Thanks, much better.
> Still, now this worm is crawling out of the X86 can, I'm wondering
> why this option is so important that it has to default to y?
> It is not just a dependency for SYSFB_SIMPLEFB, but also causes the
> inclusion of drivers/firmware/sysfb.c.
>

It defaults to yes because drivers/firmware/sysfb.c contains the logic
to register a "simple-framebuffer" device (or "efi-framebuffer" if the
CONFIG_SYSFB_SIMPLEFB Kconfig symbol is not enabled).

Not enabling this, would mean that a platform device to match a driver
supporting the EFI GOP framebuffer (e.g: simple{drm,fb} or efifb) will
not be registered. Which will lead to not having an early framebuffer.

The logic used to be in drivers/firmware/efi/efi-init.c, that's built
in if CONFIG_EFI is enabled. We just consolidated both X86 and EFI:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8633ef82f101

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

