Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AE939304
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 19:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4710E198;
	Mon, 22 Jul 2024 17:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dgbBZhd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F1010E198
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 17:14:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31F56CE0BA8;
 Mon, 22 Jul 2024 17:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C060C4AF0B;
 Mon, 22 Jul 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721668480;
 bh=akTvuO46cCs5mng8qNq8cLuPcf4oeMXDs7GmScD1zpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dgbBZhd5s+hFDMQDtHa9Uz3cOzWpBADGBOOAzUrhL2Q5tGxxbNZ59nAv2lypIcPaT
 Pr+hvfbczFPN1ARUXvlzXVG0ctTKHm2FoRh0AAzfn+Lb7+U24Tl/0K+SX1t2aODxKO
 VTEIGHWEFfRskfcjz4meItLcT3J63zhsiTZG+IsTbX0t0TvTgbDo0LwYxnuhcoXFUL
 0AVf7+eD7qDw3B8Dfi+CnqtMju7V6Sbra0/AprI5MXJuAprM+DmHQl8FBpylkNZgOn
 OEWJ1jyqAfJoGEBFvfsuWIoY3U33aeQqZd8IGfmYhrP00qnybs7mg/80nAQocgh9Qf
 FQYgdrF+hO86g==
Date: Mon, 22 Jul 2024 18:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
Message-ID: <20240722-motion-foil-104f604d5a13@spud>
References: <20240719185250.4877-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V9vvniDQvV/Z8ccx"
Content-Disposition: inline
In-Reply-To: <20240719185250.4877-1-robdclark@gmail.com>
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


--V9vvniDQvV/Z8ccx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:52:49AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--V9vvniDQvV/Z8ccx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp6TegAKCRB4tDGHoIJi
0vYIAP4mmnr4qyQqtWinmU8siSdHz0nK52o7wfkFFgc6QFMghwD+O1DPMyvHEdwD
3I4veSnBJYQsCErvbjw7xzcQkiB79w8=
=fR/H
-----END PGP SIGNATURE-----

--V9vvniDQvV/Z8ccx--
