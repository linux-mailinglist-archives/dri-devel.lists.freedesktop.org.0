Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D3A10EC8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C3F10E460;
	Tue, 14 Jan 2025 18:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Khv/Exdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734BA10E460;
 Tue, 14 Jan 2025 18:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 77D94A41A63;
 Tue, 14 Jan 2025 17:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16D0C4CEDD;
 Tue, 14 Jan 2025 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736877672;
 bh=xGnt9QTMfNKV1OFFfTQWPhTcVBgpSWwX7LndHQqnEro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Khv/ExdnHJ+AEA3NMRhpXuge75QH8lnhotTCn9IUVYpuCYbPb9o5f1yyqbr/8qH7r
 nfUDhOQyv5OU5Pd5OOE4FxvmKbgQS3T9AbmxrH2HQaQduV554cRtikSool+9Sqaxqw
 hrNd6Vnp0sgBrtAH0f29KdvonNKmg0GJPvXUTkm4JzCmvIR4oKKYiX5QglQ3CLyw0R
 NvpYQceTLVan1wgCF5qfCICTIay6uYu9R48WwGb9C4jSjrSvwsHsiMaTaKlGSRtZ3l
 3cXQv8tBDyy3qSQwWAxg/SaUMfda+tdO+TAqDW9eBhqo66KsU3iNur2GskbgXea6G1
 U7lClyAGCmf9w==
Date: Tue, 14 Jan 2025 19:01:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org, 
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2.1 1/1] kernel/cgroup: Add "dmem" memory accounting
 cgroup
Message-ID: <20250114-awesome-earthworm-of-camouflage-5bdd5b@houat>
References: <20241204134410.1161769-2-dev@lankhorst.se>
 <20241204143112.1250983-1-dev@lankhorst.se>
 <CAMuHMdUmPfahsnZwx2iB5yfh8rjjW25LNcnYujNBgcKotUXBNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6yxrd253xm54q4ba"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUmPfahsnZwx2iB5yfh8rjjW25LNcnYujNBgcKotUXBNg@mail.gmail.com>
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


--6yxrd253xm54q4ba
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2.1 1/1] kernel/cgroup: Add "dmem" memory accounting
 cgroup
MIME-Version: 1.0

Hi Geert,

On Tue, Jan 14, 2025 at 11:16:43AM +0100, Geert Uytterhoeven wrote:
> Hi Maarten,
>=20
> On Wed, Dec 4, 2024 at 3:32=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.s=
e> wrote:
> > This code is based on the RDMA and misc cgroup initially, but now
> > uses page_counter. It uses the same min/low/max semantics as the memory
> > cgroup as a result.
> >
> > There's a small mismatch as TTM uses u64, and page_counter long pages.
> > In practice it's not a problem. 32-bits systems don't really come with
> > >=3D4GB cards and as long as we're consistently wrong with units, it's
> > fine. The device page size may not be in the same units as kernel page
> > size, and each region might also have a different page size (VRAM vs GA=
RT
> > for example).
> >
> > The interface is simple:
> > - Call dmem_cgroup_register_region()
> > - Use dmem_cgroup_try_charge to check if you can allocate a chunk of me=
mory,
> >   use dmem_cgroup__uncharge when freeing it. This may return an error c=
ode,
> >   or -EAGAIN when the cgroup limit is reached. In that case a reference
> >   to the limiting pool is returned.
> > - The limiting cs can be used as compare function for
> >   dmem_cgroup_state_evict_valuable.
> > - After having evicted enough, drop reference to limiting cs with
> >   dmem_cgroup_pool_state_put.
> >
> > This API allows you to limit device resources with cgroups.
> > You can see the supported cards in /sys/fs/cgroup/dmem.capacity
> > You need to echo +dmem to cgroup.subtree_control, and then you can
> > partition device memory.
> >
> > Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
> > Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> > Co-developed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>=20
> Thanks for your patch, which is now commit b168ed458ddecc17
> ("kernel/cgroup: Add "dmem" memory accounting cgroup") in drm/drm-next.
>=20
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1128,6 +1128,7 @@ config CGROUP_PIDS
> >
> >  config CGROUP_RDMA
> >         bool "RDMA controller"
> > +       select PAGE_COUNTER
>=20
> This change looks unrelated?
>=20
> Oh, reading your response to the build error, this should have been below?

Indeed, good catch.

> >         help
> >           Provides enforcement of RDMA resources defined by IB stack.
> >           It is fairly easy for consumers to exhaust RDMA resources, wh=
ich
> > @@ -1136,6 +1137,15 @@ config CGROUP_RDMA
> >           Attaching processes with active RDMA resources to the cgroup
> >           hierarchy is allowed even if can cross the hierarchy's limit.
> >
> > +config CGROUP_DMEM
> > +       bool "Device memory controller (DMEM)"
> > +       help
> > +         The DMEM controller allows compatible devices to restrict dev=
ice
> > +         memory usage based on the cgroup hierarchy.
> > +
> > +         As an example, it allows you to restrict VRAM usage for appli=
cations
> > +         in the DRM subsystem.
> > +
>=20
> Do you envision other users than DRM?
> Perhaps this should depend on DRM for now?

dma-buf heaps and v4l2 support are in progress right now.

Maxime

--6yxrd253xm54q4ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4amZQAKCRAnX84Zoj2+
dgjDAX0W4SqGxbW7Q7IklK0znNvkntNHh6K1lujA0gPteaqWh799ZIBjzxh/cgs0
P3bf5LEBgMEug4QbiLG8y8uDai/9qY2bChSMIdsxk2qfhycBLAechk/7OoRr7az/
5VlQrByP9Q==
=mx8q
-----END PGP SIGNATURE-----

--6yxrd253xm54q4ba--
