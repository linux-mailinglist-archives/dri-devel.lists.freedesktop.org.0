Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202327FDAE9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4411210E609;
	Wed, 29 Nov 2023 15:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535FC10E609
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:15:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 68E95B83EFA;
 Wed, 29 Nov 2023 15:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC9BC433C8;
 Wed, 29 Nov 2023 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701270929;
 bh=G4KNOLo204cSqfNlTKVnawIoZfYOcU/zZde3EP6srWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ss+B2p1iAJmeQik5fRW2vWigKLzodL3xw16ee4s2pMDQ7mY+g3XQBxT1PmioSnego
 AkUGg7yFGHB/KCRGffMnOw+U++skPCm/cXkS7nqUX46Od3+EomygJor39hQDOcKxk8
 FEFYtlWaPKApN4tJL6OSmlcV6LbSJcNY8WbBo6xvPm3O0RgPS4K6Xpc8XSjGc8/HM0
 DwWReyQPDMYA/dLMvNxfuOte61gP3PG0wDhvMbj74ckwmAw01shE70Yc2S5hGiwhy2
 nH/C777mzOyJjod3bay7B4Pp62rk22L9i3FrNX+0kiDij9Ut4+1KIGVJQCoNXsaUkA
 EHEeLw/pb4AEw==
Date: Wed, 29 Nov 2023 16:15:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <6da6mzwfzwbn5rhiebypo5e2v6rhtpn2fovwvfnoo333zjgobf@bgtuwhum3trp>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-5-dmitry.osipenko@collabora.com>
 <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
 <20231124115911.79ab24af@collabora.com>
 <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
 <20231128133712.53a6f6cb@collabora.com>
 <37208c72-7908-0a78-fc89-2fa9b8d756a5@collabora.com>
 <20231129085330.7ccb35d3@collabora.com>
 <ioqghyaeftyo7tuyfecn252ykxwgltrkhh2pwktjejqhewntbb@bym3rsjxnxfp>
 <20231129144609.7544e773@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="we7y742rtmyykixq"
Content-Disposition: inline
In-Reply-To: <20231129144609.7544e773@collabora.com>
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
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--we7y742rtmyykixq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:46:09PM +0100, Boris Brezillon wrote:
> On Wed, 29 Nov 2023 14:09:47 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Wed, Nov 29, 2023 at 08:53:30AM +0100, Boris Brezillon wrote:
> > > On Wed, 29 Nov 2023 01:05:14 +0300
> > > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> > >  =20
> > > > On 11/28/23 15:37, Boris Brezillon wrote: =20
> > > > > On Tue, 28 Nov 2023 12:14:42 +0100
> > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > >    =20
> > > > >> Hi,
> > > > >>
> > > > >> On Fri, Nov 24, 2023 at 11:59:11AM +0100, Boris Brezillon wrote:=
   =20
> > > > >>> On Fri, 24 Nov 2023 11:40:06 +0100
> > > > >>> Maxime Ripard <mripard@kernel.org> wrote:
> > > > >>>      =20
> > > > >>>> On Mon, Oct 30, 2023 at 02:01:43AM +0300, Dmitry Osipenko wrot=
e:     =20
> > > > >>>>> Add locked and remove unlocked postfixes from drm-shmem funct=
ion names,
> > > > >>>>> making names consistent with the drm/gem core code.
> > > > >>>>>
> > > > >>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > >>>>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > >>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com=
>       =20
> > > > >>>>
> > > > >>>> This contradicts my earlier ack on a patch but...
> > > > >>>>      =20
> > > > >>>>> ---
> > > > >>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 64 +++++++++=
----------
> > > > >>>>>  drivers/gpu/drm/lima/lima_gem.c               |  8 +--
> > > > >>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
> > > > >>>>>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
> > > > >>>>>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
> > > > >>>>>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
> > > > >>>>>  drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
> > > > >>>>>  drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
> > > > >>>>>  include/drm/drm_gem_shmem_helper.h            | 36 +++++----=
--
> > > > >>>>>  9 files changed, 64 insertions(+), 64 deletions(-)
> > > > >>>>>
> > > > >>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers=
/gpu/drm/drm_gem_shmem_helper.c
> > > > >>>>> index 0d61f2b3e213..154585ddae08 100644
> > > > >>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > > >>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > > >>>>> @@ -43,8 +43,8 @@ static const struct drm_gem_object_funcs dr=
m_gem_shmem_funcs =3D {
> > > > >>>>>  	.pin =3D drm_gem_shmem_object_pin,
> > > > >>>>>  	.unpin =3D drm_gem_shmem_object_unpin,
> > > > >>>>>  	.get_sg_table =3D drm_gem_shmem_object_get_sg_table,
> > > > >>>>> -	.vmap =3D drm_gem_shmem_object_vmap,
> > > > >>>>> -	.vunmap =3D drm_gem_shmem_object_vunmap,
> > > > >>>>> +	.vmap =3D drm_gem_shmem_object_vmap_locked,
> > > > >>>>> +	.vunmap =3D drm_gem_shmem_object_vunmap_locked,       =20
> > > > >>>>
> > > > >>>> While I think we should indeed be consistent with the names, I=
 would
> > > > >>>> also expect helpers to get the locking right by default.     =
=20
> > > > >>>
> > > > >>> Wait, actually I think this patch does what you suggest already=
=2E The
> > > > >>> _locked() prefix tells the caller: "you should take care of the=
 locking,
> > > > >>> I expect the lock to be held when this is hook/function is call=
ed". So
> > > > >>> helpers without the _locked() prefix take care of the locking (=
which I
> > > > >>> guess matches your 'helpers get the locking right' expectation)=
, and
> > > > >>> those with the _locked() prefix don't.     =20
> > > > >>
> > > > >> What I meant by "getting the locking right" is indeed a bit ambi=
guous,
> > > > >> sorry. What I'm trying to say I guess is that, in this particula=
r case,
> > > > >> I don't think you can expect the vmap implementation to be calle=
d with
> > > > >> or without the locks held. The doc for that function will say th=
at it's
> > > > >> either one or the other, but not both.
> > > > >>
> > > > >> So helpers should follow what is needed to provide a default vma=
p/vunmap
> > > > >> implementation, including what locking is expected from a vmap/v=
unmap
> > > > >> implementation.   =20
> > > > >=20
> > > > > Hm, yeah, I think that's a matter of taste. When locking is often
> > > > > deferrable, like it is in DRM, I find it beneficial for funcions =
and
> > > > > function pointers to reflect the locking scheme, rather than rely=
ing on
> > > > > people properly reading the doc, especially when this is the only
> > > > > outlier in the group of drm_gem_object_funcs we already have, and=
 it's
> > > > > not event documented at the drm_gem_object_funcs level [1] :P.
> > > > >    =20
> > > > >>
> > > > >> If that means that vmap is always called with the locks taken, t=
hen
> > > > >> drm_gem_shmem_object_vmap can just assume that it will be called=
 with
> > > > >> the locks taken and there's no need to mention it in the name (a=
nd you
> > > > >> can probably sprinkle a couple of lockdep assertion to make sure=
 the
> > > > >> locking is indeed consistent).   =20
> > > > >=20
> > > > > Things get very confusing when you end up having drm_gem_shmem he=
lpers
> > > > > that are suffixed with _locked() to encode the fact locking is the
> > > > > caller's responsibility and no suffix for the
> > > > > callee-takes-care-of-the-locking semantics, while other helpers t=
hat are
> > > > > not suffixed at all actually implement the
> > > > > caller-should-take-care-of-the-locking semantics.
> > > > >    =20
> > > > >>   =20
> > > > >>>> I'm not sure how reasonable it is, but I think I'd prefer to t=
urn this
> > > > >>>> around and keep the drm_gem_shmem_object_vmap/unmap helpers na=
me, and
> > > > >>>> convert whatever function needs to be converted to the unlock =
suffix so
> > > > >>>> we get a consistent naming.     =20
> > > > >>>
> > > > >>> That would be an _unlocked() prefix if we do it the other way a=
round. I
> > > > >>> think the main confusion comes from the names of the hooks in
> > > > >>> drm_gem_shmem_funcs. Some of them, like drm_gem_shmem_funcs::v[=
un]map()
> > > > >>> are called with the GEM resv lock held, and locking is handled =
by the
> > > > >>> core, others, like drm_gem_shmem_funcs::[un]pin() are called
> > > > >>> without the GEM resv lock held, and locking is deferred to the
> > > > >>> implementation. As I said, I don't mind prefixing hooks/helpers=
 with
> > > > >>> _unlocked() for those that take care of the locking, and no pre=
fix for
> > > > >>> those that expects locks to be held, as long as it's consistent=
, but I
> > > > >>> just wanted to make sure we're on the same page :-).     =20
> > > > >>
> > > > >> What about _nolock then? It's the same number of characters than
> > > > >> _locked, plus it expresses what the function is (not) doing, not=
 what
> > > > >> context it's supposed to be called in?   =20
> > > > >=20
> > > > > Just did a quick
> > > > >=20
> > > > >   git grep _nolock drivers/gpu/drm
> > > > >=20
> > > > > and it returns zero result, where the _locked/_unlocked pattern s=
eems
> > > > > to already be widely used. Not saying we shouldn't change that, b=
ut it
> > > > > doesn't feel like a change we should do as part of this series.
> > > > >=20
> > > > > Regards,
> > > > >=20
> > > > > Boris
> > > > >=20
> > > > > [1]https://elixir.bootlin.com/linux/v6.7-rc3/source/include/drm/d=
rm_gem.h#L155   =20
> > > >=20
> > > > I'm fine with dropping the _locked() postfix from the common GEM he=
lpers
> > > > and documenting the locking rule in drm_gem. Thank you all for the
> > > > suggestions :) =20
> > >=20
> > > Sorry to disagree, but I think a proper function name/suffix is
> > > sometimes worth a few lines of doc. Not saying we should do one or the
> > > other, I think we should do both. But when I see a function suffixed
> > > _locked, _unlocked or _nolock, I can immediately tell if this function
> > > defers the locking to the caller or not, and then go check which lock
> > > in the function doc.
> > >=20
> > > And the second thing I'm not happy with, is the fact we go back to an
> > > inconsistent naming in drm_gem_shmem_helper.c, where some functions
> > > deferring the locking to the caller are suffixed _locked and others a=
re
> > > not, because ultimately, you need a different name when you expose the
> > > two variants... =20
> >=20
> > I guess one of the point I was trying to make was also: why do you need
> > both?
> >=20
> > If one is better than the other (whatever better means here), then all
> > drivers should use it.
> >=20
> > The counterpart being that if provided a choice, you can be sure that a
> > lot of people will get it wrong. The one example I have in mind for
> > example was the drm_atomic_helper_commit_tail vs
> > drm_atomic_helper_commit_tail_rpm. The latter is now widely used, and
> > most of it is cargo-cult.
> >=20
> > I think you were referring to the locks being deferred vs taken right
> > now before, why do we need to have the choice between the two?
>
> Because DRM locking is complex, and you sometimes have to call some
> helpers in a context where you already hold the GEM dma_resv lock.
> That's not the case for _v[un]map(), because the core always takes the
> lock for us if we call drm_gem_vmap_unlocked().

Ok

> Now, let's assume we drop the _locked() suffix on
> drm_gem_shmem_v[un]map(), but keep it on other helpers that need both
> variants. This results in an inconsistent naming scheme inside the
> same source file, which I find utterly confusing.
>
> Note that the initial reason I asked Dmitry if he could add the
> _locked suffix to drm_gem_shmem_vmap() is because I started using
> drm_gem_shmem_vmap() in powervr, before realizing this version wasn't
> taking the lock, and I should have used drm_gem_vmap_unlocked()
> instead, so this is not something I'm making up.

Sorry if I gave you the impression I thought that you're making that up,
I'm not.

Thanks for the explanation btw, I think I get what you're saying now:

 - drm_gem_shmem_vmap() is never taking the locks because the core
   expects to take them before calling them.

 - drm_gem_shmem_vunmap() is never taking the locks because the core
   expects to take them before calling them.

 - Some other code path can still call those helpers in drivers, and the
   locking isn't handled by the core anymore.

 - We now have _vmap/vunmap_unlocked functions to take those locks for
   those code paths

 - And the variant names are now confusing, making people use the
   lockless version in situations where they should have use the locked
   one.

Is that a correct summary?

If so, then I agree that we need to change the name.

We discussed it some more on IRC, and we agree that the "default"
function should handle the locking properly and that's what the most
common case should use.

So that means than drm_gem_shmem_vmap/vunmap() should take the lock
itself, and drm_gem_shmem_vmap/vunmap_nolock/unlocked never does.

I think I'd prefer the nolock variant over unlocked still.

And I also think we can improve the documentation and add lockdep calls
to make sure that the difference between variants is clear in the doc,
and if someone still get confused we can catch it.

Does that sound like a plan?

Maxime

--we7y742rtmyykixq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWdVjgAKCRDj7w1vZxhR
xSWpAQDeEkidLeCIUhKi5dBXf7LLpU++AEWp5i7IKIV0AQqFcgEAgEPcB7glVF7H
i5+o7YxMAQiDXuIVOvm1tnR+6eOdYAo=
=dQtk
-----END PGP SIGNATURE-----

--we7y742rtmyykixq--
