Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A0856A61
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676DD10EA07;
	Thu, 15 Feb 2024 17:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VmGmXp9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04510EA06;
 Thu, 15 Feb 2024 17:00:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 333FFCE27AA;
 Thu, 15 Feb 2024 17:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97159C43394;
 Thu, 15 Feb 2024 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708016436;
 bh=ICrWTbldjX975W3btYUWwVrChRkDG1H5ULl0Muhb6hM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmGmXp9h8/NmjOVvPq2UXmxKPbIo0y7BYxzGHZv6aadFtcdMuMdbnYUGmQlO913DH
 LTVHQayO6nKjrvBtRy6BurVGNcoq50fnejWw3RpSLVwNtS8vG7I5ZeC3dhzezTTvWj
 PtAfGth6k8UAVkcJof1FI/SJ+KQqZvejxnRQLyHepkvLDIrydcShyy37QCE6KdjkVP
 IOOa+lwQgp72wkcYr+MTeUxXwNS1uOfUMaf/KovpVvgPVTmGsNbIzZIGSpjclG4Sr+
 v6yr3ItVCPcBgyZI2j5Fo9KDpR2f8eDDK8ScCJbb9CL3PvQuNPBeygARTqQIjHAsAb
 kWcK15ViP1wvQ==
Date: Thu, 15 Feb 2024 17:00:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
Subject: Re: [PATCH v2 1/6] dt-bindings: display/msm/gmu: Document Adreno 750
 GMU
Message-ID: <20240215-trout-written-9ba8c929f9a5@spud>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-1-6be0b4bf2e09@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HZ+0T1NysZqNQ3hJ"
Content-Disposition: inline
In-Reply-To: <20240215-topic-sm8650-gpu-v2-1-6be0b4bf2e09@linaro.org>
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


--HZ+0T1NysZqNQ3hJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 10:20:23AM +0100, Neil Armstrong wrote:
> Document the Adreno 750 GMU found on the SM8650 platform.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gmu.yaml
> index 4e1c25b42908..b3837368a260 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -224,6 +224,7 @@ allOf:
>              enum:
>                - qcom,adreno-gmu-730.1
>                - qcom,adreno-gmu-740.1
> +              - qcom,adreno-gmu-750.1
>      then:
>        properties:
>          reg:
>=20
> --=20
> 2.34.1
>=20

--HZ+0T1NysZqNQ3hJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5DLQAKCRB4tDGHoIJi
0uvUAQCtCgC2eHupKQtPKFOnR5PFcNSjcf0kcLi4MhaYUVZEzgD/REr3WQUpQ8eD
moB3rhx2b3tSDbMaZ5ZNmayqfscT5QA=
=aBoj
-----END PGP SIGNATURE-----

--HZ+0T1NysZqNQ3hJ--
