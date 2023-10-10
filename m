Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7727BF770
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373710E12E;
	Tue, 10 Oct 2023 09:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6697B10E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:33:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B34BC61595;
 Tue, 10 Oct 2023 09:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1138BC433C7;
 Tue, 10 Oct 2023 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696930437;
 bh=FfqyvuOexo7ehZvxVHuIVtUvLWWeXaYhbwIzbkn9I2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YBgYUXEuT+QpQ9ZMZffTb0WGPjmW60HOD9eAqdSwDPTqOEr6/cM9coZ7cvW0ufLzw
 b4Ds9EXgO4EGCBleKE3DIDKRSSRxsKNXkf90oGqQS33EGxea779MMjLQ7wEcGVpms0
 sahHCpsRjQ+Ew5fFb/deYVc84F6FD9XkHtGVWO8fbSsh5YzxJV+GCfNuQLNjdOFUAd
 YJDUwaYolvSSbdrdy/1UU6SKglyFhIUvn+oudpNkjWBQwGocSgTN5VTCJK3ptc6IAC
 2uiYZ7iWhaDAHBEVo/aVIVD1VFwHPKMkOjM3MnSokV9A+qa3LMq8QSbE7t2P/kz+Ch
 mt9Q1AFFcDHQQ==
Date: Tue, 10 Oct 2023 11:33:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <nkfwl7bs7mbe4xqj3skktlkfoh5osgvdx5jj3oa7dfdfetxnxm@eutubfkjbhmp>
References: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
 <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="73bstx6ukc6q2r3g"
Content-Disposition: inline
In-Reply-To: <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--73bstx6ukc6q2r3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 11:04:33AM +0200, Thomas Zimmermann wrote:
> Am 09.10.23 um 18:07 schrieb Maxime Ripard:
> > On Mon, Oct 09, 2023 at 04:05:19PM +0200, Jocelyn Falempe wrote:
> > > > > - I find it risky to completely reconfigure the hardware in a pan=
ic handler.
> > > >=20
> > > > I would expect to only change the format and base address of the
> > > > framebuffer. I guess it can fail, but it doesn't seem that differen=
t to
> > > > the async plane update we already have and works well.
> > > >=20
> > > In this case it can work, but by using generic drm api, it's hard to =
know
> > > what the driver will do.
> >=20
> > We should document extensively what we expect drivers to do in those
> > hooks, and possibly call cant_sleep() in the framework function to have
> > some reporting at least.
> >=20
> > > > > Also how many drivers would need this ?
> > > > >=20
> > > > > Currently I was mostly considering x86 platform, so:
> > > > >=20
> > > > > simpledrm/ast/mgag200 which works well with the get_scanout_buffe=
r().
> > > > >=20
> > > > > i915/amdgpu/nouveau, which are quite complex, and will need to do=
 their own
> > > > > thing anyway.
> > > >=20
> > > > I guess we're not entirely aligned there then. I would expect that
> > > > mechanism to work with any atomic KMS driver. You are right that i9=
15,
> > > > amdgpu and nouveau are special enough that some extra internal plum=
bing
> > > > is going to be required, but I'd expect it to be easy to support wi=
th
> > > > any other driver for a memory-mapped device.
> > > >=20
> > > > I guess what I'm trying to say is, even though it's totally fine th=
at
> > > > you only support those drivers at first, supporting in vc4 for exam=
ple
> > > > shouldn't require to rewrite the whole thing.
> > >=20
> > > Would that work for you to put that in a drm_panic_helper.c,
> > > so that drivers can opt-in ?
> > >=20
> > > So the driver can call a drm_panic_helper_prepare_commit() at
> > > initialization, and then in the get_scanout_buffer() function
> >=20
> > If we have a full blown commit with a new framebuffer, why do we need
> > get_scanout_buffer? It should be either the framebuffer itself, or in
> > the plane state if you have a conversion.
>=20
> We also have discussions about kexec/kdump support. Here we'd need to
> retrieve the scanout address, forward it to the kexec kernel and put
> simpledrm onto that framebuffer until the regular driver takes over.

Generically speaking, there's strictly no guarantee that the current
scanout buffer is accessible by the CPU. It's not even a driver issue,
it's a workload issue, so it will affect 100% of the times some users,
and some 0% of the time.

> An interface like get_scanout_buffer will be helpful for this use
> case. So it makes sense to use it for the panic handler as well.

It won't be helpful because the vast majority of the ARM drivers (and
thus the vast majority of the KMS drivers) won't be able to implement it
properly and reliably.

> > > run the atomic_update() on it, and return this commit's framebuffer ?
> > >=20
> > > That way each driver have a better control on what the panic handler =
will
> > > do.
> > > It can even call directly its internal functions, to avoid the locks =
of the
> > > drm generic functions, and make sure it will only change the format a=
nd base
> > > address.
> > > That's a bit more work for each driver, but should be more reliable I=
 think.
> >=20
> > I don't think that better control there is a good idea, it's a path that
> > won't get tested much so we'd be better off not allowing drivers to
> > deviate too much from the "ideal" design.
> >=20
> > What I had in mind is something like:
> >=20
> >    - Add a panic hook in drm_mode_config_funcs, with a
> >      drm_atomic_helper_panic helper;
> >=20
> >    - Provide an atomic_panic hook or something in drm_plane_helper_func=
s;
> >=20
> >    - If they are set, we register the drm_panic handler;
> >=20
> >    - The handler will call drm_mode_config_funcs.panic, which will take
> >      its prepared state, fill the framebuffer it allocated with the
> >      penguin and backtrace, call drm_plane_helper_funcs.atomic_panic().
> >=20
> >    - The driver now updates the format and fb address.
> >=20
> >    - Halt and catch fire
> >=20
> > Does that make sense?
>=20
> Please see my other replies. I find this fragile, and unnecessary for cas=
es
> where there already is a working scanout buffer in place.

And please see my other replies. Depending on a working scanout buffer
in place being accessible by the CPU is incredibly limiting. Ignoring it
when I'm pointing that out won't get us to a solution acceptable for
everyone.

> It's something a driver could implement internally to provide a
> scanout buffer if none has been set up already.

Some drivers need extra resources when setting up a plane. VC4 for
example need for every plane to allocate multiple internal SRAM buffers.
Just allocating an extra framebuffer won't cut it.

This is tied to the state so far, so I guess we would need to allocate a
new state. Oh, and if we have several drivers that need to allocate that
extra framebuffer and state, we could make it part of the core or turn
it into a helper?

Maxime

--73bstx6ukc6q2r3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSUaggAKCRDj7w1vZxhR
xSDcAQCrqxe092OsZjkWCf2vhvD8Ub99V7mCe+EPi1wjjHewWAD7Bullmg8geVwz
9Fx/oi9JgnkY+t7xC++zv9Xf9ZRU0wY=
=czeG
-----END PGP SIGNATURE-----

--73bstx6ukc6q2r3g--
