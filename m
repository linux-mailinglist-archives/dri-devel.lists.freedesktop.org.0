Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB001B1432
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 19:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082F16EDE5;
	Thu, 12 Sep 2019 17:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 096936EDE5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 17:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 9DB7F10A37B3;
 Thu, 12 Sep 2019 10:57:15 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id zm2f2Oq1FMY9; Thu, 12 Sep 2019 10:57:14 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 721BC10A37AE;
 Thu, 12 Sep 2019 10:57:14 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 08DBC2FE2E27; Thu, 12 Sep 2019 10:57:15 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Rohan Garg <rohan.garg@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: RFC: IOCTL to label BO in DRM Core
In-Reply-To: <2944062.7iTOG62oOJ@solembum>
References: <2944062.7iTOG62oOJ@solembum>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 12 Sep 2019 10:57:13 -0700
Message-ID: <87a7b9l7nq.fsf@anholt.net>
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
Content-Type: multipart/mixed; boundary="===============1855979864=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1855979864==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Rohan Garg <rohan.garg@collabora.com> writes:

> [ Unknown signature status ]
> Hi
> I'm investigating a way to label BO's in panfrost, similar to how VC4 doe=
s it=20
> and realised that this could be something that's might be useful to all=20
> drivers.
>
> With that in mind, would anyone be opposed to add a DRM_IOCTL_BO_SET_LABE=
L in=20
> DRM core that can be utilised by all drivers to label BO's?

I would love to see something shared.  msm has an object labeling
interface as well.

vc4's had some overengineering due to wanting to keep a bucketed-by-name
usage list so we could dump that when we ran out of memory or from
debugfs.  I think something much simpler would be better.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl16hvkACgkQtdYpNtH8
nugljw//d2xJIoDtT6TG5T1noSoe0QHtkF9rxJlCZfwo6LOmJinUSHfr+GErIK24
f7yYFxPngicw5OFlKM941sjCcd2w8HnX63HsTedRnqoxDFUrKhRjWylKIN8MIuCF
tZT48wqJjT6OGP9oc2GYV+8W8rlDMolMqcct1chcJB0MPl0FlfiCCT2duMRrGWpy
gN3d6LzO2abhGg0woF03xCbgYi3/ZyZ5f8MvyNTRWOimkxx2f4u4U9DgjxevXeXW
nOMZ8tAhdzkfWpDjl9m/q3Dj1QfMnW+eSpYhQYgkIHDaylVPEnxbNJxJ0OE0OA0W
0yKIdPLTc0CkuA7Bw130+Z2gaky5tKjRYbdM3gn56JbO5eau2dURVsfYUWkI+XfL
3uvb3SWqO+Ebi49X97BXmfOmy6A0/hw71rC8x8kxOlikjAr2kGLPBs5DdqiKnV91
sIH9Jjm8ccvES0udLTXyxcnkUPIIazJVHzPaRhqVVIi7h/AerA8yLDxJ9Y9nrRVP
AQsTOpFSEHzS3zNpQpy377MIXP/OfzddEHFxhyVtejHJOIgSe2sZ0MhNzyU69i1C
4hydJJEaYIF9nDMpQ3/sRTh3+d0TfKXnhujt5hn3QKREC8wrg+aJW3fTWaJmz8W+
+idua5jd58l7Vh8FbIAU/Nhizw96U9EwkQ4CK61JFxVbPjH4E7Y=
=d1X6
-----END PGP SIGNATURE-----
--=-=-=--

--===============1855979864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1855979864==--
