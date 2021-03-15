Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B126E33AC68
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 08:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEC58941D;
	Mon, 15 Mar 2021 07:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEDA8941D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 07:43:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0660ABD7;
 Mon, 15 Mar 2021 07:43:29 +0000 (UTC)
To: Paul Cercueil <paul@crapouillou.net>, Christoph Hellwig <hch@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-5-paul@crapouillou.net>
 <20210311122846.GC1739082@infradead.org>
 <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
Message-ID: <9c3c8e15-9e8c-4413-e75b-de989a750954@suse.de>
Date: Mon, 15 Mar 2021 08:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1701647754=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1701647754==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7x3zcl9GuxkElcs3Yao3OfSmPIusCl604"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7x3zcl9GuxkElcs3Yao3OfSmPIusCl604
Content-Type: multipart/mixed; boundary="1d80S5GLvRs1vi8HdXnlPyfLzdbqxjsE0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Christoph Hellwig <hch@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 od@zcrc.me, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Message-ID: <9c3c8e15-9e8c-4413-e75b-de989a750954@suse.de>
Subject: Re: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-5-paul@crapouillou.net>
 <20210311122846.GC1739082@infradead.org>
 <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>
In-Reply-To: <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>

--1d80S5GLvRs1vi8HdXnlPyfLzdbqxjsE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.03.21 um 13:33 schrieb Paul Cercueil:
>=20
>=20
> Le jeu. 11 mars 2021 =C3=A0 12:28, Christoph Hellwig <hch@infradead.org=
> a=20
> =C3=A9crit :
>> On Sun, Mar 07, 2021 at 08:28:34PM +0000, Paul Cercueil wrote:
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 drm_atomic_for_each_plane_damage(&iter, &cl=
ip) {
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < f=
info->num_planes; i++) {
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 daddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
>>> =C2=A0+
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Ignore x1/x2 values, invalidate complete lines */
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 offset =3D clip.y1 * state->fb->pitches[i];
>>> =C2=A0+
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dma_sync_single_for_device(dev, daddr + offset,
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cl=
ip.y2 - clip.y1) * state->fb->pitches[i],
>>> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA=
_TO_DEVICE);
>>
>> Are these helpers only ever used to transfer data to the device and
>> never from it?=C2=A0 If so please clearly document that.
>=20
> Yes. In the DRM world, are there cases where we transfer data from the =

> device? I assume these cases are handled by v4l2 instead.

Software rendering (i.e., anything wrt dumb buffers) likely reads back=20
framebuffer content during blit operations. For devices where this is a=20
slow operation (e.g., PCI read) we set struct=20
drm_mode_config.prefer_shadow to hint renderers to use shadow buffering.

Best regards
Thomas

>=20
> -Paul
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1d80S5GLvRs1vi8HdXnlPyfLzdbqxjsE0--

--7x3zcl9GuxkElcs3Yao3OfSmPIusCl604
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBPECAFAwAAAAAACgkQlh/E3EQov+BQ
OhAAo+n7QqrhXKWvVH/Re+piCvHUYFBgain+soNQJDbYOq5pZEaXmM+a/338ukTX/+kHDcJ6YbgW
x72JTZ4v7mKWvoqcby3a1e0BPsiD3NEHSxctuvkK6JK1ujCujtDTbx7DLjS0oigSPToNe0JUZtR9
Ck4yQWEccXejAETaKU0h9+tQ/+aylFrxX6zqffgivOYPG3BIhqNUa5OZo0QoSsRkx5sUncLz3b1F
gIMV8OPxp8N2a5QHKkcylnmnjOZZgNMtz0a4N7dR8p8p179+w4DN7L6Yj6ctBW6bvMEAaWA0zJCC
7TeE0//ENN57/74fvZq5Q2G23n5F5ImTF/yDanAzvfF9gsu6Mc7tceLEWMqh2msZBDOvfD2p7dOi
wuuB1bEFzIUQ1xXQx2lhy3CoXnU+T+QIub/HkIoVKvgfv//AEWlli9+cvZKo6hv32GDHLQRtlrOy
NV+imFnm79gKkB/B6Z7JuDrAcU49VY0wOoJqLQesPzRaLQkXtABF6WzKPmIyF67IZz/U2PtQ+RU9
35UhNCbffnhPtz3PEqap8b5Tt11mMrr3hY3vK7gbajPdzcPNoXX/J+L7kCTuxpU3wpnMtiG8ssu2
qJ613e5iGyxVlAGP/7cgopCx57GhzoTOOnpfberi7sY7giiy/0cyjNY89zRCpFWiHrDN84hApatz
mWY=
=0TxZ
-----END PGP SIGNATURE-----

--7x3zcl9GuxkElcs3Yao3OfSmPIusCl604--

--===============1701647754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1701647754==--
