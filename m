Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07571B3810
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7E6E95E;
	Wed, 22 Apr 2020 06:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A92C89217
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 18:17:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so17624279wrp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d+6jESbCvom8boV1Iz569w6jKc+CILAkX582DGmlOlo=;
 b=mQnQ0MOZb5HAjIp/13NpjEXuDIO7U9B4is6pfGQDxq3kJQmaqO0qZliXaA+crLKeiv
 hZ3fyzWaKTi36Gji2yKwBR5Vuoh7wNGQKsSW2PGuaHEzamk3jATQ5Mt3rc0+ARve6/Ka
 t2hiL07+7kcG0iuaoGdIG/QfV9bHL6Jc/LmjqRSWP4GdNMmv11FKpfmquznU0nbxGz91
 4BYH4vGjLXZ5TXMWuE8L/jSK2LjiRTAYSzVAb8Rn8BdTFnMKWr/YoAcdUZXx/7bA8Ees
 av41L8pcXPoQK52trQrU347Ym30hgRHNP1koZumWJRnO3DlgTwXFzI5dAN3ui8PL6Sze
 ki/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d+6jESbCvom8boV1Iz569w6jKc+CILAkX582DGmlOlo=;
 b=Bf04MSVnbft5/oQNXrtnYMSdJWZU5Vna/4o1mN5W2v1B9GjbuVmk4Q28hng/POErfN
 WdvPyVjiQNvHG6AFU/tLJOBErSCMOha+jtFAyzyhg/TFpOluJN9NtNeNaMv5/PVMoLbQ
 qG/1tMKVO9VOycoR/ZJQe/hcEjpAO9FGbdBdrZk7wq/Qw1Hap6kV5mhgWB0N40QEDtTX
 9ihH0S3t5/zfWXeV+kxqW+X46JeTmhWSusIMqFunpE/rnMNOQn6V06xXUC+ySdY5gydW
 hmR7MACX9jSFFdy9/atY2rpwnwb804r9CzflpEj6PheRWSbHtbixeACQyVLHBIy/Xm73
 7ODQ==
X-Gm-Message-State: AGi0PuZPayOBy/QBh1qN5RNXB4kAwkK0O3seoUk0ANmtRqrDpLmfups2
 /kypLy6JJOBvHYtDaTHwKu4=
X-Google-Smtp-Source: APiQypIxTRtDUCBScSJRt+j/IVmGwz+hgVch8UpwbARQGIcr29Ekhok/1Q6jgx61gq3YOJYzbqHd4w==
X-Received: by 2002:adf:decb:: with SMTP id i11mr24292487wrn.140.1587493068988; 
 Tue, 21 Apr 2020 11:17:48 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:b4a9:f772:3340:fbf9?
 ([2a02:810d:340:2e50:b4a9:f772:3340:fbf9])
 by smtp.gmail.com with ESMTPSA id p5sm5580060wrg.49.2020.04.21.11.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 11:17:48 -0700 (PDT)
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
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
From: Philipp Rossak <embed3d@gmail.com>
Message-ID: <5749af21-e707-c998-c83b-50c48867c9e8@gmail.com>
Date: Tue, 21 Apr 2020 18:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
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

On 21.04.20 13:21, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
>> On 20.04.20 09:38, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Fri, Apr 17, 2020 at 02:09:06PM +0200, Philipp Rossak wrote:
>>>>>> I'm a bit skeptical on that one since it doesn't even list the
>>>>>> interrupts connected to the GPU that the binding mandates.
>>>>>
>>>>> I think he left it out for a future update.
>>>>> But best he comments himself.
>>>>
>>>> I'm currently working on those bindings. They are now 90% done, but they are
>>>> not finished till now. Currently there is some mainline support missing to
>>>> add the full binding. The A83T and also the A31/A31s have a GPU Power Off
>>>> Gating Register in the R_PRCM module, that is not supported right now in
>>>> Mainline. The Register need to be written when the GPU is powered on and
>>>> off.
>>>>
>>>> @Maxime: I totally agree on your point that a demo needs to be provided
>>>> before the related DTS patches should be provided. That's the reason why I
>>>> added the gpu placeholder patches.
>>>> Do you have an idea how a driver for the R_PRCM stuff can look like? I'm not
>>>> that experienced with the clock driver framework.
>>>
>>> It looks like a power-domain to me, so you'd rather plug that into the genpd
>>> framework.
>>
>> I had a look on genpd and I'm not really sure if that fits.
>>
>> It is basically some bit that verify that the clocks should be enabled or
>> disabled.
> 
> No, it can do much more than that. It's a framework to control the SoCs power
> domains, so clocks might be a part of it, but most of the time it's going to be
> about powering up a particular device.
> 
So I think I've found now the right piece of documentation and a driver 
that implements something similar [1].

So I will write a similar driver like linked above that only sets the 
right bits for A83T and A31/A31s.
Do you think this is the right approach?

>> I think this is better placed somewhere in the clocking framework.
>> I see there more similarities to the gating stuff.
>> Do you think it is suitable to implement it like the clock gating?
> 
> I'm really not sure what makes you think that this should be modelled as a
> clock?
> 

Looks like I looked in the wrong place and got some information that are 
not suitable for this.

>>>> The big question is right now how to proceed with the A83T and A31s patches.
>>>> I see there three options, which one do you prefer?:
>>>>
>>>> 1. Provide now placeholder patches and send new patches, if everything is
>>>> clear and other things are mainlined
>>>> 2. Provide now patches as complete as possible and provide later patches to
>>>> complete them when the R_PRCM things are mainlined
>>>> 3. Leave them out, till the related work is mainlined and the bindings are
>>>> final.
>>>
>>> Like I said, the DT *has* to be backward-compatible, so for any DT patch that
>>> you are asking to be merged, you should be prepared to support it indefinitely
>>> and be able to run from it, and you won't be able to change the bindings later
>>> on.
>>
>> I agree on your points. But is this also suitable to drivers that are
>> currently off tree and might be merged in one or two years?
> 
> This is what we done for the Mali. The devicetree binding was first done for the
> out-of-tree driver, and then lima/panfrost reused it.
> 
> The key thing here is to have enough confidence about how the hardware works so
> that you can accurately describe it.

Ok thanks! So I will resend my patches when the work got a more mature 
state and we know enough about the Hardware.

Cheers,
Philipp


[1]: 
https://elixir.bootlin.com/linux/latest/source/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
