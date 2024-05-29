Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEC8D2AD4
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 04:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085B1112E7F;
	Wed, 29 May 2024 02:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="deLsuFU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03AC112E7E;
 Wed, 29 May 2024 02:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1716949804;
 bh=/6g0fw4OFmutDd8lwRVqyN5uwrYu6v54ZLV5usaohWU=;
 h=Date:From:To:Cc:Subject:From;
 b=deLsuFU6fqyZ2Y6RexxBHU7pFuBFNPcXPMiK6+FPeICx/eRV3VdQdwykoh+2oz0rh
 uOeR+YhXGdTyg7ZTbh0WO+nIXoQQy/JBzjSniUmZ0sXbsdP+Z9dz0BysSoct4er4ix
 Ab/U3qYFwp454nO7M4m9ELyinwdR4bbTmoQz0keJXXjOkRRCQYGmmtigZUSlSebmDw
 vlY6y2wSK02dZh30YFQrnymL6zfosStT6ebeKKOqcch5z3nJfhO9kJOJJo5dL5a9mr
 Y1O8cIppashB62bNuw7WIGhqoahis0DQa0lav0tQNTovm69z32NEXGP4BLBCTUYnTm
 LGcLuCjalNMSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VptdM5tLZz4wcq;
 Wed, 29 May 2024 12:29:59 +1000 (AEST)
Date: Wed, 29 May 2024 12:29:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240529122955.4cc16889@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AtUmK9xWZs/5L=Sdac.GNkI";
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

--Sig_/AtUmK9xWZs/5L=Sdac.GNkI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_bo.c:26:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_fence.c:4:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_gem.c:15:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_mmu.c:21:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_irq.c:19:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_sched.c:26:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_trace_points.c:4:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_sysfs.c:9:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_submit.c:9:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~

Caused by commit

  3cbcbe016c31 ("drm/v3d: Add Performance Counters descriptions for V3D 4.2=
 and 7.1")

I have used the drm-misc tree from next-20240528 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/AtUmK9xWZs/5L=Sdac.GNkI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWkyMACgkQAVBC80lX
0GzI8Af/eyAu8WGcGEYnvY7iZ4y11TYbu+SyKyxVt5lqh2YVMEN8wl2DNCo7LBaH
Qp75+hZx7nS2ZhM2GXD2J9FyiBX0qlO9GLvM0rNo4g8GDEOSEbjoj6uZWM1jTNc3
VsCJzMV9n/kHJqlUzE9Lph3iBHT5aQVNOvgcjU3B74ctt69FUvie7VNiG6VD2zXL
lw44cScalcpXFbrY5UsH5EfcFS/ibXNrwPSSEShaLRmHBs/jzDVbHMvsCfRZbXa4
E/vyInnhE+k1ZzEIgDjTqn56/EiATBFt4B4PiPrekCpjvMqnXrKW//tB5JecZ2s7
rAOuJrPiDxW9xrnUyAdlU+5lFlfLHg==
=xGpE
-----END PGP SIGNATURE-----

--Sig_/AtUmK9xWZs/5L=Sdac.GNkI--
