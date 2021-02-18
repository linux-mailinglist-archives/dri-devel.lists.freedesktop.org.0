Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6031EC69
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE906E848;
	Thu, 18 Feb 2021 16:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0186E848
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 16:45:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BBB164ED6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613666715;
 bh=jDSsxhHhJQLjYvRcW7R89rFyId6lOBeirV5E6VbIGXw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qdtn2vnXIAtkwB8ZWBGCgpSoRGr9T7059zLwBcRgY85RV2BfoDH1+QpiwKrBzu52p
 h0xYt3P5XWUSR1jMZeL3rHhrdct6AnpNMefjllybFvm8SGlXXTvrfd5N6REnsTUBZ+
 13FJbrn/y/mPiEdJJtPop2/k23pzofmlJ9BN07n+ZKWcSY4peJP9LkxulPG8E+LIZx
 F0IQZYvxjtX6s9d4VFqcvux4lH7q0ShWoqWssrtzoOj2LyUmV3nXM9yTTAxDCVNy0v
 C3gB2c5WEii1+tqqC+PLvVgMUVImN6wgxWS+oxU8UkMlxLqxz9FVyJfu43agR51x0L
 M4It0EobXBYvw==
Received: by mail-ed1-f42.google.com with SMTP id c6so5261727ede.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 08:45:15 -0800 (PST)
X-Gm-Message-State: AOAM532tDOPztCGPTsIgdQ56wf+a1XWF6Gsi8oRA0HfeYPOJLW62uXeI
 ng418fPYLqzb7PMRxGQKoO5/Z3koZ8afNsH99g==
X-Google-Smtp-Source: ABdhPJzcR7G8p/C+KLX15Pa4+7UbxRXGkJr8RrCBFGB5NAS+BPryBN+SzFQLQGBlF82UdD7UBNzMWizKS/iLFZ2s82I=
X-Received: by 2002:aa7:cd51:: with SMTP id v17mr5100382edw.194.1613666713964; 
 Thu, 18 Feb 2021 08:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <20210213101512.3275069-2-mperttunen@nvidia.com>
 <20210217214935.GA2804400@robh.at.kernel.org>
 <9f0152cc-ca9a-5b45-df5d-e61a79c87ea4@kapsi.fi>
In-Reply-To: <9f0152cc-ca9a-5b45-df5d-e61a79c87ea4@kapsi.fi>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Feb 2021 10:45:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKpUChquFh9zz0Ec8eTeL6KdGAY+eJyW3wTBDm06w13-A@mail.gmail.com>
Message-ID: <CAL_JsqKpUChquFh9zz0Ec8eTeL6KdGAY+eJyW3wTBDm06w13-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
To: Mikko Perttunen <cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 5:04 AM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> On 2/17/21 11:49 PM, Rob Herring wrote:
> > On Sat, Feb 13, 2021 at 12:15:10PM +0200, Mikko Perttunen wrote:
> >> Convert the original Host1x bindings to YAML and add new bindings for
> >> NVDEC, now in a more appropriate location. The old text bindings
> >> for Host1x and engines are still kept at display/tegra/ since they
> >> encompass a lot more engines that haven't been converted over yet.
> >>
> >> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> >> ---
> >>   .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
> >>   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
> >>   MAINTAINERS                                   |   1 +
> >>   3 files changed, 220 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> >> new file mode 100644
> >> index 000000000000..613c6601f0f1
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> >> @@ -0,0 +1,129 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra20-host1x.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Device tree binding for NVIDIA Host1x
> >> +
> >> +maintainers:
> >> +  - Thierry Reding <treding@gmail.com>
> >> +  - Mikko Perttunen <mperttunen@nvidia.com>
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    pattern: "^host1x@[0-9a-f]*$"
> >> +
> >> +  compatible:
> >> +    oneOf:
> >> +      - const: nvidia,tegra20-host1x
> >> +      - const: nvidia,tegra30-host1x
> >> +      - const: nvidia,tegra114-host1x
> >> +      - const: nvidia,tegra124-host1x
> >> +      - items:
> >> +          - const: nvidia,tegra132-host1x
> >> +          - const: nvidia,tegra124-host1x
> >> +      - const: nvidia,tegra210-host1x
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    items:
> >> +      - description: Syncpoint threshold interrupt
> >> +      - description: General interrupt
> >> +
> >> +  interrupt-names:
> >> +    items:
> >> +      - const: syncpt
> >> +      - const: host1x
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: host1x
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  reset-names:
> >> +    items:
> >> +      - const: host1x
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +
> >> +  interconnects:
> >> +    maxItems: 1
> >> +
> >> +  interconnect-names:
> >> +    items:
> >> +      - const: dma-mem
> >> +
> >> +  '#address-cells':
> >> +    const: 1
> >> +
> >> +  '#size-cells':
> >> +    const: 1
> >> +
> >> +  ranges: true
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - interrupt-names
> >> +  - clocks
> >> +  - clock-names
> >> +  - resets
> >> +  - reset-names
> >> +  - '#address-cells'
> >> +  - '#size-cells'
> >> +  - ranges
> >> +
> >> +additionalProperties:
> >> +  type: object
> >> +
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        anyOf:
> >> +          - const: nvidia,tegra186-host1x
> >> +          - const: nvidia,tegra194-host1x
> >
> > Just use 'enum' instead of 'anyOf' and 'const'.
>
> Yep, will fix.
>
> >
> >> +then:
> >> +  properties:
> >> +    reg:
> >> +      items:
> >> +        - description: Hypervisor-accessible register area
> >> +        - description: VM-accessible register area
> >
> > If you test this, it will fail due to the 'maxItems: 1' above. The main
> > section has to pass for all conditions and then if/them schema add
> > constraints.
>
> Interesting, I did run the schema check and DTB check but I didn't see
> issues there. In any case, will fix.

It may pass if you had 'reg = <base1 size1 base2 size2>' rather than
'reg = <base1 size1>, <base2 size2>'. While the bracketing doesn't
matter for dtbs, it does currently for the schema.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
