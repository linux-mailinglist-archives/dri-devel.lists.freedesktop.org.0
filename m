Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DF1127AC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB0772321;
	Wed,  4 Dec 2019 09:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354C6FFF2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:35:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37E3EAEE9;
 Wed,  4 Dec 2019 09:35:54 +0000 (UTC)
Subject: Re: [PATCH] drm/modes: remove unused variables
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch
References: <20191119134706.10893-1-benjamin.gaignard@st.com>
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
Message-ID: <8056f838-3ebf-26db-f5be-3e78d61aa512@suse.de>
Date: Wed, 4 Dec 2019 10:35:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191119134706.10893-1-benjamin.gaignard@st.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0202187847=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0202187847==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sfffbartdCm1Hzdfhnc51iGLfbb1MgGtC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sfffbartdCm1Hzdfhnc51iGLfbb1MgGtC
Content-Type: multipart/mixed; boundary="lZmjsAE54TEvtdZz45WVLMIwSBvAYr6Mu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <8056f838-3ebf-26db-f5be-3e78d61aa512@suse.de>
Subject: Re: [PATCH] drm/modes: remove unused variables
References: <20191119134706.10893-1-benjamin.gaignard@st.com>
In-Reply-To: <20191119134706.10893-1-benjamin.gaignard@st.com>

--lZmjsAE54TEvtdZz45WVLMIwSBvAYr6Mu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.11.19 um 14:47 schrieb Benjamin Gaignard:
> When compiling with W=3D1 few warnings about unused variables show up.
> This patch removes all the involved variables.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 88232698d7a0..aca901aff042 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -233,7 +233,7 @@ struct drm_display_mode *drm_cvt_mode(struct drm_de=
vice *dev, int hdisplay,
>  		/* 3) Nominal HSync width (% of line period) - default 8 */
>  #define CVT_HSYNC_PERCENTAGE	8
>  		unsigned int hblank_percentage;
> -		int vsyncandback_porch, vback_porch, hblank;
> +		int vsyncandback_porch, hblank;
> =20
>  		/* estimated the horizontal period */
>  		tmp1 =3D HV_FACTOR * 1000000  -
> @@ -249,7 +249,6 @@ struct drm_display_mode *drm_cvt_mode(struct drm_de=
vice *dev, int hdisplay,
>  		else
>  			vsyncandback_porch =3D tmp1;
>  		/* 10. Find number of lines in back porch */
> -		vback_porch =3D vsyncandback_porch - vsync;
>  		drm_mode->vtotal =3D vdisplay_rnd + 2 * vmargin +
>  				vsyncandback_porch + CVT_MIN_V_PORCH;
>  		/* 5) Definition of Horizontal blanking time limitation */
> @@ -386,9 +385,8 @@ drm_gtf_mode_complex(struct drm_device *dev, int hd=
isplay, int vdisplay,
>  	int top_margin, bottom_margin;
>  	int interlace;
>  	unsigned int hfreq_est;
> -	int vsync_plus_bp, vback_porch;
> -	unsigned int vtotal_lines, vfieldrate_est, hperiod;
> -	unsigned int vfield_rate, vframe_rate;
> +	int vsync_plus_bp;
> +	unsigned int vtotal_lines;
>  	int left_margin, right_margin;
>  	unsigned int total_active_pixels, ideal_duty_cycle;
>  	unsigned int hblank, total_pixels, pixel_freq;
> @@ -451,23 +449,9 @@ drm_gtf_mode_complex(struct drm_device *dev, int h=
display, int vdisplay,
>  	/* [V SYNC+BP] =3D RINT(([MIN VSYNC+BP] * hfreq_est / 1000000)) */
>  	vsync_plus_bp =3D MIN_VSYNC_PLUS_BP * hfreq_est / 1000;
>  	vsync_plus_bp =3D (vsync_plus_bp + 500) / 1000;
> -	/*  9. Find the number of lines in V back porch alone: */
> -	vback_porch =3D vsync_plus_bp - V_SYNC_RQD;
>  	/*  10. Find the total number of lines in Vertical field period: */
>  	vtotal_lines =3D vdisplay_rnd + top_margin + bottom_margin +
>  			vsync_plus_bp + GTF_MIN_V_PORCH;
> -	/*  11. Estimate the Vertical field frequency: */
> -	vfieldrate_est =3D hfreq_est / vtotal_lines;
> -	/*  12. Find the actual horizontal period: */
> -	hperiod =3D 1000000 / (vfieldrate_rqd * vtotal_lines);
> -
> -	/*  13. Find the actual Vertical field frequency: */
> -	vfield_rate =3D hfreq_est / vtotal_lines;
> -	/*  14. Find the Vertical frame frequency: */
> -	if (interlaced)
> -		vframe_rate =3D vfield_rate / 2;
> -	else
> -		vframe_rate =3D vfield_rate;

The amount of unused code is quite large, which makes me wonder if
there's something missing below where these variables are supposed to be
used.

If these variables can be removed, comments should mention that steps 9
and 11 to 14 are being left out. After all, the function is fairly
explicit about implementing the GTF algorithm step by step.

Best regards
Thomas

>  	/*  15. Find number of pixels in left margin: */
>  	if (margins)
>  		left_margin =3D (hdisplay_rnd * GTF_MARGIN_PERCENTAGE + 500) /
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lZmjsAE54TEvtdZz45WVLMIwSBvAYr6Mu--

--sfffbartdCm1Hzdfhnc51iGLfbb1MgGtC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3nffYACgkQaA3BHVML
eiMuxQgAujArLx8zCUeLyffw6jwoRdIykRccpQ9vIcfalO67kjMBvuLH4TuYkhxa
TMzgqIViKE9QeQzYuSMtrY+Csvys7Rpy7AF0NgxyrdeQ0cNT/MGlJvdxYpmtxxrz
gpSLC7U4wyPnDbK1co0EIT5FJlIhJ05gQbmd6QAkkFFeBAFHHJ/3eiDsjGptYQIG
pF0OQaDcCDopr8U8f3ZRhySpTXZp1juSDVXTDbIRZpWhgOy8nG8cOXjKhvPQxkuH
8COEua8l9tK+6Cdvd/u7sONBp6envrZxDFqv/TYLmvueGzwYvKXw8SmSyuAhbMI3
sfz+5ROOL9VnH2o7UlF+YLs4q5EUNQ==
=+FHY
-----END PGP SIGNATURE-----

--sfffbartdCm1Hzdfhnc51iGLfbb1MgGtC--

--===============0202187847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0202187847==--
