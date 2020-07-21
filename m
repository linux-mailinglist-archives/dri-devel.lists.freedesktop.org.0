Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03165227FC3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 14:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E1B6E1D5;
	Tue, 21 Jul 2020 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01736E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 12:16:32 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t4so16998251oij.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tj0YIElsm/HeEdxHt1th62ZXmZMXZLHwFI4YkjRLTkY=;
 b=BG35BdvFgBIhVOcdziHOXibKbCb5GtjXDtlWr2qAdaS+a1hXrW20zoBQnecaEZ+HSa
 ofXv8y+dlK8kApzfUtejG9Yw3oo4bM6ewEbMekzD6uZAbw1g/gVihT1vEB6f+eRA1JVh
 Xx93rVMtHX2vpoRbWUYqBXYfk32r8lzhptDCAXXrmdW6rwQwhnu39Fy/+Lq7ik8OpGgW
 YN+0M2jGozU+HpOwZIpT7cJX2zT7jOSKjZYpQczR6rtuin0uy+01I5zcUvrVcbLs9JV6
 5qtz7kMahyFdJrgm4Ac5qhrO7kyiDpajM/IlLSfOrr5NtAinHGEhB6254DTtVFjFttLC
 BlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tj0YIElsm/HeEdxHt1th62ZXmZMXZLHwFI4YkjRLTkY=;
 b=J8j4GCxe0AV9UlNc2x6+X6jmzVUU7CUw+9HuGJmkDYBEa61BtfZzCr9lYyTR5KNFgC
 TJ0CFG1ZGnduifBNSvi7yXSH1gvNIsAFMpdMC63P+ZfQAzaXzyAEWYhwQBf2PjgjZjvS
 Ki1PTwLC452TkVw4XG6rTqYvDAP61UleLQFJhFOovs3t7Cg/bljaS+w5AndBBJ578GEp
 CdWpvAQBy/4b5iFKLNvdwbsJhRseFRrCVkgINrJbBxcXCO4oJ6BDJqAgIxJ3ezsWileg
 R+8KGqGcYSZBHopzk5wHQNOrj/2E+Rspc4GWTcZnisG+0BF81c8UoZX0FJ4I9J625XFM
 ye7w==
X-Gm-Message-State: AOAM532fCu/Gk7Ok96KzuRRz8GSP7wo85ahU1CCo4WA0OVlhGhtBRElz
 MKOYpOAE4j8FICkzMg62S7bZpW1SIrpU5ooxJ8hvqA==
X-Google-Smtp-Source: ABdhPJy7skUMTTFe9eMztqkjUQzK3SGXa8K9qJK6R1zk8g6dESlbOvXxjD+GaAh0s5BIlZfxJljITdtcursSIjP6m+A=
X-Received: by 2002:aca:f184:: with SMTP id p126mr2826593oih.76.1595333791831; 
 Tue, 21 Jul 2020 05:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200716153858.526-1-sumit.semwal@linaro.org>
 <20200716153858.526-2-sumit.semwal@linaro.org>
 <20200721033328.GA3492972@bogus>
In-Reply-To: <20200721033328.GA3492972@bogus>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 21 Jul 2020 17:46:20 +0530
Message-ID: <CAO_48GFREVQ8q=thFw4gJp0wu1MYHkxHi3sxDr8ejRyyY-6_0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Tianma
 nt36672a panel
To: Rob Herring <robh@kernel.org>
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
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

Thanks for the review!
On Tue, 21 Jul 2020 at 09:03, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jul 16, 2020 at 09:08:57PM +0530, Sumit Semwal wrote:
> > The nt36672a panel from Tianma is a FHD+ panel with a resolution of 1080x2246
> > and 6.18 inches size. It is found in some of the Poco F1 phones.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > ---
> >  .../display/panel/tianma,nt36672a.yaml        | 110 ++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> > new file mode 100644
> > index 000000000000..3c583ca926ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/tianma,nt36672a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Tianma model NT36672A DSI Panel display driver
> > +
> > +maintainers:
> > +  - Sumit Semwal <sumit.semwal@linaro.org>
> > +
> > +description: |
> > +  The nt36672a panel from Tianma is a FHD+ LCD display panel with a resolution
> > +  of 1080x2246. It is a video mode DSI panel.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: tianma,nt36672a
> > +
> > +  reg:
> > +    description: DSI virtual channel of the peripheral
> > +
> > +  reset-gpios:
> > +    description: phandle of gpio for reset line - This should be 8mA, gpio
> > +      can be configured using mux, pinctrl, pinctrl-names (active high)
> > +
> > +  vddio-supply:
> > +    description: phandle of the regulator that provides the supply voltage
> > +      Power IC supply
> > +
> > +  vddpos-supply:
> > +    description: phandle of the positive boost supply regulator
> > +
> > +  vddneg-supply:
> > +    description: phandle of the negative boost supply regulator
> > +
> > +  pinctrl-names:
> > +    description: Pinctrl for panel active and suspend
> > +
> > +  pinctrl-0:
> > +    description: Active pinctrls
> > +
> > +  pinctrl-1:
> > +    description: Suspend pinctrls
>
> I think the pinctrl should go in the DSI controller node, not the
> display unless it is settings for 'reset-gpios'.
Yes, from the downstream code, this seems to be for reset-gpios.

>
> > +
> > +  ports:
> > +    type: object
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: DSI input port driven by master DSI
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - reg
>
> For a single port, you can do just 'port' (without ports node).
Thanks; will update in next version.
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddi0-supply
> > +  - vddpos-supply
> > +  - vddneg-supply
> > +  - reset-gpios
> > +  - pinctrl-names
> > +  - pinctrl-0
> > +  - pinctrl-1
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |+
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    dsi0 {
>
> dsi {
>
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      panel@0 {
> > +        compatible = "tianma,nt36672a";
> > +        reg = <0>;
> > +        vddi0-supply = <&vreg_l14a_1p88>;
> > +        vddpos-supply = <&lab>;
> > +        vddneg-supply = <&ibb>;
> > +
> > +        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> > +
> > +        pinctrl-names = "panel_active", "panel_suspend";
> > +        pinctrl-0 = <&sde_dsi_active>;
> > +        pinctrl-1 = <&sde_dsi_suspend>;
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +            tianma_nt36672a_in_0: endpoint {
> > +              remote-endpoint = <&dsi0_out>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > --
> > 2.27.0
> >

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
