Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773532485AB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 15:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4FC89C6B;
	Tue, 18 Aug 2020 13:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10B89C6B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 13:10:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A56FBB15D;
 Tue, 18 Aug 2020 13:10:24 +0000 (UTC)
Subject: Re: fbdevdrm
To: Nnext unnnext <clashclanacc2602@gmail.com>
References: <CAGbygg03ViV=OjMTxO4CfoX8MJCggKHviO9pJBrdOFPg_AZSLg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <93ed4bc8-2ef2-6a7b-af70-3368369c0a4c@suse.de>
Date: Tue, 18 Aug 2020 15:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGbygg03ViV=OjMTxO4CfoX8MJCggKHviO9pJBrdOFPg_AZSLg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0561330778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0561330778==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Vh6ZmO3drMVaEyjXdQA6t0WuMz5zbHKKa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Vh6ZmO3drMVaEyjXdQA6t0WuMz5zbHKKa
Content-Type: multipart/mixed; boundary="YTvWcB4wnVxoH73VAPhdCuWS7VOjqvvHH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nnext unnnext <clashclanacc2602@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <93ed4bc8-2ef2-6a7b-af70-3368369c0a4c@suse.de>
Subject: Re: fbdevdrm
References: <CAGbygg03ViV=OjMTxO4CfoX8MJCggKHviO9pJBrdOFPg_AZSLg@mail.gmail.com>
In-Reply-To: <CAGbygg03ViV=OjMTxO4CfoX8MJCggKHviO9pJBrdOFPg_AZSLg@mail.gmail.com>

--YTvWcB4wnVxoH73VAPhdCuWS7VOjqvvHH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc'ing dri-devel. It's public information that others should be able to
find.)

Hi Mark,

generally speaking, what you try to do should be possible with
fbconv/fbdevdrm.

Am 17.08.20 um 21:12 schrieb Nnext unnnext:
> Hey Thomas!
>=20
> I am working on postmarketOS, mobile Alpine Linux distribution, and I
> got really excited when saw your fbdevdrm project. While pmOS encourage=

> mainlining,=C2=A0 most mobile devices often use old kernels(3.*-4.*), a=
nd so
> can't run any modern compositor which uses drm. Most of them utilize
> fbdev though. So if it's possible to run drm on top of fbdev, that woul=
d
> be really cool! However, I have some questions about the project. First=
,
> can it be brought to downstream devices? Second, is it in working state=
?

It works for all the desktop graphics cards that I was able to get my
hands on. I'd expect that other hardware works as well. The latest
snapshot is at

  https://gitlab.freedesktop.org/tzimmermann/linux/-/commits/fbconv/

for Linux v5.4. It should be possible to back-port it to earlier kernels.=


The code depends on fbdev (which hasn't changed in a decade), simple-kms
helpers and SHMEM. The latter are DRM helper libraries that you may need
to backport as well.

In the commit history, you'll find that I created each DRM driver from
the fbdev driver and a DRM skeleton driver. That gives a basic driver
without HW acceleration.

I guess if you use Android you cannot always copy around fbdev drivers
easily. If you still can build your own kernel, you may want to take a
look at an earlier approach available at

  https://lists.freedesktop.org/archives/dri-devel/2019-March/211970.html=


It hooks into the fbdev device registering and creates a DRM device
whenever an fbdev device becomes available; all without having to copy
the fbdev driver into DRM.

Let me know if you have more detailed questions on either option.

> Third, is it upstreamed somewhere?=20

Nope and won't be. It's meant as a helper for porting fbdev drivers to
DRM. The expectation is that only the converted driver is merged in its
final state.

If none of this works, you could attempt to back-port the whole DRM
subsystem to these old kernels. A lot of mobile hardware has DRM drivers
these days.

Best regards
Thomas

>=20
> Thank you for your contribution!
>=20
> Sincerely,
> Mark.

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YTvWcB4wnVxoH73VAPhdCuWS7VOjqvvHH--

--Vh6ZmO3drMVaEyjXdQA6t0WuMz5zbHKKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl870yMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPAtgf+N0TBriQ75b5MsUM2/XihTJc4q1nD
//U8g17gmrQuzMu7SeCrXaJxdnvpf8Lw8HzFSDACZsJFOEic7cV3DWuDknv+gM9r
Dx7Ir7heH2dNGSYKRcXuQUnc8W1E7a7rqHdW3V7MoolRnJfz7Ux/tGALPvgowgo6
q1Xznq9p913du5fhMN6VA31LPp21wXm2DJp0hP2JdYW6XST9L28PUrubF7m19Ic7
WQ4r+ZObCHZkws4Ft4d/kUU9c/FntN7tmLcanpfmBlajRF7riKPhliX+Em4lEMGh
Vzp1NWhD3q0D3e4bgb40bwPAEFf6zUkh7muruLwroE/i2JhzfBHubEgxKA==
=3NLE
-----END PGP SIGNATURE-----

--Vh6ZmO3drMVaEyjXdQA6t0WuMz5zbHKKa--

--===============0561330778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0561330778==--
