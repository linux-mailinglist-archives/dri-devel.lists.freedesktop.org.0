Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E26844138
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6082710FA3F;
	Wed, 31 Jan 2024 14:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616310FA3F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FF16617A7;
 Wed, 31 Jan 2024 13:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3262FC43142;
 Wed, 31 Jan 2024 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706709597;
 bh=cX2K5w9GWrdNEUyfrUG6IelYh8NLqv5j8lI66oywVPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4QN5TZCtY7/sLO9kwHjCm1yV84yTjejctGfEctgi6U1G8d+B+ls+W+CURrrZMweO
 Xg3My6YVDAGTjBxtTIHoPpI8b0HPctgJgxXU0JvN7qnIOpZSKVWDtLmfZT9CAPjJ8w
 IuGiaX3U/9QbPXiXpDiHg1MEPxXne9lHEFvg27Iv0sv1SRydlUDYUH1fZ8OHrZk3g+
 nbr+GxJRgv9cJ9uosjPtuhNnPAy1fCXo4m1pmBZzQuS9TWL2yes3WVMQI/79OLEM++
 mROaw2KnRrEDPKuHV6XGdjVhUxAUaIaxjuxeAHk1UkWZ52NSWx8itb9pL/CFeXdUEP
 TuyrF7Y/oXPyA==
Date: Wed, 31 Jan 2024 07:59:55 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 2/6] dt-bindings: display: rockchip,dw-hdmi: add
 power-domains property
Message-ID: <20240131135955.GA966672-robh@kernel.org>
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
 <1ba8b40d-005a-4665-afd9-a4eacf3e3031@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba8b40d-005a-4665-afd9-a4eacf3e3031@gmail.com>
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
Cc: daniel@ffwll.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 tzimmermann@suse.de, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, andy.yan@rock-chips.com,
 markyao0591@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 03:57:23PM +0100, Johan Jonker wrote:
> Most Rockchip hdmi nodes are part of a power domain.
> Add a power-domains property. Fix example.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index cd0a42f35f24..6f421740b613 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -94,6 +94,9 @@ properties:
>        - const: default
>        - const: unwedge
> 
> +  power-domains:
> +    maxItems: 1
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> 
> @@ -141,16 +144,18 @@ examples:
>      #include <dt-bindings/clock/rk3288-cru.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3288-power.h>
> 
>      hdmi: hdmi@ff980000 {
>          compatible = "rockchip,rk3288-dw-hdmi";
>          reg = <0xff980000 0x20000>;
> -        reg-io-width = <4>;

It makes more sense to keep reg-io-width together with reg.

> -        ddc-i2c-bus = <&i2c5>;
> -        rockchip,grf = <&grf>;
>          interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
>          clock-names = "iahb", "isfr";
> +        ddc-i2c-bus = <&i2c5>;
> +        power-domains = <&power RK3288_PD_VIO>;
> +        reg-io-width = <4>;
> +        rockchip,grf = <&grf>;
> 
>          ports {
>              #address-cells = <1>;
> --
> 2.39.2
> 
