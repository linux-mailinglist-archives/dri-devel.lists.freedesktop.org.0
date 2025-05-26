Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198BAC416A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 16:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569CF10E344;
	Mon, 26 May 2025 14:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RYB2bOQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F4110E344
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 14:30:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EEF8544A9D;
 Mon, 26 May 2025 14:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843BAC4CEE7;
 Mon, 26 May 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748269798;
 bh=jXxtsHqy49HEr7W/9gJvil9hdu/xf25Qj4R61xruCPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RYB2bOQPnMVuzF+jZgA00OrAQt2+/HUjMP0htmSkX9GzBM4eXFhoy+ELlfBKH42Hf
 pPNONSpLStJLWsYFn7vDOLiBa/wF4oHXMRbG3468eJbYVtJNAb3ECQ/BbxK0Lv4LIj
 4q/EtuCYOea+8Aej0duZoN0hFYC7TfB7eSOyD9QGe00k9HXjGA3A1wL9eCsZZalY0b
 IJ0nIjuU8VG1lAvF51OgTxSFW7xRq1GOoPJymqA3b5jwVQfJYyvwgyEwZ26ZIdRA1e
 2faSDf1r2QuWETwbEMx6EnUr+Px4Q58QR7Yx1YAo0o5mbPWmNulcTO9xQbb3M4xgbZ
 3csA7JLDRukxA==
Date: Mon, 26 May 2025 15:29:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
Message-ID: <20250526-churn-survey-92e4ac835db3@spud>
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6ewRwsCC7aREqelS"
Content-Disposition: inline
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
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


--6ewRwsCC7aREqelS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 07:16:40AM +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraints, because binding must be specific in
> respect to hardware.  Add missing constraints to number of iommus in
> Mediatek media devices.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6ewRwsCC7aREqelS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDR64QAKCRB4tDGHoIJi
0vZWAP9BR4vLb8OlwsUrb+fCOvG9Bsq3De8bY4TqVlmsHnP9PAD+OVk4U34TmxkS
EV+BCTevs7Syc2H23i8NMl+1tSwmuAU=
=llAX
-----END PGP SIGNATURE-----

--6ewRwsCC7aREqelS--
