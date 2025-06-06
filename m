Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD9ACFB1F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 04:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F124010E325;
	Fri,  6 Jun 2025 02:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q57xqbm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387410E325
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 02:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1749175734;
 bh=0LvDLW8pjIlwfV9Vh1GdQE5WkfXK6wyTvC9z9te5Uls=;
 h=Date:From:To:Cc:Subject:From;
 b=Q57xqbm93O7cx14vhNion14cU6swt+0+QSqdi3iiNTZpQI+Jd++1P52Zua9mKdzmH
 XQl3XewF9sM72L9HwjTQ/SpktYs/WpDzd/9SUjxx1hySG/zMVZXtQkZKKCI2yt1gLa
 a4fKVOCTEoaiV4C9KS6rEySStukgGcOwxY+NT7WgAutXFSaiNe9FcoKMzB93IkPn+l
 DgsxQr+YMq7Q1cBs42kCiTFUDs7IFYBe6slYYEaPsQBkd8qcPeg3bMEPwb3prvN03K
 0TwB1W8+5V5B5+OAS9w+8CbLC6JrUbyMjcIS8sSGHeODM9eFzhRTRYaWhFGXd8vb9G
 T0X56VZ9SLcfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bD4Vs3LPCz4wbr;
 Fri,  6 Jun 2025 12:08:53 +1000 (AEST)
Date: Fri, 6 Jun 2025 12:08:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250606120851.2736b781@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ne38GWR6BK2ZlcAeggg0ydw";
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

--Sig_/ne38GWR6BK2ZlcAeggg0ydw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_lrc.c

between commit:

  617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")

from Linus' tree and commit:

  2b0a0ce0c20b ("drm/xe: Create LRC BO without VM")

from the drm tree.

I fixed it up (maybe? - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9,e1db6f2a1ad0..000000000000
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@@ -909,69 -876,7 +909,66 @@@ static void xe_lrc_set_ppgtt(struct xe_
  static void xe_lrc_finish(struct xe_lrc *lrc)
  {
  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
- 	xe_bo_lock(lrc->bo, false);
- 	xe_bo_unpin(lrc->bo);
- 	xe_bo_unlock(lrc->bo);
- 	xe_bo_put(lrc->bo);
+ 	xe_bo_unpin_map_no_vm(lrc->bo);
 +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
 +}
 +
 +/*
 + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating acti=
ve
 + * context run ticks.
 + * @lrc: Pointer to the lrc.
 + *
 + * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks=
 of the
 + * context, but only gets updated when the context switches out. In order=
 to
 + * check how long a context has been active before it switches out, two t=
hings
 + * are required:
 + *
 + * (1) Determine if the context is running:
 + * To do so, we program the WA BB to set an initial value for CTX_TIMESTA=
MP in
 + * the LRC. The value chosen is 1 since 0 is the initial value when the L=
RC is
 + * initialized. During a query, we just check for this value to determine=
 if the
 + * context is active. If the context switched out, it would overwrite this
 + * location with the actual CTX_TIMESTAMP MMIO value. Note that WA BB run=
s as
 + * the last part of context restore, so reusing this LRC location will not
 + * clobber anything.
 + *
 + * (2) Calculate the time that the context has been active for:
 + * The CTX_TIMESTAMP ticks only when the context is active. If a context =
is
 + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utiliza=
tion.
 + * While doing so, we need to read the CTX_TIMESTAMP MMIO for the specific
 + * engine instance. Since we do not know which instance the context is ru=
nning
 + * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB=
 and
 + * store it in the PPHSWP.
 + */
 +#define CONTEXT_ACTIVE 1ULL
 +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 +{
 +	u32 *cmd;
 +
 +	cmd =3D lrc->bb_per_ctx_bo->vmap.vaddr;
 +
 +	*cmd++ =3D MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSE=
T;
 +	*cmd++ =3D ENGINE_ID(0).addr;
 +	*cmd++ =3D __xe_lrc_engine_id_ggtt_addr(lrc);
 +	*cmd++ =3D 0;
 +
 +	*cmd++ =3D MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 +	*cmd++ =3D __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 +	*cmd++ =3D 0;
 +	*cmd++ =3D lower_32_bits(CONTEXT_ACTIVE);
 +
 +	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
 +		*cmd++ =3D MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 +		*cmd++ =3D __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
 +		*cmd++ =3D 0;
 +		*cmd++ =3D upper_32_bits(CONTEXT_ACTIVE);
 +	}
 +
 +	*cmd++ =3D MI_BATCH_BUFFER_END;
 +
 +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 +
  }
 =20
  #define PVC_CTX_ASID		(0x2e + 1)

--Sig_/ne38GWR6BK2ZlcAeggg0ydw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhCTbMACgkQAVBC80lX
0GzlDgf/Re/eiNIta9nH1Jrpf0C9QYwL/5QEf5jOpYHaZ28x+aplm2YYDODS+Pfy
JY44fX/5oW/E4wQgmVdJm27cIRgC9iP+L3UcZxG30jRYqIgBq9FGjaL8VG8U+q1b
ipmVdATPf9bJW4qsIg8DODmzQmCp0EVLIpO/iUe8t8NDeLKlm1MbeWCtZBBR8m+8
rXbZwPunIKYZLb705ugFfOMAIRO44vy3YHqG6TkG+64aoeirSpJIBZbhOgg6ehVA
idGjir4kZxSsVNwi+GaCGAqvHjcGhYRJ9q/BL+Iru6gpqROuJAH52sx/Fwfz8WWC
ihW/Lhv/LhMiiqp+EMulf9beQlWivw==
=f4l9
-----END PGP SIGNATURE-----

--Sig_/ne38GWR6BK2ZlcAeggg0ydw--
