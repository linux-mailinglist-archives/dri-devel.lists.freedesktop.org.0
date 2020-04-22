Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21821B55C8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCC16E1D8;
	Thu, 23 Apr 2020 07:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182356E342
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587539471;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=x9g4xzih9SHZrw00RWoUucyKrGmw7cFSE/C08UHHhbo=;
 b=frz6YUvNIFgehAyAc1WFWX6TSRxQFDnLE4v7iuQoUOjNgVDEYM/Jf13BLalo7TQEI+
 jMVi8PYy3367sHAu8jdvFBPE1KmYmHhhGttSgC1pMuMQbpkBsS2rQyUWu10kJnskme2H
 me4+1TIydhLE2Y2QkKISYynG+hrPk0WTgyvCwGiL6Fdn4OSCB+BrXAEY80aIIL2ehqB+
 owK9YxD8nrgsPEOtDr/KfTSP4YIBo6RAwWnyoDWCwBWRY8Io+pLppe/Y639y695voVeM
 OaDFvgvsr6IlydqeDCspuH0vG8ybX/UPKbfV2F2dq0/mrEZ4ZC8Ry08W/OPsHNCfVnmA
 6qLA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCym3NRQH2PRBNS67Wq1XcMUsV9wfG0LbuNrxINn"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:263a:4100:a53d:b96b:debd:cf9d]
 by smtp.strato.de (RZmta 46.6.1 AUTH) with ESMTPSA id e09987w3M7Ao19A
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 22 Apr 2020 09:10:50 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
Date: Wed, 22 Apr 2020 09:10:57 +0200
Message-Id: <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
References: <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
To: Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
> On Tue, Apr 21, 2020 at 07:29:32PM +0200, H. Nikolaus Schaller wrote:
>> 
>>> Am 21.04.2020 um 16:15 schrieb Tony Lindgren <tony@atomide.com>:
>>> 
>>> * Maxime Ripard <maxime@cerno.tech> [200421 11:22]:
>>>> On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
>>>>> I had a look on genpd and I'm not really sure if that fits.
>>>>> 
>>>>> It is basically some bit that verify that the clocks should be enabled or
>>>>> disabled.
>>>> 
>>>> No, it can do much more than that. It's a framework to control the SoCs power
>>>> domains, so clocks might be a part of it, but most of the time it's going to be
>>>> about powering up a particular device.
>>> 
>>> Note that on omaps there are actually SoC module specific registers.
>> 
>> Ah, I see. This is of course a difference that the TI glue logic has
>> its own registers in the same address range as the sgx and this can't
>> be easily handled by a common sgx driver.
>> 
>> This indeed seems to be unique with omap.
>> 
>>> And there can be multiple devices within a single target module on
>>> omaps. So the extra dts node and device is justified there.
>>> 
>>> For other SoCs, the SGX clocks are probably best handled directly
>>> in pvr-drv.c PM runtime functions unless a custom hardware wrapper
>>> with SoC specific registers exists.
>> 
>> That is why we need to evaluate what the better strategy is.
>> 
>> So we have
>> a) omap which has a custom wrapper around the sgx
>> b) others without, i.e. an empty (or pass-through) wrapper
>> 
>> Which one do we make the "standard" and which one the "exception"?
>> What are good reasons for either one?
>> 
>> 
>> I am currently in strong favour of a) being standard because it
>> makes the pvr-drv.c simpler and really generic (independent of
>> wrapping into any SoC).
>> 
>> This will likely avoid problems if we find more SoC with yet another
>> scheme how the SGX clocks are wrapped.
>> 
>> It also allows to handle different number of clocks (A31 seems to
>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
>> or making big lists of conditionals. This variance would be handled
>> outside the sgx core bindings and driver.
> 
> I disagree. Every other GPU binding and driver is handling that just fine, and
> the SGX is not special in any case here.

Can you please better explain this? With example or a description
or a proposal?

I simply do not have your experience with "every other GPU" as you have.
And I admit that I can't read from your statement what we should do
to bring this topic forward.

So please make a proposal how it should be in your view.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
