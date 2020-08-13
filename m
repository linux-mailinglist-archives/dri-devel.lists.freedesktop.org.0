Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBE243B1E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 15:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62F76E9FC;
	Thu, 13 Aug 2020 13:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A156E9F5;
 Thu, 13 Aug 2020 13:57:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5740DB19E;
 Thu, 13 Aug 2020 13:57:59 +0000 (UTC)
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
 <20200813133605.GJ6057@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a8e39798-9812-e325-255a-e6536cb32339@suse.de>
Date: Thu, 13 Aug 2020 15:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813133605.GJ6057@pendragon.ideasonboard.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, amd-gfx@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com, abdiel.janulgue@linux.intel.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, michal.simek@xilinx.com, krzk@kernel.org,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 tomi.valkeinen@ti.com, bskeggs@redhat.com, xen-devel@lists.xenproject.org,
 marek.olsak@amd.com, matthew.auld@intel.com, chunkuang.hu@kernel.org,
 andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, tianci.yin@amd.com, nirmoy.das@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 chris@chris-wilson.co.uk, rodrigosiqueiramelo@gmail.com, hyun.kwon@xilinx.com,
 aaron.liu@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, kgene@kernel.org, alexander.deucher@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Content-Type: multipart/mixed; boundary="===============2101214087=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2101214087==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6
Content-Type: multipart/mixed; boundary="Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, abdiel.janulgue@linux.intel.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, miaoqinglang@huawei.com, kyungmin.park@samsung.com,
 nirmoy.das@amd.com, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Message-ID: <a8e39798-9812-e325-255a-e6536cb32339@suse.de>
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
 <20200813133605.GJ6057@pendragon.ideasonboard.com>
In-Reply-To: <20200813133605.GJ6057@pendragon.ideasonboard.com>

--Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 15:36 schrieb Laurent Pinchart:
> Hi Thomas,
>=20
> Thank you for the patch.
>=20
> On Thu, Aug 13, 2020 at 10:36:43AM +0200, Thomas Zimmermann wrote:
>> The xlnx driver uses CMA helpers with default callback functions.
>> Initialize the driver structure with the rsp CMA helper macro. The
>> driver is being converted to use GEM object functions as part of
>> this change.
>>
>> Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
>> to their default implementations, so they are just kept empty now.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
>>  1 file changed, 1 insertion(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xln=
x/zynqmp_dpsub.c
>> index 26328c76305b..058044dcc062 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver =3D=
 {
>>  	.driver_features		=3D DRIVER_MODESET | DRIVER_GEM |
>>  					  DRIVER_ATOMIC,
>> =20
>> -	.prime_handle_to_fd		=3D drm_gem_prime_handle_to_fd,
>> -	.prime_fd_to_handle		=3D drm_gem_prime_fd_to_handle,
>> -	.gem_prime_export		=3D drm_gem_prime_export,
>> -	.gem_prime_import		=3D drm_gem_prime_import,
>> -	.gem_prime_get_sg_table		=3D drm_gem_cma_prime_get_sg_table,
>> -	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
>> -	.gem_prime_vmap			=3D drm_gem_cma_prime_vmap,
>> -	.gem_prime_vunmap		=3D drm_gem_cma_prime_vunmap,
>> -	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
>> -	.gem_free_object_unlocked	=3D drm_gem_cma_free_object,
>> -	.gem_vm_ops			=3D &drm_gem_cma_vm_ops,
>> -	.dumb_create			=3D zynqmp_dpsub_dumb_create,
>> -	.dumb_destroy			=3D drm_gem_dumb_destroy,
>> +	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_creat=
e),
>=20
> The only effective change here is
>=20
> -	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
> +	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table_vmap=
,
> +	.gem_prime_mmap			=3D drm_gem_prime_mmap,
>=20
> The change is significant, and I have a hard time following the code to=

> verify that it's correct, or if it's an undesired side effect. If it's
> correct, could the change be mentioned in the commit message, with at
> least a brief explanation of why this is correct, and what the
> consequences here ?

I think this is a mistake that I didn't notice. Thanks for spotting it.
Initializing the driver structure
DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE should fix it. I'll change this
for the patch's next revision.

Best regards
Thomas

>=20
>> =20
>>  	.fops				=3D &zynqmp_dpsub_drm_fops,
>> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6--

--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81RswUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPfqAgAoOYcX5UFEbejKi/wGBq3HxlV2lCp
5M6+u8OsIfDWcmroBE+YK419eRwDbsNeDSbzHs7GVQ7SOEeltGdgRpf7QuaUgupn
VJmuMSjAwqbV0l5nyd5DD0Tr2Z/QOxaLAguvxUcSTOdYWAuqLwTo6X5+butu86YB
tEBhKOk6Vzm8C5KA3Loy27We59QzBmDHJ+cdzEhsM1AG0SPJ5sePjMiKFMM3Mo4u
8+HQ3wVLzYAQVhK7Q8bUM/6yIv+AQaAfoNtG3zPI7q9FKKKMbBbTVQV0YeZUKC4T
kIHdnG+dlK834qYxJmlxWwcU8XjHoiAbQYJDfpmjeYw++Xz1MePDB6MG2g==
=PGhi
-----END PGP SIGNATURE-----

--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6--

--===============2101214087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2101214087==--
