Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88821A1D5C1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 13:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B010E50A;
	Mon, 27 Jan 2025 12:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="04oquTfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD310E509;
 Mon, 27 Jan 2025 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pjsHTBMWY9P7wI2MwLRSYjI4iuAYoxhTOWBrxWOO6Us=; b=04oquTfn5T3O0dEqwwwdQ260vG
 biscmqoJlMKOCmey10jhfieNjvSJnHXDhh/pE2FcInXoKqWCSDkybjzz3O+obRH0sOzEFGYH9jR60
 /SCj7oOVC5asi19BgeHUwTp4kKcIcrgMD4BM1wAsu1C7w3kJoH7HhJM3tfKiP17WSrdigAybtHq88
 MzECwoizJPng4kinLfS9ZCxVFLNTqdhjGDl7AEPPIxUW5x3C3mtpEZRb9FvBHrzqqgGCYzvdmniDI
 HJ1pA7kx8GE2OkyCN8E7gEEE/dOk4LSBg1tByB04jjaXBbm5TNpk+mxIq+Q2HZg8k6nme9VtYsjoy
 pzVga2uA==;
Received: from [194.136.85.206] (port=50614 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tcNs1-0007lT-0b;
 Mon, 27 Jan 2025 14:05:37 +0200
Date: Mon, 27 Jan 2025 14:05:29 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Message-ID: <20250127140529.722b376d@eldfell>
In-Reply-To: <9cc07dc9-ce0d-40cc-ae70-55a1b3f176e2@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-32-alex.hung@amd.com>
 <20250116105622.577533fc@tisha> <20250117110641.7040f712@eldfell>
 <9cc07dc9-ce0d-40cc-ae70-55a1b3f176e2@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T=m.9GT+5+=inHIBQ2.tQrd";
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

--Sig_/T=m.9GT+5+=inHIBQ2.tQrd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jan 2025 15:16:29 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2025-01-17 04:06, Pekka Paalanen wrote:
> > On Thu, 16 Jan 2025 10:56:22 +0200
> > Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> >  =20
> >> On Thu, 19 Dec 2024 21:33:37 -0700
> >> Alex Hung <alex.hung@amd.com> wrote:
> >> =20
> >>> From: Harry Wentland <harry.wentland@amd.com>
> >>>
> >>> The BT.709 and BT.2020 OETFs are the same, the only difference
> >>> being that the BT.2020 variant is defined with more precision
> >>> for 10 and 12-bit per color encodings.
> >>>
> >>> Both are used as encoding functions for video content, and are
> >>> therefore defined as OETF (opto-electronic transfer function)
> >>> instead of as EOTF (electro-optical transfer function).
> >>>
> >>> Signed-off-by: Alex Hung <alex.hung@amd.com>
> >>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>   =20
> >>
> >> Hi,
> >>
> >> why would a display system ever use BT.2020 or BT.709 OETF or its
> >> inverse? =20
> >=20
> > Sorry, this is more for my own curiosity, not an argument against the
> > patch. Since hardware designers decided to incorporate these curves
> > explicitly, what use was in mind? It's likely something I have
> > overlooked.
> >  =20
>=20
> I'm not entirely sure myself, but gamescope does use it for displaying
> game streaming content.
>=20
> https://github.com/ValveSoftware/gamescope/blob/2f88849ac9dc7da5c678d5d7d=
3e9b58f38add1bf/src/Backends/DRMBackend.cpp#L2509

I see, apparently they are being used as a pair to make a roundtrip to
some optical space for applying a color transformation matrix. IOW, the
CTM is being applied in the assumed "camera" side of broadcasting or
grading.

ITU-R BT.2408 seems to refer to this as "scene referred mapping", whose
aim is to match cameras rather than displays (and has nothing to do
with the scene). I cannot claim to understand this case, but I suspect
it should be used only before color grading (manual or automatic
artistic adjustments, or IOW picture formation(?)) in a pipeline.

I would assume that game streaming content has been prepared for a
display at its source, which implies that grading has been done. That
means that inverse-OETF leads to an unknown color space. Applying a
matrix in an unknown color space has unintended effects. That may not
be a big problem, even less if the matrix is visually adjusted, but
it's theoretically not quite right AFAIU.


Thanks,
pq

--Sig_/T=m.9GT+5+=inHIBQ2.tQrd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeXdokACgkQI1/ltBGq
qqeiKg/9GD6pmONnePa5/D8aVfH8Sb/12oeBa7VwsCSgUVk2Lq84IsIR6+9Acqzq
CClBNEx2Cs+VEnqzMko8RtSoODrx30PddYSKNBBxtmv/3VeMQ3zc2nn6/2WTssIq
CVfQR9vv6dOJZetIlKL/l8hLi2bAbnHcIgrkosjUvFswHM72I63WFKLQgE94s2kH
31Rd+aXHe1LWpHPOfuqmnszciU7an+K3UcqEV9czOH+lNksboiyJ4ajS5hmxsys8
RccmrZify2O3NQ48purUAnOoh9NJxIfBMIMyYUIJoJbZzDa38EgBcrdQV1FqNcQj
xXfeaklaNx7OSajXYdf1GnkeEn1ef/jA0oz+cFhyiEUwAdWXLa0hT3y1WcTZOVej
dz+nWC32oH8nmuyLcAtIy9s/aqZoaO9di5KEl3RuiU89tmz4cmiqXatYNwYeA5eM
ASzPloE4ee8OTVCR5CAVHPxFLXfEexaSLPr/wGnOZAgnVnwkjmzDd9n4aYWKgz7W
06D7LaUoIGleJpHPyKGJhy3xqiRvKOjWAjro2CHpdx63SYEQgnJkvmjKYMfHof6M
m8bIBzaIKseF7nPlngVaWq8YzS6K3ZlDROwl5QMafmMfeolX/En5apIPSt5LMP9e
t7qhbrHGvos+3BGj0551OMkvokEfsHxIr4DrQjEZKmoj+tpY2Gk=
=g+i4
-----END PGP SIGNATURE-----

--Sig_/T=m.9GT+5+=inHIBQ2.tQrd--
