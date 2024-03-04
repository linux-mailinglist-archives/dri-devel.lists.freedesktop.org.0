Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF386F819
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 02:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB910F713;
	Mon,  4 Mar 2024 01:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TbA6wqbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCC410F713
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 01:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1709514492;
 bh=wCBQxlkia3rFEEfyeOb8tCdt6hGJM2RzeP67NHnaLkk=;
 h=Date:From:To:Cc:Subject:From;
 b=TbA6wqbwyeQoD6PjxkVhCwoCfBHRD91oPd6a5b2KmRmoydJNntW1fF0UMK/zwHi0z
 7o8l3mfqqAZDNoEHOn4UGF9WXxRUx4EcKw8sVxly3NREJBh988q3Ijha0KBN3vQOcf
 XpUEUKEzXjURtt3nPh81DHS8z+ZEy2RaqYr0WbOBZA5nIFbUHv7NdPhD1pWrb0VWEI
 scUSC+CZYGEc5haWNub1bII/3I5w1Bk6Jsa61y6hh38i3JDRbVjW5uvTsblJuKA7VW
 VKYEILZyI7ZSc4SN8QcjpUtDjy01UY/dRkGyZmXH2XOo9RxCEF0+7ZpNWfqUwcBcg5
 g/c4lM/In2d4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tp0tg3F0Bz4wcJ;
 Mon,  4 Mar 2024 12:08:11 +1100 (AEDT)
Date: Mon, 4 Mar 2024 12:08:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Brian Welty <brian.welty@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240304120810.68681bd8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gF.Q=HxG54DohBDeXu9+n5L";
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

--Sig_/gF.Q=HxG54DohBDeXu9+n5L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/xe/xe_exec_queue.c
  drivers/gpu/drm/xe/xe_exec_queue_types.h

between commit:

  eaa367a0317e ("drm/xe/uapi: Remove unused flags")

from Linus' tree and commits:

  25ce7c5063b3 ("drm/xe: Finish refactoring of exec_queue_create")
  f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_exec_queue.c
index 49223026c89f,4bb8f897bf15..000000000000
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@@ -306,9 -347,98 +347,13 @@@ static int exec_queue_set_timeslice(str
  	    !xe_hw_engine_timeout_in_range(value, min, max))
  		return -EINVAL;
 =20
- 	return q->ops->set_timeslice(q, value);
+ 	if (!create)
+ 		return q->ops->set_timeslice(q, value);
+=20
+ 	q->sched_props.timeslice_us =3D value;
+ 	return 0;
  }
 =20
 -static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 -					     struct xe_exec_queue *q, u64 value,
 -					     bool create)
 -{
 -	u32 min =3D 0, max =3D 0;
 -
 -	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
 -				      XE_EXEC_QUEUE_PREEMPT_TIMEOUT, &min, &max);
 -
 -	if (xe_exec_queue_enforce_schedule_limit() &&
 -	    !xe_hw_engine_timeout_in_range(value, min, max))
 -		return -EINVAL;
 -
 -	if (!create)
 -		return q->ops->set_preempt_timeout(q, value);
 -
 -	q->sched_props.preempt_timeout_us =3D value;
 -	return 0;
 -}
 -
 -static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exe=
c_queue *q,
 -				      u64 value, bool create)
 -{
 -	u32 min =3D 0, max =3D 0;
 -
 -	if (XE_IOCTL_DBG(xe, !create))
 -		return -EINVAL;
 -
 -	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
 -				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
 -
 -	if (xe_exec_queue_enforce_schedule_limit() &&
 -	    !xe_hw_engine_timeout_in_range(value, min, max))
 -		return -EINVAL;
 -
 -	q->sched_props.job_timeout_ms =3D value;
 -
 -	return 0;
 -}
 -
 -static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exe=
c_queue *q,
 -				      u64 value, bool create)
 -{
 -	if (XE_IOCTL_DBG(xe, !create))
 -		return -EINVAL;
 -
 -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 -		return -EINVAL;
 -
 -	q->usm.acc_trigger =3D value;
 -
 -	return 0;
 -}
 -
 -static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec=
_queue *q,
 -				     u64 value, bool create)
 -{
 -	if (XE_IOCTL_DBG(xe, !create))
 -		return -EINVAL;
 -
 -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 -		return -EINVAL;
 -
 -	q->usm.acc_notify =3D value;
 -
 -	return 0;
 -}
 -
 -static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe=
_exec_queue *q,
 -					  u64 value, bool create)
 -{
 -	if (XE_IOCTL_DBG(xe, !create))
 -		return -EINVAL;
 -
 -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 -		return -EINVAL;
 -
 -	if (value > DRM_XE_ACC_GRANULARITY_64M)
 -		return -EINVAL;
 -
 -	q->usm.acc_granularity =3D value;
 -
 -	return 0;
 -}
 -
  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
  					     struct xe_exec_queue *q,
  					     u64 value, bool create);
diff --cc drivers/gpu/drm/xe/xe_exec_queue_types.h
index 36f4901d8d7e,c40240e88068..000000000000
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h

--Sig_/gF.Q=HxG54DohBDeXu9+n5L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXlHvoACgkQAVBC80lX
0GziwQgAiVo0hRJsVVaOFngVkwlm+pPdYiF1tKPEd4A/ZiynTrZ95WZ5sBO8QV22
g2/O3Lbyt3C9sTlMRa+tbEJRo+r/MftNqAPopDTIUjFW9J+930ESE/72yg1rvOUZ
mBU6fu+1yxBF9AD2SVS4C28q0adMrsqUIsyDRlf9rTBYRw1nSVULy9TABDPmCY5n
F9b9fAw6iEEbY9INY0RiTrosAIsSxgHMvOxqHkVcS+ttUan9CgJnFBGDoBeGsDeJ
UjKXJiYTPWyJ1WjlfIpp+PoBBd9M4G3NLsKCnKaLv2KA08tujUgNNEQPE+rA82kK
J5H9kDnOkMtFPccr4t3qs7KP2kJ0+Q==
=UoO9
-----END PGP SIGNATURE-----

--Sig_/gF.Q=HxG54DohBDeXu9+n5L--
