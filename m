Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FE494607
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 04:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78BE10E21E;
	Thu, 20 Jan 2022 03:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AF110E21E;
 Thu, 20 Jan 2022 03:19:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JfSQk1tDlz4y3V;
 Thu, 20 Jan 2022 14:18:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1642648736;
 bh=IV8TwQKMAHb7hOgZQjpd7Vrtv8hIvS1/1zG4v5vuIGs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JuLs1TPV4SqtWcTlui9lDDSdR4rxHTQhzPsiHwyKSHg6kM/iuYL95gQyU4O2eEjN6
 gG+8Fv8+/z1XpQdEgD1kkmJlR9Syhdx8Z4CpYgA0JN4A1ZGDY8VL1sYZGUyjtqT8ha
 I5S85QwoCyk776ky6lI755qZ0Fyj4nX0IBOFPcIX5VTG1a6y93H6JxvSiKJcKEMb4Z
 R+5MoxawzBdHgLyaAeSnGJmlNgQq6l4GexIkWzNQb0v7W3Svny9X0zYOwpInVzH4Ol
 vZplPNHpxgI/ajDYZAUFOAVarJhbgYA5qtwl8vBnRE2kskG2i+Kd5roK4JuHWcY50p
 53DTnD2Jsjzsg==
Date: Thu, 20 Jan 2022 14:18:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20220120141851.5503b65a@canb.auug.org.au>
In-Reply-To: <20211015205422.53bec93d@canb.auug.org.au>
References: <20211015205422.53bec93d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tZ5OU4A5=5/3NosZ_1GDOXO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/tZ5OU4A5=5/3NosZ_1GDOXO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Oct 2021 20:54:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/gpu/drm-kms-helpers:451: /home/sfr/next/next/drivers/gpu/dr=
m/drm_privacy_screen.c:270: WARNING: Inline emphasis start-string without e=
nd-string.
>=20
> Introduced by commit
>=20
>   8a12b170558a ("drm/privacy-screen: Add notifier support (v2)")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/tZ5OU4A5=5/3NosZ_1GDOXO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHo1JsACgkQAVBC80lX
0Gzxlgf+M86EA95Gn5atlw3iO9jKo07o8/alMcdH2RQORIIE3icWZpVgfc6INnNk
s0jfDzm57lemOW4eCWyi6U3RTx/+sDBaapJBRrzq4geXhUM2nQd4Qlu/KboxcZSN
rAJ4RMt2zyoOH0PCqTvJHEWrnplKwKbTd2UGv7ukqlQHCXqk08aH7FLi4PoYbhOf
pPCCR0+RT0qxET9YMmKiW0DYWfrBMIHguWCnzV2xu3N5ODUCr0DtHtui7f3Y95G8
1aRnpNEXpJWe7erAc9T9YVAL3CJOaRvCyHOfpD496NFA79kRQjiWe6rmF84tgV+7
v/QDUc7/JpVG5NJ2zeZKtIi+B+dr6Q==
=LDgO
-----END PGP SIGNATURE-----

--Sig_/tZ5OU4A5=5/3NosZ_1GDOXO--
