Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140C14C29C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 23:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F139F6E145;
	Tue, 28 Jan 2020 22:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7016A6E145;
 Tue, 28 Jan 2020 22:08:23 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 331BC24687;
 Tue, 28 Jan 2020 22:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580249302;
 bh=JdEuxZDf0ro4RVyPSlg7zqseX/OLqyvKgF4b95e8xXc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X/kGzDM2APsiXpo++m8tCdryIif7Y2FCZ+vlOp6GFLfpCxlI6DHlYoDbwHPCOXjk3
 cV9yij5aPKwxYJd29Bv8ZAKlT/6veUYoOdk/W40BJrqZrFMXYgwXHLaM+iMEXQFolC
 kRpfqwnPejmrObLrsstm3kpn9BDTlS1S8+1mOvjo=
Received: by mail-qt1-f173.google.com with SMTP id t8so6125047qtr.2;
 Tue, 28 Jan 2020 14:08:22 -0800 (PST)
X-Gm-Message-State: APjAAAWFwzZOxI/vRilsSUhARx6FDdjm8BEHWi4L6OIxyD6+lXRnGAr/
 6N0L90SvpQiY+9QcQGd08aCJvH7GGOLd3oP4jQ==
X-Google-Smtp-Source: APXvYqwmWfwn77Hr3BX7qUfKz9G+Ld17fXrROOoEL/Gl0LFF5YNA/xHd0pf7rebUiGWGkqAZMRQtUuGEnSiq5u2YVDY=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr24048013qtj.300.1580249301182; 
 Tue, 28 Jan 2020 14:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20200128082013.15951-1-benjamin.gaignard@st.com>
 <20200128120600.oagnindklixjyieo@gilmour.lan>
 <a7fa1b43-a188-9d06-73ec-16bcd4012207@st.com>
 <CAL_JsqJ80kSU7bHJt0_SeX5FVfxxjN5-ZKxt+tOfGy2cV62cbQ@mail.gmail.com>
 <676d7e79-c129-c13c-b804-25d41afdbef9@st.com>
In-Reply-To: <676d7e79-c129-c13c-b804-25d41afdbef9@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Jan 2020 16:08:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rozrRb1embptEQrtpaxP5u9v8hH-WAfCrUZHXt7WYXQ@mail.gmail.com>
Message-ID: <CAL_Jsq+rozrRb1embptEQrtpaxP5u9v8hH-WAfCrUZHXt7WYXQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Convert etnaviv to json-schema
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 1:58 PM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
> On 1/28/20 8:35 PM, Rob Herring wrote:
> > On Tue, Jan 28, 2020 at 6:31 AM Benjamin GAIGNARD
> > <benjamin.gaignard@st.com> wrote:
> >>
> >> On 1/28/20 1:06 PM, Maxime Ripard wrote:
> >>> Hi Benjamin,
> >>>
> >>> On Tue, Jan 28, 2020 at 09:20:13AM +0100, Benjamin Gaignard wrote:
> >>>> Convert etnaviv bindings to yaml format.
> >>>>
> >>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >>>> ---
> >>>>    .../bindings/display/etnaviv/etnaviv-drm.txt       | 36 -----------
> >>>>    .../devicetree/bindings/gpu/vivante,gc.yaml        | 72 ++++++++++++++++++++++
> >>>>    2 files changed, 72 insertions(+), 36 deletions(-)
> >>>>    delete mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> >>>>    create mode 100644 Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> >>>> deleted file mode 100644
> >>>> index 8def11b16a24..000000000000
> >>>> --- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> >>>> +++ /dev/null
> >>>> @@ -1,36 +0,0 @@
> >>>> -Vivante GPU core devices
> >>>> -========================
> >>>> -
> >>>> -Required properties:
> >>>> -- compatible: Should be "vivante,gc"
> >>>> -  A more specific compatible is not needed, as the cores contain chip
> >>>> -  identification registers at fixed locations, which provide all the
> >>>> -  necessary information to the driver.
> >>>> -- reg: should be register base and length as documented in the
> >>>> -  datasheet
> >>>> -- interrupts: Should contain the cores interrupt line
> >>>> -- clocks: should contain one clock for entry in clock-names
> >>>> -  see Documentation/devicetree/bindings/clock/clock-bindings.txt
> >>>> -- clock-names:
> >>>> -   - "bus":    AXI/master interface clock
> >>>> -   - "reg":    AHB/slave interface clock
> >>>> -               (only required if GPU can gate slave interface independently)
> >>>> -   - "core":   GPU core clock
> >>>> -   - "shader": Shader clock (only required if GPU has feature PIPE_3D)
> >>>> -
> >>>> -Optional properties:
> >>>> -- power-domains: a power domain consumer specifier according to
> >>>> -  Documentation/devicetree/bindings/power/power_domain.txt
> >>>> -
> >>>> -example:
> >>>> -
> >>>> -gpu_3d: gpu@130000 {
> >>>> -    compatible = "vivante,gc";
> >>>> -    reg = <0x00130000 0x4000>;
> >>>> -    interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
> >>>> -    clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
> >>>> -             <&clks IMX6QDL_CLK_GPU3D_CORE>,
> >>>> -             <&clks IMX6QDL_CLK_GPU3D_SHADER>;
> >>>> -    clock-names = "bus", "core", "shader";
> >>>> -    power-domains = <&gpc 1>;
> >>>> -};
> >>>> diff --git a/Documentation/devicetree/bindings/gpu/vivante,gc.yaml b/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..c4f549c0d750
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> >>>> @@ -0,0 +1,72 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Vivante GPU Bindings
> >>>> +
> >>>> +description: Vivante GPU core devices
> >>>> +
> >>>> +maintainers:
> >>>> +  -  Lucas Stach <l.stach@pengutronix.de>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: vivante,gc
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    items:
> >>>> +      - description: AXI/master interface clock
> >>>> +      - description: GPU core clock
> >>>> +      - description: Shader clock (only required if GPU has feature PIPE_3D)
> >>>> +      - description: AHB/slave interface clock (only required if GPU can gate slave interface independently)
> >>> Can you have an AHB slave interface clock without a shader clock?
> >> No because the items in the list are ordered so you need to have, in
> >> order: "bus", "core", "shader", "reg"
> >>
> >> If it is needed to allow any number of clock in any order I could write
> >> it like this:
> > Yes, but I prefer we don't allow any order if we don't have to. Did
> > you run this schema against dtbs_check or just audit the dts files
> > with vivante?
>
> Both, I found these mix of reg-names:
>
> "core"
>
> "bus","core"
>
> "bus","core","shader"

You missed a couple:

arch/arc/boot/dts/hsdk.dts-                     clock-names = "bus",
"reg", "core", "shader";
arch/arm/boot/dts/dove.dtsi-                            clock-names = "core";
arch/arm/boot/dts/imx6q.dtsi-                   clock-names = "bus", "core";
arch/arm/boot/dts/imx6qdl.dtsi-                 clock-names = "bus",
"core", "shader";
arch/arm/boot/dts/imx6qdl.dtsi-                 clock-names = "bus", "core";
arch/arm/boot/dts/imx6sl.dtsi-                  clock-names = "bus", "core";
arch/arm/boot/dts/imx6sl.dtsi-                  clock-names = "bus", "core";
arch/arm/boot/dts/imx6sx.dtsi-                  clock-names = "bus",
"core", "shader";
arch/arm/boot/dts/stm32mp157c.dtsi-                     clock-names =
"bus" ,"core";
arch/arm64/boot/dts/freescale/imx8mq.dtsi-
clock-names = "core", "shader", "bus", "reg";

imx8mq is probably new enough to change if we wanted to.

I guess just do an enum...

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
