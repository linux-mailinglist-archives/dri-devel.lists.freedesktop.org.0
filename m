Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FEB7FD52B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C9810E19F;
	Wed, 29 Nov 2023 11:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CD910E19F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:11:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CDD52CE1E7D;
 Wed, 29 Nov 2023 11:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AAAC433C7;
 Wed, 29 Nov 2023 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701256259;
 bh=TgKyGRCEeshKQvQjUN7AFNof2EniJcjgu0CRQnVYZ/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5zVZl8he0ZR2AllaDzQjsJvcC48I2DVX+YcZFM4U4lJRKdlzKQj01rXDkKkH+LiF
 lHPugHnBXU9Lz3GIPchKCA3swnNkGfRCeEF7Buegp/GVjESt8XFaaaMPn8uO0Np3fb
 QH4uoT6GVpVu5f8G7K3G8tLfTfynCUbzOB/07Y+ZEgy164kJsj+v5TkYpKomkznNh+
 o5wraA67njkrtd/dGw69TlIN3Ax9ir38Qz9LqnnMp4EoQtIsRef7Y62C7rehvUiPF4
 ju3lZ56sfX8cpuSMTaWug99glEWX2Km1aBuUBK4q0AvF6dx7s7cm86D7FR90U6fgLj
 W0tL9BmfmuMqg==
Date: Wed, 29 Nov 2023 12:10:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <kygezdrfz56zj6lmq6l5s5yyys2urgq3id7r5n4mb3afn5kc5q@eswnd6a2ihqc>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
 <8734wo7vbx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yiklpqzxs4i4jbph"
Content-Disposition: inline
In-Reply-To: <8734wo7vbx.fsf@intel.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yiklpqzxs4i4jbph
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 11:38:42AM +0200, Jani Nikula wrote:
> On Wed, 29 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > Hi Ville,
> >
> > On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrj=E4l=E4 wrote:
> >> On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
> >> > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> >> > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> >> > > > All the drm_connector_init variants take at least a pointer to t=
he
> >> > > > device, connector and hooks implementation.
> >> > > >
> >> > > > However, none of them check their value before dereferencing tho=
se
> >> > > > pointers which can lead to a NULL-pointer dereference if the aut=
hor
> >> > > > isn't careful.
> >> > >=20
> >> > > Arguably oopsing on the spot is preferrable when this can't be cau=
sed by
> >> > > user input. It's always a mistake that should be caught early duri=
ng
> >> > > development.
> >> > >=20
> >> > > Not everyone checks the return value of drm_connector_init and fri=
ends,
> >> > > so those cases will lead to more mysterious bugs later. And probab=
ly
> >> > > oopses as well.
> >> >=20
> >> > So maybe we can do both then, with something like
> >> >=20
> >> > if (WARN_ON(!dev))
> >> >    return -EINVAL
> >> >=20
> >> > if (drm_WARN_ON(dev, !connector || !funcs))
> >> >    return -EINVAL;
> >> >=20
> >> > I'd still like to check for this, so we can have proper testing, and=
 we
> >> > already check for those pointers in some places (like funcs in
> >> > drm_connector_init), so if we don't cover everything we're inconsist=
ent.
> >>=20
> >> People will invariably cargo-cult this kind of stuff absolutely
> >> everywhere and then all your functions will have tons of dead
> >> code to check their arguments.
> >
> > And that's a bad thing because... ?
> >
> > Also, are you really saying that checking that your arguments make sense
> > is cargo-cult?
>=20
> It's a powerful thing to be able to assume a NULL argument is always a
> fatal programming error on the caller's side, and should oops and get
> caught immediately. It's an assertion.

Yeah, but we're not really doing that either. We have no explicit
assertion anywhere. We take a pointer in, and just hope that it will be
dereferenced later on and that the kernel will crash. The pointer to the
functions especially is only deferenced very later on.

And assertions might be powerful, but being able to notice errors and
debug them is too. A panic takes away basically any remote access to
debug. If you don't have a console, you're done.

> We're not talking about user input or anything like that here.
>=20
> If you start checking for things that can't happen, and return errors
> for them, you start gracefully handling things that don't have anything
> graceful about them.

But there's nothing graceful to do here: you just return from your probe
function that you couldn't probe and that's it. Just like you do when
you can't map your registers, or get your interrupt, or register into
any framework (including drm_dev_register that pretty much every driver
handles properly if it returns an error, without being graceful about
it).

> Having such checks in place trains people to think they *may* happen.

In most cases, kmalloc can't fail. We seem to have a very different
policy towards it.

> While it should fail fast and loud at the developer's first smoke test,
> and get fixed then and there.

Returning an error + a warning also qualifies for "fail fast and loud".
But keeps the system alive for someone to notice in any case.

Maxime

--yiklpqzxs4i4jbph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWccQAAKCRDj7w1vZxhR
xQWeAP9Ze0DmGeFKXN1BEGWfARxDJxHLh2vej5D8shdyccTj2AEAop8XqkWN1XF3
9wqNkaKiWk7HPoVA26RTjT1FaSG8DA8=
=jh/M
-----END PGP SIGNATURE-----

--yiklpqzxs4i4jbph--
