Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249546ACD62
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 19:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872310E42A;
	Mon,  6 Mar 2023 18:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392010E42A;
 Mon,  6 Mar 2023 18:59:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8EA761058;
 Mon,  6 Mar 2023 18:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D53FC433D2;
 Mon,  6 Mar 2023 18:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678129164;
 bh=RKFFV1IR8UjpXrXbhSm+33OxxfDK8SFhUxXEKBVJwIc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=GfVttMpS/dI2JLuswomdzv/r3ivGw3fgObyvOBPVm89UPT/Oj/LTlZ9GWvE6O+9qE
 l1hBRRj9rAzoi1Gyf9UPgteDLNIZVXvb8b9A8dcrxO6Qm3WhlLFeTgAqzGdnI8cAkz
 uZkYD7+QlMSZTZBrDdCC1o1XncFeAwM6BqYbxZyBT+duuOQARX2xufPt72ra5V/XwO
 p3L5yf5KobJqTue39z/Qxk3+Q1flD7KbUxYBF3xLmgh4C3+gvoKRuOU140xo8wqlxf
 zGo52h9uFwSNLnsySt80/onn5HC2OYXSazdEAUWljvOQuECK/0O6VX63qUeQnjDzFb
 yL6IF5agzZ8dA==
Message-ID: <3f3c8bd83ddaac760f25fde2681d3a61.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment '#'
From: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Mon, 06 Mar 2023 10:59:22 -0800
User-Agent: alot/0.10
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>, ead.org@freedesktop.org,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-media@vger.kernel.org, linux-phy@lists.infrad,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	linux-crypto@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Herring (2023-03-03 13:42:23)
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/D=
ocumentation/devicetree/bindings/clock/qcom,a53pll.yaml
> index 525ebaa93c85..64bfd0f5d4d0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> @@ -45,14 +45,14 @@ required:
>  additionalProperties: false
> =20
>  examples:
> -  #Example 1 - A53 PLL found on MSM8916 devices
> +  # Example 1 - A53 PLL found on MSM8916 devices
>    - |
>      a53pll: clock@b016000 {
>          compatible =3D "qcom,msm8916-a53pll";
>          reg =3D <0xb016000 0x40>;
>          #clock-cells =3D <0>;
>      };
> -  #Example 2 - A53 PLL found on IPQ6018 devices
> +  # Example 2 - A53 PLL found on IPQ6018 devices
>    - |
>      a53pll_ipq: clock-controller@b116000 {
>          compatible =3D "qcom,ipq6018-a53pll";
