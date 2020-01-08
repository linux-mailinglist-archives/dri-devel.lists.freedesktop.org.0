Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A4133D91
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3140589BF5;
	Wed,  8 Jan 2020 08:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA06789BF5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 08:48:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5AB81AD82;
 Wed,  8 Jan 2020 08:48:43 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: add the mode_valid function
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1578471540-43322-1-git-send-email-tiantao6@hisilicon.com>
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
Message-ID: <ae14b728-d2dc-282d-2fed-19bf6db4df64@suse.de>
Date: Wed, 8 Jan 2020 09:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578471540-43322-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============0945938196=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0945938196==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OZ3Z0Rm1PvXry6qAkJcWesTazNMCuYBUx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OZ3Z0Rm1PvXry6qAkJcWesTazNMCuYBUx
Content-Type: multipart/mixed; boundary="ujRMYAIfhnuseeewZLl362zPnio58F1kj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <ae14b728-d2dc-282d-2fed-19bf6db4df64@suse.de>
Subject: Re: [PATCH] drm/hisilicon: add the mode_valid function
References: <1578471540-43322-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1578471540-43322-1-git-send-email-tiantao6@hisilicon.com>

--ujRMYAIfhnuseeewZLl362zPnio58F1kj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

here are a few more nits to fix.

Am 08.01.20 um 09:19 schrieb Tian Tao:
> add mode_valid function, and we can also use it to make suse the resolu=
tion
> is valid.

Start with capital 'Add' and make it a simple sentence. Change 'suse' to
'sure'

>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 20 ++++++++++++++++++=
++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 843d784..6cb7a79 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -242,6 +242,25 @@ static void hibmc_crtc_atomic_disable(struct drm_c=
rtc *crtc,
>  	hibmc_set_current_gate(priv, reg);
>  }
> =20
> +enum drm_mode_status hibmc_crtc_mode_valid(struct drm_crtc *crtc,
> +					const struct drm_display_mode *mode)

Please declare this function as static.

> +{
> +	int i =3D 0;
> +	int vrefresh =3D drm_mode_vrefresh(mode);
> +
> +	if (vrefresh < 59 || vrefresh > 61)
> +		return MODE_NOMODE;

I'd return MODE_NOCLOCK or MODE_CLOCK_RANGE.

> +
> +	for (i =3D 0; i < ARRAY_SIZE(hibmc_pll_table); i++) {
> +		if (hibmc_pll_table[i].hdisplay =3D=3D mode->hdisplay &&
> +			hibmc_pll_table[i].vdisplay =3D=3D mode->vdisplay)
> +			return MODE_OK;
> +	}
> +
> +	return MODE_NOMODE;

Maybe return MODE_BAD. MODE_NOMODE apparently refers to a descriptive
string for the mode.

> +}
> +
> +

One one empty line please.

With these fixes applied, you can add my

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas


>  static unsigned int format_pll_reg(void)
>  {
>  	unsigned int pllreg =3D 0;
> @@ -510,6 +529,7 @@ static const struct drm_crtc_helper_funcs hibmc_crt=
c_helper_funcs =3D {
>  	.atomic_flush	=3D hibmc_crtc_atomic_flush,
>  	.atomic_enable	=3D hibmc_crtc_atomic_enable,
>  	.atomic_disable	=3D hibmc_crtc_atomic_disable,
> +	.mode_valid =3D hibmc_crtc_mode_valid,
>  };
> =20
>  int hibmc_de_init(struct hibmc_drm_private *priv)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ujRMYAIfhnuseeewZLl362zPnio58F1kj--

--OZ3Z0Rm1PvXry6qAkJcWesTazNMCuYBUx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4Vl2cACgkQaA3BHVML
eiOtvQgAl+IKOBGin0jJPitb0wqB32GKS7u8kxNi8XOnM9YrgBAVf1kh2JEKQid4
uwPj9RXDKcvUPvQmPL/vtbnwW4bOC6Ozd5T4hLr/LFURtvLk7KPnLrCYaiYYLlpq
dEy+hgizVw99TzD/os1Y9YipRQcfExiNKQZwoFpNC95csJENwPZuLdQpcacisQpZ
bIo91OvPy/U9vpmqsrNYW7S9CMguPO0fQ2giSRkvVho88zCzsxwahI/SS4Ts0RJk
IXhjiqytFxcRonvLJR272RqdCTH8LodVCbXFbXZTYasTsQDzXHXnz9vZvEK/eZwI
+jl149f6VR4riTxQ5uDKMT9Ei0cWmw==
=QA9q
-----END PGP SIGNATURE-----

--OZ3Z0Rm1PvXry6qAkJcWesTazNMCuYBUx--

--===============0945938196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0945938196==--
