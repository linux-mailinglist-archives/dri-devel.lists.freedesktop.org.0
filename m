Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49557BE5E1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 18:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F00610E282;
	Mon,  9 Oct 2023 16:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3524010E282
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 16:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 31638B81210;
 Mon,  9 Oct 2023 16:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFABC433C8;
 Mon,  9 Oct 2023 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696867625;
 bh=1strwiioQ/X/Xz3/gIscFcxzJpQpzVKq0eQ1ZbPIBzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g7uqCO2fOafN7PHIlkOvBUtVafW23sPEqkkP6izPCTNmY0A2PpEe3A7gBuUgJ5WBT
 IhicDoehUnujV0uMUvXSGV3U7JmGdnbv3ggMNmd7s+xAbXpAGZIFLkX0vZcw2DGNY9
 AZng2lCcvMr6vUN+UZD1HjWpePhsNxwvABvz+TcFwi0b/zkQBFig2IeOa64c6yommZ
 LKvOvEIuqNvzTLB1/iTwGpJ3MX7Cno4VMUOJ6fqaY7fVrdvPuyt+8z0/lfSSA6XCCU
 oUl3CIApx7vGlafd8CwyCQ43dqc5BNkCpl9cZGisqEmQl8SbJBCIf0eMz7VvoLzINp
 sTS2vCfZXVNAQ==
Date: Mon, 9 Oct 2023 18:07:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
References: <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cqiaipfg4xnblg2s"
Content-Disposition: inline
In-Reply-To: <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
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


--cqiaipfg4xnblg2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 04:05:19PM +0200, Jocelyn Falempe wrote:
> > > - I find it risky to completely reconfigure the hardware in a panic h=
andler.
> >=20
> > I would expect to only change the format and base address of the
> > framebuffer. I guess it can fail, but it doesn't seem that different to
> > the async plane update we already have and works well.
> >=20
> In this case it can work, but by using generic drm api, it's hard to know
> what the driver will do.

We should document extensively what we expect drivers to do in those
hooks, and possibly call cant_sleep() in the framework function to have
some reporting at least.

> > > Also how many drivers would need this ?
> > >=20
> > > Currently I was mostly considering x86 platform, so:
> > >=20
> > > simpledrm/ast/mgag200 which works well with the get_scanout_buffer().
> > >=20
> > > i915/amdgpu/nouveau, which are quite complex, and will need to do the=
ir own
> > > thing anyway.
> >=20
> > I guess we're not entirely aligned there then. I would expect that
> > mechanism to work with any atomic KMS driver. You are right that i915,
> > amdgpu and nouveau are special enough that some extra internal plumbing
> > is going to be required, but I'd expect it to be easy to support with
> > any other driver for a memory-mapped device.
> >=20
> > I guess what I'm trying to say is, even though it's totally fine that
> > you only support those drivers at first, supporting in vc4 for example
> > shouldn't require to rewrite the whole thing.
>=20
> Would that work for you to put that in a drm_panic_helper.c,
> so that drivers can opt-in ?
>=20
> So the driver can call a drm_panic_helper_prepare_commit() at
> initialization, and then in the get_scanout_buffer() function

If we have a full blown commit with a new framebuffer, why do we need
get_scanout_buffer? It should be either the framebuffer itself, or in
the plane state if you have a conversion.

> run the atomic_update() on it, and return this commit's framebuffer ?
>=20
> That way each driver have a better control on what the panic handler will
> do.
> It can even call directly its internal functions, to avoid the locks of t=
he
> drm generic functions, and make sure it will only change the format and b=
ase
> address.
> That's a bit more work for each driver, but should be more reliable I thi=
nk.

I don't think that better control there is a good idea, it's a path that
won't get tested much so we'd be better off not allowing drivers to
deviate too much from the "ideal" design.

What I had in mind is something like:

  - Add a panic hook in drm_mode_config_funcs, with a
    drm_atomic_helper_panic helper;

  - Provide an atomic_panic hook or something in drm_plane_helper_funcs;

  - If they are set, we register the drm_panic handler;

  - The handler will call drm_mode_config_funcs.panic, which will take
    its prepared state, fill the framebuffer it allocated with the
    penguin and backtrace, call drm_plane_helper_funcs.atomic_panic().

  - The driver now updates the format and fb address.

  - Halt and catch fire

Does that make sense?
Maxime

--cqiaipfg4xnblg2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSQlJgAKCRDj7w1vZxhR
xQJ+AQCgxpbvAErhcVuxm2RSDNFFZhiipxzCyawuLwNKYBH5DgD+KLi0VDLAI1Vz
t1wM365RwpnPVkaMTVuySxrLfjaj4AQ=
=2oSb
-----END PGP SIGNATURE-----

--cqiaipfg4xnblg2s--
