Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2BA9166F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E933410E176;
	Thu, 17 Apr 2025 08:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="wRZzuKaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313810E176;
 Thu, 17 Apr 2025 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdxL7RR3vaLFxp+eSndToozeUAVvDpIEbuKT+wJsI0E=; b=wRZzuKaM1u6nSuKqklhfzZdSh/
 m/uNcxGqZ4RDRUpbjVzTif6ZbtGsM+K2vo2GVpxER0X0D71QK09kkvJxgIj4jrOz0WBj1lWA23YsF
 Mur2FjxwXKQdB9TraYIPqVMTTC6RaV2ejTi0DTqLNnFyGemhcoyzRwk6PrLvEUMDxHbSraiMtwlip
 u4KlJ/+6KRL+IK4oFj+Ccnv7pvMXLtr+Ul+I1k4FZAlvCA6e7JBG8XJS2kWKU+lvoLutU4WOWT8FX
 sxGBE2Dyz7FaL2EGGlOIZZrqbu+27WueTD/aFWzhCEjqKFkSZN0wKkpGlq0Q0aGGa6XzQC8eRYFYl
 d8wVI18w==;
Received: from [194.136.85.206] (port=37528 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1u5Kc5-000000007EA-1M9Q; Thu, 17 Apr 2025 11:28:49 +0300
Date: Thu, 17 Apr 2025 11:28:46 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: Pipeline vs. no pipeline (Re: [PATCH V8 06/43] drm/colorop: Add
 1D Curve subtype)
Message-ID: <20250417112846.123ff9bd@eldfell>
In-Reply-To: <a557d929-7bf9-4a52-96fb-ed7a696744c2@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
 <87fd7840-b021-4d3a-9d0b-2724e941c5dc@amd.com>
 <20250410105343.606bb75c@eldfell>
 <a557d929-7bf9-4a52-96fb-ed7a696744c2@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P.oIU0pYWfg5XCiY89Ox5Vt";
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

--Sig_/P.oIU0pYWfg5XCiY89Ox5Vt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Apr 2025 11:29:10 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2025-04-10 03:53, Pekka Paalanen wrote:
> > On Tue, 8 Apr 2025 13:30:46 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2025-04-08 12:40, Daniel Stone wrote: =20
> >>> Hi there,
> >>>
> >>> On Tue, 1 Apr 2025 at 20:53, Simon Ser <contact@emersion.fr> wrote:  =
 =20
> >>>> On Tuesday, April 1st, 2025 at 17:14, Daniel Stone <daniel@fooishbar=
.org> wrote:   =20
> >=20
> > ...
> >  =20
> >>>>> 1. Is it guaranteed that, if any plane on a device supports the
> >>>>> COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
> >>>>> (Given the amdgpu cursor-plane discussion, it looks like no, which =
is
> >>>>> unfortunate but oh well.)   =20
> >>>>
> >>>> I don't think so. (They could all expose a COLOR_PIPELINE with the o=
nly
> >>>> choice as the zero bypass pipeline, but that sounds silly.)   =20
> >>>
> >>> Works for me: so any planes could not have colour pipelines, and the
> >>> result would be undefined (well, less defined) colour.   =20
> >>
> >> Yes, basically it would be what we have now (without color pipelines).=
 =20
> >=20
> > Hi,
> >=20
> > I see Alex wrote:
> >  =20
> >> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RAN=
GE
> >> support to the color pipeline. I have sketched these out already but
> >> don't have it all hooked up yet. This should not hinder adoption of th=
is
> >> API for gaming use-cases. =20
> >=20
> > Was it considered to be able to lift the full-range RGB restriction
> > from the color pipelines, eventually leading to the possibility of
> > scanning out limited-range YCbCr bit-identical, giving userspace access
> > to the sub-black and super-white ranges for e.g. BT.814 purposes?
> >  =20
>=20
> For AMD HW design and validation assumes that the pipeline is
> dealing with our internal floating point format and RGB values.
> Anything beyond that is somewhat undefined. Things might work
> as one expects but the product was definitely not designed and
> validated for that usage.
>=20
> I assume other HW design makes similar assumptions.

Hi Harry,

if that's just about minor rounding effects in conversion between
integer and internal formats, I wouldn't be too worried.

But if the internal format has severe limitations, like cannot
represent negative values, or smaller than -0.999 or bigger than 1.999
for example, then that is something userspace needs to know.

> > These questions are pointing in the direction of a bypass
> > COLOR_PIPELINE being different from no COLOR_PIPELINE. I assume a
> > bypass pipeline needs to shovel values through unchanged, while
> > "without color pipelines" would need the old COLOR_ENCODING and
> > COLOR_RANGE properties.
> >  =20
>=20
> What I take it to mean is that this iteration of COLOR_PIPELINE
> only allows for RGB pipelines as YCbCr ones are underspecified
> without COLOR_RANGE and COLOR_ENCODING. For RGB a bypass pipeline
> should be the same as no COLOR_PIPELINE.

I'm thinking of the future extension of the color pipeline framework.
I'm concerned that not considering limited range YCbCr might make
adding support for it later much harder than it needs to be.

Xaver's point about scRGB is a really good one: we don't need YCbCr in
order to encounter nominal values outside of [0.0, 1.0]. We don't even
need scRGB, any conversion from a bigger to a small color space can
produce them and we should understand what to expect when that happens.

> > That reminds me of yet another question: if the framebuffer is limited
> > range, and it's not converted to full-range at the start of a color
> > pipeline, how will the sub-black and super-white ranges be represented?
> > Will they be negative and greater than 1.0 values, respectively? This
> > would be meaningful for the colorops being defined now, as I assume
> > people might implicitly limit their thinking to the [0.0, 1.0] range,
> > or at least exclude negative values.
> >  =20
>=20
> Without COLOR_RANGE there is no way to know whether the input is limited
> or full.
>=20
> Is your question about when we have COLOR_RANGE specified? If that is
> set to LIMITED then I expect the values to get expanded at the beginning
> of the pipeline. In that case it's probably a HW or driver implementation
> detail whether the sub-blacks or super-whites will still be represented
> (as negative or >1.0 values) or clipped.
>=20
> > The 3x4 CTM colorop is not yet explicit on whether it clamps its inputs
> > or outputs. Should all colorops be explicit about it?
> >  =20
>=20
> Do we expect all HW/drivers to be able to support the same behavior?
> Is this critical to using the colorop?

It is critical. It does not have to be the same for all hardware and
drivers, if there is a colorop property or type indicating it. But it
cannot be a hidden driver/hw implementation detail.


Thanks,
pq

--Sig_/P.oIU0pYWfg5XCiY89Ox5Vt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgAu74ACgkQI1/ltBGq
qqfhkBAAlgYfrf0nlQ0YD9StXMhw7CRQk8iI2oyu1fZu3BdiE5HDopASqYn0a9bw
0SPYABY+AjrstL263gVJLHXgvoUK9p+pLBR7ne8r8oOg2kZemFKyya2pdfzY2/1d
u4r+iTrNPt4V1g3pt66Ll1glhCMu54DZ7t8ZMV6qPxJmrBYhk3E7Qd4JjiMaNaiA
Uj+oJr5lzTSDre93GV0QwgGZqfxdCrgbY2C5gUuuMCT8KlDTlu+LMxOwaMEFB2Uq
Fl2LW8COlgysDno3EcntcdGZMB1yZrz9XHD909RqPb8q3WtT9X8+8eJXnKpglGx5
tGKjdOTCIpfuctbstmp1nFot/jwpv4IVcpH7v6R7Nx9O3iutjD2AsV1L9K6IBCpI
nQqk5ZvuSAaQuPyN6N5SDEarPMc7OgC+2Rbc0Z1Tr9i6giql9BcTDFTRK4fjoUTw
9eLlHowhcX6zO8Xa0eXsGX1PAQuaTqTq5f78WAaZrWs8vpv9E8xh4p89o/ZMbgo3
4Q1kkyqg33L1ir8Nz7KBLgA/eQ5o1bLjsyD3kuIH+/po4JUodmF6ZoIEpev+5AWb
pL8YoSC/HKDKy6sOOLuSujmjKoTViKRYVj4m9HDRk+N6T20uNa7nH/uyAU0N0tud
Lew/56wXms3/Wa8mIn4PWsEzUZfTbtdB7qsMvKmjSDsb7Dg4AJY=
=Fuum
-----END PGP SIGNATURE-----

--Sig_/P.oIU0pYWfg5XCiY89Ox5Vt--
