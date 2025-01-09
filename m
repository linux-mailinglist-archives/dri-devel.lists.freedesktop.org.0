Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54EA06DB0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 06:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6210ECE7;
	Thu,  9 Jan 2025 05:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e4XzP0Cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1DF10ECE5;
 Thu,  9 Jan 2025 05:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736401297;
 bh=f6Sw4MAxXlgz0pR/RQDRmbvPhWxR3e2PeXOJs2luinM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e4XzP0Cu1z5NLUNHcmWDvgub19QoVIavDXkHgyr7mRORdEOqwrOtfxbHtm2uY+CDU
 QZtlEZLLFclyxgvrZ66vL2aU45ACL9eOPSfoThUeU7pDVB89Ih/7EyIenPDv7K186n
 YNqyI+S2N7MyrDkfJ/tvhiULjpof5QK9f3IzTpRCD2UGp7XmX2jpR/i4fem+Xg2wf+
 f80JsjcGbioncCXgHABUY1L5XV2rEVCoX7/zsVYKOsPPsk3bL/trb+iGtPXE1CPwti
 lhWY/YwW6BWdoFs8dqJLhNPQf52MgPnJB7lQWmPtMCK+iwAfEiS0IGi7bnsGj5hIqv
 z9OBZao6Ax75Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTDDc3CnPz4w2M;
 Thu,  9 Jan 2025 16:41:36 +1100 (AEDT)
Date: Thu, 9 Jan 2025 16:41:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Matt Roper <matthew.d.roper@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with Linus' tree
Message-ID: <20250109164142.07cd8023@canb.auug.org.au>
In-Reply-To: <20241216183801.0d5c9a5f@canb.auug.org.au>
References: <20241125120921.1bbc1930@canb.auug.org.au>
 <20241216183801.0d5c9a5f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yXwjqy1v8zCMpHf2Pl8=x_s";
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

--Sig_/yXwjqy1v8zCMpHf2Pl8=x_s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Dec 2024 18:38:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 25 Nov 2024 12:09:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the drm-xe tree got a conflict in:
> >=20
> >   include/drm/intel/xe_pciids.h
> >=20
> > between commit:
> >=20
> >   493454445c95 ("drm/xe: switch to common PCI ID macros")
> >=20
> > from Linus' tree and commit:
> >=20
> >   ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")
> >=20
> > from the drm-xe tree.
> >=20
> > I fixed it up (I deleted the file and added the following merge fix pat=
ch)
> > and can carry the fix as necessary. This is now fixed as far as linux-n=
ext
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 25 Nov 2024 12:05:38 +1100
> > Subject: [PATCH] fix up for "drm/xe/ptl: Add another PTL PCI ID"
> >=20
> > interacting with "drm/xe: switch to common PCI ID macros" from Linus'
> > tree.
> > ---
> >  include/drm/intel/pciids.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index 32480b5563db..7883384acd5e 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -829,6 +829,7 @@
> >  	MACRO__(0xB092, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A2, ## __VA_ARGS__)
> > +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> > +	MACRO__(0xB0B0, ## __VA_ARGS__)
> > =20
> >  #endif /* __PCIIDS_H__ */
> > --=20
> > 2.45.2 =20
>=20
> OK, so commits ae78ec0a52c4 and 493454445c95 were merged in commit
>=20
>   8f109f287fdc ("Merge drm/drm-next into drm-xe-next")
>=20
> but include/drm/intel/xe_pciids.h was not deleted (it is not longer
> referenced anywhere in the tree) and the above patch was not applied :-(
>=20
> Since then that part of the drm-xe tree has been merged into the drm
> tree in commit
>=20
>   bdecb30d579e ("Merge tag 'drm-xe-next-2024-12-11' of https://gitlab.fre=
edesktop.org/drm/xe/kernel into drm-next")
>=20
> So, include/drm/intel/xe_pciids.h needs to be removed from the drm tree
> and the above patch applied there.

Ping?
--=20
Cheers,
Stephen Rothwell

--Sig_/yXwjqy1v8zCMpHf2Pl8=x_s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/YZYACgkQAVBC80lX
0GzvnwgAgNkJzbDj5gapAk8StTFF3CT3b2Vn2mLZo7V8/4IQxO/9uEdgVUmDvdV+
K25/ikWw26DPnSU4dI+j1BxTMzBHKr6kfOGtm520Wpuy+GcColN/0zxqnP8JGB2h
AmjTBM6efrBx9K6jIhc761DmGffICzxPLV86VidDsQ/1cHhg9Quw1E1TGDIt3e1G
mKBDuJOMrwltb4g662JCWrY4x3NCgHGB7UeyNFoaMKbK+jaNlasbHwHQvPNhTCc1
USKrBiaa5uVea0rOHd0MMaAHriVHob5T/+Fol1OFtu64R8KbRzcY9Bgca5OlRBE4
1TGUdbCJSTruLHLzEt/xKzuD8EqG7Q==
=EeeT
-----END PGP SIGNATURE-----

--Sig_/yXwjqy1v8zCMpHf2Pl8=x_s--
