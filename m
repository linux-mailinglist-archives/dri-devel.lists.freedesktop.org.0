Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE704A84C3F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 20:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A8F10E37E;
	Thu, 10 Apr 2025 18:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="giNZKix2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC0510E37E;
 Thu, 10 Apr 2025 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744310519;
 bh=mADpUwq5+92J5ta/7tasOhCyFS9OsBOIqRQH6rfo4kU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=giNZKix27HYsMm8BWiYBNSp2YeTAPpKqsawhegkkQRCFl0QsI7bjdeGnFSmpbFj18
 vgr191Uh/iBjaaXogzufYwAtOciCMSKrfgOxD3xncZC4OrVpV/QW8W/rkxuXPuyrlG
 WU7eIVrvfRVTT19Kd+iFZUhfZ4PiMLDZJwUihMh+b8qn8wLV7tILI/73pKsV7P4mhq
 oJ5PZ4LtxVklqb+35RTs6FvIyhQ/QEwfgOABl1zS0MlOs+DWM//bIYHuuqu54kGx7g
 H40DGDYayb8J7OYVOiTu+b79yCzeLJXBhSCcihMwhlq/oU1BuHnrBY9UL9ne0qkEEY
 mUfA4DJyvB+lA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 24FB217E03B6;
 Thu, 10 Apr 2025 20:41:59 +0200 (CEST)
Date: Thu, 10 Apr 2025 20:41:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250410204155.55d5cfc7@collabora.com>
In-Reply-To: <Z_gHX5AqQkhbXOjd@blossom>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 10 Apr 2025 14:01:03 -0400
Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:

> > > > In Panfrost and Lima, we don't have this concept of "incremental
> > > > rendering", so when we fail the allocation, we just fail the GPU job
> > > > with an unhandled GPU fault.   =20
> > >=20
> > > To be honest I think that this is enough to mark those two drivers as
> > > broken.=C2=A0 It's documented that this approach is a no-go for upstr=
eam
> > > drivers.
> > >=20
> > > How widely is that used? =20
> >=20
> > It exists in lima and panfrost, and I wouldn't be surprised if a similar
> > mechanism was used in other drivers for tiler-based GPUs (etnaviv,
> > freedreno, powervr, ...), because ultimately that's how tilers work:
> > the amount of memory needed to store per-tile primitives (and metadata)
> > depends on what the geometry pipeline feeds the tiler with, and that
> > can't be predicted. If you over-provision, that's memory the system won=
't
> > be able to use while rendering takes place, even though only a small
> > portion might actually be used by the GPU. If your allocation is too
> > small, it will either trigger a GPU fault (for HW not supporting an
> > "incremental rendering" mode) or under-perform (because flushing
> > primitives has a huge cost on tilers). =20
>=20
> Yes and no.
>=20
> Although we can't allocate more memory for /this/ frame, we know the
> required size is probably constant across its lifetime. That gives a
> simple heuristic to manage the tiler heap efficiently without
> allocations - even fallible ones - in the fence signal path:
>=20
> * Start with a small fixed size tiler heap
> * Try to render, let incremental rendering kick in when it's too small.
> * When cleaning up the job, check if we used incremental rendering.
> * If we did - double the size of the heap the next time we submit work.
>=20
> The tiler heap still grows dynamically - it just does so over the span
> of a couple frames. In practice that means a tiny hit to startup time as
> we dynamically figure out the right size, incurring extra flushing at
> the start, without needing any "grow-on-page-fault" heroics.
>=20
> This should solve the problem completely for CSF/panthor. So it's only
> hardware that architecturally cannot do incremental rendering (older
> Mali: panfrost/lima) where we need this mess.

OTOH, if we need something
for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the same
thing for CSF, since CSF is arguably the sanest of all the HW
architectures listed above: allocation can fail/be non-blocking,
because there's a fallback to incremental rendering when it fails.
