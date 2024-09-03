Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD489697E3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D77C10E43F;
	Tue,  3 Sep 2024 08:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ey0IEJoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5474F10E43E;
 Tue,  3 Sep 2024 08:53:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46D215C5853;
 Tue,  3 Sep 2024 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C3CC4CEC4;
 Tue,  3 Sep 2024 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725353600;
 bh=pF9CszNYwjJO5JuUq2dHO3LIuUrYYG12W216C7TCrIQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ey0IEJoR3QjObccfvtl+IVNs3bMkadki8pzTl/HbOgT4SApEZdouS3ArzHkc+WJuK
 Bm66TGtj7EvySvcm78AGruWZcEfGR0U8U8C9NORBB6uqtPSL/5ODv5lyzNJ8KuHeU8
 PE64NcvpP4nBpdB3U6szU+7jwKRwJ3t1Qa5sVBJMwTxyOLLwT3EaKusSgWAywkv67Q
 MnIMOz83UtKz01hHrzpvosTwotiuHcLztTI11jWY2NyAfLB8a2yUw01BgLtLSe+PRt
 kDL2e57VE6D5wCyLXC/9v+pKwUJ6gWmKFfrSuO+aX8ZhSIJlzh215dxW3KfyvfQ3Wa
 RKPr3mj5OlJWw==
Date: Tue, 3 Sep 2024 10:53:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Friedrich Vock <friedrich.vock@gmx.de>,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 2/6] drm/cgroup: Add memory accounting DRM cgroup
Message-ID: <20240903-resilient-quiet-oxpecker-d57d7a@houat>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
 <20240627-paper-vicugna-of-fantasy-c549ed@houat>
 <6cb7c074-55cb-4825-9f80-5cf07bbd6745@linux.intel.com>
 <20240628-romantic-emerald-snake-7b26ca@houat>
 <70289c58-7947-4347-8600-658821a730b0@linux.intel.com>
 <40ef0eed-c514-4ec1-9486-2967f23824be@ursulin.net>
 <ZrIeuLi88jqbQ0FH@phenom.ffwll.local>
 <20240806-gharial-of-abstract-reverence-aad6ea@houat>
 <ZrJAnbLcj_dU47ZO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r7g4aiuocov6uk3k"
Content-Disposition: inline
In-Reply-To: <ZrJAnbLcj_dU47ZO@phenom.ffwll.local>
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


--r7g4aiuocov6uk3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 05:26:21PM GMT, Daniel Vetter wrote:
> On Tue, Aug 06, 2024 at 04:09:43PM +0200, Maxime Ripard wrote:
> > On Tue, Aug 06, 2024 at 03:01:44PM GMT, Daniel Vetter wrote:
> > > On Mon, Jul 01, 2024 at 06:01:41PM +0100, Tvrtko Ursulin wrote:
> > > >=20
> > > > On 01/07/2024 10:25, Maarten Lankhorst wrote:
> > > > > Den 2024-06-28 kl. 16:04, skrev Maxime Ripard:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Thu, Jun 27, 2024 at 09:22:56PM GMT, Maarten Lankhorst wrote:
> > > > > > > Den 2024-06-27 kl. 19:16, skrev Maxime Ripard:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > Thanks for working on this!
> > > > > > > >=20
> > > > > > > > On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst w=
rote:
> > > > > > > > > The initial version was based roughly on the rdma and mis=
c cgroup
> > > > > > > > > controllers, with a lot of the accounting code borrowed f=
rom rdma.
> > > > > > > > >=20
> > > > > > > > > The current version is a complete rewrite with page count=
er; it uses
> > > > > > > > > the same min/low/max semantics as the memory cgroup as a =
result.
> > > > > > > > >=20
> > > > > > > > > There's a small mismatch as TTM uses u64, and page_counte=
r long pages.
> > > > > > > > > In practice it's not a problem. 32-bits systems don't rea=
lly come with
> > > > > > > > > > =3D4GB cards and as long as we're consistently wrong wi=
th units, it's
> > > > > > > > > fine. The device page size may not be in the same units a=
s kernel page
> > > > > > > > > size, and each region might also have a different page si=
ze (VRAM vs GART
> > > > > > > > > for example).
> > > > > > > > >=20
> > > > > > > > > The interface is simple:
> > > > > > > > > - populate drmcgroup_device->regions[..] name and size fo=
r each active
> > > > > > > > >     region, set num_regions accordingly.
> > > > > > > > > - Call drm(m)cg_register_device()
> > > > > > > > > - Use drmcg_try_charge to check if you can allocate a chu=
nk of memory,
> > > > > > > > >     use drmcg_uncharge when freeing it. This may return a=
n error code,
> > > > > > > > >     or -EAGAIN when the cgroup limit is reached. In that =
case a reference
> > > > > > > > >     to the limiting pool is returned.
> > > > > > > > > - The limiting cs can be used as compare function for
> > > > > > > > >     drmcs_evict_valuable.
> > > > > > > > > - After having evicted enough, drop reference to limiting=
 cs with
> > > > > > > > >     drmcs_pool_put.
> > > > > > > > >=20
> > > > > > > > > This API allows you to limit device resources with cgroup=
s.
> > > > > > > > > You can see the supported cards in /sys/fs/cgroup/drm.cap=
acity
> > > > > > > > > You need to echo +drm to cgroup.subtree_control, and then=
 you can
> > > > > > > > > partition memory.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.=
intel.com>
> > > > > > > > > Co-developed-by: Friedrich Vock<friedrich.vock@gmx.de>
> > > > > > > > I'm sorry, I should have wrote minutes on the discussion we=
 had with TJ
> > > > > > > > and Tvrtko the other day.
> > > > > > > >=20
> > > > > > > > We're all very interested in making this happen, but doing =
a "DRM"
> > > > > > > > cgroup doesn't look like the right path to us.
> > > > > > > >=20
> > > > > > > > Indeed, we have a significant number of drivers that won't =
have a
> > > > > > > > dedicated memory but will depend on DMA allocations one way=
 or the
> > > > > > > > other, and those pools are shared between multiple framewor=
ks (DRM,
> > > > > > > > V4L2, DMA-Buf Heaps, at least).
> > > > > > > >=20
> > > > > > > > This was also pointed out by Sima some time ago here:
> > > > > > > > https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.f=
fwll.local/
> > > > > > > >=20
> > > > > > > > So we'll want that cgroup subsystem to be cross-framework. =
We settled on
> > > > > > > > a "device" cgroup during the discussion, but I'm sure we'll=
 have plenty
> > > > > > > > of bikeshedding.
> > > > > > > >=20
> > > > > > > > The other thing we agreed on, based on the feedback TJ got =
on the last
> > > > > > > > iterations of his series was to go for memcg for drivers no=
t using DMA
> > > > > > > > allocations.
> > > > > > > >=20
> > > > > > > > It's the part where I expect some discussion there too :)
> > > > > > > >=20
> > > > > > > > So we went back to a previous version of TJ's work, and I'v=
e started to
> > > > > > > > work on:
> > > > > > > >=20
> > > > > > > >     - Integration of the cgroup in the GEM DMA and GEM VRAM=
 helpers (this
> > > > > > > >       works on tidss right now)
> > > > > > > >=20
> > > > > > > >     - Integration of all heaps into that cgroup but the sys=
tem one
> > > > > > > >       (working on this at the moment)
> > > > > > >=20
> > > > > > > Should be similar to what I have then. I think you could use =
my work to
> > > > > > > continue it.
> > > > > > >=20
> > > > > > > I made nothing DRM specific except the name, if you renamed i=
t the device
> > > > > > > resource management cgroup and changed the init function sign=
ature to take a
> > > > > > > name instead of a drm pointer, nothing would change. This is =
exactly what
> > > > > > > I'm hoping to accomplish, including reserving memory.
> > > > > >=20
> > > > > > I've started to work on rebasing my current work onto your seri=
es today,
> > > > > > and I'm not entirely sure how what I described would best fit. =
Let's
> > > > > > assume we have two KMS device, one using shmem, one using DMA
> > > > > > allocations, two heaps, one using the page allocator, the other=
 using
> > > > > > CMA, and one v4l2 device using dma allocations.
> > > > > >=20
> > > > > > So we would have one KMS device and one heap using the page all=
ocator,
> > > > > > and one KMS device, one heap, and one v4l2 driver using the DMA
> > > > > > allocator.
> > > > > >=20
> > > > > > Would these make different cgroup devices, or different cgroup =
regions?
> > > > >=20
> > > > > Each driver would register a device, whatever feels most logical =
for that device I suppose.
> > > > >=20
> > > > > My guess is that a prefix would also be nice here, so register a =
device with name of drm/$name or v4l2/$name, heap/$name. I didn't give it m=
uch thought and we're still experimenting, so just try something. :)
> > > > >=20
> > > > > There's no limit to amount of devices, I only fixed amount of poo=
ls to match TTM, but even that could be increased arbitrarily. I just don't=
 think there is a point in doing so.
> > > >=20
> > > > Do we need a plan for top level controls which do not include regio=
n names?
> > > > If the latter will be driver specific then I am thinking of ease of
> > > > configuring it all from the outside. Especially considering that on=
e cgroup
> > > > can have multiple devices in it.
> > > >=20
> > > > Second question is about double accounting for shmem backed objects=
=2E I think
> > > > they will be seen, for drivers which allocate backing store at buff=
er
> > > > objects creation time, under the cgroup of process doing the creati=
on, in
> > > > the existing memory controller. Right?
> > >=20
> > > We currently don't set __GFP_ACCOUNT respectively use GFP_KERNEL_ACCO=
UNT,
> > > so no. Unless someone allocates them with GFP_USER ...
> > >=20
> > > > Is there a chance to exclude those from there and only have them in=
 this new
> > > > controller? Or would the opposite be a better choice? That is, not =
see those
> > > > in the device memory controller but only in the existing one.
> > >=20
> > > I missed this, so jumping in super late. I think guidance from Tejun =
was
> > > to go the other way around: Exclude allocations from normal system
> > > memory from device cgroups and instead make sure it's tracked in the
> > > existing memcg.
> > >=20
> > > Which might mean we need memcg shrinkers and the assorted pain ...
> > >=20
> > > Also I don't think we ever reached some agreement on where things lik=
e cma
> > > allocations should be accounted for in this case.
> >=20
> > Yeah, but that's the thing, memcg probably won't cut it for CMA. Because
> > if you pull the thread, that means that dma-heaps also have to register
> > their buffers into memcg too, even if it's backed by something else than
> > RAM.
>=20
> For cma I'm kinda leaning towards "both". If you don't have a special cma
> cgroup and just memcg, you can exhaust the cma easily. But if the cma
> allocations also aren't tracked in memcg, you have a blind spot there,
> which isn't great.

I think one of earlier comment from Tejun was that we don't want to
double-account memory, but I guess your point is that we should double
account if we allocate CMA buffers from the main CMA allocator, and not
if we're allocating from a secondary one?

Maxime

--r7g4aiuocov6uk3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtbOfQAKCRAnX84Zoj2+
dnwzAYCEWYkV8bFQQiateI5fA27NPKONLZzvNymw/YlkL6RqCbyy8yQF5/c3OB2y
FyfBwboBgN6ohy+xL0NP1ul/DCpoJ/yDH0DMRhvYsEGPgvbkGm+8WPbc/KFc/xKt
alKvNeyYYQ==
=9H/P
-----END PGP SIGNATURE-----

--r7g4aiuocov6uk3k--
