Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7CD85D2C3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FB410E3DC;
	Wed, 21 Feb 2024 08:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LIh2VTLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1A310E30D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:44:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7F21CE1C5D;
 Wed, 21 Feb 2024 08:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCC4C433F1;
 Wed, 21 Feb 2024 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708505088;
 bh=yMV/h/ZYf5X0qZq3aDdJEb2XmOIt25nmk9DgyhJVOQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIh2VTLXi2/B5yqLNWkpYzd6oYBRkMc2hRMR153jls6twumJymAGJDUk0kPsSeaKF
 AwhoWYfTrR5/HA+0QtkHPHoNZay6JO65Oj4SzfRHOFG91TknpzquQR50+L76KMQgPA
 /X8Q2zF7RppHrBciBVwXcfcMFgf7Msq8KzRt0iNU+kVNb1tL8j4na/Lr4/Q53ecl4p
 D/SWsOsqXvQf+NzU+nxQxfpM/7SchohzMgjb42SAryfHtPlA8Jv08sapNEFJDMrc/K
 MBV7FzaLGbBQjrtNYRysz6NYUqSuIv3pgXufm4t+T6xfJ14F//Yqw0HBW22SDsuFEd
 XUt04Yged2eNQ==
Date: Wed, 21 Feb 2024 09:44:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/edid/firmware: Remove built-in EDIDs
Message-ID: <oxrdsckcktshgaava7r5zuhgr522aqx6cblppq7julr7s3zpiz@bnaq4lkeadai>
References: <20240220161017.562241-1-mripard@kernel.org>
 <CAPY8ntDR7yQ5UY4Zy8UGi7DXOO68W2QqZFmfkUZpwUq9pjW=MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wfzt2tkchir7keyj"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDR7yQ5UY4Zy8UGi7DXOO68W2QqZFmfkUZpwUq9pjW=MQ@mail.gmail.com>
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


--wfzt2tkchir7keyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Feb 20, 2024 at 05:39:16PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Tue, 20 Feb 2024 at 16:10, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > The EDID firmware loading mechanism introduced a few built-in EDIDs that
> > could be forced on any connector, bypassing the EDIDs it exposes.
> >
> > While convenient, this limited set of EDIDs doesn't take into account
> > the connector type, and we can end up with an EDID that is completely
> > invalid for a given connector.
> >
> > For example, the edid/800x600.bin file matches the following EDID:
> >
> >   edid-decode (hex):
> >
> >   00 ff ff ff ff ff ff 00 31 d8 00 00 00 00 00 00
> >   05 16 01 03 6d 1b 14 78 ea 5e c0 a4 59 4a 98 25
> >   20 50 54 01 00 00 45 40 01 01 01 01 01 01 01 01
> >   01 01 01 01 01 01 a0 0f 20 00 31 58 1c 20 28 80
> >   14 00 15 d0 10 00 00 1e 00 00 00 ff 00 4c 69 6e
> >   75 78 20 23 30 0a 20 20 20 20 00 00 00 fd 00 3b
> >   3d 24 26 05 00 0a 20 20 20 20 20 20 00 00 00 fc
> >   00 4c 69 6e 75 78 20 53 56 47 41 0a 20 20 00 c2
> >
> >   ----------------
> >
> >   Block 0, Base EDID:
> >     EDID Structure Version & Revision: 1.3
> >     Vendor & Product Identification:
> >       Manufacturer: LNX
> >       Model: 0
> >       Made in: week 5 of 2012
> >     Basic Display Parameters & Features:
> >       Analog display
> >       Signal Level Standard: 0.700 : 0.000 : 0.700 V p-p
> >       Blank level equals black level
> >       Sync: Separate Composite Serration
> >       Maximum image size: 27 cm x 20 cm
> >       Gamma: 2.20
> >       DPMS levels: Standby Suspend Off
> >       RGB color display
> >       First detailed timing is the preferred timing
> >     Color Characteristics:
> >       Red  : 0.6416, 0.3486
> >       Green: 0.2919, 0.5957
> >       Blue : 0.1474, 0.1250
> >       White: 0.3125, 0.3281
> >     Established Timings I & II:
> >       DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.0=
00000 MHz
> >     Standard Timings:
> >       DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.0=
00000 MHz
> >     Detailed Timing Descriptors:
> >       DTD 1:   800x600    60.316541 Hz   4:3     37.879 kHz     40.0000=
00 MHz (277 mm x 208 mm)
> >                    Hfront   40 Hsync 128 Hback   88 Hpol P
> >                    Vfront    1 Vsync   4 Vback   23 Vpol P
> >       Display Product Serial Number: 'Linux #0'
> >       Display Range Limits:
> >         Monitor ranges (GTF): 59-61 Hz V, 36-38 kHz H, max dotclock 50 =
MHz
> >       Display Product Name: 'Linux SVGA'
> >   Checksum: 0xc2
> >
> > So, an analog monitor EDID. However, if the connector was an HDMI
> > monitor for example, it breaks the HDMI specification that requires,
> > among other things, a digital display, the VIC 1 mode and an HDMI Forum
> > Vendor Specific Data Block in an CTA-861 extension.
> >
> > We thus end up with a completely invalid EDID, which thus might confuse
> > HDMI-related code that could parse it.
> >
> > After some discussions on IRC, we identified mainly two ways to fix
> > this:
> >
> >   - We can either create more EDIDs for each connector type to provide
> >     a built-in EDID that matches the resolution passed in the name, and
> >     still be a sensible EDID for that connector type;
> >
> >   - Or we can just prevent the EDID to be exposed to userspace if it's
> >     built-in.
> >
> > Or possibly both.
> >
> > However, the conclusion was that maybe we just don't need the built-in
> > EDIDs at all and we should just get rid of them. So here we are.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_edid_load.c | 160 +++-----------------------------
>=20
> Needs to be removed from the docs too:
>=20
> "The code (see drivers/gpu/drm/drm_edid_load.c) contains built-in data
> sets for commonly used screen resolutions (800x600, 1024x768,
> 1280x1024, 1600x1200, 1680x1050, 1920x1080) as binary blobs,..."
>=20
> https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/e=
did.rst

Oh, right. And the EDID generation "code" too.

> I'm sad to see these go, but c'est la vie. Descriptions of using these
> built in EDIDs abound in various tutorials, so those are all now
> invalid :/

If you want to keep the feature, you can still achieve it without (I
think?) any disruption. With that patch merged, we'll always try to load
the firmware as part of the firmware loading mechanism, and you can
embed firmwares directly in the kernel image using CONFIG_EXTRA_FIRMWARE.

So I think if you provide the EDIDs under a file name of 800x600.bin
say, under $EXTRA_FIRMWARE_DIR/edid/, it will work exactly as it used
to.

Maxime

--wfzt2tkchir7keyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdW3/AAKCRDj7w1vZxhR
xenHAQDFn29Y+WWA02g/hQdA6uhvqQT/68m8w7gNccgdxvxnnQEA4hweCEdCppuk
3wy66S2lpjNjAnQlw0qjYVyxxUbwjgo=
=Bw6K
-----END PGP SIGNATURE-----

--wfzt2tkchir7keyj--
