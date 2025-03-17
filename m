Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C3A646D9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3810E3D4;
	Mon, 17 Mar 2025 09:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eedTo345";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54910E3D2;
 Mon, 17 Mar 2025 09:17:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 288BC5C02FC;
 Mon, 17 Mar 2025 09:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D3FC4CEE3;
 Mon, 17 Mar 2025 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742203069;
 bh=C2lOHjL4PYNa3dMu5IqZyg4fIoUD4zdvKW2CVrc01GQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eedTo345fnkHS0qGxBrQ+6/7yc2f4Lwchy2L/9NfPq0rjnbPlNDm95uoX20SdEm/o
 YzuwoVFEMxFUG4I+3w059H172FvscGP45E1oxFgGfxH7KjbIHkCFFjXKYMr/+HdEop
 k4kdXGjfgJfP5i957SF4mo2PitqfRk9CdiYV5HzYAu1C5X1drgtMlur+esR0wTFtxi
 x/ONi8SIi1VFyAt06cJapA60603S+ngsc18R3Pe0fRRHTnZYCoohP+S7WQufjQ3l23
 L/I4cj1f7OT2YND6Cjmazylp5RlmFL39wKyOFtFRB9Wk34Lk7NXkiZ27+pnwlk52QE
 o+nR7QAOl9WuQ==
Date: Mon, 17 Mar 2025 10:17:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller
Message-ID: <20250317-hot-obedient-sturgeon-394cb8@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-1-1f132e870a49@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250315-msm8937-v4-1-1f132e870a49@mainlining.org>
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

On Sat, Mar 15, 2025 at 03:57:35PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add device tree bindings for the global clock controller on Qualcomm
> MSM8937 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/clock/qcom,gcc-msm8937.yaml           | 75 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
>  2 files changed, 92 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3c3f6756048e195671f542b3a=
6cd09057558eafa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8937.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on MSM8937
> +
> +maintainers:
> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and p=
ower
> +  domains on MSM8937.

This is exactly like msm8953, so why it cannot be there?

> +
> +  See also::
> +    include/dt-bindings/clock/qcom,gcc-msm8917.h

typo, 8937

> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-msm8937
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +      - description: DSI phy instance 0 dsi clock
> +      - description: DSI phy instance 0 byte clock
> +      - description: DSI phy instance 1 dsi clock
> +      - description: DSI phy instance 1 byte clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +      - const: dsi0pll
> +      - const: dsi0pllbyte
> +      - const: dsi1pll
> +      - const: dsi1pllbyte
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#power-domain-cells'
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +    clock-controller@1800000 {
> +      compatible =3D "qcom,gcc-msm8937";
> +      reg =3D <0x01800000 0x80000>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +      #power-domain-cells =3D <1>;
> +      clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&sleep_clk>,
> +               <&dsi0_phy 1>,
> +               <&dsi0_phy 0>,
> +               <&dsi1_phy 1>,
> +               <&dsi1_phy 0>;
> +      clock-names =3D "xo",
> +                    "sleep_clk",
> +                    "dsi0pll",
> +                    "dsi0pllbyte",
> +                    "dsi1pll",
> +                    "dsi1pllbyte";
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bi=
ndings/clock/qcom,gcc-msm8917.h
> index 4b421e7414b50bef2e2400f868ae5b7212a427bb..ec1f0b261dd5ccfe4896a00ff=
a9cf86de98b9cb3 100644
> --- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
> @@ -170,6 +170,22 @@
>  #define VFE1_CLK_SRC				163
>  #define VSYNC_CLK_SRC				164
>  #define GPLL0_SLEEP_CLK_SRC			165
> +#define BLSP1_QUP1_I2C_APPS_CLK_SRC		166
> +#define BLSP1_QUP1_SPI_APPS_CLK_SRC		167
> +#define BLSP2_QUP4_I2C_APPS_CLK_SRC		168
> +#define BLSP2_QUP4_SPI_APPS_CLK_SRC		169

Why are you adding bindings to 8917? Nothing in commit msg explains
that.

Best regards,
Krzysztof

