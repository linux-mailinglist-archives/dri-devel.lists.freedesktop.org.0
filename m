Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937612FFDDB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B5189E65;
	Fri, 22 Jan 2021 08:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7049F89E65;
 Fri, 22 Jan 2021 08:06:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 086F7AB9F;
 Fri, 22 Jan 2021 08:06:10 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] drm/qxl: use drmm_mode_config_init
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-2-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8988c58f-6ee1-60b7-58dd-a402040e3bce@suse.de>
Date: Fri, 22 Jan 2021 09:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120111240.2509679-2-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0949134033=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0949134033==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="L5u4lsu2LyjYt2nFvFiZz28cTTZkO1L4F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L5u4lsu2LyjYt2nFvFiZz28cTTZkO1L4F
Content-Type: multipart/mixed; boundary="8WbsdIL5Uw82v3Wn0JToA9byK1kZ0oGHP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <8988c58f-6ee1-60b7-58dd-a402040e3bce@suse.de>
Subject: Re: [PATCH v3 1/4] drm/qxl: use drmm_mode_config_init
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-2-kraxel@redhat.com>
In-Reply-To: <20210120111240.2509679-2-kraxel@redhat.com>

--8WbsdIL5Uw82v3Wn0JToA9byK1kZ0oGHP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 20.01.21 um 12:12 schrieb Gerd Hoffmann:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index 012bce0cdb65..38d6b596094d 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1195,7 +1195,9 @@ int qxl_modeset_init(struct qxl_device *qdev)
>   	int i;
>   	int ret;
>  =20
> -	drm_mode_config_init(&qdev->ddev);
> +	ret =3D drmm_mode_config_init(&qdev->ddev);
> +	if (ret)
> +		return ret;
>  =20
>   	ret =3D qxl_create_monitors_object(qdev);
>   	if (ret)
> @@ -1228,5 +1230,4 @@ int qxl_modeset_init(struct qxl_device *qdev)
>   void qxl_modeset_fini(struct qxl_device *qdev)
>   {
>   	qxl_destroy_monitors_object(qdev);
> -	drm_mode_config_cleanup(&qdev->ddev);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8WbsdIL5Uw82v3Wn0JToA9byK1kZ0oGHP--

--L5u4lsu2LyjYt2nFvFiZz28cTTZkO1L4F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAKh3AFAwAAAAAACgkQlh/E3EQov+Cj
rxAAiqNcLRt/tMMPI7b9KfBqOr7G+fMePF7aVUMfgQmjciB0GV9ScIkclwElPluhFSfG8MRU8zXK
9FwuFFCny0msMQE620P1fe9gLmh1AG8koraebgXyOqYuKnY9BwgUbueOv8sJkeiQt5mjIN0McYRx
GdLVoRO27f2pDv4eBvQbT1FlnV9J7E4D/VMiA6ZayDHwTxN2tw06XEj0J1MQsBagb1cypBy9WbN2
ql1R5AsHKTm4bwhT/+C91qJcCCJB1J7Gg1zX6lOH7pBSQF7JL8a1qvhwQ8+fVKtsIdrvNzj4heja
+HzzyLo+Wq9liMPtzoCKvf2MXEZsSrO/bboSI7lJ9KoH9o3D1QaxbIqaWhHBj0vfxYVfpt3Bxhms
VARBhKRffVTv50K22NQFDwXldIo7jh9mC9NT15Q/ljjdV7cfdMFFKAVqedXqAirgx8JnXSqQW+jX
gctBygpRXK8BlL07XVl2U0v6PR/adrHAXSZcAY57sjWpJmHY8zK8YLqsKLHO6bgrj87wlUSs/CiE
pE63WaorEGMt3kV3sNrjvq7v90WviQjgiw8SiHJaeE4Bnby2jd6Iirrup9sc0/Lw+VsTIcYb7fmh
AF/Fk2E3HhNXLhip1ydVVjMVF3iS+lv4pciAdSMU1SQErAPf+y5WEEiVzH2vfTDpKUz20OyvEkMN
Ljs=
=cNm8
-----END PGP SIGNATURE-----

--L5u4lsu2LyjYt2nFvFiZz28cTTZkO1L4F--

--===============0949134033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0949134033==--
