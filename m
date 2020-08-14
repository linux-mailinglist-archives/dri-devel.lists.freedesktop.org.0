Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE8244513
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 08:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A429E6EB14;
	Fri, 14 Aug 2020 06:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB216EB14
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:47:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 066DAAC46;
 Fri, 14 Aug 2020 06:47:56 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] drm/gem: Update client API to use struct
 drm_gem_membuf
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200806085239.4606-1-tzimmermann@suse.de>
 <20200806085239.4606-3-tzimmermann@suse.de>
 <20200813102618.GL2352366@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <aa735e3b-ca63-5a97-4aa3-9763720771d8@suse.de>
Date: Fri, 14 Aug 2020 08:47:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813102618.GL2352366@phenom.ffwll.local>
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
Cc: sean@poorly.run, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, kraxel@redhat.com, airlied@redhat.com, zou_wei@huawei.com,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0802406669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0802406669==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JMd5ka9O0nEA390us4tBWnPDPoz5fjUbR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JMd5ka9O0nEA390us4tBWnPDPoz5fjUbR
Content-Type: multipart/mixed; boundary="TsxvfHJ5D2M6HjLcLvAbKaW7VNzUzWnhL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: emil.l.velikov@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, kraxel@redhat.com,
 airlied@redhat.com, zou_wei@huawei.com, sean@poorly.run
Message-ID: <aa735e3b-ca63-5a97-4aa3-9763720771d8@suse.de>
Subject: Re: [PATCH v2 2/4] drm/gem: Update client API to use struct
 drm_gem_membuf
References: <20200806085239.4606-1-tzimmermann@suse.de>
 <20200806085239.4606-3-tzimmermann@suse.de>
 <20200813102618.GL2352366@phenom.ffwll.local>
In-Reply-To: <20200813102618.GL2352366@phenom.ffwll.local>

--TsxvfHJ5D2M6HjLcLvAbKaW7VNzUzWnhL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 12:26 schrieb Daniel Vetter:
> On Thu, Aug 06, 2020 at 10:52:37AM +0200, Thomas Zimmermann wrote:
>> GEM's vmap interface now wraps memory pointers in struct drm_gem_membu=
f.
>> The structure represents a pointer into the framebuffer, which is eith=
er
>> in I/O memory or in system memory. The structure contains a flag that
>> distinguishes these cases.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_client.c    | 25 ++++++++++++-------------
>>  drivers/gpu/drm/drm_fb_helper.c | 18 +++++++++---------
>>  drivers/gpu/drm/drm_gem.c       | 19 +++++++++++--------
>>  drivers/gpu/drm/drm_internal.h  |  5 +++--
>>  drivers/gpu/drm/drm_prime.c     | 16 ++++++++++------
>>  include/drm/drm_client.h        |  7 ++++---
>>  include/drm/drm_device.h        | 26 ++++++++++++++++++++++++++
>>  7 files changed, 75 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client=
=2Ec
>> index 495f47d23d87..0359b82928c1 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -234,7 +234,7 @@ static void drm_client_buffer_delete(struct drm_cl=
ient_buffer *buffer)
>>  {
>>  	struct drm_device *dev =3D buffer->client->dev;
>> =20
>> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> +	drm_gem_vunmap(buffer->gem, &buffer->membuf);
>> =20
>>  	if (buffer->gem)
>>  		drm_gem_object_put(buffer->gem);
>> @@ -302,12 +302,13 @@ drm_client_buffer_create(struct drm_client_dev *=
client, u32 width, u32 height, u
>>   * Returns:
>>   *	The mapped memory's address
>>   */
>> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>> +const struct drm_gem_membuf *
>> +drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>>  {
>> -	void *vaddr;
>> +	int ret;
>> =20
>> -	if (buffer->vaddr)
>> -		return buffer->vaddr;
>> +	if (buffer->membuf.vaddr)
>> +		return &buffer->membuf;
>> =20
>>  	/*
>>  	 * FIXME: The dependency on GEM here isn't required, we could
>> @@ -317,13 +318,11 @@ void *drm_client_buffer_vmap(struct drm_client_b=
uffer *buffer)
>>  	 * fd_install step out of the driver backend hooks, to make that
>>  	 * final step optional for internal users.
>>  	 */
>> -	vaddr =3D drm_gem_vmap(buffer->gem);
>> -	if (IS_ERR(vaddr))
>> -		return vaddr;
>> -
>> -	buffer->vaddr =3D vaddr;
>> +	ret =3D drm_gem_vmap(buffer->gem, &buffer->membuf);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> =20
>> -	return vaddr;
>> +	return &buffer->membuf;
>>  }
>>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>> =20
>> @@ -337,8 +336,8 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>>   */
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>>  {
>> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> -	buffer->vaddr =3D NULL;
>> +	drm_gem_vunmap(buffer->gem, &buffer->membuf);
>> +	buffer->membuf.vaddr =3D NULL;
>>  }
>>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
>> =20
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index 8697554ccd41..da24874247e7 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -394,7 +394,7 @@ static void drm_fb_helper_dirty_blit_real(struct d=
rm_fb_helper *fb_helper,
>>  	unsigned int cpp =3D fb->format->cpp[0];
>>  	size_t offset =3D clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>>  	void *src =3D fb_helper->fbdev->screen_buffer + offset;
>> -	void *dst =3D fb_helper->buffer->vaddr + offset;
>> +	void *dst =3D fb_helper->buffer->membuf.vaddr + offset;
>>  	size_t len =3D (clip->x2 - clip->x1) * cpp;
>>  	unsigned int y;
>> =20
>> @@ -416,7 +416,7 @@ static void drm_fb_helper_dirty_work(struct work_s=
truct *work)
>>  	struct drm_clip_rect *clip =3D &helper->dirty_clip;
>>  	struct drm_clip_rect clip_copy;
>>  	unsigned long flags;
>> -	void *vaddr;
>> +	const struct drm_gem_membuf *buf;
>> =20
>>  	spin_lock_irqsave(&helper->dirty_lock, flags);
>>  	clip_copy =3D *clip;
>> @@ -429,8 +429,8 @@ static void drm_fb_helper_dirty_work(struct work_s=
truct *work)
>> =20
>>  		/* Generic fbdev uses a shadow buffer */
>>  		if (helper->buffer) {
>> -			vaddr =3D drm_client_buffer_vmap(helper->buffer);
>> -			if (IS_ERR(vaddr))
>> +			buf =3D drm_client_buffer_vmap(helper->buffer);
>> +			if (IS_ERR(buf))
>>  				return;
>>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
>>  		}
>> @@ -2076,7 +2076,7 @@ static int drm_fb_helper_generic_probe(struct dr=
m_fb_helper *fb_helper,
>>  	struct drm_framebuffer *fb;
>>  	struct fb_info *fbi;
>>  	u32 format;
>> -	void *vaddr;
>> +	const struct drm_gem_membuf *membuf;
>> =20
>>  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
>>  		    sizes->surface_width, sizes->surface_height,
>> @@ -2112,11 +2112,11 @@ static int drm_fb_helper_generic_probe(struct =
drm_fb_helper *fb_helper,
>>  		fb_deferred_io_init(fbi);
>>  	} else {
>>  		/* buffer is mapped for HW framebuffer */
>> -		vaddr =3D drm_client_buffer_vmap(fb_helper->buffer);
>> -		if (IS_ERR(vaddr))
>> -			return PTR_ERR(vaddr);
>> +		membuf =3D drm_client_buffer_vmap(fb_helper->buffer);
>> +		if (IS_ERR(membuf))
>> +			return PTR_ERR(membuf);
>> =20
>> -		fbi->screen_buffer =3D vaddr;
>> +		fbi->screen_buffer =3D membuf->vaddr;
>>  		/* Shamelessly leak the physical address to user-space */
>>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>>  		if (drm_leak_fbdev_smem && fbi->fix.smem_start =3D=3D 0)
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 19d73868490e..36ded6a56fb2 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1220,7 +1220,7 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>>  		obj->dev->driver->gem_prime_unpin(obj);
>>  }
>> =20
>> -void *drm_gem_vmap(struct drm_gem_object *obj)
>> +int drm_gem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *b=
uf)
>>  {
>>  	void *vaddr;
>> =20
>> @@ -1229,23 +1229,26 @@ void *drm_gem_vmap(struct drm_gem_object *obj)=

>>  	else if (obj->dev->driver->gem_prime_vmap)
>>  		vaddr =3D obj->dev->driver->gem_prime_vmap(obj);
>>  	else
>> -		vaddr =3D ERR_PTR(-EOPNOTSUPP);
>> +		return -EOPNOTSUPP;
>> =20
>>  	if (!vaddr)
>> -		vaddr =3D ERR_PTR(-ENOMEM);
>> +		return -ENOMEM;
>> +
>> +	buf->vaddr =3D vaddr;
>> +	buf->is_iomem =3D false;
>> =20
>> -	return vaddr;
>> +	return 0;
>>  }
>> =20
>> -void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
>> +void drm_gem_vunmap(struct drm_gem_object *obj, const struct drm_gem_=
membuf *buf)
>>  {
>> -	if (!vaddr)
>> +	if (!buf || !buf->vaddr)
>>  		return;
>> =20
>>  	if (obj->funcs && obj->funcs->vunmap)
>> -		obj->funcs->vunmap(obj, vaddr);
>> +		obj->funcs->vunmap(obj, buf->vaddr);
>>  	else if (obj->dev->driver->gem_prime_vunmap)
>> -		obj->dev->driver->gem_prime_vunmap(obj, vaddr);
>> +		obj->dev->driver->gem_prime_vunmap(obj, buf->vaddr);
>>  }
>> =20
>>  /**
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inte=
rnal.h
>> index 8e01caaf95cc..201d71249954 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -36,6 +36,7 @@ struct dma_buf;
>>  struct drm_connector;
>>  struct drm_crtc;
>>  struct drm_framebuffer;
>> +struct drm_gem_membuf;
>>  struct drm_gem_object;
>>  struct drm_master;
>>  struct drm_minor;
>> @@ -186,8 +187,8 @@ void drm_gem_print_info(struct drm_printer *p, uns=
igned int indent,
>> =20
>>  int drm_gem_pin(struct drm_gem_object *obj);
>>  void drm_gem_unpin(struct drm_gem_object *obj);
>> -void *drm_gem_vmap(struct drm_gem_object *obj);
>> -void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
>> +int drm_gem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *b=
uf);
>> +void drm_gem_vunmap(struct drm_gem_object *obj, const struct drm_gem_=
membuf *buf);
>> =20
>>  /* drm_debugfs.c drm_debugfs_crc.c */
>>  #if defined(CONFIG_DEBUG_FS)
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c=

>> index 1693aa7c14b5..d95a39030a93 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -671,13 +671,14 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>  void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf)
>>  {
>>  	struct drm_gem_object *obj =3D dma_buf->priv;
>> -	void *vaddr;
>> +	struct drm_gem_membuf buf;
>> +	int ret;
>> =20
>> -	vaddr =3D drm_gem_vmap(obj);
>> -	if (IS_ERR(vaddr))
>> -		vaddr =3D NULL;
>> +	ret =3D drm_gem_vmap(obj, &buf);
>> +	if (ret)
>> +		buf.vaddr =3D NULL;
>> =20
>> -	return vaddr;
>> +	return buf.vaddr;
>>  }
>>  EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>> =20
>> @@ -692,8 +693,11 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>>  void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
>>  {
>>  	struct drm_gem_object *obj =3D dma_buf->priv;
>> +	struct drm_gem_membuf buf;
>> =20
>> -	drm_gem_vunmap(obj, vaddr);
>> +	buf.vaddr =3D vaddr;
>> +	buf.is_iomem =3D false;
>> +	drm_gem_vunmap(obj, &buf);
>>  }
>>  EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>> =20
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index 7aaea665bfc2..5ed73c390619 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -14,6 +14,7 @@ struct drm_client_dev;
>>  struct drm_device;
>>  struct drm_file;
>>  struct drm_framebuffer;
>> +struct drm_gem_membuf;
>>  struct drm_gem_object;
>>  struct drm_minor;
>>  struct module;
>> @@ -141,9 +142,9 @@ struct drm_client_buffer {
>>  	struct drm_gem_object *gem;
>> =20
>>  	/**
>> -	 * @vaddr: Virtual address for the buffer
>> +	 * @membuf: Virtual address for the buffer
>>  	 */
>> -	void *vaddr;
>> +	struct drm_gem_membuf membuf;
>> =20
>>  	/**
>>  	 * @fb: DRM framebuffer
>> @@ -155,7 +156,7 @@ struct drm_client_buffer *
>>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 widt=
h, u32 height, u32 format);
>>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);=

>>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, st=
ruct drm_rect *rect);
>> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
>> +const struct drm_gem_membuf *drm_client_buffer_vmap(struct drm_client=
_buffer *buffer);
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>> =20
>>  int drm_client_modeset_create(struct drm_client_dev *client);
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 0988351d743c..6ecf03601c36 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -381,4 +381,30 @@ struct drm_device {
>>  #endif
>>  };
>> =20
>> +/**
>> + * struct drm_gem_membuf - GEM memory buffer
>=20
> This isn't gem specific, and membuf feels a bit strange - it's not a
> memory buffer, but more a buffer mapping. I'd call these struct
> drm_bufmap.
>=20
>> + */
>> +struct drm_gem_membuf {
>> +	union {
>> +		/**
>> +		 * @vaddr:
>> +		 *
>> +		 * The virtual address for the buffer in system memory.
>> +		 */
>> +		void *vaddr;
>> +		/**
>> +		 * @vaddr_iomem:
>> +		 *
>> +		 * The virtual address for the buffer in I/O memory.
>> +		 */
>> +		void __iomem *vaddr_iomem;
>> +	};
>> +	/**
>> +	 * @is_iomem:
>> +	 *
>> +	 * True if the memory is located in I/O memory, false otherwise.
>> +	 */
>> +	bool is_iomem;
>> +};
>=20
> I think if we do this we should go all in, i.e. create a new header, an=
d
> then start to add all kinds of helper functions to it, like:
>=20
> static inline drm_memcpy_to_bufmap(bufmap, ...)
> {
> 	if (bufmap->is_iomem)
> 		memcpy_toio(bufmap->vaddr_iomem, ...);
> 	else
> 		memcpy(bufmap->vaddr_iomem, ...);
>=20
> }
>=20
> totally wrong code of course, but I think you get the idea. If we add
> helpers like this I think a new header file is also warranted, so maybe=

> put it all in drm_bufmap.h and then wire up the kerneldoc.

Just a note: while converting the fbdev blit code, I found it easier to
open-code the test for is_iomem and have two separate loops. Doing the
same with drm_memcpy_to_bufmap would also require helpers for pointer
arithmetics and array indexing to make it comfortable to use.

Best regards
Thomas

>=20
> Also I think cc: ttm people for an ack would be good, maybe long-term w=
e
> want to roll this out through ttm too.
>=20
> Cheers, Daniel
>=20
>=20
>> +
>>  #endif
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TsxvfHJ5D2M6HjLcLvAbKaW7VNzUzWnhL--

--JMd5ka9O0nEA390us4tBWnPDPoz5fjUbR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl82M4EUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMpvQgAvfoxRk4l1LF8A6xTTMQVMNfV+gxZ
Yamkl8xvgNaEmny8ILg155PNXKh12JnOiLAvG2d0ZCGFuW2SvNpJ7/rNEyzxxoXp
qO4nRaGQfoN8HaLVtwypMZqwnRyaTC+v2p0Uj3gFUtUHMwZXA4rA7mX2LpHZ1N8W
4DqGmGhKOQhGPdgtjC/DJjaVwCsPKhC3kyV6z5oPhxRr98BlYptH4jK8oAMgd0gB
l/fqX4fMVLOvPffPPyJcRKtCyzd2BlHD8wSnwrTDrE3ghg0kTA4w6m2SYU6iFUsp
G8uyNbUvlL/rA5Z1TqF/369wa6LA1EKZZ1Nw+NUyYtd6zqp51zNgg+izYg==
=FmU5
-----END PGP SIGNATURE-----

--JMd5ka9O0nEA390us4tBWnPDPoz5fjUbR--

--===============0802406669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0802406669==--
