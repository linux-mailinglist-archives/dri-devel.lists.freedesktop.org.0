Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A28982FF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 10:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3B113730;
	Thu,  4 Apr 2024 08:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JlNir8c1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDAC113730;
 Thu,  4 Apr 2024 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712218714;
 bh=tr+/3BHSiT7cgDwM9QfjYH91/67wg1nTfmUhDnFdv5A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JlNir8c153duWcPOGAH8ExiIowoPQj0kIO+IdfUa7WzMH/8z6giLYVQZZB9ZfTUx6
 9sL5xdqDuhd5infoQ38G5ElMQnhx747iLq6iz1aNfgdVUTE6dd1GDprX2BO/LPRNsa
 Bfv0yVTW9oPg504/2NyGS3DkFq3jINutGcaNTcHTmNgU/17rkR0Cbmuq2G1B+cepho
 oaxPryuwHUgm4wCBKRjrH8k7DcE0BQ/V/nAvmJhjdgA7JmOfj1nIp7RCslY3xb4wak
 RUIL4U6SXITLFe3AXlDWQFuYS1EBKGDOl/5hcokFiu076yAzvvKrcu7TH1zuYILF8W
 8bIy0vp+vULpQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4708737813A4;
 Thu,  4 Apr 2024 08:18:34 +0000 (UTC)
Date: Thu, 4 Apr 2024 11:18:16 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/vmwgfx: Sort primary plane formats by order of
 preference
Message-ID: <20240404111816.1139b19c.pekka.paalanen@collabora.com>
In-Reply-To: <CABQX2QPW83H5T9Gc5yT8a277tNgjEvC-xK6wDGewq+vQEYZ=2A@mail.gmail.com>
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-6-zack.rusin@broadcom.com>
 <20240403104246.6c94eea0.pekka.paalanen@collabora.com>
 <CABQX2QPW83H5T9Gc5yT8a277tNgjEvC-xK6wDGewq+vQEYZ=2A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xLJIJtJ/vVAYG5Kj=j1jMe.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/xLJIJtJ/vVAYG5Kj=j1jMe.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Apr 2024 07:44:54 -0400
Zack Rusin <zack.rusin@broadcom.com> wrote:

> On Wed, Apr 3, 2024 at 3:43=E2=80=AFAM Pekka Paalanen
> <pekka.paalanen@collabora.com> wrote:
> >
> > On Tue,  2 Apr 2024 19:28:13 -0400
> > Zack Rusin <zack.rusin@broadcom.com> wrote:
> > =20
> > > The table of primary plane formats wasn't sorted at all, leading to
> > > applications picking our least desirable formats by defaults.
> > >
> > > Sort the primary plane formats according to our order of preference. =
=20
> >
> > This is good.
> > =20
> > > Fixes IGT's kms_atomic plane-invalid-params which assumes that the
> > > preferred format is a 32bpp format. =20
> >
> > That sounds strange, why would IGT depend on preferred format being
> > 32bpp?
> >
> > That must be an oversight. IGT cannot dictate the format that hardware
> > must prefer. XRGB8888 is strongly suggested to be supported in general,
> > but why also preferred? =20
>=20
> I think it's just a side-effect of the pixman's assert that's failing:
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/lib/igt_fb.c#n4190
> i.e. pixman assumes everything is 4 byte aligned.
> I should have rephrased the message as "IGT assumes that the preferred
> fb format is 4 byte aligned because our 16bpp formats are packed and
> pixman can't convert them".

Ah, yes. IIRC Pixman indeed assumes 4-byte alignment for stride and row
start. It should work for 16bpp formats if the FB had even width +
padding in pixels.

I think this is just an indication that Pixman is ill-suited for IGT.
IGT should be able to generate and analyse images in any format any
kernel driver might support.

I've noticed IGT also using Cairo, which limits the possible pixel
formats so severely I'm actually puzzled how it can even be used there.

Anyway, this is not at all about your patch, which looks good and well
to me. Just the comment about adapting to IGT seemed odd. Maybe phrase
that more like a happy accident rather than another justification for
this patch?

This patch:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/xLJIJtJ/vVAYG5Kj=j1jMe.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYOYkgACgkQI1/ltBGq
qqc5mhAAtSqTdPA/asDy/C8a6xyyJ7PjPR/35RXGvt5AZQCQfwu/4yZ4Hute817b
6qN/uXgFbrPlOm+sMYsiRkY56FMYXBD5wzs0qfJswn3K6QsAIn/WxVvYzbdP+uos
wXcF1bmC4vocjjEhX8gG9gO3cjgJkJjpNeAwmHW7TbhhRnNIxHmc7tSg3oniaJpr
tX5C2UAArF/bjKeRPR7Cq4LLIbhOI9RO44pqolCRxrgPPNvXBdWH6coH7MsF3716
7dp/IyvFuQsZV+0jKUCfdv/nwOximXZgpXdIBi4xjLLubceMwPB0Fwi9ArdhvTqK
B4is28flvhoK8MVPTbElaADQ3aguPunKhSNtF05FACIB/0nOQ9GwC8DsSRKDd6Lu
k5VJ+bpNzgazcLdrvOLx+GqbCPgVvaTck5y7Yw1uGE+MgDP4hAP3lmJJI3yTy91D
eLFMvaNT1N0kLhInGYvrmTK2PaPUTneXRFWvFpQ6WYJEtGzoenu4hWe2koTCfVdD
D9HREUEprsCPMiaU8AQJq47xUHo3gHoz56aSxYiWZvNd2WKXSV1HEMoja9bnwhP8
VYbtdI6yfzbx5MfLO3hcbhbozdSlH68V8vMRdtEFfKrM8eBHJlEs5zkWKeJlMiVn
klyia3JDNEAYno5EMKAQgoDTH3Qx0a49SFJP8n+VzseLSrtlSZ0=
=O3H5
-----END PGP SIGNATURE-----

--Sig_/xLJIJtJ/vVAYG5Kj=j1jMe.--
