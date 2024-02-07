Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAC284C679
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 09:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47F7113158;
	Wed,  7 Feb 2024 08:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="Yj5qMK8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CB0113158
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PLWVHtXp1su+keqeAZfr5JdA50OHHDttPlQGFKWS0q0=; b=Yj5qMK8Ff40MlGMbZXtV4xxuUa
 C2ESwpngeeC9mvEVI8EseU+/oubJEKJxV35tYX0+pXK8vjyLS878XglqJ5yFAjKdLNr0/7RdHTdhG
 x4bYGCsG1anmihKeLrPtSPLsnHciffgIkBAS3RF+RAOfc8SOAf++LtTI420ZWugjvr6NOshL/NCjr
 LZUSOgUkTjq2M34AYtJSM7b8iN7+xVU0XH6bLt33TLh1cgKqyQ/Hf4B7ml4zS3XSAu2lb/kxQnJMr
 wNq5D3+kA2hMtbWFIfQR1KxtAIbrg8C40dnYlc+lWIGtQVisNfEAqzPwhyWLyakkRMjZk66/1elPV
 dKGvQlLQ==;
Received: from [194.136.85.206] (port=41242 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rXdXU-0002TR-2b;
 Wed, 07 Feb 2024 10:44:16 +0200
Date: Wed, 7 Feb 2024 10:44:07 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Maxime Ripard <mripard@kernel.org>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240207104407.7b06bac2@eldfell>
In-Reply-To: <d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
 <20240202170734.3176dfe4@xps-13>
 <20240202214527.1d97c881@ferris.localdomain>
 <d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7U02RGhYx/VlMaBtD=1CoDj";
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

--Sig_/7U02RGhYx/VlMaBtD=1CoDj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 6 Feb 2024 14:57:48 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 02/02/24 16:45, Pekka Paalanen wrote:

...

> > Would it be possible to have a standardised benchmark specifically
> > for performance rather than correctness, in IGT or where-ever it
> > would make sense? Then it would be simple to tell contributors to
> > run this and report the numbers before and after.
> >=20
> > I would propose this kind of KMS layout:
> >=20
> > - CRTC size 3841 x 2161
> > - primary plane, XRGB8888, 3639 x 2161 @ 101,0
> > - overlay A, XBGR2101010, 3033 x 1777 @ 201,199
> > - overlay B, ARGB8888, 1507 x 1400 @ 1800,250
> >=20
> > The sizes and positions are deliberately odd to try to avoid happy
> > alignment accidents. The planes are big, which should let the pixel
> > operations easily dominate performance measurement. There are
> > different pixel formats, both opaque and semi-transparent. There is
> > lots of plane overlap. The planes also do not cover the whole CRTC
> > leaving the background visible a bit.
> >=20
> > There should be two FBs per each plane, flipped alternatingly each
> > frame. Writeback should be active. Run this a number of frames, say,
> > 100, and measure the kernel CPU time taken. It's supposed to take at
> > least several seconds in total.
> >=20
> > I think something like this should be the base benchmark. One can
> > add more to it, like rotated planes, YUV planes, etc. or switch
> > settings on the existing planes. Maybe even FB_DAMAGE_CLIPS. Maybe
> > one more overlay that is very tall and thin.
> >=20
> > Just an idea, what do you all think? =20
>=20
> Hi Pekka,
>=20
> I just finished writing this proposal using IGT.
>=20
> I got pretty interesting results:
>=20
> The mentioned commit 8356b97906503a02125c8d03c9b88a61ea46a05a took
> around 13 seconds. While drm-misc/drm-misc-next took 36 seconds.
>=20
> I'm currently bisecting to be certain that the change to the
> pixel-by-pixel is the culprit, but I don't see why it wouldn't be.
>=20
> I just need to do some final touches on the benchmark code and it
> will be ready for revision.

Awesome, thank you very much for doing that!
pq

--Sig_/7U02RGhYx/VlMaBtD=1CoDj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXDQtcACgkQI1/ltBGq
qqfDMA/+OHdgULaTTkKq/qKGNggOmqKIsJHFC7spImj86x3TGqtux3BPoJx0AjfC
DhvbCtp1lB95QdtPxDNn6IOxVLP2OEXwaqYtx7+xh3E8p+Ih4IgxeyDg+1N+jEga
h8PEp6nq4oWC86QCv4wfe4q6fXOtS78zsSXwXaJFlc+m9LNmAfHhlfmIlEc5TUFI
ZiaPWeRi6e6GbnAlRlMdeUlA24hnDgoDXJRy3ofADb8+zDCL5OCieCjiln3DGjH4
qlwSVt2pi5qW3syELecQIMDfJ6m3n6eAmdaRTiRurkVniO9RFASSR0d7q9OtFHHP
KLtzIJmDhk2i8O3dmCrVIZTK4IvOiTadSkLcZLXBct19y0v/Bj3PDcIt1vt4lwpT
+lpxOuXs+lKXm5fleoPgW+8w/uwsLxR7JYXJ71EFLVZeFMQVOjxI+H34oivauMew
N5pP+RSbaqIDkghCvJ2Ef1kBeUfqmce9G8rip7oPQSYgNNnozczLsXX67o+/VFOB
m/w/5853A4kKBwgzXugSYQTA/cmPlGmtJvj6Qy3VMl7jkk13S3rtiodx5SWL2fPP
gcZPhIBW2BFJNQjEoRgygL9FkWWyppWs0BkGIm+SjqfQnwqWifBEhdlmPKAzDj+s
/kgrM8kx0Z0r5Q874ZwlhCKXk7RrqkbzWCtTsLS9Niyf8ZqZcjE=
=x6Do
-----END PGP SIGNATURE-----

--Sig_/7U02RGhYx/VlMaBtD=1CoDj--
