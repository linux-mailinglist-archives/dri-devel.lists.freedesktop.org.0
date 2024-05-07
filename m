Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728DB8BE929
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9298A11251C;
	Tue,  7 May 2024 16:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GyYtMK/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158DD11251C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:35:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5851E617D2;
 Tue,  7 May 2024 16:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527D0C2BBFC;
 Tue,  7 May 2024 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715099723;
 bh=6BuoEP69iJQFTmo0l+aKAmmdfXJuE/M0HIl7fyjjuRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GyYtMK/eL10nLiDdj/jdaWGHvz9tdmIjPuGjMN4piG9lIXruppRR/ZI6Htlj9Wg6Y
 QPn+5XpPNhdQLn8mie8dU6DQq9bHp6wMuPPycJb8j37Xdw+2spRsVI0PF4ZQDgVodm
 sIgAAQftKW8fDfN9uZBXukS0GQD986J4z49FvovdkWRusokNTf+W9DuO3WbeFWb6C0
 kcZkCqmB4AMha8bWlF4/WjZfxBxztgxRaAkY2bKfDTFWcyvgZjdJ6nVjWYXpIKecyE
 adN+K+POS4UhFWhNxi35rUTG7C2oHHsFoRQsa0rzgyTDzCK388/7AcLuK7mZHKdmr5
 fEFcPcfoTvEXw==
Date: Tue, 7 May 2024 17:35:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
Subject: Re: [PATCH v4 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
Message-ID: <20240507-joylessly-litigate-be6a83058ed9@spud>
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2Nhu63EKR1l31LzH"
Content-Disposition: inline
In-Reply-To: <20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com>
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


--2Nhu63EKR1l31LzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 09:52:28PM +0800, Cong Yang wrote:
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

Other than the issue Rob's bot reported, this looks fine to me.

Thanks for the updates - but please test your bindings!
Conor.

--2Nhu63EKR1l31LzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpYRgAKCRB4tDGHoIJi
0t9VAP9HNYeHrikG32rNlR6KbTJBlAm+FPDMLfH0vjZbmGR9FgEAt7OVS+Lp5Uqx
c7yaTo/RJ2Ft85p6pEOuYB/Yhh2Izgw=
=aoZ/
-----END PGP SIGNATURE-----

--2Nhu63EKR1l31LzH--
