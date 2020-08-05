Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3423C44B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 06:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24CE6E4BB;
	Wed,  5 Aug 2020 04:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425E6E4BB;
 Wed,  5 Aug 2020 04:10:08 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLynj73ftz9sPB;
 Wed,  5 Aug 2020 14:10:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596600605;
 bh=EDbOdXhB1TuEBU9puRY1xAP4ZxDZ7O7baOhMHFmh68c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VY96+FzXDSNkzH5t3nOkfEHh/5sTtDsb2WaRwUbi51sm/UcOPyjoDvN8BE2azoBy2
 rprTCpTHXSCs6SZGC2ffuFIwpuiLOlroiSAjfOAuYXlv3RbVCVqJUkd78yliCkbGm5
 eA/DMlaD3SyAFLZ2YBe3gppMlQ9f5aKqKBpIV0PbSsFwfVz4HOSg55DaEEWWYWmI9v
 1UKK1jv3EldWt5fqV6I97hC7BgP9MPGbglOBDPFg4XnJ/JrzuWDgCke7gVSe3Cx6+B
 mxPqy+nlFdAMJeXfK+bUNDFu6wT94WZidOwHDEjcJvd66rzIg0VDP0d7+VY4/I49oW
 brnW9TTKSfRCA==
Date: Wed, 5 Aug 2020 14:10:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the kspp tree with the drm-misc tree
Message-ID: <20200805141001.61d49007@canb.auug.org.au>
In-Reply-To: <20200703143550.7ebbe771@canb.auug.org.au>
References: <20200703143550.7ebbe771@canb.auug.org.au>
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
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Suraj Upadhyay <usuraj35@gmail.com>
Content-Type: multipart/mixed; boundary="===============1236542569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1236542569==
Content-Type: multipart/signed; boundary="Sig_/AzVZzTwidl13XJIF7qAgGko";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AzVZzTwidl13XJIF7qAgGko
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 Jul 2020 14:35:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   drivers/gpu/drm/drm_edid.c
>=20
> between commit:
>=20
>   948de84233d3 ("drm : Insert blank lines after declarations.")
>=20
> from the drm-misc tree and commit:
>=20
>   80b89ab785a4 ("treewide: Remove uninitialized_var() usage")
>=20
> from the kspp tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/drm_edid.c
> index 252e89cb54a3,b98fa573e706..000000000000
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@@ -3095,8 -3051,7 +3095,8 @@@ static int drm_cvt_modes(struct drm_con
>   	const u8 empty[3] =3D { 0, 0, 0 };
>  =20
>   	for (i =3D 0; i < 4; i++) {
> - 		int uninitialized_var(width), height;
> + 		int width, height;
>  +
>   		cvt =3D &(timing->data.other_data.data.cvt[i]);
>  =20
>   		if (!memcmp(cvt->code, empty, 3))

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AzVZzTwidl13XJIF7qAgGko
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qMRkACgkQAVBC80lX
0Gx5EAf6AztnEL2f7GwFk68W7nbVmiG9c42Q99fUgYjjroldpn3PxcIFCK9HYeRT
zzlzfsACmqM9JIIRl152AIsBSINaiwrcOhWEIzQZa0/iUXiPSiv4TzZHycuqFZpg
UFBtg4BpWjSNEIlMKXa7hD0hi0NR1REHmLAKM54IS14g8Y27iwCWK8BN/osdmhXD
eyvXf9+U6Qm2f5SksMng15+jWg19faq01pUbKK762A95aJ6FUIbRTqRYmFk0vj/6
TRx05Zga+JriB2Kjc0ky2UUX56M36FQ6rl6+EWVb2afRkGLFiS8uwekKqk0m3sND
E8V47EqoKKyoNZmDDL4CYMvHUB4JOA==
=R67q
-----END PGP SIGNATURE-----

--Sig_/AzVZzTwidl13XJIF7qAgGko--

--===============1236542569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1236542569==--
