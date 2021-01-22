Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340292FFD5C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 08:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7496E9A3;
	Fri, 22 Jan 2021 07:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734566E9A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 07:29:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMW9l4mt0z9s2g;
 Fri, 22 Jan 2021 18:29:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1611300590;
 bh=+sU56v/j7B/BMjzYJrqFxjhvQY3A0vL+IeSq9RxWC8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pNFuX/nv9JpIxhg+yzYm/hMCuEevyeivW4N1AbD6+ONqcKZarHSvPgZT/TqOklD6o
 FZL/8hALb+9b/P09j0FyvB4bIql0U/5eNCFEqMrxFc+/c6nEr6wYZmrh8UVfIuDCJt
 jsb7Z+p6TQLD4MbWlCvUmb48928Xodps+4R7QlI79Df/FIj2R7CwG1QxfTDrF5OClW
 /U5s1iDMegGaA1UYInZoPrFnCjtMyPA80gjEBMmgBuOk4OPVwHZgQLpfou/n6oRxlq
 rhPaJ1+yLjIKjNC5U1kT8cO03QeRKS8N0KHJIHkWIT+GxmA3Zfb0obC5ctkLrLr0YY
 HwE01RPK+96EQ==
Date: Fri, 22 Jan 2021 18:29:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20210122182946.6beb10b7@canb.auug.org.au>
In-Reply-To: <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
References: <20210122115918.63b56fa1@canb.auug.org.au>
 <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============0107953439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0107953439==
Content-Type: multipart/signed; boundary="Sig_/Ty/_2YWrLOgQlLIyr8B2db2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ty/_2YWrLOgQlLIyr8B2db2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 22 Jan 2021 08:17:58 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> Hm that has been in drm-intel-gt-next for a few days, is that tree not
> in linux-next?

It is not.

These are the drm branches currently in linux-next:

drm-fixes	git://git.freedesktop.org/git/drm/drm.git	drm-fixes
amdgpu-fixes	git://people.freedesktop.org/~agd5f/linux	drm-fixes
drm-intel-fixes	git://anongit.freedesktop.org/drm-intel		for-linux-next-fix=
es
drm-misc-fixes	git://anongit.freedesktop.org/drm/drm-misc	for-linux-next-fi=
xes
drm		git://git.freedesktop.org/git/drm/drm.git	drm-next
amdgpu		https://gitlab.freedesktop.org/agd5f/linux	drm-next
drm-intel	git://anongit.freedesktop.org/drm-intel		for-linux-next
drm-tegra	git://anongit.freedesktop.org/tegra/linux.git	drm/tegra/for-next
drm-misc	git://anongit.freedesktop.org/drm/drm-misc	for-linux-next
drm-msm		https://gitlab.freedesktop.org/drm/msm.git	msm-next
imx-drm		https://git.pengutronix.de/git/pza/linux	imx-drm/next
etnaviv		https://git.pengutronix.de/git/lst/linux	etnaviv/next

--=20
Cheers,
Stephen Rothwell

--Sig_/Ty/_2YWrLOgQlLIyr8B2db2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKfuoACgkQAVBC80lX
0GxDIgf/bj7glZsQ4jBfYddzSje7xWzy4RX2JtpP7EHkmQxVoFlr7XsV6HLBt6lV
1Uo2w7k75Q9EG4cHJ2KIHO1qwxwOlA0ZXLr/a5moxKORSYOC26IHV2ikpjNPzdl4
aqcK6NS7AX0ymDj+YZEC0MPx/TQAG80Frz1XntuV48MJkFwZaIfpcxj2T3f4h+lK
J30Don9wFbhcL/z0CX3EopQhXNAPAFQ68B0w09dIunadmBGK9IhbSyZCG40+d5XO
LnIOJJ1k+odXmVyKQI8jjG7Crk/RRZ4u7vnk10ueSk0gro2oH+A7OWFnVUo0667j
4wkal1M7G4CgRSZHeUIQMB/jWUqiXQ==
=1/em
-----END PGP SIGNATURE-----

--Sig_/Ty/_2YWrLOgQlLIyr8B2db2--

--===============0107953439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0107953439==--
