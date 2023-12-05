Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73166804B90
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 08:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C3410E48A;
	Tue,  5 Dec 2023 07:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0329810E489
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 07:58:00 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 9065F60354;
 Tue,  5 Dec 2023 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701763079;
 bh=h3c0XIZu8HbtvK19lq1dOZHqca7qeD59maL/gJhxeU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvctUa8QMANcluWAdRPNxxmD+MVnpSnWC7upoG4UBmVkldsPZDF5bG4K2pjCO2el1
 k7PF1jodRp1xIPKpY9F/Sqd++pafBjiWkEUQ93eB4XUu5cBd+RWhmo94eBTBZeIcaf
 yy6jzlahvKwGQYE/lZ+B0Jk1nAc5YcbFbC7mFp7lYigIiUf9iPyWjV4KXnIgf8oAKP
 2RfpM3jym7Z1TlujzL9SLs34YjoJm6iXY5wnan1T7/oVqW5nLCnBrE0dt8jw0mjJBY
 WzQI/kVtk+kMg0wLCQXW/2/tfZJaYH13Z3Ny/NY+o/tE3lOHdj9mEXGAhv57TgpRo7
 bwBLsWKH9hgaQ==
Date: Tue, 5 Dec 2023 09:56:57 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20231205075657.GN5169@atomide.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
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
 Andrew Davis <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [231205 07:10]:
> On 04/12/2023 19:22, Andrew Davis wrote:
> > @@ -56,6 +76,43 @@ allOf:
> >        properties:
> >          clocks:
> >            maxItems: 1
> > +      required:
> > +        - clocks
> > +        - clock-names
> 
> You need to define the clocks for your variants or disallow them. The
> original code should be fixed as well and make the clocks fixed for all
> img-axe cases.

To clarify, the clocks may be optional as they can be hardwired and coming
from the interconnect target wrapper module and enabled with runtime PM.

Regards,

Tony
