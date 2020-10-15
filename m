Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E828EC84
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 06:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DF06EC1A;
	Thu, 15 Oct 2020 04:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D9A6EC1A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 04:58:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c21so1715699ljn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ARgqhuWJgBKVPlDxiUpgFCXHBc6+vc3xWY2ELMDeV+E=;
 b=jlZHqT6sNfNMWBuwznhHHdxyJ0c02U+o6Csoo0lyR4588J9wbAkQfzLC28PFD9lClq
 XsyTQNQiPnDGMbV1qthOuX4AIrFoOUVD5FiRIBU/zVODoGK/t06K0emws94Pk4viNbsV
 u7BtZtk9paNaDDZSB2g8lhjvrcoHwBRIwFuO/vpZDUD42hL6LAT+u9yaup1Wpl6fMmVg
 3/HJr43CdGGIKTBEdw5N2+0UioNiRw94BwhPdn/kFVm0fzcLxqydH0YvWLlZGf00qMwX
 yABsUFpk67+29VKYaAe6GC/QVN3DjEol/X7BtcZ4CMQiMUMytMviNmY3OyCjcJspqcom
 WYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ARgqhuWJgBKVPlDxiUpgFCXHBc6+vc3xWY2ELMDeV+E=;
 b=XTr2kPnSHULzc6YScPZj2xeLgqu0GubhYTJOkQSqu+sr9gdeVO/P/50dQs3jTw+m2K
 MmVM4oQxl7u7D2ITNAG48yjMnGYezQ5vAHt9CarXL2xphVckftjzyoqXBA1H7P9y8r0p
 y2FCwenwEyCYgt1TOcA7RDiYGNKYcuru0e346uUyrL88y+JfBFnzYunSUEyzQxc1YsrK
 Lq+9xGsmLbAaTm7++zauZ7+r3T0d2SxI+tDZmrW7lvaOQk/8AG+xVRcbAvrZ5G3zGtjO
 6aJE5Xt/veECAWMCtALrr5SyW5Dqj9yRru7vFs8BA9WeDg323j2cDSR8HVCBMdDmyAVj
 aBjQ==
X-Gm-Message-State: AOAM533xNLZp3udqY8+Gop1V8YyC40PIclWxnLjcrkOIsAz53Yj4NuPE
 3eHvRYPQiMpEnCumlxEAWIsh1jR6hzuhje8U/Z7srg==
X-Google-Smtp-Source: ABdhPJyZNCn/C2YqRNcW/gqfGXjeYLfj+Z/ZOqGrssHEukXnkxVx6V70NcnazmxXOll+joqb2ca0vMizBXVcnRZjvXI=
X-Received: by 2002:a2e:88cb:: with SMTP id a11mr585052ljk.304.1602737894449; 
 Wed, 14 Oct 2020 21:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200902064407.30712-1-sumit.semwal@linaro.org>
 <20200902064407.30712-2-sumit.semwal@linaro.org>
 <20201014184443.GA835495@ravnborg.org>
In-Reply-To: <20201014184443.GA835495@ravnborg.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 15 Oct 2020 10:28:03 +0530
Message-ID: <CAO_48GHy3KjSoxKigejG61Q5FdeTj-EebHjY8-2WAS_DAyJ1DA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: panel: Add bindings for
 Novatek nt36672a
To: Sam Ravnborg <sam@ravnborg.org>
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
 Thierry Reding <thierry.reding@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Thu, 15 Oct 2020 at 00:14, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Sumit.
> On Wed, Sep 02, 2020 at 12:14:06PM +0530, Sumit Semwal wrote:
> > Novatek nt36672a is a display driver IC that can drive DSI panel. It
> > is also present in the Tianma video mode panel, which is a FHD+ panel
> > with a resolution of 1080x2246 and 6.18 inches size. It is found in
> > some of the Poco F1 phones.
> >
> > This patch adds the display driver for the IC, with support added for
> > this tianma fhd video mode panel.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> I assume you will apply the patch yourself.

Thanks, I will.

>
>         Sam
Best,
Sumit.
> >
> > ---
> > v2: remove ports node, making port@0 directly under panel@0 node.
> > v3: updated to replace port@0 to just 'port'.
> > v5: renamed to novatek,nt36672a, since the binding is for the IC and not
> >       the panel.
> > v6: v5 review comments incorporated.
> >     - added enum for the compatible part, since it can be extended in
> >       future.
> >     - few cosmetic updates.
> > ---
> >  .../display/panel/novatek,nt36672a.yaml       | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> > new file mode 100644
> > index 000000000000..d2170de6b723
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/novatek,nt36672a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Novatek NT36672A based DSI display Panels
> > +
> > +maintainers:
> > +  - Sumit Semwal <sumit.semwal@linaro.org>
> > +
> > +description: |
> > +  The nt36672a IC from Novatek is a generic DSI Panel IC used to drive dsi
> > +  panels.
> > +  Right now, support is added only for a Tianma FHD+ LCD display panel with a
> > +  resolution of 1080x2246. It is a video mode DSI panel.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +         - tianma,fhd-video
> > +      - const: novatek,nt36672a
> > +    description: This indicates the panel manufacturer of the panel that is
> > +      in turn using the NT36672A panel driver. This compatible string
> > +      determines how the NT36672A panel driver is configured for the indicated
> > +      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
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
> > +  reg: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddi0-supply
> > +  - vddpos-supply
> > +  - vddneg-supply
> > +  - reset-gpios
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |+
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        panel@0 {
> > +            compatible = "tianma,fhd-video", "novatek,nt36672a";
> > +            reg = <0>;
> > +            vddi0-supply = <&vreg_l14a_1p88>;
> > +            vddpos-supply = <&lab>;
> > +            vddneg-supply = <&ibb>;
> > +
> > +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> > +
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            port {
> > +                tianma_nt36672a_in_0: endpoint {
> > +                    remote-endpoint = <&dsi0_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.28.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
