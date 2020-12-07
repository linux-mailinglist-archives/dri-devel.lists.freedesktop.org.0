Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295B2D16FE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 17:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914BC89487;
	Mon,  7 Dec 2020 16:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA3D89487
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 16:59:48 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id o25so16127144oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 08:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/SkJ+y4JbdE9Xwej35tShvVwA0lpKmxCFraHeH0nWHU=;
 b=naKXsTMAopOTrGSlsYXHdfs10/c7+XIwSpfj7w95X+6wYwvNgUK9kHFTCLJHHHg9EE
 3q8adLkTnckaupPwOLQxeozOshWoeN0o50WCnapr9qAboAX+2N8o8diwkMyAeFhdNzi7
 ZPCC/iF4O3Hvscod8o+xVFWpkTsp5XCyFTmvDOW3i4yG1bvH+eW+Zg9Obnl80aQyzln5
 jmPC8xASzANWoh1gxfbHIA3uFP7orXbYqLeq3KcboHUIKglYyJfKwr7OYdTHtkqKsH/o
 uXqS0uWR/GO2WkU2GJU60saskPcLTXfRrcZ39MT8D+58OhUGqymrpPkriI/xZf5Qnseh
 y7Gw==
X-Gm-Message-State: AOAM531IfSerIquqkHwXN2B3O0CeKXA378aUCGwkgywy2f5W7Dac6GAa
 9md5rS86BcW+GfJfELQs0A==
X-Google-Smtp-Source: ABdhPJw/vjdojTgl/o7v8d/67obyPy8N0PY1fH5WpiG2P28+XiZRLIfp/vBt4qFEzO6Ba3m9FScZNg==
X-Received: by 2002:aca:6087:: with SMTP id
 u129mr13372577oib.173.1607360387662; 
 Mon, 07 Dec 2020 08:59:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s9sm2749031otb.6.2020.12.07.08.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:59:46 -0800 (PST)
Received: (nullmailer pid 434629 invoked by uid 1000);
 Mon, 07 Dec 2020 16:59:45 -0000
Date: Mon, 7 Dec 2020 10:59:45 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG
 binding
Message-ID: <20201207165945.GA430214@robh.at.kernel.org>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
 <1607311260-13983-3-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607311260-13983-3-git-send-email-victor.liu@nxp.com>
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

On Mon, Dec 07, 2020 at 11:20:56AM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.
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
>  .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> new file mode 100644
> index 00000000..d59e2db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
> +  RTRAM controller and Display Controller.  The main function is to convert
> +  the AXI interface to the RTRAM interface, which includes re-mapping the
> +  ARADDR to a RTRAM address.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx8qxp-prg
> +      - const: fsl,imx8qm-prg

Use enum instead of oneOf+const.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: rtram clock
> +      - description: apb clock
> +
> +  clock-names:
> +    items:
> +      - const: rtram
> +      - const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    prg@56040000 {
> +        compatible = "fsl,imx8qxp-prg";
> +        reg = <0x56040000 0x10000>;
> +        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
> +                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
> +        clock-names = "rtram", "apb";
> +        power-domains = <&pd IMX_SC_R_DC_0>;
> +    };
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
