Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08354915407
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3953B10E0D4;
	Mon, 24 Jun 2024 16:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kmZGrZJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD28F10E0D4;
 Mon, 24 Jun 2024 16:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEEE660DED;
 Mon, 24 Jun 2024 16:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1789C32782;
 Mon, 24 Jun 2024 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719246967;
 bh=rhi43mYbivbiigRrfEe9LZYb8Yg0etF+y/Zt+jX/zCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmZGrZJbheRYZVKt8pm2qJdAF3cyw+uSfuV40ByqGyiylQPh+JMusaZYNhYfZvyI8
 Q6x/tarop3KG27sB5On6OXDrjvPwPP0cCL+qRMQVXWSXpYU9ZbOR4z3AiVpp7hxAlG
 KH3GfMgdifHV7mdkZxyqfxPJjIlzpS3vqZXeJVL8l/YxPvGso/0xDgNcqISBuTod+3
 fKPELePlaHVMMYNpQQ29zmgQGo9om8zKNv4J+EyGyuEk8YUY6oWDfFtwQUeeA7Jbvs
 NEnZ9ePHKCmeh9B4iz5dtxtkiRg6S8lnrI0Z1+J9U2BgIGdExgx7IbPy5yV9UPphyK
 LMa1tBxNHTImQ==
Date: Mon, 24 Jun 2024 17:36:01 +0100
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Message-ID: <20240624-cascade-ankle-ffad3144087d@spud>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rejIecYv53akMJ/5"
Content-Disposition: inline
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
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


--rejIecYv53akMJ/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 23, 2024 at 10:02:59PM +0200, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. Add tags
> 2. New patches #3 and #4
> 3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
>    reg/reg-names per variant", because I need to investigate more.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--rejIecYv53akMJ/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmgcQAKCRB4tDGHoIJi
0tz/AQDFaPE1XkeikIQQErs5cvjtBoK0NNnaH1YeYd7w33Xf3gEA58wLtShSI/lr
84cUhMIjkzkgx1ykaLo2wkCRR7OtCA8=
=MpfR
-----END PGP SIGNATURE-----

--rejIecYv53akMJ/5--
