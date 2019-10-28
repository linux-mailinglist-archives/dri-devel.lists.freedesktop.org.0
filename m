Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D745E75B8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 17:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D359E6E978;
	Mon, 28 Oct 2019 16:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AE76E978
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 16:00:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF1A1B225;
 Mon, 28 Oct 2019 16:00:55 +0000 (UTC)
Subject: Re: [PATCH 0/9] drm/ast: Convert to atomic modesetting
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org, 
 yc_chen@aspeedtech.com
References: <20191028154928.4058-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <0e0e8691-d59e-0ab2-78b6-766446d72b72@suse.de>
Date: Mon, 28 Oct 2019 17:00:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-1-tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1759091980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1759091980==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="76Svyp1qxHiThTYbwV4iS63dYP88YkMNT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--76Svyp1qxHiThTYbwV4iS63dYP88YkMNT
Content-Type: multipart/mixed; boundary="mmJ0PatVDW4WOmdk36PNmPTHiqsdxk9jP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <0e0e8691-d59e-0ab2-78b6-766446d72b72@suse.de>
Subject: Re: [PATCH 0/9] drm/ast: Convert to atomic modesetting
References: <20191028154928.4058-1-tzimmermann@suse.de>
In-Reply-To: <20191028154928.4058-1-tzimmermann@suse.de>

--mmJ0PatVDW4WOmdk36PNmPTHiqsdxk9jP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc: yc_chen@aspeedtech.com)

Am 28.10.19 um 16:49 schrieb Thomas Zimmermann:
> This patch set adds universal planes to ast and converts the driver to
> atomic modesetting.
>=20
> The first patch is purely for clean-up.
>=20
> Patches 2 to 5 prepare the ast modesetting code for universal planes an=
d
> atomic modesetting. The size calculation for each mode has to take doub=
le
> buffering into account. Several functions have to be split to make them=

> work with the separate check and update on CRTCs and planes. There are =
no
> functional changes.
>=20
> Patches 6 to 8 add atomic modesetting code for planes and CRTC. Planes
> immediately provide atomic functions. There's no intermediate step with=

> legacy functions for non-atomic drivers. The cursor plane HW only
> supports ARGB4444, so the cursor plane converts the format internally;
> just as the legacy implementation did.
>=20
> Finally, patch 9 adds missing helpers and enables atomic modesetting. T=
he
> CRTC functions now provide page_flip, which enables Weston support on
> ast hardware.
>=20
> The patchset has been tested by running the fbdev console, X11 (Gnome)
> and Weston on an AST2100 chipset.
>=20
> Thomas Zimmermann (9):
>   drm/ast: Remove last traces of struct ast_gem_object
>   drm/ast: Check video-mode requirements against VRAM size
>   drm/ast: Don't clear base address and offset with default values
>   drm/ast: Split ast_set_ext_reg() into color and threshold function
>   drm/ast: Split ast_set_vbios_mode_info()
>   drm/ast: Add primary plane
>   drm/ast: Add CRTC helpers for atomic modesetting
>   drm/ast: Add cursor plane
>   drm/ast: Enable atomic modesetting
>=20
>  drivers/gpu/drm/ast/ast_drv.c  |  24 +-
>  drivers/gpu/drm/ast/ast_drv.h  |   9 +-
>  drivers/gpu/drm/ast/ast_main.c |  54 +--
>  drivers/gpu/drm/ast/ast_mode.c | 698 ++++++++++++++++++++-------------=

>  4 files changed, 462 insertions(+), 323 deletions(-)
>=20
> --
> 2.23.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mmJ0PatVDW4WOmdk36PNmPTHiqsdxk9jP--

--76Svyp1qxHiThTYbwV4iS63dYP88YkMNT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl23ELEACgkQaA3BHVML
eiMK9wf9G4cc06OTdVVnGAXJA3gAq/xW7qnRW8IMVFssT4i/l0ve9qHNKP/CCszv
aDa+nI3QNj2+/BJ3MnagzElB3T0pdNloLAQU0YudpxQlzSTaE388njUr2Xz/H1cP
kde3K8mi2NPW+dUipubZDQmCpUKNaWFtZuagd2B5bFRjPK4jPKDKIP3freav6qik
w5UomrJYcRtEveYsbDVRR25cMTla/hBZ2F709fTliWxwklJSASFa/q76XrQOlSYy
p9c43kf3RJ/p9ZZOKDjI8bwOs9Luzj4rXZ/8NJsVd6VgOe1RqSuGRoehgInYXFR1
rty+tDrtWi7IdDu5Zk/EIzmNUMBW5Q==
=YlUs
-----END PGP SIGNATURE-----

--76Svyp1qxHiThTYbwV4iS63dYP88YkMNT--

--===============1759091980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1759091980==--
