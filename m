Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E645F714
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE0F6E323;
	Thu,  4 Jul 2019 11:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A436E31A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 11:10:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 389B6AF9F;
 Thu,  4 Jul 2019 11:10:47 +0000 (UTC)
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
 <aa1b7431-21c5-4c99-bfb6-6c5e4946bec3@suse.de>
 <18d573b4-3cb8-dc4a-bee3-a8b9b0a18a28@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <5f9c7df7-3805-0e23-4201-be08d41da791@suse.de>
Date: Thu, 4 Jul 2019 13:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <18d573b4-3cb8-dc4a-bee3-a8b9b0a18a28@tronnes.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============2076526838=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2076526838==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2YlZXm381wi3QxEcCjh15mcEVBeNTERri"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2YlZXm381wi3QxEcCjh15mcEVBeNTERri
Content-Type: multipart/mixed; boundary="RwqlKBf3ad6kiFP0rwq0HbCY7flPMBW2n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <5f9c7df7-3805-0e23-4201-be08d41da791@suse.de>
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
 <aa1b7431-21c5-4c99-bfb6-6c5e4946bec3@suse.de>
 <18d573b4-3cb8-dc4a-bee3-a8b9b0a18a28@tronnes.org>
In-Reply-To: <18d573b4-3cb8-dc4a-bee3-a8b9b0a18a28@tronnes.org>

--RwqlKBf3ad6kiFP0rwq0HbCY7flPMBW2n
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.07.19 um 12:18 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 04.07.2019 09.43, skrev Thomas Zimmermann:
>> Hi
>>
>> Am 03.07.19 um 21:27 schrieb Noralf Tr=C3=B8nnes:
>>>
>>>
>>> Den 03.07.2019 10.32, skrev Thomas Zimmermann:
>>>> DRM client buffers are permanently mapped throughout their lifetime.=
 This
>>>> prevents us from using generic framebuffer emulation for devices wit=
h
>>>> small dedicated video memory, such as ast or mgag200. With fb buffer=
s
>>>> permanently mapped, such devices often won't have enougth space left=
 to
>>>> display other content (e.g., X11).
>>>>
>>>> This patch set introduces unmappable DRM client buffers for framebuf=
fer
>>>> emulation with shadow buffers. While the shadow buffer remains in sy=
stem
>>>> memory permanently, the respective buffer object will only be mapped=
 briefly
>>>> during updates from the shadow buffer. Hence, the driver can relocat=
e he
>>>> buffer object among memory regions as needed.
>>>>
>>>> The default behoviour for DRM client buffers is still to be permanen=
tly
>>>> mapped.
>>>>
>>>> The patch set converts ast and mgag200 to generic framebuffer emulat=
ion
>>>> and removes a large amount of framebuffer code from these drivers. F=
or
>>>> bochs, a problem was reported where the driver could not display the=
 console
>>>> because it was pinned in system memory. [1] The patch set fixes this=
 bug
>>>> by converting bochs to use the shadow fb.
>>>>
>>>> The patch set has been tested on ast and mga200 HW.
>>>>
>>>
>>> I've been thinking, this enables dirty tracking in DRM userspace for
>>> these drivers since the dirty callback is now set on all framebuffers=
=2E
>>> Is this OK? Should we add a drm_fbdev_generic_shadow_setup() that set=
s a
>>> flag enabling the shadow buffer instead?
>>
>> Fbdev emulation is special wrt framebuffer setup and there's no way to=

>> distinguish a regular FB from the fbdev's FB. I've been trying
>> drm_fbdev_generic_shadow_setup(), but ended up duplicating
>> functionality. The problem was that we cannot get state-flag arguments=

>> into drm_fb_helper_generic_probe().
>>
>> There already is struct mode_config.prefer_shadow. It signals shadow F=
B
>> rendering to userspace. The easiest solution is to add
>> prefer_shadow_fbdev as well. If either flag is true, fbdev emulation
>> would enable shadow buffering.
>=20
> How about something like this:

I had something like that in mind, but maybe without a separate
function. I'll post my variant as part of the patch set's next iteration.=


> diff --git a/drivers/gpu/drm/drm_fb_helper.c
> b/drivers/gpu/drm/drm_fb_helper.c
> index 1984e5c54d58..723fe56aa5f5 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -415,7 +415,8 @@ static void drm_fb_helper_dirty_work(struct
> work_struct *work)
>  		/* Generic fbdev uses a shadow buffer */
>  		if (helper->buffer)
>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> -		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> +		if (helper->fb->funcs->dirty)
> +			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
>  	}
>  }
>=20
> @@ -2209,7 +2210,7 @@ int drm_fb_helper_generic_probe(struct
> drm_fb_helper *fb_helper,
>  #endif
>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
>=20
> -	if (fb->funcs->dirty) {
> +	if (fb->funcs->dirty || fb_helper->use_shadow) {
>  		struct fb_ops *fbops;
>  		void *shadow;
>=20
> @@ -2310,6 +2311,44 @@ static const struct drm_client_funcs
> drm_fbdev_client_funcs =3D {
>  	.hotplug	=3D drm_fbdev_client_hotplug,
>  };
>=20
> +static int _drm_fbdev_generic_setup(struct drm_device *dev, unsigned
> int preferred_bpp, bool use_shadow)
> +{
> +	struct drm_fb_helper *fb_helper;
> +	int ret;
> +
> +	WARN(dev->fb_helper, "fb_helper is already set!\n");
> +
> +	if (!drm_fbdev_emulation)
> +		return 0;
> +
> +	fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> +	if (!fb_helper)
> +		return -ENOMEM;
> +
> +	ret =3D drm_client_init(dev, &fb_helper->client, "fbdev",
> &drm_fbdev_client_funcs);
> +	if (ret) {
> +		kfree(fb_helper);
> +		DRM_DEV_ERROR(dev->dev, "Failed to register client: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!preferred_bpp)
> +		preferred_bpp =3D dev->mode_config.preferred_depth;
> +	if (!preferred_bpp)
> +		preferred_bpp =3D 32;
> +	fb_helper->preferred_bpp =3D preferred_bpp;
> +
> +	fb_helper->use_shadow =3D use_shadow;
> +
> +	ret =3D drm_fbdev_client_hotplug(&fb_helper->client);
> +	if (ret)
> +		DRM_DEV_DEBUG(dev->dev, "client hotplug ret=3D%d\n", ret);
> +
> +	drm_client_register(&fb_helper->client);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_fbdev_generic_setup() - Setup generic fbdev emulation
>   * @dev: DRM device
> @@ -2338,38 +2377,13 @@ static const struct drm_client_funcs
> drm_fbdev_client_funcs =3D {
>   */
>  int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int
> preferred_bpp)
>  {
> -	struct drm_fb_helper *fb_helper;
> -	int ret;
> +	return _drm_fbdev_generic_setup(dev, preferred_bpp, false);
> +}
> +EXPORT_SYMBOL(drm_fbdev_generic_setup);
>=20
> -	WARN(dev->fb_helper, "fb_helper is already set!\n");
> -
> -	if (!drm_fbdev_emulation)
> -		return 0;
> -
> -	fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> -	if (!fb_helper)
> -		return -ENOMEM;
> -
> -	ret =3D drm_client_init(dev, &fb_helper->client, "fbdev",
> &drm_fbdev_client_funcs);
> -	if (ret) {
> -		kfree(fb_helper);
> -		DRM_DEV_ERROR(dev->dev, "Failed to register client: %d\n", ret);
> -		return ret;
> -	}
> -
> -	if (!preferred_bpp)
> -		preferred_bpp =3D dev->mode_config.preferred_depth;
> -	if (!preferred_bpp)
> -		preferred_bpp =3D 32;
> -	fb_helper->preferred_bpp =3D preferred_bpp;
> -
> -	ret =3D drm_fbdev_client_hotplug(&fb_helper->client);
> -	if (ret)
> -		DRM_DEV_DEBUG(dev->dev, "client hotplug ret=3D%d\n", ret);
> -
> -	drm_client_register(&fb_helper->client);
> -
> -	return 0;
> +int drm_fbdev_generic_shadow_setup(struct drm_device *dev, unsigned in=
t
> preferred_bpp)
> +{
> +	return _drm_fbdev_generic_setup(dev, preferred_bpp, true);
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
>=20
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index c8a8ae2a678a..39f063de8cbc 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -186,6 +186,8 @@ struct drm_fb_helper {
>  	 * See also: @deferred_setup
>  	 */
>  	int preferred_bpp;
> +
> +	bool use_shadow;
>  };
>=20
>  static inline struct drm_fb_helper *
>=20
>=20
>>
>> I'm not sure if we should check for the dirty() callback at all.
>>
>=20
> Hm, why do you think that?

Drivers may already come with their own shadow buffer. Cirrus is an
example of that. It uses shmem buffer objects as shadow fbs and
internally updates the device frame buffer in its dirty callback. Using
dirty() to select the shadow fbdev adds another buffer (and another
memcpy) for no reason.

Best regards
Thomas

> The thing with fbdev defio is that it only supports kmalloc and vmalloc=

> allocated memory (page->lru is avail.). This means that only the CMA
> drivers can use defio without shadow memory. To keep things simple
> everyone with a dirty() callback gets a shadow buffer.
>=20
> Noralf.
>=20
>> Best regards
>> Thomas
>>
>>> Really nice diffstat by the way :-)
>>>
>>> Noralf.
>>>
>>>> [1] https://lists.freedesktop.org/archives/dri-devel/2019-June/22442=
3.html
>>>>
>>>> Thomas Zimmermann (5):
>>>>   drm/client: Support unmapping of DRM client buffers
>>>>   drm/fb-helper: Unmap BO for shadow-buffered framebuffer console
>>>>   drm/ast: Replace struct ast_fbdev with generic framebuffer emulati=
on
>>>>   drm/bochs: Use shadow buffer for bochs framebuffer console
>>>>   drm/mgag200: Replace struct mga_fbdev with generic framebuffer
>>>>     emulation
>>>>
>>>>  drivers/gpu/drm/ast/Makefile           |   2 +-
>>>>  drivers/gpu/drm/ast/ast_drv.c          |  22 +-
>>>>  drivers/gpu/drm/ast/ast_drv.h          |  17 --
>>>>  drivers/gpu/drm/ast/ast_fb.c           | 341 ----------------------=
---
>>>>  drivers/gpu/drm/ast/ast_main.c         |  30 ++-
>>>>  drivers/gpu/drm/ast/ast_mode.c         |  21 --
>>>>  drivers/gpu/drm/bochs/bochs_kms.c      |   2 +-
>>>>  drivers/gpu/drm/drm_client.c           |  71 ++++-
>>>>  drivers/gpu/drm/drm_fb_helper.c        |  14 +-
>>>>  drivers/gpu/drm/mgag200/Makefile       |   2 +-
>>>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
>>>>  drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 ----------------------=

>>>>  drivers/gpu/drm/mgag200/mgag200_main.c |  61 +++--
>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c |  27 --
>>>>  include/drm/drm_client.h               |   3 +
>>>>  15 files changed, 154 insertions(+), 787 deletions(-)
>>>>  delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
>>>>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c
>>>>
>>>> --
>>>> 2.21.0
>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--RwqlKBf3ad6kiFP0rwq0HbCY7flPMBW2n--

--2YlZXm381wi3QxEcCjh15mcEVBeNTERri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0d3rEACgkQaA3BHVML
eiPm+Af+OvNUALsoY8KQs6rDNvix4ePovOVG3hdYnr62xO4rv5t0JFkq4wztoOky
Ld2WCeR/bYz8kudKoO2A1KdQRpXVYYKndk1bccLpUPSiMld1nMxD1sT8wHzd5qtv
Bu14RLjwfIYznpN6exSoi1ZlcqQNd7GViZ/mL9OTUfgKy2/58hbIzVxSuy0DDnyL
PZJmpUpG8OtrwBFasgNGCjrxg+SIz021sDq+LJbFCg3+0eIW/77ZYAaybGeyfNKz
DxmZdqaEUBr44rodrrdFcCarl17B0YEsfqVj+VSyi0wnpQ1j72vXdktD533bDlsb
FqZCiDveYknwqqqDpRgAWB+ykHWKWA==
=Xs81
-----END PGP SIGNATURE-----

--2YlZXm381wi3QxEcCjh15mcEVBeNTERri--

--===============2076526838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2076526838==--
