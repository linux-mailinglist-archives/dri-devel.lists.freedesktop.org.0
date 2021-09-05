Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D151401200
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 00:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1E89AB5;
	Sun,  5 Sep 2021 22:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07D589AB5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 22:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1630882190;
 bh=HLOvfxbxXb3FxOxIKAdv2pX48rGLlxxWXoan08jxYrk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mWbRs4HRr712F0C2s+k/WTMgK658bCW8tcgbonJZ+jC2oHdZl+7lfZt8aXraFaLOY
 hFIKDnHr+/Nx2I5VvyUdN0eXnj//ODGigFrXNSQKC9+24Ioaz8OKIPy69UtlaRe1qi
 tdlui6OXf/D6FrFe0cULQJak/eMK9gNUF1x2+jFiGRrdsbWsCFlrvsOO6iDATeD5HI
 4/d5xHkLv4nzwVe53rkibusLfVj5f+4RAuMUVQJ2DBTngLj62zVe5ctlH9YCSa556Y
 N2rhKLflytg6VA70QnSA4uL0kNoKRsDIOWw/eNZe9dT+xBI3d/eb7+GR85NfLlB0jU
 vHJ8/X1wY5rFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2mv0623Kz9sRN;
 Mon,  6 Sep 2021 08:49:48 +1000 (AEST)
Date: Mon, 6 Sep 2021 08:49:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Dave Airlie <airlied@linux.ie>
Cc: DRI <dri-devel@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20210906084947.4f65761d@canb.auug.org.au>
In-Reply-To: <20210902075038.7461d3c8@canb.auug.org.au>
References: <20210820123348.6535a87e@canb.auug.org.au>
 <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
 <20210902075038.7461d3c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rHCDOd8YXWXEesWyDS.Uvao";
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

--Sig_/rHCDOd8YXWXEesWyDS.Uvao
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 2 Sep 2021 07:50:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 20 Aug 2021 15:23:34 +0900 Masahiro Yamada <masahiroy@kernel.org>=
 wrote:
> >
> > On Fri, Aug 20, 2021 at 11:33 AM Stephen Rothwell <sfr@canb.auug.org.au=
> wrote: =20
> > >
 > > After merging the drm tree, today's linux-next build (x86_64 allmodcon=
fig)
> > > failed like this:
> > >
> > > In file included from drivers/gpu/drm/i915/i915_debugfs.c:39:
> > > drivers/gpu/drm/i915/gt/intel_gt_requests.h:9:10: fatal error: stddef=
.h: No such file or directory
> > >     9 | #include <stddef.h>
> > >       |          ^~~~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   564f963eabd1 ("isystem: delete global -isystem compile option")
> > >
> > > from the kbuild tree interacting with commit
> > >
> > >   b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work =
with GuC")
> > >
> > > I have applied the following patch for today.   =20
> >=20
> >=20
> > Thanks.
> >=20
> > This fix-up does not depend on my kbuild tree in any way.
> >=20
> > So, the drm maintainer can apply it to his tree.
> >=20
> > Perhaps with
> >=20
> > Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to
> > work with GuC") =20
>=20
> OK, so that didn't happen so I will now apply the merge fix up to the
> merge of the kbuild tree.
>=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Fri, 20 Aug 2021 12:24:19 +1000
> > > Subject: [PATCH] drm/i915: use linux/stddef.h due to "isystem: trim/f=
ixup stdarg.h and other headers"
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_gt_requests.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gp=
u/drm/i915/gt/intel_gt_requests.h
> > > index 51dbe0e3294e..d2969f68dd64 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > @@ -6,7 +6,7 @@
> > >  #ifndef INTEL_GT_REQUESTS_H
> > >  #define INTEL_GT_REQUESTS_H
> > >
> > > -#include <stddef.h>
> > > +#include <linux/stddef.h>
> > >
> > >  struct intel_engine_cs;
> > >  struct intel_gt;
> > > --
> > > 2.32.0 =20

Ping?  I am still applying this ...
--=20
Cheers,
Stephen Rothwell

--Sig_/rHCDOd8YXWXEesWyDS.Uvao
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1SYwACgkQAVBC80lX
0GzocQf9Hbk/NCe1tCE6SDfj4l3Ue+K5BC4hYy77bXbpcfYpogjX92A7hXTm5oSG
pAb9m334jBa671mGuI6YzZU+GQOAqmksUdcxa/BsBQWkYZr3OtyPXIsXJK3ZIE/v
xQAANw9HPHpwELE5MigM0fdTgbj6w5EDlrPgRvm3rbEMdx8fBXbILyoQJXGs6DQ+
Zhj905OdWHXmqe3cnzJ9O7zmO4v2hdhIsLkSklB7PN9xN/x6nMC4pEwELWZJPaAe
/3Z1Nf3DxnQpO50n+vQV2TrTbawE/TaA3K0QLiUlx5l/l1ggXJE1Zvw351yYarGU
b4Gc8NIaI2kfbFwIpsKNCShHvYwQtg==
=CKFT
-----END PGP SIGNATURE-----

--Sig_/rHCDOd8YXWXEesWyDS.Uvao--
