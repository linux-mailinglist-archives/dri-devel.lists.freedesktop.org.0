Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F5C3BBC60
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 13:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5168D89919;
	Mon,  5 Jul 2021 11:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E69789911;
 Mon,  5 Jul 2021 11:47:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23BBB2225F;
 Mon,  5 Jul 2021 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625485641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARoYCegrz93ocG6a+eVDla5LtrMzUpZdFhpRJ+P5ZGw=;
 b=vgf2UZ+kd5LqeqrlXq7NE358No+ZT/2ug+TL3kHBV1OZidd70E4qH4V2BkPLHMDTUu61nv
 KGU3qAon8sibwlwAJMvoDteCzzjpIbm2ARFtqnVa1sCxqzqF1meeEyB7veh7ZkObG2qVh1
 MQVWcHNgyyrvgWjLMI/XyqKlJGwXELk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625485641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARoYCegrz93ocG6a+eVDla5LtrMzUpZdFhpRJ+P5ZGw=;
 b=DxjH5gGKpfJjLQ2AyAS7HF9i7FdtO48ODHd70uN3AoL+PHmg0OGPEcVIxjfn2BG3sWPWKz
 TCr2zmT3alLM5ZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C5913A47;
 Mon,  5 Jul 2021 11:47:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBRrNUjx4mBUYQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 11:47:20 +0000
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
 <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
 <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ff1f74bf-e8f8-6144-72aa-924c0eb8e123@suse.de>
Date: Mon, 5 Jul 2021 13:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uIuTY5CJAZwqaqDqkbV3GhEhXe2wUl50N"
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uIuTY5CJAZwqaqDqkbV3GhEhXe2wUl50N
Content-Type: multipart/mixed; boundary="wTYYMCTNG4nOxYLtmyWRNDlQJDP9Os7KZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <ff1f74bf-e8f8-6144-72aa-924c0eb8e123@suse.de>
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
 <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
 <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
In-Reply-To: <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>

--wTYYMCTNG4nOxYLtmyWRNDlQJDP9Os7KZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

will you review my patch?

Best regards
Thomas

Am 24.06.21 um 12:50 schrieb Lucas Stach:
> Am Donnerstag, dem 24.06.2021 um 12:47 +0200 schrieb Thomas Zimmermann:=

>> Hi
>>
>> Am 24.06.21 um 11:11 schrieb Lucas Stach:
>>> Am Donnerstag, dem 24.06.2021 um 10:58 +0200 schrieb Thomas Zimmerman=
n:
>>>> Moving the driver-specific mmap code into a GEM object function allo=
ws
>>>> for using DRM helpers for various mmap callbacks.
>>>>
>>>> The respective etnaviv functions are being removed. The file_operati=
ons
>>>> structure fops is now being created by the helper macro
>>>> DEFINE_DRM_GEM_FOPS().
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
>>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
>>>>    drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-----------=
--
>>>>    drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
>>>>    4 files changed, 7 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm=
/etnaviv/etnaviv_drv.c
>>>> index f0a07278ad04..7dcc6392792d 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>>> @@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioct=
ls[] =3D {
>>>>    	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>>>>    };
>>>>   =20
>>>> -static const struct file_operations fops =3D {
>>>> -	.owner              =3D THIS_MODULE,
>>>> -	.open               =3D drm_open,
>>>> -	.release            =3D drm_release,
>>>> -	.unlocked_ioctl     =3D drm_ioctl,
>>>> -	.compat_ioctl       =3D drm_compat_ioctl,
>>>> -	.poll               =3D drm_poll,
>>>> -	.read               =3D drm_read,
>>>> -	.llseek             =3D no_llseek,
>>>> -	.mmap               =3D etnaviv_gem_mmap,
>>>> -};
>>>> +DEFINE_DRM_GEM_FOPS(fops);
>>>>   =20
>>>>    static const struct drm_driver etnaviv_drm_driver =3D {
>>>>    	.driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
>>>> @@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_drive=
r =3D {
>>>>    	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>>>    	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>>>>    	.gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table=
,
>>>> -	.gem_prime_mmap     =3D etnaviv_gem_prime_mmap,
>>>> +	.gem_prime_mmap     =3D drm_gem_prime_mmap,
>>>>    #ifdef CONFIG_DEBUG_FS
>>>>    	.debugfs_init       =3D etnaviv_debugfs_init,
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm=
/etnaviv/etnaviv_drv.h
>>>> index 003288ebd896..049ae87de9be 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> @@ -47,12 +47,9 @@ struct etnaviv_drm_private {
>>>>    int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>>    		struct drm_file *file);
>>>>   =20
>>>> -int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)=
;
>>>>    int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offs=
et);
>>>>    struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_ob=
ject *obj);
>>>>    int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma=
_buf_map *map);
>>>> -int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>>>> -			   struct vm_area_struct *vma);
>>>>    struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct d=
rm_device *dev,
>>>>    	struct dma_buf_attachment *attach, struct sg_table *sg);
>>>>    int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm=
/etnaviv/etnaviv_gem.c
>>>> index b8fa6ed3dd73..8f1b5af47dd6 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> @@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_g=
em_object *etnaviv_obj,
>>>>    {
>>>>    	pgprot_t vm_page_prot;
>>>>   =20
>>>> -	vma->vm_flags &=3D ~VM_PFNMAP;
>>>> -	vma->vm_flags |=3D VM_MIXEDMAP;
>>>> +	vma->vm_flags |=3D VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDU=
MP;
>>>
>>> I don't fully understand why this change is needed and the commit log=

>>> is silent about it. Excuse my ignorance, but can you please explain t=
he
>>> reasoning behind this change?
>>
>> Sure, sorry for being brief.
>>
>> I worked on cleaning up the deprecated gem_prime_* callbacks in struct=

>> drm_driver. These are supposed to be GEM object functions. The only
>> obsolete gem prime callback in drm_driver is gem_prime_mmap.
>=20
> Sorry, that's a misunderstanding. I see the justification for the patch=

> as a whole. I was asking specifically about the hunk above my comment.
> Why are the vm_flags changed and how did you come up with this exact
> combination of flags?
>=20
> Regards,
> Lucas
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--wTYYMCTNG4nOxYLtmyWRNDlQJDP9Os7KZ--

--uIuTY5CJAZwqaqDqkbV3GhEhXe2wUl50N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDi8UgFAwAAAAAACgkQlh/E3EQov+CY
GQ//dGcCEcFH/YaSFnx/b05/BskFrPmJHfXJmvDwD3oLZm00iXhnIY8JQB80THgDehA+ghlPQq6f
oGnFp090KOJv0petsegDsIxV3vu0pt8lbHIJQQAG8FgHVovBrRsrO2KaaQW4aoc+U4FafuUDPv5w
5QpI4jjbA9nKU2W7cH0T17o4/2DSim7L+yu72jt7PGDjJKTeBtxR+vhfzV29qGxKDEJjEEMk3oph
hvgq83q9yYUAwdRQOW0GnDPcgui6NcDrkdMJ/MR41QbwPn14PGxCrMEVB3BF6DorIsLPNRSRszlq
FX60iBSTFPggdCu/6090/6gh0x3q7uvnSdIiFWJbOkcbjuH8mFr9vX5ZhSB03phtQeFBCkwspAPa
66InWqEIUeCqJAL06j2e1PvBfnAU8nyMKd7I2x1aqnLrAP2D7qo/hd0l7VyJWcn3qhGFyfbHhW7y
HjezVz/9oxRK9gxiAiaojaMMwVM6XLxd5iTVfM26LBwGLFa25Sec7K/m/2mav7Mtathaheadzsl1
AWN1ceLj9lkRh6uRFvHq6g6QfZ8KjgkqM3baHOWwzF4/NEdLx7Wj1RYUuTAPFeTbHj3pflx6CNNW
eVxvAtAU/5r8WcPG4lzArCCfrfblFRlrp+4YObMCICn4BncYH7lGIzu631liLcDFWdF5mZbWxR3b
TQ8=
=Or5B
-----END PGP SIGNATURE-----

--uIuTY5CJAZwqaqDqkbV3GhEhXe2wUl50N--
