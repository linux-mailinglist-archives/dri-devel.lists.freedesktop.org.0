Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122DE27D1F6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 16:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381089C19;
	Tue, 29 Sep 2020 14:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDB389C19
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:55:56 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC1582075E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601391355;
 bh=rRoIRoEtvKiTxqLBDCdJgd1vsV6WDXH8vqiw37EJFYA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FE9AEeNXy7o/PzYj2Sr7BFJsRCzd8CwoyY7UaihWIiSDxdmKDtGd4egkJa3j5Pc5/
 AbY6Jjfr0HGE3IFZS+e5Uju6UdrAIm7dZsmXea4sASgxyFcWRfxlGh88sBOBGd1VwO
 +Q1SM1BJMdFD3wyai6xv3TDjthcw0OcOWDfjcMb0=
Received: by mail-oi1-f169.google.com with SMTP id 185so5736401oie.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:55:55 -0700 (PDT)
X-Gm-Message-State: AOAM532ojLc1QzeRxbtql6GAfshpvi/NF7zBmFAKCjRBr2LgKw/QLGvk
 DonBBJPmx1fJSHnwxAA4eJaCltLWRUxcGQLApQ==
X-Google-Smtp-Source: ABdhPJyUldfh8e5nBb7FCRtHZXShFRNUVuLZZfubdhoGCMHltLk6gRwvdq1tHkbGaKdvxwT4Kr+Mf9uzd0Eu9PdR/KQ=
X-Received: by 2002:aca:fc07:: with SMTP id a7mr2845041oii.106.1601391354877; 
 Tue, 29 Sep 2020 07:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200928155953.2819930-1-robh@kernel.org>
 <68d57be8-c2e9-4bfd-4f7f-041aa3ce2e92@xilinx.com>
In-Reply-To: <68d57be8-c2e9-4bfd-4f7f-041aa3ce2e92@xilinx.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2020 09:55:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6z5zarTv4e1aWCi0rVoyoDOvZYpYLEuxMJF5a1i7yHQ@mail.gmail.com>
Message-ID: <CAL_JsqL6z5zarTv4e1aWCi0rVoyoDOvZYpYLEuxMJF5a1i7yHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix 'reg' size issues in zynqmp examples
To: Michal Simek <michal.simek@xilinx.com>
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
Cc: devicetree@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 1:55 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Hi Rob,
>
> On 28. 09. 20 17:59, Rob Herring wrote:
> > The default sizes in examples for 'reg' are 1 cell each. Fix the
> > incorrect sizes in zynqmp examples:
> >
> > Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.example.dt.yaml: example-0: dma-controller@fd4c0000:reg:0: [0, 4249616384, 0, 4096] is too long
> >       From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> > Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:0: [0, 4249485312, 0, 4096] is too long
> >       From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> > Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:1: [0, 4249526272, 0, 4096] is too long
> >       From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> > Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:2: [0, 4249530368, 0, 4096] is too long
> >       From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> > Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:3: [0, 4249534464, 0, 4096] is too long
> >       From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> >
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: dmaengine@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml          | 8 ++++----
> >  .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > index 52a939cade3b..7b9d468c3e52 100644
> > --- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > @@ -145,10 +145,10 @@ examples:
> >
> >      display@fd4a0000 {
> >          compatible = "xlnx,zynqmp-dpsub-1.7";
> > -        reg = <0x0 0xfd4a0000 0x0 0x1000>,
> > -              <0x0 0xfd4aa000 0x0 0x1000>,
> > -              <0x0 0xfd4ab000 0x0 0x1000>,
> > -              <0x0 0xfd4ac000 0x0 0x1000>;
> > +        reg = <0xfd4a0000 0x1000>,
> > +              <0xfd4aa000 0x1000>,
> > +              <0xfd4ab000 0x1000>,
> > +              <0xfd4ac000 0x1000>;
> >          reg-names = "dp", "blend", "av_buf", "aud";
> >          interrupts = <0 119 4>;
> >          interrupt-parent = <&gic>;
> > diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> > index 5de510f8c88c..2a595b18ff6c 100644
> > --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> > @@ -57,7 +57,7 @@ examples:
> >
> >      dma: dma-controller@fd4c0000 {
> >        compatible = "xlnx,zynqmp-dpdma";
> > -      reg = <0x0 0xfd4c0000 0x0 0x1000>;
> > +      reg = <0xfd4c0000 0x1000>;
> >        interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> >        interrupt-parent = <&gic>;
> >        clocks = <&dpdma_clk>;
> >
>
> I would prefer to keep 64bit version.
> I use this style.

I prefer to keep the examples simple. The address size is outside the
scope of the binding.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
