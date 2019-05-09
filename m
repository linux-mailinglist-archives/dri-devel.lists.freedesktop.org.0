Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2418F74
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 19:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CA489D1D;
	Thu,  9 May 2019 17:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0259B89D1D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 17:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 99D7410A34BA;
 Thu,  9 May 2019 10:42:56 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id UHladQkO9E6m; Thu,  9 May 2019 10:42:55 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id A5FE610A34B6;
 Thu,  9 May 2019 10:42:55 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 431342FE3AA9; Thu,  9 May 2019 10:42:55 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: James Clarke <jrtc27@jrtc27.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
In-Reply-To: <20190115150418.68080-1-jrtc27@jrtc27.com>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 09 May 2019 10:42:54 -0700
Message-ID: <87tve334o1.fsf@anholt.net>
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
Cc: James Clarke <jrtc27@jrtc27.com>
Content-Type: multipart/mixed; boundary="===============0277606784=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0277606784==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

James Clarke <jrtc27@jrtc27.com> writes:

> Like GNU/Linux, GNU/kFreeBSD's sys/types.h does not define the uintX_t
> types, which differs from the BSDs' headers. Thus we should include
> stdint.h to ensure we have all the required integer types.
>
> Signed-off-by: James Clarke <jrtc27@jrtc27.com>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzUZp8ACgkQtdYpNtH8
nug5FhAAoqySnr/0gaSQFziLtd5KUmwdl+bH8WOuS2DXs8rzv9Urn/1c3+Gbgr4/
0uHpY/qe54/yj4+oMy0b4Zi0NT7RXU1Tyj52HQCffcUcDjn9W5jSHpTzQqseOQ5B
KY0Oyopp8OwzgTr0IrEaPBhzRbaUfHTkli95to6GRX3NhZpr6PWVPuAoYRRirV1A
Nvvg83wSZTwgFHPc34vKVRujuIAQJEOaoU0pmhLTBI1jzmWfUENxPpd+az5MGhH8
7yFr1F0JEJaYBJ4YP45K2JWC2rwczD1Z+ASN4NDjDDF3tzb9MdMxWKkIl3HbxEY1
tHHHcDqlQtZNFPSLH/mhYtUlvoKtW8V/JoAXcj0ogqm3m3+CRrZxpeBQmiNNbA6/
5GmtAWhlPcM5nCZthfvF8cDvPXBrHXwot7eC36jWCpOTQulR+ik+2D3UBMiE05Vq
PrnAc+LWvhD57snMNQOufRlPokbE2YUkRWB/9hOSb9FlptQk9pj7B+Eo0tK3NIxI
NizpXbBBRqlDT0WGK0/DMmRo8FJp1VV/82RaUciI5XpkctgWRk1HTbPyrNv++bpP
TNqerLUjtdVUDG44FsNIqTdGKuYvibOHPEXpmlr4w4hRyX+qgkihAn0Sjy1ZoEq6
h8iGtB8eFJx6nK+cwCWVUZtqRX4rJhD9F26ZCd1kXv5dQpkbT9k=
=2AAd
-----END PGP SIGNATURE-----
--=-=-=--

--===============0277606784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0277606784==--
