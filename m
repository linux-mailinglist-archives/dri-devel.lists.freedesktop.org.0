Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D766088160C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2FE10E4BC;
	Wed, 20 Mar 2024 17:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CcN1K07l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FB810F384
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:04:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9319ECE0E42;
 Wed, 20 Mar 2024 17:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0F0C433F1;
 Wed, 20 Mar 2024 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710954255;
 bh=RqtX2Uov+cVDeo5FJe6SPhnsqgRm92ErkCH5C8fMcuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CcN1K07lbqcuv6SxlRFaF/r/FCyZyF7dah5XfZkbxZfdOA2G47QaZJ0wOEbL7dSbM
 +Ykvc7JYMR+UyGv0POXIjBvkrP+R169BgiLcvaQed6P9ENG7t3CqWUS9+6WCb6wifY
 jv5h765Itu8ALejabNMoAf4rpe4obDKyLcFnDeJXPq2L/Z8xk13W/QSiReWr42vVwp
 R7n0/9WfUAtKwWbjh1iGB5Am3FDqt6yGoHhQVMxE5kOx+rZAIyMHiZXDQBUPPyw3Y+
 MZKtQhn5lf44MMnjEi9/YsOhF5FA5ZCe1LWwAWIu6NEKV1+ch0ASjKChggnixYm6wM
 Yq6XbYdWisHEA==
Date: Wed, 20 Mar 2024 17:04:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: samsung,exynos5-dp: convert to
 DT Schema
Message-ID: <20240320-reanalyze-koala-4c086a24fee0@spud>
References: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nMjoPdMruxxpI5xO"
Content-Disposition: inline
In-Reply-To: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
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


--nMjoPdMruxxpI5xO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2024 at 07:28:55PM +0100, Krzysztof Kozlowski wrote:

> +  clock-names:
> +    items:
> +      - const: dp

> +  phy-names:
> +    items:
> +      - const: dp

The items lists here are redundant when you only have a single item, no?
Isnt it just
phy-names:
  const: dp
?

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--nMjoPdMruxxpI5xO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfsXCgAKCRB4tDGHoIJi
0l2NAP9TyOLHxFuOx/QWxt0vBNzUBke6gJ49JqaA6N7sGbZQ7QEAuMFkizybFMdo
8sKlXYG6AEuVT4QqR0/CuuBpzOwlaQg=
=oJhJ
-----END PGP SIGNATURE-----

--nMjoPdMruxxpI5xO--
