Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F7BF2B7B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A58110E49A;
	Mon, 20 Oct 2025 17:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q5cpivVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA5210E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:30:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5225A620C9;
 Mon, 20 Oct 2025 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821A5C4CEF9;
 Mon, 20 Oct 2025 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760981435;
 bh=j1YYlwvZJcHj3cRypJW49aARjh1abXFYf74hk2SqfvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5cpivVpgWMuClQFbbF5i4A5x2SZJX5tpGoPlmmQ4DBWAXEJLDHjehrnbYfYlMuSP
 8WX7axy9a2VOBkpd28GA24JngncaurJDCSyFLaBmX0rGtcXZ6E04avpv2L4OvDXttf
 j8cP0n0cVK24SfhACuoVMhS2OOVQWdfKJmqBhCJgacowioHIZHqtycJQMWBvKBKHV7
 ywTLw7rmdgSxeN7+neYTUN8AO9zPvgRQpxVUytbfFhKyIlyZPrJqvC/b5nzJcxRhWl
 3HYkK5Up5UPBkEMk3/lLozkiMyrepLHU1T76HCQuPApY3IurwD43Q72SE6b5+uZmgd
 eJDtx5O95XzXw==
Date: Mon, 20 Oct 2025 18:30:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the
 allOf section
Message-ID: <20251020-deserve-tipped-fbf75a0e7612@spud>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TVNoAyQTwvsLjUE5"
Content-Disposition: inline
In-Reply-To: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
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


--TVNoAyQTwvsLjUE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 03:00:59PM +0200, Marek Vasut wrote:
> Rework the current allOf: section such that all handling of
> clocks/clock-names properties happens first, and all handling
> of power-domains/power-domain-names happens second.
>=20
> This allows the allOf section to limit various GPU models to
> matching clocks count in the first half, and apply the same
> for power-domains count in the second half, without conflating
> the two limits together.
>=20
> This makes addition of GPU models with different clocks and
> power-domains count easier. No functional change intended.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TVNoAyQTwvsLjUE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZxtQAKCRB4tDGHoIJi
0kRoAQC70QJpZNmQzWYCj25MA0DaOEK7Tqn0OizZPOjwMtu+/gD/boMVKbDhI6jf
r2UD8AMHhsO2/IE8GGzp8eD9r0aoywU=
=bmSF
-----END PGP SIGNATURE-----

--TVNoAyQTwvsLjUE5--
