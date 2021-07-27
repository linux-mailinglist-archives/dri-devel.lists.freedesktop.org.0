Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352723D78CD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7D76E48E;
	Tue, 27 Jul 2021 14:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACA46E48E;
 Tue, 27 Jul 2021 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=wBMsR9EzvvO5/POTbAjzPN2NDJg6gXSvKf8xLvfYLN4=; 
 b=ePph9/lSyaKh0KuTVRBuU+DrWzA8CIiMZhCrhxOL7jRTdskhhefN3xa6sUu3A7dfZa7sXjD3AmB1pOvvyH9/qZ2Gd0uSFs9jAbG/tnoQvrUqL0E10kQqc7JIeRofLGf1FfIe2mv7GrTd34zFVyfnjpXSIRyIKSGU1McRIRN+pV1V5ZRiAlrQ/EedB4yDH2yYD362XM0mKeLUMmPqVBqNlWx+P7vwl1xHM0xbFiOO5UkdHl6p7eCVMAd3eHGZc9Fgi1RQ2GoLQd9cTUC5AtsdCZjFBbPDGbwTB2a1xIxJ5TzowKWnevl2vt5MKxWnhfLpw+ayvqBuO05sonuzh9Iwng==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m8ONm-0000VM-7J; Tue, 27 Jul 2021 16:48:34 +0200
Date: Tue, 27 Jul 2021 15:47:09 +0100
From: Melissa Wen <mwen@igalia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/18] drm/sched dependency tracking and dma-resv fixes
Message-ID: <20210727144709.j5cpmtzo2x2m2a2o@mail.igalia.com>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ws4d7pfxpbatkhck"
Content-Disposition: inline
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ws4d7pfxpbatkhck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/12, Daniel Vetter wrote:
> Hi all,
>=20
> Quick new version since the previous one was a bit too broken:
> - dropped the bug-on patch to avoid breaking amdgpu's gpu reset failure
>   games
> - another attempt at splitting job_init/arm, hopefully we're getting
>   there.
>=20
> Note that Christian has brought up a bikeshed on the new functions to add
> dependencies to drm_sched_jobs. I'm happy to repaint, if there's some kind
> of consensus on what it should be.
>=20
> Testing and review very much welcome, as usual.
Hi,=20

I've tested it some time ago; but now, for v3d, don't forget to rebase.

Also, common parts lgtm, so for them:

Acked-by: Melissa Wen <mwen@igalia.com>
>=20
> Cheers, Daniel
>=20
> Daniel Vetter (18):
>   drm/sched: Split drm_sched_job_init
>   drm/sched: Barriers are needed for entity->last_scheduled
>   drm/sched: Add dependency tracking
>   drm/sched: drop entity parameter from drm_sched_push_job
>   drm/sched: improve docs around drm_sched_entity
>   drm/panfrost: use scheduler dependency tracking
>   drm/lima: use scheduler dependency tracking
>   drm/v3d: Move drm_sched_job_init to v3d_job_init
>   drm/v3d: Use scheduler dependency handling
>   drm/etnaviv: Use scheduler dependency handling
>   drm/gem: Delete gem array fencing helpers
>   drm/sched: Don't store self-dependencies
>   drm/sched: Check locking in drm_sched_job_await_implicit
>   drm/msm: Don't break exclusive fence ordering
>   drm/etnaviv: Don't break exclusive fence ordering
>   drm/i915: delete exclude argument from i915_sw_fence_await_reservation
>   drm/i915: Don't break exclusive fence ordering
>   dma-resv: Give the docs a do-over
>=20
>  Documentation/gpu/drm-mm.rst                  |   3 +
>  drivers/dma-buf/dma-resv.c                    |  24 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   4 +-
>  drivers/gpu/drm/drm_gem.c                     |  96 ---------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h         |   5 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  64 +++---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  65 +-----
>  drivers/gpu/drm/etnaviv/etnaviv_sched.h       |   3 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   8 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c          |   6 +-
>  drivers/gpu/drm/i915/i915_sw_fence.h          |   1 -
>  drivers/gpu/drm/lima/lima_gem.c               |   7 +-
>  drivers/gpu/drm/lima/lima_sched.c             |  28 +--
>  drivers/gpu/drm/lima/lima_sched.h             |   6 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  16 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  39 +---
>  drivers/gpu/drm/panfrost/panfrost_job.h       |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      | 140 +++++++------
>  drivers/gpu/drm/scheduler/sched_fence.c       |  19 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 181 +++++++++++++++--
>  drivers/gpu/drm/v3d/v3d_drv.h                 |   6 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 | 115 +++++------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  44 +----
>  include/drm/drm_gem.h                         |   5 -
>  include/drm/gpu_scheduler.h                   | 186 ++++++++++++++----
>  include/linux/dma-buf.h                       |   7 +
>  include/linux/dma-resv.h                      | 104 +++++++++-
>  31 files changed, 672 insertions(+), 528 deletions(-)
>=20
> --=20
> 2.32.0
>=20

--ws4d7pfxpbatkhck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEAHGgACgkQwqF3j0dL
ehwk6g//Zv99a4QJf0MpIaQfpKBoWS2BK62ZvxBGFDNMneshkbS51upqgdc82DTp
hDmJIjyPFtRARPFnwLM5gnv7I3DZjYeE7jKFsv9I9YQfSz6QUJ9U1RsEYoHEfo4S
RnB38tRoiT0/bWCOf5ABVN+QzNiGzK6FLwurIwaypZK35XpLQjsLoU4+qu67neKA
i+IHKhSzgjNABBXoBY0TLHylzFFliWJpkx5y/6bixFe+sdrDQecDA68NrNVcDcis
l+fBpkT+kj1vk5Cuu5tbnN9xfZZy3rFz2Yj3iipFnv3BZb7+r7UJfhRlTYWrbap3
nzd2h8sD5VGpRQbvmd5ICmFV3+2x5E+shNLnh4TLeCoJxvf//k8c9dHXPE2zgK2G
764M2M5fo1Zq/OqrWhWV8XqyL9le6dsR4FoNyWqcVlOkEpeU5QGISNEPAFesNFOY
Jcapz/1S6YZFVRq1hA/NSj8ssZisAV6zz1nWyzOyf33x5J04C6VxMfi9M9YsoTdT
7BaI34L5rK9ykCBBi39wZ21h/86/MXN5IQTn2gAlNQg0LNze1r6Ec/GnRNoZRz0r
yC90bsx98k1QMr58AcYbq23VaHUiglN2gozZvRCZjhMDBbJZoShMoEmPtDu5mguN
TN2g+qNKdo7QEmdGjWtN3glYfPoAwbqDPdI8hJoEG0VeMAw50PE=
=Qc90
-----END PGP SIGNATURE-----

--ws4d7pfxpbatkhck--
