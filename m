Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB83763805
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 15:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D5310E14B;
	Wed, 26 Jul 2023 13:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A2A10E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 13:49:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3901A61A44;
 Wed, 26 Jul 2023 13:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB21C433C8;
 Wed, 26 Jul 2023 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690379351;
 bh=hzmf8Bij70gVAgodLgWCiWCM75dWhG4k7zTGf0R3g9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PSkx1fSGpfnBDl0HMa53d5n7KoFrCDxvrEBbCPxSj8j6gN6L1sPs0hCx+z23Fnvdu
 J9r6C8xITdnMOcMda8V0kaEpbaR7INOBhQAnJ/wng5F/4Fa6FJGdo3kudzXS4Y2NtJ
 9biFtwHqDp35QzxlESq6ZrftU0ewwxbxHyFrZpwEs7CH8/acdhSLPZEViaKwQI5vEH
 uv+SGjReSmrqCzIw75FW6uWJMzB+RKecLDL0CJaeRbUtidvxTsB1dpRNgITaq+Y8LA
 RU6jAp/ZTCKjcRX7qjFHZmr5Un1k+ZhNKl0Hnnm4KMYo1NdAIJkFaR2RG4WxgJL40i
 aTOffreeEd6wQ==
Date: Wed, 26 Jul 2023 15:49:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
Message-ID: <ciwm45vwqlzwfywzn55uitsbq4undb7xoau2rbaverra3gyfb3@khr2wdz67d74>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vpnwefjeratdjsnb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vpnwefjeratdjsnb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 26, 2023 at 01:52:37PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 26, 2023 at 12:00=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
> > > > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > > > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > > > @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_varia=
nts[] =3D {
> > > >  };
> > > >  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
> > > >
> > > > +struct ssd130x_plane_state {
> > > > +       struct drm_plane_state base;
> > > > +       /* Intermediate buffer to convert pixels from XRGB8888 to R=
1 */
> > > > +       u8 *buffer;
> > > > +       /* Buffer that contains R1 pixels to be written to the pane=
l */
> > > > +       u8 *data_array;
> > >
> > > The second buffer actually contains pixels in hardware format.
> > > For now that is a transposed buffer of R1 pixels, but that will change
> > > when you will add support for greyscale displays.
> > >
> > > So I'd write "hardware format" instead of R1 for both.
> > >
> > > BTW, I still think data_array should be allocated during probing,
> > > as it is related to the hardware, not to a plane.
> >
> > I somewhat disagree.
> >
> > If I understood right during our discussion with Javier, the buffer size
> > derives from the mode size (height and width).
> >
> > In KMS, the mode is tied to the KMS state, and thus you can expect the
> > mode to change every state commit. So the more logical thing to do is to
> > tie the buffer size (and thus the buffer pointer) to the state since
> > it's only valid for that particular state for all we know.
> >
> > Of course, our case is allows use to simplify things since it's a fixed
> > mode, but one of Javier's goal with this driver was to provide a good
> > example we can refer people to, so I think it's worth keeping.
>=20
> The second buffer (containing the hardware format) has a size that
> depends on the full screen size, not the current mode (I believe that's
> also the size of the frame buffer backing the plane?).  So its size is
> fixed.

In KMS in general, no. For that particular case, yes.

And about the framebuffer size =3D=3D full screen size, there's multiple
sizes involved. I guess what you call full screen size is the CRTC size.

You can't make the assumption in KMS that CRTC size =3D=3D (primary) plane
size =3D=3D framebuffer size.

If you're using scaling for example, you will have a framebuffer size
smaller or larger than it plane size. If you're using cropping, then the
plane size or framebuffer size will be different from the CRTC size.
Some ways to work around overscan is also to have a smaller plane size
than the CRTC size.

You don't have to have the CRTC size =3D=3D primary plane size, and then you
don't have to have plane size =3D=3D framebuffer size.

you can't really make that assumption in the general case either:
scaling or cropping will have a different framebuffer size than the CRTC
primary plane size (which doesn't have to be "full screen" either).

> Given the allocations are now done based on plane state, I think the
> first buffer should be sized according to the frame buffer backing
> the plane? Currently it uses the full screen size, too (cfr. below).

Yeah, probably.

> > > > @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_d=
evice *ssd130x)
> > > >
> > > >         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
> > > >
> > > > -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KER=
NEL);
> > > > -       if (!ssd130x->buffer)
> > > > +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, G=
FP_KERNEL);
>=20
> Based on full screen width and height.
>=20
> > > > +       if (!ssd130x_state->buffer)
> > > >                 return -ENOMEM;
> > > >
> > > > -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_=
KERNEL);
> > > > -       if (!ssd130x->data_array) {
> > > > -               kfree(ssd130x->buffer);
> > > > +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages=
, GFP_KERNEL);
>=20
> Based on full screen width and height (hardware page size).
>=20
> > > > +       if (!ssd130x_state->data_array) {
> > > > +               kfree(ssd130x_state->buffer);
> > >
> > > Should ssd130x_state->buffer be reset to NULL here?
> > > I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
> > > leading to a double free?
> >
> > That's a good question.
> >
> > I never really thought of that, but yeah, AFAIK atomic_destroy_state()
> > will be called when atomic_check() fails.
> >
> > Which means that it's probably broken in a lot of drivers.
> >
> > Also, Javier pointed me to a discussion you had on IRC about using devm
> > allocation here. We can't really do that. KMS devices are only freed
> > once the last userspace application closes its fd to the device file, so
> > you have an unbounded window during which the driver is still callable
> > by userspace (and thus can still trigger an atomic commit) but the
> > buffer would have been freed for a while.
>=20
> It should still be safe for (at least) the data_array buffer. That
> buffer is only used to store pixels in hardware format, and immediately
> send them to the hardware.  If this can be called that late, it will
> fail horribly, as you can no longer talk to the hardware at that point
> (as ssd130x is an i2c driver, it might actually work; but a DRM driver
>  that calls devm_platform_ioremap_resource() will crash when writing
>  to its MMIO registers)?!?

Yep, that's exactly why we have drm_dev_enter/drm_dev_exit :)

Not a lot of drivers are using it but all should. vc4 does exactly what
you are describing for example.

Maxime

--vpnwefjeratdjsnb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMEkVQAKCRDj7w1vZxhR
xWVDAP4y5VTZuIqxW5+rqkdxd3DgI0a0i7hK9BvwYwzjZT1l3AD/Ugz8n89RVZbk
AwKQaGtmr5CKK0Lw5mWPGc+d3luMyAY=
=TwRG
-----END PGP SIGNATURE-----

--vpnwefjeratdjsnb--
