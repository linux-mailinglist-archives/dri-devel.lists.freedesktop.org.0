Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0A3C232B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 13:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB6F6EA16;
	Fri,  9 Jul 2021 11:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3EA6EA16
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 11:51:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5481E20271;
 Fri,  9 Jul 2021 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625831502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EfXUD6snF5PCkxEROmmAApGT0vt1IbHmTV2LpWGrtVs=;
 b=bFl8X8gHXVN1X4+xtte1ulM82DFG/RTEIM66FASVDKybiPb8fqvGYoUF9tAe9ChTyc3yYd
 ktrzb8q10XnOMEt2ensHDEZwzgIW8eLkisKNFpko5lcprGFvQzpk2muGsdnwiGAo0D6F/m
 1D5l4Qe0RdS77b3debJI/Pz2iEsfABY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625831502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EfXUD6snF5PCkxEROmmAApGT0vt1IbHmTV2LpWGrtVs=;
 b=xGjIUSeSJTXiKU/s/Nj1MvhfLsiOhb5tRbpjQ0hSjBrMt6YlvR2TEfCNEHS1+EQibBGuGY
 I2M00EcFXQMwvUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FF7913522;
 Fri,  9 Jul 2021 11:51:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h+W6Bk446GDoBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jul 2021 11:51:42 +0000
Subject: Re: [PATCH] drm/vgem: Implement mmap as GEM object function
To: Daniel Vetter <daniel@ffwll.ch>,
 "Syrjala, Ville" <ville.syrjala@linux.intel.com>
References: <20210624095238.8804-1-tzimmermann@suse.de>
 <CAKMK7uEe_JaT7kBopoZtgNW_3rDgn-nr2fbycmVuGQAUsb34tA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c1131f8b-950e-6f2d-4e6c-60e7c2fa4fb7@suse.de>
Date: Fri, 9 Jul 2021 13:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEe_JaT7kBopoZtgNW_3rDgn-nr2fbycmVuGQAUsb34tA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4DOsEfS5GZc7UraYXDyYDgpuiW9U5Cyfz"
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4DOsEfS5GZc7UraYXDyYDgpuiW9U5Cyfz
Content-Type: multipart/mixed; boundary="Z2vvROmcoE10w2mm32FiFK0HpyQ5dObeb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 "Syrjala, Ville" <ville.syrjala@linux.intel.com>
Cc: Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Lee Jones <lee.jones@linaro.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <c1131f8b-950e-6f2d-4e6c-60e7c2fa4fb7@suse.de>
Subject: Re: [PATCH] drm/vgem: Implement mmap as GEM object function
References: <20210624095238.8804-1-tzimmermann@suse.de>
 <CAKMK7uEe_JaT7kBopoZtgNW_3rDgn-nr2fbycmVuGQAUsb34tA@mail.gmail.com>
In-Reply-To: <CAKMK7uEe_JaT7kBopoZtgNW_3rDgn-nr2fbycmVuGQAUsb34tA@mail.gmail.com>

--Z2vvROmcoE10w2mm32FiFK0HpyQ5dObeb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.21 um 23:37 schrieb Daniel Vetter:
> On Thu, Jun 24, 2021 at 11:52 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>> Moving the driver-specific mmap code into a GEM object function allows=

>> for using DRM helpers for various mmap callbacks.
>>
>> The respective vgem functions are being removed. The file_operations
>> structure vgem_driver_fops is now being created by the helper macro
>> DEFINE_DRM_GEM_FOPS().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Might be this one, might be a different one (there's also a bunch of
> core kernel patches that got into drm-tip together with this patch),
> but vgem goes boom after this landed in CI:
>=20
> https://intel-gfx-ci.01.org/tree/drm-tip/igt@vgem_basic@unload.html
>=20
> Can you pls take a quick look? It's in dma-buf fault stuff, so not
> entirely unlikely. Ville pointed this out on irc.

The patch at

=20
https://lore.kernel.org/dri-devel/20210709114731.31467-1-tzimmermann@suse=
=2Ede/T/#u

fixes the issue for me.

Best regards
Thomas

> -Daniel
>=20
>> ---
>>   drivers/gpu/drm/vgem/vgem_drv.c | 46 ++++---------------------------=
--
>>   1 file changed, 5 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vg=
em_drv.c
>> index bf38a7e319d1..df634aa52638 100644
>> --- a/drivers/gpu/drm/vgem/vgem_drv.c
>> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
>> @@ -239,32 +239,7 @@ static struct drm_ioctl_desc vgem_ioctls[] =3D {
>>          DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl,=
 DRM_RENDER_ALLOW),
>>   };
>>
>> -static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
>> -{
>> -       unsigned long flags =3D vma->vm_flags;
>> -       int ret;
>> -
>> -       ret =3D drm_gem_mmap(filp, vma);
>> -       if (ret)
>> -               return ret;
>> -
>> -       /* Keep the WC mmaping set by drm_gem_mmap() but our pages
>> -        * are ordinary and not special.
>> -        */
>> -       vma->vm_flags =3D flags | VM_DONTEXPAND | VM_DONTDUMP;
>> -       return 0;
>> -}
>> -
>> -static const struct file_operations vgem_driver_fops =3D {
>> -       .owner          =3D THIS_MODULE,
>> -       .open           =3D drm_open,
>> -       .mmap           =3D vgem_mmap,
>> -       .poll           =3D drm_poll,
>> -       .read           =3D drm_read,
>> -       .unlocked_ioctl =3D drm_ioctl,
>> -       .compat_ioctl   =3D drm_compat_ioctl,
>> -       .release        =3D drm_release,
>> -};
>> +DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
>>
>>   static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
>>   {
>> @@ -387,24 +362,12 @@ static void vgem_prime_vunmap(struct drm_gem_obj=
ect *obj, struct dma_buf_map *ma
>>          vgem_unpin_pages(bo);
>>   }
>>
>> -static int vgem_prime_mmap(struct drm_gem_object *obj,
>> -                          struct vm_area_struct *vma)
>> +static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area=
_struct *vma)
>>   {
>> -       int ret;
>> -
>> -       if (obj->size < vma->vm_end - vma->vm_start)
>> -               return -EINVAL;
>> -
>> -       if (!obj->filp)
>> -               return -ENODEV;
>> -
>> -       ret =3D call_mmap(obj->filp, vma);
>> -       if (ret)
>> -               return ret;
>> -
>>          vma_set_file(vma, obj->filp);
>>          vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP;
>>          vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vm=
a->vm_flags));
>> +       vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>>
>>          return 0;
>>   }
>> @@ -416,6 +379,7 @@ static const struct drm_gem_object_funcs vgem_gem_=
object_funcs =3D {
>>          .get_sg_table =3D vgem_prime_get_sg_table,
>>          .vmap =3D vgem_prime_vmap,
>>          .vunmap =3D vgem_prime_vunmap,
>> +       .mmap =3D vgem_prime_mmap,
>>          .vm_ops =3D &vgem_gem_vm_ops,
>>   };
>>
>> @@ -433,7 +397,7 @@ static const struct drm_driver vgem_driver =3D {
>>          .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>>          .gem_prime_import =3D vgem_prime_import,
>>          .gem_prime_import_sg_table =3D vgem_prime_import_sg_table,
>> -       .gem_prime_mmap =3D vgem_prime_mmap,
>> +       .gem_prime_mmap =3D drm_gem_prime_mmap,
>>
>>          .name   =3D DRIVER_NAME,
>>          .desc   =3D DRIVER_DESC,
>> --
>> 2.32.0
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Z2vvROmcoE10w2mm32FiFK0HpyQ5dObeb--

--4DOsEfS5GZc7UraYXDyYDgpuiW9U5Cyfz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDoOE0FAwAAAAAACgkQlh/E3EQov+A5
Ag//VjpMhAcBr3SwsbJbrSwFozKpF4UPWcW4l59tQHFe4O5M+8icgYJl4NiOgXo2UEA2HAHtayCg
wLWMokXqLCfvq3iWzt8vJ/oJvhTDftpkKr/4qlTzlz01E4rAwqN/9M8PF6dhpqp4ZFqatB9jRh8x
dU0jrP3wefDs6gX4jNP9WQggABz/8gNJD9e9eD9juUmGk6HYEbpfYdTqgtCn7o8Rd3nIabuuPFUD
RAhYpbqLbHEkdKVUUxExK0bjD0p8ZcEO//NVUVjlz0T1y8SwQv66CdqeZOgehcdtKpIlsQWJ2+4b
efSNXmmEEma+z1xjFA9X3nXHE1fs6p1BP7cAejbbvJ7Ze4/zo9/b+NUvN9p9L8+bFA6mI0UwaH7R
F66+x9jgxn5V5zGQV0o2KpxzlziyT8ySd46/EwxBr80/RWnEp68CB1SXuPxV3c5a6PbZ2oNmcl4v
DVBiGsXheh2Iq/l4azxSafOVr0Y60dBakfNWoDxkxDNSTuJT+6Nq7zmOyj26umZoa4qVxD8VyeaB
ThOJ/4zUhxxi5lpmhvE84oxD1D4TOSILNjkyQ0XrMpkuHc1rLIuWa3PEr3KScPaonTpEksiH1RzP
zltHtdLrMlKvGK5SFLJnCPNIh/cWw3F8Xho5Um4d9RRmF8MP5NoEChbK37r8B2F2fXLCSkdW3381
ujM=
=FDFT
-----END PGP SIGNATURE-----

--4DOsEfS5GZc7UraYXDyYDgpuiW9U5Cyfz--
