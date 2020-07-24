Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDA22BCD2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 06:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FA86E91A;
	Fri, 24 Jul 2020 04:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1786E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 04:17:27 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id x83so6970574oif.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YTT73fROBVT8TZbJViXVHJt1wjzukhaNdjZMHoT4MMM=;
 b=gmqfhVFtR337ZrjFDzRLwS/pOwrr2MrmvoxgzuqKhyWihrkEJAP0OX2mekTSzg1lTh
 4OUMLj+g/asCGM5+CFRMwA6QrVEYkt9ZHV2g9Fm9li9W3qYvQhsdGA8VUsGt9XIdkYFq
 T74by6FB0sFWsSyWM35fUrjhYhFXNwswSuCi4Ikt33R2rcJ+lqyOWu9SRtUzaE2aZ5hN
 HYOCF1X8xFXcJLig8HTMcWM5ChMEUGsUHPHsPAMPZJieMCK7+Soc88nUX/ZVh39kxb52
 6IqGWyKyZurId3qZ86v4I5jdSPrXaiJgCm881mzgCp0YsCHbi3Qbay/RKd5XqVmnbqHz
 z8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YTT73fROBVT8TZbJViXVHJt1wjzukhaNdjZMHoT4MMM=;
 b=aMVst/qnbx9EGG5eoYIhajXFx+I80OzD8IEyrQyslGLMl/7H1PIgHj4FLAfBFHuxOp
 9hSGmr4MfrpopB9ej9K5jzc90S0lyqki9VMNW15HzH/m+JvwN8gJEs+eP10DZWTh5lK3
 ib+9ntQXXx0r4L6uE2uJyODe4d4AJprTVnQ1GSJQ4zePKv1FVI9Vyhte6tMWPGFpMNNx
 CIUhNWf1/D/O2rxzrd/49kuj7faLb3Gk1AoR6WrcZLfDKr3zqWhPIytJhWUjafujzQsO
 w1gPmzUucfLa1tWOf/02GsHFF/t9uzs+EDtCSPGARCCLeRKMPiM+JeVaA4LvCpiUZOHp
 TzRA==
X-Gm-Message-State: AOAM532XfPsrYkkLTDTJnb0urc05wEIV2FBW4ib7uYjnI1anZ13QlY4O
 gQYmJ+spbfwN9Lu921gsSSTGoDpd/SidalqXBgXqpA==
X-Google-Smtp-Source: ABdhPJx/agHjYflbwk6fi2xXMZqsnu4VQ0/K/yAmmSRQzS/+TjeabhqhPYBCWVJmqyU41+AcbdUgXQZnaG5C8w8nTZQ=
X-Received: by 2002:aca:2811:: with SMTP id 17mr6887468oix.166.1595564246768; 
 Thu, 23 Jul 2020 21:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200722055816.20768-1-sumit.semwal@linaro.org>
 <20200722055816.20768-2-sumit.semwal@linaro.org>
 <20200723175552.GA602630@bogus>
In-Reply-To: <20200723175552.GA602630@bogus>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 24 Jul 2020 09:47:15 +0530
Message-ID: <CAO_48GH3btOO9JyxqC2JEcqqxnP_Fxk_u4mvuaEy22TfMZ8pqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add bindings for
 Tianma nt36672a panel
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the review!

On Thu, 23 Jul 2020 at 23:25, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jul 22, 2020 at 11:28:15AM +0530, Sumit Semwal wrote:
> > The nt36672a panel from Tianma is a FHD+ panel with a resolution of 1080x2246
> > and 6.18 inches size. It is found in some of the Poco F1 phones.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Change-Id: I401dfbfe23ff2d806c956002f45e349cb9688c16
>
> You know better...
Yes - Sorry :( - will correct.
>
> > ---
> > v2: remove ports node, making port@0 directly under panel@0 node.
> > ---
> >  .../display/panel/tianma,nt36672a.yaml        | 104 ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> > new file mode 100644
> > index 000000000000..cb1799fbbd32
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> > @@ -0,0 +1,104 @@
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
> > +
> > +  port@0:
>
> Just 'port' as there can only be 1 in this case.
>
> You can do just: 'port: true' as panel-common.yaml already has a
> definition.

Ok, let me try that and send out v3.
>
> > +    type: object
> > +    description: DSI input port driven by master DSI
> > +    properties:
> > +      reg:
> > +        const: 0
> > +
> > +    required:
> > +      - reg
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
> > +  - port@0
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |+
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    dsi0 {
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
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        port@0 {
> > +          reg = <0>;
> > +          tianma_nt36672a_in_0: endpoint {
> > +            remote-endpoint = <&dsi0_out>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > --
> > 2.27.0
> >
>

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
