Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C368203
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 03:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552F889829;
	Mon, 15 Jul 2019 01:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AD89829
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 01:11:48 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45n58c4JyTz9sDQ;
 Mon, 15 Jul 2019 11:11:44 +1000 (AEST)
Date: Mon, 15 Jul 2019 11:11:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the drm
 tree
Message-ID: <20190715111144.24d303df@canb.auug.org.au>
In-Reply-To: <20190709100645.5302a5c9@canb.auug.org.au>
References: <20190624204908.64a33862@canb.auug.org.au>
 <20190624210659.152a20bb@canb.auug.org.au>
 <20190709100645.5302a5c9@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1563153106;
 bh=+EFxW7lfuaRKJ9IfT8iLFDOaEU0DyeJaAtDegePrkmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vm2aqd5ZbAQFzUP8J7NhirTVo8416jy46FXq+iofZyI1eDIWzM54/OnF0lsCvFtXD
 zL4BQuKj5gOxTYQ77k0JEobmEyD5Jje9qGw5HPDfZZk1Jb7ptxvOj52sIIVSapEFK0
 qbomVdnJ0p5NNMlQF8pwcHdB0rjUeWsUM5QaQQ0YfBppLQwZC2khAWT5YWqKAX0KKL
 L3fF0grYi5uTkGGJP3QPMOtf80udfqHQGfXV3sezjfP2Y+IXDy21rochviK3dN/N9+
 4rXJNrOhuy79e+1IwJSWSOBzoqn43zsNLGFygyBQx81urnntbc/xRUU1iOKdGNV4vQ
 gxUNwitdpGw/Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: multipart/mixed; boundary="===============1586331079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1586331079==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KRQeiCZ1x+C30jKBozlhXat"; protocol="application/pgp-signature"

--Sig_/KRQeiCZ1x+C30jKBozlhXat
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2019 10:06:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 24 Jun 2019 21:06:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 24 Jun 2019 20:49:08 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > Today's linux-next merge of the akpm-current tree got a conflict in:
> > >=20
> > >   mm/memory.c
> > >=20
> > > between commit:
> > >=20
> > >   29875a52915e ("mm: Add an apply_to_pfn_range interface")
> > >=20
> > > from the drm tree and commit:
> > >=20
> > >   e972cea08fb3 ("mm/pgtable: drop pgtable_t variable from pte_fn_t fu=
nctions")
> > >=20
> > > from the akpm-current tree.
> > >=20
> > > I fixed it up (see below my signature, then added the following merge
> > > resolution patch as well) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your t=
ree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particula=
rly
> > > complex conflicts.
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 24 Jun 2019 20:40:46 +1000
> > > Subject: [PATCH] merge fixup for "mm: Add an apply_to_pfn_range inter=
face"
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  include/linux/mm.h    | 2 +-
> > >  mm/as_dirty_helpers.c | 8 ++------
> > >  2 files changed, 3 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 87d53de3dee4..4404e18443ef 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -2673,7 +2673,7 @@ extern int apply_to_page_range(struct mm_struct=
 *mm, unsigned long address,
> > >  			       unsigned long size, pte_fn_t fn, void *data);
> > > =20
> > >  struct pfn_range_apply;
> > > -typedef int (*pter_fn_t)(pte_t *pte, pgtable_t token, unsigned long =
addr,
> > > +typedef int (*pter_fn_t)(pte_t *pte, unsigned long addr,
> > >  			 struct pfn_range_apply *closure);
> > >  struct pfn_range_apply {
> > >  	struct mm_struct *mm;
> > > diff --git a/mm/as_dirty_helpers.c b/mm/as_dirty_helpers.c
> > > index f600e31534fb..7c863626c2a4 100644
> > > --- a/mm/as_dirty_helpers.c
> > > +++ b/mm/as_dirty_helpers.c
> > > @@ -26,7 +26,6 @@ struct apply_as {
> > >  /**
> > >   * apply_pt_wrprotect - Leaf pte callback to write-protect a pte
> > >   * @pte: Pointer to the pte
> > > - * @token: Page table token, see apply_to_pfn_range()
> > >   * @addr: The virtual page address
> > >   * @closure: Pointer to a struct pfn_range_apply embedded in a
> > >   * struct apply_as
> > > @@ -36,8 +35,7 @@ struct apply_as {
> > >   *
> > >   * Return: Always zero.
> > >   */
> > > -static int apply_pt_wrprotect(pte_t *pte, pgtable_t token,
> > > -			      unsigned long addr,
> > > +static int apply_pt_wrprotect(pte_t *pte, unsigned long addr,
> > >  			      struct pfn_range_apply *closure)
> > >  {
> > >  	struct apply_as *aas =3D container_of(closure, typeof(*aas), base);
> > > @@ -78,7 +76,6 @@ struct apply_as_clean {
> > >  /**
> > >   * apply_pt_clean - Leaf pte callback to clean a pte
> > >   * @pte: Pointer to the pte
> > > - * @token: Page table token, see apply_to_pfn_range()
> > >   * @addr: The virtual page address
> > >   * @closure: Pointer to a struct pfn_range_apply embedded in a
> > >   * struct apply_as_clean
> > > @@ -91,8 +88,7 @@ struct apply_as_clean {
> > >   *
> > >   * Return: Always zero.
> > >   */
> > > -static int apply_pt_clean(pte_t *pte, pgtable_t token,
> > > -			  unsigned long addr,
> > > +static int apply_pt_clean(pte_t *pte, unsigned long addr,
> > >  			  struct pfn_range_apply *closure)
> > >  {
> > >  	struct apply_as *aas =3D container_of(closure, typeof(*aas), base);
> > > --=20
> > > 2.20.1
> > >=20
> > > --=20
> > > Cheers,
> > > Stephen Rothwell
> > >=20
> > > diff --cc mm/memory.c
> > > index 462aa47f8878,f8a75528658a..e7e37fcbd687
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@@ -2037,12 -2036,11 +2035,11 @@@ static int apply_to_pte_range(stru=
ct pf
> > >   {
> > >   	pte_t *pte;
> > >   	int err;
> > > - 	pgtable_t token;
> > >   	spinlock_t *uninitialized_var(ptl);
> > >  =20
> > >  -	pte =3D (mm =3D=3D &init_mm) ?
> > >  +	pte =3D (closure->mm =3D=3D &init_mm) ?
> > >   		pte_alloc_kernel(pmd, addr) :
> > >  -		pte_alloc_map_lock(mm, pmd, addr, &ptl);
> > >  +		pte_alloc_map_lock(closure->mm, pmd, addr, &ptl);
> > >   	if (!pte)
> > >   		return -ENOMEM;
> > >  =20
> > > @@@ -2050,10 -2048,8 +2047,8 @@@
> > >  =20
> > >   	arch_enter_lazy_mmu_mode();
> > >  =20
> > > - 	token =3D pmd_pgtable(*pmd);
> > > -=20
> > >   	do {
> > > - 		err =3D closure->ptefn(pte++, token, addr, closure);
> > >  -		err =3D fn(pte++, addr, data);
> > > ++		err =3D closure->ptefn(pte++, addr, closure);
> > >   		if (err)
> > >   			break;
> > >   	} while (addr +=3D PAGE_SIZE, addr !=3D end);   =20
> >=20
> > I also needed this:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 24 Jun 2019 21:04:14 +1000
> > Subject: [PATCH] another fixup for "mm: Add an apply_to_pfn_range inter=
face"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  mm/memory.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/mm/memory.c b/mm/memory.c
> > index e7e37fcbd687..81d71fbfca5a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -2189,14 +2189,13 @@ struct page_range_apply {
> >   * Callback wrapper to enable use of apply_to_pfn_range for
> >   * the apply_to_page_range interface
> >   */
> > -static int apply_to_page_range_wrapper(pte_t *pte, pgtable_t token,
> > -				       unsigned long addr,
> > +static int apply_to_page_range_wrapper(pte_t *pte, unsigned long addr,
> >  				       struct pfn_range_apply *pter)
> >  {
> >  	struct page_range_apply *pra =3D
> >  		container_of(pter, typeof(*pra), pter);
> > =20
> > -	return pra->fn(pte, token, addr, pra->data);
> > +	return pra->fn(pte, addr, pra->data);
> >  }
> > =20
> >  /*
> > --=20
> > 2.20.1 =20
>=20
> I am still getting this conflict (the commit ids may have changed).
> Just a reminder in case you think Linus may need to know.
>=20

These fix ups are now needed when merging the drm tree into Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/KRQeiCZ1x+C30jKBozlhXat
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0r0tAACgkQAVBC80lX
0GzzHQf+O4zxvTgB10N5ktRcxSE7/iq5c8Ax5VPj7Ipdslj4Tm76ou2vXNfK0am9
PnDLzpRRIxp5t5sDEdYcZRdQZXYL5BVCeLRM7FDozj3HwORK8oVPYpvwgz7A0uKT
c3qeRwi5yRjJdOuRdf1UFmyh4/AG4BN4+H2GkHKsau1FPr/4De7TsqBxovZVi7aC
HFDz6Sl0zCT0U2iCbcM+8BDa71NA+ls/LeAWi7ZEoHZxXxbC/zVV7iZZ753yBg/o
jexNlkl5aFA8pYVsiDclDso5mEWtPTi6SHckLJ9/O0bJChrEbDcyUy9SWCKUXpTP
Ecmj/O1JR00qH16IXXdEw+gmYhCR7A==
=F+tm
-----END PGP SIGNATURE-----

--Sig_/KRQeiCZ1x+C30jKBozlhXat--

--===============1586331079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1586331079==--
