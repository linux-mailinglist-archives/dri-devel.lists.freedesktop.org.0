Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B1CF102
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 05:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CCE6E083;
	Tue,  8 Oct 2019 03:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC176E047;
 Tue,  8 Oct 2019 03:02:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46nMbR51x7z9sN1;
 Tue,  8 Oct 2019 14:02:42 +1100 (AEDT)
Date: Tue, 8 Oct 2019 14:02:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191008140241.312425ad@canb.auug.org.au>
In-Reply-To: <20191008103045.2d4711e2@canb.auug.org.au>
References: <20191008103045.2d4711e2@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570503764;
 bh=TA89V1ZUcbGvVPM1w5JTpCCSu8Dptq+X5tkuTji7MAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M3OfKuqP+/nzk0/gdXCeKTVGEWZoAr07dNOZuOMoF0hO9DW2xbQ3lmMS2kdwy5N0Y
 v+7PzKUJhcq9JhLgFQ5ench+8A4rAID4FSsQW4hooREa3/rQuLPQ9XmJb2VTnWbOAp
 HJfCA4n+dPjXsoUsJNqFVU5ElZml1p8m1i5SHn8T8l4f5lbgF6jfto/9erL4IuG1pN
 HI//0E4YMym8KuaDwnpajcC5FVKxxRq2CbPuXb0bu8fcSV/ankDQalP+sFf+06Mj1w
 KO5yWQzX8z+BP4EzGUeYB0WLdd5s+H/trBl4evu9Dw+ylHMOlhl4JaBj2lYzkx6khq
 m3slzklUMFAbA==
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0399361936=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0399361936==
Content-Type: multipart/signed; boundary="Sig_/E2upIq_7of1YSLf/gTkj6Q0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E2upIq_7of1YSLf/gTkj6Q0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Oct 2019 10:30:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20

Sorry, forgot to include the error messages. But they shuld be clear
from the fix ...

--=20
Cheers,
Stephen Rothwell

--Sig_/E2upIq_7of1YSLf/gTkj6Q0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2b/FEACgkQAVBC80lX
0Gw8qAf/ar15ubl55UdoUlIsjZG5t7s3FDqAmbxo9Ii+KKMLdUgotqeUQWCFJpVU
kB0o2+foGRYWSa+sMlrcPhEkGNzfQLnPUkSqDASU4tsW8hmLtfs6YKJWFDUQ6ra3
X9NHPT6c57vge7PuXzFsC7TyL2Dtd6bDtO/S3LKzK0wZ1SrfZpMddS9dSzda3Tl1
PNUiY7S6BEJY7pMt7rz2/vi8b/0DS1RrekOCY+6wvmltZnqLFs/sLFdV6MZMkBYu
WD0J1rvXd3NDC3OsEYO7k0HY7puueYK4u9n7KD88DcMQ2VOPsnM5bep2cEm6vadf
ck1R/EKHyOvaYQOijS4b+A0g3x2YgA==
=NlHb
-----END PGP SIGNATURE-----

--Sig_/E2upIq_7of1YSLf/gTkj6Q0--

--===============0399361936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0399361936==--
