Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0FB913BA8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 16:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7760F10E191;
	Sun, 23 Jun 2024 14:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hq/IuCXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9FE10E1A9;
 Sun, 23 Jun 2024 14:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A290A623B9;
 Sun, 23 Jun 2024 14:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C25C2BD10;
 Sun, 23 Jun 2024 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719152056;
 bh=WJBNwHQvEUGQpwl3kDlWJ2d83DTNW3enLMCdUvVtsy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hq/IuCXpW5wqZEJQpx//85tpCu+qsG96W0RCEcuRjzOI2nuXSki2VDBviMtQCHp89
 wcYAoGJ4PJqEcvokjN8kmrXZnNx9Bplp885EGKELtLgLcxbgbdGzkEJvgGSiMzvx26
 B5jYM84RNXEl6Ae0WiaJ8Du/bPUN8nZmZlt8HTko7XTA88CtzzzdggS2KGMM8E0cuH
 aX058iIkzLR8uSf/BGWrqXkfPZRnE05qiy3WKGbt+0kzP5wIfeJtPcS5IhOLzXllMt
 zPWTwAMbgkz/vxoOkZwGlUlUb6duXHLjoEGH0WpuQhVq4/wCZo3oNU30h1FJnou7sZ
 3c1WVA/lPzu8w==
Date: Sun, 23 Jun 2024 15:14:10 +0100
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
Subject: Re: [PATCH 2/3] dt-bindings: display/msm/gpu: define reg-names in
 top-level
Message-ID: <20240623-flagship-pacifism-4fcc3c530617@spud>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
 <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6NMFsyziRLC3bhgw"
Content-Disposition: inline
In-Reply-To: <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>
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


--6NMFsyziRLC3bhgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 02:00:25PM +0200, Krzysztof Kozlowski wrote:
> All devices should (and actually do) have same order of entries, if
> possible.  That's the case for reg/reg-names, so define the reg-names in
> top-level to enforce that.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6NMFsyziRLC3bhgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngtsgAKCRB4tDGHoIJi
0oB9AQC3CyqV6LDWFtHWKMhnFdgK2R1RztyQ5W6CooMH4EJ22AD/SRq7QsBl/kzK
4ZfJERst4+knhGKAUDRIAbGJXljzPwM=
=EHls
-----END PGP SIGNATURE-----

--6NMFsyziRLC3bhgw--
