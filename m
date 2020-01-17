Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51812140AA4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 14:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4F06E563;
	Fri, 17 Jan 2020 13:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253366E54C;
 Fri, 17 Jan 2020 13:23:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D96C4B116;
 Fri, 17 Jan 2020 13:23:04 +0000 (UTC)
Subject: Re: [PATCH v2 19/21] drm/vkms: Convert to CRTC VBLANK callbacks
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-20-tzimmermann@suse.de>
 <20200115231823.v6uyxtgxnfgwmsqq@smtp.gmail.com>
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
Message-ID: <a8e631e0-5fe5-c53d-e632-0acd90254857@suse.de>
Date: Fri, 17 Jan 2020 14:22:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115231823.v6uyxtgxnfgwmsqq@smtp.gmail.com>
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
Cc: hamohammed.sa@gmail.com, thellstrom@vmware.com, alexandre.torgue@st.com,
 airlied@linux.ie, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com, philippe.cornu@st.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, vincent.abriou@st.com,
 sunpeng.li@amd.com, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, mcoquelin.stm32@gmail.com,
 linux-arm-msm@vger.kernel.org, alexander.deucher@amd.com,
 freedreno@lists.freedesktop.org, sean@poorly.run, yannick.fertre@st.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============0738915997=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0738915997==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PtT6FIrvfqvheyQ046zVtJTcbNj3F21o5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PtT6FIrvfqvheyQ046zVtJTcbNj3F21o5
Content-Type: multipart/mixed; boundary="KDSDKULOECmLQ3OZULODBEBQGxSjeELHt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexandre.torgue@st.com, thellstrom@vmware.com, sean@poorly.run,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, vincent.abriou@st.com, philippe.cornu@st.com,
 yannick.fertre@st.com, alexander.deucher@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Message-ID: <a8e631e0-5fe5-c53d-e632-0acd90254857@suse.de>
Subject: Re: [PATCH v2 19/21] drm/vkms: Convert to CRTC VBLANK callbacks
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-20-tzimmermann@suse.de>
 <20200115231823.v6uyxtgxnfgwmsqq@smtp.gmail.com>
In-Reply-To: <20200115231823.v6uyxtgxnfgwmsqq@smtp.gmail.com>

--KDSDKULOECmLQ3OZULODBEBQGxSjeELHt
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.01.20 um 00:18 schrieb Rodrigo Siqueira:
> Hi,
>=20
> Thanks for the patch, I reviewed and tested it. Everything looks fine
> for VKMS.
>=20
> Reviewed-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>
> Tested-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>

Thanks a lot.

Best regards
Thomas

>=20
> On 01/15, Thomas Zimmermann wrote:
>> VBLANK callbacks in struct drm_driver are deprecated in favor of
>> their equivalents in struct drm_crtc_funcs. Convert vkms over.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/vkms/vkms_crtc.c | 9 ++++++---
>>  drivers/gpu/drm/vkms/vkms_drv.c  | 1 -
>>  drivers/gpu/drm/vkms/vkms_drv.h  | 4 ----
>>  3 files changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/v=
kms_crtc.c
>> index 74f703b8d22a..ac85e17428f8 100644
>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>> @@ -76,10 +76,12 @@ static void vkms_disable_vblank(struct drm_crtc *c=
rtc)
>>  	hrtimer_cancel(&out->vblank_hrtimer);
>>  }
>> =20
>> -bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int p=
ipe,
>> -			       int *max_error, ktime_t *vblank_time,
>> -			       bool in_vblank_irq)
>> +static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>> +				      int *max_error, ktime_t *vblank_time,
>> +				      bool in_vblank_irq)
>>  {
>> +	struct drm_device *dev =3D crtc->dev;
>> +	unsigned int pipe =3D crtc->index;
>>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
>>  	struct vkms_output *output =3D &vkmsdev->output;
>>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>> @@ -154,6 +156,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs=
 =3D {
>>  	.atomic_destroy_state   =3D vkms_atomic_crtc_destroy_state,
>>  	.enable_vblank		=3D vkms_enable_vblank,
>>  	.disable_vblank		=3D vkms_disable_vblank,
>> +	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
>>  	.get_crc_sources	=3D vkms_get_crc_sources,
>>  	.set_crc_source		=3D vkms_set_crc_source,
>>  	.verify_crc_source	=3D vkms_verify_crc_source,
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vk=
ms_drv.c
>> index 25bd7519295f..860de052e820 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -103,7 +103,6 @@ static struct drm_driver vkms_driver =3D {
>>  	.dumb_create		=3D vkms_dumb_create,
>>  	.gem_vm_ops		=3D &vkms_gem_vm_ops,
>>  	.gem_free_object_unlocked =3D vkms_gem_free_object,
>> -	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
>>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>>  	.gem_prime_import_sg_table =3D vkms_prime_import_sg_table,
>> =20
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vk=
ms_drv.h
>> index 7d52e24564db..eda04ffba7b1 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -111,10 +111,6 @@ struct vkms_gem_object {
>>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>>  		   struct drm_plane *primary, struct drm_plane *cursor);
>> =20
>> -bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int p=
ipe,
>> -			       int *max_error, ktime_t *vblank_time,
>> -			       bool in_vblank_irq);
>> -
>>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
>> =20
>>  struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>> --=20
>> 2.24.1
>>
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--KDSDKULOECmLQ3OZULODBEBQGxSjeELHt--

--PtT6FIrvfqvheyQ046zVtJTcbNj3F21o5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4htTQACgkQaA3BHVML
eiPLAwf+JjgGRNTYrmdmAmA3EU3onlZux1nMm1pdgZqFF5d8itMQowodmRWMHIPi
k49/4rvgoVfuTqV1nCh/wjsP9KoRHJaIl3key62QawhwTtK79pCP8kr8b1tzUKOB
KUxvaW+Up8asniyW7mYnn8/AWMWisJdvLFVj/909mcupxoMnxJ2xmPl5Qnm8IDVP
pYVKyTVn0J9E8HHaVG9q48exdS25CJuFwarEAuUH3VVFz1feCT60rNKqhlsXbJTI
U9s4qLlwocOoAgJmemGKdumG+bSt0Phpy4X3Xam790wcfFJ1NLeoek1HRg/cGaUy
xsUdfCiljCuC+gkRNtDf8aDKaQ4aNw==
=wEkd
-----END PGP SIGNATURE-----

--PtT6FIrvfqvheyQ046zVtJTcbNj3F21o5--

--===============0738915997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0738915997==--
