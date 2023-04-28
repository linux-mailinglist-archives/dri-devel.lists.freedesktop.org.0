Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5D6F11DE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 08:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92DB10EC59;
	Fri, 28 Apr 2023 06:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7DA10EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:43:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so52729745e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682664211; x=1685256211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31ZUiiLTP21TBfk/x6qc9G3WQJWlECoDzo5LSbdGdGw=;
 b=kFhjSdoq+UbCKEl0ne8AV/zQ34ktf7ne73V1ntaOjSvGFlRa+RDQ04sTJhEfxGOqw0
 IOwgYXIhEZZMw0KZiLbOl5qXW0axz89XEyJseEKqy4BCRRWKYx8ddUa3Ll0IF0gJesP1
 ai6TQ+WjiYq7iyIOQlB2uJnDS+1HwNnt3WcbKaIcKbXngiv0XvgcQBvrcTM5Nv2PHcag
 WyzHUcSDYbuEVm5CezCnrU1gFZ4FDJfTomk6kdTPl74pBVWxefXjoijRe5v5egeAWILC
 q0yRdQW1FXsvWaLJPP+sH6IO+X5aCpLX9oh9eu28gjv8wm3AJQJSnybZfJ+FP71JOP7a
 wYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682664211; x=1685256211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31ZUiiLTP21TBfk/x6qc9G3WQJWlECoDzo5LSbdGdGw=;
 b=Uedv/65QP0KjvLnhOVG2ZxUmVb9okSGXVSXCQpgOvZwjg7dlMO6bQkd2jbYGMbl7iz
 qSFS4E5mbt/e9VuasSMv1/lgn8IKONnr322NJiOWSM/IOHkPNJH2I70jn2bGtpw9H7q5
 m/SMpqgct4fok2tZQqR2yDjwxCS21Xl4Qi+4RZWmjPUycudzjKh9zMRJXLLfQXfy5pHo
 FH4ddIKbYy2wT+WUu8Q1aCCO68iu9jDMkBU9pFSwAFF/rfAN6n53EhlvcTgnFvsylsmk
 4r9eDcbcB9/dEcPPHbG7uouuwls1NEYnNSC/Jghg3tnyZZUn16peZN7XIjxoYIzlazDz
 5wBA==
X-Gm-Message-State: AC+VfDxY8wD1bVi7EH6vMKGkDyS9di35ZPI0NLLCBbbwFARgG2zRj3Ni
 WiYKJYiJ8U7nncVztY/wqmM=
X-Google-Smtp-Source: ACHHUZ50d/5tJ8AolUzgSXoZARfdohMiCwyMBJRoq23f6K3jb9jKjOTUg7edaVAqYsxzSeQdzfyLqQ==
X-Received: by 2002:a1c:cc0f:0:b0:3f1:718d:a21c with SMTP id
 h15-20020a1ccc0f000000b003f1718da21cmr3083738wmb.31.1682664211045; 
 Thu, 27 Apr 2023 23:43:31 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003f3270ddbd8sm795594wmg.37.2023.04.27.23.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 23:43:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v3 4/7] arm64: dts: allwinner: a64: reset pll-video0 rate
Date: Fri, 28 Apr 2023 08:43:29 +0200
Message-ID: <4477541.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230427091611.99044-5-me@crly.cz>
References: <20230427091611.99044-1-me@crly.cz>
 <20230427091611.99044-5-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, Roman Beranek <me@crly.cz>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne =C4=8Detrtek, 27. april 2023 ob 11:16:08 CEST je Roman Beranek napisal(=
a):
> With pll-mipi as its source clock, the exact rate to which TCON0's data
> clock can be set to is constrained by the current rate of pll-video0.
> Unless changed on a request of another consumer, the rate of pll-video0
> is left as inherited from the bootloader.
>=20
> The default rate on reset is 297 MHz, a value preferable to what it is
> later set to in u-boot (294 MHz). This happens unintentionally though,
> as u-boot, for the sake of simplicity, rounds the rate requested by DE2
> driver (297 MHz) to 6 MHz steps.
>=20
> Reset the PLL to its default rate of 297 MHz.

Why would that be preferable? You actually dropped "clk: sunxi-ng: a64:=20
propagate rate change from pll-mipi" patch which would take care for adjust=
ing=20
parent rate to correct value.

Best regards,
Jernej

>=20
> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> e6a194db420d..cfc60dce80b0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -667,6 +667,9 @@ ccu: clock@1c20000 {
>  			clock-names =3D "hosc", "losc";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
> +
> +			assigned-clocks =3D <&ccu CLK_PLL_VIDEO0>;
> +			assigned-clock-rates =3D <297000000>;
>  		};
>=20
>  		pio: pinctrl@1c20800 {




