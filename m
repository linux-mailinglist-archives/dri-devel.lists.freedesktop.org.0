Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED740913BAE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 16:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B699610E28D;
	Sun, 23 Jun 2024 14:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uuXadO7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4FB10E224;
 Sun, 23 Jun 2024 14:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76CDFCE0E64;
 Sun, 23 Jun 2024 14:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64689C2BD10;
 Sun, 23 Jun 2024 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719152071;
 bh=xjdka5JZvEFGgzarOm9cAQZioJh64tIoUo72je+5ot4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uuXadO7VVLHCeIENQsM2AbK2+yTyF7axfkAhTw1lyaoBlyC2FL76eniJbuEo6xphC
 8cqnzR1x0dscspwAkeM+ZZ+VLDE50Z/+FCpzPYLvAghs5I/+ZtWBOvkUO/wM2Us2mq
 vvx+fPkfBKbg97yA2fTTwzJa7ZlWSjSeelDCzDVKGMMlnFT4YyFt+5EI7YY1JeIvNm
 g0780otXw7mA73ObVdxGISLI2APamFIH+FqP4cBDw1L+RB5/2o0fpX995azaPuILh+
 J58lgvTAVSqRGfiEGHFEccv8Brn1HPlB639mE4ZegYTIzWD6h/hzUIBaNm+vH39D3R
 Cj8gmmHE4AaRw==
Date: Sun, 23 Jun 2024 15:14:25 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: constrain clocks in
 top-level
Message-ID: <20240623-visa-alkaline-7f851211c89e@spud>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W+Y0q6x2brSSN8+B"
Content-Disposition: inline
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
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


--W+Y0q6x2brSSN8+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 02:00:24PM +0200, Krzysztof Kozlowski wrote:
> We expect each schema with variable number of clocks, to have the widest
> constrains in top-level "properties:".  This is more readable and also
> makes binding stricter, if there is no "if:then:" block for given
> variant.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--W+Y0q6x2brSSN8+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngtwQAKCRB4tDGHoIJi
0lh+AQD/zfWFp+H2OLeAtvkMdmdDHaYkkqAlbOU1YQsaYrQrRwEA4JhzzfmNtS8K
YeeeStRvNCLzuHfiWReqGTxHtxI85QA=
=5T/Z
-----END PGP SIGNATURE-----

--W+Y0q6x2brSSN8+B--
