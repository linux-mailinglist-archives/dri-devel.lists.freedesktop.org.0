Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1E84449E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DC210FB28;
	Wed, 31 Jan 2024 16:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DAE10FB28
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 16:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E7F38618C2;
 Wed, 31 Jan 2024 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44490C433F1;
 Wed, 31 Jan 2024 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706718883;
 bh=HD1Yjnr4nWZ6pAzdwyIqRsLbA3A5jkLrkg58FHoyDsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oxZE466q5sEtx3BuwSSlJASSdSLAQz0Cqmle2AW5CkG+OCktFmvaEe7nyUo+XaP1z
 diqfRXI+f4R4VtIkzkmAfGCqKn3gZgN05C2Ci+5aqpIkVtmEIszDBa7GkqmJC/a96y
 HmyBxLm8VB2LpeYmpksdAoWutTg7Pd6QADAWqrPmbaGlNBcpHPVtauYTqap7ZhgNnV
 uLFibVKz+vHJtsMo1KYaF6mGNcTDqX9G6xEtUXrWVIQYsDsggrR3T5Va255jnHZ5uh
 pOR+KasHVsUJIexWoR3yKELOtbMIRk3xQvEIQJYpr1TfmuEx3OWzsltawfEWYoGfgD
 IzeE1NXtkE3tg==
Date: Wed, 31 Jan 2024 17:34:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
Message-ID: <Zbp2oJKXUbxP6upF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y83znHstnARIpLfl"
Content-Disposition: inline
In-Reply-To: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y83znHstnARIpLfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 05:08:23PM +0100, Geert Uytterhoeven wrote:
> Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
> board staging code"), there are no more users of the legacy SuperH
> Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
> users on these platforms have been converted to the SH-Mobile DRM
> driver, using DT.
>=20
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--y83znHstnARIpLfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW6dpwACgkQFA3kzBSg
KbaoEg//Uclnx3k7U799e0P1jc2PvtUd+vb4R9z+m/EfciyNRgRnOvnzoPDiAwSV
p5BIiJYrkLH05uJu5fEJP59hysOVOXA7GGkdAdY+fCkkJzIROjh0vD5Zc70TQwg3
ZK7h2jDR3AXXoIsDvdGBIf8iETCpPKq38SUKsiDPTh8N/uxWhwrGUVCsZCaH7oOX
6RMsI102TA11KfvA/uOUEIGZHs0K8RJnO84NFZ+FoqAa88Nmg76SMAkCMmBqXO7U
xGA14+GX3EyKtehcje9ysqQZJ/50ubLxlfstqi/FkUutwB1HBp0VNzjAmGqqFc3+
6bKeGk9NEGZJmlPqEl2Bf6kNit56tmt/c0h4zxjcLhuG1eGDwtiRDjnG6TJ9xlCf
1TDdfL8HPwzZbpLYKf2CMsRLM8MwCO3Z9vMB3LpHQTH4ICfXX1ESa93KSPcOuTWY
nlXPRjBf+4/qornF2c0pQBTWYhIOCIc627wglwxJ9OxFoJzZsfMAMVi3LUejkqFA
gpJLAlI+GnP1pT7gkSDPhRBoO8hLXx34lBmU4/JL45+QsvIQNAAUQox5NatCI+Nz
utoEftEApEZ7ptEBkKKkTgb0/9hP5J4OoneAGVT0g8LwY7zfGiMMlkz9aMgJhi1z
xYCoKNIiNl7VmAvFcoJA77z3/JEfs6d+nc3VbzzYVOclFjVQgXM=
=YJDi
-----END PGP SIGNATURE-----

--y83znHstnARIpLfl--
