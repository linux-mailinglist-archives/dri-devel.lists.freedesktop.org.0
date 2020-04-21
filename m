Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068E1B380C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3F86E83F;
	Wed, 22 Apr 2020 06:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F246E8FB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 09:57:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u127so2968156wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WrPXEec4AITga6eSmOansPu77CmlHKFEwJJ/qpS6qN0=;
 b=XzIAztT+mPDZUOwemSpHeuMKwyyom6UpYVUgvy9sW+plkI+MKvLzF0WIelhE/s4fQd
 FdQLN8/mrEzy8YyT/vrCk46xeGu1rRAkl3J50y4Yh38jJwMBYr6JPXv4HDCOXp4X5cWG
 lxvpYer0iUja0i9/cnq6qi/aczhg7taK+V1C5VP87hlnsVyIEmOwnZhYslHgNhX3JXrD
 ORLG/NSj8yZZwwLlP2ddoTtJ2uTmIToQwF4ZS6XQPk0/a6yw1DpWbNWVJ5hwKCRc6n0c
 6wI68y7E6M8JbLE07W3iSrNsXtH7b30IUSO1Fnp/QOx08JPxGM7xlafgolcctTcz/meZ
 DFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WrPXEec4AITga6eSmOansPu77CmlHKFEwJJ/qpS6qN0=;
 b=FnuJSsfVNVoEqhqIszmo6GJ+8Px8ZIhLRT3bJ2BfELbU4wuwEK2uLXZCHcrwUYMivI
 nIcW9yvhjXO6pSaWcwXH7OCphI2wYVMZtkqB4R7nr20vIrcYR1FevtmFyc091yvP932g
 45FzaSPLDSzMsG1WkUtOjZXRd/rdJD5Sw/hDaUlaG0Ef4u/sCI7oqV3RksmTDg7AkBZS
 c3H6alYtpw0YiZjB1YAxJPBOQDFgJTJOZ7wql42yTSfip737pu5Ts116yfWJqwZvBrm0
 z+T5dtExGY/Id37g/ZNlcLFro1JcrZI2p4sYV6MbS0xuaIu9Havd3fsX/MMSEpQu4w/X
 kyUQ==
X-Gm-Message-State: AGi0PuZrm4Dho6Tkx0Tk6OUeYkUqZG3jl9XdHEYBw1YZ/SQdIqzW97eD
 7blMw6JMDyQTx8YpHq1GOvY=
X-Google-Smtp-Source: APiQypIk3cTAhoSv9SYqD5kOWe7sVp3s0kn28AOHHwlVh0ZbrjxfvG0bZNvA0N2HoKlsXm6HuX2Sig==
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr4188162wme.79.1587463055735; 
 Tue, 21 Apr 2020 02:57:35 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:bc17:18d9:e349:724?
 ([2a02:810d:340:2e50:bc17:18d9:e349:724])
 by smtp.gmail.com with ESMTPSA id 17sm2751403wmo.2.2020.04.21.02.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 02:57:35 -0700 (PDT)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
To: Maxime Ripard <maxime@cerno.tech>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
From: Philipp Rossak <embed3d@gmail.com>
Message-ID: <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
Date: Tue, 21 Apr 2020 11:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, James Hogan <jhogan@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 20.04.20 09:38, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 17, 2020 at 02:09:06PM +0200, Philipp Rossak wrote:
>>>> I'm a bit skeptical on that one since it doesn't even list the
>>>> interrupts connected to the GPU that the binding mandates.
>>>
>>> I think he left it out for a future update.
>>> But best he comments himself.
>>
>> I'm currently working on those bindings. They are now 90% done, but they are
>> not finished till now. Currently there is some mainline support missing to
>> add the full binding. The A83T and also the A31/A31s have a GPU Power Off
>> Gating Register in the R_PRCM module, that is not supported right now in
>> Mainline. The Register need to be written when the GPU is powered on and
>> off.
>>
>> @Maxime: I totally agree on your point that a demo needs to be provided
>> before the related DTS patches should be provided. That's the reason why I
>> added the gpu placeholder patches.
>> Do you have an idea how a driver for the R_PRCM stuff can look like? I'm not
>> that experienced with the clock driver framework.
> 
> It looks like a power-domain to me, so you'd rather plug that into the genpd
> framework.

I had a look on genpd and I'm not really sure if that fits.

It is basically some bit that verify that the clocks should be enabled 
or disabled. I think this is better placed somewhere in the clocking 
framework.
I see there more similarities to the gating stuff.
Do you think it is suitable to implement it like the clock gating?


>> The big question is right now how to proceed with the A83T and A31s patches.
>> I see there three options, which one do you prefer?:
>>
>> 1. Provide now placeholder patches and send new patches, if everything is
>> clear and other things are mainlined
>> 2. Provide now patches as complete as possible and provide later patches to
>> complete them when the R_PRCM things are mainlined
>> 3. Leave them out, till the related work is mainlined and the bindings are
>> final.
> 
> Like I said, the DT *has* to be backward-compatible, so for any DT patch that
> you are asking to be merged, you should be prepared to support it indefinitely
> and be able to run from it, and you won't be able to change the bindings later
> on.

I agree on your points. But is this also suitable to drivers that are 
currently off tree and might be merged in one or two years?

>> Since this GPU IP core is very flexible and the SOC manufactures can
>> configure it on their needs, I think the binding will extend in the future.
>> For example the SGX544 GPU is available in different configurations: there
>> is a SGX544 core and SGX544MPx core. The x stands for the count of the USSE
>> (Universal Scalable Shader Engine) cores. For example the GPU in the A83T is
>> a MP1 and the A31/A31s a MP2.
> 
> Mali is in the same situation and it didn't cause much trouble.
> 
Good to know.

>> In addition to that some of the GPU's have also a 2D engine.
> 
> In the same memory region, running from the same interrupts, or is it a
> completely separate IP that happens to be sold by the same vendor?
> 
What I know till now this is part of the PowerVR IP and not separated. 
So it should use the same memory region, clocks and interrupts.

Cheers
Philipp

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
