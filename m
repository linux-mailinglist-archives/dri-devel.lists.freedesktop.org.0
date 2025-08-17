Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211EB295B7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 01:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9E910E030;
	Sun, 17 Aug 2025 23:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UqhTu58U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F5410E030
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1755474338;
 bh=2P+EHdBkMskSxtDh++Brhi8O6amrL6pAeciOLHwpaDY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UqhTu58UYwkwvVPt9UoW2gxCZFnzSRz5A0JN9TTjwKgboLp7DPyn334kh4FEAeD5o
 eMhfshQt4y3OxhqlB3hAwGbicKxb6gD1cU/j01QoJhpY2iLqkjBsaGj2uQvL5IcxT5
 TXHndWs8ulV3qT3XSDFZ1r1qUTvaXWIeWw3e6IwGAtUwZo9KZO12dSoe0YVgr5eu6I
 SaXJiryEN3YiGrzZedtUySivIv0+nU6FdhctGLbShcsyZ7+70oExZZDFrg+/XPfhFc
 Yu20zD3VqV0svo/V5IlybP2mfutpooMav8pNWAcCqUMXrMioIYN9LMVJTyi4vskeMp
 xd+/Xh9uunW5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4ssq4xMTz4wbr;
 Mon, 18 Aug 2025 09:45:35 +1000 (AEST)
Date: Mon, 18 Aug 2025 09:45:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
 usage in literal code block
Message-ID: <20250818094535.34358d39@canb.auug.org.au>
In-Reply-To: <fefba786-57d4-4138-9454-7cd3d924239d@infradead.org>
References: <20250709024501.9105-1-bagasdotme@gmail.com>
 <aade485e-0880-4c68-9b37-d8a27dc122e3@kernel.org>
 <fefba786-57d4-4138-9454-7cd3d924239d@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RA3ANG7T.uTmLH1kJb1QB+j";
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

--Sig_/RA3ANG7T.uTmLH1kJb1QB+j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun, 17 Aug 2025 16:24:02 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 7/9/25 12:37 AM, Danilo Krummrich wrote:
> > On 7/9/25 4:45 AM, Bagas Sanjaya wrote: =20
> >> Stephen Rothwell reports multiple indentation warnings when merging
> >> drm-msm tree:
> >>
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2445: ERRO=
R: Unexpected indentation. [docutils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2447: WARN=
ING: Block quote ends without a blank line; unexpected unindent. [docutils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2451: WARN=
ING: Definition list ends without a blank line; unexpected unindent. [docut=
ils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2452: WARN=
ING: Definition list ends without a blank line; unexpected unindent. [docut=
ils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2456: ERRO=
R: Unexpected indentation. [docutils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2457: WARN=
ING: Definition list ends without a blank line; unexpected unindent. [docut=
ils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2458: WARN=
ING: Definition list ends without a blank line; unexpected unindent. [docut=
ils]
> >> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2459: WARN=
ING: Definition list ends without a blank line; unexpected unindent. [docut=
ils]
> >>
> >> Fix these by wrapping drm_gpuvm_sm_map_exec_lock() expected usage
> >> example in literal code block.
> >>
> >> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
> >> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> Closes: https://lore.kernel.org/linux-next/20250708192038.6b0fd31d@can=
b.auug.org.au/
> >> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com> =20
> >=20
> > I assume this has to go through the MSM tree?
> >=20
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> >  =20
>=20
> Hi,
> What's happening with this patch?
> It was posted about 6 weeks ago and the build warnings
> are still in mainline (6.17-rc2).

This is commit

  bb324f85f722 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usag=
e in literal code block")

in the drm-msm-fixes tree in linux-next.  I assume that will migrate to
the drm-fixes tree and thence to Linus' tree in the next week (or so).

--=20
Cheers,
Stephen Rothwell

--Sig_/RA3ANG7T.uTmLH1kJb1QB+j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiiaZ8ACgkQAVBC80lX
0Gyt2wf+NqmxZi/kfKr9oBpm5/Cg5mbT0lTbONN0etRgSh6JkLk1evERWcsyhTAo
VrxYiVtHOHGqjasqfSdy2IhciNF5A3YpN58nz6fobL154gWcPEFfyJYX+71Y2qaX
OJrLg06Tx5nFXCznXy2/pHAJozPkuSgpFD4gqiuE/R71ef/13YICDJTBhCVAMihk
3d3MZsL10Ku27GcaNGNZojvCBKc/+IcTg1KXiPODv967JGFBpJLig58naKU6j4BU
glNAaOmKxL+D8qegT+TNjrd+rpsnVD6XS9EAK3fhazps7k6F27eeZSNcljdFVHqk
GY24rkFlYggFL2t1lLsocS44A3rFug==
=yEjJ
-----END PGP SIGNATURE-----

--Sig_/RA3ANG7T.uTmLH1kJb1QB+j--
