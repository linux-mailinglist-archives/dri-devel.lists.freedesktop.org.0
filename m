Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF4928C7A6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 05:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0616E85B;
	Tue, 13 Oct 2020 03:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5216E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 03:42:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9LwD07hKz9sT6;
 Tue, 13 Oct 2020 14:42:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602560559;
 bh=GEqBajAoaf13XptTrK1TDEQG6PHH+8szhyZhRsD/1II=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BiEf9+zh12xMK+xymD9P/iuOTqIWM+e8btEPeRaYbFtxK37uogOusWmxOODz643gT
 yFcj2iC1rmwGtaVqj6CqQZwc05SMC4GpHr5JdRcCj68Qsh6M+V0oXOBLzHDAEL54d+
 Zxm1fR1j+RanX6M/E9hxszD7ISTAlwIJLL8M2qzt2LcM2uMY5AKSM2CsKeytwEzsWG
 KnKoaq45gyD737YjKiIInJACZPP/zuHLpwXe2ovwjyplMM76JBlQVzI0CTVllztyLj
 AX/VHeNKHOTtLvgqNlp/YUD71y1XQxedIOiyAdoNh9w2j9MOLl1AhyEBbzaQs/MVXo
 jcTe5GPlUaNRA==
Date: Tue, 13 Oct 2020 14:42:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the tip tree with the amdgpu tree
Message-ID: <20201013144235.266e07a2@canb.auug.org.au>
In-Reply-To: <20201012151527.35437f3e@canb.auug.org.au>
References: <20200923151336.1664ad72@canb.auug.org.au>
 <20201012151527.35437f3e@canb.auug.org.au>
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
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@elte.hu>
Content-Type: multipart/mixed; boundary="===============1960223535=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1960223535==
Content-Type: multipart/signed; boundary="Sig_/PgIPqY=vSBtmqn.IJ7kyACf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PgIPqY=vSBtmqn.IJ7kyACf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Oct 2020 15:15:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Wed, 23 Sep 2020 15:13:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the tip tree got a conflict in:
> >=20
> >   drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> >=20
> > between commit:
> >=20
> >   59d7115dae02 ("drm/amdkfd: Move process doorbell allocation into kfd =
device")
> >=20
> > from the amdgpu tree and commit:
> >=20
> >   c7b6bac9c72c ("drm, iommu: Change type of pasid to u32")
> >=20
> > from the tip tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> >=20
> > diff --cc drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > index 739db04080d0,922ae138ab85..000000000000
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > @@@ -739,7 -723,8 +739,7 @@@ struct kfd_process=20
> >   	/* We want to receive a notification when the mm_struct is destroyed=
 */
> >   	struct mmu_notifier mmu_notifier;
> >  =20
> > - 	uint16_t pasid;
> > + 	u32 pasid;
> >  -	unsigned int doorbell_index;
> >  =20
> >   	/*
> >   	 * List of kfd_process_device structures, =20
>=20
> This is now a conflict between the tip tree and the drm tree.


This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PgIPqY=vSBtmqn.IJ7kyACf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FIisACgkQAVBC80lX
0GyA7wgAplCRgdGqSwBPy5vfx/+q/+GRCgqAHouzrv+xA80y+EGx07nsIx6rJiVW
qS1faE8HcNrUMDCYvLzTUIpP0jpDoldXakmQBA+tq0JAGBq8Sp3dZbI6yt7b/Jgm
ImjW98un3YjWGbF3+TVzHetBw9aM5cs0ITmdK8y86w6/oV7Ccbvo8u0LBkcIhl1g
IALnsjpj9myFWZgCpy2kxCbazkMQ8VzeMlDWGLRZKfX6itRX9fKjWoTvW0bVhl8D
+/AdKq1s8R+5sa5rrqvZj/zp2AOkrVKcYiXyy6lZ4/rcPIRhwzQKbyBOdfPRTmvJ
OK5/0rdgCOR6VzXsdPRBDBb0JmK2xw==
=uDSe
-----END PGP SIGNATURE-----

--Sig_/PgIPqY=vSBtmqn.IJ7kyACf--

--===============1960223535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1960223535==--
