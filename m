Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F9EA80EBD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E649410E6CF;
	Tue,  8 Apr 2025 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="odebGuo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2210E6CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744123619;
 bh=3l/+LdDt9BYOa/k+vw35IDN76tFD/70Aqr4RSI5LQog=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=odebGuo09qjtBQa6bETbDReyUhxnT+390+HBJip7ET6xtXmRjJCVmCvL78bTg2c3p
 grjLlycqXcSlIvD7xUk/2AmN+3BUl4Lfuml2Rbl3h76I6eWBRBQ7uivBQJsr3Eig5v
 /4rtjC7LH+lQsKEWL2H20RYqlQzQtYdw+Oujp87ZvS3cdeD6NzKjbR5h94sBEL3SH1
 vkMl3hry2MOLD292kUF2qIHhSyQTCLMFho19+PWqHIVN1TCVC9uJouCDWJmHh5OwUQ
 fsOmGI4DMdsK/NGfjd/cVem5sxzPnMaAc8M+1cSRkZ6gJIoTahBYT9zafygGnYBi2W
 S1morMARsrTPQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DBF7417E1072;
 Tue,  8 Apr 2025 16:46:58 +0200 (CEST)
Date: Tue, 8 Apr 2025 16:46:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250408164652.2cc26723@collabora.com>
In-Reply-To: <k5pf4wkpaeuahdg5vasxo226jppjxtndkswoi2g72eezecttic@vrdnyjxbqont>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
 <20250402115432.1469703-5-adrian.larumbe@collabora.com>
 <20250402145804.5cf07f5e@collabora.com>
 <s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
 <20250408154755.0d45b54b@collabora.com>
 <k5pf4wkpaeuahdg5vasxo226jppjxtndkswoi2g72eezecttic@vrdnyjxbqont>
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

On Tue, 8 Apr 2025 15:38:18 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 08.04.2025 15:47, Boris Brezillon wrote:
> On Tue, 8 Apr 2025 14:38:44 +0100
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>=20
> > > > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/=
drm/panthor/panthor_gem.c
> > > > > index 44d027e6d664..2fc87be9b700 100644
> > > > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > > > @@ -2,6 +2,7 @@
> > > > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > > > >  /* Copyright 2023 Collabora ltd. */
> > > > >
> > > > > +#include <linux/cleanup.h>
> > > > >  #include <linux/dma-buf.h>
> > > > >  #include <linux/dma-mapping.h>
> > > > >  #include <linux/err.h>
> > > > > @@ -10,14 +11,65 @@
> > > > >  #include <drm/panthor_drm.h>
> > > > >
> > > > >  #include "panthor_device.h"
> > > > > +#include "panthor_fw.h"
> > > > >  #include "panthor_gem.h"
> > > > >  #include "panthor_mmu.h"
> > > > >
> > > > > +#ifdef CONFIG_DEBUG_FS
> > > > > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_objec=
t *bo, u32 type_mask)
> > > > > +{
> > > > > +	INIT_LIST_HEAD(&bo->debugfs.node); =20
> > > >
> > > > This should be called when the GEM object is created, otherwise the
> > > > list_empty() test done in panthor_gem_debugfs_bo_rm() will only wor=
k if
> > > > panthor_gem_debugfs_bo_add() is called, and depending on when this
> > > > happens, or whether it happens at all, the error path will do a NULL
> > > > deref. =20
> > >
> > > I'll be moving panthor_gem_debugfs_bo_add() back into panthor_gem_cre=
ate_object() and
> > > inline panthor_gem_debugfs_bo_init() into it. =20
> >
> > You mean moving the panthor_gem_debugfs_bo_add() call to
> > panthor_gem_create_object(), not inlining its content, right? =20
>=20
> Yes, inlining panthor_gem_debugfs_bo_init() into panthor_gem_debugfs_bo_a=
dd() and moving
> panthor_gem_debugfs_bo_add() into panthor_gem_create_object().
>=20
> > > > > +	} else {
> > > > > +		bo->debugfs.creator.tgid =3D 0;
> > > > > +		snprintf(bo->debugfs.creator.process_name,
> > > > > +			 sizeof(bo->debugfs.creator.process_name),
> > > > > +			 "kernel");
> > > > > +	}
> > > > > +
> > > > > +	bo->debugfs.bo_mask =3D type_mask; =20
> > > >
> > > > Why not do that directly in panthor_gem_debugfs_bo_add()? The only =
bits
> > > > that might be useful to do early is the INIT_LIST_HEAD(), and I thi=
nk
> > > > it can be inlined in panthor_gem_create_object(). =20
> > >
> > > I'll be doing in this in the next revision, but because I've no acces=
s to the BO
> > > type mask from inside Panthor's drm_driver::gem_create_object() bindi=
ng, then
> > > I'll have to assign the mask right after the object has been created.
> > >
> > > I think this means there might be a short window after the object's b=
een added to
> > > the DebugFS GEMs list in which it could be shown with the kernel mask=
 field still
> > > set to 0, but I guess that's not too important either. =20
> >
> > I think it's okay, as long as you don't crash when printing partially
> > initialized objects. Another solution would be to have a flag encoding
> > when the obj is initialized, so you can skip objects that don't have
> > this flag set yet. =20
>=20
> I think what I'll do is set the mask to a poison value, maybe 0xFF, and o=
nly when
> it's overwritten with a legitimate value, display the object in the Debug=
FS GEMS file.

Well, it's just as simple to leave it to zero at bo_add() time, and
have an INITIALIZED flag that you set along the other flags in the
caller of gem_shmem_create(). If you make it a poison value, you'll
need to make sure it never conflicts with a valid flag combination,
which might be annoying.
