Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F344CDA0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 00:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B86089B4D;
	Wed, 10 Nov 2021 23:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A753589B97;
 Wed, 10 Nov 2021 23:06:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqL7D6gbSz4xct;
 Thu, 11 Nov 2021 10:06:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636585564;
 bh=WGth6Po766mR2Bwdj56BJ4xzcwyQf12GeSKl7w0pB1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mL46uQR3bdilrY3xaNL8NxPS8So/sLwGhTcF+g3JsrHp9AKnpOdXyKbxOHsnina8F
 wqSaNrEjM2amn+nYYRw/FxfHtls5g/bFWBoWO1bpMl2eJQO+RZpMcEBJZTLxQafI5j
 noqSKGovaaYGeBUYNBHMK6aXocYq0E3nTMyYy1bn4TL14zmFiArgaXxUFhn4zmMKxC
 fiXDVUSx4Q5UgEfAqyz8qNcstOD6I5Tc2ESrICKIRP/MzrvYx/TQZ2mxsGC949lw5N
 etjLNu3RVw1zky5DjFlycIhDyY+DDYz+4JoYQt5Ad1YHgsn5dxKFPBfbaQSyaN2DJj
 k3elrwHMBXIPA==
Date: Thu, 11 Nov 2021 10:05:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 drm-intel tree
Message-ID: <20211111100559.394264fd@canb.auug.org.au>
In-Reply-To: <20211105125122.21d336ac@canb.auug.org.au>
References: <20211028182753.56b6a174@canb.auug.org.au>
 <20211105125122.21d336ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YboB6En.F/MYPMFwqD8kBhN";
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YboB6En.F/MYPMFwqD8kBhN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 5 Nov 2021 12:51:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 28 Oct 2021 18:27:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the char-misc tree got a conflict in:
> >=20
> >   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >=20
> > between commit:
> >=20
> >   5740211ea442 ("drm/i915/dmabuf: fix broken build")
> >=20
> > from the drm-intel tree and commit:
> >=20
> >   16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module =
namespace")
> >=20
> > from the char-misc tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > index a45d0ec2c5b6,abb854281347..000000000000
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@@ -12,13 -13,8 +13,15 @@@
> >   #include "i915_gem_object.h"
> >   #include "i915_scatterlist.h"
> >  =20
> >  +#if defined(CONFIG_X86)
> >  +#include <asm/smp.h>
> >  +#else
> >  +#define wbinvd_on_all_cpus() \
> >  +	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
> >  +#endif
> >  +
> > + MODULE_IMPORT_NS(DMA_BUF);
> > +=20
> >   I915_SELFTEST_DECLARE(static bool force_different_devices;)
> >  =20
> >   static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf=
) =20
>=20
> This is now a conflict between the drm-intel tree and Linux' tree.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YboB6En.F/MYPMFwqD8kBhN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGMUFcACgkQAVBC80lX
0Gzhlgf9FCXy9EWd6FHRo67EWaB+eT6QO1AGTvYOprpPFhvEDDXzoYm0QPf9I9eC
rhGx2TLIkvWOkVsGlI4i6OVvo6+lLrDhsOi1gij/Kh2u1BmndeCFmGvRtQ7vrlRV
h9YTPATe1YOi9OPWe0Qju0FOIXzzGBJZMs8P27CiWl4Vkc8IvFsOPaqqWIC0ynQe
mOOazd+eruf6ExtDoYA0GHE951H3Bon1ULHZhY5JIYcmTXMrcmcuLAQkLcDxCzWB
ypP7ZARXc8mgRlMEKiQx8kLJOSOSXVlTPUdDl6L55I9uUToh0F1BoG0hYylyrgGA
zUl/8Mlk60WCpu0Z4gUCc/oR4uRhSA==
=8WAF
-----END PGP SIGNATURE-----

--Sig_/YboB6En.F/MYPMFwqD8kBhN--
