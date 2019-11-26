Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73A10A431
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 19:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CF16E483;
	Tue, 26 Nov 2019 18:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E82E6E483
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 18:50:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCC75AB9B;
 Tue, 26 Nov 2019 18:50:52 +0000 (UTC)
Subject: Re: [PATCH] drm/vram: remove unused definition
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20191126184339.337-1-gurchetansingh@chromium.org>
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
Message-ID: <6263e5ee-8093-96d8-a2eb-2adbaf8b2614@suse.de>
Date: Tue, 26 Nov 2019 19:50:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191126184339.337-1-gurchetansingh@chromium.org>
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
Content-Type: multipart/mixed; boundary="===============0653038353=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0653038353==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="P7y6xTz9VeeJrQfP88gZu5s5lK4TaLpqh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P7y6xTz9VeeJrQfP88gZu5s5lK4TaLpqh
Content-Type: multipart/mixed; boundary="SyJFO44jDqGhun2pGrvic5j9cOUn5Xlhy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
Message-ID: <6263e5ee-8093-96d8-a2eb-2adbaf8b2614@suse.de>
Subject: Re: [PATCH] drm/vram: remove unused definition
References: <20191126184339.337-1-gurchetansingh@chromium.org>
In-Reply-To: <20191126184339.337-1-gurchetansingh@chromium.org>

--SyJFO44jDqGhun2pGrvic5j9cOUn5Xlhy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.11.19 um 19:43 schrieb Gurchetan Singh:
> Commit b0e40e ("vram: Have VRAM MM call GEM VRAM functions directly")
> removed this.
>=20
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! I'll add the patch into drm-misc-next.

Best regards
Thomas

> ---
>  include/drm/drm_gem_vram_helper.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index e040541a105f..08adaf3695ea 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -16,7 +16,6 @@ struct drm_mode_create_dumb;
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
> -struct drm_vram_mm_funcs;
>  struct filp;
>  struct vm_area_struct;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SyJFO44jDqGhun2pGrvic5j9cOUn5Xlhy--

--P7y6xTz9VeeJrQfP88gZu5s5lK4TaLpqh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3ddAgACgkQaA3BHVML
eiOIVAf/VQDFSLRvGM1LqN7XP16DkGIIgGa5INJLcX6pWwrTMpPE+apI4DQ/gN0/
LFq5WiOgEXrhFTvivS3Z2FzcIJeAMIlY7ZY7FFxm8ymLuEOahRuSq3xGe0dglRxY
/X595Oe4AW4G5B08lt/rGIN0kb6bF8vo9sPwUIOajLiE67KYy5C5BykCe9bjf+7i
XyVM2HxobYZZd2OMK1qUobJoJOexExzQ0x05eG/jG5M4zuN+HdzjZXHQ2O8dr92u
FK/HAGkfnBVboKjpk7z5DSFSGiv3rQCmx9b7qLJbg/d9vRC6pUSRqci2jd0yVzSZ
MHmXFdxBh05Yc2k5cZy3x/XZdBgr8w==
=Raat
-----END PGP SIGNATURE-----

--P7y6xTz9VeeJrQfP88gZu5s5lK4TaLpqh--

--===============0653038353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0653038353==--
