Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930F48B47
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 20:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F894892B6;
	Mon, 17 Jun 2019 18:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B97A892B6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 18:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id B6ABF10A1174;
 Mon, 17 Jun 2019 11:06:08 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8PYuFXakEulv; Mon, 17 Jun 2019 11:06:07 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id E6DD610A2D57;
 Mon, 17 Jun 2019 11:06:06 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 3E5A42FE21CE; Mon, 17 Jun 2019 11:06:04 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v5 12/12] drm/vc4: hdmi: Set default state margin at reset
In-Reply-To: <44e24172e300be6a41578517021ef6a6e90ed682.1560783090.git-series.maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <44e24172e300be6a41578517021ef6a6e90ed682.1560783090.git-series.maxime.ripard@bootlin.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Mon, 17 Jun 2019 11:06:01 -0700
Message-ID: <87h88ojddi.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1530431868=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1530431868==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> Now that the TV margins are properly parsed and filled into
> drm_cmdline_mode, we just need to initialise the first state at reset to
> get those values and start using them.
>
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0H1okACgkQtdYpNtH8
nugSWBAAoWCP++Qwww0swu4BB53GOfyec6uZPvNui6Kyv639kpWntni3RiFigbwS
xEFlhRj4Cu/QqfHuyUS/qucK1TFBOHVm7UUpFqYMrwhUAsZfISrNVCX4cjudgbko
0a6EUps/1dtSfmnL8JIwHDKj2N+2nSNSqJan92NWs8zmykb7IUSXA0U7Gh7rmaoJ
aUgb6qhJBx4ogSTrQJBgHIHiq+QB5iQ/KPgBJNM760SbHHcSlkAfDqSOAWLJCAZF
mYBjmQXWzxByirAObw1m8VI+btCvwvNTMVZNCZN3MJf9q1RkKUm9s1sr0i/6PpQc
1Tli/VVkKZckDZx4EYh3FaLEYKgnko7J0bJuucHobpLeV6+OHEma7i3aSRSpCBwF
VKWUq9XYvrEtK3I4rL8We9CQ/s1d/VqaDU0K3TvLWM6VM8xIqQl30KlYGwF+e6Sx
IJE7bDkz/JFfgZUJxUDxzcVvxn8fGfmKL2wKy7lE+1zb1gpY1IHWBSrkrHjmT4Xu
SMsjujbN/18fzKs2UwVDt43jL/LYFkTrEnZ0wmkiLIYkNWic2cgUeda2tfZ4c2wR
CYJudsLZ+pparV+rCxG8ZOtQmmhdVrm5O797p9ccpbBrPu+37jg/1+jCDA7U0GtW
QTV5i5n2/g9CUHQ05I63ZX0yW8cEujXWO5zLiYotV2xMX8wvutI=
=MWY+
-----END PGP SIGNATURE-----
--=-=-=--

--===============1530431868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1530431868==--
