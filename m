Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25289AC1CCD
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D080B10E1CB;
	Fri, 23 May 2025 06:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qtorz+4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060AC10E1CB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1747980833;
 bh=pn2PuBTFwlhixqOZOK4nMXhyOFmSaO0qfQoQhcdFgfU=;
 h=Date:From:To:Cc:Subject:From;
 b=qtorz+4HtzchEWiH72jM72nMdXDjsE+qhqVvDOEIHN1fusy06F4xbU55OEGQyCwF6
 qgJ8JGqbGgn6q9eWQeMdpwqRuXj5XtChs61XwoP49d7KSDOIu8NQYz/3bZa5utHGQA
 m+is+mS7ayKfhdgo8z9M95Wo3IsC1XaWsStXmX58wj/aePAY5463n+8hgLA8UdRqXL
 no2iBBeexQHn11/+8+se3v/Eusby2ppV92gXj28B3ZvYgztLZsnquhczaT1BHzUk6n
 5ATM+ofZkr2j9tCMjHgiUCg+G4cmusgSte9ibTMq8MInYDyx7qY++Jg0E9vIzGNWNI
 AWFMef5TaXtOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3Zc11TlGz4wxh;
 Fri, 23 May 2025 16:13:53 +1000 (AEST)
Date: Fri, 23 May 2025 16:13:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Asahi Lina
 <lina+kernel@asahilina.net>, Danilo Krummrich <dakr@kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the drm tree
Message-ID: <20250523161352.20f0589a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UfLstoki3dA=qGyu89WKs+a";
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

--Sig_/UfLstoki3dA=qGyu89WKs+a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/bindings/bindings_helper.h

between commits:

  9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
  07c9016085f9 ("rust: drm: add driver abstractions")
  1e4b8896c0f3 ("rust: drm: add device abstraction")
  a98a73be9ee9 ("rust: drm: file: Add File abstraction")
  c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

from the drm tree and commits:

  210b81578efb ("rust: xarray: Add an abstraction for XArray")
  8cbc95f983bc ("rust: workaround `bindgen` issue with forward references t=
o `enum` types")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/bindings/bindings_helper.h
index a5a6fb45d405,5532bbfd96eb..000000000000
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@@ -6,13 -6,29 +6,35 @@@
   * Sorted alphabetically.
   */
 =20
+ /*
+  * First, avoid forward references to `enum` types.
+  *
+  * This workarounds a `bindgen` issue with them:
+  * <https://github.com/rust-lang/rust-bindgen/issues/3179>.
+  *
+  * Without this, the generated Rust type may be the wrong one (`i32`) or
+  * the proper one (typically `c_uint`) depending on how the headers are
+  * included, which in turn may depend on the particular kernel configurat=
ion
+  * or the architecture.
+  *
+  * The alternative would be to use casts and likely an
+  * `#[allow(clippy::unnecessary_cast)]` in the Rust source files. Instead,
+  * this approach allows us to keep the correct code in the source files a=
nd
+  * simply remove this section when the issue is fixed upstream and we bump
+  * the minimum `bindgen` version.
+  *
+  * This workaround may not be possible in some cases, depending on how th=
e C
+  * headers are set up.
+  */
+ #include <linux/hrtimer_types.h>
+=20
 +#include <drm/drm_device.h>
 +#include <drm/drm_drv.h>
 +#include <drm/drm_file.h>
 +#include <drm/drm_gem.h>
 +#include <drm/drm_ioctl.h>
  #include <kunit/test.h>
 +#include <linux/auxiliary_bus.h>
  #include <linux/blk-mq.h>
  #include <linux/blk_types.h>
  #include <linux/blkdev.h>
@@@ -66,4 -78,8 +89,9 @@@ const gfp_t RUST_CONST_HELPER___GFP_ZER
  const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM =3D ___GFP_HIGHMEM;
  const gfp_t RUST_CONST_HELPER___GFP_NOWARN =3D ___GFP_NOWARN;
  const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D BLK_FEAT_R=
OTATIONAL;
 +const fop_flags_t RUST_CONST_HELPER_FOP_UNSIGNED_OFFSET =3D FOP_UNSIGNED_=
OFFSET;
+=20
+ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_PRESENT;
+=20
+ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
+ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;

--Sig_/UfLstoki3dA=qGyu89WKs+a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgwEiAACgkQAVBC80lX
0GydpAf/RbWvNFVq/Wp77QPgTquSHd4gV7XQfUccfon1i8HdQiQjUsK8oKbP8HWe
9rWIFLwUnmcr/IawqVfBYZlBcld9LLWBXrmUpnLL2OcEOB7DI5W8LjhvT8GLbi6P
qKMxrzeCsjpxdMLiucpBlLH1dzqneqie4Y/QdQhC+pYI4t7h/o3/OuzwuYKJzvTZ
8oJ0LKWwiVD5CailSwJ1dZtWAuji3Ps+no+OoJbDA1lZ6GQ32ubn15r2n/XOmdAY
kBD4VyS5PnJljLysMz/FhO4ntCaHRrn9sWQ6YsX8F9wUHdN2z+rJWj7Qnsh1c0RG
owJ/9IJ6NtOwU18O9QOsuamt7dvWQg==
=ou7m
-----END PGP SIGNATURE-----

--Sig_/UfLstoki3dA=qGyu89WKs+a--
