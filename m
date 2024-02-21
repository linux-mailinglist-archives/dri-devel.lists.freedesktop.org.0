Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2596385D674
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 12:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623DD10E530;
	Wed, 21 Feb 2024 11:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="ODwtR1Od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2CD10E530
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8MEbSgLr14pQ77N6lKxlvIG7N5j9vcdLPNFkBy0PnSg=; b=ODwtR1OdWYMOWcV5BlKgbOZWQy
 PawgpD4VJe6p3T/yRonxr2Iz867Qu/bYYc3ex1dJfeSuiBKsF8GrCagMCExdC3Z/c6PibJgg0jNJh
 JOKg1LPz9GkZgZENCs2XAMBlOgkB2i6PSsOq1bPzTPLzgFPCsVuFk9ZfUKLJnYETcNsDMccxjL5dh
 e23cA8Nz2l5//bGsPiS2yzfKa3VKpFTk+g6tI3Pt1G6CU8XKbsx8lXAEYyO5PZVKetQoa4oW/+3Ta
 wTfnHMBmrYto/9t0YiAAZjFxT40Io7QTgLxH3o/yXQMBZHqhaAB7U7Z57U3h7T95nfcN4uOLconSf
 jWSIzDoQ==;
Received: from [194.136.85.206] (port=35802 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rckRw-0003mB-0l;
 Wed, 21 Feb 2024 13:07:41 +0200
Date: Wed, 21 Feb 2024 13:07:31 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Jani Nikula
 <jani.nikula@intel.com>
Subject: Re: [PATCH v2] drm/edid/firmware: Remove built-in EDIDs
Message-ID: <20240221130731.70664a22@eldfell>
In-Reply-To: <20240221092636.691701-1-mripard@kernel.org>
References: <20240221092636.691701-1-mripard@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PA+gXVlpl8WS4d=3AGxOblz";
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

--Sig_/PA+gXVlpl8WS4d=3AGxOblz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Feb 2024 10:26:36 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> The EDID firmware loading mechanism introduced a few built-in EDIDs that
> could be forced on any connector, bypassing the EDIDs it exposes.
>=20
> While convenient, this limited set of EDIDs doesn't take into account
> the connector type, and we can end up with an EDID that is completely
> invalid for a given connector.
>=20
> For example, the edid/800x600.bin file matches the following EDID:

...

>=20
> So, an analog monitor EDID. However, if the connector was an HDMI
> monitor for example, it breaks the HDMI specification that requires,
> among other things, a digital display, the VIC 1 mode and an HDMI Forum
> Vendor Specific Data Block in an CTA-861 extension.
>=20
> We thus end up with a completely invalid EDID, which thus might confuse
> HDMI-related code that could parse it.
>=20
> After some discussions on IRC, we identified mainly two ways to fix
> this:
>=20
>   - We can either create more EDIDs for each connector type to provide
>     a built-in EDID that matches the resolution passed in the name, and
>     still be a sensible EDID for that connector type;
>=20
>   - Or we can just prevent the EDID to be exposed to userspace if it's
>     built-in.
>=20
> Or possibly both.
>=20
> However, the conclusion was that maybe we just don't need the built-in
> EDIDs at all and we should just get rid of them. So here we are.

Sounds good to me.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

If it turns out that these cannot be completely removed, then yet
another option would to refuse to use these on digital connectors.


Thanks,
pq

>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/admin-guide/edid.rst            |  35 +--
>  .../admin-guide/kernel-parameters.txt         |  14 +-
>  drivers/gpu/drm/drm_edid_load.c               | 160 +---------
>  tools/edid/1024x768.S                         |  43 ---
>  tools/edid/1280x1024.S                        |  43 ---
>  tools/edid/1600x1200.S                        |  43 ---
>  tools/edid/1680x1050.S                        |  43 ---
>  tools/edid/1920x1080.S                        |  43 ---
>  tools/edid/800x600.S                          |  40 ---
>  tools/edid/Makefile                           |  37 ---
>  tools/edid/edid.S                             | 274 ------------------
>  tools/edid/hex                                |   1 -
>  12 files changed, 18 insertions(+), 758 deletions(-)
>  delete mode 100644 tools/edid/1024x768.S
>  delete mode 100644 tools/edid/1280x1024.S
>  delete mode 100644 tools/edid/1600x1200.S
>  delete mode 100644 tools/edid/1680x1050.S
>  delete mode 100644 tools/edid/1920x1080.S
>  delete mode 100644 tools/edid/800x600.S
>  delete mode 100644 tools/edid/Makefile
>  delete mode 100644 tools/edid/edid.S
>  delete mode 100644 tools/edid/hex

--Sig_/PA+gXVlpl8WS4d=3AGxOblz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXV2XMACgkQI1/ltBGq
qqcFqhAAq0Sv3VYbk/MHDnOtYu+JccmQjxVvFWxUNm1C+AGzjjrL2tJ/f655PNGC
b4dwO+z1ItXgcH7ORgt4JkZRu8WOlWj15J/BIKgeXqnqvj3ZSr7MMp0A0yBev5p3
jPzwPF5/ttym/9ZvJnhc/hx25GgvXHzwawYTH+8XCyOKU9WCHXdxJOyzFqOt9giQ
otQ4mpgQvGGmDyUUWgeymTcxfc+8TAQ0mdk86T+5TI51WcrO0UxQ8ihmtYgWV2CE
UhYPAbSV4fvDa7Ogf5bXOxQUOxhd+KJEEd033C2lgwhZUtaIxN6pk1wInqqPJtjg
dsASMgyjSACwocFCiTYSEeZdplflhUy2KXI996ZoN77sD268RFxsmYQlpppfGIwA
DlZ4xBE+YT55ysfONQQ0R7xmhfsrFt5UlAmG0AldRZwARq738dWcvYJ/rBv+VLY+
C5AAFeCozDUSK07AlSOeplnBdBdHyli2mo4kBO33SRBGJ/u4i04N9+oqjugLgOx0
dyogJOcqRcAWzHVCC/CT29ht6afoIfqIVVuDJPl4PawQOefyeAA79djgAY81/nII
PkZwgVRJOAZAXR/GCnQdReW7H64AfZeUcAjvh9C56wuDdroQhj7Kz89TZApEDriP
G5ixQxmeX2pfJUj2Jt7khZWQsGFe88d3oyl1d6lgF4UZXl2p44o=
=MmZA
-----END PGP SIGNATURE-----

--Sig_/PA+gXVlpl8WS4d=3AGxOblz--
