Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A373CB08
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 15:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F9210E10E;
	Sat, 24 Jun 2023 13:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88FF10E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 13:26:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-25e89791877so723331a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687613205; x=1690205205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
 b=j4S9zj7lUuy3sqeeDhUPOz9rwvMJbGSEdKnwRk/XZ+y08PrJVIgqGnCRVMjv5QysTG
 qw+xSrtWimmK0w+c8oUxGgA/hWWS3mddb5TfZRZZkZXCB9iy4qhZcLzmK/w1rFGHNOlD
 u6YXzvdMzyxYCBki+QXeLCsaSepsuUuVeoUWLvfvN2Dfxqqx0oSY8FZK/DD2zqhKZHfv
 RYvqwhQB7QGRxNAtgIU6NHSikcQzK9FTked9KfdwhJI/KFzaz6eCW0C1QabmKjtdXE0H
 kEFZFV+Sc13EU6p5oRwnRdHPaXUEyY8PcvUlBsvAgUzJqMVPy3L5lDhMq3dGib+XWXWt
 gQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687613205; x=1690205205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
 b=iKGIf+SaoQxk2pHimSi/QmdIGjwHKk8xdHV1seKd1ZgECEHVfJ+VSMH9r+jX0YGo9A
 eHxtXOIz1wG6F/q5gG0mlNomu4jy4SIhRY1V50VP4BijOytNpPHIQRkX72EEXCgo7cZ8
 BjNFPgHdL/y69acdJ9bO1lXOK2wcNsiLVT8dv2pDUassxyxBAhEZvfRPEMyU6iwrKqjT
 spKbxj2PToBMvH5F5VXfhxiKb5KWQn1LA0oZFUTz5dQg8YVhYsm1Ta9Fl6HVS2YHjP8w
 PQzjcoCxijVKNm1HitHoyPulLHswe/RSUY+aSrjP5Y/qqzCtH5D+sipIB5c8m6Usfi5D
 8/Gg==
X-Gm-Message-State: AC+VfDx4AG3O0vC+Hx5CJYNBtXwGrHVDUwDrT6/Z1s3qfepomUaszf4P
 gUTFJveI1G2WMLQfI3KFd78=
X-Google-Smtp-Source: ACHHUZ7BC5DQswxC/X8knfo6PJ0Ce0pzV2b4lrahqjLtajzjQRmz1UcB8/ZZrwmJOMsABWyiGJPEWQ==
X-Received: by 2002:a17:90b:251:b0:25b:d304:6eaf with SMTP id
 fz17-20020a17090b025100b0025bd3046eafmr14080091pjb.24.1687613204832; 
 Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n189-20020a6327c6000000b0055387ffef10sm1282333pgn.24.2023.06.24.06.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Message-ID: <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
Date: Sat, 24 Jun 2023 06:26:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v3, 17/19] arch/sparc: Implement fb_is_primary_device() in source
 file
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/23 02:27, Arnd Bergmann wrote:
> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>
>> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>>> Other architectures implment fb_is_primary_device() in a source
>>> file. Do the same on sparc. No functional changes, but allows to
>>> remove several include statement from <asm/fb.h>.
>>>
>>> v2:
>>> 	* don't include <asm/prom.h> in header file
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>
>> This patch results (or appears to result) in the following build error
>> when trying to build sparc64:allmodconfig.
>>
>> Error log:
>> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch
>> in reference: cpufreq_us2e_driver+0x20 (section: .data) ->
>> us2e_freq_cpu_init (section: .init.text)
>> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch
>> in reference: cpufreq_us3_driver+0x20 (section: .data) ->
>> us3_freq_cpu_init (section: .init.text)
>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>> undefined!
> 
> These all look like old bugs that would be trivially fixed if
> anyone cared about sparc.
> 

Odd argument, given that this _is_ a sparc patch. Those may be old
bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.

Sure, I can stop build testing it if that is where things are going.

Guenter

>> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
> 
> I checked that there are no callers of fb_is_primary_device()
> in built-in code when CONFIG_FB is =m, so adding the MODULE_LICENSE()
> and MODULE_DESCRIPTION() tags to the file is the correct fix.
> 
>      Arnd

