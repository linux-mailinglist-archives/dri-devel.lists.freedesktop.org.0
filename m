Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15449B31AB6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C2B10E12D;
	Fri, 22 Aug 2025 14:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hmb7VwXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CFE10E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:06:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 93DFD44B9B;
 Fri, 22 Aug 2025 14:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DA6C4CEED;
 Fri, 22 Aug 2025 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755871562;
 bh=Ku6m0SqEEMBqWM59nurSigUjLIp8pNkfpPu9KePkEV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hmb7VwXTw40W8ge+1DeTuLEgBD8x3r3p6Cdb1nPkcJ+aDHcquzJIJXzdMMghS4ftK
 9kgkBWSHmLKqXTnhGVtb/aII0is6Su5Z8NkSVUiN5bWFdKEu6ka5w6Ntdw8uDQ3kx6
 xfdDLyEENVkjYY3JP/uRMjdszBHeyYu8DKccAYmiHEygNKjNZ1253v/CviYFiXoBZ4
 1yTQN/4pY/pv9Nbs/qbsHBab9Ev+TzrsD8HvBvl8wFNiBkq3B9Hh19cP3m4ua6RrYQ
 LyvY49ToEsQTinnyI14SdYrUxZ8VVgXrxJ8Bw2WVKAxog1ZogsTRdaXQlSMzzQNhpD
 zXXX8D7yRFehA==
Date: Fri, 22 Aug 2025 09:06:01 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20250822140601.GA3496760-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-18-clamor95@gmail.com>
 <20250819203007.GA1266319-robh@kernel.org>
 <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 20, 2025 at 08:39:36AM +0300, Svyatoslav Ryhel wrote:
> вт, 19 серп. 2025 р. о 23:30 Rob Herring <robh@kernel.org> пише:
> >
> > On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> > > Document CSI hw block found in Tegra20 and Tegra30 SoC.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
> > >  1 file changed, 63 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > index fa07a40d1004..a5669447a33b 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > @@ -16,30 +16,78 @@ properties:
> > >
> > >    compatible:
> > >      enum:
> > > +      - nvidia,tegra20-csi
> > > +      - nvidia,tegra30-csi
> > >        - nvidia,tegra210-csi
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > > -  clocks:
> > > -    items:
> > > -      - description: module clock
> > > -      - description: A/B lanes clock
> > > -      - description: C/D lanes clock
> > > -      - description: E lane clock
> > > -      - description: test pattern generator clock
> > > -
> > > -  clock-names:
> > > -    items:
> > > -      - const: csi
> > > -      - const: cilab
> > > -      - const: cilcd
> > > -      - const: cile
> > > -      - const: csi_tpg
> > > +  clocks: true
> > > +  clock-names: true
> > >
> > >    power-domains:
> > >      maxItems: 1
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra20-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra30-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +            - description: PAD A clock
> > > +            - description: PAD B clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +            - const: csia_pad
> > > +            - const: csib_pad
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra210-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +            - description: A/B lanes clock
> > > +            - description: C/D lanes clock
> > > +            - description: E lane clock
> > > +            - description: test pattern generator clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +            - const: cilab
> > > +            - const: cilcd
> > > +            - const: cile
> > > +            - const: csi_tpg
> > > +
> >
> > This is longer that what's the same. I think this should be a separate
> > schema doc.
> >
> 
> CSI hw block configuration is similar between generations, the main
> difference is the amount of clocks routed. Not sure if it is worth it
> to create duplicates with sole difference in number of clocks used.

If the clock names were at least the same I might agree, but the only 
common one is 'csi'. How similar the h/w is doesn't matter, how similar 
the binding is is what matters.

Rob
