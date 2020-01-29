Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6914D0C9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 19:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5A6E406;
	Wed, 29 Jan 2020 18:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4AC6E406
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 18:59:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7C1EA20080;
 Wed, 29 Jan 2020 19:59:16 +0100 (CET)
Date: Wed, 29 Jan 2020 19:59:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: michael.srba@seznam.cz
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Message-ID: <20200129185915.GD25273@ravnborg.org>
References: <20200126183911.17090-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200126183911.17090-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=PAS-ew-9kLfG7pzAJC4A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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

On Sun, Jan 26, 2020 at 07:39:10PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
> use of their S6E88A0 controller.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
New bindings files for panels must be in DT schema format (.yaml).

Please see other bindings as examples.
Your example uses GPIO_ACTIVE_HIGH, so rememeber to include the
relevant header file in your example to get the definition.

	Sam

> ---
>  .../panel/samsung,s6e88a0-ams452ef01.txt      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
> new file mode 100644
> index 000000000000..2dcf9580febd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
> @@ -0,0 +1,26 @@
> +Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode controller.
> +
> +Required properties:
> +  - compatible: "samsung,s6e88a0-ams452ef01"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [1]. This
> +node should describe panel's video bus.
> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	panel@0 {
> +		reg = <0>;
> +
> +		compatible = "samsung,s6e88a0-ams452ef01";
> +
> +		vdd3-supply = <&pm8916_l17>;
> +		vci-supply = <&reg_vlcd_vci>;
> +		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +	};
> -- 
> 2.24.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
