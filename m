Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2F98C6F4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 22:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57D210E133;
	Tue,  1 Oct 2024 20:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="BLP5r3bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEA110E133
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 20:47:30 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id EE7381C00AB; Tue,  1 Oct 2024 22:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1727815647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHF528fpNldDQrxopArlhUx3eucZvMESB10bSjcTH3Y=;
 b=BLP5r3bMpFtZvJ5SWJ2ussSwlVC42GAsk0EA5y1BWadlJs9uvCxQdh51Uf0+nFGxm1n8pB
 QWoc1wF2VfIofxh/6UB0lDgW68d18NI9xHuqp0ZMbrIyGf5T7UmJhM7+YW2j9Q60ZRN1Mn
 rG0fiNWfpZSujGW3cEwWRxY8nojKJ10=
Date: Tue, 1 Oct 2024 22:47:27 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zvxf325Dmy6aabcv@duo.ucw.cz>
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ZvcdNXQJmc8cjifw@amd.ucw.cz>
 <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <140536e2-28bd-429f-a439-04e6a7ae3e58@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="jpGYNOKCYXHzf8bq"
Content-Disposition: inline
In-Reply-To: <140536e2-28bd-429f-a439-04e6a7ae3e58@tuxedocomputers.com>
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


--jpGYNOKCYXHzf8bq
Content-Type: multipart/mixed; boundary="yvVlx55uPS6aOSGu"
Content-Disposition: inline


--yvVlx55uPS6aOSGu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > LampArray HID device and translates the input from hidraw to the
> > > > corresponding WMI calls. This is a new approach as the leds
> > > > subsystem lacks
> > > > a suitable UAPI for per-key keyboard backlights, and like this
> > > > no new UAPI
> > > > needs to be established.
> > > Please don't.
> > >=20
> > > a) I don't believe emulating crazy HID interface si right thing to
> > > do. (Ton of magic constants. IIRC it stores key positions with
> > > micrometer accuracy or something that crazy. How is userland going to
> > > use this? Will we update micrometers for every single machine?)
> > >=20
> > > Even if it is,
> > >=20
> > > b) The emulation should go to generic layer, it is not specific to
> > > your hardware.
> > >=20
> > Maybe introducing a misc-device which provides an ioctl-based API simil=
ar
> > to the HID LampArray would be a solution?
> >=20
> > Basically we would need:
> > - ioctl for querying the supported LEDs and their properties
> > - ioctl for enabling/disabling autonomous mode
> > - ioctl for updating a range of LEDs
> > - ioctl for updating multiple LEDs at once
> >=20
> > If we implement this as a separate subsystem ("illumination subsystem"),
> > then different
> > drivers could use this. This would also allow us to add additional ioctl
> > calls later
> > for more features.
>=20
> We went over this in the past discussion, the conclusion was iirc that we
> are just wraping hidraw ioctls in other ioctls with no added benefit.

I don't believe that conclusion was widely accepted.

Benefit of doing reasonable interface is ... that kernel would have
reasonable interface. We would get rid of binary tables in the driver,
and long term, we could get something more reasonable than OpenRGB.

> For reference
> https://lore.kernel.org/all/20231011190017.1230898-1-wse@tuxedocomputers.=
com/
>=20
> I don't know the exact message anymore, but if relevant I can dig for it
> (it's a over 5 month long e-mail thread).
>=20
> And we would need to write code to apply this wrapper to devices
> implementing LampArray in firmware.

Yes, that would be long term plan.

I bought gaming keyboard to play with rgb leds. I don't really want to
do crazy arrays in the driver as you did below. And I'd really like to
have 100-line application in userland, talking to kernel, not full
OpenRGB which is huge and depends on QT IIRC.

(Work-in-progress version is attached. Note it is smaller than tables
for the fake-HID implementation).

Best regards,
								Pavel


> > > > +
> > > > +static const uint8_t sirius_16_ansii_kbl_mapping[] =3D {
> > > > +=A0=A0=A0 0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x=
42,
> > > > +=A0=A0=A0 0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,=A0=A0 0x4a, 0x4d, 0x=
4b, 0x4e,
> > > > +=A0=A0=A0 0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x=
26,
> > > > +=A0=A0=A0 0x27, 0x2d, 0x2e, 0x2a,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x53, 0x55, 0x54, 0x56,
> > > > +=A0=A0=A0 0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x=
12,
> > > > +=A0=A0=A0 0x13, 0x2f, 0x30, 0x31,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x5f, 0x60, 0x61,
> > > > +=A0=A0=A0 0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x=
0f,
> > > > +=A0=A0=A0 0x33, 0x34, 0x28,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x5c, 0x5d, 0x5e, 0x57,
> > > > +=A0=A0=A0 0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x=
37,
> > > > +=A0=A0=A0 0x38, 0xe5, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x59, 0x5a, 0x5b,
> > > > +=A0=A0=A0 0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x=
51,
> > > > +=A0=A0=A0 0x4f,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x62, 0x63, 0x58
> > > > +};
> > > > +
> > > > +static const uint32_t sirius_16_ansii_kbl_mapping_pos_x[] =3D {
> > > > +=A0=A0=A0=A0 25000,=A0 41700,=A0 58400,=A0 75100,=A0 91800, 108500=
, 125200,
> > > > 141900, 158600, 175300,
> > > > +=A0=A0=A0 192000, 208700, 225400, 242100, 258800, 275500,=A0=A0 29=
4500,
> > > > 311200, 327900, 344600,
> > > > +=A0=A0=A0=A0 24500,=A0 42500,=A0 61000,=A0 79500,=A0 98000, 116500=
, 135000,
> > > > 153500, 172000, 190500,
> > > > +=A0=A0=A0 209000, 227500, 246000, 269500,=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900, 344600,
> > > > +=A0=A0=A0=A0 31000,=A0 51500,=A0 70000,=A0 88500, 107000, 125500, =
144000,
> > > > 162500, 181000, 199500,
> > > > +=A0=A0=A0 218000, 236500, 255000, 273500,=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900,
> > > > +=A0=A0=A0=A0 33000,=A0 57000,=A0 75500,=A0 94000, 112500, 131000, =
149500,
> > > > 168000, 186500, 205000,
> > > > +=A0=A0=A0 223500, 242000, 267500,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900, 344600,
> > > > +=A0=A0=A0=A0 37000,=A0 66000,=A0 84500, 103000, 121500, 140000, 15=
8500,
> > > > 177000, 195500, 214000,
> > > > +=A0=A0=A0 232500, 251500, 273500,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900,
> > > > +=A0=A0=A0=A0 28000,=A0 47500,=A0 66000,=A0 84500, 140000, 195500, =
214000,
> > > > 234000, 255000, 273500,
> > > > +=A0=A0=A0 292000,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 311200,
> > > > 327900, 344600
> > > > +};
> > > > +
> > > > +static const uint32_t sirius_16_ansii_kbl_mapping_pos_y[] =3D {
> > > > +=A0=A0=A0=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 530=
00,=A0 53000,
> > > > 53000,=A0 53000,=A0 53000,
> > > > +=A0=A0=A0=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 530=
00, 53000,=A0
> > > > 53000,=A0 53000,=A0 53000,
> > > > +=A0=A0=A0=A0 67500,=A0 67500,=A0 67500,=A0 67500,=A0 67500,=A0 675=
00,=A0 67500,
> > > > 67500,=A0 67500,=A0 67500,
> > > > +=A0=A0=A0=A0 67500,=A0 67500,=A0 67500,=A0 67500, 67500,=A0 67500,=
=A0 67500,=A0 67500,
> > > > +=A0=A0=A0=A0 85500,=A0 85500,=A0 85500,=A0 85500,=A0 85500,=A0 855=
00,=A0 85500,
> > > > 85500,=A0 85500,=A0 85500,
> > > > +=A0=A0=A0=A0 85500,=A0 85500,=A0 85500,=A0 85500, 85500,=A0 85500,=
=A0 85500,
> > > > +=A0=A0=A0 103500, 103500, 103500, 103500, 103500, 103500, 103500,
> > > > 103500, 103500, 103500,
> > > > +=A0=A0=A0 103500, 103500, 103500,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 103500,
> > > > 103500, 103500,=A0 94500,
> > > > +=A0=A0=A0 121500, 121500, 121500, 121500, 121500, 121500, 121500,
> > > > 121500, 121500, 121500,
> > > > +=A0=A0=A0 121500, 121500, 129000,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 121500,
> > > > 121500, 121500,
> > > > +=A0=A0=A0 139500, 139500, 139500, 139500, 139500, 139500, 139500,
> > > > 139500, 147000, 147000,
> > > > +=A0=A0=A0 147000,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 139500,
> > > > 139500, 130500
> > > > +};
> > > > +
> > > > +static const uint32_t sirius_16_ansii_kbl_mapping_pos_z[] =3D {
> > > > +=A0=A0=A0=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 50=
00,=A0=A0 5000,=A0=A0 5000,
> > > > 5000,=A0=A0 5000,=A0=A0 5000,
> > > > +=A0=A0=A0=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 50=
00,=A0=A0 5000, 5000,=A0=A0
> > > > 5000,=A0=A0 5000,=A0=A0 5000,
> > > > +=A0=A0=A0=A0=A0 5250,=A0=A0 5250,=A0=A0 5250,=A0=A0 5250,=A0=A0 52=
50,=A0=A0 5250,=A0=A0 5250,
> > > > 5250,=A0=A0 5250,=A0=A0 5250,
> > > > +=A0=A0=A0=A0=A0 5250,=A0=A0 5250,=A0=A0 5250,=A0=A0 5250, 5250,=A0=
=A0 5250,=A0=A0 5250,=A0=A0 5250,
> > > > +=A0=A0=A0=A0=A0 5500,=A0=A0 5500,=A0=A0 5500,=A0=A0 5500,=A0=A0 55=
00,=A0=A0 5500,=A0=A0 5500,
> > > > 5500,=A0=A0 5500,=A0=A0 5500,
> > > > +=A0=A0=A0=A0=A0 5500,=A0=A0 5500,=A0=A0 5500,=A0=A0 5500, 5500,=A0=
=A0 5500,=A0=A0 5500,
> > > > +=A0=A0=A0=A0=A0 5750,=A0=A0 5750,=A0=A0 5750,=A0=A0 5750,=A0=A0 57=
50,=A0=A0 5750,=A0=A0 5750,
> > > > 5750,=A0=A0 5750,=A0=A0 5750,
> > > > +=A0=A0=A0=A0=A0 5750,=A0=A0 5750,=A0=A0 5750, 5750,=A0=A0 5750,=A0=
=A0 5750,=A0=A0 5625,
> > > > +=A0=A0=A0=A0=A0 6000,=A0=A0 6000,=A0=A0 6000,=A0=A0 6000,=A0=A0 60=
00,=A0=A0 6000,=A0=A0 6000,
> > > > 6000,=A0=A0 6000,=A0=A0 6000,
> > > > +=A0=A0=A0=A0=A0 6000,=A0=A0 6000,=A0=A0 6125, 6000,=A0=A0 6000,=A0=
=A0 6000,
> > > > +=A0=A0=A0=A0=A0 6250,=A0=A0 6250,=A0=A0 6250,=A0=A0 6250,=A0=A0 62=
50,=A0=A0 6250,=A0=A0 6250,
> > > > 6250,=A0=A0 6375,=A0=A0 6375,
> > > > +=A0=A0=A0=A0=A0 6375, 6250,=A0=A0 6250,=A0=A0 6125
> > > > +};
> > > > +
> > > > +static const uint8_t sirius_16_iso_kbl_mapping[] =3D {
> > > > +=A0=A0=A0 0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x=
42,
> > > > +=A0=A0=A0 0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,=A0=A0 0x4a, 0x4d, 0x=
4b, 0x4e,
> > > > +=A0=A0=A0 0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x=
26,
> > > > +=A0=A0=A0 0x27, 0x2d, 0x2e, 0x2a,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x53, 0x55, 0x54, 0x56,
> > > > +=A0=A0=A0 0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x=
12,
> > > > +=A0=A0=A0 0x13, 0x2f, 0x30,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x5f, 0x60, 0x61,
> > > > +=A0=A0=A0 0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x=
0f,
> > > > +=A0=A0=A0 0x33, 0x34, 0x32, 0x28,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x5c, 0x5d, 0x5e, 0x57,
> > > > +=A0=A0=A0 0xe1, 0x64, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x=
36,
> > > > +=A0=A0=A0 0x37, 0x38, 0xe5, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x59, 0x5a, 0x5b,
> > > > +=A0=A0=A0 0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x=
51,
> > > > +=A0=A0=A0 0x4f,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x62, 0x63, 0x58
> > > > +};
> > > > +
> > > > +static const uint32_t sirius_16_iso_kbl_mapping_pos_x[] =3D {
> > > > +=A0=A0=A0=A0 25000,=A0 41700,=A0 58400,=A0 75100,=A0 91800, 108500=
, 125200,
> > > > 141900, 158600, 175300,
> > > > +=A0=A0=A0 192000, 208700, 225400, 242100, 258800, 275500,=A0=A0 29=
4500,
> > > > 311200, 327900, 344600,
> > > > +=A0=A0=A0=A0 24500,=A0 42500,=A0 61000,=A0 79500,=A0 98000, 116500=
, 135000,
> > > > 153500, 172000, 190500,
> > > > +=A0=A0=A0 209000, 227500, 246000, 269500,=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900, 344600,
> > > > +=A0=A0=A0=A0 31000,=A0 51500,=A0 70000,=A0 88500, 107000, 125500, =
144000,
> > > > 162500, 181000, 199500,
> > > > +=A0=A0=A0 218000, 234500, 251000,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900,
> > > > +=A0=A0=A0=A0 33000,=A0 57000,=A0 75500,=A0 94000, 112500, 131000, =
149500,
> > > > 168000, 186500, 205000,
> > > > +=A0=A0=A0 223500, 240000, 256500, 271500,=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900, 344600,
> > > > +=A0=A0=A0=A0 28000,=A0 47500,=A0 66000,=A0 84500, 103000, 121500, =
140000,
> > > > 158500, 177000, 195500,
> > > > +=A0=A0=A0 214000, 232500, 251500, 273500,=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294500,
> > > > 311200, 327900,
> > > > +=A0=A0=A0=A0 28000,=A0 47500,=A0 66000,=A0 84500, 140000, 195500, =
214000,
> > > > 234000, 255000, 273500,
> > > > +=A0=A0=A0 292000,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 311200,
> > > > 327900, 344600
> > > > +};
> > > > +
> > > > +static const uint32_t sirius_16_iso_kbl_mapping_pos_y[] =3D {
> > > > +=A0=A0=A0=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 530=
00,=A0 53000,
> > > > 53000,=A0 53000,=A0 53000,
> > > > +=A0=A0=A0=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 53000,=A0 530=
00, 53000,=A0
> > > > 53000,=A0 53000,=A0 53000,
> > > > +=A0=A0=A0=A0 67500,=A0 67500,=A0 67500,=A0 67500,=A0 67500,=A0 675=
00,=A0 67500,
> > > > 67500,=A0 67500,=A0 67500,
> > > > +=A0=A0=A0=A0 67500,=A0 67500,=A0 67500,=A0 67500, 67500,=A0 67500,=
=A0 67500,=A0 67500,
> > > > +=A0=A0=A0=A0 85500,=A0 85500,=A0 85500,=A0 85500,=A0 85500,=A0 855=
00,=A0 85500,
> > > > 85500,=A0 85500,=A0 85500,
> > > > +=A0=A0=A0=A0 85500,=A0 85500,=A0 85500, 85500,=A0 85500,=A0 85500,
> > > > +=A0=A0=A0 103500, 103500, 103500, 103500, 103500, 103500, 103500,
> > > > 103500, 103500, 103500,
> > > > +=A0=A0=A0 103500, 103500, 103500,=A0 94500,=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 103500,
> > > > 103500, 103500,=A0 94500,
> > > > +=A0=A0=A0 121500, 121500, 121500, 121500, 121500, 121500, 121500,
> > > > 121500, 121500, 121500,
> > > > +=A0=A0=A0 121500, 121500, 121500, 129000,=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 121500,
> > > > 121500, 121500,
> > > > +=A0=A0=A0 139500, 139500, 139500, 139500, 139500, 139500, 139500,
> > > > 139500, 147000, 147000,
> > > > +=A0=A0=A0 147000,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 139500,
> > > > 139500, 130500
> > > > +};
> > > > +
> > > > +static const uint32_t sirius_16_iso_kbl_mapping_pos_z[] =3D {
> > > > +=A0=A0=A0=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 50=
00,=A0=A0 5000,=A0=A0 5000,
> > > > 5000,=A0=A0 5000,=A0=A0 5000,
> > > > +=A0=A0=A0=A0=A0 5000,=A0=A0 5000,=A0=A0 5000,=A0=A0 5000, 5000, 50=
00, 5000,=A0=A0 5000,=A0=A0
> > > > 5000,=A0=A0 5000,
> > > > +=A0=A0=A0=A0=A0 5250,=A0=A0 5250,=A0=A0 5250,=A0=A0 5250,=A0=A0 52=
50,=A0=A0 5250,=A0=A0 5250,
> > > > 5250,=A0=A0 5250,=A0=A0 5250,
> > > > +=A0=A0=A0=A0=A0 5250,=A0=A0 5250,=A0=A0 5250,=A0=A0 5250, 5250,=A0=
=A0 5250,=A0=A0 5250,=A0=A0 5250,
> > > > +=A0=A0=A0=A0=A0 5500,=A0=A0 5500,=A0=A0 5500,=A0=A0 5500,=A0=A0 55=
00,=A0=A0 5500,=A0=A0 5500,
> > > > 5500,=A0=A0 5500,=A0=A0 5500,
> > > > +=A0=A0=A0=A0=A0 5500,=A0=A0 5500,=A0=A0 5500, 5500,=A0=A0 5500,=A0=
=A0 5500,
> > > > +=A0=A0=A0=A0=A0 5750,=A0=A0 5750,=A0=A0 5750,=A0=A0 5750,=A0=A0 57=
50,=A0=A0 5750,=A0=A0 5750,
> > > > 5750,=A0=A0 5750,=A0=A0 5750,
> > > > +=A0=A0=A0=A0=A0 5750,=A0=A0 5750,=A0=A0 5750,=A0=A0 5750, 5750,=A0=
=A0 5750,=A0=A0 5750,=A0=A0 5625,
> > > > +=A0=A0=A0=A0=A0 6000,=A0=A0 6000,=A0=A0 6000,=A0=A0 6000,=A0=A0 60=
00,=A0=A0 6000,=A0=A0 6000,
> > > > 6000,=A0=A0 6000,=A0=A0 6000,
> > > > +=A0=A0=A0=A0=A0 6000,=A0=A0 6000,=A0=A0 6000,=A0=A0 6125, 6000,=A0=
=A0 6000,=A0=A0 6000,
> > > > +=A0=A0=A0=A0=A0 6250,=A0=A0 6250,=A0=A0 6250,=A0=A0 6250,=A0=A0 62=
50,=A0=A0 6250,=A0=A0 6250,
> > > > 6250,=A0=A0 6375,=A0=A0 6375,
> > > > +=A0=A0=A0=A0=A0 6375, 6250,=A0=A0 6250,=A0=A0 6125
> > > > +};
> > > ...
> > > > +
> > > > +static uint8_t report_descriptor[327] =3D {
> > > > +=A0=A0=A0 0x05, 0x59,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 // Usage Pa=
ge (Lighting and Illumination)
> > > > +=A0=A0=A0 0x09, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 // Usage (L=
amp Array)
> > > > +=A0=A0=A0 0xa1, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 // Collecti=
on (Application)
> > > > +=A0=A0=A0 0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //=A0 Report ID (=
1)
> > > > +=A0=A0=A0 0x09, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Usage=
 (Lamp Array Attributes Report)
> > > > +=A0=A0=A0 0xa1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Colle=
ction (Logical)
> > > > +=A0=A0=A0 0x09, 0x03,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Count)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0x00, 0x00,=A0=A0=A0 //=A0=A0 Logical =
Maximum (65535)
> > > > +=A0=A0=A0 0x75, 0x10,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (16)
> > > > +=A0=A0=A0 0x95, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (1)
> > > > +=A0=A0=A0 0xb1, 0x03,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Cnst,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x04,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Bounding Box Width In
> > > > Micrometers)
> > > > +=A0=A0=A0 0x09, 0x05,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Bounding Box Height In
> > > > Micrometers)
> > > > +=A0=A0=A0 0x09, 0x06,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Bounding Box Depth In
> > > > Micrometers)
> > > > +=A0=A0=A0 0x09, 0x07,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Array Kind)
> > > > +=A0=A0=A0 0x09, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Min Update Interval In
> > > > Microseconds)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0xff, 0x7f,=A0=A0=A0 //=A0=A0 Logical =
Maximum (2147483647)
> > > > +=A0=A0=A0 0x75, 0x20,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (32)
> > > > +=A0=A0=A0 0x95, 0x05,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (5)
> > > > +=A0=A0=A0 0xb1, 0x03,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Cnst,Var,Abs)
> > > > +=A0=A0=A0 0xc0,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=
 End Collection
> > > > +=A0=A0=A0 0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //=A0 Report ID=
 (2)
> > > > +=A0=A0=A0 0x09, 0x20,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Usage=
 (Lamp Attributes Request Report)
> > > > +=A0=A0=A0 0xa1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Colle=
ction (Logical)
> > > > +=A0=A0=A0 0x09, 0x21,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Id)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0x00, 0x00,=A0=A0=A0 //=A0=A0 Logical =
Maximum (65535)
> > > > +=A0=A0=A0 0x75, 0x10,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (16)
> > > > +=A0=A0=A0 0x95, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (1)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0xc0,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=
 End Collection
> > > > +=A0=A0=A0 0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //=A0 Report I=
D (3)
> > > > +=A0=A0=A0 0x09, 0x22,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Usage=
 (Lamp Attributes Response Report)
> > > > +=A0=A0=A0 0xa1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Colle=
ction (Logical)
> > > > +=A0=A0=A0 0x09, 0x21,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Id)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0x00, 0x00,=A0=A0=A0 //=A0=A0 Logical =
Maximum (65535)
> > > > +=A0=A0=A0 0x75, 0x10,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (16)
> > > > +=A0=A0=A0 0x95, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (1)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x23,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Position X In Micrometers)
> > > > +=A0=A0=A0 0x09, 0x24,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Position Y In Micrometers)
> > > > +=A0=A0=A0 0x09, 0x25,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Position Z In Micrometers)
> > > > +=A0=A0=A0 0x09, 0x27,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Update Latency In Microseconds)
> > > > +=A0=A0=A0 0x09, 0x26,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Purposes)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0xff, 0x7f,=A0=A0=A0 //=A0=A0 Logical =
Maximum (2147483647)
> > > > +=A0=A0=A0 0x75, 0x20,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (32)
> > > > +=A0=A0=A0 0x95, 0x05,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (5)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x28,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Level Count)
> > > > +=A0=A0=A0 0x09, 0x29,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Level Count)
> > > > +=A0=A0=A0 0x09, 0x2a,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Level Count)
> > > > +=A0=A0=A0 0x09, 0x2b,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Level Count)
> > > > +=A0=A0=A0 0x09, 0x2c,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Is Programmable)
> > > > +=A0=A0=A0 0x09, 0x2d,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Input Binding)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x26, 0xff, 0x00,=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Logical =
Maximum (255)
> > > > +=A0=A0=A0 0x75, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (8)
> > > > +=A0=A0=A0 0x95, 0x06,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (6)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0xc0,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=
 End Collection
> > > > +=A0=A0=A0 0x85, LAMP_MULTI_UPDATE_REPORT_ID, //=A0 Report ID (4)
> > > > +=A0=A0=A0 0x09, 0x50,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Usage=
 (Lamp Multi Update Report)
> > > > +=A0=A0=A0 0xa1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Colle=
ction (Logical)
> > > > +=A0=A0=A0 0x09, 0x03,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Count)
> > > > +=A0=A0=A0 0x09, 0x55,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Update Flags)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x25, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Maximum (8)
> > > > +=A0=A0=A0 0x75, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (8)
> > > > +=A0=A0=A0 0x95, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (2)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x21,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Id)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0x00, 0x00,=A0=A0=A0 //=A0=A0 Logical =
Maximum (65535)
> > > > +=A0=A0=A0 0x75, 0x10,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (16)
> > > > +=A0=A0=A0 0x95, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (8)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x26, 0xff, 0x00,=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Logical =
Maximum (255)
> > > > +=A0=A0=A0 0x75, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (8)
> > > > +=A0=A0=A0 0x95, 0x20,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (32)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0xc0,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=
 End Collection
> > > > +=A0=A0=A0 0x85, LAMP_RANGE_UPDATE_REPORT_ID, //=A0 Report ID (5)
> > > > +=A0=A0=A0 0x09, 0x60,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Usage=
 (Lamp Range Update Report)
> > > > +=A0=A0=A0 0xa1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Colle=
ction (Logical)
> > > > +=A0=A0=A0 0x09, 0x55,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Update Flags)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x25, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Maximum (8)
> > > > +=A0=A0=A0 0x75, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (8)
> > > > +=A0=A0=A0 0x95, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (1)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x61,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Id Start)
> > > > +=A0=A0=A0 0x09, 0x62,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Lamp Id End)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x27, 0xff, 0xff, 0x00, 0x00,=A0=A0=A0 //=A0=A0 Logical =
Maximum (65535)
> > > > +=A0=A0=A0 0x75, 0x10,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (16)
> > > > +=A0=A0=A0 0x95, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (2)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0x09, 0x51,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Red Update Channel)
> > > > +=A0=A0=A0 0x09, 0x52,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Green Update Channel)
> > > > +=A0=A0=A0 0x09, 0x53,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Blue Update Channel)
> > > > +=A0=A0=A0 0x09, 0x54,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Intensity Update Channel)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x26, 0xff, 0x00,=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Logical =
Maximum (255)
> > > > +=A0=A0=A0 0x75, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (8)
> > > > +=A0=A0=A0 0x95, 0x04,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (4)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0xc0,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=
 End Collection
> > > > +=A0=A0=A0 0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //=A0 Report ID (6)
> > > > +=A0=A0=A0 0x09, 0x70,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Usage=
 (Lamp Array Control Report)
> > > > +=A0=A0=A0 0xa1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0 Colle=
ction (Logical)
> > > > +=A0=A0=A0 0x09, 0x71,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Us=
age (Autonomous Mode)
> > > > +=A0=A0=A0 0x15, 0x00,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Minimum (0)
> > > > +=A0=A0=A0 0x25, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Lo=
gical Maximum (1)
> > > > +=A0=A0=A0 0x75, 0x08,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Size (8)
> > > > +=A0=A0=A0 0x95, 0x01,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Re=
port Count (1)
> > > > +=A0=A0=A0 0xb1, 0x02,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=A0 Fe=
ature (Data,Var,Abs)
> > > > +=A0=A0=A0 0xc0,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 //=A0=
 End Collection
> > > > +=A0=A0=A0 0xc0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 // End=
 Collection
> > > > +};
> > > > +

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--yvVlx55uPS6aOSGu
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="kbd_hx.c"
Content-Transfer-Encoding: quoted-printable

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 */

#include <linux/device.h>
#include <linux/input.h>
#include <linux/hid.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/hid-roccat.h>
#include <linux/usb.h>

struct hx_device {};

static unsigned char keys[] =3D {
	0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x=
14,
	0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x20, 0x21, 0x=
22,
	0x23, 0x24, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x=
30,
	0x31, 0x32, 0x33, 0x34, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3E, 0x3F, 0x=
41,
	0x44, 0x45, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x51, 0x54, 0x=
55,
	0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5E, 0x5F, 0x61, 0x64, 0x65, 0x68, 0x69, 0x=
6A,
	0x6B, 0x6C, 0x6E, 0x6F, 0x74, 0x75, 0x78, 0x79, 0x7A, 0x7B, 0x7C, 0x7D, 0x=
7E,
	0x7F, 0x81, 0x84, 0x85, 0x88, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E, 0x8F, 0x=
91,
	0x94, 0x95 };

struct hid_device *one_hdev;

static int set_direct_color(struct hid_device *hdev, int color, int val)
{
	const int s =3D 264;
	unsigned char *buf =3D kmalloc(s, GFP_KERNEL);
	int i, ret;

	/* Zero out buffer */
	memset(buf, 0x00, s);

	/* Set up Direct packet */
	for (i =3D 0; i < sizeof(keys)/sizeof(keys[0]); i++) {
		buf[keys[i]] =3D val;
	}

	buf[0x00] =3D 0x07;
	buf[0x01] =3D 0x16; // HYPERX_ALLOY_ELITE_PACKET_ID_DIRECT
	buf[0x02] =3D color; // HYPERX_ALLOY_ELITE_COLOR_CHANNEL_GREEN
	buf[0x03] =3D 0xA0;

	ret =3D hid_hw_power(hdev, PM_HINT_FULLON);
	if (ret) {
		hid_err(hdev, "Failed to power on HID device\n");
		return ret;
	}

	// ioctl(3, HIDIOCSFEATURE(264), 0xbfce5974) =3D 264
	// -> hidraw_send_report(file, user_arg, len, HID_FEATURE_REPORT);
	//
	printk(KERN_INFO "Set feature report -- direct\n");
	i =3D hid_hw_raw_request(hdev, buf[0], buf, s, HID_FEATURE_REPORT, HID_REQ=
_SET_REPORT);
	printk("raw: %d, einval %d, eagain %d\n", i, -EINVAL, -EAGAIN);
	msleep(100);
	return 0;
}

#define SIZE 128
const int real_size =3D SIZE;

static ssize_t hx_sysfs_read(struct file *fp, struct kobject *kobj,
			       struct bin_attribute * b,
			      char *buf, loff_t off, size_t count)
{
	struct device *dev =3D kobj_to_dev(kobj);
	struct hx_device *hx =3D hid_get_drvdata(dev_get_drvdata(dev));
	struct usb_device *usb_dev =3D interface_to_usbdev(to_usb_interface(dev));
	int retval;

	if (off >=3D real_size)
		return 0;

	if (off !=3D 0 || count !=3D real_size)
		return -EINVAL;
=09
	printk("read\n");
	set_direct_color(one_hdev, 2, 0xff);

	return retval ? retval : real_size;
}

static ssize_t hx_sysfs_write(struct file *fp, struct kobject *kobj,
			       struct bin_attribute * b,
		void const *buf, loff_t off, size_t count)
{
	struct device *dev =3D kobj_to_dev(kobj);
	struct hx_device *hx =3D hid_get_drvdata(dev_get_drvdata(dev));
	struct usb_device *usb_dev =3D interface_to_usbdev(to_usb_interface(dev));
	int retval;

	if (off !=3D 0 || count !=3D real_size)
		return -EINVAL;

	printk("Write\n");

	return retval ? retval : real_size;
}

static struct bin_attribute hx_control_attr =3D { \
  .attr =3D { .name =3D "thingy", .mode =3D 0660 },		\
	.size =3D SIZE, \
	.read =3D hx_sysfs_read, \
};

static int hx_create_sysfs_attributes(struct usb_interface *intf)
{
  return sysfs_create_bin_file(&intf->dev.kobj, &hx_control_attr);
}

static void hx_remove_sysfs_attributes(struct usb_interface *intf)
{
  sysfs_remove_bin_file(&intf->dev.kobj, &hx_control_attr);
}

static int hx_init_hx_device_struct(struct usb_device *usb_dev,
		struct hx_device *hx)
{
	//mutex_init(&hx->hx_lock);
	return 0;
}

static int hx_init_specials(struct hid_device *hdev)
{
	struct usb_interface *intf =3D to_usb_interface(hdev->dev.parent);
	struct usb_device *usb_dev =3D interface_to_usbdev(intf);
	struct hx_device *hx;
	int retval;

	hx =3D kzalloc(sizeof(*hx), GFP_KERNEL);
	if (!hx) {
		hid_err(hdev, "can't alloc device descriptor\n");
		return -ENOMEM;
	}
	hid_set_drvdata(hdev, hx);

	retval =3D hx_create_sysfs_attributes(intf);
	if (retval) {
		hid_err(hdev, "cannot create sysfs files\n");
		goto exit;
	}

	return 0;
exit:
	kfree(hx);
	return retval;
}

static void hx_remove_specials(struct hid_device *hdev)
{
	struct usb_interface *intf =3D to_usb_interface(hdev->dev.parent);
	struct hx_device *hx;

	hx_remove_sysfs_attributes(intf);

	hx =3D hid_get_drvdata(hdev);
	kfree(hx);
}

static int num;

static int hx_probe(struct hid_device *hdev,
		const struct hid_device_id *id)
{
	int retval;

	if (!hid_is_usb(hdev))
		return -EINVAL;

	if (++num !=3D 2)
		return -EINVAL;

	retval =3D hid_parse(hdev);
	if (retval) {
		hid_err(hdev, "parse failed\n");
		goto exit;
	}

	retval =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
	if (retval) {
		hid_err(hdev, "hw start failed\n");
		goto exit;
	}

	printk("Have device.\n");

	if (!hid_is_usb(hdev)) {
		printk("Not an usb?\n");
	}

	{
		struct usb_interface *interface =3D to_usb_interface(hdev->dev.parent);
		struct usb_device *dev =3D interface_to_usbdev(interface);
		struct usb_host_interface *iface_desc;
		struct usb_endpoint_descriptor *endpoint;
		char manufacturer[128];
		char product[128];

		// Retrieve manufacturer string
		retval =3D usb_string(dev, dev->descriptor.iManufacturer, manufacturer, s=
izeof(manufacturer));
		if (retval > 0)
			printk(KERN_INFO "Manufacturer: %s\n", manufacturer);
		else
			printk(KERN_ERR "Failed to get manufacturer string\n");

		// Retrieve product string
		retval =3D usb_string(dev, dev->descriptor.iProduct, product, sizeof(prod=
uct));
		if (retval > 0)
			printk(KERN_INFO "Product: %s\n", product);
		else
			printk(KERN_ERR "Failed to get product string\n");

	}

	retval =3D hx_init_specials(hdev);
	if (retval) {
		hid_err(hdev, "couldn't install mouse\n");
		goto exit_stop;
	}

	// Example call to set_direct_color function
	for (int i=3D0; i<20; i++) {
		set_direct_color(hdev, 0x01, 0); // Example values
		set_direct_color(hdev, 0x02, 0); // Example values
		set_direct_color(hdev, 0x03, 0); // Example values
		set_direct_color(hdev, 0x01, 0xFF); // Example values
		set_direct_color(hdev, 0x02, 0xFF); // Example values
		set_direct_color(hdev, 0x03, 0xFF); // Example values
	}
	one_hdev =3D hdev;
	return 0;

exit_stop:
	hid_hw_stop(hdev);
exit:
	return retval;
}

static void hx_remove(struct hid_device *hdev)
{
	hx_remove_specials(hdev);
	hid_hw_stop(hdev);
}

static const struct hid_device_id hx_devices[] =3D {
	{ HID_USB_DEVICE(0x0951, 0x16be) },
	{ }
};

MODULE_DEVICE_TABLE(hid, hx_devices);

static struct hid_driver hx_driver =3D {
	.name =3D "hx",
	.id_table =3D hx_devices,
	.probe =3D hx_probe,
	.remove =3D hx_remove
};
module_hid_driver(hx_driver);

MODULE_AUTHOR("Pavel Machek");
MODULE_DESCRIPTION("USB HyperX elite backlight driver");
MODULE_LICENSE("GPL v2");

--yvVlx55uPS6aOSGu--

--jpGYNOKCYXHzf8bq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZvxf3wAKCRAw5/Bqldv6
8kliAJ9QgLT4nPcovdZp6MQmF/JTXfM6cACgkmo1srKyVCKBHfOxnvxa30ILud0=
=se0Y
-----END PGP SIGNATURE-----

--jpGYNOKCYXHzf8bq--
