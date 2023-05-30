Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A491716D92
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ADA10E40F;
	Tue, 30 May 2023 19:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911AC10E40F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:31:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE7E362F8F;
 Tue, 30 May 2023 19:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6BBC433D2;
 Tue, 30 May 2023 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685475114;
 bh=mHUFFikMTlQApOGC7YvxjGTCLYZ1HBj5dMAI/IPTcc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+DXjQcOsxFh3DQnqdIhpFMgPeGM07VRRtCWqyX3kl2StQG/lLgtBE4LLbC+M9cwA
 2NZZ60NB8tW7fnJwrVjD8vEjSmrMyISxL9+U6bB0yQBanW1JGE1nqrrcmSVYG71RSE
 AMLTFEBD//L7z0qaWE/oW2sMNOWjq9x8VJ95O37DmHWUmLJQXCQYNyK0WSemGQVCeD
 wdpE3rLQ1M9FnE96azrCkx2yF+Tt4e5ikBUux6x+0IbhdqTAS+t+deAgkZvYSG2ay6
 RM6+s5kKkHkIni3UhhVW1YgrV0giNKh3cQtfhIYGdyYjm3bldN/H2QfKIEKamZlMKR
 om19Wth0jkrfQ==
Date: Tue, 30 May 2023 20:31:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358762: Document
 reset-gpios
Message-ID: <20230530-discount-stumbling-6b39fb74dc4f@spud>
References: <20230530192805.648646-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bdHpewQhhYkNCz+S"
Content-Disposition: inline
In-Reply-To: <20230530192805.648646-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bdHpewQhhYkNCz+S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:28:04PM +0200, Marek Vasut wrote:
> This chip has one reset GPIO input, document it. The reset GPIO
> is optional as it is sometimes not connected on some hardware.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--bdHpewQhhYkNCz+S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHZPJQAKCRB4tDGHoIJi
0vATAQDZW1g5AruaXlxG+i29siOdMLsQ8yfT0a/mw1sxTKOMagEAoXW5fBK1qfkV
VRDOWd37w/lS12vilf1zVydExj9o0wc=
=twAQ
-----END PGP SIGNATURE-----

--bdHpewQhhYkNCz+S--
