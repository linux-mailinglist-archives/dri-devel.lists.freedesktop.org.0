Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEAF445D9C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 02:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B02B73B4F;
	Fri,  5 Nov 2021 01:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E173B4F;
 Fri,  5 Nov 2021 01:51:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hlk4t0ZkWz4xbP;
 Fri,  5 Nov 2021 12:51:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636077089;
 bh=2lOyapLlzAgrwNZPiurVfK316EULLqggli6pFQMqWI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jgpzdLEIFcN6zPmEM1joby9HCnYZCANFqtS8W/5jejxAjNWSmGFWpsxSoXBtjnTPF
 Tui2ddzquLLlL3Wsumc9Wm8YMpE21zZugxHREPCWAu70PcX2Ulo1/DT7jXtb8b5/UK
 sh/JixoPWkM6lX5bJUPyTwcGnq1XZxFQe6RAekZZZjQ8b01e5VfjtsM1qNN/deDD51
 RtLSaN8M5+m9Zj+IX3YnB35vFjv2rgWt6s1y2x+LFG3DCckqmshj3XTtWpbsXHyRyu
 dU15fu2cvqC+WGokSEYIPsjx6jdbcpTp1pZBYKePPeFQ1/EneAq6YqsYYzW05dQ1oL
 i5WRqc0FFvS6Q==
Date: Fri, 5 Nov 2021 12:51:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 drm-intel tree
Message-ID: <20211105125122.21d336ac@canb.auug.org.au>
In-Reply-To: <20211028182753.56b6a174@canb.auug.org.au>
References: <20211028182753.56b6a174@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1he=p4nehQe6V5iBAMGQAGk";
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/1he=p4nehQe6V5iBAMGQAGk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 28 Oct 2021 18:27:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the char-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>=20
> between commit:
>=20
>   5740211ea442 ("drm/i915/dmabuf: fix broken build")
>=20
> from the drm-intel tree and commit:
>=20
>   16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module na=
mespace")
>=20
> from the char-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index a45d0ec2c5b6,abb854281347..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@@ -12,13 -13,8 +13,15 @@@
>   #include "i915_gem_object.h"
>   #include "i915_scatterlist.h"
>  =20
>  +#if defined(CONFIG_X86)
>  +#include <asm/smp.h>
>  +#else
>  +#define wbinvd_on_all_cpus() \
>  +	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>  +#endif
>  +
> + MODULE_IMPORT_NS(DMA_BUF);
> +=20
>   I915_SELFTEST_DECLARE(static bool force_different_devices;)
>  =20
>   static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)

This is now a conflict between the drm-intel tree and Linux' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1he=p4nehQe6V5iBAMGQAGk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEjhoACgkQAVBC80lX
0GwH4Af/V9J988QeNptA56hLZgn3wchP6cRFnhcMG6FT3+kxwo97+wludh3alREX
wFaD54Ta2NyV6cWgkLzf+jb+r4BqhRDNSuCi6/MZEv1U9rc0w95om6/xrn+GGcKx
g30RFwahGjDIjiEbCVLm2IS2gJWMBVDyMAqugKjdmrJFR/ewdUjv9vXrwFR39W8w
IWiVZ2wHNUsO8rBD3U/KJYuN6C+dXf/Cs9aohd2UhG/5/6x+yQWMdjvmrSlIWU+g
d7/zZKTnkzGaxCXt+L6k3yKHv0MSpTugQdb4sCVB4spjuP+1UPzF/83agDqwIbzw
xlfjQo+C1Z5jRRT+CINSHSU8aNIxAA==
=z6S2
-----END PGP SIGNATURE-----

--Sig_/1he=p4nehQe6V5iBAMGQAGk--
