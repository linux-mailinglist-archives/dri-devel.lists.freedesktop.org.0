Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A48679A5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30B10E77E;
	Mon, 26 Feb 2024 15:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="MRG7X3k+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B54C10E77E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7z9pneJ1uIyGuYe5P09CdK7pzrm9+X8HDoRJ5QIdmoI=; b=MRG7X3k+u56OfnensllPQ5ZDhB
 1VdDtPcd1hXfVPTBHtVKDNN73aCAkz/qAX2oHfsiebKselk8lq0bcuJNYBdY4EetXKXYn+PPLSjxR
 /pXIxOxX1zrmS2ZhON1GngCmqCRTOHaOooBn/npQ5dew+v+esucszGDn5g1G55hPY94OYP95Z1MQ6
 aJx72OP1Wg8APMYBS59gam0l65ra5GUNPEf/yv247mOTnr02wXnlPIFe9Nb+y04nplogaqQsc0HW/
 gtZhTz28J0XIQntaxo2N39wJEd1M1o8EOLktFOOmOUzkEB6YDYaQgnkDYSgCS0m1G6WiO25MBZT3f
 Mr67atrQ==;
Received: from [194.136.85.206] (port=55574 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1recdz-0006QQ-0s;
 Mon, 26 Feb 2024 17:11:51 +0200
Date: Mon, 26 Feb 2024 17:11:43 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Nick Hollinghurst
 <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240226171143.27e60c30@eldfell>
In-Reply-To: <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/56568nunqDQgkffMC.bH82U";
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

--Sig_/56568nunqDQgkffMC.bH82U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 15:10:45 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Pekka,
>=20
> On Wed, Feb 21, 2024 at 11:07:51AM +0200, Pekka Paalanen wrote:
> > On Fri, 16 Feb 2024 18:48:55 +0000
> > Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> >  =20
> > > From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > >=20
> > > Add this as a value for enum_drm_connector_tv_mode, represented
> > > by the string "Mono", to generate video with no colour encoding
> > > or bursts. Define it to have no pedestal (since only NTSC-M calls
> > > for a pedestal).
> > >=20
> > > Change default mode creation to acommodate the new tv_mode value
> > > which comprises both 525-line and 625-line formats.
> > >=20
> > > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com> =20
> >
> > since no-one else commented yet, I'd like to remind of the new UAPI
> > requirements:
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-user=
space-requirements
> >=20
> > AFAIU, adding a new value to an existing enum still counts as new UAPI.
> >=20
> > Maybe there is no need for the full treatment here, or maybe there is,
> > I'm not sure. I think you should make some statement about how the new
> > UAPI requirements have been addressed. =20
>=20
> That property was meant to provide legacy display handling, so I don't
> expect any reasonably recent codebase like Weston to suppport it, ever
> :)
>=20
> That being said, from the beginning, that property was meant to be
> handled as a "mode-setting" property, and thus handled by either the
> kernel command-line, xrandr, or any similar mechanism.
>=20
> I would expect that new enum variant to be handled under the same terms:
> it'll probably only show up in distro scripts or configuration files,
> and never in any actual code base.
>=20
> Is it what you were expecting, or did you mean something else?

Maybe? Let's have it in the commit message and see if DRM maintainers
agree.

You should expect that all KMS clients will work towards programming
all exposed KMS properties into known values. That's the only way to
achieve repeatable KMS behaviour, because there is no KMS reset ioctl.

There are no two tiers of KMS properties AFAIK. You have to be the DRM
master to change anything. So, people cannot force any settings from
outside of a KMS client, they have to go through the KMS client, like
xrandr goes through Xorg (and only Xorg).

I do fully expect Weston to gain support for this property, if anyone
cares of its value. That goes for all Wayland compositors.

You're correct in that a KMS client would probably not know to control
the value of this property automatically but it needs to come from
configuration. That would be each KMS client's configuration. I don't
understand how a script could achieve that.

However, if you feel it is important to have KMS properties that
display servers must not touch, then they should be documented as such.
I do not know if that would actually lift the new-UAPI requirements,
that is for the DRM maintainers to decide and document. Is there such a
thing already?

What are those "similar to xrandr" mechanisms? I don't think I've heard
of any, and I've also completely missed any kernel command line
arguments manipulating KMS properties.


Thanks,
pq

--Sig_/56568nunqDQgkffMC.bH82U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXcqi8ACgkQI1/ltBGq
qqdDnhAAmlaD5dO3fNWU90FyYQV+rO/KA7nZHx1Gd8yE0QjqZw/sdPYYuqUBFMix
kvv+HGAuGJ8iCZgL7G7APtP+t96OPmc+8Std8FBeli2e68fXG0CKO6TLl0hKhXTu
+vckK5JzIMHY/cd3iim1o89gMyctkTKYczFGOoe/TCRwGmQ8Rmp/tFYUOiczwo0W
IfdS3+zVW957ZrOD6n0hAq5v3DFk8vMYFs8tmPOse5kpVZgC+8Cr4UMmtFM6zGK/
kiBdRcP9IWjap3RrZAhCbQ+GQWh8nUtfy7590WrP2MPC67bcK4fKAJH2pWRxss2e
zg4T04Xu81ZUhaufcydpZuZv6yKjmTP8C5IJ68DDJF65nPSCFoE+t+JZt6NrLp2q
6FdMHVk+E3xTo3S2PZESlBDJZky/DXaAHpVWhZWdjXA/XGgvhMw1WyUSeUrf1KBb
zvfOowbpTy4fqKHNLtOZzZxxJWwJtGR3c53UNhe03zvg4SBxjyHvJPGrDHG+psXw
xOWbLj3QuaKF+98OMRW0PDwLBcRXL0Og5bCwoNGAQlDpKhd/6HK5C/XZ0w0tYkUv
31r9DR+sgJMthd2nz5UvBF6XySnVbfYdRMZ805GgsqOJ7ON5RoiFqxBAv6+oH9U6
be0pYKTfW7/+/tPrgTjE1WHbF0x7eqpPf2G7S1cxYpJza3YCoqs=
=F2Xs
-----END PGP SIGNATURE-----

--Sig_/56568nunqDQgkffMC.bH82U--
