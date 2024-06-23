Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F3913BA4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 16:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C5210E063;
	Sun, 23 Jun 2024 14:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cek9IP7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B5A10E053;
 Sun, 23 Jun 2024 14:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 70700CE0B3E;
 Sun, 23 Jun 2024 14:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841CBC2BD10;
 Sun, 23 Jun 2024 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719152039;
 bh=vBdi7Y+JsMuywpAhKODLZF5AlDKmn0t9bNsBl3+S104=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cek9IP7Xgn1QM9wB01Y3Yr0SqV4RbNSgLWMkpE6D17axquFUkuIkd8uSSMNXRHCHt
 fqI87GccXTIvpidLR3Z3b3nYZHgOq1K72shetjWPlynD8slLSx/voTnuqh97/jjVu6
 hwVO2rQC4KvOUTpAGk701A6DovOF+MobIfR7oTqNbqvL6x+PJ7meDazOrZWGkxb0ZT
 LdBD1bQ90SQMAR9KmPrG5QFSe8ehzHVH1k+USDA7uR+6MtuFDu7W7l335mPFtvH+vD
 E+PcJo6XpTSu3Pyd3S+RrrTj8VsJnQwJNAebpsREl5D9sXEGRVeHczW8EUkbj+Mjin
 qyLQRVZX/WD1A==
Date: Sun, 23 Jun 2024 15:13:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display/msm/gpu: constrain
 reg/reg-names per variant
Message-ID: <20240623-mule-plank-b63d0e3f3819@spud>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
 <20240623120026.44198-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EJYLbj7ym6Q16epL"
Content-Disposition: inline
In-Reply-To: <20240623120026.44198-3-krzysztof.kozlowski@linaro.org>
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


--EJYLbj7ym6Q16epL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 02:00:26PM +0200, Krzysztof Kozlowski wrote:
> MMIO address space is known per each variant of Adreno GPU, so we can
> constrain the reg/reg-names entries for each variant.  There is no DTS
> for A619, so that part is not accurate but could be corrected later.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml  | 87 +++++++++++++++++--
>  1 file changed, 79 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index baea1946c65d..e83f13123fc9 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -130,6 +130,22 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a=
-f][0-9a-f][0-9a-f][0-9a-f]$'

Does the regex "^qcom,adreno-[0-9a-f]{8}$" not work in dt-schema, rather
than this repeat-a-number-of-times-I-cannot-grok that's happening here?
(I know you probably just copied this from above in the file...)

--EJYLbj7ym6Q16epL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngtoQAKCRB4tDGHoIJi
0vseAP45JYysyf/QkbBti8k51VjLu7arXjS3WiUYbjteE5D4pwEA0cj4u0rfZtAB
y43jQ3wv5a6CjHyNWibOH5MhtfHEZwU=
=JM/k
-----END PGP SIGNATURE-----

--EJYLbj7ym6Q16epL--
