Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986C9C5526
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 12:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E759610E5B1;
	Tue, 12 Nov 2024 11:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="3+fZvTfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE60F10E5B1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=YtxLTw5kSIDpnwlLunhMSE644mddKUogsO/CKyTzGwA=; b=3+fZvTfhSVJE3s4JsNShU4N2y3
 so/a28xas0WQ9ryvVJbX+rNj6JddLE1ZzskYhWOpBnvYESPLCUyIHb+JD6sAywKt3yOhJnVahXMpP
 KsxD19SOH9sTQRXiKxeRcytmwGEkF+hl5MIpe3v8PH/yfVyIvw/E/WxJfjVm5Ct9KDgDOrfnCaI2I
 VCf1CFpWVeytn289y6o6rTw9OQXBxj43vfWByd/EZwMC56QtEY+iAU+sbtU2lN9QwAg+UTA1w6icY
 sUKhKlvPJyJ+m64r2VW+yNhMSWjTESmj94gNrbGtvylugNn4TcyY8P4aesKrW9GygMOSAQnBZqrWJ
 2REeeEFA==;
Date: Tue, 12 Nov 2024 12:00:20 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 08/10] ARM: dts: ti: omap: samsung-espresso7: Add
 initial support for Galaxy Tab 2 7.0
Message-ID: <20241112120020.7f9e0680@akair>
In-Reply-To: <20241108200440.7562-9-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-9-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Mithil,

Am Fri,  8 Nov 2024 20:04:37 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> Create a device tree for the 7 inch variants (P3100, P3110, P3113)
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
> new file mode 100644
> index 000000000..be3d7a82f
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/dts-v1/;
> +
> +#include "omap4-samsung-espresso-common.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy Tab 2 (7 inch)";
> +	compatible = "samsung,espresso7", "ti,omap4430", "ti,omap4";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&backlight_pins>;
> +		pwms = <&pwm10 0 1200 0>;
> +		power-supply = <&reg_lcd>;
> +		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <2>;
> +	};
> +
> +	panel {
> +		compatible = "samsung,ltn070nl01", "panel-lvds";
> +		power-supply = <&reg_lcd>;
> +		width-mm = <154>;
> +		height-mm = <90>;
> +		data-mapping = "vesa-24";
> +		backlight = <&backlight>;
> +
> +		panel-timing {
> +			clock-frequency = <47255554>;
> +
> +			hback-porch = <210>;
> +			hactive = <1024>;
> +			hfront-porch = <186>;
> +			hsync-len = <50>;
> +
> +			vback-porch = <11>;
> +			vactive = <600>;
> +			vfront-porch = <24>;
> +			vsync-len = <10>;
> +
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			de-active = <1>;
> +			pixelclk-active = <1>;
> +			syncclk-active = <0>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&bridge_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen@48 {
> +		compatible = "melfas,mms136";
> +		reg = <0x48>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x = <1023>;

Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
horizontal resolution of touchscreen (maximum x coordinate reported + 1)

So this touchscreen reports max 1022?

> +		touchscreen-size-y = <599>;

same question.

Regards,
Andreas
