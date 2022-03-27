Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22484E8B24
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 01:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4518F10E9FA;
	Sun, 27 Mar 2022 23:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6CD10E9F2;
 Sun, 27 Mar 2022 23:57:03 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KRXmk66JHz4xLS;
 Mon, 28 Mar 2022 10:56:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1648425418;
 bh=mwdXhjR/8rDA+sfg/YZQAQEnt90wTQFzvAOGkvL77WE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQziQp8FTmL8Pkao1uSjJ0tx9z9HhTPI1etwg6B294XNV+sjoDyuMe6V/1O7ClJVI
 WEhZlULkGYxxJU9lt/AtZnWqlQOXOBOtk+9bTKcka7/5uNUBHa4KXhTjz8c+jVHstk
 bst/0pPAuQH2NJ3SuEFHQhSvUeMxX0uGCL0oZCIY0KUlW7JDUdtnBwiGoWUODLDWke
 t4aLr0ZofZzqBCN/XAoN2EgOgbTEI+Fo+A4uJ4DkjFw6lCYF/xhgIoD26b0F0+pBOx
 f/JEUe+mgmEl5SM5+wr2goR7rMr8CcAcrctYbmEIYNGB2bLUK1450cL6INQ7Srj63Q
 FAo1WffcSJQEQ==
Date: Mon, 28 Mar 2022 10:56:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20220328105653.033d2920@canb.auug.org.au>
In-Reply-To: <14b6a691-d31e-2e54-cf91-352b9b30414d@amd.com>
References: <20211117134926.1d339d71@canb.auug.org.au>
 <20220120142639.02c54ae9@canb.auug.org.au>
 <20220302123126.65bcbc82@canb.auug.org.au>
 <14b6a691-d31e-2e54-cf91-352b9b30414d@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/isjWQJ7skPGKi+0oxFUkoBP";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/isjWQJ7skPGKi+0oxFUkoBP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrey,

On Tue, 1 Mar 2022 22:26:12 -0500 Andrey Grodzovsky <andrey.grodzovsky@amd.=
com> wrote:
>
> On 2022-03-01 20:31, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Thu, 20 Jan 2022 14:26:39 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >> On Wed, 17 Nov 2021 13:49:26 +1100 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote: =20
> >>> After merging the drm-misc tree, today's linux-next build (htmldocs)
> >>> produced this warning:
> >>>
> >>> include/drm/gpu_scheduler.h:316: warning: Function parameter or membe=
r 'work' not described in 'drm_sched_job'
> >>>
> >>> Introduced by commit
> >>>
> >>>    542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a process=
es") =20
> >> I am still seeing this warning. =20
> > I am still seeing this warning.
> > =20
> Please check you have commit c7703ce38c1e Andrey Grodzovsky=C2=A0=C2=A0 3=
 weeks ago=C2=A0=C2=A0=C2=A0 drm/amdgpu: Fix htmldoc warning

I do have commit c7703ce38c1e (in fact it is in Linus' tree), but that
commit does not address the warning above.  I am still (as of Friday)
getting that warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/isjWQJ7skPGKi+0oxFUkoBP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJA+cYACgkQAVBC80lX
0Gzr5Af9Fho4i/XiOVidND1OAco3hiL0X0forPuNkqXspGn7In3jcQF9FPoyLRBe
K6W4fuIwY6uI7IntVQVqfQVN8Lv0KOdSBo9ZN7Sj9jF5yiEZXXAjXo29KnqNBQpN
yiRO4cEYRaIfpHzNipahXWke0b7Yk68LfDAr0anEEVFxAr82UTWb4hQ8EITyWRo4
J8AfZP69C+5FvKLFZZ/PHkF6Ggg48l5XaDd5YR9g5VFKQEm1Nx5ngFH+ijEB4bX1
wIxxbJCMXO5oTkgU3oDYQYYJQ7NsOrYR3yC6fJPvq+EYO2OKQSgGeLZ5BhysGxXa
Wi6zTE+wvS4yAbUbDPQZg+WCDXZWiA==
=KbTg
-----END PGP SIGNATURE-----

--Sig_/isjWQJ7skPGKi+0oxFUkoBP--
