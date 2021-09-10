Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E54064FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 03:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634D06E950;
	Fri, 10 Sep 2021 01:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110646E950
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1631236587;
 bh=oc7tZR+KeNwMUHPKR2Q77kfHas/Q0/ikomXLgkYdZm4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s4qBzyYhza2LK3+BC2f7121igUqLGOXidPkncccg9o/LwyN1T6+kYJQ+yEZLiuAxy
 Fv5diyt/BS4QJARDAhLTTCY/NdaRWVd5DC1BcCOZ7Z78fpt9hywrEmW0Jz9HPSUzwB
 CliNQ96yCUFuxZNxtPzBPCO8UW6bJXSAqB12Op+5CIBwckiGWjMxlUDLbQtE22AeOB
 +OxKivkH93RlEFceNTTqhxgR7RUjdDNmPWuhDPKLJ/xP82iiiUsuwAqxi4axb/EuLE
 j6laYACYH9jC272NVH509MXHqqBLD6RcUO3WIW6sxhNS/UsJS02YV8KIbupqybNk6z
 p4WcyYin438RA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H5HyK4XC8z9sVw;
 Fri, 10 Sep 2021 11:16:25 +1000 (AEST)
Date: Fri, 10 Sep 2021 11:16:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexdeucher@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luben Tuikov <luben.tuikov@amd.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20210910111615.50aa19aa@canb.auug.org.au>
In-Reply-To: <20210902112208.23c226c8@canb.auug.org.au>
References: <20210902112208.23c226c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BCp7KyTTiIFwpL2JVsB5mnd";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/BCp7KyTTiIFwpL2JVsB5mnd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 2 Sep 2021 11:22:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
>=20
> between commit:
>=20
>   477f70cd2a67 ("Merge tag 'drm-next-2021-08-31-1' of git://anongit.freed=
esktop.org/drm/drm")
>=20
> from Linus' tree and commit:
>=20
>   cc947bf91bad ("drm/amdgpu: Process any VBIOS RAS EEPROM address")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (I used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BCp7KyTTiIFwpL2JVsB5mnd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE6seAACgkQAVBC80lX
0GxBrggAnHHX2ADaOdAsEV4PBTzxzBW2MPGieyYcPSGn/oAPVIBaDh/Wc1IlUt9b
UrRH9ldAeb6Z9JGFb8q3KSb1add/K8HHH+2r+7PkiDoK9DnN6guJZebP+6cWDU6b
olK/B7/EX23+kbHAICzchXvqiJca09VjPxgtp0o0xgceIODdA3qlMmCiMKpIYrso
ffXask+VZSLxxdWTIYyf6KACXluzpLCXY488zgAZMjAP1T+YgIAfWjAmW+Y/Itvm
j+jwSHOhqSwrUFMIG8xFxDYuPI+Q953aX9KgCRHw70JqvK9cngACWH2Y46sXvHgD
QyQ6MK5f/LdqPlxO5+vGDzTvnTMhUg==
=ZAHz
-----END PGP SIGNATURE-----

--Sig_/BCp7KyTTiIFwpL2JVsB5mnd--
