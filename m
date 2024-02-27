Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E88868CC6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB910E8CE;
	Tue, 27 Feb 2024 09:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="dao7Y9Sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFAD10E8CE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zmsPkx8u5y9ACKXsvl6mZR69ylS6xz1/lmuCMlM+hOU=; b=dao7Y9SlN3DP3124zo9KmYIOad
 LnVlXJh/r/OKOhvX9Wn7VUKd6L6IMOApHD1UJTBdrII1+PRxIA8bb7DIPOT21CE2qwEz5tZMufJMP
 rDmWV842pLbtGbB2sXA4VM+mu0/1Oi1t8qtg9r8C0ihQwQuQONAIgcjoXJBuJ/JjAscx91hpOOa6m
 QCScgHC28HjsRDX9gShZLn+3LRtS2U5f6Jqer/YluqXAv6rQ0qqb3px1ZHIEfuC7ZulOjyP9IczVW
 wP1fSH2d7gH+gH3AwYvPiQrVTDi7SZCOjWw7d/pOKAxd3COyAgB78IF6axQzu85Fd1svF7gTZjdwk
 8uMobrOg==;
Received: from [194.136.85.206] (port=54632 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1reuEP-0002WA-2y;
 Tue, 27 Feb 2024 11:58:37 +0200
Date: Tue, 27 Feb 2024 11:58:35 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Nick Hollinghurst
 <nick.hollinghurst@raspberrypi.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240227115835.299146c9@eldfell>
In-Reply-To: <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oql0Bx3UihsRw6_b1==PDux";
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

--Sig_/Oql0Bx3UihsRw6_b1==PDux
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 17:23:24 +0000
Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> Hi Pekka
>=20
> Sorry for the slight delay in replying.
>=20
> On Mon, 26 Feb 2024 at 15:11, Pekka Paalanen
> <pekka.paalanen@haloniitty.fi> wrote:
> >
> > On Mon, 26 Feb 2024 15:10:45 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> > =20
> > > Hi Pekka,
> > >
> > > On Wed, Feb 21, 2024 at 11:07:51AM +0200, Pekka Paalanen wrote: =20
> > > > On Fri, 16 Feb 2024 18:48:55 +0000
> > > > Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> > > > =20
> > > > > From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > > >
> > > > > Add this as a value for enum_drm_connector_tv_mode, represented
> > > > > by the string "Mono", to generate video with no colour encoding
> > > > > or bursts. Define it to have no pedestal (since only NTSC-M calls
> > > > > for a pedestal).
> > > > >
> > > > > Change default mode creation to acommodate the new tv_mode value
> > > > > which comprises both 525-line and 625-line formats.
> > > > >
> > > > > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.c=
om>
> > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com> =20
> > > >
> > > > since no-one else commented yet, I'd like to remind of the new UAPI
> > > > requirements:
> > > > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-=
userspace-requirements
> > > >
> > > > AFAIU, adding a new value to an existing enum still counts as new U=
API.
> > > >
> > > > Maybe there is no need for the full treatment here, or maybe there =
is,
> > > > I'm not sure. I think you should make some statement about how the =
new
> > > > UAPI requirements have been addressed. =20

...

> The use cases for runtime switching of the "tv_mode" are exceedingly
> rare, so IMHO the property doesn't need exposing through the UAPI.
> However it was added to the UAPI about 8 years ago for vc4 and sunxi,
> and is also now used by other drivers, so can't be reverted. Does that
> mean it can now never be changed without jumping through the hoop of
> creating some userspace user?

That is for the DRM maintainers to decide. For that, they must first
notice that this is indeed new UAPI.

History has shown that UAPI changes sometimes get through when they
would have probably been rejected off-hand if a maintainer had a proper
look. I saw an UAPI addition that was not in any way highlighted as
such, with a topic that is probably uninteresting to most. The patch
also did not discuss any of the details you now explained, which could
serve as a justification. Naturally I screamed, hoping to attract
maintainer attention.


Thanks,
pq

>=20
> Regards
>   Dave
>=20
> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_mo=
des.c#L2232


--Sig_/Oql0Bx3UihsRw6_b1==PDux
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXdsksACgkQI1/ltBGq
qqfnAg//W6NpaaKTTfwxVHy2apa09YviPsJyRzGO/qvJPzHYZaWVocCvJA9Y5Rdt
anFVEXL04YiLH2zl4WTZvQ60AViW0nLyWCysp5LrWmUfToOFipFKLyb3W3fsWh/u
C1ccKHvcJgQYSH7KrmjV9N2F/Tb7+4LU7Vc0th9tFgtJfbCM3OHAsdqdfCenPVQl
eXo03wlBTRdzz2NFEn2vKA2+mqER07gEB0bW9gTbWNvtBFdESpckO8TrCQkVlO0B
Vh89xCYyWGq07mn/2USoVr0qPIGnhRNY4zrOgRXLz8b/0g4O6lmOvwVrSCE59FCB
6zFQQRQrjJk+8x6PxG5YQwW4T8bJXY+xWzcSq/We/LCHJQmhQGg6vI6mh5ljQaSG
6RrsBchD35wr99BqA9ZzpMusq45LWBx82cjCMHlsBBQUi89wpRNr1ugCEmGzNi1Q
PgW2F0mwd/FE1xw2zUh+MkPrb11BEBSViLdw5xar6FxZRTGdygOYCt5j11tNr258
K969gy/tSgDG361qQ4f5kXUDLx9q2dX35AJs9GaeJWOMMkV6+Cmp7VL8GcRHxtRK
3KnBsB1nmOCWwQLm+HZeM+I0+4gg9uyfam7Q6kf7axP+0ssByqx8hHO9Kwkm1rCH
XD2N79UlQLlFD2BkSR3UnLs9dqgJvt3cCPANoM4LqkFh/0gDLk4=
=g/Rr
-----END PGP SIGNATURE-----

--Sig_/Oql0Bx3UihsRw6_b1==PDux--
