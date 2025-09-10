Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EDAB50AE6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6310E824;
	Wed, 10 Sep 2025 02:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aUtcd9a5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EA110E824
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:13:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 405C660195;
 Wed, 10 Sep 2025 02:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE929C4CEF4;
 Wed, 10 Sep 2025 02:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757470413;
 bh=Q3rmZLXX3SIGu/Pup57T8RwwkJTVjjAk7jOAL3jEL20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUtcd9a5ISSFiCbzvGVXizCsC7nCkVgqvXE7UB3SlXM2vp56AxVqHhPFQG9iZnNIx
 tGjUcRmJWcrfCetRGe+rjavrpvk1plVgOBwtiWHa3UddcwNaJyyGy13sNQa5XoDyvd
 4mEPsQaeftQBel2Fe6Q4zJWD6lrNL3KKBym1fNygnbj8mg5De+8Mmj/FfA0Q9+Fa6l
 5BjkDEVmKnZ67h1IX/6eBI86CGS270r6G5gjtqEHHVbNaN89KeuvdB5C/DvxKLUaRt
 qqs7ffj8qSVOklihhYyUrPPE3cTH4ZQ5P2W7Yyi8e6AvlIY1pjCzm/KYZNPL5igqMl
 bitRNKicLQhEQ==
Date: Tue, 9 Sep 2025 21:13:32 -0500
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
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20250910021332.GA3634809-robh@kernel.org>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-22-clamor95@gmail.com>
 <20250909162600.GA3311232-robh@kernel.org>
 <CAPVz0n2Hafvnk4BBXfhWLWCfTg336DLOr=xN9vKBGc2xEWYrMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2Hafvnk4BBXfhWLWCfTg336DLOr=xN9vKBGc2xEWYrMw@mail.gmail.com>
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

On Tue, Sep 09, 2025 at 07:39:02PM +0300, Svyatoslav Ryhel wrote:
> вт, 9 вер. 2025 р. о 19:26 Rob Herring <robh@kernel.org> пише:
> >
> > On Sat, Sep 06, 2025 at 04:53:42PM +0300, Svyatoslav Ryhel wrote:
> > > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
> > >  .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
> > >  2 files changed, 219 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> > > new file mode 100644
> > > index 000000000000..1a2858a5893c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> > > @@ -0,0 +1,104 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NVIDIA Tegra20 CSI controller
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nvidia,tegra20-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  avdd-dsi-csi-supply:
> > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  "#nvidia,mipi-calibrate-cells":
> > > +    description: The number of cells in a MIPI calibration specifier.
> > > +      Should be 1. The single cell specifies an id of the pads that
> > > +      need to be calibrated for a given device.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    const: 1
> >
> > This property goes in the provider. Is the parent node the provider? You
> > don't really need any of it if it's all one block.
> >
> 
> Yes parent node is provides and channel is one of receivers, other one
> is DSI node.

Please make that clear in the descriptions somewhere.

> 
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^channel@[0-1]$":
> > > +    type: object
> > > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        maxItems: 1
> >
> > Instead:
> >
> > maximum: 1
> >
> >
> > > +
> > > +      nvidia,mipi-calibrate:
> > > +        description: Should contain a phandle and a specifier specifying
> > > +          which pads are used by this DSI output and need to be
> > > +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> >
> > Is DSI applicable here?
> >
> 
> It is because CSI is calibration provider. I can move it up into
> #nvidia,mipi-calibrate-cells which may be more appropriate place.

Yes, as the provider defines the meaning of the cells (and they are 
opaque to the consumer).

Rob
