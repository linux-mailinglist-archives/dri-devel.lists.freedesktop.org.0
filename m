Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77546491195
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB710FF9D;
	Mon, 17 Jan 2022 22:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FE310F629;
 Mon, 17 Jan 2022 18:03:52 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x11so34949113lfa.2;
 Mon, 17 Jan 2022 10:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Uh7AZm/Y4iYt0dCmFdFJsDhk1e/6oKlJHZDHoRvywWI=;
 b=j6BZAN/xM3Eeh1nqwDmbz5hhRqbZHoIdYNcTOaqfJzAcMI9MeLjvcKsmevxjTSI/ez
 qiQtbOyj3SWyHogIoaaiItphVwtQ5SXTvvdhblh+YuCKQ5sG1reM4Y/s7oDAEgaZWfne
 gMLYa7/a0OprVi+4tkr+VTCHMaupXsMQUZdbcnGKZQrCcria0xzJQXp7K+xDqw/rmcYu
 66qhzlicP4Rc0+/6PI32amvkdMa5/0ALNwZe8eDyDVBSapweAHuBMoKMmUmcg42FYUwv
 Yj8th+CizWOUjt33xBXK65Y2F3uv7iWUs+DdDQWUVPDdWaIxr9u/BEcD07j53nZNueT7
 EiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uh7AZm/Y4iYt0dCmFdFJsDhk1e/6oKlJHZDHoRvywWI=;
 b=sALMNUa33aaNl9KvH2bYZDKMUXBchPRHsK2MF8IwOcQhccrWy65kXBB5KueBtMrnul
 G/jpVI3Pi6mhN7xwJ7Ba7/64WdVglaahImQ+iC5AyoGyb4Pc/E3sSpHJYX7G0QeRSscI
 wnh0KQ6JVknSBe/oYLl3V5bUfnFbAReFonHZaKiLoV/0VsZaFfzVdZy4VIqKHb0lYWUk
 MzGd/kAoFhfenbHHTjf1FTAE0Cb+4FZIU0Tno0xOx206Qnj2h0XQRCrMcYgktZ1Gn6SK
 BBFzaUjGnoo+4eBybi/BaujSxG58CbsXpYdt5oUThJJPrrMzRI3bEfI/bzENehnQw8cE
 aScQ==
X-Gm-Message-State: AOAM532y3C0NSkCUgGBql2jb3ZtQVYqO8nojqPiLb8Y1dDQQowps3jsd
 k91cm8Ltc+ZtW1OI1M5svQU=
X-Google-Smtp-Source: ABdhPJzLKbQWmqM7HBfukbr9lx+DP9n73WRmOfCXwCO6qni+nBDJehAyAE9mJ9beP+2MYRPci4aneA==
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr1413064ljj.263.1642442630734; 
 Mon, 17 Jan 2022 10:03:50 -0800 (PST)
Received: from [192.168.1.122] (91-155-102-19.elisa-laajakaista.fi.
 [91.155.102.19])
 by smtp.gmail.com with ESMTPSA id u6sm699992lfr.158.2022.01.17.10.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 10:03:50 -0800 (PST)
Message-ID: <66835d0f-fe80-aa80-0347-cb7fd00696fc@gmail.com>
Date: Mon, 17 Jan 2022 20:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm/i915: Prepare for multiple GTs
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20220112222031.82883-1-andi.shyti@linux.intel.com>
 <20220112222031.82883-2-andi.shyti@linux.intel.com>
 <YeGq/b6JjJaxSE0z@mdroper-desk1.amr.corp.intel.com>
 <YeG6GrzU/QYUY1RH@intel.intel>
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <YeG6GrzU/QYUY1RH@intel.intel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.1.2022 19.59, Andi Shyti wrote:
> Hi Matt,
> 
> [...]
> 
>>> -int intel_uncore_setup_mmio(struct intel_uncore *uncore)
>>> +int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
>>>   {
>>>   	struct drm_i915_private *i915 = uncore->i915;
>>> -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>>> -	int mmio_bar;
>>>   	int mmio_size;
>>>   
>>> -	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
>>>   	/*
>>>   	 * Before gen4, the registers and the GTT are behind different BARs.
>>>   	 * However, from gen4 onwards, the registers and the GTT are shared
>>> @@ -2044,7 +2041,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore)
>>>   	else
>>>   		mmio_size = 2 * 1024 * 1024;
>>>   
>>> -	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
>>> +	uncore->regs = ioremap(phys_addr, mmio_size);
>>
>> Is there a specific reason we switch to ioremap() instead of
>> pci_iomap_range()?  I.e., we could pass 'phys_offset' rather than
>> 'phys_addr' and call
>>
>>          pci_iomap_range(pdev, mmio_bar, phys_offset, mmio_size);
>>
>> Not that it really matters too much either way as far as I can see;
>> ioremap()/iounmap() should work fine too.
> 
> this was originally changed by Abdiel (I think) and I left as it
> is as I tried to change as less as I could from the original
> work.

Hey,

It’s been awhile and this code has changed a lot! I remember needing the 
unmapped phys_addr of each tile’s mmio_bar as well when I refactored 
this spot (setup_mmio) so its GGTT portion can be ioremapped according 
to ggtt_probe_common.

Cheers!
Abdiel
> 
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Thank you!
> 
> Andi
