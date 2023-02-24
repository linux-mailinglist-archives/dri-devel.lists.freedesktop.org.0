Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E751A6A1C26
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 13:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3410E0C1;
	Fri, 24 Feb 2023 12:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BE310E0BA;
 Fri, 24 Feb 2023 12:29:36 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x10so53365993edd.13;
 Fri, 24 Feb 2023 04:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U85lTxPI8HIs2MT3aO7tP2yErKRCDhWpRh7/zVvSLog=;
 b=liy+RpRYt9hKtRpYroQyOZxM8Aubo4//jHKIjZgJULpAq9lydt6znuXyl/U57A4PHt
 8HvYPsbb/fq2cSTUS0wEjqqWeAWIoVkaLpVavkL9MiPJGVzQYqCKIbhPV5RkWZbixIvU
 keaOQaK0iJkmjUfS6y34hBsuMKSenkXK6OXspeQ8uNbGVqS1shcO3jZusPCeDZJHRfoP
 XkAUKAUUevKLWObDVUpedBkgIaf3K8wNLRSCPiX73J6jqZV2R0iqeN+zKnXk5YiQDg5n
 IaLK/G5M5h0B8arsk010YkCpQZJY2eypArHT5IDhU75It14RtXsNoy4ZrPU6/MWsoe55
 MyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U85lTxPI8HIs2MT3aO7tP2yErKRCDhWpRh7/zVvSLog=;
 b=rYvr2fxbXuV0GJiRBOSWPaiUQPd/Vf17tDd4AR9iQFqfS7S7qqA4gqAt+oSCL+H3dJ
 Cc0skIDr+082oYDb57lagFUDYWZIRUauSWbtkU2G7uQQm7PhYfFg/E/mOG6L8PaYtpqN
 KdEXLPYuvCROv9P+NU9N2KY1ICKz8tCs6JFv8/cexQxkzdfh4xGfvy228ot02/wCIGBo
 U7Gi83vR/dSS6yYp8kV3fSHsFW6ZTfq8hRtVn1FPAlQ4+woceYfbMiTuvDH6SVUERlYG
 jqRq4RtP8UMysNpqqyizSuHXnxcX9stvyIlyk/eLt9JWQhK4htmSYcHzv3RG9+JDFxI+
 wZXQ==
X-Gm-Message-State: AO0yUKXecJxAGs4ZvtlQ8XBlz1dShRgVWjm8D28tCKO3dxyMneLL0d9y
 nHTyzlEQ0Jtd2zz6ldJ4uGVrdBtgsBpRcA==
X-Google-Smtp-Source: AK7set/2k+NoF04T/r4/iDr+s6FsBtskm8fAFCDcFKs7ndguqNOR2fbGOfP36c9887hiFQgd0pimqQ==
X-Received: by 2002:aa7:cd77:0:b0:4ad:7301:fe77 with SMTP id
 ca23-20020aa7cd77000000b004ad7301fe77mr15505929edb.9.1677241774381; 
 Fri, 24 Feb 2023 04:29:34 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:35e:38c6:dafc:5dd2?
 ([2a02:908:1256:79a0:35e:38c6:dafc:5dd2])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a50ee05000000b004af728bf265sm1074330eds.44.2023.02.24.04.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 04:29:33 -0800 (PST)
Message-ID: <43016018-4d0a-94dc-ce93-b4bff2dce71c@gmail.com>
Date: Fri, 24 Feb 2023 13:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: amdgpu didn't start with pci=nocrs parameter, get error "Fatal
 error during GPU init"
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
 <a99e6def-68be-3f2b-4e01-ac26cdb80f49@gmail.com>
 <CABXGCsM7JPxtQm6B7vk+ZcXfphgQm=ArJZKiDUdbk9hujyRtmg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsM7JPxtQm6B7vk+ZcXfphgQm=ArJZKiDUdbk9hujyRtmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.02.23 um 09:38 schrieb Mikhail Gavrilov:
> On Fri, Feb 24, 2023 at 12:13 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Mikhail,
>>
>> this is pretty clearly a problem with the system and/or it's BIOS and
>> not the GPU hw or the driver.
>>
>> The option pci=nocrs makes the kernel ignore additional resource windows
>> the BIOS reports through ACPI. This then most likely leads to problems
>> with amdgpu because it can't bring up its PCIe resources any more.
>>
>> The output of "sudo lspci -vvvv -s $BUSID_OF_AMDGPU" might help
>> understand the problem
> I attach both lspci for pci=nocrs and without pci=nocrs.
>
> The differences for Cezanne Radeon Vega Series:
> with pci=nocrs:
> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B- DisINTx-
> Interrupt: pin A routed to IRQ 255
> Region 4: I/O ports at e000 [disabled] [size=256]
> Capabilities: [c0] MSI-X: Enable- Count=4 Masked-
>
> Without pci=nocrs:
> Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B- DisINTx+
> Interrupt: pin A routed to IRQ 44
> Region 4: I/O ports at e000 [size=256]
> Capabilities: [c0] MSI-X: Enable+ Count=4 Masked-
>
>
> The differences for Navi 22 Radeon 6800M:
> with pci=nocrs:
> Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B- DisINTx-
> Interrupt: pin A routed to IRQ 255
> Region 0: Memory at f800000000 (64-bit, prefetchable) [disabled] [size=16G]
> Region 2: Memory at fc00000000 (64-bit, prefetchable) [disabled] [size=256M]
> Region 5: Memory at fca00000 (32-bit, non-prefetchable) [disabled] [size=1M]

Well that explains it. When the PCI subsystem has to disable the BARs of 
the GPU we can't access it any more.

The only thing we could do is to make sure that the driver at least 
fails gracefully.

Do you still have network access to the box when amdgpu fails to load 
and could grab whatevery is in dmesg?

Thanks,
Christian.

> AtomicOpsCtl: ReqEn-
> Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
> Address: 0000000000000000  Data: 0000
>
> Without pci=nocrs:
> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B- DisINTx+
> Latency: 0, Cache Line Size: 64 bytes
> Interrupt: pin A routed to IRQ 103
> Region 0: Memory at f800000000 (64-bit, prefetchable) [size=16G]
> Region 2: Memory at fc00000000 (64-bit, prefetchable) [size=256M]
> Region 5: Memory at fca00000 (32-bit, non-prefetchable) [size=1M]
> AtomicOpsCtl: ReqEn+
> Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> Address: 00000000fee00000  Data: 0000
>
>> but I strongly suggest to try a BIOS update first.
> This is the first thing that was done. And I am afraid no more BIOS updates.
> https://rog.asus.com/laptops/rog-strix/2021-rog-strix-g15-advantage-edition-series/helpdesk_bios/
>
> I also have experience in dealing with manufacturers' tech support.
> Usually it ends with "we do not provide drivers for Linux".
>

