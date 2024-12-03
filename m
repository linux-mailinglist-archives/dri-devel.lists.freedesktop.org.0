Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B19E2CA6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 21:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EE810E887;
	Tue,  3 Dec 2024 20:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H4gNRBJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DCE10E887;
 Tue,  3 Dec 2024 20:05:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2DD60A4183A;
 Tue,  3 Dec 2024 20:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21EDC4CECF;
 Tue,  3 Dec 2024 20:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733256334;
 bh=Yrbc/l+xD4S/+XGL1vpPMBgFYNpUEoULuxt7XeELIQ0=;
 h=Date:From:To:Cc:Subject:From;
 b=H4gNRBJdg9Ivv4L/m83TP2Jqkg7jqALzF5q273mkarIkOTVUawzu+C+lVc31b8byV
 njlpQb3gpfA0sLERXtPAISP54eF8AeffcYWxVrUr3tgcXryax0qUV+T0Qx+zg07JzQ
 G+DgJVDeUPiHKS5vmHFveLgeose8lyT7V0sU3fTguATjYabwjRwICOOjpkW7InbSzY
 odXRvjm4h9BvqLQmAXC06thNpT/KeqPGuWiDwYYF9nlZwl/XkOjehy+8O91LyhUTMb
 8rCsETFtGxG/XZP/l6LT+w8Qx59nx+c2TfQPzXUlvsZTLr7umoack8KzvPyaF1U5vv
 gCZuwLSsQM7+Q==
Date: Tue, 3 Dec 2024 20:05:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <Z09kidsTlxhP51ff@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TJMdyoU9CQls9ZU9"
Content-Disposition: inline
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


--TJMdyoU9CQls9ZU9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dsb.c

between commit:

  ebd1e5faa72af ("drm/i915/dsb: Don't use indexed register writes needlessl=
y")

=66rom the drm-intel-fixes tree and commit:

  ecba559a88ab8 ("drm/i915/dsb: Don't use indexed register writes needlessl=
y")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/display/intel_dsb.c
index 4d3785f5cb525,e6f8fc743fb40..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@@ -304,55 -295,34 +295,43 @@@ void intel_dsb_reg_write_indexed(struc
  	 * we are writing odd no of dwords, Zeros will be added in the end for
  	 * padding.
  	 */
- 	if (!intel_dsb_prev_ins_is_mmio_write(dsb, reg) &&
- 	    !intel_dsb_prev_ins_is_indexed_write(dsb, reg)) {
- 		intel_dsb_emit(dsb, val,
- 			       (DSB_OPCODE_MMIO_WRITE << DSB_OPCODE_SHIFT) |
- 			       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
+ 	if (!intel_dsb_prev_ins_is_indexed_write(dsb, reg))
+ 		intel_dsb_emit(dsb, 0, /* count */
+ 			       (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
  			       i915_mmio_reg_offset(reg));
- 	} else {
- 		if (!assert_dsb_has_room(dsb))
- 			return;
 =20
- 		/* convert to indexed write? */
- 		if (intel_dsb_prev_ins_is_mmio_write(dsb, reg)) {
- 			u32 prev_val =3D dsb->ins[0];
+ 	if (!assert_dsb_has_room(dsb))
+ 		return;
 =20
- 			dsb->ins[0] =3D 1; /* count */
- 			dsb->ins[1] =3D (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
- 				i915_mmio_reg_offset(reg);
+ 	/* Update the count */
+ 	dsb->ins[0]++;
+ 	intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 0,
+ 			       dsb->ins[0]);
 =20
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 0,
- 					       dsb->ins[0]);
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 1,
- 					       dsb->ins[1]);
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 2,
- 					       prev_val);
+ 	intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos++, val);
+ 	/* if number of data words is odd, then the last dword should be 0.*/
+ 	if (dsb->free_pos & 0x1)
+ 		intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos, 0);
+ }
 =20
- 			dsb->free_pos++;
- 		}
-=20
- 		intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos++, val);
- 		/* Update the count */
- 		dsb->ins[0]++;
- 		intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 0,
- 				       dsb->ins[0]);
-=20
- 		/* if number of data words is odd, then the last dword should be 0.*/
- 		if (dsb->free_pos & 0x1)
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos, 0);
- 	}
+ void intel_dsb_reg_write(struct intel_dsb *dsb,
+ 			 i915_reg_t reg, u32 val)
+ {
+ 	intel_dsb_emit(dsb, val,
+ 		       (DSB_OPCODE_MMIO_WRITE << DSB_OPCODE_SHIFT) |
+ 		       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
+ 		       i915_mmio_reg_offset(reg));
  }
 =20
 +void intel_dsb_reg_write(struct intel_dsb *dsb,
 +			 i915_reg_t reg, u32 val)
 +{
 +	intel_dsb_emit(dsb, val,
 +		       (DSB_OPCODE_MMIO_WRITE << DSB_OPCODE_SHIFT) |
 +		       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
 +		       i915_mmio_reg_offset(reg));
 +}
 +
  static u32 intel_dsb_mask_to_byte_en(u32 mask)
  {
  	return (!!(mask & 0xff000000) << 3 |

--TJMdyoU9CQls9ZU9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPZIgACgkQJNaLcl1U
h9DfIQf/SoCA06H1HA7SzYcLnmr1j91iBNfuorL7JDrOYYJo7s4u+iNplrl4z1w2
DpqO4w9khwF+DHpxo8aHkLz+T6/B/TGjFHNrXuWYxIXDCn07Q20oz+nI05ty99XP
7X6LnVyVxeymUiDwlfg87S+2SlhcAhWMXZBl31+snLaiol8tCcrdpEzYqyRBIDl9
ADFOIgVtmKOZTohrtoDfC+XmWz0PjowzYIUUI+cnTdN6mlczxdAsyvYQX8ks94PV
ngxPZy3TNYqf/FnyVmi9srN/aVkNNecL4v/rj5VFKWz2zd2w+NPzcqhvf0CnVTqy
jISI1uZutV477SMwsKnYvXdqrzRKBw==
=t1ob
-----END PGP SIGNATURE-----

--TJMdyoU9CQls9ZU9--
