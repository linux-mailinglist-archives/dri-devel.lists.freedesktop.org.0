Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075114E4BA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 22:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDB76FA35;
	Thu, 30 Jan 2020 21:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B636FA35
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 21:19:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 32D1A2002E;
 Thu, 30 Jan 2020 22:19:03 +0100 (CET)
Date: Thu, 30 Jan 2020 22:19:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: michael.srba@seznam.cz
Subject: Re: [PATCH v3 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Message-ID: <20200130211901.GA32091@ravnborg.org>
References: <20200130203555.316-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130203555.316-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=3iyvTDRqwdQwqYLwx0oA:9 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael.

I fixed the following:
- added .yaml extension to $id
- added a dsi node to the example, and added #address-cells/size-cells
  to fix dt_binding_check warnings

With these fixes - applied to drm-misc-next.

	Sam

On Thu, Jan 30, 2020 at 09:35:54PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
> use of their S6E88A0 controller.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> Hi,
> I recall now that tabs cause a syntax error in yaml, should be easy to check 
> in checkpatch.pl?
> I hope there are no more embarassing oversights left.
> 
> Changes in v2: use yaml format for the binding
> Changes in v3: fix oversights too embarassing to admit here
> ---
>  .../panel/samsung,s6e88a0-ams452ef01.yaml     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> new file mode 100644
> index 000000000000..298fc9a78297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams452ef01#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode DSI controller
> +
> +maintainers:
> +  - Michael Srba <Michael.Srba@seznam.cz>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e88a0-ams452ef01
> +  reg: true
> +  reset-gpios: true
> +  vdd3-supply:
> +     description: core voltage supply
> +  vci-supply:
> +     description: voltage supply for analog circuits
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd3-supply
> +  - vci-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    panel@0 {
> +            reg = <0>;
> +
> +            compatible = "samsung,s6e88a0-ams452ef01";
> +
> +            vdd3-supply = <&pm8916_l17>;
> +            vci-supply = <&reg_vlcd_vci>;
> +            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +    };
> -- 
> 2.24.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
