Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A677BF5E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C97D10E0FC;
	Tue, 10 Oct 2023 08:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17C710E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:30:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 58D0DB81894;
 Tue, 10 Oct 2023 08:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC25C433C7;
 Tue, 10 Oct 2023 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696926647;
 bh=lQjd/Agoy1I28kNDea3kLyRBrAWsa2Q1g8LjHoux2xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGhMu51yhMGgk0siqlfXOi6xKSi0v+a47A+QwpiA0XpVgenumZm45GP6nzk24736J
 jACvOEoqimUygxA1k29ChVE6NXDwy6elOPNitQ/PqioXIp15IXbSB5XdbpwieY8MuF
 jN9zeNnOtceEkxPf6zSNK1FWq+dHvKnW8cyQs1G30U8aB+VIJTCk949KxFPAW+lXKk
 p9qtvmX3sjjRQ3EqcM7tX0uv7iuIsUEpES4sVn+3GOeGwS6CUQ9SbTZ1JTsHy+ShBL
 erknvoF2BBS99CgNFSwezIULgQgpaRJ3qFkdv1GnncMQLUmIggSV4MxHXlcOrLW6V6
 R7WzvHLgl95QA==
Date: Tue, 10 Oct 2023 10:30:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <c3i5osk4hyzwr36j4khh3vegi7nsdizyb7juxizc4y5kp75fo2@isnl4jzs7rg3>
References: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
 <2b541955-11ba-d881-d2b2-c54cbae9d241@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xxyyacvi4hjtv73m"
Content-Disposition: inline
In-Reply-To: <2b541955-11ba-d881-d2b2-c54cbae9d241@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xxyyacvi4hjtv73m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 09:55:46AM +0200, Jocelyn Falempe wrote:
> On 09/10/2023 18:07, Maxime Ripard wrote:
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
> >=20
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
> Yes, I will do some experiment with that, and see if I can make it
> work this way.

Thanks :)

> If possible I still want to have a way for simple drivers like
> simpledrm/mgag200 to not allocate a full framebuffer.

I guess the split isn't going to be whether the driver is simple or not,
but whether it always has access to the buffer used by the scanout.

Like for simpledrm, we have that guarantee so it makes sense. For other,
if we allow "direct" dma-buf, it's game over and we just can't.

Maxime

--xxyyacvi4hjtv73m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSULtAAKCRDj7w1vZxhR
xax3AQCrjA+UPsZK4AUGXxYRclMLXyJ9DD1qdfkwU07JuFd3VgD/djuV8Vbb6Qfe
U+mjJE2LIR9Hg082Cmofki95SPUUfgM=
=AgG1
-----END PGP SIGNATURE-----

--xxyyacvi4hjtv73m--
