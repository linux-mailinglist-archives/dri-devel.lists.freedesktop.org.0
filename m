Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B151D4439
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 05:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1D96E3DF;
	Fri, 15 May 2020 03:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6636E3DF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 03:57:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49NZP230Cjz9sTc;
 Fri, 15 May 2020 13:57:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1589515048;
 bh=12E0Ox0MyQw9cxT/z4meYK73nLWFlNO8zC70oLHAhUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FNKSQ+ZYBLfP3AA2TdZRkgqeKFKxwncnhQrn2lM7Gr6UznLLjnZPkUnKy6yAiu1Fg
 r7yVyZYABvlb5WAXTxpA3u3HaoOO49sFjRnJZs7lTj3BnxeOgTnZT+wMjnE0oCHGmy
 PrkINelclN1Qvfe8PfYEeJP8kz6SLb/DV+lYqtFyE6MRuvRdFJF9iUnFRbho2U3jXl
 xlRdElKXB25T2UxyOVqwlO1qCgO+wp+oDAlFe7FdFz7ao94cTOXMwxw5jM7QKk5tQy
 +QagFh6LLigEdF/uzZDEIHZS4l/l8J5S4Ve81TA6rIDE9yaZz4NQHMnr/AVbI60FHn
 Ue8svm0QE4FQQ==
Date: Fri, 15 May 2020 13:57:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pm tree
Message-ID: <20200515135725.0b1c86f4@canb.auug.org.au>
In-Reply-To: <20200508143457.14acfc46@canb.auug.org.au>
References: <20200508143457.14acfc46@canb.auug.org.au>
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
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0882193676=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0882193676==
Content-Type: multipart/signed; boundary="Sig_/.UUGG4uWAFbeatE5ZxxWGWU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.UUGG4uWAFbeatE5ZxxWGWU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 May 2020 14:34:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>=20
> between commit:
>=20
>   e07515563d01 ("PM: sleep: core: Rename DPM_FLAG_NEVER_SKIP")
>=20
> from the pm tree and commit:
>=20
>   500bd19a7e5d ("drm/amdgpu: only set DPM_FLAG_NEVER_SKIP for legacy ATPX=
 BOCO")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index c201bc827389,4e4c9550dcf8..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@@ -189,10 -188,12 +188,12 @@@ int amdgpu_driver_load_kms(struct drm_d
>   		dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n");
>  =20
>   	if (adev->runpm) {
> - 		dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
> + 		/* only need to skip on ATPX */
> + 		if (amdgpu_device_supports_boco(dev) &&
> + 		    !amdgpu_is_atpx_hybrid())
>  -			dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NEVER_SKIP);
> ++			dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
>   		pm_runtime_use_autosuspend(dev->dev);
>   		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
> - 		pm_runtime_set_active(dev->dev);
>   		pm_runtime_allow(dev->dev);
>   		pm_runtime_mark_last_busy(dev->dev);
>   		pm_runtime_put_autosuspend(dev->dev);

This is now a conflict between the drm tree and the pm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.UUGG4uWAFbeatE5ZxxWGWU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6+EyUACgkQAVBC80lX
0Gxtpwf5ARnjH24OgC6q7HQG4R4ArdGvSQZUTc/rpSUhV2tsRhmTUXBGXkWd8+ve
1c+x2BP2fhwSdQSAjSHsae1b1dP96CbEulGcsIlprKWaU8+7qgXE3cW9gXCNrSXd
r78YrIzv45HjYDnXeGxSD++AIiT7MLEh+gNcZ5cNROZNxeBGxW5jaAfITZE4SdF0
oaDkwt4/pA+u9RQaLzi/Kp9QI2LnMZovp+/yw5PRJaPL85b3oWJbE3uzHdqC6R3e
lN7V7KQvbJOtx0QydK+KMSUOBwJbqbLcbj7d7YxbDwc6OGo2IPEOVyYqqf2zaWpC
KRWZTUJObUzwHHU3wbhEJU949df/yA==
=N9JX
-----END PGP SIGNATURE-----

--Sig_/.UUGG4uWAFbeatE5ZxxWGWU--

--===============0882193676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0882193676==--
