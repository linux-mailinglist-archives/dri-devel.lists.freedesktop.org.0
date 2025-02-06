Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98267A2B008
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CC510E8FB;
	Thu,  6 Feb 2025 18:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fzf4Oc6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14FD10E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:14:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8790A5C0CB4;
 Thu,  6 Feb 2025 18:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B317C4CEDD;
 Thu,  6 Feb 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738865650;
 bh=dy+DMOoMSDp0jcd2rmqCEWg/B4n87lTgMHpZiZiqrEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fzf4Oc6E5RNr689O2kugtZAGZ6ttSzviLz94XRVlA8tVfLOojh8PCAZil0o57K0U+
 wI46mvw3mDuOA6QABSys86j56ntUfeJo2WWZ/LU5Z/hE+5aM7S8VNWbfDcsv2E9V4T
 52JuW2v2xlIXSDdQ8BH2LlXzRAruzJOfVVoidv5sAoE7sLDBWKqy33k46C65aA+Mws
 7FlDXzlaTiyrJX2rwtySpfvHzz54SIhcNVIrGa0zd4U6vx1ZnXRVEm9DkTbvEEk2tO
 S9rSfT5djBrxAzc6id2kUt8lZXDMp9EQXyPKIICfUEjogi0CooJNrnoyUsqY5D0PrA
 FraEjYVOpLaHQ==
Date: Thu, 6 Feb 2025 18:14:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
Message-ID: <20250206-uselessly-riverbank-14c097e62ae2@spud>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wll5mPIV/lTSeNrB"
Content-Disposition: inline
In-Reply-To: <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
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


--wll5mPIV/lTSeNrB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 09:12:59PM +0800, Langyan Ye wrote:
> Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
> HX83102 IC, so add the compatible to the hx83102 binding files.
>=20
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wll5mPIV/lTSeNrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T77QAKCRB4tDGHoIJi
0mbmAP94P8Cn/5ZgmegabpD8SSqFNPWR6gjGdIJczaNNPxnN6QD+OIIWROfuaczB
9MQ4ipOv15tNQ08WfOiR2XqD0jORpQ0=
=tuM0
-----END PGP SIGNATURE-----

--wll5mPIV/lTSeNrB--
