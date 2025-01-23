Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FCA1A301
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7510E7E2;
	Thu, 23 Jan 2025 11:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UVUFfxh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D6510E7E2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:32:47 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30229d5b229so7452111fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737631966; x=1738236766; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+zMurHlZ7uGtqY8vr+C9le803uP9XgfHXwzvJheucbI=;
 b=UVUFfxh1Kq7O27eDUSAdssQ8Co0C967XLvoZFhl1dh7eiKYeYAeVRAJkrGCnSjd0pN
 Z9ykCNlFBL7Gy3U82npvmnOAjvh/2L0hMsw/Futqi3lbFt3o8BGYoqxfeAQegXXykcv4
 rXQQZGti7JUCW2OACXHIq4eTWNw4bMNKeK26neD7p7hF/AaUS0S0nuGngmJTLlPGkW6a
 RyT3/9OY7rM6QafA2fXg3oXvnCsyeUrgRsll4JSqQZRS1MV7fI06OXImaSMtF7Tm+XEP
 QeMyAaDLC1CgRuicZN4Hp/L27gd0Gy4TOD9Oe1HJvFOLekX/ST3U8TZPvBtQJ+6kM6HR
 KUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631966; x=1738236766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zMurHlZ7uGtqY8vr+C9le803uP9XgfHXwzvJheucbI=;
 b=NKJYhNK4O98eV7mysRrwKSaxAFddDw4Dcav/o03riCIradGZPpCoCen1afaDE/JcWz
 VHjbYC4DQFO/U7LzizxVcSILH9eZBR2ljnMjKhueDCf6sJlfzoY86rmLUawoXj9txc9n
 eR2p8EPHOVFgl05Dzl5r1dZTEwxvzsaVWOFqT1Hop2WkMeUvr+eYhSPxTyxrS3wE6skq
 /MXOUM7d2wslRwebJUfewKWCGQtuC1CC5PUydUJR9kGzF96QGUDQJoGrbjHPfEGKUKod
 E6FPjrLDKikF5EhGwcSN+Rr1UDayGbri5hIJfXvDhhRshMGH4ofbzt4Nbyp7nJmPtZOP
 ep5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfG2SzrjH5MHeVOxOOZI4kPqzxTtxVy5a77taK1pReRJaYkJXVOfM2Gk1gltCJaGcmicCv8psYl0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfeJK5EaPGLNutQuYaFaJ8R8b5J6czraqbA+jllQd8Gu+Qgprd
 oU8NjvbeJQ7d9ifFArWeTwRFiuFxxXRzL7taMDcGFs5cXZudMP6XYLY09BrJRbI=
X-Gm-Gg: ASbGncv0vbVbXRkVyD+pDaa5k0vaiVmK/Rdokzx4DrKTa5KJA9msawWtKkbl4NpTfLS
 O8rlKnc0R+AW95yB9dGgtuU7M40GrFvkFGm9Ro1FiFja6yafDvIFQajWXWT3qM3cef9vnBCxP1j
 4EnDc4No0fK3Czie+Lr3aZKAFyHRUu32zbBSoPi8riFlVB3dHlBGfQrgNogIVQI8EreX75jeFWY
 k1Z84uXekZcDYkF6P9xyqS1/mxl6cB/KkTNLcTXsbHY5nTDhrvGxdMb1d5nBsvp3Vpkn8vV5lWq
 UQhO2MYPpoP4/TpgjD0YyjF6Do03ujsi/RIUkymifyKtjukssP5ww4kL2as4
X-Google-Smtp-Source: AGHT+IGv3eRW1iX8AGSWOKHG3VFmFTMTVFcrPCnNhNO4BTbpmlhnROuDMhCvalg4dPHCeDzpS5d6Ng==
X-Received: by 2002:a2e:b90d:0:b0:304:4cec:29f9 with SMTP id
 38308e7fff4ca-3072ca60ef9mr67919831fa.3.1737631966038; 
 Thu, 23 Jan 2025 03:32:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm30489481fa.3.2025.01.23.03.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:32:44 -0800 (PST)
Date: Thu, 23 Jan 2025 13:32:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 14/14] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
Message-ID: <u3qiasthay5xrtu4bfu5ihag7x2wajrpbktrcs7bxutvc2iwrk@on5ymtwq5vwx>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-15-damon.ding@rock-chips.com>
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

On Thu, Jan 23, 2025 at 06:07:47PM +0800, Damon Ding wrote:
> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
> - Set pinctrl of pwm12 for backlight
> - Enable edp0/hdptxphy0/vp2
> - Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL
> - Add aux-bus/panel nodes
> 
> For RK3588, the PLL_V0PLL is specifically designed for the VOP2. This
> means the clock rate of PLL_V0PLL can be adjusted according to the dclk
> rate of relevant VP. It is typically assigned as the dclk source of a
> specific VP when the clock of relevant display mode is unusual, such as
> the eDP panel 'lg,lp079qx1-sp0v' paired with RK3588S EVB1, which has a
> clock rate of 202.02MHz.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Remove brightness-levels and default-brightness-level properties in
>   backlight node.
> - Add the detail DT changes to commit message.
> 
> Changes in v3:
> - Use aux-bus instead of platform bus for edp-panel.
> 
> Changes in v4:
> - Add comments related to the use of panel compatible "lg,lp079qx1-sp0v"
>   in the commit message.
> 
> Changes in v5:
> - Use "edp-panel" instead of "lg,lp079qx1-sp0v"
> - Remove unnecessary comments in commit message
> - Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL
> 
> Changes in v6:
> - Add PLL_V0PLL related descriptions in commit message
> ---
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> index bc4077575beb..a8c151b41e21 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "rk3588s.dtsi"
>  
> @@ -238,6 +239,41 @@ &combphy2_psu {
>  	status = "okay";
>  };
>  
> +&edp0 {
> +	force-hpd;

Why? Please mention the reason in the commit message.

> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			backlight = <&backlight>;
> +			power-supply = <&vcc3v3_lcd_edp>;
> +
> +			port {
> +				panel_in_edp: endpoint {
> +					remote-endpoint = <&edp_out_panel>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&edp0_in {
> +	edp0_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_edp0>;
> +	};
> +};
> +
> +&edp0_out {
> +	edp_out_panel: endpoint {
> +		remote-endpoint = <&panel_in_edp>;
> +	};
> +};
> +
> +&hdptxphy0 {
> +	status = "okay";
> +};
> +
>  &i2c3 {
>  	status = "okay";
>  
> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
>  };
>  
>  &pwm12 {
> +	pinctrl-0 = <&pwm12m1_pins>;
>  	status = "okay";
>  };
>  
> @@ -1168,3 +1205,20 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
>  		};
>  	};
>  };
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vop {
> +	assigned-clocks = <&cru DCLK_VOP2_SRC>;
> +	assigned-clock-parents = <&cru PLL_V0PLL>;
> +	status = "okay";
> +};
> +
> +&vp2 {
> +	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
> +		reg = <ROCKCHIP_VOP2_EP_EDP0>;
> +		remote-endpoint = <&edp0_in_vp2>;
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
