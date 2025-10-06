Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91446BBF309
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3100F10E463;
	Mon,  6 Oct 2025 20:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jl/uolcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA7B10E463
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 20:31:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E48BE43DF0;
 Mon,  6 Oct 2025 20:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901EEC4CEF5;
 Mon,  6 Oct 2025 20:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759782709;
 bh=TlXHhMMgPTT/CKQuw+PRtgSXuw4hONNTSte45Q6CtDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jl/uolcwE8I788cHiBxoYwA1rpA2krrryILkEMUHy/ze/mxH9gdgxoFo9kQSY5bFz
 R5uH1VEClD37gc3mOORe+iwwQZAPhDyLnoDJ2V0jEG7owlCEMY3CwBa3D5Fr3kQ/Qn
 R+zzAFpshEF3aUoGJudHyfQQrXenGycAmUfYXIWPIicwuJdUH8s3OTkyqkwfYAtQiw
 5dTwNAPEgq3chztZJOyBiHPyoG3aJB5PN4kBxFaprkiHU3RFESC8TAdUczCPNQmTMA
 ROVbx5xw1EVO+pLKH+PJ7++IfWmv0eopWZT3UVxdKeMG7wYXA349SQE6Q/snHQHv96
 JeV21kd75K3Pg==
Date: Mon, 6 Oct 2025 15:31:48 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20251006203148.GA523657-robh@kernel.org>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-21-clamor95@gmail.com>
 <20251002015244.GA2836647-robh@kernel.org>
 <CAPVz0n1By+akzp0t+GfF9nRzZ27NwYEikXxQ+=M=W2NEGpLNFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1By+akzp0t+GfF9nRzZ27NwYEikXxQ+=M=W2NEGpLNFw@mail.gmail.com>
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

On Thu, Oct 02, 2025 at 08:14:22AM +0300, Svyatoslav Ryhel wrote:
> чт, 2 жовт. 2025 р. о 04:52 Rob Herring <robh@kernel.org> пише:
> >
> > On Thu, Sep 25, 2025 at 06:16:46PM +0300, Svyatoslav Ryhel wrote:
> > > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
> > >  1 file changed, 135 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> > > new file mode 100644
> > > index 000000000000..817b3097846b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> > > @@ -0,0 +1,135 @@
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
> > > +      - nvidia,tegra30-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks: true
> > > +  clock-names: true
> > > +
> > > +  avdd-dsi-csi-supply:
> > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  "#nvidia,mipi-calibrate-cells":
> > > +    description:
> > > +      The number of cells in a MIPI calibration specifier. Should be 1.
> > > +      The single cell specifies an id of the pad that need to be
> > > +      calibrated for a given device. Valid pad ids for receiver would be
> > > +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    const: 1
> >
> > Sorry I didn't bring this up before, but is this ever not 1? If it is
> > fixed, then you don't really need the property. I prefer it just be
> > fixed rather than getting a bunch of vendor specific #foo-cells.
> >
> 
> This is not an introduction of property, such property already exists
> in Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
> and is used in multiple device trees. As I have told before, in case
> of Tegra30 and Tegra20 CSI block combines mipi calibration function
> and CSI function, in Tegra114+ mipi calibration got a dedicated
> hardware block which is already supported. This property here is used
> to align with mipi-calibration logic used by Tegra114+

Okay.

You will have to continue to tell me again if my past questions are not 
addressed in the commit message. A review only last week was 100+ 
patches ago. Don't expect I'll remember nor go re-read prior versions. 

Ideally, we don't define the type of a property more than once. So this 
should really first be moved to its own shared schema that's referenced 
here and in the original user. Then it is perfectly clear reading the 
patches that this is not a new property.

Rob
