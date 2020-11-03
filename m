Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D72A54A1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 22:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FC76E8CC;
	Tue,  3 Nov 2020 21:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3F96E8CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 21:13:14 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1579320061;
 Tue,  3 Nov 2020 22:13:10 +0100 (CET)
Date: Tue, 3 Nov 2020 22:13:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v11 2/7] dt-bindings: display: Intel KeemBay MSSCAM
Message-ID: <20201103211309.GA1523958@ravnborg.org>
References: <1604432073-15933-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604432073-15933-3-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604432073-15933-3-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=IpJZQVW2AAAA:8
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=FSSKQYRyFT3z3PS9pIMA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=AjGcO6oz07-iQ99wixmX:22 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Tue, Nov 03, 2020 at 11:34:28AM -0800, Anitha Chrisanthus wrote:
> This patch add bindings for Intel KeemBay MSSCAM syscon
> 
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/intel,keembay-msscam.yaml     | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
> new file mode 100644
> index 0000000..10ed8d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/intel,keembay-msscam.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Devicetree bindings for Intel Keem Bay MSSCAM

Here I had expected a short description of what it is used for.
And maybe even an explanation for the msscam abbrevation it this can be
made public.

> +
> +maintainers:
> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> +  - Edmond J Dea <edmund.j.dea@intel.com>
> +
> +properties:
> +  compatible:
> +    const: intel,keembay-msscam, syscon

This will not work - it needs to look something like:
  compatible:
    items:
      - const: intel,keembay-msscam
      - const: syscon

See for example arm/freescale/fsl,imx7ulp-sim.yaml

Other than the above it looks good.

	Sam

> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    const: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-io-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    msscam:msscam@20910000 {
> +        compatible = "intel,keembay-msscam", "syscon";
> +        reg = <0x20910000 0x30>;
> +        reg-io-width = <4>;
> +    };
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
