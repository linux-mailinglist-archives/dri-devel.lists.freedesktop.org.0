Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557722D1701
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 18:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FB689A67;
	Mon,  7 Dec 2020 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3789A67
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 17:02:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d27so8590341oic.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 09:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WhUIrDtbx95VVaLpPCnUUxF3hbxbXkZibqs0hBKgFBI=;
 b=C3owMo6CTjuWE6g/6P8/C1lWNJU3XCs+mOUy3awKuabWnlSHell4EE9++aYkS6AA9q
 Y5s3dvR+u838iFeimga/Lm8NKWzBMLhPkX3WzXmIr9UQI+8A4pRDIy4atLfv/XY6goC2
 unEN34YWcgqI8clH1zcdCCQdA4eFTuuyDgC6SDWdGswGaauC6GdHWvLb6z5h5BImrQic
 mEkJua1pBtzWcgzxvPTOBr5aUxbfeA73nNzx2fEHwWQi379N5uU3LNHffdtH8b/jSlOz
 tF/YqYALHwh48TtLvfnTf0WUBJQfRYZvBqbXLccPaF+U4xpD8YOF/drdgBCOPfU8F3RV
 Oyzw==
X-Gm-Message-State: AOAM532UHVc0Hir/+Xo0j0K2orcY4Vqv6Ju4V2xDRpbDvn2hs38Dzvui
 veCjJyq8vRAs9epGceJtuwndHaNDyw==
X-Google-Smtp-Source: ABdhPJwoMHlcpltnFQNrr+DMIIKPVZojsPWQGzZZCZM4H/mZ7zsCV2lm7aLdzZNGLecptEp8zSgcjQ==
X-Received: by 2002:aca:f289:: with SMTP id
 q131mr12905613oih.159.1607360528354; 
 Mon, 07 Dec 2020 09:02:08 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j126sm3045161oib.13.2020.12.07.09.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 09:02:07 -0800 (PST)
Received: (nullmailer pid 437794 invoked by uid 1000);
 Mon, 07 Dec 2020 17:02:06 -0000
Date: Mon, 7 Dec 2020 11:02:06 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Message-ID: <20201207170206.GA434964@robh.at.kernel.org>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
 <1607311260-13983-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607311260-13983-4-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 11:20:57AM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Note that this depends on the 'two cell binding' clock patch set which has
> already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
> won't be found.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * Use new dt binding way to add clocks in the example.
> 
>  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> new file mode 100644
> index 00000000..91e9472
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
> +  fetches display data before the display pipeline needs the data to drive
> +  pixels in the active display region.  This data is transformed, or resolved,
> +  from a variety of tiled buffer formats into linear format, if needed.
> +  The DPR works with a double bank memory structure.  This memory structure is
> +  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
> +  as A and B.  Each bank is either 4 or 8 lines high depending on the source
> +  frame buffer format.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx8qxp-dpr-channel
> +      - const: fsl,imx8qm-dpr-channel

enum instead of oneOf+const.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: apb clock
> +      - description: b clock
> +      - description: rtram clock
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: b
> +      - const: rtram
> +
> +  fsl,sc-resource:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The SCU resource ID associated with this DPRC instance.
> +
> +  fsl,prgs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      List of phandle which points to Prefetch Resolve Gaskets(PRGs)
> +      associated with this DPRC instance.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - fsl,sc-resource
> +  - fsl,prgs
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    dpr-channel@56100000 {
> +        compatible = "fsl,imx8qxp-dpr-channel";
> +        reg = <0x56100000 0x10000>;
> +        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
> +                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
> +                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
> +        clock-names = "apb", "b", "rtram";
> +        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
> +        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
> +        power-domains = <&pd IMX_SC_R_DC_0>;
> +    };
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
