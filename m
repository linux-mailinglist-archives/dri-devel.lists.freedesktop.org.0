Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43A285441
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 00:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7196E5A5;
	Tue,  6 Oct 2020 22:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EDD6E5A5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 22:00:16 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id z1so111926ooj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 15:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z2hvVkSpnHINzNhjhUjzJuQ0tG2BYYHBLjAIAeoL0TQ=;
 b=Dl/NePTTN7BXUJvTma6z5BdcW/yGsOrKoKXIJ29o3ZotGHmFiGfUJ9fsIVvOogUksm
 pjA+Uc5724JvICEL50fyx6mZs8sr2Rz0nGSnew1qK0xM7Y2l781819o15HJJYF59e1O9
 7psqhqQ9tKnQbT6cnZ4XFVCBqwtwK4aLiqKu0xQa4jN5SMx/2rDhhaRsgExDsv9YiZmx
 QdQzJ6bE3dw2XnjfE+Op6ZRF30bt92w99/K3NLB+BP5NsOMCTcp06UBs/WthuTsTGyLi
 2occOIoDs2M/YyA4JUL4Ihde9VOoFMBZAkDNr5uv4S+YBf4A8/pbbPFkZygDIoMHRxTR
 j89Q==
X-Gm-Message-State: AOAM533dEJfNNNIttuF4p3rpwtnhE4bF6pjotkDsshz3Sd+AvtX7TXeT
 i7EFif7Ew6FKl2SBu9tRyg==
X-Google-Smtp-Source: ABdhPJwftGpL2HYPjAt+Z1eQOcxnHz4QpTbvxtaOM3xgT1/4qgIW1HO6EhL66hoTavvtO3KwGn4Pyw==
X-Received: by 2002:a05:6820:22c:: with SMTP id
 j12mr104968oob.87.1602021616239; 
 Tue, 06 Oct 2020 15:00:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o205sm119360oig.8.2020.10.06.15.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:00:15 -0700 (PDT)
Received: (nullmailer pid 2926434 invoked by uid 1000);
 Tue, 06 Oct 2020 22:00:14 -0000
Date: Tue, 6 Oct 2020 17:00:14 -0500
From: Rob Herring <robh@kernel.org>
To: Bogdan Togorean <bogdan.togorean@analog.com>
Subject: Re: [PATCH 2/2] drm: dt-bindings: adi: axi-hdmi-tx: Add DT bindings
 for axi-hdmi-tx
Message-ID: <20201006220014.GA2920793@bogus>
References: <20201005141226.180655-1-bogdan.togorean@analog.com>
 <20201005141226.180655-2-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005141226.180655-2-bogdan.togorean@analog.com>
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
 Mike Looijmans <mike.looijmans@topic.nl>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 05:12:09PM +0300, Bogdan Togorean wrote:
> Add YAML device tree bindings for Analog Devices Inc. AXI HDMI TX
> IP core DRM driver.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
>  .../bindings/gpu/adi,axi-hdmi-tx.yaml         | 70 +++++++++++++++++++

Not a GPU? Goes in .../bindings/display/

>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/adi,axi-hdmi-tx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/adi,axi-hdmi-tx.yaml b/Documentation/devicetree/bindings/gpu/adi,axi-hdmi-tx.yaml
> new file mode 100644
> index 000000000000..ab7e71d14d1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/adi,axi-hdmi-tx.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/adi,axi-hdmi-tx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AXI HDMI TX HDL core
> +
> +maintainers:
> +  - Bogdan Togorean <bogdan.togorean@analog.com>
> +
> +description: |
> +  The AXI HDMI HDL driver is the driver for the HDL graphics core which
> +  is used on various FPGA designs. It's mostly used to interface with
> +  the ADV7511 driver on some Zynq boards (e.g. ZC702 & ZedBoard).
> +
> +properties:
> +  compatible:
> +    const: adi,axi-hdmi-tx-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: phandle to AXIS DMA controller
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: video
> +
> +  clocks:
> +    maxItems: 1
> +    description: phandle to the pixel clock
> +
> +  adi,is-rgb:
> +    type: boolean
> +    description: control color space conversion
> +
> +  port:
> +    type: object
> +    description: |
> +      Port as described in Documentation/devicetree/bindings/graph.txt.
> +      Remote output connection to ADV7511 driver

The exact device it's connected to is outside the scope of this binding.

> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - port

additionalProperties: false

> +
> +examples:
> +  - |
> +    axi_hdmi_tx: axi_hdmi@70e00000 {
> +            compatible = "adi,axi-hdmi-tx-1.00.a";
> +            reg = <0x70e00000 0x10000>;
> +            dmas = <&hdmi_dma 0>;
> +            dma-names = "video";
> +            clocks = <&hdmi_clock>;
> +
> +            port {
> +                    axi_hdmi_out: endpoint {
> +                            remote-endpoint = <&zynq_hdmi_in>;
> +                    };
> +            };
> +    };
> +...
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
