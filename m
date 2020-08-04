Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD723B54D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD289CF1;
	Tue,  4 Aug 2020 06:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8966E432
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 06:59:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E090ABE2;
 Tue,  4 Aug 2020 06:59:54 +0000 (UTC)
Subject: Re: [PATCH 29/59] drm/vram_helper: call explicit mm takedown
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-30-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <37a13f1a-f3c5-5d95-6e6a-86014143cc5d@suse.de>
Date: Tue, 4 Aug 2020 08:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-30-airlied@gmail.com>
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
Cc: linux-graphics-maintainer@vmware.com, kraxel@redhat.com, sroland@vmware.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============0442356082=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0442356082==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VMlZUKSStGwayPZhEiSORolmAiMqB8QFl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VMlZUKSStGwayPZhEiSORolmAiMqB8QFl
Content-Type: multipart/mixed; boundary="E62ja66OFU9ERo56amFzK4jCV8BFRkNvk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Message-ID: <37a13f1a-f3c5-5d95-6e6a-86014143cc5d@suse.de>
Subject: Re: [PATCH 29/59] drm/vram_helper: call explicit mm takedown
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-30-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-30-airlied@gmail.com>

--E62ja66OFU9ERo56amFzK4jCV8BFRkNvk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.08.20 um 04:56 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index d7c0fdf82eb6..2099851c017e 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1127,6 +1127,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *v=
mm, struct drm_device *dev,
> =20
>  static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
>  {
> +	ttm_range_man_fini(&vmm->bdev, &vmm->bdev.man[TTM_PL_VRAM]);
>  	ttm_bo_device_release(&vmm->bdev);
>  }
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--E62ja66OFU9ERo56amFzK4jCV8BFRkNvk--

--VMlZUKSStGwayPZhEiSORolmAiMqB8QFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8pB1oUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMEZQgAolU+qIHL8RT/YdInXT1LrcjD04Bl
8QsUTCgVjAo+iJScT0nBi3BRe/EcjYX1zz377yjRoRh4mUFUDyZZcK7u/oJdJTIu
ZkIAp0M2qXnpsiqrVTzy8vxJLcft9DjEXvQEs7qdFCFU9Sil84t/+eMNb3+JD/nj
a0BjZVkbtSvFI+STaANa/ji6Cn+aipph/uUqz1KDKvi68qMH0ky2ZYQsbAodegdZ
HdoWJDIsgmKnT3MyxKj1DfVQTA0Zh9lugH6lJ5qgEzgTCMjil6035OufCuVodgAY
5n8XL+YP0mnNFgbtSDzR6MTtAlIiYp8IVy2rKkSLHBg2BGFled5zjkZLaA==
=uoof
-----END PGP SIGNATURE-----

--VMlZUKSStGwayPZhEiSORolmAiMqB8QFl--

--===============0442356082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0442356082==--
