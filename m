Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4C9560101
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3910ECF0;
	Wed, 29 Jun 2022 13:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5BB10ECF0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:11:18 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 7510C1C0BCD; Wed, 29 Jun 2022 15:04:30 +0200 (CEST)
Date: Wed, 29 Jun 2022 15:04:30 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.9 08/13] video: fbdev: simplefb: Check before
 clk_put() not needed
Message-ID: <20220629130430.GD13395@duo.ucw.cz>
References: <20220628022657.597208-1-sashal@kernel.org>
 <20220628022657.597208-8-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline
In-Reply-To: <20220628022657.597208-8-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, Yihao Han <hanyihao@vivo.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 5491424d17bdeb7b7852a59367858251783f8398 ]
>=20
> clk_put() already checks the clk ptr using !clk and IS_ERR()
> so there is no need to check it again before calling it.

Nice cleanup, but not a bugfix; we don't need it in -stable.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYrxN3gAKCRAw5/Bqldv6
8l0vAJ4hi7VBDbsObGLei7MhiNZd1W/QkwCbBN5YwMYoM34CeEw8AVL19VF1JNk=
=oYg7
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
