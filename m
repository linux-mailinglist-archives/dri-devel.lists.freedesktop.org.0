Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAF845DB7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 17:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D3D10F1EA;
	Thu,  1 Feb 2024 16:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TMOPg8h3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97D910F1EA
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 16:50:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 811D961F9D;
 Thu,  1 Feb 2024 16:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896B7C433C7;
 Thu,  1 Feb 2024 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706806209;
 bh=tOF6dvF9mpcgfY2pG3oXqVYb2x1RXJ2H4D5i85BCkio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TMOPg8h30sL7VC9mMIdrMyHzRyRdT8UU6z6NrwEbuK5YEouKuiljSFCz1wRGX7Yx7
 lzomvGIaR3jn3rk+KkYxben1YOlz3kjwyWpHQgBEjVxrb6vhRE0EUlosw+Qrv93ght
 hBhPyiknjoBmQfFwXvwLinPwYlr3CWM4/hIrmYRcriLgWxqyeppuEAZUH20P5MZbOz
 G1XV2kRQRAtMJ5w4IXlJpXPKK1i9LvFWY+jgRB+LLevoAO6Uy1GYbWVTh4HoqHIOOJ
 SipgFjpQILc1j3yVNyg4yAEnh+NsXMTK5w0A2rNaT7i542TMV0ptN6rRfvJhwaS0p0
 Pu9a6WJPGqblA==
Date: Thu, 1 Feb 2024 17:50:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: [PATCH v5 15/44] drm/connector: hdmi: Compute bpc and
 format automatically
Message-ID: <vydlftxen23kd2odwegxbtpaz73sy2lgpv7nlynfjr3p2xvc2b@7lkdkaw3gp5q>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-15-6538e19d634d@kernel.org>
 <CAPY8ntBQ+qY9441-rMzq_JAoYAaY_r+E-ADv7Wry0tJNTzKpwg@mail.gmail.com>
 <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
 <CAPY8ntAmXyKtebMeM7rLtgRR+QwL1H+UCwSO=bLBQN4TsgwsDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j5ozu7iwnqfrstbx"
Content-Disposition: inline
In-Reply-To: <CAPY8ntAmXyKtebMeM7rLtgRR+QwL1H+UCwSO=bLBQN4TsgwsDg@mail.gmail.com>
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


--j5ozu7iwnqfrstbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 03:33:24PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Thu, 1 Feb 2024 at 12:51, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Thu, Dec 14, 2023 at 03:10:43PM +0000, Dave Stevenson wrote:
> > > > +static bool
> > > > +sink_supports_format_bpc(const struct drm_connector *connector,
> > > > +                        const struct drm_display_info *info,
> > > > +                        const struct drm_display_mode *mode,
> > > > +                        unsigned int format, unsigned int bpc)
> > > > +{
> > > > +       struct drm_device *dev =3D connector->dev;
> > > > +       u8 vic =3D drm_match_cea_mode(mode);
> > > > +
> > > > +       if (vic =3D=3D 1 && bpc !=3D 8) {
> > > > +               drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", =
bpc);
> > > > +               return false;
> > > > +       }
> > > > +
> > > > +       if (!info->is_hdmi &&
> > > > +           (format !=3D HDMI_COLORSPACE_RGB || bpc !=3D 8)) {
> > > > +               drm_dbg(dev, "DVI Monitors require an RGB output at=
 8 bpc\n");
> > > > +               return false;
> > > > +       }
> > > > +
> > > > +       if (!(connector->hdmi.supported_formats & BIT(format))) {
> > > > +               drm_dbg(dev, "%s format unsupported by the connecto=
r.\n",
> > > > +                       drm_hdmi_connector_get_output_format_name(f=
ormat));
> > > > +               return false;
> > > > +       }
> > > > +
> > > > +       switch (format) {
> > > > +       case HDMI_COLORSPACE_RGB:
> > > > +               drm_dbg(dev, "RGB Format, checking the constraints.=
\n");
> > > > +
> > > > +               if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444=
))
> > > > +                       return false;
> > >
> > > We've dropped this check from vc4 in our downstream kernel as it stops
> > > you using the prebaked EDIDs (eg drm.edid_firmware=3Dedid/1024x768.bi=
n),
> > > or any other EDID that is defined as an analog monitor.
> > > The EDID parsing bombs out at [1], so info->color_formats gets left a=
t 0.
> >
> > Right, but it only does so if the display isn't defined as a digital di=
splay...
> >
> > > RGB is mandatory for both DVI and HDMI, so rejecting it seems overly =
fussy.
> >
> > ... which is required for both DVI and HDMI.
> >
> > And sure enough, if we decode that EDID:
> >
> > edid-decode (hex):
> >
> > 00 ff ff ff ff ff ff 00 31 d8 00 00 00 00 00 00
> > 05 16 01 03 6d 23 1a 78 ea 5e c0 a4 59 4a 98 25
> > 20 50 54 00 08 00 61 40 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 64 19 00 40 41 00 26 30 08 90
> > 36 00 63 0a 11 00 00 18 00 00 00 ff 00 4c 69 6e
> > 75 78 20 23 30 0a 20 20 20 20 00 00 00 fd 00 3b
> > 3d 2f 31 07 00 0a 20 20 20 20 20 20 00 00 00 fc
> > 00 4c 69 6e 75 78 20 58 47 41 0a 20 20 20 00 55
> >
> > ----------------
> >
> > Block 0, Base EDID:
> >   EDID Structure Version & Revision: 1.3
> >   Vendor & Product Identification:
> >     Manufacturer: LNX
> >     Model: 0
> >     Made in: week 5 of 2012
> >   Basic Display Parameters & Features:
> >     Analog display
> >     Signal Level Standard: 0.700 : 0.000 : 0.700 V p-p
> >     Blank level equals black level
> >     Sync: Separate Composite Serration
> >     Maximum image size: 35 cm x 26 cm
> >     Gamma: 2.20
> >     DPMS levels: Standby Suspend Off
> >     RGB color display
> >     First detailed timing is the preferred timing
> >   Color Characteristics:
> >     Red  : 0.6416, 0.3486
> >     Green: 0.2919, 0.5957
> >     Blue : 0.1474, 0.1250
> >     White: 0.3125, 0.3281
> >   Established Timings I & II:
> >     DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000=
000 MHz
> >   Standard Timings:
> >     DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000=
000 MHz
> >   Detailed Timing Descriptors:
> >     DTD 1:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000=
 MHz (355 mm x 266 mm)
> >                  Hfront    8 Hsync 144 Hback  168 Hpol N
> >                  Vfront    3 Vsync   6 Vback   29 Vpol N
> >     Display Product Serial Number: 'Linux #0'
> >     Display Range Limits:
> >       Monitor ranges (GTF): 59-61 Hz V, 47-49 kHz H, max dotclock 70 MHz
> >     Display Product Name: 'Linux XGA'
> > Checksum: 0x55
> >
> > ----------------
> >
> > Warnings:
> >
> > Block 0, Base EDID:
> >   Detailed Timing Descriptor #1: DTD is similar but not identical to DM=
T 0x10.
> >
> > EDID conformity: PASS
> >
> > So, if anything, it's the EDID that needs to be updated, not the code t=
here.
>=20
> So are these EDIDs only valid for VGA outputs and another set needs to
> be added for HDMI monitors?
>=20
> Having drm.edid_firmware=3Dedid/1024x768.bin works on an HDMI connector
> prior to this patch, so presumably drm_edid_loader needs to
> automatically switch between the existing (analog) and new (digital)
> EDIDs based on the connector type? Or are you requiring users to
> change the strings they use?

We've discussed that on IRC today. I'm not sure there was a conclusion
other than "well this doesn't seem right". I think we should at least
provide different EDIDs depending on the connector type indeed, but
there was also a few discussions that arose:

  - Is it useful to have embedded EDIDs in the kernel at all, and could
    we just get rid of it?

  - Should we expose those EDIDs to userspace, and what happens to the
    compositor when we do?

  - The current way to generate those EDIDs isn't... optimal? Should we
    get rid of that as well?

Anyway, all of those issues have been here for a while so I don't really
expect this series to fix that.

Maxime

--j5ozu7iwnqfrstbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbvLvgAKCRDj7w1vZxhR
xSCOAP96iK948t4DHQtM0RjNfYbNEnT9IPn1B8+p9FAgrkYKMgD7BNjR2zGVhdBX
JcgARDy3OnatYKDdLcS+h0fMuxIGWgs=
=9IpS
-----END PGP SIGNATURE-----

--j5ozu7iwnqfrstbx--
