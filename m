Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC3852BB4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609C10E0B7;
	Tue, 13 Feb 2024 08:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="UpDzlKQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD8610E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uePU3PnyL6D/BxhRRJc2bye5hUMApdcy6S92UbVmQp8=; b=UpDzlKQKQp7hg+Pz4wGHAkD3o3
 rz5EAM7TeKC/eBj5jgQbrBYitsWO4OPcU4gmdqFd0Q+fvv+Gso4vGkMYQ5OJLdSmBcins2KjCL4Gs
 m05UA5RuH9kJLMlr/KOmOVzin6anLyNoK5N54I/lgUt/eu7XvoJgJhz13N+6AW/zDzZyWiDfgKy5S
 bHJy7pDRtMhWD3Nr5GshGY8gvNwsstYizWEr1gSlSFpxnVdfSSceH6dwQH19MA/2ln1UklvwqswOK
 3xvmdzRGx3d4W8HHq/gS+vWeopbq7ZZvDZtSv6wog95GeiD4leLo0o0UQ1HNREBKl4jwqpHdvYaGG
 88RR5hGA==;
Received: from [194.136.85.206] (port=45322 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZoYt-0005xO-1P;
 Tue, 13 Feb 2024 10:54:43 +0200
Date: Tue, 13 Feb 2024 10:54:32 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, contact@emersion.fr
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <20240213105432.50def8ab@eldfell>
In-Reply-To: <20240212165036.GA1370407@toolbox>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
 <20240212111015.2d22f0fa@eldfell>
 <20240212165036.GA1370407@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QzJnrEo=LYkLizQ2av2ETOb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/QzJnrEo=LYkLizQ2av2ETOb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Feb 2024 17:50:36 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Mon, Feb 12, 2024 at 11:10:15AM +0200, Pekka Paalanen wrote:
> > On Fri,  9 Feb 2024 17:53:07 +0100
> > Xaver Hugl <xaver.hugl@kde.org> wrote:
> >  =20
> > > Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index b0516505f7ae..01e13984629b 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_pro=
perty);
> > >   *     one supported. Sink supported colorspaces should be retrieved=
 by
> > >   *     userspace from EDID and driver will not explicitly expose the=
m.
> > >   *
> > > + *     As userspace can't currently know whether or not the output i=
s using
> > > + *     RGB or YCC signalling, the driver must translate properties t=
o their
> > > + *     relevant RGB or YCC counterparts, depending on the actually u=
sed
> > > + *     signalling. Property values that are only valid for either YC=
C or RGB
> > > + *     and have no equivalent for the other signalling type must not=
 be
> > > + *     exposed as supported, unless the driver can guarantee it neve=
r uses
> > > + *     the signalling that doesn't match the property.
> > > + *
> > >   *     Basically the expectation from userspace is:
> > >   *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > >   *        colorspace =20
> >=20
> > While this addition is good, I have another question:
> >=20
> > Does "Colorspace" property choose also the RGB->YCbCr matrix that the
> > driver will use when it happens to use YCbCr signalling?
> >=20
> > So far we have only been talking about the primaries and white point. =
=20
>=20
> Uh, yeah, good point. The InfoFrames do affect both the YCbCr conversion
> and the transfer characteristics that the sink expects. Drivers should
> do the RGB to YCbCr conversion with the new matrix. I think (and very
> much hope) that drivers don't rely on the TF for any internal processing
> but if they did, they also should use the one the sink expects.

Oh, is transfer function also somehow associated here? That would be a
third thing. Are there any "Colorspace" values that target a display
with not gamma 2.2 TF (possibly extended/mirrored)?

The only TF metadata control I've known so far is the one in
HDR_OUTPUT_METADATA.


Thanks,
pq

--Sig_/QzJnrEo=LYkLizQ2av2ETOb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXLLkgACgkQI1/ltBGq
qqctyg/8CrRcsVBkoe82db8WdjRvUtrbrS5PVVS0fsyKhrZJzOIcmSPxgfeHBHE+
oCMOWEcT6++eXYAQHyyC7IoVm9AIf+al1BXljXwLTIPEVULVhwtcxwDhC3SgM22W
KyukT+SP+uYft4PPHn1UBlqeKjbbXpRqnwP1Bvsnw81FLNZHifP9fAiETJ4pMM3K
cpJaytuHIZmn3+u40hXyu1R3KlOhJWbhclk3J/N/3kyJPq2ofGF/u7mgOg0ECyRY
2v8yUodVMgtIxBoUqcluAykijPpIqX1MPc41EsaQWwYyeP8qelw+CdpY0W6841m3
9+8A93PRSvwDbeesvGPRWIpVxd/yiwlD67qfUga+4yMlV0ugqFwYHbuf2qZuris9
Ko7Vyr5Dm+O+IPknshmanCmVaYRfOLOh8Gyn6CgLWBeU+hOFeU2jXXieyfpctnAL
D8ta2R4nZF4VI7ddslG570NRKGdTVpyq4mZjeSITW7+0rarDAX/S85zVgx8W4FRI
ZxHTL1E3RNqDTJV5/QoF92Yblszrn/MsCaVZkR7i3sOOP2qheWsmIu5BWANiEOMv
tU4bdp9B1ZMFE7sa3I6glfLgvJeh9+WuJWP7ZO8gsbl/Mdo4vgdfveI6EVq3ZVl2
+jRUzJ6f+5CnhqfuZgwFBDACxRqtuhjxEp9J4hStU01b+vSFHC8=
=GNHE
-----END PGP SIGNATURE-----

--Sig_/QzJnrEo=LYkLizQ2av2ETOb--
