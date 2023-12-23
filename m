Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37481D460
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 14:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2310E0DE;
	Sat, 23 Dec 2023 13:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id C7F2210E0DE
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1703339976; bh=6Xv3jIezLLrGsPqesJGGEmcdDlVoYdKAL1CcLWN2x+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e84tp7Gj3gga8cNmaXGRKwtVXr6tILWml91YIF4LTDDeiRWLFo+wFeJFiuAPwSnGC
 NG0U0VAbnPGRG9qgB7ZNhXW/+QKvpAbRXhvNHZqW2Fh3RsWlpUhboeJYezwOJ60tBO
 JFJQFuEztp+0a/cCK9auofz755xb17UQwc4+aWr4KdGpZ/dA49F/eE+XsnN8guLX6h
 33H++c/MqcUubrBvpZQw4VaQyb5Pa+pr2yC0Xv/Wmfwtxu8dGvxLY3vRRT7k7s/2u8
 HVHOeqrD1LA4iYCqaCbeBvncELNpnzRB0wb8Yj2ROv5BzH6sDSmh/Y5JxzHEH7aiwI
 Yf8et5MQEJ/rw==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id B748E3718AE;
 Sat, 23 Dec 2023 14:59:35 +0100 (CET)
Date: Sat, 23 Dec 2023 14:59:34 +0100
From: Manuel Traut <manut@mecka.net>
To: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Add devicetree for Pine64
 Pinetab2
Message-ID: <ZYbnxkkCIJtzqa0h@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <20231222-pinetab2-v1-4-e148a7f61bd1@mecka.net>
 <2121710.IWpXjAX0fk@bagend>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2121710.IWpXjAX0fk@bagend>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Segfault <awarnecke002@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mark Yao <markyao0591@gmail.com>, Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Diederik,

On Fri, Dec 22, 2023 at 06:01:54PM +0100, Diederik de Haas wrote:
> On Friday, 22 December 2023 12:05:44 CET Manuel Traut wrote:
> > +
> > +&cru {
> > +       assigned-clocks = <&cru PLL_GPLL>, <&pmucru PLL_PPLL>, <&cru
> > PLL_VPLL>; +       assigned-clock-rates = <1200000000>, <200000000>,
> > <500000000>; +};
> 
> Attachment seem to work and for this I also have the attached patch in my 
> patch set.
> IIRC without it you get an error in dmesg immediately at boot up which is 
> visible on the PT2 *if* you have immediate visual output (which is not (yet?) 
> the case in my image/kernel).

you can see the message also by calling "dmesg --level err".
I could verify that your patch removes the error message.
I will pick the change for v2.

> Cheers,
>   Diederik

> From d782a64f3b51ffb2f33d3ba3e11e2ebc416542e3 Mon Sep 17 00:00:00 2001
> From: Jonas Karlman <jonas@kwiboo.se>
> Date: Thu, 17 Aug 2023 17:52:47 +0200
> Subject: [PATCH 6/8] arm64: dts: rk3566-pinetab2: Fix cru assigned clocks
> 
> Jonas Karlman provided/linked to the patch on IRC.
> Seems related to upstream commit 64b69474edf3b885c19a89bb165f978ba1b4be00.
> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> Link: https://github.com/Kwiboo/u-boot-rockchip/blob/rk3568-2023.10/arch/arm/dts/rk3566-pinetab2-u-boot.dtsi#L11-L15
> Link: https://lore.kernel.org/all/20230110225547.1563119-2-jonas@kwiboo.se/
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
> index bbd7ed53602a..4a5bee5a28a7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
> @@ -288,8 +288,9 @@ &cpu3 {
>  };
>  
>  &cru {
> -	assigned-clocks = <&cru PLL_GPLL>, <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
> -	assigned-clock-rates = <1200000000>, <200000000>, <500000000>;
> +	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>, <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
> +	assigned-clock-rates = <32768>, <1200000000>, <200000000>, <500000000>;
> +	assigned-clock-parents = <&pmucru CLK_RTC32K_FRAC>;
>  };
>  
>  &csi_dphy {
> -- 
> 2.42.0
> 



