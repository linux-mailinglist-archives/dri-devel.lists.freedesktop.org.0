Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5386DD0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 01:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B746ECDB;
	Thu,  8 Aug 2019 23:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id B96346ECDB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 23:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 5EE2710A1131;
 Thu,  8 Aug 2019 16:15:37 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id SvX5ogB1Zr-k; Thu,  8 Aug 2019 16:15:35 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 993FE10A2D5B;
 Thu,  8 Aug 2019 16:15:35 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 3925E2FE2547; Thu,  8 Aug 2019 16:15:36 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/9] drm/shmem: Put pages independent of a SG table
 being set
In-Reply-To: <20190808222200.13176-3-robh@kernel.org>
References: <20190808222200.13176-1-robh@kernel.org>
 <20190808222200.13176-3-robh@kernel.org>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 08 Aug 2019 16:15:34 -0700
Message-ID: <87sgqbnt9l.fsf@anholt.net>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1625751825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1625751825==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> If a driver does its own management of pages, the shmem helper object's
> pages array could be allocated when a SG table is not. There's not
> really any  good reason to tie putting pages with having a SG table when
> freeing the object, so just put pages if the pages array is populated.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Eric Anholt <eric@anholt.net>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch 1, 2:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl1MrRYACgkQtdYpNtH8
nujCqQ//dJjqUu80g1XuGf842aG+VIxKp1QxZc19aTMeqyTPTeVr/Ry/jdTyE4z4
/O5nhO7s8xITjI7pMEObVpMX+CWftOc0bVsDdWzhDSbxv8cSiNP4sfjGleME3UoH
IYaG1rWpvlCGNsXskBxWaCHxjrsUAbX4vbBQQHAR+41haM2zKDnW/OJzNCljhNMj
aIol+9elGT0RHfBb8W3+/A0DZSzC4LTB50sMitfA3wVIdQ88GfXwSjeQEJGMfV+y
W23Mwfs286pwoaLXg5PdxggHIsUjdkltLW+4ZmBch/iQ2YN4DJ1eoPnNbODldZNO
c2FR8cendUr+6pQ1qPg4LUeFelf362bhUlgzX+/yaFxz4bxdpclCHEmOS2abWdAq
GP+EHk022DysVorXYozLiDmaOGG0mNKq6sbcnQZne6jAP4pd6vlPRZHjnqkQOyYp
5nUZaADsB2wFpsm1YBZ5EGJ6xrqa7AGAOcE0TeOA9ePKx4tBvgqNIacwva55P3yZ
mW+st3CgJbv3u3pLx5FRLeBXi+220lQzm+7137ZjRU4JrjwDemJ/mB1Z4YG7W5Pn
fYzMjXWcdSf1ONcW1tobgYSReTCXaPTDRbkAixHKDLalJC9qHegbv+arux8Fq+sv
AAoEI/7VOetRIZcPFqUztTQCtsa3wTsYROqS5aMZiuqqHDGeNro=
=JGeJ
-----END PGP SIGNATURE-----
--=-=-=--

--===============1625751825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1625751825==--
