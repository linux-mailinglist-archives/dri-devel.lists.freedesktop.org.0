Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F68543F41F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 02:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F956E959;
	Fri, 29 Oct 2021 00:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF6A6E959
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 00:48:48 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgP1k1nxzz4xcB;
 Fri, 29 Oct 2021 11:48:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635468524;
 bh=FCQzWvP+AB7oAHT1PeIYE1IUj7mEzomLovvkTip/16c=;
 h=Date:From:To:Cc:Subject:From;
 b=qjxF5xtiyG5blf9o1DtE77u8umPSM+iX33aaZJbtiKCy/tcIhr8Db3Vh95fc5/Okg
 F1qnyULiZpEHtympzIIL6wgL/xRDQ+3lrkc5lqDtP0If+QdOBJJ2L//ZALjbryBTSf
 pUpuZ7M7przQgdcGsdOr44epvX2jhHtmSXIdMrOco6F05/ynDfqpQOXglCKazfrP9l
 3PF5QdZN1KNPjgUdCFbAg2ULbv1mUOsD72ggY2fJ5tlcMXytvLJfCfMZtPAeGxRvUH
 2ylJe/l1bXxvqa4DP+vxZ9Amg7CJbqPX0IdkigRHaFKj5l+L0c5NehCvkhK0P0B1gf
 5rNzU6XRXxZkA==
Date: Fri, 29 Oct 2021 11:48:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20211029114840.6a3a78bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z";
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

--Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_trace.h

between commit:

  9a4aa3a2f160 ("drm/i915: Revert 'guc_id' from i915_request tracepoint")

from Linus' tree and commit:

  3cb3e3434b9f ("drm/i915/guc: Move fields protected by guc->contexts_lock =
into sub structure")

from the drm tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7ROgACgkQAVBC80lX
0GwDjwf9ES1kV83+eTsl0RucN0MlLoR/a90yvyKRhvhlScgHdKUkuncE1mLzRUUi
9Vfe6eW0invRkjBkjabzTtQn/zwIArLe6k1Dcfv/IzY0OXWGgD9hsNYM28tSIpo0
FMYxt37NXrPJ2Zdv32n5UpU6WuZEcKAi3WnFrXCp25VOjducOy3M2fVJJ7/XmTsN
bUgBH+hyoVv07kVBlniRtMrKR1lczaSLD2v6hgAgGp/H68bK7EmF7EH7QWmUexYc
FaFukquqfUxbGktJn/e7+7GCDnBlYGZPif4qZ9AVPN+JWjUzQSXhIMSDE5iaWrwS
x2DjrMOjo3PF6Fbu/f2w4VS/Ho72bw==
=li/R
-----END PGP SIGNATURE-----

--Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z--
