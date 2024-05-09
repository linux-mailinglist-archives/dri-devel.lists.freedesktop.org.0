Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573898C13A6
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 19:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994DF10E21F;
	Thu,  9 May 2024 17:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oXcSLdt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9AE10E21F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 17:16:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8ED5F61D5A;
 Thu,  9 May 2024 17:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83522C116B1;
 Thu,  9 May 2024 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715274999;
 bh=973lRpNkD5J9l+d336n7NUlE/nZ9DF8NwU/k6a2Ez3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oXcSLdt7LvEnsnJJoeHM78dSo0hKxgKPKHlcqoeiz0V6zkXKHRgd+lZCnw0Z+LFBj
 cP8h05WwELK4HxoFYC9Y2RxvQmSiH1MCzJIU6jMzN9D59llt5Qg9IXW1L8OVl8u/9J
 2J5IiUGjD/at+lYV2DQqPOvFgnqvPXBplQ686rUJNr7CVkneOc4cmgNhLwu6Htboto
 5WmmPzCa/g8XKMEyVRHPYtlBNyWNA1/MLeMgXl41G0pbsEslJ30RFeVCdaeO7P/uHq
 wPg4UlGIz5lHzRDqokPJvnUtQtI4pIhAJf8fid0kKNriY6se9IAB554he7KSc+/fzs
 qEHodZz5WgArQ==
Date: Thu, 9 May 2024 18:16:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
Subject: Re: [PATCH v5 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
Message-ID: <20240509-regretful-trombone-42ed9d7a3817@spud>
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
 <20240509015207.3271370-2-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ncHccA2eRd27cZCy"
Content-Disposition: inline
In-Reply-To: <20240509015207.3271370-2-yangcong5@huaqin.corp-partner.google.com>
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


--ncHccA2eRd27cZCy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 09:52:01AM +0800, Cong Yang wrote:
> In V1, discussed with Doug and Linus [1], we need break out as separate
> driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j02"
> and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> controller, they have some common CMDS. So add new documentation for
> this panels.
>=20
> For himax83102-j02 controller, no need 3v3 supply, so remove it.
>=20
> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aSAZ=
QvdMV95r3zRUw@mail.gmail.com
>=20
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ncHccA2eRd27cZCy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0E8gAKCRB4tDGHoIJi
0g5CAQDdF++R3wBg5Amvd/uInS7O/p6gOkr7yA9Poj2KRSaGWwEA1n7FZs3H0ZeE
NJTFuluFnC5smgyw1ffLSVO+JzeBoA0=
=8+Bx
-----END PGP SIGNATURE-----

--ncHccA2eRd27cZCy--
