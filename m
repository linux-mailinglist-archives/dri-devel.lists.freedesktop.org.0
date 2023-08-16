Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E877D7E7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 03:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6410E2B0;
	Wed, 16 Aug 2023 01:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241F10E2B0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 01:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1692151046;
 bh=VMPnkY84RVO6NpMoKoyotthWhgdo+45obicNwcXFlrk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qi3NAH7XvzfWYUbb7VIBKAqT7Xvdbxiv1si5fRcUHPdE6RM3JvtKGBG/mGTi71QhI
 T8zg1EYhb9dyB1mOwV36a5ZUaKpE1diQ4XcxuTiXUZ3ixm0/8WAIEAvjx9tNE7dys0
 IsPjgcGKiFYuNb4o69TI9Hi98Tfv74V3l51jp3TpsItwmaFdoR7Jh8sYUwtuMSlf01
 FKqhSbeNpkfoqvP0+gxT3aCHB4jHwWwGrVpaA/Q3+Ouu0h+C3OxpMajqip+JVrYRlk
 x0V8DVeShoZRdRH0k11Q977ZN74fqBm1D66+5n9JHrvRX3D1+1me1TAj9Oc5ZGDbmQ
 Krlex9UgJNiRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQWVF5rzfz4wxm;
 Wed, 16 Aug 2023 11:57:25 +1000 (AEST)
Date: Wed, 16 Aug 2023 11:57:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20230816115724.2671a521@canb.auug.org.au>
In-Reply-To: <20230815210747.6c409362@canb.auug.org.au>
References: <20230815210747.6c409362@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hLaiN2hlm7tF2C7EDsF6Q3d";
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hLaiN2hlm7tF2C7EDsF6Q3d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Aug 2023 21:07:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1: warning: 'product_name' not=
 found
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1: warning: 'product_name' not=
 found
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1: warning: 'serial_number' no=
t found
>=20
> Introduced by commit
>=20
>   7957ec80ef97 ("drm/amdgpu: Add FRU sysfs nodes only if needed")

The above commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hLaiN2hlm7tF2C7EDsF6Q3d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTcLQUACgkQAVBC80lX
0Gx4cAf/XHH+bTc/XVcVq6O0qqDdDZhcAHicG0j2VqCq0oEEqdqaUDiWy9qlF3Vk
vbbl3bzPEQpthRxaTIenrjnpKPqZmbK3mRX+U6oncMonzm4PyxhcG8LZrythdq6z
gTAJxcuYB+PCc0q69DrBVXn0k00SiG60WPra6W4KiZTrrn24mNI89YzO5C88m0xr
fujY7Yaaz4dcfon155dpROtOsl8W6Klha/xKXW+c6w3JN7UuJOCQBrSgxa2ZNy0g
Xt7fBwD6j13fe/uoW66mPIPCb1iAzWn7I3hllP8W+hbUw8OF35SlwqFwDIHxF8Tu
fLEokVYBM+TkRH2kxzF3959JSgyFqw==
=ts9/
-----END PGP SIGNATURE-----

--Sig_/hLaiN2hlm7tF2C7EDsF6Q3d--
