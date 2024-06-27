Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931DC91A05D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86E10EA48;
	Thu, 27 Jun 2024 07:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qwq/A+Nd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B638510EA48
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:24:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2F89CE2D22;
 Thu, 27 Jun 2024 07:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785F7C2BBFC;
 Thu, 27 Jun 2024 07:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719473063;
 bh=TCsdtMbl/CjGn1WCzcRbquqZ7hzL1LyyhlF+/7YDxHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qwq/A+NdWTWyRw5QbbP9Lo3+skvizgHw7DvAfboQeR2lM7s5ghh+ak8ex1uYF2x1E
 6GxNkc27yOmVs5UmfGMPSjLfbdSPsDoVKmAua2N//8TTv5Pl7E9YtqUNifAIwsHoZ2
 lEp4FSYh+Hw2OFetWQI9iwJCy4pkdyk3TDqeqmlUtnSYfxKTyA6b0Pek/tlZjz6mMn
 hxpTUvLPj+T8EcNlhAILE8vCtPNKIlehZAn0LBWfE/NThouvLFYCaYzjGazPjYkThy
 xpTa3R0BSG1Ld3fmUkeyi20RADM5Vf1LlvvDpfVdzM70VvN43HGmtlE4vf/mDIqvv1
 2rtWVlFa7ejRA==
Date: Thu, 27 Jun 2024 09:24:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240627-abstract-imposing-sambar-eb0c7a@houat>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-1-a3b344707fa7@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jybhjko5zwg63e5r"
Content-Disposition: inline
In-Reply-To: <20240625-tdp158-v2-1-a3b344707fa7@freebox.fr>
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


--jybhjko5zwg63e5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 06:38:12PM GMT, Marc Gonzalez wrote:
> The TI TDP158 is an HDMI to TMDS Redriver.
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Your commit log needs some work.

In particular, that device is more complex than what you're saying, and
explaining the full capabilities of the device will allow people to help
you create bindings that will be able to exploit all those capabilities
without breaking the backward compatibility.

Maxime

--jybhjko5zwg63e5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn0TowAKCRDj7w1vZxhR
xVZXAQDfpWv6vQBq+1yTEVr22T0AR6X9HU9cbwdNsVaNpvMjBgD6Ayzw/+lC1IH4
fzVPjrW1mX+vvq6kTB+ZUtOLbBOaOQE=
=OeR4
-----END PGP SIGNATURE-----

--jybhjko5zwg63e5r--
