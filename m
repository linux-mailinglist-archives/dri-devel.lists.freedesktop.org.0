Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD493FE518
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 23:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8457B6E3AA;
	Wed,  1 Sep 2021 21:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13076E3AA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1630533041;
 bh=OY1P0NChdTXcHt/2A+jR/99JxOv1oHCWF263N2hy8mw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4cGsRoFHf8XN5JQkJdu+/zv1sRbm+06+YXLv019NXxZspKk+aHM1Que6aedwA0Gc
 hadVHuPbB5QZHbV7mRiib+W5jDcS4KkJmtuWWrPwfCd+QFqRatGLlMi7wRWKsrNiAw
 UxOKP2Nj1qyMRdFiEQSp3lYFRhSjB74uqFYMItlqMghLLDMrn2r14G6cbfCFOdI6rj
 cZJNYGt/DxkdbyTeUY5fQ8FitbYxUkMOxpklhe1V2BkKv2rC4iaKnPsJrGmM/Df8Ts
 p8M2o0QL+DYXUM9GGrYEmbDlQ4giaDGRPWjyFWlq6Y7UPwxQVriZdgZzvhs8lgJM4c
 LRv/SDL28VOBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0Hmc0tldz9sPf;
 Thu,  2 Sep 2021 07:50:40 +1000 (AEST)
Date: Thu, 2 Sep 2021 07:50:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 John Harrison <John.C.Harrison@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20210902075038.7461d3c8@canb.auug.org.au>
In-Reply-To: <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
References: <20210820123348.6535a87e@canb.auug.org.au>
 <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P6VydhTMW+uTGLu/gN5IeDS";
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

--Sig_/P6VydhTMW+uTGLu/gN5IeDS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, 20 Aug 2021 15:23:34 +0900 Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>
> On Fri, Aug 20, 2021 at 11:33 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > Hi all,
> >
> > After merging the drm tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >
> > In file included from drivers/gpu/drm/i915/i915_debugfs.c:39:
> > drivers/gpu/drm/i915/gt/intel_gt_requests.h:9:10: fatal error: stddef.h=
: No such file or directory
> >     9 | #include <stddef.h>
> >       |          ^~~~~~~~~~
> >
> > Caused by commit
> >
> >   564f963eabd1 ("isystem: delete global -isystem compile option")
> >
> > from the kbuild tree interacting with commit
> >
> >   b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work wi=
th GuC")
> >
> > I have applied the following patch for today. =20
>=20
>=20
> Thanks.
>=20
> This fix-up does not depend on my kbuild tree in any way.
>=20
> So, the drm maintainer can apply it to his tree.
>=20
> Perhaps with
>=20
> Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to
> work with GuC")

OK, so that didn't happen so I will now apply the merge fix up to the
merge of the kbuild tree.

> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 20 Aug 2021 12:24:19 +1000
> > Subject: [PATCH] drm/i915: use linux/stddef.h due to "isystem: trim/fix=
up stdarg.h and other headers"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_requests.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/=
drm/i915/gt/intel_gt_requests.h
> > index 51dbe0e3294e..d2969f68dd64 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > @@ -6,7 +6,7 @@
> >  #ifndef INTEL_GT_REQUESTS_H
> >  #define INTEL_GT_REQUESTS_H
> >
> > -#include <stddef.h>
> > +#include <linux/stddef.h>
> >
> >  struct intel_engine_cs;
> >  struct intel_gt;
> > --
> > 2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/P6VydhTMW+uTGLu/gN5IeDS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEv9a4ACgkQAVBC80lX
0Gyfhgf/cOlOxQo7LdY6lacikjcXfwu1wdLPW7Z3AjOGWTohweO9GYJFgtOkKyEo
7/pjpAPYTYNU/47awEy4DBjE8LS6z6A4gkakVkcd4E1GchD/HnVHyxOyZICwTwPX
Oe3fvd7ZbjIxJ3FCUlFPySi4VydWeL2BBdAdjCEFYkcVuy33sEvx9xEQLr6X+99u
JFZi6nIvbFTb5EjnAraJ5M1wwHDU+03Gzef2iLJTWWbWdYeYg2QuPbgafy9MWu+6
ZrCim6nvKB/2oZ3I7YJZDCkAhmGqS1kPnrSZwjznIMoY3aJbOOOrCugfa2cOrhSR
DmQZ1rwMa0TKMZcj8SypG166QiBV/w==
=QCKm
-----END PGP SIGNATURE-----

--Sig_/P6VydhTMW+uTGLu/gN5IeDS--
