Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011EA14C0A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9882910E7BD;
	Fri, 17 Jan 2025 09:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="oYLREtLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FB110E50D;
 Fri, 17 Jan 2025 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7yfdTE5EiDCJfOdDotYuglWsaCy8L9hxdgrPqfxUcL0=; b=oYLREtLUIwd/JrAgwIklKlH+qN
 M0EyZ7gBvXOS8qb+TWVKXfLVYwEOpwog5We6Z5Vv8EZQNkoanOO1oQun+qVFMXWbTPTpFRUwWs1n1
 peaPC2R1GimSJgKYHLcyZM52JcPgYjm0CNCdIGhvz3whJShi3W5EkBlV5rueUqLJKSzpS7n843FLZ
 /SNu/q3BB59WajcWwrCu8NXLQ+6+keRF7gBiaQxwjMW1DANK3aN9CpK2XceUjQ5L9Vla/ljOgmK0A
 QS+1Q0TWQZaQbnElnLU2tWbzQUGhu5FHM/REWwvF1t84iEGBYPIQDPJuF1iOgt0315UVK6Sav0UlD
 mNoEvClQ==;
Received: from [194.136.85.206] (port=50264 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tYiW9-0003iM-1u;
 Fri, 17 Jan 2025 11:19:53 +0200
Date: Fri, 17 Jan 2025 11:19:52 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Alex Hung <alex.hung@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>
Subject: Re: [V7 43/45] drm/amd/display: Add AMD color pipeline doc
Message-ID: <20250117111952.66d09977@eldfell>
In-Reply-To: <20241220043410.416867-44-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-44-alex.hung@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N6VBw60ezvTJw+s5UhyCPN1";
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

--Sig_/N6VBw60ezvTJw+s5UhyCPN1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Dec 2024 21:33:49 -0700
Alex Hung <alex.hung@amd.com> wrote:

> From: Harry Wentland <harry.wentland@amd.com>
>=20
> Add kernel doc for AMD color pipeline.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++++---
>  1 file changed, 102 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 5e8c5c0657c4..56fb0870a2fc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c

...

> + * AMD plane color pipeline
> + * ------------------------
> + *
> + * The AMD &drm_plane color pipeline is advertised for DCN generations
> + * 3.0 and newer. It exposes these elements in this order:
> + *
> + * 1. 1D curve colorop
> + * 2. Multiplier
> + * 3. 3x4 CTM
> + * 4. 1D curve colorop
> + * 5. 1D LUT
> + * 6. 3D LUT
> + * 7. 1D curve colorop
> + * 8. 1D LUT
> + *
> + * The multiplier (#2) is a simple multiplier that is applied to all
> + * channels.
> + *
> + * The 3x4 CTM (#3) is a simple 3x4 matrix.

Hi,

I'm curious of why does the multiplier exist? Under what conditions is
it not feasible to precompute the multiplier into the CTM coefficients
and must instead be programmed as a separate colorop?


Thanks,
pq

>   *
> - * The pipe blending also happens after these blocks so we don't actually
> - * support any CRTC props with correct blending with multiple planes - b=
ut we
> - * can still support CRTC color management properties in DM in most sing=
le
> - * plane cases correctly with clever management of the DC interface in D=
M.
> + * #1, and #7 are non-linear to linear curves. #4 is a linear to
> + * non-linear curve. They support sRGB, PQ, and BT.709/BT.2020 EOTFs or
> + * their inverse.
>   *
> - * As per DRM documentation, blocks should be in hardware bypass when th=
eir
> - * respective property is set to NULL. A linear DGM/RGM LUT should also
> - * considered as putting the respective block into bypass mode.
> + * The 1D LUTs (#5 and #8) are plain 4096 entry LUTs.
>   *
> - * This means that the following
> - * configuration is assumed to be the default:
> + * The 3DLUT (#6) is a tetrahedrally interpolated 17 cube LUT.
>   *
> - * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ...
> - * CRTC DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
>   */
> =20
>  #define MAX_DRM_LUT_VALUE 0xFFFF


--Sig_/N6VBw60ezvTJw+s5UhyCPN1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeKILgACgkQI1/ltBGq
qqcysQ/+JAadR2tqYGDE5V+WuAPgSjgiCnykgxvlQucLAQX0ipD8PMXlOqvo99F2
DJl+C6o7MekMSWAzewui1M3RVXT4k9eLSTjOH2R37OocEoZdn3Tyo63ORvZOsWj4
+aP9PJ97ipWyB3Lf/Al6rJxVy7CbewZ0Hl6qMLeQuTly+eHlvnfKLyGtPci9D19W
Xl7AhrRB+M6PuY55G05KsFpAICrqC3N4/22yQ2BfMCIftBrMOcahW0RR91SjSIYN
z0/XIOe/X0mNRZz7ZU/KTREa8F4VYrYZcxohrWxL8EC+DN0qidkqRtPOMgz4GP+1
z0DhdMNblZavPXBYvVDIFHiYAgGSp7inmWDB40SPTeN7mhWKqvm14U6zoT8+tb+S
MJyV/W8U6ihZpoNh8s2QHvTy/DK7J5OEklG2I16JqMnd6Qbkp+/STA2TZC+JtwuW
HMTgG+NLhUL1ILePbcu66YMXoLe2DEqQPGZE4RSXRM30b+ERYvO+N9njjGwACowP
kdWmmu3zUXDkZTzina9YQzNlz4X7SZ7nsV9UnQ1v1xusE8gXar3EZwEoD7jwIben
7LME2gjKCrVN6a/Pd/1++nQfdrF0Px17E4D02mxgYHHub2PfgLc6Sujm71bgGoTr
VjMUB/iF2loDo54thi6M5OViejkdwUveH0jPQX+B9Pn/Vzdn5Tk=
=bSNr
-----END PGP SIGNATURE-----

--Sig_/N6VBw60ezvTJw+s5UhyCPN1--
