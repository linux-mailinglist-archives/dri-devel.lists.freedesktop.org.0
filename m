Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB87FD78C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 14:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3086C10E1CE;
	Wed, 29 Nov 2023 13:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FAA10E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 13:09:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E009DB83EB9;
 Wed, 29 Nov 2023 13:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D5DC433C7;
 Wed, 29 Nov 2023 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701263390;
 bh=FcQeM2JW0pjz/qIZ9iJf3ARTCkbeamq2sZ+rfbVwJ78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=adfO+nP8B+tVqAa7DCLXrG5jzIDzuIcnffcWyWxe5P8FpNuz7n+03zStpJsg3prnz
 Ep9Aamqr7xUxxbMucrQUimNguhqrX05Ke1I4WHWUmTXbUc5NMsHIPscshwJsJnp0RP
 48UnBZ+4PUsgOL9AStGB5Xgq5YCEkgSMwBVaOzbU1EKTmypo+CR2N4CSezj7YSDph8
 SVod70ImVNS4EuiYv5hcidAX+82+F3syAbySXnuttBMCCmLeSTj2N0AH3MKeGm3thG
 giPR9zUj9E7s2JdSpk9hEpNbdsXU/OV/xb4pk44GCEvRWPgu5Poo1lGC8eAAronD6W
 KsoNsDKX+PvlA==
Date: Wed, 29 Nov 2023 14:09:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <ioqghyaeftyo7tuyfecn252ykxwgltrkhh2pwktjejqhewntbb@bym3rsjxnxfp>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-5-dmitry.osipenko@collabora.com>
 <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
 <20231124115911.79ab24af@collabora.com>
 <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
 <20231128133712.53a6f6cb@collabora.com>
 <37208c72-7908-0a78-fc89-2fa9b8d756a5@collabora.com>
 <20231129085330.7ccb35d3@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zn7b5h5ehnk335hq"
Content-Disposition: inline
In-Reply-To: <20231129085330.7ccb35d3@collabora.com>
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


--zn7b5h5ehnk335hq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 08:53:30AM +0100, Boris Brezillon wrote:
> On Wed, 29 Nov 2023 01:05:14 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>=20
> > On 11/28/23 15:37, Boris Brezillon wrote:
> > > On Tue, 28 Nov 2023 12:14:42 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > >> Hi,
> > >>
> > >> On Fri, Nov 24, 2023 at 11:59:11AM +0100, Boris Brezillon wrote: =20
> > >>> On Fri, 24 Nov 2023 11:40:06 +0100
> > >>> Maxime Ripard <mripard@kernel.org> wrote:
> > >>>    =20
> > >>>> On Mon, Oct 30, 2023 at 02:01:43AM +0300, Dmitry Osipenko wrote:  =
 =20
> > >>>>> Add locked and remove unlocked postfixes from drm-shmem function =
names,
> > >>>>> making names consistent with the drm/gem core code.
> > >>>>>
> > >>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >>>>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>   =
  =20
> > >>>>
> > >>>> This contradicts my earlier ack on a patch but...
> > >>>>    =20
> > >>>>> ---
> > >>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 64 +++++++++----=
------
> > >>>>>  drivers/gpu/drm/lima/lima_gem.c               |  8 +--
> > >>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
> > >>>>>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
> > >>>>>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
> > >>>>>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
> > >>>>>  drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
> > >>>>>  drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
> > >>>>>  include/drm/drm_gem_shmem_helper.h            | 36 +++++------
> > >>>>>  9 files changed, 64 insertions(+), 64 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu=
/drm/drm_gem_shmem_helper.c
> > >>>>> index 0d61f2b3e213..154585ddae08 100644
> > >>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > >>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > >>>>> @@ -43,8 +43,8 @@ static const struct drm_gem_object_funcs drm_ge=
m_shmem_funcs =3D {
> > >>>>>  	.pin =3D drm_gem_shmem_object_pin,
> > >>>>>  	.unpin =3D drm_gem_shmem_object_unpin,
> > >>>>>  	.get_sg_table =3D drm_gem_shmem_object_get_sg_table,
> > >>>>> -	.vmap =3D drm_gem_shmem_object_vmap,
> > >>>>> -	.vunmap =3D drm_gem_shmem_object_vunmap,
> > >>>>> +	.vmap =3D drm_gem_shmem_object_vmap_locked,
> > >>>>> +	.vunmap =3D drm_gem_shmem_object_vunmap_locked,     =20
> > >>>>
> > >>>> While I think we should indeed be consistent with the names, I wou=
ld
> > >>>> also expect helpers to get the locking right by default.   =20
> > >>>
> > >>> Wait, actually I think this patch does what you suggest already. The
> > >>> _locked() prefix tells the caller: "you should take care of the loc=
king,
> > >>> I expect the lock to be held when this is hook/function is called".=
 So
> > >>> helpers without the _locked() prefix take care of the locking (whic=
h I
> > >>> guess matches your 'helpers get the locking right' expectation), and
> > >>> those with the _locked() prefix don't.   =20
> > >>
> > >> What I meant by "getting the locking right" is indeed a bit ambiguou=
s,
> > >> sorry. What I'm trying to say I guess is that, in this particular ca=
se,
> > >> I don't think you can expect the vmap implementation to be called wi=
th
> > >> or without the locks held. The doc for that function will say that i=
t's
> > >> either one or the other, but not both.
> > >>
> > >> So helpers should follow what is needed to provide a default vmap/vu=
nmap
> > >> implementation, including what locking is expected from a vmap/vunmap
> > >> implementation. =20
> > >=20
> > > Hm, yeah, I think that's a matter of taste. When locking is often
> > > deferrable, like it is in DRM, I find it beneficial for funcions and
> > > function pointers to reflect the locking scheme, rather than relying =
on
> > > people properly reading the doc, especially when this is the only
> > > outlier in the group of drm_gem_object_funcs we already have, and it's
> > > not event documented at the drm_gem_object_funcs level [1] :P.
> > >  =20
> > >>
> > >> If that means that vmap is always called with the locks taken, then
> > >> drm_gem_shmem_object_vmap can just assume that it will be called with
> > >> the locks taken and there's no need to mention it in the name (and y=
ou
> > >> can probably sprinkle a couple of lockdep assertion to make sure the
> > >> locking is indeed consistent). =20
> > >=20
> > > Things get very confusing when you end up having drm_gem_shmem helpers
> > > that are suffixed with _locked() to encode the fact locking is the
> > > caller's responsibility and no suffix for the
> > > callee-takes-care-of-the-locking semantics, while other helpers that =
are
> > > not suffixed at all actually implement the
> > > caller-should-take-care-of-the-locking semantics.
> > >  =20
> > >> =20
> > >>>> I'm not sure how reasonable it is, but I think I'd prefer to turn =
this
> > >>>> around and keep the drm_gem_shmem_object_vmap/unmap helpers name, =
and
> > >>>> convert whatever function needs to be converted to the unlock suff=
ix so
> > >>>> we get a consistent naming.   =20
> > >>>
> > >>> That would be an _unlocked() prefix if we do it the other way aroun=
d. I
> > >>> think the main confusion comes from the names of the hooks in
> > >>> drm_gem_shmem_funcs. Some of them, like drm_gem_shmem_funcs::v[un]m=
ap()
> > >>> are called with the GEM resv lock held, and locking is handled by t=
he
> > >>> core, others, like drm_gem_shmem_funcs::[un]pin() are called
> > >>> without the GEM resv lock held, and locking is deferred to the
> > >>> implementation. As I said, I don't mind prefixing hooks/helpers with
> > >>> _unlocked() for those that take care of the locking, and no prefix =
for
> > >>> those that expects locks to be held, as long as it's consistent, bu=
t I
> > >>> just wanted to make sure we're on the same page :-).   =20
> > >>
> > >> What about _nolock then? It's the same number of characters than
> > >> _locked, plus it expresses what the function is (not) doing, not what
> > >> context it's supposed to be called in? =20
> > >=20
> > > Just did a quick
> > >=20
> > >   git grep _nolock drivers/gpu/drm
> > >=20
> > > and it returns zero result, where the _locked/_unlocked pattern seems
> > > to already be widely used. Not saying we shouldn't change that, but it
> > > doesn't feel like a change we should do as part of this series.
> > >=20
> > > Regards,
> > >=20
> > > Boris
> > >=20
> > > [1]https://elixir.bootlin.com/linux/v6.7-rc3/source/include/drm/drm_g=
em.h#L155 =20
> >=20
> > I'm fine with dropping the _locked() postfix from the common GEM helpers
> > and documenting the locking rule in drm_gem. Thank you all for the
> > suggestions :)
>=20
> Sorry to disagree, but I think a proper function name/suffix is
> sometimes worth a few lines of doc. Not saying we should do one or the
> other, I think we should do both. But when I see a function suffixed
> _locked, _unlocked or _nolock, I can immediately tell if this function
> defers the locking to the caller or not, and then go check which lock
> in the function doc.
>=20
> And the second thing I'm not happy with, is the fact we go back to an
> inconsistent naming in drm_gem_shmem_helper.c, where some functions
> deferring the locking to the caller are suffixed _locked and others are
> not, because ultimately, you need a different name when you expose the
> two variants...

I guess one of the point I was trying to make was also: why do you need
both?

If one is better than the other (whatever better means here), then all
drivers should use it.

The counterpart being that if provided a choice, you can be sure that a
lot of people will get it wrong. The one example I have in mind for
example was the drm_atomic_helper_commit_tail vs
drm_atomic_helper_commit_tail_rpm. The latter is now widely used, and
most of it is cargo-cult.

I think you were referring to the locks being deferred vs taken right
now before, why do we need to have the choice between the two?

Maxime

--zn7b5h5ehnk335hq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWc4GwAKCRDj7w1vZxhR
xVncAQCtMh5CKO38Mc9v9Nwxs5iWT7DQzCblQKsI9Q56bmYZ5gD4lQd6ZqippxDh
iVlD3jO8k5m/lih2vEs8Ku5NIxwlCw==
=M3GF
-----END PGP SIGNATURE-----

--zn7b5h5ehnk335hq--
