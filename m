Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075568B260E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 18:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729D311A5C4;
	Thu, 25 Apr 2024 16:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j9jx071Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164A811A5C6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 16:11:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E300F61E25;
 Thu, 25 Apr 2024 16:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABE8C113CC;
 Thu, 25 Apr 2024 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714061496;
 bh=ho12mLf87MAZYvf64xJHQvB9LOeFouGnTfDbUPjBnlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j9jx071QsFWrW3XHntMLgzQJpPLY6JtJxBxjwcMn3XrjyxGciv8cAY3zY7azsgZF8
 OZAubVoWj+tHQxw7TilPa1OGCxI4t+STVuEOVn4QYOYfEfszslIkEcGSzj81xGCbhY
 g1RFk1oqlxhXZBtYDu68IODgvXXTc21m0MgRk3rReFOxi/ptErGI8XnNfIXRiVUY04
 kcKRBSHkVfjNcgnC2fcjpSkOCycEIt1JGGxd38cIluYciDBAdztxnhSpl0BPuXd3GO
 lsdAPpgXvvCZEV03auyx5q+1dL3mKJtCCDsTsomA7nkWnat1g+z6bdfd6lhbpJjWuA
 vr3IbtzSMPUJQ==
Date: Thu, 25 Apr 2024 11:11:34 -0500
From: Rob Herring <robh@kernel.org>
To: Xilin Wu <wuxilin123@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: display: panel: Add Synaptics TD4328
Message-ID: <20240425161134.GA2695912-robh@kernel.org>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-3-e0aa05c991fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424-ayn-odin2-initial-v1-3-e0aa05c991fd@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 24, 2024 at 11:29:08PM +0800, Xilin Wu wrote:
> Synaptics TD4328 is a display driver IC used to drive LCD DSI panels.
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
>  .../bindings/display/panel/synaptics,td4328.yaml   | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4328.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4328.yaml
> new file mode 100644
> index 000000000000..216f2fb22b88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4328.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,td4328.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TD4328-based DSI display panels
> +
> +maintainers:
> +  - Xilin Wu <wuxilin123@gmail.com>
> +
> +description:
> +  The Synaptics TD4328 is a generic DSI Panel IC used to control
> +  LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: syna,td4328

You need a compatible specific to a panel. This can be a fallback 
though.

> +
> +  vdd-supply:
> +    description: Digital voltage rail
> +
> +  vddio-supply:
> +    description: Digital I/O voltage rail
> +
> +  reg: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vdd-supply
> +  - vddio-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "syna,td4328";
> +            reg = <0>;
> +
> +            backlight = <&backlight>;
> +            reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +            vdd-supply = <&vdd_lcm_2p8>;
> +            vddio-supply = <&vreg_l12b_1p8>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.44.0
> 
