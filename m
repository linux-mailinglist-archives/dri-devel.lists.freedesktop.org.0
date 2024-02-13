Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17BB852EAA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113DD10E3C9;
	Tue, 13 Feb 2024 11:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="YCqn2/XI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ED610E3C9;
 Tue, 13 Feb 2024 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ob1mtidG8pZSQE72m6TU3tU6SUifhLcJBQ3wzyQ+5LQ=; b=YCqn2/XIxy6XDYAkqt+UOOgLd3
 WKcElGzPWUnB1idvaRCVFfv52kX53ZXcGwkqjVnaRJCE8rpJUPZ3DmxlUtzZPVBxIU6OWwNDvzIPZ
 l2DnCtXWwPXK0zwkkhdupTepUZzEMPPbWfhXAAHmgwDfbVf1IZ2hAtwVSjvJsAEXLEPYKZURVahy/
 6H/hKljN4vGvyIQzHRzwIBSGn99YjX+G8T5TbTWiPub9Z1czrWNPAvxN08k8PVyVfOfEdJjFd5l9u
 5srI6hbplL4anzrsxurNq4kAbqfK6GPOEWYsaskanFBQeVRc4z0nL7mSQEyUW1rnu4F5dmaV1GKjS
 W9wh/yMQ==;
Received: from [194.136.85.206] (port=51198 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZqYA-0005XE-1m;
 Tue, 13 Feb 2024 13:02:06 +0200
Date: Tue, 13 Feb 2024 13:01:52 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, sean@poorly.run, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH 00/28] Plane Color Pipeline support for Intel platforms
Message-ID: <20240213130152.3ad4ae50@eldfell>
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UBaGp2JONr96V4co.7aS80g";
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

--Sig_/UBaGp2JONr96V4co.7aS80g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Feb 2024 12:18:07 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> This series intends to add support for Plane Color Management for
> Intel platforms. This is based on the design which has been agreed
> upon by the community. Series implementing the design for generic
> DRM core has been sent out by Harry Wentland and is under review
> below:
> https://patchwork.freedesktop.org/series/123446/
>=20
> The base work of above series is squashed under 1 patch and support
> for Intel platform is added on top of it.
> Any reviews on the original core design is expected to be done in=20
> Harry's series to avoid any forking of the discussion.
>=20
> We have added some changes/fixes to the Harry's core DRM changes,
> being put up as separate patches on top of squashed patch. These are
> expected to get included in the main series from Harry once agreed upon.
>=20
> Changes added on core design:
> 1. Below patches implement some fixes on original series
> drm: Add missing function declarations
> drm: handle NULL next colorop in drm_colorop_set_next_property
> drm: Fix error logging in set Color Pipeline
>=20
> 2. Implemented a HW capability property to expose segmented luts.
> drm: Add Color lut range attributes
> drm: Add Color ops capability property
> drm: Define helper to create color ops capability property
> drm: Define helper for adding capability property for 1D LUT
>=20
> This helps in generically defining the hardware lut capabilities,
> lut distribution, precision, segmented or PWL LUTS.
>=20
> 3. Added support for enhanced prescision, 3x3 matrix and 1d LUT:
> drm: Add Enhanced LUT precision structure
> drm: Add support for 3x3 CTM
> drm: Add 1D LUT color op
>=20
> On top of this base work for DRM core plane color pipeline design,
> implementation is done for Intel hardware platforms. Below patches
> include the same:
>=20
> drm/i915: Add identifiers for intel color blocks
> drm/i915: Add intel_color_op
> drm/i915/color: Add helper to allocate intel colorop
> drm/i915/color: Add helper to create intel colorop
> drm/i915/color: Create a transfer function color pipeline
> drm/i915/color: Add and attach COLORPIPELINE plane property
> drm/i915/color: Add framework to set colorop
> drm/i915/color: Add callbacks to set plane CTM
> drm/i915/color: Add framework to program PRE/POST CSC LUT
> FIXME: force disable legacy plane color properties for TGL and beyond
> drm/i915/color: Enable Plane Color Pipelines
> drm/i915: Define segmented Lut and add capabilities to colorop
> drm/i915/color: Add plane CTM callback for TGL and beyond
> drm/i915: Add register definitions for Plane Degamma
> drm/i915: Add register definitions for Plane Post CSC
> drm/i915/color: Program Pre-CSC registers
> drm/i915/xelpd: Program Plane Post CSC Registers
>=20
> Bhanu from Intel will be sending out the igt changes to help test the
> color pipeline implementation based on the current igt changes sent out
> by Harry.
> https://patchwork.freedesktop.org/series/123448/
>=20
> Planned Next Steps:
> 1. Work with Harry and community and get DRM core changes for color
> pipeline merged.
> 2. Implement pipe color management (post blending) based on the current
> color pipeline design.
> 3. Work with compositor maintainers to get color processing implemented
> using display hardware, thereby avoid any GL or GPU shaders.
>=20
> Thanks to all the community maintainers and contributors who have helped
> to get this support in upstream Linux. Looking forward to collaborate,
> work together and get this merged.
>=20

...

> Chaitanya Kumar Borah (16):
>   drm: Add missing function declarations
>   drm: handle NULL next colorop in drm_colorop_set_next_property
>   drm: Fix error logging in set Color Pipeline
>   drm: Add support for 3x3 CTM
>   drm: Add 1D LUT color op
>   drm/i915: Add identifiers for intel color blocks
>   drm/i915: Add intel_color_op
>   drm/i915/color: Add helper to allocate intel colorop
>   drm/i915/color: Add helper to create intel colorop
>   drm/i915/color: Create a transfer function color pipeline
>   drm/i915/color: Add and attach COLORPIPELINE plane property
>   drm/i915/color: Add framework to set colorop
>   drm/i915/color: Add callbacks to set plane CTM
>   drm/i915/color: Add framework to program PRE/POST CSC LUT
>   FIXME: force disable legacy plane color properties for TGL and beyond
>   drm/i915/color: Enable Plane Color Pipelines
>=20
> Harry Wentland (1):
>   [NOT FOR REVIEW] drm: color pipeline base work
>=20
> Uma Shankar (11):
>   drm: Add Enhanced LUT precision structure
>   drm: Add Color lut range attributes
>   drm: Add Color ops capability property
>   drm: Define helper to create color ops capability property
>   drm: Define helper for adding capability property for 1D LUT
>   drm/i915: Define segmented Lut and add capabilities to colorop
>   drm/i915/color: Add plane CTM callback for TGL and beyond
>   drm/i915: Add register definitions for Plane Degamma
>   drm/i915: Add register definitions for Plane Post CSC
>   drm/i915/color: Program Pre-CSC registers
>   drm/i915/xelpd: Program Plane Post CSC Registers


Hi Uma,

it is really hard for me to get a good picture of what this would result
in from userspace perspective, which properties will exist with what
values, but I didn't spot any fundamental UAPI design problems so far.


Thanks,
pq

--Sig_/UBaGp2JONr96V4co.7aS80g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXLTCAACgkQI1/ltBGq
qqdcERAAol0emPwzzd2B9+gElkbl4PjTD0m7+xd+uSPToMU47rhoYEHIANwlTPd+
nL23V4i2OtEMGIvkAvM2g8ZZqGXesKwHjwTwyT3YS9y5sFQkQ+k43TABjdHLeThu
g1tzB+ia9SGgo61WP66y1oTwHuqvPt1u/sLasBMcF89beZXrmY8N4Mm/0c/kG21G
IUujcyZadPMkONeLgC95vCcL0Gv0LyFlzIAdZjGIDVBeaSugw/f3QT4XhQDo/W+P
mteckTAMXlBNwtiKrCfq7CRmj8GRZX7opZCRUflj9RNodOT+SnTlhPEkqPv+3o36
eF79VZf3wPqEhXi8i/Ku1ofMzuAf6jo3+HgdXqJHa4KFTT4pClbcvDHTKEDlwwgi
Yf+05BCiOACwjybZHLapbk/L6qTyXhhv2Z0ub6UBOo+RSveGaVzP1pnSG/lX4l0C
I1GQfr2yKIJU2gUQwB73d6QUmsyI1zk/9nxIL3JLjdPWXbRKdvx/r+9A+59wQrkg
ip5BfpCxcxhH2D2FPdebGMz1f9rItVMmZDPOgBMkxHAMap7xoEKpjrDjvhc2Nax6
Q1qiqVGOT7iq0GrjIpaLKOTnpnNN4JdXlMwWU6Ux4UYifZAh5RBSp/XEVy+uEaNk
XYl7OCUsDCjRA5FPgzEkw86POWL8YKuoMpzuzSQC+s++y9VNH20=
=p1CV
-----END PGP SIGNATURE-----

--Sig_/UBaGp2JONr96V4co.7aS80g--
