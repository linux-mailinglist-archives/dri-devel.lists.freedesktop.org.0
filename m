Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6A9492AC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6302F10E37C;
	Tue,  6 Aug 2024 14:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qU48sPAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408C110E377;
 Tue,  6 Aug 2024 14:09:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0FFEDCE0B94;
 Tue,  6 Aug 2024 14:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABEFC32786;
 Tue,  6 Aug 2024 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722953386;
 bh=AANtZuK2j5YEXT3CJVteG6oAKDxOt2lT1fCvlswfZMU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=qU48sPAXbcCNf08qJMYn4cRDhmKshB4+owlW/3xBbNEK3hIyVR1Uhp95Td3/HZ27s
 zR81i0EcxAbCl7s9oej3PXzLPNbaCzxhiLiBnjWwYfdTlaxXaom4/tkVBAFXqRGLDT
 FjieblmWqLGB+yhlzrS8nQU9+iU7ZZKxSqk6EYno2V0V92BRUN9HS5XRfT4aZGGYpg
 200j81hrEyKqdhCUMPHKqnY+z73arRoO9gWDjvpA6fcHsrSqbydsok2jJCTPJVdAbs
 itSiIM837RvV3G7R3hbWY8u01k56a2iF0dyfRxmG/j0A2InvEHp8d7y7XIF0fKnV5U
 0bCrCJONLTrDQ==
Date: Tue, 6 Aug 2024 16:09:43 +0200
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
Message-ID: <20240806-gharial-of-abstract-reverence-aad6ea@houat>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
 <20240627-paper-vicugna-of-fantasy-c549ed@houat>
 <6cb7c074-55cb-4825-9f80-5cf07bbd6745@linux.intel.com>
 <20240628-romantic-emerald-snake-7b26ca@houat>
 <70289c58-7947-4347-8600-658821a730b0@linux.intel.com>
 <40ef0eed-c514-4ec1-9486-2967f23824be@ursulin.net>
 <ZrIeuLi88jqbQ0FH@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tjibocpyvmmmnhi7"
Content-Disposition: inline
In-Reply-To: <ZrIeuLi88jqbQ0FH@phenom.ffwll.local>
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


--tjibocpyvmmmnhi7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 03:01:44PM GMT, Daniel Vetter wrote:
> On Mon, Jul 01, 2024 at 06:01:41PM +0100, Tvrtko Ursulin wrote:
> >=20
> > On 01/07/2024 10:25, Maarten Lankhorst wrote:
> > > Den 2024-06-28 kl. 16:04, skrev Maxime Ripard:
> > > > Hi,
> > > >=20
> > > > On Thu, Jun 27, 2024 at 09:22:56PM GMT, Maarten Lankhorst wrote:
> > > > > Den 2024-06-27 kl. 19:16, skrev Maxime Ripard:
> > > > > > Hi,
> > > > > >=20
> > > > > > Thanks for working on this!
> > > > > >=20
> > > > > > On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst wrote:
> > > > > > > The initial version was based roughly on the rdma and misc cg=
roup
> > > > > > > controllers, with a lot of the accounting code borrowed from =
rdma.
> > > > > > >=20
> > > > > > > The current version is a complete rewrite with page counter; =
it uses
> > > > > > > the same min/low/max semantics as the memory cgroup as a resu=
lt.
> > > > > > >=20
> > > > > > > There's a small mismatch as TTM uses u64, and page_counter lo=
ng pages.
> > > > > > > In practice it's not a problem. 32-bits systems don't really =
come with
> > > > > > > > =3D4GB cards and as long as we're consistently wrong with u=
nits, it's
> > > > > > > fine. The device page size may not be in the same units as ke=
rnel page
> > > > > > > size, and each region might also have a different page size (=
VRAM vs GART
> > > > > > > for example).
> > > > > > >=20
> > > > > > > The interface is simple:
> > > > > > > - populate drmcgroup_device->regions[..] name and size for ea=
ch active
> > > > > > >     region, set num_regions accordingly.
> > > > > > > - Call drm(m)cg_register_device()
> > > > > > > - Use drmcg_try_charge to check if you can allocate a chunk o=
f memory,
> > > > > > >     use drmcg_uncharge when freeing it. This may return an er=
ror code,
> > > > > > >     or -EAGAIN when the cgroup limit is reached. In that case=
 a reference
> > > > > > >     to the limiting pool is returned.
> > > > > > > - The limiting cs can be used as compare function for
> > > > > > >     drmcs_evict_valuable.
> > > > > > > - After having evicted enough, drop reference to limiting cs =
with
> > > > > > >     drmcs_pool_put.
> > > > > > >=20
> > > > > > > This API allows you to limit device resources with cgroups.
> > > > > > > You can see the supported cards in /sys/fs/cgroup/drm.capacity
> > > > > > > You need to echo +drm to cgroup.subtree_control, and then you=
 can
> > > > > > > partition memory.
> > > > > > >=20
> > > > > > > Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.inte=
l.com>
> > > > > > > Co-developed-by: Friedrich Vock<friedrich.vock@gmx.de>
> > > > > > I'm sorry, I should have wrote minutes on the discussion we had=
 with TJ
> > > > > > and Tvrtko the other day.
> > > > > >=20
> > > > > > We're all very interested in making this happen, but doing a "D=
RM"
> > > > > > cgroup doesn't look like the right path to us.
> > > > > >=20
> > > > > > Indeed, we have a significant number of drivers that won't have=
 a
> > > > > > dedicated memory but will depend on DMA allocations one way or =
the
> > > > > > other, and those pools are shared between multiple frameworks (=
DRM,
> > > > > > V4L2, DMA-Buf Heaps, at least).
> > > > > >=20
> > > > > > This was also pointed out by Sima some time ago here:
> > > > > > https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll=
=2Elocal/
> > > > > >=20
> > > > > > So we'll want that cgroup subsystem to be cross-framework. We s=
ettled on
> > > > > > a "device" cgroup during the discussion, but I'm sure we'll hav=
e plenty
> > > > > > of bikeshedding.
> > > > > >=20
> > > > > > The other thing we agreed on, based on the feedback TJ got on t=
he last
> > > > > > iterations of his series was to go for memcg for drivers not us=
ing DMA
> > > > > > allocations.
> > > > > >=20
> > > > > > It's the part where I expect some discussion there too :)
> > > > > >=20
> > > > > > So we went back to a previous version of TJ's work, and I've st=
arted to
> > > > > > work on:
> > > > > >=20
> > > > > >     - Integration of the cgroup in the GEM DMA and GEM VRAM hel=
pers (this
> > > > > >       works on tidss right now)
> > > > > >=20
> > > > > >     - Integration of all heaps into that cgroup but the system =
one
> > > > > >       (working on this at the moment)
> > > > >=20
> > > > > Should be similar to what I have then. I think you could use my w=
ork to
> > > > > continue it.
> > > > >=20
> > > > > I made nothing DRM specific except the name, if you renamed it th=
e device
> > > > > resource management cgroup and changed the init function signatur=
e to take a
> > > > > name instead of a drm pointer, nothing would change. This is exac=
tly what
> > > > > I'm hoping to accomplish, including reserving memory.
> > > >=20
> > > > I've started to work on rebasing my current work onto your series t=
oday,
> > > > and I'm not entirely sure how what I described would best fit. Let's
> > > > assume we have two KMS device, one using shmem, one using DMA
> > > > allocations, two heaps, one using the page allocator, the other usi=
ng
> > > > CMA, and one v4l2 device using dma allocations.
> > > >=20
> > > > So we would have one KMS device and one heap using the page allocat=
or,
> > > > and one KMS device, one heap, and one v4l2 driver using the DMA
> > > > allocator.
> > > >=20
> > > > Would these make different cgroup devices, or different cgroup regi=
ons?
> > >=20
> > > Each driver would register a device, whatever feels most logical for =
that device I suppose.
> > >=20
> > > My guess is that a prefix would also be nice here, so register a devi=
ce with name of drm/$name or v4l2/$name, heap/$name. I didn't give it much =
thought and we're still experimenting, so just try something. :)
> > >=20
> > > There's no limit to amount of devices, I only fixed amount of pools t=
o match TTM, but even that could be increased arbitrarily. I just don't thi=
nk there is a point in doing so.
> >=20
> > Do we need a plan for top level controls which do not include region na=
mes?
> > If the latter will be driver specific then I am thinking of ease of
> > configuring it all from the outside. Especially considering that one cg=
roup
> > can have multiple devices in it.
> >=20
> > Second question is about double accounting for shmem backed objects. I =
think
> > they will be seen, for drivers which allocate backing store at buffer
> > objects creation time, under the cgroup of process doing the creation, =
in
> > the existing memory controller. Right?
>=20
> We currently don't set __GFP_ACCOUNT respectively use GFP_KERNEL_ACCOUNT,
> so no. Unless someone allocates them with GFP_USER ...
>=20
> > Is there a chance to exclude those from there and only have them in thi=
s new
> > controller? Or would the opposite be a better choice? That is, not see =
those
> > in the device memory controller but only in the existing one.
>=20
> I missed this, so jumping in super late. I think guidance from Tejun was
> to go the other way around: Exclude allocations from normal system
> memory from device cgroups and instead make sure it's tracked in the
> existing memcg.
>=20
> Which might mean we need memcg shrinkers and the assorted pain ...
>=20
> Also I don't think we ever reached some agreement on where things like cma
> allocations should be accounted for in this case.

Yeah, but that's the thing, memcg probably won't cut it for CMA. Because
if you pull the thread, that means that dma-heaps also have to register
their buffers into memcg too, even if it's backed by something else than
RAM.

This is what this cgroup controller is meant to do: memcg for memory
(GFP'd) buffers, this cgroup for everything else.

Maxime

--tjibocpyvmmmnhi7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZrIupwAKCRDj7w1vZxhR
xfMYAQCjlZGY+yaQq7/ZkakE1LIj5TJntjlKikfSQ4PwzDajvgD/Ts1r9zy6Xvhn
V56sDNPfYscg2EVK3lOydnNo2fLjVAw=
=bQek
-----END PGP SIGNATURE-----

--tjibocpyvmmmnhi7--
