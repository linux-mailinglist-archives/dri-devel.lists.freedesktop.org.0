Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85228ACB6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 06:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC086E405;
	Mon, 12 Oct 2020 04:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3433E6E405
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 04:15:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8lhf3dFFz9sT6;
 Mon, 12 Oct 2020 15:15:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602476138;
 bh=qRlA3PEPmV+DOuRWw0DdVgVH+cyOln9+rznSPiRFlf0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qtG5o3ZjBkuX8YPPJwHiHlZvUGuzyA75kS/rmYGcG34HldqLoeNKoJhGs3oBs159m
 bw+9SezzYeELNdc+1as+KAALrSpjR2ZxAaBi/jFKPBBJLEJiOGxzCuBK81e5InSbL0
 3kszUHbBlGo0EYWwiOYh7LDThl4iSv0FS0px3q1PLkArerMc5DPhMYZz3MyJyz0i8J
 vUYbYX3VbP0arXXQZ7NqEAnQnUaZXyFnPVArAZT/9Iyv38i3fkAExIkfsnSJ3XeGJJ
 rRiSprlrw0uRipjDxPzRu/7m2tl16gWGDDBrlAE3XtNhHirT0u2IFbsGaDjmfpz+cB
 Hwxj4Pdj9b3lQ==
Date: Mon, 12 Oct 2020 15:15:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the tip tree with the amdgpu tree
Message-ID: <20201012151527.35437f3e@canb.auug.org.au>
In-Reply-To: <20200923151336.1664ad72@canb.auug.org.au>
References: <20200923151336.1664ad72@canb.auug.org.au>
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>
Content-Type: multipart/mixed; boundary="===============0058336104=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0058336104==
Content-Type: multipart/signed; boundary="Sig_/rZAz_47K3UpQKnQoEVdS5dk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rZAz_47K3UpQKnQoEVdS5dk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Sep 2020 15:13:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>=20
> between commit:
>=20
>   59d7115dae02 ("drm/amdkfd: Move process doorbell allocation into kfd de=
vice")
>=20
> from the amdgpu tree and commit:
>=20
>   c7b6bac9c72c ("drm, iommu: Change type of pasid to u32")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 739db04080d0,922ae138ab85..000000000000
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@@ -739,7 -723,8 +739,7 @@@ struct kfd_process=20
>   	/* We want to receive a notification when the mm_struct is destroyed */
>   	struct mmu_notifier mmu_notifier;
>  =20
> - 	uint16_t pasid;
> + 	u32 pasid;
>  -	unsigned int doorbell_index;
>  =20
>   	/*
>   	 * List of kfd_process_device structures,

This is now a conflict between the tip tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/rZAz_47K3UpQKnQoEVdS5dk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+D2F8ACgkQAVBC80lX
0Gz6Zwf/YyfT7VjXx7kAbcgPS57KP/ja4UYDAkXG2fdK688Yvzo6tZT4vK1c4zzb
jdnK1KdJ2CQu29R+lvkf/gMYXYxBTwaCxp8aUx7TMvfcDqbIku0qFZvxLRyFCVQ/
XTB0W78i+uY/IGWbcfTbtUFkvkgYMKSNctdAuYSAlL+OBJzCf7c0fN4G36MHxW2P
PaEsJSqtMPPBmpiQeo3iN7GxkyUg3WOcu6oYFYltjk6IiG4LyQyRik2u8F3aTVin
aHGtAOvCwUVywrzETTJBBScyVPIv4VdwEGe0U4E/Ki09C0+RBtJTrMNqqMmokfGi
gg1tkTn6Xq5NSNKT/RkIbLs+3bjM7g==
=T4Nh
-----END PGP SIGNATURE-----

--Sig_/rZAz_47K3UpQKnQoEVdS5dk--

--===============0058336104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0058336104==--
