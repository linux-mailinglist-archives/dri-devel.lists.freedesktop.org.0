Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F93D01C6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 20:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAD46E4A1;
	Tue, 20 Jul 2021 18:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4046E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 18:36:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D990202FE;
 Tue, 20 Jul 2021 18:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626806217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ejdmA7wY08CEnfbL/V4fbP8SxKxe6S8rRLRcsl3GvRs=;
 b=orny4kRo4t/pQ/MuQa7rvWDI4xF0WlmOuV9vp0zJHF7vnJmCPem/XxiVyKzH9YDphPYTIZ
 VHXR/Ft+kATnp0tcROP/nJDX89xCP3aV53j5tQy4qAMJCNSdyf8DKKa1dcDSgOc1lNvPTk
 jxZd0VhRQIJPwM7qK8Rh+5kP5Z0X1H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626806217;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ejdmA7wY08CEnfbL/V4fbP8SxKxe6S8rRLRcsl3GvRs=;
 b=a7GrDS9lk5IE2dzSDdHc1oSjxTeegPnNjmtK2IM2JGKkCMJobzmIJvAMiCXWJ6CaXiWcne
 FDymqsvV6T0X6sCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 383E913BA3;
 Tue, 20 Jul 2021 18:36:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 8T4kDMkX92BaXAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jul 2021 18:36:57 +0000
Subject: Re: [PATCH 3/7] drm/mipi-dbi: Use framebuffer dma-buf helpers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210716140801.1215-1-tzimmermann@suse.de>
 <20210716140801.1215-4-tzimmermann@suse.de>
 <YPbXmDGDhCo9M0Rd@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6606be12-e999-02ad-da04-00f2c96fd40e@suse.de>
Date: Tue, 20 Jul 2021 20:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbXmDGDhCo9M0Rd@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8JEAWse0JUgozQ0romjnUgdISfVFMCZqx"
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
Cc: david@lechnology.com, airlied@linux.ie, hdegoede@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8JEAWse0JUgozQ0romjnUgdISfVFMCZqx
Content-Type: multipart/mixed; boundary="17X8ka3qZO2phwSTDemjm208Yl4V1Gkks";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 noralf@tronnes.org, hdegoede@redhat.com, david@lechnology.com,
 airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org
Message-ID: <6606be12-e999-02ad-da04-00f2c96fd40e@suse.de>
Subject: Re: [PATCH 3/7] drm/mipi-dbi: Use framebuffer dma-buf helpers
References: <20210716140801.1215-1-tzimmermann@suse.de>
 <20210716140801.1215-4-tzimmermann@suse.de>
 <YPbXmDGDhCo9M0Rd@phenom.ffwll.local>
In-Reply-To: <YPbXmDGDhCo9M0Rd@phenom.ffwll.local>

--17X8ka3qZO2phwSTDemjm208Yl4V1Gkks
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.07.21 um 16:03 schrieb Daniel Vetter:
> On Fri, Jul 16, 2021 at 04:07:57PM +0200, Thomas Zimmermann wrote:
>> Replace dma_buf_begin_cpu_access() with drm_gem_fb_begin_cpu_access();=

>> same for _end_cpu_access(). Remove some boiler-plate code. No function=
al
>> changes.
>>
>> There's one left-over reference to the imported attachment that we
>> keep. GEM BOs with imported attachment are considered uncached and
>> enables special handling within the drm_fb_swab().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_mipi_dbi.c | 20 +++++++-------------
>>   1 file changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi=
_dbi.c
>> index 10b4e59384ae..71b646c4131f 100644
>> --- a/drivers/gpu/drm/drm_mipi_dbi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
>> @@ -7,7 +7,6 @@
>>  =20
>>   #include <linux/debugfs.h>
>>   #include <linux/delay.h>
>> -#include <linux/dma-buf.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/module.h>
>>   #include <linux/regulator/consumer.h>
>> @@ -202,21 +201,17 @@ int mipi_dbi_buf_copy(void *dst, struct drm_fram=
ebuffer *fb,
>>   {
>>   	struct drm_gem_object *gem =3D drm_gem_fb_get_obj(fb, 0);
>>   	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(gem);
>> -	struct dma_buf_attachment *import_attach =3D gem->import_attach;
>>   	void *src =3D cma_obj->vaddr;
>> -	int ret =3D 0;
>> +	int ret;
>>  =20
>> -	if (import_attach) {
>> -		ret =3D dma_buf_begin_cpu_access(import_attach->dmabuf,
>> -					       DMA_FROM_DEVICE);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> +	if (ret)
>> +		return ret;
>>  =20
>>   	switch (fb->format->format) {
>>   	case DRM_FORMAT_RGB565:
>>   		if (swap)
>> -			drm_fb_swab(dst, src, fb, clip, !import_attach);
>> +			drm_fb_swab(dst, src, fb, clip, !gem->import_attach);
>=20
> I freaked out about this because for dma-buf WC vs WB is undefined, but=

> it's purely a perf optimization. So it's fine. Plus we're not even
> bothering with the iomem vs normal memory distinction here.

Indeed. Because of the line above, I made a proto-patchset to store=20
caching flags within struct dma_buf_map. But it's a lot of churn, so I=20
kept the current heuristic for now.

>=20
> Anyway, that aside, all looks good. On the series:
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks.

Best regards
Thomas

>=20
>>   		else
>>   			drm_fb_memcpy(dst, src, fb, clip);
>>   		break;
>> @@ -229,9 +224,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_frameb=
uffer *fb,
>>   		return -EINVAL;
>>   	}
>>  =20
>> -	if (import_attach)
>> -		ret =3D dma_buf_end_cpu_access(import_attach->dmabuf,
>> -					     DMA_FROM_DEVICE);
>> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> +
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(mipi_dbi_buf_copy);
>> --=20
>> 2.32.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--17X8ka3qZO2phwSTDemjm208Yl4V1Gkks--

--8JEAWse0JUgozQ0romjnUgdISfVFMCZqx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD3F8gFAwAAAAAACgkQlh/E3EQov+AH
vw//cl73k/frAwriqvV4VZyhu8KlkOhayH9So7ZYphAqdwzStEcsQXsaz8TBH4dzRGyc94vgnHQi
1/aNbWDr/iAbiPsNxSoQ1y60CF+/vLoij0YAp0eQXGppq/01HrsMp1tvdbY6n+CzLQo1MTvNHVXL
+Y27Qwlw4ZGrUM7UfP5MQ6HhNbixNIIB9pMNluHLMdlhwnxQIgJpO9DGENXq7Dfzl7myo6U8hRA1
E9gdaWOFIHKdWD9cyc+eoOabKeDmCBDQaeDhsaa8Lrp/xr53v/HMzRxn5FOJKF9ykud25+RM1HBh
/1fTPjNjgMJBx99uViKdLRDorIBFavbf3tOWHMQILLIFHsk6inr5zmWz/JJemfdUqz1TFeM12OoF
nGflSckt1/Se6bIiCPMnXUEdBvnx9as0E8gyC7Zhjvaj7PK0+1TWtGB8t2qoqgXaF4i42GPXNnBW
rkt+2MDh+lPpFKZIATVD67Mj9UdM+9RbLPlo5babdNPSz3XFsLVSakltUF7OB1HU9CidxNBLuxaL
fdt/usjXCjVp8ZX3Wq1Mwoji4jIbjKtSy8XIxVXPmMViDarEbHLj5nYSdLM4kHSm1B9QY3jqP+g5
RwVhV9YqY+Bm0AcQj90P+HnVDxNSBiCGbgejcRFfN8q+KzZb7MiJLeSviMEsvKEtPnM/rpsqp8EK
Uvg=
=uW2k
-----END PGP SIGNATURE-----

--8JEAWse0JUgozQ0romjnUgdISfVFMCZqx--
