Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C917A75B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 15:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDD089C53;
	Thu,  5 Mar 2020 14:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62B289C53;
 Thu,  5 Mar 2020 14:26:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7757AFFC;
 Thu,  5 Mar 2020 14:26:15 +0000 (UTC)
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v3
To: Gerd Hoffmann <kraxel@redhat.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-7-nirmoy.das@amd.com>
 <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>
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
Message-ID: <6d7146b9-4ac1-e861-334f-950de790321d@suse.de>
Date: Thu, 5 Mar 2020 15:26:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, dri-devel@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============0650509342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0650509342==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IcL3mjIpg8QOLTQKdqMo4XCWLoP4I4ihf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IcL3mjIpg8QOLTQKdqMo4XCWLoP4I4ihf
Content-Type: multipart/mixed; boundary="M6EBuddgRrUpvcUUqpKy1tp8DiqdKIAOh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com
Message-ID: <6d7146b9-4ac1-e861-334f-950de790321d@suse.de>
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v3
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-7-nirmoy.das@amd.com>
 <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>
In-Reply-To: <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>

--M6EBuddgRrUpvcUUqpKy1tp8DiqdKIAOh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.03.20 um 15:07 schrieb Gerd Hoffmann:
> On Thu, Mar 05, 2020 at 02:29:08PM +0100, Nirmoy Das wrote:
>> Calculate GEM VRAM bo's offset within vram-helper without depending on=

>> bo->offset.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index 92a11bb42365..2749c2d25ac4 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -198,6 +198,13 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_=
object *gbo)
>>  }
>>  EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
>>
>> +static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
>> +{
>> +	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
>> +		return 0;
>=20
> returns 0 on error.
>=20
>> +	return gbo->bo.mem.start;
>> +}
>> +
>>  /**
>>   * drm_gem_vram_offset() - \
>>  	Returns a GEM VRAM object's offset in video memory
>> @@ -214,7 +221,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object=
 *gbo)
>>  {
>>  	if (WARN_ON_ONCE(!gbo->pin_count))
>>  		return (s64)-ENODEV;
>=20
> returns -errno on error.
>=20
>> -	return gbo->bo.offset;
>> +	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
>=20
> And given that one calls the other behavior on error should better be
> consistent ...

It is expected that the offset is valid if pin_count is positive.
Anything else would be a massive ref-counting bug. And that's been the
behavior of the old code as well.

But I agree that the current patch is inconsistent. I suggest changing
the return type of drm_gem_vram_pg_offset() to u64.

Best regards
Thomas

>=20
> cheers,
>   Gerd
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
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--M6EBuddgRrUpvcUUqpKy1tp8DiqdKIAOh--

--IcL3mjIpg8QOLTQKdqMo4XCWLoP4I4ihf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5hC/4ACgkQaA3BHVML
eiN96gf/XpIyiLT5fUkpwN28Z2/zROINi1eIIJHeUWsZYoax48tUIMKTkZKw4ixP
a0hZAxnX+VI1b5qZ6qpjCJZ8nRD1ja2k28xLiEeBX7pJESLOH4jYRdRJPK8uoaGA
kVMMVdeFNBMTlw7RQo6KQtWnCHfMTvZ4bKp8X8SH5NmYrginKaFae+mTpkwdTNdz
cE9s7G+jbNQSzLqdc+/12GOj8O8ZsbBZ4J0a6m1VQK63gRdvqT3pnfwKrY3FR9VZ
4yveiKWV0X4Wzs21Ovj3ZZ4oNfZ69ahKpKB2ohzO1vXEX/jrL93Zy+94nmCMXDpt
wx6iR6hUzaPXlg4xnOeLs5Z9TM8zYw==
=JmaV
-----END PGP SIGNATURE-----

--IcL3mjIpg8QOLTQKdqMo4XCWLoP4I4ihf--

--===============0650509342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0650509342==--
