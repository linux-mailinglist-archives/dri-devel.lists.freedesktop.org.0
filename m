Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2CA7BD539
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9FD10E21A;
	Mon,  9 Oct 2023 08:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E1A10E21A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:28:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9873BB80D25;
 Mon,  9 Oct 2023 08:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E79EC433C7;
 Mon,  9 Oct 2023 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696840112;
 bh=lHsdtt6Aq7prmZlfQ78g0YT+/nI/sHQdchevu4R/uYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKgNd8jPGPG5i+9SMoQ+/HGRRxoEhJN06AF2i+lJkv1UiPND00hDDqsgZg7GEYS51
 SaOXsFUhUrrJxtqdL3XTP5hMfSXTU9HQYapaEEHawmnI+rNtKodp4Efc6IRLlwsRJq
 E7HlFyPPgP8uifQ4x8LJWoIP6odxinI/hLe1AEIldhbKq5D7acFmCWykC2D9htu4AV
 4nBwweueFLen2dYS6Y8FUA78VZMXHuLYecblLq/ggvIwQ2a8kQP0Uq78hz9L1rLXfc
 /6rt8JBCDQLJvwZkpWF4MWCFUnIwvU1FXt/Sue0di2mqYwOm/ZEEi4GCJdpoXqVeli
 PslDdTGDXjtkA==
Date: Mon, 9 Oct 2023 10:28:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lshcnrrkrfcdg2eq"
Content-Disposition: inline
In-Reply-To: <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
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


--lshcnrrkrfcdg2eq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 09, 2023 at 09:47:49AM +0200, Jocelyn Falempe wrote:
> On 06/10/2023 18:54, Noralf Tr=F8nnes wrote:
> >=20
> >=20
> > On 10/6/23 16:35, Maxime Ripard wrote:
> > > Hi Jocelyn,
> > >=20
> > > On Thu, Oct 05, 2023 at 11:16:15AM +0200, Jocelyn Falempe wrote:
> > > > On 05/10/2023 10:18, Maxime Ripard wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
> > > > > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > > > > index 89e2706cac56..e538c87116d3 100644
> > > > > > --- a/include/drm/drm_drv.h
> > > > > > +++ b/include/drm/drm_drv.h
> > > > > > @@ -43,6 +43,7 @@ struct dma_buf_attachment;
> > > > > >    struct drm_display_mode;
> > > > > >    struct drm_mode_create_dumb;
> > > > > >    struct drm_printer;
> > > > > > +struct drm_scanout_buffer;
> > > > > >    struct sg_table;
> > > > > >    /**
> > > > > > @@ -408,6 +409,19 @@ struct drm_driver {
> > > > > >    	 */
> > > > > >    	void (*show_fdinfo)(struct drm_printer *p, struct drm_file =
*f);
> > > > > > +	/**
> > > > > > +	 * @get_scanout_buffer:
> > > > > > +	 *
> > > > > > +	 * Get the current scanout buffer, to display a panic message=
 with drm_panic.
> > > > > > +	 * It is called from a panic callback, and must follow its re=
strictions.
> > > > > > +	 *
> > > > > > +	 * Returns:
> > > > > > +	 *
> > > > > > +	 * Zero on success, negative errno on failure.
> > > > > > +	 */
> > > > > > +	int (*get_scanout_buffer)(struct drm_device *dev,
> > > > > > +				  struct drm_scanout_buffer *sb);
> > > > > > +
> > > > >=20
> > > > > What is the format of that buffer? What is supposed to happen if =
the
> > > > > planes / CRTC are setup in a way that is incompatible with the bu=
ffer
> > > > > format?
> > > >=20
> > > > Currently, it only supports linear format, either in system memory,=
 or
> > > > iomem.
> > > > But really what is needed is the screen size, and a way to write pi=
xels to
> > > > it.
> > > > For more complex GPU, I don't know if it's easier to reprogram the =
GPU to
> > > > linear format, or to add a simple "tiled" support to drm_panic.
> > > > What would you propose as a panic interface to handle those complex=
 format ?
> > >=20
> > > It's not just about tiling, but also about YUV formats. If the display
> > > engine is currently playing a video at the moment, it's probably going
> > > to output some variation of multi-planar YUV and you won't have an RGB
> > > buffer available.
> > >=20
> >=20
> > I had support for some YUV formats in my 2019 attempt on a panic
> > handler[1] and I made a recording of a test run as well[2] (see 4:30 for
> > YUV). There was a discussion about challenges and i915 can disable
> > tiling by flipping a bit in a register[3] and AMD has a debug
> > interface[4] they can use to write pixels.
>=20
> I only added support for the format used by simpledrm, because I don't wa=
nt
> to add support for all possible format if no driver are using it.

Sure.

> It should be possible to add YUV format too.
>
> I also prefer to convert only the foreground/background color, and then
> write directly into the buffers, instead of converting line by line.
> It works for all format where pixel size is a multiple of byte.

My point was that there might not be a buffer to write to.
DMA_ATTR_NO_KERNEL_MAPPING exists, dma-buf might be unaccessible, unsafe
or be completely out of control of the kernel space, or even not be
accessible by the system at all (when doing secure playback for example,
where the "trusted" component will do the decoding and will only give
back a dma-buf handle to a secure memory buffer).

I appreciate that we probably don't want to address these scenarios
right now, but we should have a path forward to support them eventually.
Copying the panic handler content to the buffer is optimistic and won't
work in all the scenarios described above, pretty much requiring to
start from scratch that effort.

> > https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes=
=2Eorg/
> > [2] https://youtu.be/lZ80vL4dgpE
> > [3]
> > https://lore.kernel.org/dri-devel/20190314095004.GP2665@phenom.ffwll.lo=
cal/
> > [4]
> > https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@=
amd.com/
> >=20
> > > Same story if you're using a dma-buf buffer. You might not even be ab=
le
> > > to access that buffer at all from the CPU or the kernel.
> > >=20
> > > I really think we should have some emergency state ready to commit on
> > > the side, and possibly a panic_commit function to prevent things like
> > > sleeping or waiting that regular atomic_commit can use.
> > >=20
> > > That way, you know have all the resources available to you any time.
>=20
> I think reusing the atomic commit functions might be hard, because there =
are
> locks/allocation/threads hidden in drivers callback.

Allocations are bugs as far as I'm concerned. Allocations in
atomic_commit path are pretty big hint that you're doing something wrong
so I wouldn't worry too much about them. For locking, yeah... Which is
why I was suggesting an emergency atomic_commit of some sorts (for
planes only?). Switching back to whatever we were doing to an RGB plane
should be simple enough for most drivers and probably can be done safely
enough on most drivers without any locks.

And you don't need to support all kinds of tiling, YUV or RGB variants.

> I'm more in favor of an emergency function, that each driver has to
> implement, and use what the hardware can do to display a simple frame
> quickly. get_scanout_buffer() is a good start for simple driver, but
> will need refactoring for the more complex case, like adding a
> callback to write pixels one by one, if there is no memory mapped
> buffer available.

Sorry, I'm not quite sure what you mean there, where would you write the
pixel to?

Maxime

--lshcnrrkrfcdg2eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSO5pQAKCRDj7w1vZxhR
xQwDAP9U3czBwfofv7m8/JKo+tQkVdNOrh86Pqdfb308zl0w/QEA4oL64X2Nu1UY
p5r9T1xORyXF9+N9mFm+ZU1fKOL1JQ8=
=b800
-----END PGP SIGNATURE-----

--lshcnrrkrfcdg2eq--
