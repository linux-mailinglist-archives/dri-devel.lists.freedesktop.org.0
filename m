Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731CCEB834
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A04810E20B;
	Wed, 31 Dec 2025 08:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="28SGkhZI";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="iIA3royF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC2810E20B;
 Wed, 31 Dec 2025 08:17:38 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 4831BEC0199;
 Wed, 31 Dec 2025 03:17:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 31 Dec 2025 03:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1767169057; x=1767255457; bh=vfxorXJXtr
 oycbRN6IUJ+dzctWvz+cPTc2VwPUJGtvM=; b=28SGkhZIJahUk5flwTZxZVs3mn
 Zzz/35ATuhrE6dgj+9UKjGtHEfR+GUv1nt/EI6Ad5SO3wyHeIy6Nm/RTVaFb64hF
 XpXPsvBU+p2XWx9gt+wpJoTnQTVP9wbU+I1Uu7fJjPiQX7wssdOW7wZiGbyHGf5I
 OkStmdWlK6xpvQboAzfcmoTWBCcjcSTrzpCXANG7swrjsbnsI3t/Vqbxu95NnGli
 tMpqfFo54JtRL0vzm2pJJR2N3Q8X/dRJwk1HZnOitL/WTQjDFgjWyrqrNPGP5Vdz
 wP6RAbNWpduhMD44AuTUhwnhFW2kxVZgfrXbCTzAeg7dXvDKstdv1m2z6NUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1767169057; x=1767255457; bh=vfxorXJXtroycbRN6IUJ+dzctWvz+cPTc2V
 wPUJGtvM=; b=iIA3royFLYu7Hf4vbGqsM+ALVZcBD94ALeuiW0UP4RcXTc+pcpr
 1JSrmW0pVfvLw5CZVfy8fqlg6kP1M2w5MrtiFvm8i4TH0ppOnK3BfE/pqgVx+DwX
 oFtCvkFuBb5G2OLuanqO0u9MulKJfTX6SmD9gqBDB7qlKiSZkjvbWHsWoMMjLb4H
 hCfmJRLXEKZyOIYShztwvZLuY+qbZqFePz12FE42uXo9sMCpmY7TyMKx0a4uljfD
 rsJZV4Q7nzRXWs8i3UlSiEuY4qo/ulS8TJBUodeLhmsLMIDlxmbh9Vq36ElAfC26
 830rihbz2ll1ir2MQvX6eIzd8TtIHd65AQQ==
X-ME-Sender: <xms:IdxUaXTqxCqgCz9of-Qko-BHbpLgnVUt3KbXjOzKqbxC3-hKhnE-Dg>
 <xme:IdxUaS1ruS0h9VIKPG-FxQRPnps1ULSfrsI3yGsNQLU_JgeGqTFyucO2tYD9uQsNv
 F1YmT0H5zRDTBLI51QYmzn-ideHFZEgTRkFCW1ztC7n-d4jQhnrlKo>
X-ME-Received: <xmr:IdxUactrk1VnxVyWZFQjc5IMUyUNMPBN2XhwiEVJcsPpIvgOtvP7ELOPCZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevuffkfgffjghfgggtsehgtderredtreejnecuhfhrohhmpeevhhhrihhsthho
 phhhvghrucfunhhofihhihhllhcuoegthhhrihhssehkohguvgehgedrnhgvtheqnecugg
 ftrfgrthhtvghrnhepvdeuffffvdekudeludeukeevudetiedvtefgffeivdeuieekkeel
 ueejteeuhfehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhrihhssehkohguvgehgedr
 nhgvthdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epmhgrthhthhgvfidrshgthhifrghrthiisehlihhnuhigrdguvghvpdhrtghpthhtohep
 lhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehtthgrsghisehnvhhiughirgdrtghomhdprhgtphhtthho
 pehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
 epnhhouhhvvggruheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphht
 thhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:IdxUaYhCKtpDdHC8CyKtpt5LZf13xpYNFazda4PILxu5jbCievySLg>
 <xmx:IdxUad9BsbQQ_67XzYPTR5sAeRN1dMm_sJaSUOKMUDT1w0V3l8hZZA>
 <xmx:IdxUabuDJMGGJYh3hl4rRCGJSZPeC_DlFoqjiL9MnrUHYvcUMid9Dw>
 <xmx:IdxUaRqniM1AbSNqyfHxH0wTzZzW9wxTvnOWGkF3KPVPAToKxsnyhA>
 <xmx:IdxUaYVB1wU8cwFzMky4UkhYDZfJvl7t8G1xBRYMOV6XVlQ3_DbX4jY4>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 03:17:36 -0500 (EST)
From: Christopher Snowhill <chris@kode54.net>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Lyude Paul <lyude@redhat.com>, dakr@kernel.org,
 Timur Tabi <ttabi@nvidia.com>, regressions@lists.linux.dev,
 nouveau@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [REGRESSION][BISECTED] Freeze when nouveau loads GSP firmware
 during boot on Blackwell
Message-ID: <176716905502.167194.1676368663909086723@copycat>
User-Agent: Dodo
Date: Wed, 31 Dec 2025 00:17:35 -0800
In-Reply-To: <59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev>
References: <59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============5313257699487410381=="
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

--===============5313257699487410381==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On Tue 30 Dec 2025 10:11:34 PM , Matthew Schwartz wrote:
> Hello,
>=20
> On the 6.19-rc kernel series with linux-firmware 20251125, I have been unab=
le to boot into the kernel while using nouveau on my RTX 5090 rig.=20
>=20
> It appears to freeze right after "nouveau 0000:01:00.0: gsp: RM version: 57=
0.144" appears in my dmesg, and it locks up at this point. It works fine if I=
 blacklist nouveau or use nomodeset.
>=20
> After bisecting, the first bad commit is da67179e5538 ("drm/nouveau/gsp: Al=
locate fwsec-sb at boot"). As it's a Blackwell card, I cannot test with GSP d=
isabled.
>=20
> Still trying to figure out the best way to provide complete logs of the fre=
eze, as it's too early to go into my journal and sysrq keys don't work when i=
t freezes...=20
>=20
> Thanks,
> Matt

I encountered the same bug possibly, except in my case, it resulted in
an OOPS, and the total failure of video output. However, I was able to
log into LUKS and pull some kernel logs:

https://lore.kernel.org/all/176698808133.6372.2408917375327107249@copycat/

The commonality here seems to be crashing dereferencing offset 0xCC in a
structure from bit_entry(struct nvkm_bios *bios, u8 id, struct bit_entry *bit)

Nearest I can guess without doing further proper examination is that
it's dereferencing a NULL nvkm_bios pointer right at the top of the
function. Maybe something isn't initializing the BIOS member before this
ctor is called on Blackwell? Race conditions are really fun to deal
with.

--===============5313257699487410381==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlU3B8ACgkQjWyYR59K
3nG3hRAAoVDhI3L0HPj+JQ24NB4gR2CEHw/LCnWByyiNKBDfGGNl5MCm8rDQl630
SiznK6Zk0VRbqIenPxODjl2v57n9uLOH8HGM/OPYmPTXvnemV4LpQpwHAsJYDJ2d
K9/otPRSHQvi3NHrJnyorHLAgZ8yqDEukKTvxj9TsSiFSy7jbubAoCGDP76oisPP
PrNVTb8xkdbAL7yrFkGJh4tRBsfZOFJAPTKnS4QwHF6VHCqRhSEY3Dv3xU9pm1FC
w0kGk9ZfuJt+CQw1QiIQIAP6qiUx2lRyGd1IvK8qdEW3slZjkSZaSqmm0tTW9ZJz
Dgd80n5wqKS/fJPm35dAhcm73JNFtcZQb0K8oD0twGUwyIGtfj9/WmDcobCs7tlf
LYCsjf682YY/QqlLGdxY3slpwfy9eRoEriIRT4b6NxnP/Ze6ryVwXL/0Sql3xQp9
cxJu9Ipv4lHt0m9zT2u1zRPYG9HMgCjWnL2do7iT3kYtvqDmGJymEolU3NBYU7V5
v9Uq1+ZnMwVShTPF/qFRzz0636O8ckqWZqIlRLeMtouDKU8ave8HZvzF9j5EqIfC
D+ikDB2c/UbJGKYg0VdY+qPIKF0ZIKKQ+UsrmlTLiR0NnlX6SXVb3CT7yHjL9GG5
bG7tPGFXTGQhSW7VTFyZ5QO9koh0tmVj63hhhIV3TMyFpWwCbbI=
=EZjI
-----END PGP SIGNATURE-----

--===============5313257699487410381==--
