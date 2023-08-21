Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E02782D97
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 17:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A509110E0EF;
	Mon, 21 Aug 2023 15:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B2310E102
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 15:55:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D41160E9B;
 Mon, 21 Aug 2023 15:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0B5C433C7;
 Mon, 21 Aug 2023 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692633336;
 bh=Yn3tT23gIWmL7bJ1K3Xt1LJ40Ux2Lfdny7ZSzumyYcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r6Bh92Iqm89/R8ZT5SpY/fw6Jp2zSO5S6el75JK5jojTOe/wQ/d5g47e2Xtb5ysYT
 1CcIqSjT7v6pQ1GLWEh2A9IYlmcZ/ojpofJgpnUX9EhJpO6dKhtjBb1uvpEyS5sUGL
 fTox64oiNXwLNsCR5n+HJP5VZldQgEsUGnf+MT0m3yzdqBsWdDhIEHwhenJpV9SrDx
 OpJHrq8bnNbWySqKP1VPCa6sHOmOjNfy7oSGRn+17We2QXBpHEojLuDCOgYwCSETXb
 r1wGp9nisBgm08MH52kAc5xJl+L+8UXklkQ2YKuPjj/Ljg77fBGgNa3mXb2PDD8c/5
 3hcDfZcvdprwg==
Date: Mon, 21 Aug 2023 17:55:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Message-ID: <36prxupvl72tmamorquaunss27kckoq5zegmrwxdr3v3ynqz4s@xiypdbs4pbga>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
 <20230818162415.2185f8e3@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pukytciqvlkbjocg"
Content-Disposition: inline
In-Reply-To: <20230818162415.2185f8e3@eldfell>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pukytciqvlkbjocg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

Thanks for answering

On Fri, Aug 18, 2023 at 04:24:15PM +0300, Pekka Paalanen wrote:
> On Thu, 10 Aug 2023 09:45:27 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
> > > After discussions on IRC, the consensus is that the DRM drivers should
> > > not do software color conversion, and only advertise the supported fo=
rmats.
> > > Update the doc accordingly so that the rule and exceptions are clear =
for
> > > everyone.
> > >=20
> > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fou=
rcc.h
> > > index 8db7fd3f743e..00a29152da9f 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -38,6 +38,13 @@ extern "C" {
> > >   * fourcc code, a Format Modifier may optionally be provided, in ord=
er to
> > >   * further describe the buffer's format - for example tiling or comp=
ression.
> > >   *
> > > + * DRM drivers should not do software color conversion, and only adv=
ertise the
> > > + * format they support in hardware. But there are two exceptions: =
=20
> >=20
> > I would do a bullet list here:
> > https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html=
#lists-and-quote-like-blocks
> >=20
> > > + * The first is to support XRGB8888 if the hardware doesn't support =
it, because
> > > + * it's the de facto standard for userspace applications. =20
> >=20
> > We can also provide a bit more context here, something like:
> >=20
> > All drivers must support XRGB8888, even if the hardware cannot support
> > it. This has become the de-facto standard and a lot of user-space assume
> > it will be present.
> >=20
> > > + * The second is to drop the unused bits when sending the data to th=
e hardware,
> > > + * to improve the bandwidth, like dropping the "X" in XRGB8888. =20
> >=20
> > I think it can be made a bit more generic, with something like:
> >=20
> > Any driver is free to modify its internal representation of the format,
> > as long as it doesn't alter the visible content in any way. An example
> > would be to drop the padding component from a format to save some memory
> > bandwidth.
>
> to my understanding and desire, the rule to not "fake" pixel format
> support is strictly related to performance. When a KMS client does a
> page flip, it usually does not expect a massive amount of CPU or GPU
> work to occur just because of the flip. A name for such work is "copy",
> referring to any kind of copying of large amounts of pixel data,
> including a format conversion or not.

Should we add that to the suggested documentation that it shouldn't
degrade performance and shouldn't be something that the userspace can
notice?

> This is especially important with GPU rendering and hardware video
> playback systems, where any such copy could destroy the usability of
> the whole system. This is the main reason why KMS must not do any
> expensive processing unexpectedly (as in, not documented in UAPI).
> Doing any kind of copy could cause a vblank to be missed, ruining
> display timings.
>=20
> I believe the above is the spirit of the rule.

That's totally reasonable to me :)

> Then there will be exceptions. I'd like to think that everything below
> (except for XRGB8888) can be derived from the above with common sense
> - that's what I did.
>=20
> XRGB8888 support is the prime exception. I suspect it originates from
> the legacy KMS UAPI, and the practise that XRGB8888 has been widely
> supported always. This makes it plausible for userspace to exist that
> cannot produce any other format. Hence, it is good to support XRGB8888
> through a conversion (copy) in the kernel for dumb buffers (that is,
> for software rendered framebuffers). I would be very hesitant to extend
> this exception to GPU rendered buffers, but OTOH if you have a GPU,
> presumably you also have a display controller capable of scanning out
> what the GPU renders, so you wouldn't even consider copying under the
> hood.
>=20
> DRM devices that cannot directly scan out buffers at all are a whole
> category of exceptions. They include USB display adapters (literal USB,
> not USB-C alt mode), perhaps networked and wireless displays, VKMS
> which does everything in software, and so on. They simply have to
> process the bulk pixel data with a CPU one way or another, and
> hopefully they make use of damage rectangles to minimise the work.
>=20
> Old-school special cursor planes may have been using special pixel
> formats that may not be supported by userspace. Cursors are usually
> small images and they can make a huge performance impact, so it makes
> sense to support ARGB8888 even with a CPU conversion.
>=20
> Then we have display controllers without GPUs. Everything is
> software-rendered. If it so happens that software rendering into sysram
> and then copying (with conversion) into VRAM is more performant than
> rendering into VRAM, then the copy is well justified.
>=20
> Software-rendering into sysram and then copying into VRAM is actually
> so commonly preferred, that KMS has a special flag to suggest userspace
> does it: DRM_CAP_DUMB_PREFER_SHADOW [1]. A well-behaved
> software-rendering KMS client checks this flag and honours it. If a
> driver both sets the flag, and copies itself, then that's two copies
> for each flip. The driver's copy is unexpected, but is there a good
> reason for the driver to do it?
>=20
> I can only think one reason: hardware scanout pixel format being one
> that userspace cannot reasonably be expected to produce. I think
> nowadays RGB888 (the literally 3 bytes per pixel) format counts as one.

I guess any tiled format would count there too, right?

> If hardware requires RGB888 to e.g. reach a specific resolution, should
> the driver set DRM_CAP_DUMB_PREFER_SHADOW or not? If the driver always
> allocates sysram as dumb buffers because there simply is not enough
> VRAM to give out, then definitely not. That is a very good reason for
> the driver to do a copy/conversion with damage under the hood. It
> sucks, but it's the only way it can work.
>=20
> But if the dumb buffers are allocated in VRAM, then
> DRM_CAP_DUMB_PREFER_SHADOW should likely be set because direct VRAM
> access tends to be slow, and the driver should not copy - unless maybe
> for XRGB8888 and cursors. A CPU copy from VRAM into VRAM is the worst.
>=20
> For RGB888 hardware and software rendering, it would be best if:
>=20
> - Dumb buffers are allocated from VRAM, making them directly
>   scanout-able for RGB888.
>=20
> - DRM_CAP_DUMB_PREFER_SHADOW is set, telling userspace to render into a
>   shadow and then copy into a dumb buffer.
>=20
> - Userspace's copy into a dumb buffer produces RGB888, while the shadow
>   buffer can be of any format userspace likes.
>=20
> This minimises the amount of work done, and page flips are literal
> flips without a hidden copy in the driver.
>=20
> If userspace does not support RGB888, things get hairy. If XRGB8888 is
> faked via a driver copy, then you would not want to be copying from
> VRAM into VRAM. Create-dumb ioctl passes in bpp, so the driver could
> special-case 24 vs. 32 I guess, allocating 24 from VRAM and 32 from
> sysram. But do you set DRM_CAP_DUMB_PREFER_SHADOW? It would always be
> wrong for the other format.
>=20
> Ideally, XRGB8888 would be supported without artificially crippling
> more optimal pixel formats by lack of DRM_CAP_DUMB_PREFER_SHADOW, even
> if XRGB8888 support is fake and hurt by DRM_CAP_DUMB_PREFER_SHADOW. But
> that also depends on the expected userspace, which format does it use.

Jocelyn, I think we should have a link to that mail too in the doc
you've written.

Pekka, it's not clear to me though if what you wrote here are changes
you would like on the original patch, or if it's just general thoughts?

Maxime

--pukytciqvlkbjocg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOOI9QAKCRDj7w1vZxhR
xWQGAQD9ekNxUzoGTZ0UL8ABgPajJcgQatuuI9bjd4D+1kEIpAD/eQ0n6yeQe8ag
U0tJtJUfS3N+bvsR9dnwhBsE6Ux+2Q8=
=buBh
-----END PGP SIGNATURE-----

--pukytciqvlkbjocg--
