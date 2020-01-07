Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33805132782
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8F26E067;
	Tue,  7 Jan 2020 13:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4E6E067
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:24:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6475DAD73;
 Tue,  7 Jan 2020 13:24:50 +0000 (UTC)
Subject: Re: [PATCH] drm/modes: tag unused variables to avoid warnings
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 yakui.zhao@intel.com
References: <20191210102437.19377-1-benjamin.gaignard@st.com>
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
Message-ID: <ec3838df-6e8a-b0d9-4b00-2fcd07f97630@suse.de>
Date: Tue, 7 Jan 2020 14:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191210102437.19377-1-benjamin.gaignard@st.com>
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
Content-Type: multipart/mixed; boundary="===============0251871309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0251871309==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LHNsfGAK4PHadNV60bXWhRMsy5DJYiLCb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LHNsfGAK4PHadNV60bXWhRMsy5DJYiLCb
Content-Type: multipart/mixed; boundary="ahJGr5M4OVDuuokVZDWiPJsUaLtTrGqOW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 yakui.zhao@intel.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <ec3838df-6e8a-b0d9-4b00-2fcd07f97630@suse.de>
Subject: Re: [PATCH] drm/modes: tag unused variables to avoid warnings
References: <20191210102437.19377-1-benjamin.gaignard@st.com>
In-Reply-To: <20191210102437.19377-1-benjamin.gaignard@st.com>

--ahJGr5M4OVDuuokVZDWiPJsUaLtTrGqOW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.19 um 11:24 schrieb Benjamin Gaignard:
> Some variables are set but never used. To avoid warning when compiling
> with W=3D1 and keep the algorithm like it is tag theses variables
> with _maybe_unused macro.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> changes in this version:
> - do not modify the code to remove the unused variables
>   just prefix them with __maybe_unused macro.
>  =20
>  drivers/gpu/drm/drm_modes.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 88232698d7a0..70aed4e2990d 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -233,7 +233,7 @@ struct drm_display_mode *drm_cvt_mode(struct drm_de=
vice *dev, int hdisplay,
>  		/* 3) Nominal HSync width (% of line period) - default 8 */
>  #define CVT_HSYNC_PERCENTAGE	8
>  		unsigned int hblank_percentage;
> -		int vsyncandback_porch, vback_porch, hblank;
> +		int vsyncandback_porch, __maybe_unused vback_porch, hblank;
> =20
>  		/* estimated the horizontal period */
>  		tmp1 =3D HV_FACTOR * 1000000  -
> @@ -386,9 +386,10 @@ drm_gtf_mode_complex(struct drm_device *dev, int h=
display, int vdisplay,
>  	int top_margin, bottom_margin;
>  	int interlace;
>  	unsigned int hfreq_est;
> -	int vsync_plus_bp, vback_porch;
> -	unsigned int vtotal_lines, vfieldrate_est, hperiod;
> -	unsigned int vfield_rate, vframe_rate;
> +	int vsync_plus_bp, __maybe_unused vback_porch;
> +	unsigned int vtotal_lines, __maybe_unused vfieldrate_est;
> +	unsigned int __maybe_unused hperiod;
> +	unsigned int vfield_rate, __maybe_unused vframe_rate;
>  	int left_margin, right_margin;
>  	unsigned int total_active_pixels, ideal_duty_cycle;
>  	unsigned int hblank, total_pixels, pixel_freq;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ahJGr5M4OVDuuokVZDWiPJsUaLtTrGqOW--

--LHNsfGAK4PHadNV60bXWhRMsy5DJYiLCb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4Uhp0ACgkQaA3BHVML
eiNdxwf/eBW4rz48DTfwxq5usxvjoxgc2HDvgUYY058/0XJJzuh5lmm3HOWuC32L
dyJjcOGL3rA5jNPk5rqljTS4ZPkyv+sc1VuwBeMGbpJX2lgzCbUnbiPT4+kqdnmY
aqCiC9H3UJRhYkFCb4Viv9zU1Oj9GlF28i0RqipxJmqvF2g4HGH5kjHx0JFDxkzg
+yoZ2eBxlhBrQj+iCA9HQBpUVJgI/ThyTl9kCVP9l4xHfQwGfUa/LXpEYqaL54Sh
cEhrCv/2CDyug0Jz1J6MDfMt/YkNbb4AG2t2NrYEwQhxZ66aNvUyxaMCzvCcYzTW
S1KywNgoGAYqTQzMr+6eQ72yQzLM4A==
=kZQw
-----END PGP SIGNATURE-----

--LHNsfGAK4PHadNV60bXWhRMsy5DJYiLCb--

--===============0251871309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0251871309==--
