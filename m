Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D030FB88
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFF06EE2F;
	Thu,  4 Feb 2021 18:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9096EE2E;
 Thu,  4 Feb 2021 18:34:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2FE0AC45;
 Thu,  4 Feb 2021 18:34:31 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-3-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 02/10] Revert "drm/qxl: do not run release if qxl
 failed to init"
Message-ID: <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
Date: Thu, 4 Feb 2021 19:34:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204145712.1531203-3-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Tong Zhang <ztong0001@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1468339587=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1468339587==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fUCwg7Kcf5XhUz7W2mxvD8yfyNdVSH3DV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fUCwg7Kcf5XhUz7W2mxvD8yfyNdVSH3DV
Content-Type: multipart/mixed; boundary="4nf4HqZJIJd5ZZmzyylTjIkZZmnhoKFoz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Tong Zhang <ztong0001@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
Subject: Re: [PATCH v6 02/10] Revert "drm/qxl: do not run release if qxl
 failed to init"
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-3-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-3-kraxel@redhat.com>

--4nf4HqZJIJd5ZZmzyylTjIkZZmnhoKFoz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.02.21 um 15:57 schrieb Gerd Hoffmann:
> This reverts commit b91907a6241193465ca92e357adf16822242296d.

This should be in the correct format, as given by 'dim cite'.

  dim cite b91907a6241193465ca92e357adf16822242296d
b91907a62411 ("drm/qxl: do not run release if qxl failed to init")

>=20
> Patch is broken, it effectively makes qxl_drm_release() a nop
> because on normal driver shutdown qxl_drm_release() is called
> *after* drm_dev_unregister().
>=20
> Cc: Tong Zhang <ztong0001@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_drv.c | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_dr=
v.c
> index 34c8b25b5780..fb5f6a5e81d7 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -144,8 +144,6 @@ static void qxl_drm_release(struct drm_device *dev)=

>   	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
>   	 * non-trivial though.
>   	 */
> -	if (!dev->registered)
> -		return;

I'm not sure what the original problem was, but I'm sure that this isn't =

the fix for it. If there's a problem with shutdown, the operations=20
rather have to be reordered correctly.

With the citation style address:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   	qxl_modeset_fini(qdev);
>   	qxl_device_fini(qdev);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4nf4HqZJIJd5ZZmzyylTjIkZZmnhoKFoz--

--fUCwg7Kcf5XhUz7W2mxvD8yfyNdVSH3DV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAcPjYFAwAAAAAACgkQlh/E3EQov+Ci
Cg//ZZKtx6YvhV4s/9QZ4Jb7GrH79ZKQGgATuoR0elTnN2QOyUA6Zvo33IQzsQ4sBsWIsystjEQu
wNcvAebdbIj8Hiu87T8+1xfVRrzTo8p0gTo7yqtOs4L3mFA3NAqPkoY82USp+R4vk2szyh5CMHeZ
L9wbNiDcMBXerPz/vpQbLQs0WmhLAG0EBCDz26cnNhQVkn7t0gM76qXRFQzzqSFmkmLIgRtflHFV
7WNu8AAh0gIpCIN8re829yAIEvul4AaoeFIsGDOGnZu+E47m6sj2VEpiQM83/GVarZXGm7UljMQc
yVBnACDlK+uYEyXZIK8vYv1lVZmjg/T0XPBP/n7K00noJORqeXx5qYNuPP9wt60tZfOQVQF2Y6f6
lA6tCp/Din72pvQ4JxRgd3/TTuMI/wM5pHEzO61fFp60rMoBtgDMpWP6O6rT/2+lx1Vfm3ukxzCp
2xzqMKnvlFiH+4Texw067JiZIjfJcXk0dwXjZuevLvilVDFPIkPhGiuSi1dyaxP/T24TxFh/uLjM
lroeQWyPcBhg9tVAyeMZNvqC2GGCo9SH/Sv4sT90F6lu9+9GkZXTgMgg7gnAt1SHTOYiNDTlZ+F2
lSNKqF20h4zJFcsSGtWbD459zb8hlqDsc/pE+y0LbkFjqcR6ExKDUVcM/p/PnT8K3hE+x8G195AQ
gf8=
=Vk0W
-----END PGP SIGNATURE-----

--fUCwg7Kcf5XhUz7W2mxvD8yfyNdVSH3DV--

--===============1468339587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1468339587==--
