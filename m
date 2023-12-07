Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4A8080E3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 07:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B25A10E7AE;
	Thu,  7 Dec 2023 06:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA50810E7AE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 06:39:07 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 25AE36045F;
 Thu,  7 Dec 2023 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701931146;
 bh=WJ0wR74d+mkwm+IUhYNno9dDAtwE/eqL/spvRAJBdfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NB5K6bbGCpg41F4Y2JGI/TNwe3RGFW3Rb4TSnkoscLAJWyiJiI9oXkVCYi5gJHMUE
 rec/JKiVE0yT1vYJQYhdXWSOpHIN54QGzL6WqfqoxkLv91onW6Dz79NJ6Vdb3udRhT
 g4HB3bZFTntDqubO+X3JvKDCdaKA0DekPQ4uWpzaKpeKqvgHMCIg8HwkhVRqCravtn
 YeFizvmnz0qBvGZ2CbSPVnG4I+Gr9T0sxFMTO9tFLKvsPkuLc89p9Vr2tw7BtmLd1j
 PUVaUSKJDGuguxsfKpyxZIFKGKz5PBUnOl4Ij7KZmXv3Ryh00sxy2R/JOPY1RyCIZ1
 XKfEq9e8Lqa+Q==
Date: Thu, 7 Dec 2023 08:38:02 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20231207063802.GR5169@atomide.com>
References: <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
 <20231205075657.GN5169@atomide.com>
 <df7dd7b0-f315-4033-985a-175f75568a8c@linaro.org>
 <20231205081031.GO5169@atomide.com>
 <efcd64f4-00d2-4671-af3a-e27764f70e8d@linaro.org>
 <20231205083001.GP5169@atomide.com>
 <27f2e3a3-0791-4278-adb2-55ed76820a3a@linaro.org>
 <20231205100246.5db0d6a1@aktux>
 <78a81d54-f12c-401e-9a26-5125eb0b1c65@linaro.org>
 <20231205104343.2e3c4105@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205104343.2e3c4105@aktux>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Andreas Kemnade <andreas@kemnade.info> [231205 09:43]:
> On Tue, 5 Dec 2023 10:27:56 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> > On 05/12/2023 10:02, Andreas Kemnade wrote:
> > > On Tue, 5 Dec 2023 09:45:44 +0100
> > > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > >   
> > >>> Sure the clock nodes can be there for the child IP, but they won't do
> > >>> anything. And still need to be managed separately by the device driver if
> > >>> added.    
> > >>
> > >> So if OS does not have runtime PM, the bindings are wrong? Bindings
> > >> should not depend on some particular feature of some particular OS.  
> > > 
> > > Any user of the devicetree sees that there is a parent and the parent needs
> > > to be enabled by some mechanism.
> > > E.g. I2c devices do not specify the clocks of the parent (the i2c master)  

Yeah the interconnect target module needs to be enabled before the child
IP can be probed for any OS. That is unless the target module is left on
from the bootloader.

But like I said, I have no objection to also having the clocks for the
child SGX device here. I think two out of the tree SGX clocks are merged,
so one of the three clocks would repeat twice in the binding.

We do provide some of the clock aliases, like fck and ick, for the child
ip automatically by the ti-sysc interconnect target module. But likely we
don't want to clock name specific handling in the driver so best to
standardize on SGX specific clock names. That is if the clock properties
are not set optional.

> > If you use this analogy, then compare it with an I2C device which has
> > these clock inputs. Such device must have clocks in the bindings.
> > 
> I would see target-module = i2c master.
> 
> Well, if there is a variant of the i2c device which does not require
> external clocks and a variant which requires it, then clock can be
> optional.

Yes that sounds about right for an analogy :)

Regards,

Tony
