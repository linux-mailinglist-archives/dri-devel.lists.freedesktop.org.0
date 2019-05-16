Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB220D28
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B7E89725;
	Thu, 16 May 2019 16:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A8DC89725
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 242EF10A3516;
 Thu, 16 May 2019 09:37:43 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Hw30axL6XjNz; Thu, 16 May 2019 09:37:42 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 0850210A2E28;
 Thu, 16 May 2019 09:37:42 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 8BB062FE3AAE; Thu, 16 May 2019 11:37:41 -0500 (CDT)
From: Eric Anholt <eric@anholt.net>
To: James Clarke <jrtc27@jrtc27.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
In-Reply-To: <87tve334o1.fsf@anholt.net>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
 <87tve334o1.fsf@anholt.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 16 May 2019 09:37:40 -0700
Message-ID: <87d0kibbjf.fsf@anholt.net>
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
Content-Type: multipart/mixed; boundary="===============0709976245=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0709976245==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> [ Unknown signature status ]
> James Clarke <jrtc27@jrtc27.com> writes:
>
>> Like GNU/Linux, GNU/kFreeBSD's sys/types.h does not define the uintX_t
>> types, which differs from the BSDs' headers. Thus we should include
>> stdint.h to ensure we have all the required integer types.
>>
>> Signed-off-by: James Clarke <jrtc27@jrtc27.com>
>
> Reviewed-by: Eric Anholt <eric@anholt.net>

And pushed to drm-misc-next now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzdkdQACgkQtdYpNtH8
nuiT2hAAic+xaCJEwtlpqbWEZ7GnXG6SRsEQBZrYBc6Z/jppkYJLq2HklO7RQOKY
T3oJYu8Q+fNDlTRpLh6jFOvt0FxrKq0cI5JbmzLZgqLMqlHp45lOUjnEDug6EFsB
rLyEqvME26apsrsLsbmiIKPBw0U5XGY1fQnI/AkMp6YUkFxnkqtoZfRewzcBK0iD
O6dSTW1lsIlCcf4IwL4r2Nh95dquZZs62zVWqZRbldMN3st9opuII/1gpIuw6au0
LYqC3CIkfXGYbnet1DviYiiXbySiSUTKQtrI9wczcj7XVpNB27lvIxvKRQPlZCbC
VntDvlMsfn2MzQPv4/wyTBe55L/6MuMO+rYqDQLDODGjUKlPSU0TjvUoR5sdUk4F
eW6NE2HNa4YORLQL07U5BpqXmG0LRzjQtglZw1XgEPuzou7lZm3z2RSwrMX6Ewh3
iQOpZMDk72Jn6zDyNSfTbq02c6OGdBGs3HK2JTuX1Fz+mPolhF7VdMoSPa7IQVl4
tQ95e3KdwtRXV/l3J3eC4jtkW/KZNPwIC64NYSwaeWPiD96DcnEST9KSgfjeWnBZ
Y2Ro1Fkrdg3v075DM5JRE/dWHjWy9KuX+jYXxsiwc9AY41IvirC+hmeYpQhqfJuU
V6uZDg4RDRfS5esfjfD2IPJZBuwXEN9Q9TqCpdiRdKPIVU70DKI=
=2rf/
-----END PGP SIGNATURE-----
--=-=-=--

--===============0709976245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0709976245==--
