Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F075B1EC84
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 17:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E888910E064;
	Fri,  8 Aug 2025 15:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ofc9fAkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB910E064
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 15:55:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AB9F5601EF;
 Fri,  8 Aug 2025 15:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921CDC4CEED;
 Fri,  8 Aug 2025 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754668499;
 bh=lgnkbkVduOwdXuXf7x7uzQPLcodvS2Q7o9dW6uo78kg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ofc9fAkAU+7a4uujMtgNa1n9cJhVu0pitr80wnx3yGR9IoOxbZdct8DwUo9f4y5lh
 wCRsX1SlteB4rcmrxQDpeqWUL76jXBLUpBAU283d39YHZh2P7+3MBeJOynu0zLKC0Z
 21yBg3RZIzm6+Jre5VxmoCnhMLWU1hYhNLXuaW10JmavespXqcjlFaDHNhxyCGkBqp
 t0pO9W6x/GsUWcvDF+Q7dAZym7qjROX54CP8oYm+t+AuMh+Mn0N753OmLi2o6fP/bW
 /rRFy2L5jDK+5Ts41qylJwfdvXw9QZq2kKpjqh39/POE+jcZl4Ditx4v3IYZLh4S+M
 PsUicC0kX91eg==
Date: Fri, 8 Aug 2025 16:54:54 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Drop duplicate ti,opa362 binding
Message-ID: <20250808-elude-detail-ee0c8bd3a833@spud>
References: <20250807214508.4174167-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o5zS9a3DrV3RFezK"
Content-Disposition: inline
In-Reply-To: <20250807214508.4174167-1-robh@kernel.org>
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


--o5zS9a3DrV3RFezK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 04:45:07PM -0500, Rob Herring (Arm) wrote:
> The "ti,opa362" binding is already supported in simple-bridge.yaml, so
> remove the old binding doc.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--o5zS9a3DrV3RFezK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJYdzgAKCRB4tDGHoIJi
0rCLAQCUZ8fu5dvlD2WAVYrW8ScBubBwZq7aRilZr1iswQxUUQEAqyT3QVMIyIeq
7KJ+SHBGzMKPRKWt+PdB7qJQ2iQCOQk=
=20Lm
-----END PGP SIGNATURE-----

--o5zS9a3DrV3RFezK--
