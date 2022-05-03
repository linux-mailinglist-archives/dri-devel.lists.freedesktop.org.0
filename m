Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2772517B3C
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 02:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126AF10E350;
	Tue,  3 May 2022 00:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B638710E350
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 00:31:17 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 m6-20020a05683023a600b0060612720715so3543666ots.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 17:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+xfMK+H0fMuHQUoosTVVx54TR5npSCucc917CZi8x0M=;
 b=hOkNEBo6nSvUCLboj9eTYCjlJJ0o419Hzu/QU91fGMd+1xHnG/3reqSePQZ9gyAM+5
 w+HD0T/bnZIFbzQmfO3JkyYvgIG9T2PeG9ZS7T3xNEg/G167C4VkMUddWJHLs4FxPro0
 lL+S64q+E48bGO87XkuTitE41iqGWI7bLd7QxmlbGUuhRjKXlWQ3Hv2BB7UaLVRmqezr
 w939tjF/O62Px7WZM3yhD0i4F/lziD5E6j7YaGlGFP9jU2pGVC9REux+r6r/Yk3ElpZ7
 rJpVw90CSCG20tAFaVYq2uC2VgXaaP/kgkWeIhx1KO3B+D1A2pTcZ6GU8iBUSXjGLgLN
 iAIQ==
X-Gm-Message-State: AOAM532IP9PyOVzhEv+HT7Wn5OY5UCAPZ9bvow32qAf+YmSlq1fxoX2X
 KxFBY3hmraDqaR1/Vdq/TA==
X-Google-Smtp-Source: ABdhPJyjDNQqFMKGWqkJAvrDnu1nt8BBWu2t1EZWDLhtEOFilJTPAKhjY8JokBsqlIXd/7+bhWxHMg==
X-Received: by 2002:a05:6830:19f3:b0:605:fd48:7fed with SMTP id
 t19-20020a05683019f300b00605fd487fedmr5155994ott.382.1651537876978; 
 Mon, 02 May 2022 17:31:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b21-20020a056870b25500b000eba4901e57sm3933451oam.17.2022.05.02.17.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 17:31:16 -0700 (PDT)
Received: (nullmailer pid 2111272 invoked by uid 1000);
 Tue, 03 May 2022 00:31:15 -0000
Date: Mon, 2 May 2022 19:31:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement
 simple Freescale i.MX8MP LDB bridge
Message-ID: <YnB3008DXAVoUK7j@robh.at.kernel.org>
References: <20220426193645.244792-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426193645.244792-1-marex@denx.de>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 09:36:44PM +0200, Marek Vasut wrote:
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

A little quick on the applying...

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

This is a subblock of the mediamix? Please add 'reg' for the 2 registers 
even if you use a regmap.

I didn't find a binding for mediamix. You really need the containing 
block binding before a child node.

Rob
