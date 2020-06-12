Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B31171F7E4F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 23:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7446E1E0;
	Fri, 12 Jun 2020 21:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07A96E1E0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 21:11:04 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p20so11684866iop.11
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 14:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LdO+yABvrQyODTNWEnFCNLq5SRWaCDFSeyJReNxOrN4=;
 b=QxMQ8PCqLWLTRY+lzaWbMHa75uxgUBtiOXC5xK5ifeMXcFODXqf5xMC8pKbmkXZqKp
 /AE8cyx5n5GOCI8ZUQOfaxoFs9AUiGP7ZPPRQvWsD7mNB9lb33c6oup3ShlqlMlMmy1Z
 rx8H/2VNy84ScBavFLkkg7oKmmlKJkjStnQCOCGQE0xFm1k9w++WiBe9cOioIKnVk+s4
 upyyli4K2jBlOMF9PAtP7cEc91uK2brKenJ1VEt/172cMLxhGBmAvTQidkCWqm1WqqxM
 dbPEJSEfXCNe5V+eAaHGBynWZN7+XZgJFXba3s6hN8Svt5GFfzYNe3JfeoLLFQ0VrMGW
 ufDA==
X-Gm-Message-State: AOAM530TceuD9WxIzdkHCHRIDUs2pJ/dgAt+IVV1wQPnDZmQSCvKYm7t
 /zK2WzB07bUo/Hn/CbmDNA==
X-Google-Smtp-Source: ABdhPJyTLPwHiCPMWBDlg3TIAXPWsywr4DNWk8QAGkvpv7/LiQJCR/XEW/hsc3A/ByLjKLXUmh/i0w==
X-Received: by 2002:a05:6638:406:: with SMTP id
 q6mr10161463jap.125.1591996263990; 
 Fri, 12 Jun 2020 14:11:03 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id d66sm3628624iof.27.2020.06.12.14.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 14:11:02 -0700 (PDT)
Received: (nullmailer pid 3820221 invoked by uid 1000);
 Fri, 12 Jun 2020 21:11:01 -0000
Date: Fri, 12 Jun 2020 15:11:01 -0600
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v9 05/11] dt-bindings: display: add i.MX6 MIPI DSI host
 controller doc
Message-ID: <20200612211101.GA3808755@bogus>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
 <20200609174959.955926-6-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609174959.955926-6-adrian.ratiu@collabora.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Adrian Pop <pop.adrian61@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Martyn Welch <martyn.welch@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philippe CORNU <philippe.cornu@st.com>, Yannick FERTRE <yannick.fertre@st.com>,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 08:49:53PM +0300, Adrian Ratiu wrote:
> This provides an example DT binding for the MIPI DSI host controller

It's not an example. It defines the exact binding for this peripheral.

> present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Tested-by: Adrian Pop <pop.adrian61@gmail.com>
> Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
> Changes since v8:
>   - Fixed small compatible string typo caught by checkpatch
>   - Added custom select for 'fsl,imx6-mipi-dsi' (Rob)
>   - Replaced additionalProperties -> unevaluatedProperties (Rob)
>   - Dropped all nodes not adding any new constraints apart from
>   the recently upstreamed snps,dw-mipi-dsi.yaml (Rob)
> 
> Changes since v7:
>   - Clarified port@0,1 descriptions, marked them as required and
>   added missing port@0 in example (Laurent)
> 
> Changes since v6:
>   - Added ref to the newly created snps,dw-mipi-dsi.yaml (Laurent)
>   - Moved *-cells properties outside patternProperties (Laurent)
>   - Removed the panel port documentation (Laurent)
>   - Wrapped lines at 80 chars, typo fixes, sort includes (Laurent)
> 
> Changes since v5:
>   - Fixed missing reg warning (Fabio)
>   - Updated dt-schema and fixed warnings (Rob)
> 
> Changes since v4:
>   - Fixed yaml binding to pass `make dt_binding_check dtbs_check`
>   and addressed received binding feedback (Rob)
> 
> Changes since v3:
>   - Added commit message (Neil)
>   - Converted to yaml format (Neil)
>   - Minor dt node + driver fixes (Rob)
>   - Added small panel example to the host controller binding
> 
> Changes since v2:
>   - Fixed commit tags (Emil)
> ---
>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> new file mode 100644
> index 0000000000000..86093729fd5f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,mipi-dsi-imx6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6 DW MIPI DSI Host Controller
> +
> +maintainers:
> +  - Adrian Ratiu <adrian.ratiu@collabora.com>
> +
> +description: |
> +  The i.MX6 DSI host controller is a Synopsys DesignWare MIPI DSI v1.01
> +  IP block with a companion PHY IP.
> +
> +  These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
> +  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
> +  the following device-specific properties.
> +
> +allOf:
> +  - $ref: ../bridge/snps,dw-mipi-dsi.yaml#
> +
> +# Need a custom select here or 'snps,dw-mipi-dsi' will match lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - fsl,imx6-mipi-dsi
> +  required:
> +    - compatible
> +
> +properties:

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

These 2 are covered by dsi-controller.yaml, so you can drop them.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
