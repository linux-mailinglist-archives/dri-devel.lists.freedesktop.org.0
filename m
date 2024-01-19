Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC395832E5C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 18:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984CF10EA3F;
	Fri, 19 Jan 2024 17:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CCA10EA3F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 17:48:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2BCFFCE21E5;
 Fri, 19 Jan 2024 17:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B518C433F1;
 Fri, 19 Jan 2024 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705686497;
 bh=P0KUF6vFTlftYyWUFDT96WHN8XRiIFXd1b2/AovY2hw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8l2whsRDimVA5MSS/fooSc43HMZGOw3e+psIFF/j1oxW2EmsXHFG1D4YvSgvIuH6
 iG1Zb2PwoSl6ZCX8Yrh+isB4kZCErgwIM9kDmhEmcfr9eAKlm6saKW9g6DDl7GpV4i
 ZSOGZi2k3LxyfhVWg1LZ8nrNbjSqYxzEg9DkRArtIfeqXDUUIUxgZSiGMUFYpvSUyt
 N4KAM+OLfp8736eK6ZLkE540xGh+g5jLNVZRPLQ45c7pXkZ6rO3c8ldkssh2898lih
 lMcILIdXvdVRY/4/QMFv6Ci7SgV+SpbvUku4VYZWpuX0TaZa2zaWXia+eRyjbV0bVr
 8Zo+PZg/w6ueg==
Date: Fri, 19 Jan 2024 11:48:15 -0600
From: Rob Herring <robh@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 02/11] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20240119174815.GA633343-robh@kernel.org>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-3-afd@ti.com>
 <e2fce141-4966-4e70-9a5c-865a2737174c@linaro.org>
 <20240110083857.GB5185@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110083857.GB5185@atomide.com>
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
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 10:38:57AM +0200, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [240109 19:53]:
> > On 09/01/2024 18:19, Andrew Davis wrote:
> > > The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> > > multiple vendors. Describe how the SGX GPU is integrated in these SoC,
> > > including register space and interrupts. Clocks, reset, and power domain
> > > information is SoC specific.
> > > 
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > 
> > 
> > > +  clock-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: core
> > > +      - const: mem
> > > +      - const: sys
> > 
> > There are no devices currently using third clock, but I assume it is
> > expected or possible.
> 
> I think the third clock is typically merged with one of the two clocks but
> yeah possibly it's a separate clocke in some cases.
> 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Looks good to me too.
> 
> So for merging these, as many of the changes touch the omap variants, I
> could set up an immutable branch with all the changes after -rc1. Or I can
> ack the patches too if somebody has better ideas.

Just take all but patches 10 and 11. I don't think it matters if the 
binding is there for them as long as it is all there in next. No one is 
paying that close attention to the warnings I think.

Rob
