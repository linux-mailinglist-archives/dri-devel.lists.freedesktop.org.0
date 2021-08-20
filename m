Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5823F32AC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 20:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360EE6EAD9;
	Fri, 20 Aug 2021 18:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E1A6EAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 18:00:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A8661053
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629482424;
 bh=7Gz9SPlKF29yEU4rLc/GG+EOsYXfql5Aal+QHu7Igeg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EtFgiWU+6MGqYRLOKfw+RiUarIrY/PJqiMrh+deLKE77fW/zpg1MGAGFD8k9r0nSo
 e9FeT5tqPAStOZgRv9b9+uB9DXxg54ju0wERgV1fNPGoG9HxBk+4+Gf9APSlkf5/4/
 uvbgdDZG6HfnubkXvizXI8Ri4sM8K6QLqqBUIW2/73i+F5NWWQjWRrxWegrxGn1cxj
 SPT+IeuW0fN68+W/m4kFyqyNVnAcbFURAV/wG6bj3wpdmGQ26Li/dqV1mqMOs5rYIw
 nKBOZWPCIgLCkoiQmT9JvFbkb2c2Dr8QaBEiFLmS31dd065RMRQzYtJZj0y1lJDsiD
 wNx971BbiKPcw==
Received: by mail-ej1-f54.google.com with SMTP id mf2so3276967ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 11:00:24 -0700 (PDT)
X-Gm-Message-State: AOAM532ZCJIevGLozbUD8bd847eE4XYCZOy4xe1WvMg8dld2sSSnOPZ9
 Fey7rQfHo+vvId1bACDejxXMv1OC2X+W798D9w==
X-Google-Smtp-Source: ABdhPJzCg01o0GVcbKggUJdrRxr7LQdQj/GR9SqTyTz2LtrjjgVYqF5ahged+VRhyA3Apm+R6NJsgM1nWobV9pBgjG4=
X-Received: by 2002:a17:906:558d:: with SMTP id
 y13mr21682439ejp.130.1629482423396; 
 Fri, 20 Aug 2021 11:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
 <20210811105030.3458521-2-mperttunen@nvidia.com>
 <YRwoKW4nOc52MAQV@robh.at.kernel.org>
 <1dfd5173-5654-9df8-1e8e-d0e365ed914d@kapsi.fi>
 <YR0InKtLCO1ohcHW@orome.fritz.box>
In-Reply-To: <YR0InKtLCO1ohcHW@orome.fritz.box>
From: Rob Herring <robh@kernel.org>
Date: Fri, 20 Aug 2021 13:00:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6i4T7cZCDpo3r6JQ_dBBHNHGiXFHm_EBwudtAD7qSsg@mail.gmail.com>
Message-ID: <CAL_JsqJ6i4T7cZCDpo3r6JQ_dBBHNHGiXFHm_EBwudtAD7qSsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add YAML bindings for NVDEC
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jon Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Aug 18, 2021 at 8:18 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Aug 18, 2021 at 11:24:28AM +0300, Mikko Perttunen wrote:
> > On 8/18/21 12:20 AM, Rob Herring wrote:
> > > On Wed, Aug 11, 2021 at 01:50:28PM +0300, Mikko Perttunen wrote:
> > > > Add YAML device tree bindings for NVDEC, now in a more appropriate
> > > > place compared to the old textual Host1x bindings.
> > > >
> > > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > > ---
> > > > v3:
> > > > * Drop host1x bindings
> > > > * Change read2 to read-1 in interconnect names
> > > > v2:
> > > > * Fix issues pointed out in v1
> > > > * Add T194 nvidia,instance property
> > > > ---
> > > >   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
> > > >   MAINTAINERS                                   |   1 +
> > > >   2 files changed, 110 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > > new file mode 100644
> > > > index 000000000000..571849625da8
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > > @@ -0,0 +1,109 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > +
> > > > +title: Device tree binding for NVIDIA Tegra NVDEC
> > > > +
> > > > +description: |
> > > > +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> > > > +  and newer chips. It is located on the Host1x bus and typically
> > > > +  programmed through Host1x channels.
> > > > +
> > > > +maintainers:
> > > > +  - Thierry Reding <treding@gmail.com>
> > > > +  - Mikko Perttunen <mperttunen@nvidia.com>
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^nvdec@[0-9a-f]*$"
> > > > +
> > > > +  compatible:
> > > > +    enum:
> > > > +      - nvidia,tegra210-nvdec
> > > > +      - nvidia,tegra186-nvdec
> > > > +      - nvidia,tegra194-nvdec
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: nvdec
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: nvdec
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  iommus:
> > > > +    maxItems: 1
> > > > +
> > > > +  interconnects:
> > > > +    items:
> > > > +      - description: DMA read memory client
> > > > +      - description: DMA read 2 memory client
> > > > +      - description: DMA write memory client
> > > > +
> > > > +  interconnect-names:
> > > > +    items:
> > > > +      - const: dma-mem
> > > > +      - const: read-1
> > > > +      - const: write
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - resets
> > > > +  - reset-names
> > > > +  - power-domains
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        const: nvidia,tegra194-host1x
> > >
> > > host1x? This will never be true as the schema is only applied to nodes
> > > with the nvdec compatible.
> >
> > Argh, it's a typo indeed. Should be nvidia,tegra194-nvdec.
> >
> > >
> > > > +then:
> > > > +  properties:
> > > > +    nvidia,instance:
> > > > +      items:
> > > > +        - description: 0 for NVDEC0, or 1 for NVDEC1
> > >
> > > What's this for? We generally don't do indices in DT.
> >
> > When programming the hardware through Host1x, we need to know the "class ID"
> > of the hardware, specific to each instance. So we need to know which
> > instance it is. Technically of course we could derive this from the MMIO
> > address but that seems more confusing.
> >
> > >
> > > > +
> > > > +additionalProperties: true
> > >
> > > This should be false or 'unevaluatedProperties: false'
> >
> > I tried that but it resulted in validation failures; please see the
> > discussion in v2.
>
> Rob mentioned that there is now support for unevaluatedProperties in
> dt-schema. I was able to test this, though with only limited success. I
> made the following changes on top of this patch:

Here's a branch that works with current jsonschema master:

https://github.com/robherring/dt-schema/tree/draft2020-12

> --- >8 ---
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> index d2681c98db7e..0bdf05fc8fc7 100644
> --- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -73,14 +73,18 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: nvidia,tegra194-host1x
> +        const: nvidia,tegra194-nvdec
>  then:
>    properties:
>      nvidia,instance:
> +      $ref: /schemas/types.yaml#/definitions/uint32
>        items:
>          - description: 0 for NVDEC0, or 1 for NVDEC1
>
> -additionalProperties: true
> +  required:
> +    - nvidia,instance
> +
> +unevaluatedProperties: false
>
>  examples:
>    - |
> @@ -105,3 +109,28 @@ examples:
>              interconnect-names = "dma-mem", "read-1", "write";
>              iommus = <&smmu TEGRA186_SID_NVDEC>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra194-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra194-mc.h>
> +    #include <dt-bindings/power/tegra194-powergate.h>
> +    #include <dt-bindings/reset/tegra194-reset.h>
> +
> +    nvdec@15480000 {
> +            compatible = "nvidia,tegra194-nvdec";
> +            reg = <0x15480000 0x40000>;
> +            clocks = <&bpmp TEGRA194_CLK_NVDEC>;
> +            clock-names = "nvdec";
> +            resets = <&bpmp TEGRA194_RESET_NVDEC>;
> +            reset-names = "nvdec";
> +
> +            nvidia,instance = <0>;
> +
> +            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECA>;
> +            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD1 &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDECSWR &emc>;
> +            interconnect-names = "dma-mem", "read-1", "write";
> +            iommus = <&smmu TEGRA194_SID_NVDEC>;
> +    };
> --- >8 ---
>
> As I said, this only works partially. One thing I have to do is comment
> out the whole "if:" block in meta-schemas/base.yaml in order to get rid
> of this error:
>
>         Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml: 'additionalProperties' is a required property
>         hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
>         from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>
> which basically makes the whole file invalid. The reason seems to be
> that dt-schema will only allow unevaluatedProperties if there are any
> $ref references in the schema. Although I'm not sure I understand how
> exactly that works because I tried to inject a dummy $ref but that
> didn't fix the above error.

I think we'll end up relaxing this with 'unevaluatedProperties'
supported. Primarily for just this case with a conditionally defined
property.

> Once that's worked around, though, I do get the examples to validate
> with just a small caveat: nvidia,instance is recognized as being
> required in the Tegra194 case (if I remove it from the example, I do get
> an error, as expected), but if I add nvidia,instance to the Tegra186
> example, it doesn't actually produce an error and will just accept it as
> valid, even though the compatible is not nvidia,tegra194-nvdec.
>
> I don't have time at the moment to investigate why that is, but just
> thought I'd report this here in the meantime. Perhaps it's already a
> known issue?
>
> We could potentially side-step this by getting rid of the custom
> nvidia,instance property altogether. Unfortunately of_device_id table
> matching only supports matching by name, but not by unit-address, which
> would've been nice in this case. Matching by base address manually is a
> bit suboptimal, but it's not that bad.
>
> In any case, there are other examples I know of which need this type of
> functionality (a bunch of devices where the number and names of power
> supplies change from one generation to another), so this problem isn't
> going entirely away anyway.

That's pretty common (though I think we get more variation than we
should), but why would you need the instance or base address for this?

Rob
