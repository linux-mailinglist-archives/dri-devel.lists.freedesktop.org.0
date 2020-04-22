Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C81B55D8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E2C6E378;
	Thu, 23 Apr 2020 07:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38D16EA28
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587571764;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ceaM0Q57EWu8SAKxL8w74OvIguml9sO5tkQvRprE6B8=;
 b=httnAG1Ebs2pMNJiQtjRYlKxPo/k0f+V6QTUrdVbSFTAvxFg8wwMWsFcp2j/suzm2G
 et0nUFLe2L88svNUwn9xutYdn9XN+5UiX3YkehIxev0Q29ShK2ZQVRjSi3zz6xQLniEA
 PzsD5QewGEzdr/2BmHu+gJlxczcOQG77hFKVAn0jxNq5A6nojiNIrlhM3dc56S78/5w2
 IxrPSSVQknoK62ZaQQe9winlt+weQ/OJJ0HEV4NlpIPpP/Ox8Oz+JfCepC22imrpCkQv
 BmTjvw70jkZa+ezKBGYLPzeyoq/Jk+puota8GCP4wDaR3EHLJy+3kq2mXNv9R0hYY8T7
 0PXQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMiw43tskc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw3MG923NL
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 22 Apr 2020 18:09:02 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
Date: Wed, 22 Apr 2020 18:09:01 +0200
Message-Id: <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
 <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
 <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
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

> Am 22.04.2020 um 17:13 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
> On Wed, Apr 22, 2020 at 09:10:57AM +0200, H. Nikolaus Schaller wrote:
>>> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
>>>> 
>>>> It also allows to handle different number of clocks (A31 seems to
>>>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
>>>> or making big lists of conditionals. This variance would be handled
>>>> outside the sgx core bindings and driver.
>>> 
>>> I disagree. Every other GPU binding and driver is handling that just fine, and
>>> the SGX is not special in any case here.
>> 
>> Can you please better explain this? With example or a description
>> or a proposal?
> 
> I can't, I don't have any knowledge about this GPU.

Hm. Now I am fully puzzled.
You have no knowledge about this GPU but disagree with our proposal?
Is it just gut feeling?

Anyways, we need to find a solution. Together.

> 
>> I simply do not have your experience with "every other GPU" as you have.
>> And I admit that I can't read from your statement what we should do
>> to bring this topic forward.
>> 
>> So please make a proposal how it should be in your view.
> 
> If you need some inspiration, I guess you could look at the mali and vivante
> bindings once you have an idea of what the GPU needs across the SoCs it's
> integrated in.

Well, I do not need inspiration, we need to come to an agreement about
img,pvrsgx.yaml and we need some maintainer to finally pick it up.

I wonder how we can come to this stage.

If I look at vivante,gc.yaml or arm,mali-utgard.yaml I don't
see big differences to what we propose and those I see seem to come
from technical differences between sgx, vivante, mali etc. So there
is no single scheme that fits all different gpu types.

One thing we can learn is that "core" seems to be a de facto standard 
for the core clock-name. An alternative "gpu" is used by nvidia,gk20a.txt.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
