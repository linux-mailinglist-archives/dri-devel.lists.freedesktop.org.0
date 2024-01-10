Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A39382954A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 09:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933810E724;
	Wed, 10 Jan 2024 08:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4730910E724
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 08:39:57 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 081BB6050F;
 Wed, 10 Jan 2024 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1704875996;
 bh=wG6D9r+AI35mwEbnFd6ymRyQAT79Vq6rM5ctoGLtHBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lI0HjohHY5ZqItxAs8wT161JVYpJtAgnjXEDs+XAyJc9k4uwAIKZILCoxniGxeHM7
 NMpL2XdZBWs7+S3w/NZWsNimkeJR16R95GGWUpKizv2Adtqb7FXYWlzxwi2V8+nFoP
 RTiflB6mFHXKPGPj2+TZa7Ttqzte47OVO5wCtpk/a3jM3EtOWoczIwawN0tSH8TgEZ
 p+8904d/1MpIM6uukmZIHlwKjUrgcv3Hn6jYHHrOMm5heZJAuYWXVcNuvp1ITYC3H5
 5YZX2Q1DTS1LnZJLB3LqYmb7VI5cGaZX5FqpnZ+7cjS6IsYI7KpDEbaMmJIcktwVcV
 lgNioh8C/jw9w==
Date: Wed, 10 Jan 2024 10:38:57 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/11] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20240110083857.GB5185@atomide.com>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-3-afd@ti.com>
 <e2fce141-4966-4e70-9a5c-865a2737174c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2fce141-4966-4e70-9a5c-865a2737174c@linaro.org>
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
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Davis <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [240109 19:53]:
> On 09/01/2024 18:19, Andrew Davis wrote:
> > The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> > multiple vendors. Describe how the SGX GPU is integrated in these SoC,
> > including register space and interrupts. Clocks, reset, and power domain
> > information is SoC specific.
> > 
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> 
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: core
> > +      - const: mem
> > +      - const: sys
> 
> There are no devices currently using third clock, but I assume it is
> expected or possible.

I think the third clock is typically merged with one of the two clocks but
yeah possibly it's a separate clocke in some cases.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good to me too.

So for merging these, as many of the changes touch the omap variants, I
could set up an immutable branch with all the changes after -rc1. Or I can
ack the patches too if somebody has better ideas.

Regards,

Tony
