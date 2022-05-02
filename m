Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB75171E0
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338DD10F04E;
	Mon,  2 May 2022 14:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DEC10F04C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:46:56 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 6so222961pgb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sH5HId0vlC1xFmCEMdsYdCLg1XTY++Kn19PHmHPWDzE=;
 b=Fj4fa9eKpis1H4ywew58SdhVIaslFKScO2M7KBemKi+uMMHRgjA1rfBTN+5Cyd6W4x
 +QlWVtWjykjZL8OCuu+DUF1JoXxzyPt0ebLiu7otFgHv9xTvO8lvAHDaeiq9cUKgJp32
 kXdYhQlWOGUgaZdvNntTV2VrH86fV9X/o3BN/v/sPLsgKdsAtwZ3sir2qtX8cnazNvIC
 lFVt4uoJmo7wrHkbsB/jnGWvEP73iSu02L+Hjcg5gWiqN0po5YAy2hMEbM4tWJtabdBR
 vTLun67wbqlKUG0ZGnik0MT77wptFARh3msmaRNBjjR7y6JkXW/rXPLY2pljiVodCdZv
 vitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sH5HId0vlC1xFmCEMdsYdCLg1XTY++Kn19PHmHPWDzE=;
 b=Ko0DWkHogGSsayzLIsqxvt/fjxvElR9hS2gpyn5rDOkr7OxTatc9Z2wgRV1g5GgJEi
 fmq+f/+IkNk4uunI18bdCdb0YoM9DCGy71MiOTI1qVly+HYjB9YmdGu8SWurblAp1IRZ
 AIBXov5LTXwbtWTK5fPxOJrpyl9CmuYDWPc6AH263p+F8g4wxIi+Lk4kjsCBfZsIX2x3
 uFDT4TtCMDg+ARG24Cd5SeK7GR9oeTSKfGmOSgBv+491lKYP8tb6rD4NUlcUM/kyWndW
 YDi2RR97UbzrEGSkQl3qk+XItBwDQ403zwM0oSEUzKhXCkC6b24vtfvIapPbfwfMhKjb
 q0qg==
X-Gm-Message-State: AOAM532pfX2a0EGVFkDqb1xw8FHjERIpLKX4qGkvGjJpcUwVEBrKf0y1
 s2T8LPBKqfUcBCk+RfZT9iCSFPWIfK1/k3dbJQn/tw==
X-Google-Smtp-Source: ABdhPJzEj/u9Ig4lchzzzuxYohSp+/WQPurGWexw7b3W7kga8xhSNrUNKj50YZZn0wqp2tTiZB/MQI13j7jbN/Af5/Y=
X-Received: by 2002:a62:6d47:0:b0:4fe:15fa:301d with SMTP id
 i68-20020a626d47000000b004fe15fa301dmr11718975pfc.29.1651502816203; Mon, 02
 May 2022 07:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220426193645.244792-1-marex@denx.de>
In-Reply-To: <20220426193645.244792-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 May 2022 16:46:45 +0200
Message-ID: <CAG3jFysWizvFkbMVexRqPC=5fDa3-VFnxS2zsvBKSKdL4zzxeg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement
 simple Freescale i.MX8MP LDB bridge
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022 at 21:37, Marek Vasut <marex@denx.de> wrote:
>
> The i.MX8MP contains two syscon registers which are responsible
> for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
> which represents this serializer as a bridge.
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Consistently use fsl,imx8mp-ldb as compatible
>     - Drop items: from compatible:
>     - Replace minItems with maxItems in clocks:
>     - Drop quotes from clock-names const: ldb
>     - Rename syscon to fsl,syscon
>     - Use generic name of ldb-lvds in example
> V3: - Add AB from Sam
>     - Consistently use MX8MP
> V4: - Rename to fsl-ldb all over the place
>     - Put the LDB node under media block controller in the example
> ---
>  .../bindings/display/bridge/fsl,ldb.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> new file mode 100644
> index 000000000000..77f174eee424
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP DPI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The i.MX8MP mediamix contains two registers which are responsible
> +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
> +  those registers as bridge within the DT.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-ldb
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ldb
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-A output (panel or bridge).
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-B output (panel or bridge).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    blk-ctrl {
> +        bridge {
> +            compatible = "fsl,imx8mp-ldb";
> +            clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
> +            clock-names = "ldb";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    ldb_from_lcdif2: endpoint {
> +                        remote-endpoint = <&lcdif2_to_ldb>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    ldb_lvds_ch0: endpoint {
> +                        remote-endpoint = <&ldb_to_lvdsx4panel>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +
> +                    ldb_lvds_ch1: endpoint {
> +                    };
> +                };
> +            };
> +        };
> +    };
> --

Applied series to drm-misc-next.
