Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FB3820CE
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 22:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ECE6E1F5;
	Sun, 16 May 2021 20:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6366E1F5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 20:09:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F21B5B23D;
 Sun, 16 May 2021 20:09:44 +0000 (UTC)
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210513071918.1728535-1-yangyingliang@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH -next] drm: correct function name
 drm_legacy_ctxbitmap_flush()
Message-ID: <b0ddf30e-d830-5827-e94b-bc0988f644d3@suse.de>
Date: Sun, 16 May 2021 22:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210513071918.1728535-1-yangyingliang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="givjFbxjUnbMn3XKm0wxNJnd1mKLYaJSI"
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
Cc: airlied@linux.ie
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--givjFbxjUnbMn3XKm0wxNJnd1mKLYaJSI
Content-Type: multipart/mixed; boundary="3IfvASNhiwx88RBVq1fNSK77mA0JaFV5G";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie
Message-ID: <b0ddf30e-d830-5827-e94b-bc0988f644d3@suse.de>
Subject: Re: [PATCH -next] drm: correct function name
 drm_legacy_ctxbitmap_flush()
References: <20210513071918.1728535-1-yangyingliang@huawei.com>
In-Reply-To: <20210513071918.1728535-1-yangyingliang@huawei.com>

--3IfvASNhiwx88RBVq1fNSK77mA0JaFV5G
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.05.21 um 09:19 schrieb Yang Yingliang:
> Fix the following make W=3D1 kernel build warning:
>=20
>    drivers/gpu/drm/drm_context.c:136: warning: expecting prototype for =
drm_ctxbitmap_flush(). Prototype was for drm_legacy_ctxbitmap_flush() ins=
tead
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Added to drm-misc-next. Thanks!

Best regards
Thomas

> ---
>   drivers/gpu/drm/drm_context.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_contex=
t.c
> index c99be950bf17..acbec1ddd583 100644
> --- a/drivers/gpu/drm/drm_context.c
> +++ b/drivers/gpu/drm/drm_context.c
> @@ -124,7 +124,7 @@ void drm_legacy_ctxbitmap_cleanup(struct drm_device=20
* dev)
>   }
>  =20
>   /**
> - * drm_ctxbitmap_flush() - Flush all contexts owned by a file
> + * drm_legacy_ctxbitmap_flush() - Flush all contexts owned by a file
>    * @dev: DRM device to operate on
>    * @file: Open file to flush contexts for
>    *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3IfvASNhiwx88RBVq1fNSK77mA0JaFV5G--

--givjFbxjUnbMn3XKm0wxNJnd1mKLYaJSI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmChfAcFAwAAAAAACgkQlh/E3EQov+DN
jA/9Hb6H5MGsHFTbRFJxNkfFQUYDtqiZcxkbGUfZlKwCBP4nvoDuYdk4jtm4La+YNbaivWDCPm7Q
dbJ2ffpzquMblmWDM6k8j37xRTxWepUlcee+gDgcihI/8STjYUT9TGSZ30XkwOcSbhwYDqShsdXS
TaBs2Cbvkr48NTRsNibVOutYwGt3Y/RIz9uVvJJPUsHugDk6g/+Zj/xmrw4phnljRU2FJ8y60Uy5
Y5qK6e2ZuCaH4sY6H7ptVcn1igaHuwqD8ASd2bETM0eNXGXy4gr0kX2T+oYsdN/o15Lt+tRcIPrw
T/mqTGUGTH9uIgROaDA8upaLKUvE1Eb6+ZiFh5sVXtJZT4iL6TjaO4lP8U9YAWmiSrqZpqy92AlH
CZD8uXoLA8EdSaSO6VY5n+OMLo19n0uw1Q69LhW35En//7Dnyp2lQmARGZbYbEs4YoGkAtgoSVjd
GVSEcuxvvqCsURqoghlFbuCN1BPkiWKIR1lTdhB/Rk3wz42wWJI9b3F/R9l964t3zqdV3gBXksG3
J7OCa6nAn6uD7c6ZusRfZY5bSUAxhEfPCJDC4mVxVex+LBjxp6S08Ow9sqKM8RPM7MuqpXd0uzNb
yOsAMLrPOut61chGgIvMMOLpgLXf3CtNQ9JMC9fAyrlM2jddgZLv0QRYjfuv1ALZ80Sld9dtsJuI
0eY=
=4PFJ
-----END PGP SIGNATURE-----

--givjFbxjUnbMn3XKm0wxNJnd1mKLYaJSI--
