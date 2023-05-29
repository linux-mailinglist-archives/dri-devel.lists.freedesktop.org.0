Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E0714F58
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 20:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9634310E2D8;
	Mon, 29 May 2023 18:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9586310E2D8;
 Mon, 29 May 2023 18:22:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A52860B65;
 Mon, 29 May 2023 18:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8170DC433D2;
 Mon, 29 May 2023 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685384542;
 bh=oCMX/Geu63rceF98CJ4hQyNEh8roIyS9yo/tz8IHJuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ilh+jWqCoBaVa6PXTgaflF1MN1eQX6Ro1ekApfU2/9nYgdf0ImtiEGMHPkee4JDcz
 jsBHaLxgISpJFp010BZFPG+5zJjsjjf7phcPMrP79szhjgxiLoNTSMT3RQ4km6iCcz
 mEYUEtKZatnlgOMOMlEasG2QxbNDAwuaW91x/Kl57ooXbG0RNobfEpoVq/jrAHWmDr
 NcsxWz45vF0fpYXCL1EJ0Ah89NtOIqktL5mxXv3HF16Ezqx81yTu/Ywzx9fxCfdPQ2
 DT5n0iT17ldfHlRBF1QrclTHBmetTLu1NQ89Kwu2mrzFkj03tT+K4kQjS0HBNoy4AU
 f9o0ktwOhwmKw==
Date: Mon, 29 May 2023 19:22:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi-phy-28nm: Document msm8226
 compatible
Message-ID: <20230529-encircle-cherub-374102ca43d4@spud>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-1-679f335d3d5b@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UyjEm4CeDHfnthCw"
Content-Disposition: inline
In-Reply-To: <20230308-msm8226-mdp-v1-1-679f335d3d5b@z3ntu.xyz>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UyjEm4CeDHfnthCw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 11:43:58AM +0200, Luca Weiss wrote:
> The MSM8226 SoC uses a slightly different 28nm dsi phy. Add a new
> compatible for it.
>=20
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml | 1 +
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml    | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index cf4a338c4661..bd70c3873ca9 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -18,6 +18,7 @@ properties:
>        - qcom,dsi-phy-28nm-hpm
>        - qcom,dsi-phy-28nm-hpm-fam-b
>        - qcom,dsi-phy-28nm-lp
> +      - qcom,dsi-phy-28nm-8226

How come the order is different in both places?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>        - qcom,dsi-phy-28nm-8960
> =20
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml=
 b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index b0100105e428..db9f07c6142d 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -125,6 +125,7 @@ patternProperties:
>            - qcom,dsi-phy-14nm-660
>            - qcom,dsi-phy-14nm-8953
>            - qcom,dsi-phy-20nm
> +          - qcom,dsi-phy-28nm-8226
>            - qcom,dsi-phy-28nm-hpm
>            - qcom,dsi-phy-28nm-lp
>            - qcom,hdmi-phy-8084
>=20
> --=20
> 2.40.1
>=20

--UyjEm4CeDHfnthCw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTtVwAKCRB4tDGHoIJi
0nvKAQDbhG5jqoLQjbATFU8ogWNuoWFeY5pQPfj1a1MKxd++VAD/fQ/wznbK/2Ma
4WV5Mn40WKJywRLn/w7MU15yVh9TGgk=
=M/da
-----END PGP SIGNATURE-----

--UyjEm4CeDHfnthCw--
