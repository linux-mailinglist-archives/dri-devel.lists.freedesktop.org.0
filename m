Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A5183760
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 18:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCDB6EB0C;
	Thu, 12 Mar 2020 17:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5B56EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 17:25:58 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D23C220716
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584033958;
 bh=PTvuO3YiFJRIht1oaTpuGfBpue7S7PiLmmQVu1qVIn4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=v4yGTumBUbUn7LDvYCm6yGZ6JW8eLb4w5G5kAmN2IEtHIgm/n7DUy3NLoGqNvt2ub
 ZZOYtOwqpI3b1qbtf2yCXD6alkY0I5+wnGXaibG00eUYNsMyMQaHlqlWsXiKiafHoi
 oUbwUWuSNs0I9SO6qDyTuDW4ZeQhXkk6+Rm2oU1k=
Received: by mail-qt1-f178.google.com with SMTP id z8so1640420qto.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:25:57 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1d2/hjOuas+nsXxfxQ1lE/zAQ+AaPmCJPLN6+NpNl2moQa68xG
 juUdSImZx7e+v14nf55uThf1ZioBvdIkt7ETSQ==
X-Google-Smtp-Source: ADFU+vuTNhe4RU9kuU5b409wZdxlxUCyoJ8PZURcjbAM9GBDKgaJKZ5s5NABcrdZFt2QuePKLVKem4BfjeKrNJsx1fQ=
X-Received: by 2002:ac8:1b33:: with SMTP id y48mr8614017qtj.136.1584033956950; 
 Thu, 12 Mar 2020 10:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200306124930.20978-1-laurentiu.palcu@oss.nxp.com>
 <20200306124930.20978-4-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20200306124930.20978-4-laurentiu.palcu@oss.nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Mar 2020 12:25:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJbZdrANVLgaiDWO0V8bzZ568hHZ8Fu5UZ7D5Nr3hjHiA@mail.gmail.com>
Message-ID: <CAL_JsqJbZdrANVLgaiDWO0V8bzZ568hHZ8Fu5UZ7D5Nr3hjHiA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: imx: add bindings for DCSS
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 6:50 AM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Please send to DT list if you want timely (by some definition) feedback.

> Add bindings for iMX8MQ Display Controller Subsystem.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> new file mode 100644
> index 000000000000..fde6ec8cb0c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 NXP
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/imx/nxp,imx8mq-dcss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: iMX8MQ Display Controller Subsystem (DCSS)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@nxp.com>
> +
> +description:
> +
> +  The DCSS (display controller sub system) is used to source up to three
> +  display buffers, compose them, and drive a display using HDMI 2.0a(with HDCP
> +  2.2) or MIPI-DSI. The DCSS is intended to support up to 4kp60 displays. HDR10
> +  image processing capabilities are included to provide a solution capable of
> +  driving next generation high dynamic range displays.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx8mq-dcss
> +
> +  reg:
> +    maxItems: 2

Need to say what each entry is.


> +
> +  interrupts:
> +    maxItems: 3

Can drop. Implied by 'items' list.

> +    items:
> +      - description: Context loader completion and error interrupt
> +      - description: DTG interrupt used to signal context loader trigger time
> +      - description: DTG interrupt for Vblank
> +
> +  interrupt-names:
> +    maxItems: 3

Can drop.

> +    items:
> +      - const: ctxld
> +      - const: ctxld_kick
> +      - const: vblank
> +
> +  clocks:
> +    maxItems: 5

Can drop.

> +    items:
> +      - description: Display APB clock for all peripheral PIO access interfaces
> +      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
> +      - description: RTRAM clock
> +      - description: Pixel clock, can be driver either by HDMI phy clock or MIPI
> +      - description: DTRC clock, needed by video decompressor
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: rtrm
> +      - const: pix
> +      - const: dtrc
> +
> +  port:
> +    type: object
> +    description:
> +      A port node pointing to the input port of a HDMI/DP or MIPI display bridge.
> +
> +examples:
> +  - |
> +    dcss: display-controller@32e00000 {
> +        compatible = "nxp,imx8mq-dcss";
> +        reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> +        interrupts = <6>, <8>, <9>;
> +        interrupt-names = "ctxld", "ctxld_kick", "vblank";
> +        interrupt-parent = <&irqsteer>;
> +        clocks = <&clk 248>, <&clk 247>, <&clk 249>,
> +                 <&clk 254>,<&clk 122>;
> +        clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
> +        assigned-clocks = <&clk 107>, <&clk 109>, <&clk 266>;
> +        assigned-clock-parents = <&clk 78>, <&clk 78>, <&clk 3>;
> +        assigned-clock-rates = <800000000>,
> +                               <400000000>;
> +        port {
> +            dcss_out: endpoint {
> +                remote-endpoint = <&hdmi_in>;
> +            };
> +        };
> +    };
> +
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
