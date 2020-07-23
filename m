Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A511322B544
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 19:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CDE6E1E6;
	Thu, 23 Jul 2020 17:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8A6E2F9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 17:55:56 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id c16so7179804ioi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 10:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LatV4wJPmhuuRpuPDp60yB6PtdwChfxffIyNVC6yNyY=;
 b=dDFlZMs6VPDrE3luc7ctAPCBicv92JNvNnfvZPIpHpg2VIQU4Lj6/YqAkTTGRO4Y0Y
 oiM1tNYU6QuL/dTAyTu25zTNw4HQlvpF9x43+jkYf3hS6WxQoqTP1v/7ipGg3xRwti0c
 5BNbhws2vE2FEeobeHdlZaYZCu5LAE4PdkcChW/kSzqrcoxbJzLhHQL/KxCoFhco/2dW
 ou8AYOckNpjkmBWdUiWMkMHyYx3cTNeAIWllw5JoOWrEDRnf1/AWuVcTmHtRknwH/+9Q
 aozekcmA+2SF2KngH/8mbe5RAYCtClJ+qmSV+vvyT6WlEBwEs8AoKWaCbJACGKNl5JmD
 CYqg==
X-Gm-Message-State: AOAM533m4LvIsyH5F0wbxLq2E+0l6Fqe8nw0IBYZplF6TVMwYKgQ/pip
 qcqVlXuD1uuwQzsYwSvmMg==
X-Google-Smtp-Source: ABdhPJzoegcIx2PlRuNOI+Swz4uL/vkn4PDWRH4qdvpj9862Fiag84/oo5is7BB48jcKw7CWngO05w==
X-Received: by 2002:a02:7419:: with SMTP id o25mr6144155jac.4.1595526955876;
 Thu, 23 Jul 2020 10:55:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id x5sm1808340iol.36.2020.07.23.10.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 10:55:55 -0700 (PDT)
Received: (nullmailer pid 607657 invoked by uid 1000);
 Thu, 23 Jul 2020 17:55:52 -0000
Date: Thu, 23 Jul 2020 11:55:52 -0600
From: Rob Herring <robh@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add bindings for
 Tianma nt36672a panel
Message-ID: <20200723175552.GA602630@bogus>
References: <20200722055816.20768-1-sumit.semwal@linaro.org>
 <20200722055816.20768-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722055816.20768-2-sumit.semwal@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 11:28:15AM +0530, Sumit Semwal wrote:
> The nt36672a panel from Tianma is a FHD+ panel with a resolution of 1080x2246
> and 6.18 inches size. It is found in some of the Poco F1 phones.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Change-Id: I401dfbfe23ff2d806c956002f45e349cb9688c16

You know better...

> ---
> v2: remove ports node, making port@0 directly under panel@0 node.
> ---
>  .../display/panel/tianma,nt36672a.yaml        | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> new file mode 100644
> index 000000000000..cb1799fbbd32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/tianma,nt36672a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tianma model NT36672A DSI Panel display driver
> +
> +maintainers:
> +  - Sumit Semwal <sumit.semwal@linaro.org>
> +
> +description: |
> +  The nt36672a panel from Tianma is a FHD+ LCD display panel with a resolution
> +  of 1080x2246. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: tianma,nt36672a
> +
> +  reg:
> +    description: DSI virtual channel of the peripheral
> +
> +  reset-gpios:
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)
> +
> +  vddio-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      Power IC supply
> +
> +  vddpos-supply:
> +    description: phandle of the positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: phandle of the negative boost supply regulator
> +
> +  pinctrl-names:
> +    description: Pinctrl for panel active and suspend
> +
> +  pinctrl-0:
> +    description: Active pinctrls
> +
> +  pinctrl-1:
> +    description: Suspend pinctrls
> +
> +  port@0:

Just 'port' as there can only be 1 in this case.

You can do just: 'port: true' as panel-common.yaml already has a 
definition.

> +    type: object
> +    description: DSI input port driven by master DSI
> +    properties:
> +      reg:
> +        const: 0
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddi0-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - pinctrl-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - port@0
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +    dsi0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      panel@0 {
> +        compatible = "tianma,nt36672a";
> +        reg = <0>;
> +        vddi0-supply = <&vreg_l14a_1p88>;
> +        vddpos-supply = <&lab>;
> +        vddneg-supply = <&ibb>;
> +
> +        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +        pinctrl-names = "panel_active", "panel_suspend";
> +        pinctrl-0 = <&sde_dsi_active>;
> +        pinctrl-1 = <&sde_dsi_suspend>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        port@0 {
> +          reg = <0>;
> +          tianma_nt36672a_in_0: endpoint {
> +            remote-endpoint = <&dsi0_out>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.27.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
