Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B014E0BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 19:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406016E8D0;
	Thu, 30 Jan 2020 18:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75F66E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 18:25:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4A2452005D;
 Thu, 30 Jan 2020 19:25:51 +0100 (CET)
Date: Thu, 30 Jan 2020 19:25:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: michael.srba@seznam.cz
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Message-ID: <20200130182549.GA21265@ravnborg.org>
References: <20200130171128.29251-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130171128.29251-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=doRB7wx00yQXQO78LT4A:9 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
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

Thanks for the quick feedback and the conversion.
There is a few things you need to improve as noted below.

	Sam

On Thu, Jan 30, 2020 at 06:11:27PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
> use of their S6E88A0 controller.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> Hi,
> Thanks for the review. I believe I've fixed everything, and I tested that 
> I get image on drm-next with these patches applied.
> 
> Changes since v1: use yaml format for the binding
> ---
>  .../panel/samsung,s6e88a0-ams452ef01.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> new file mode 100644
> index 000000000000..3d9b480ec706
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only
For new bindings please use: (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
Filename must match

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
> +  enforce-video-mode: true
enforce-video-mode is not referenced in the driver - is it relevant?

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
> +		reg = <0>;
> +
> +		compatible = "samsung,s6e88a0-ams452ef01";
> +
> +		vdd3-supply = <&pm8916_l17>;
> +		vci-supply = <&reg_vlcd_vci>;
> +		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +	};
No tabs in yaml files. And fix indent so it matches.
Closing '}' below 'p' in ports.



> +
> +...
Drop - not needed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
