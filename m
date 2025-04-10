Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3904A83BC0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DE910E7A8;
	Thu, 10 Apr 2025 07:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="AggXW2nP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7C310E7A8;
 Thu, 10 Apr 2025 07:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mW2BmBRJFzbbLmtrNW8NouiCPlCCvhYr21PM7cw/3Qk=; b=AggXW2nPjCelRs+WCJrazMHd8T
 gmlPDgsfrDVd1AJaOs6qVkzbP6Fa8pwjFZn+Hs0QdRPpD5vkys560liiLjDZtaAlEe4c1lvaKqoiM
 lob+cpcz8FWKT4iUpQuJCU3hWESSyeOF7oddPu2nJUtC7WhfpC/ghlmjl+0bJUhXxTpNWtShnNEpL
 GRVziewSbsRH6XnBo6paUprFGYrzfH4SXhrTuOI/lyMgHWW9tcDg7oObouRCNQNPu0hcXeg9QuaQg
 IewwXJKfMQvubfZqT9aj7h/smGnyF9SKAMqaFXwyb29jm50hwzghTqS1aV3AtxqVdXPDBGua/bs19
 ARX4jUrQ==;
Received: from [194.136.85.206] (port=44146 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1u2mjS-000000005Gf-1Ewf; Thu, 10 Apr 2025 10:53:54 +0300
Date: Thu, 10 Apr 2025 10:53:43 +0300
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
Subject: Pipeline vs. no pipeline (Re: [PATCH V8 06/43] drm/colorop: Add 1D
 Curve subtype)
Message-ID: <20250410105343.606bb75c@eldfell>
In-Reply-To: <87fd7840-b021-4d3a-9d0b-2724e941c5dc@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
 <87fd7840-b021-4d3a-9d0b-2724e941c5dc@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NG3=OMGu0Zwg7p3kMNF=p/s";
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

--Sig_/NG3=OMGu0Zwg7p3kMNF=p/s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Apr 2025 13:30:46 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2025-04-08 12:40, Daniel Stone wrote:
> > Hi there,
> >=20
> > On Tue, 1 Apr 2025 at 20:53, Simon Ser <contact@emersion.fr> wrote: =20
> >> On Tuesday, April 1st, 2025 at 17:14, Daniel Stone <daniel@fooishbar.o=
rg> wrote: =20

...

> >>> 1. Is it guaranteed that, if any plane on a device supports the
> >>> COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
> >>> (Given the amdgpu cursor-plane discussion, it looks like no, which is
> >>> unfortunate but oh well.) =20
> >>
> >> I don't think so. (They could all expose a COLOR_PIPELINE with the only
> >> choice as the zero bypass pipeline, but that sounds silly.) =20
> >=20
> > Works for me: so any planes could not have colour pipelines, and the
> > result would be undefined (well, less defined) colour. =20
>=20
> Yes, basically it would be what we have now (without color pipelines).

Hi,

I see Alex wrote:

> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
> support to the color pipeline. I have sketched these out already but
> don't have it all hooked up yet. This should not hinder adoption of this
> API for gaming use-cases.

Was it considered to be able to lift the full-range RGB restriction
from the color pipelines, eventually leading to the possibility of
scanning out limited-range YCbCr bit-identical, giving userspace access
to the sub-black and super-white ranges for e.g. BT.814 purposes?

These questions are pointing in the direction of a bypass
COLOR_PIPELINE being different from no COLOR_PIPELINE. I assume a
bypass pipeline needs to shovel values through unchanged, while
"without color pipelines" would need the old COLOR_ENCODING and
COLOR_RANGE properties.

That reminds me of yet another question: if the framebuffer is limited
range, and it's not converted to full-range at the start of a color
pipeline, how will the sub-black and super-white ranges be represented?
Will they be negative and greater than 1.0 values, respectively? This
would be meaningful for the colorops being defined now, as I assume
people might implicitly limit their thinking to the [0.0, 1.0] range,
or at least exclude negative values.

The 3x4 CTM colorop is not yet explicit on whether it clamps its inputs
or outputs. Should all colorops be explicit about it?


Thanks,
pq

--Sig_/NG3=OMGu0Zwg7p3kMNF=p/s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmf3eQcACgkQI1/ltBGq
qqc3NBAAi7pNZ7ZuYasRVx7esRptni9eG21TQv97wrJYmBae54fHhVKFfMeCYh8k
ZuhmcCeYnIfepVwhcY8DM3CpjihB2aSZD8IV4KjOtuq1ReGnToWGsum/lkZ0CdRn
+5T+z31vzangptCOxfWGX2N3g+5kiPwW3hZeAArJoAnJeBNZ0Rhwd/7oPFztB+qX
4wUVQ+zsAlqT80kAflp9DijJSg1AOPJE9iDnduP22m2MBtG8WvvU0kOt9jFz/jak
wQ5c3GLxfRft9b9bwnpiGVO9+5R+zMbeoCQ5P1y+zVjYOLFrYKbm0SFeqmjOQ0BW
KuK4wTe0Cn0xdNzh4OHW5FGMEI+FloFtZz5BJZCIRLMarhefu6j9eekH94nAlCwr
pdYPqzl1lz4s0uBfmT4nXO5/NqlfsWEUbhKnusJ1dBYCKS6/rDXHhd7NuNswKlfQ
5GrVPPscQGJjEM9zTJEoEfr9m9/rc4i7eeRDmgHjLVLLetEvsK0glDA02phbB55h
OZiROum7sQrXvF6b8/O2Dj8dShebY1ACad8CR/da5EBOIV4Wmb+t/Mw6PwsR4cd2
cJ0H/Enh/0ClQJ/y9jRUADk/FyiFWHRVSgxcZ4hfJey9s/xkmbqdlFnPul7I42Y0
gv9o+bula3dn6QdEGW+v57cfFnQe/Za+qpcra79pYqSfkUEGxKA=
=CrDc
-----END PGP SIGNATURE-----

--Sig_/NG3=OMGu0Zwg7p3kMNF=p/s--
