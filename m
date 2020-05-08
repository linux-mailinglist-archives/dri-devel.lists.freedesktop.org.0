Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8261CA46E
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05796EA82;
	Fri,  8 May 2020 06:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D515E6EA7F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:44:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3108EAD80;
 Fri,  8 May 2020 06:44:32 +0000 (UTC)
Subject: Re: [PATCH -next] drm/ast: Make
 ast_primary_plane_helper_atomic_update static
To: Samuel Zou <zou_wei@huawei.com>, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <1588819206-11406-1-git-send-email-zou_wei@huawei.com>
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
Message-ID: <6fab133b-9f94-fff5-8c87-1d7c6d3e9043@suse.de>
Date: Fri, 8 May 2020 08:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1588819206-11406-1-git-send-email-zou_wei@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0767489034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0767489034==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GP1fBK66YqPm2jQR5el3FNevgUmX2CWs1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GP1fBK66YqPm2jQR5el3FNevgUmX2CWs1
Content-Type: multipart/mixed; boundary="9fVXXgiiOXDi9nrlmZbmnDfEj3AyQFBJv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Samuel Zou <zou_wei@huawei.com>, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <6fab133b-9f94-fff5-8c87-1d7c6d3e9043@suse.de>
Subject: Re: [PATCH -next] drm/ast: Make
 ast_primary_plane_helper_atomic_update static
References: <1588819206-11406-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1588819206-11406-1-git-send-email-zou_wei@huawei.com>

--9fVXXgiiOXDi9nrlmZbmnDfEj3AyQFBJv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


I'll add your patch to drm-misc-next. Thanks!

Am 07.05.20 um 04:40 schrieb Samuel Zou:
> Fix the following sparse warning:
>=20
> drivers/gpu/drm/ast/ast_mode.c:564:6: warning:
> symbol 'ast_primary_plane_helper_atomic_update'
> was not declared. Should it be static?
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 7062bcd..4ddf770 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -561,8 +561,9 @@ static int ast_primary_plane_helper_atomic_check(st=
ruct drm_plane *plane,
>  	return 0;
>  }
> =20
> -void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> -					    struct drm_plane_state *old_state)
> +static void
> +ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> +				       struct drm_plane_state *old_state)
>  {
>  	struct ast_private *ast =3D plane->dev->dev_private;
>  	struct drm_plane_state *state =3D plane->state;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9fVXXgiiOXDi9nrlmZbmnDfEj3AyQFBJv--

--GP1fBK66YqPm2jQR5el3FNevgUmX2CWs1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl60/8kACgkQaA3BHVML
eiMhngf/X8nGRb0GfvKmxWPZ/TOQXNxEnOhisWFtUna+M4nCB+ZeW+t+d4gTk9xV
JG9aLgCPlZngs8ZTvnVj614Df8kZ8j8TrGp333d6gSWEJvh0IHrMnL8eOkR2C5iJ
y/uBC9KLE2/jIVNleFVANBGLkUNdf11RzPggGVCv4sKin8RyX91iT5THmfEFHTTs
vZcqsGM1axYGML+f/KjVw2m+w8ivicqQasuwPb991xAg/S96Jw1CFDqVc6FDd4lF
qGElPvFyTGyGvlEs8VCg8KSAGV/bOBbkYvmOpycsFLIfRVpNeb4m/QJOPjq+1EUo
n7pifydfUQIaPDXXEhUF+U0KZAjRpg==
=+xqQ
-----END PGP SIGNATURE-----

--GP1fBK66YqPm2jQR5el3FNevgUmX2CWs1--

--===============0767489034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0767489034==--
