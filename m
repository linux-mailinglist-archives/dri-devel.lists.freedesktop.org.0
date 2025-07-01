Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E7AEECB1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 05:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D8A10E4DF;
	Tue,  1 Jul 2025 03:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gimtROFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8410E4DF;
 Tue,  1 Jul 2025 03:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1751339223;
 bh=cnRZycmV29wnxz+1tOWhqeDibAbM/eb88xyiQu5/VMk=;
 h=Date:From:To:Cc:Subject:From;
 b=gimtROFgLqBy5fxNe5aGfKebs2dojJNTFVwG4LJANpQ9F3C1ldjA8odO+en3N8le0
 vUQ1Spb+lbTmusbr1m+BkEPHMB2zuyppZNpA6K0ha8oraT1NmBha1TTvgswXBPOM3t
 udhjob3a9zDFUlez+DTq5SUEXv0Swww8/wSfrcDuo3x2X6u3v7B7YVv7tUrO5wC0cI
 pDq3wIsXmEyZXEGivtzwP0bg47DnVzrgW2kDDgCkqJy/xuy3DZRGbOuneI9oLJaa04
 4BWs+Yyz0BZbt7fucfVh2tVvw3V+vygrcwaZ3t2WZznhQLtslAXle/r9swiJ860BYT
 5qzk8Gggxh9Tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWScQ2mmnz4xSX;
 Tue,  1 Jul 2025 13:07:02 +1000 (AEST)
Date: Tue, 1 Jul 2025 13:07:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20250701130702.416ba635@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3km7j/xIsIBB_inJew/ru1b";
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

--Sig_/3km7j/xIsIBB_inJew/ru1b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commits:

  183bccafa176 ("drm: Create a task info option for wedge events")
  a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")

from the drm tree and commits:

  821aacb2dcf0 ("drm/amdgpu: rework queue reset scheduler interaction")
  43ca5eb94b38 ("drm/amdgpu: move guilty handling into ring resets")
  38b20968f3d8 ("drm/amdgpu: move scheduler wqueue handling into callbacks")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 6b4ffa9ceb7a,f0b7080dccb8..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -89,11 -89,9 +89,10 @@@ static enum drm_gpu_sched_stat amdgpu_j
  {
  	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
  	struct amdgpu_job *job =3D to_amdgpu_job(s_job);
 +	struct drm_wedge_task_info *info =3D NULL;
  	struct amdgpu_task_info *ti;
  	struct amdgpu_device *adev =3D ring->adev;
- 	int idx;
- 	int r;
+ 	int idx, r;
 =20
  	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
  		dev_info(adev->dev, "%s - device unplugged skipping recovery on schedul=
er:%s",
@@@ -133,47 -133,22 +132,24 @@@
  	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
  		dev_err(adev->dev, "Ring reset disabled by debug mask\n");
  	} else if (amdgpu_gpu_recovery && ring->funcs->reset) {
- 		bool is_guilty;
-=20
- 		dev_err(adev->dev, "Starting %s ring reset\n", s_job->sched->name);
- 		/* stop the scheduler, but don't mess with the
- 		 * bad job yet because if ring reset fails
- 		 * we'll fall back to full GPU reset.
- 		 */
- 		drm_sched_wqueue_stop(&ring->sched);
-=20
- 		/* for engine resets, we need to reset the engine,
- 		 * but individual queues may be unaffected.
- 		 * check here to make sure the accounting is correct.
- 		 */
- 		if (ring->funcs->is_guilty)
- 			is_guilty =3D ring->funcs->is_guilty(ring);
- 		else
- 			is_guilty =3D true;
-=20
- 		if (is_guilty)
- 			dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
-=20
- 		r =3D amdgpu_ring_reset(ring, job->vmid);
+ 		dev_err(adev->dev, "Starting %s ring reset\n",
+ 			s_job->sched->name);
+ 		r =3D amdgpu_ring_reset(ring, job->vmid, NULL);
  		if (!r) {
- 			if (amdgpu_ring_sched_ready(ring))
- 				drm_sched_stop(&ring->sched, s_job);
- 			if (is_guilty) {
- 				atomic_inc(&ring->adev->gpu_reset_counter);
- 				amdgpu_fence_driver_force_completion(ring);
- 			}
- 			if (amdgpu_ring_sched_ready(ring))
- 				drm_sched_start(&ring->sched, 0);
- 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
- 			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
+ 			atomic_inc(&ring->adev->gpu_reset_counter);
+ 			dev_err(adev->dev, "Ring %s reset succeeded\n",
+ 				ring->sched.name);
+ 			drm_dev_wedged_event(adev_to_drm(adev),
 -					     DRM_WEDGE_RECOVERY_NONE);
++					     DRM_WEDGE_RECOVERY_NONE, info);
  			goto exit;
  		}
- 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
+ 		dev_err(adev->dev, "Ring %s reset failed\n", ring->sched.name);
  	}
+=20
  	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
 =20
 +	amdgpu_vm_put_task_info(ti);
 +
  	if (amdgpu_device_should_recover_gpu(ring->adev)) {
  		struct amdgpu_reset_context reset_context;
  		memset(&reset_context, 0, sizeof(reset_context));

--Sig_/3km7j/xIsIBB_inJew/ru1b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjUNYACgkQAVBC80lX
0GwYQQf+ONG+nBDAzZ2dO5RA1bLBgMGIXhiyUJNFQ2WhZ1X4tRLK6M7oFOQBy8oo
MzKZZpzDo2y+bjavb9CbLZTZ6uG04G7wtZNrFGcxIqlJ/LCCbZ2oBSEXHcVmUKAh
kuSdh8XDZj3ONKWeOvHXCZbre3GNCgQQpdR5kszrYtBY/KiGoiku8WUPWKI9HJcj
eK0J+fTEPTvtAay+K7WwZ+ijf6enNj7vFHuyaTy04CDAK59CKi+ngv8E2NWTcyb7
M3FSCs4CX8DdyqG3ToLZJlkUwUAsc3B8rg56B9l8qrUGKXd1roIMnkgvu8mxeQDv
dsrwrWa5RHg1KsU6iXirLZlOkcUetA==
=JnSB
-----END PGP SIGNATURE-----

--Sig_/3km7j/xIsIBB_inJew/ru1b--
