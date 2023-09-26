Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C14E7AED59
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC90B10E3D1;
	Tue, 26 Sep 2023 12:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8291A10E3D0;
 Tue, 26 Sep 2023 12:56:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9FBDCE138C;
 Tue, 26 Sep 2023 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D568C433C8;
 Tue, 26 Sep 2023 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695732985;
 bh=DkboLss2t1a5JtYCh172h81RMP48iGgistWARFrFkWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MbdWM83JQwKefVUx2T9uRoC5zW6mv9Iux8XOuxN/0MByxiAy8EtIhDK7yTj/LDs/y
 7OfFuJrHJFFvr40qX2RjF2LwzCLenKrxarBApDsZLJd0OzWEPlOih9XDLGoZEakwZ2
 ziNmOMOWYofd4pSdGww4YVWBGcAsOovQZjTVx9dhsZk7DODFQjnvXewfmI8F5AlkzC
 BXWzHs8T+ZTq8PGBo5FLXcxdWJ+6DQBl4qbRQ7jayrFnsTROl+jAVnzl16XGTlt9zY
 DfbYq9ADUgz6TCsF/0j7R5JfMjyEj73xzw878bV2R4/BEO6eyV42JhNn4YgY0nFzRx
 Xb11gybOOT1sw==
Date: Tue, 26 Sep 2023 13:56:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: msm: Add missing
 unevaluatedProperties on child node schemas
Message-ID: <20230926-chemo-autopilot-b9323784886a@spud>
References: <20230925212434.1972368-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W4wHTtiqSi8PKbBJ"
Content-Disposition: inline
In-Reply-To: <20230925212434.1972368-1-robh@kernel.org>
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
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--W4wHTtiqSi8PKbBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 04:24:24PM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f12558960cd8..dbe398f84ffb 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -114,6 +114,7 @@ properties:
> =20
>        port@1:
>          $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description: Output endpoint of the controller
>          properties:
>            endpoint:
> --=20
> 2.40.1
>=20

--W4wHTtiqSi8PKbBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRLU8wAKCRB4tDGHoIJi
0siFAQCPIJw0ImQkf/uczQd3qHyCH5x7Fpe36rqmG+BfDzkraQD9FTGjRiM9TQXb
q+Q5fUiiaZa7v9r6fe0HMjHSzIRytws=
=k8M0
-----END PGP SIGNATURE-----

--W4wHTtiqSi8PKbBJ--
