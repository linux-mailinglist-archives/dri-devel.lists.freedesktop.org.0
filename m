Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E013D6644
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 20:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51C6E91A;
	Mon, 26 Jul 2021 18:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D69B6E8E4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 18:03:20 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85EDE1FD4C;
 Mon, 26 Jul 2021 18:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627322598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tfUVQ1qyGfEGee61dvvfyktXAvR1oZ9MkqspG5RfUrc=;
 b=VkFzXxuiDtvQxrX2hjBD54CxyMgh2TuYRH2hLwrvek2v/U4ROC+Ahk5Wh7hSZz4oolUXvd
 XkT0YvmDX5Pxsk+AbCp2EIMYPlniIvZhmCgQI3cCZhlr2gqzboVLHcMB+fGlCX4WYo1Ags
 AIxeXGfO/FZOm4ti2YfjY9vnC4nrsXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627322598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tfUVQ1qyGfEGee61dvvfyktXAvR1oZ9MkqspG5RfUrc=;
 b=yQ4s2a5wRCXgpD74DCEBlSWE6Vc82/NtPBJ49nXwGfvzvrZDvj/J1aPdEiuN2Iry/Kxcl/
 o2nRRKGgumeXoHBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4783313A96;
 Mon, 26 Jul 2021 18:03:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tVTbD+b4/mDoTAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Jul 2021 18:03:18 +0000
Subject: Re: [PATCH v2 1/5] drm: Define DRM_FORMAT_MAX_PLANES
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-2-tzimmermann@suse.de> <YP3AQ+llUEBW3JuN@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <639d4cbb-95b5-a45f-346a-24006f34a06e@suse.de>
Date: Mon, 26 Jul 2021 20:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YP3AQ+llUEBW3JuN@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qxzvD63Ql0wsjcocZqFfNZRneBk2XzcR3"
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qxzvD63Ql0wsjcocZqFfNZRneBk2XzcR3
Content-Type: multipart/mixed; boundary="lWdP0aYZA6hIEE6XPJfSZCjV2sQXsBBMN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org
Message-ID: <639d4cbb-95b5-a45f-346a-24006f34a06e@suse.de>
Subject: Re: [PATCH v2 1/5] drm: Define DRM_FORMAT_MAX_PLANES
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-2-tzimmermann@suse.de> <YP3AQ+llUEBW3JuN@ravnborg.org>
In-Reply-To: <YP3AQ+llUEBW3JuN@ravnborg.org>

--lWdP0aYZA6hIEE6XPJfSZCjV2sQXsBBMN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.07.21 um 21:49 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Sun, Jul 25, 2021 at 07:44:34PM +0200, Thomas Zimmermann wrote:
>> DRM uses a magic number of 4 for the maximum number of planes per colo=
r
>> format. Declare this constant via DRM_FORMAT_MAX_PLANES and update the=

>> related code. Some code depends on the length of arrays that are now
>> declared with DRM_FORMAT_MAX_PLANES. Convert it from '4' to ARRAY_SIZE=
=2E
>>
>> v2:
>> 	* mention usage of ARRAY_SIZE() in the commit message (Maxime)
>> 	* also fix error handling in drm_gem_fb_init_with_funcs()
>> 	  (kernel test robot)
>> 	* include <drm/drm_fourcc.h> for DRM_FORMAT_MAX_PLANES
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> One nit below.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks a lot for your reviews.

>=20
>> ---
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 19 +++++++++++-------=
-
>>   include/drm/drm_fourcc.h                     | 13 +++++++++----
>>   include/drm/drm_framebuffer.h                |  8 ++++----
>>   include/drm/drm_gem_atomic_helper.h          |  3 ++-
>>   4 files changed, 26 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gp=
u/drm/drm_gem_framebuffer_helper.c
>> index 67bc9edc1d98..421e029a6b3e 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -48,7 +48,7 @@
>>   struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb=
,
>>   					  unsigned int plane)
>>   {
>> -	if (plane >=3D 4)
>> +	if (plane >=3D ARRAY_SIZE(fb->obj))
>>   		return NULL;
>>  =20
>>   	return fb->obj[plane];
>> @@ -62,7 +62,8 @@ drm_gem_fb_init(struct drm_device *dev,
>>   		 struct drm_gem_object **obj, unsigned int num_planes,
>>   		 const struct drm_framebuffer_funcs *funcs)
>>   {
>> -	int ret, i;
>> +	unsigned int i;
>> +	int ret;
>>  =20
>>   	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>>
> This change looks accidental/unrelated.
> But I guess it is to be consistent in use of unsigned int when
> iterating the array.

Indeed. The current code uses a mixture of signed and unsigned types in=20
several places. DRM_FORMAT_MAX_PLANES is defined as unsigned, so I=20
updated all the related code accordingly.

Best regards
Thomas

>=20
>> @@ -86,9 +87,9 @@ drm_gem_fb_init(struct drm_device *dev,
>>    */
>>   void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>   {
>> -	int i;
>> +	size_t i;
>>  =20
>> -	for (i =3D 0; i < 4; i++)
>> +	for (i =3D 0; i < ARRAY_SIZE(fb->obj); i++)
>>   		drm_gem_object_put(fb->obj[i]);
>>  =20
>>   	drm_framebuffer_cleanup(fb);
>> @@ -145,8 +146,9 @@ int drm_gem_fb_init_with_funcs(struct drm_device *=
dev,
>>   			       const struct drm_framebuffer_funcs *funcs)
>>   {
>>   	const struct drm_format_info *info;
>> -	struct drm_gem_object *objs[4];
>> -	int ret, i;
>> +	struct drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
>> +	unsigned int i;
>> +	int ret;
>>  =20
>>   	info =3D drm_get_format_info(dev, mode_cmd);
>>   	if (!info) {
>> @@ -187,9 +189,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device =
*dev,
>>   	return 0;
>>  =20
>>   err_gem_object_put:
>> -	for (i--; i >=3D 0; i--)
>> +	while (i > 0) {
>> +		--i;
>>   		drm_gem_object_put(objs[i]);
>> -
>> +	}
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
>> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
>> index 3b138d4ae67e..22aa64d07c79 100644
>> --- a/include/drm/drm_fourcc.h
>> +++ b/include/drm/drm_fourcc.h
>> @@ -25,6 +25,11 @@
>>   #include <linux/types.h>
>>   #include <uapi/drm/drm_fourcc.h>
>>  =20
>> +/**
>> + * DRM_FORMAT_MAX_PLANES - maximum number of planes a DRM format can =
have
>> + */
>> +#define DRM_FORMAT_MAX_PLANES	4u
>> +
>>   /*
>>    * DRM formats are little endian.  Define host endian variants for t=
he
>>    * most common formats here, to reduce the #ifdefs needed in drivers=
=2E
>> @@ -78,7 +83,7 @@ struct drm_format_info {
>>   		 * triplet @char_per_block, @block_w, @block_h for better
>>   		 * describing the pixel format.
>>   		 */
>> -		u8 cpp[4];
>> +		u8 cpp[DRM_FORMAT_MAX_PLANES];
>>  =20
>>   		/**
>>   		 * @char_per_block:
>> @@ -104,7 +109,7 @@ struct drm_format_info {
>>   		 * information from their drm_mode_config.get_format_info hook
>>   		 * if they want the core to be validating the pitch.
>>   		 */
>> -		u8 char_per_block[4];
>> +		u8 char_per_block[DRM_FORMAT_MAX_PLANES];
>>   	};
>>  =20
>>   	/**
>> @@ -113,7 +118,7 @@ struct drm_format_info {
>>   	 * Block width in pixels, this is intended to be accessed through
>>   	 * drm_format_info_block_width()
>>   	 */
>> -	u8 block_w[4];
>> +	u8 block_w[DRM_FORMAT_MAX_PLANES];
>>  =20
>>   	/**
>>   	 * @block_h:
>> @@ -121,7 +126,7 @@ struct drm_format_info {
>>   	 * Block height in pixels, this is intended to be accessed through
>>   	 * drm_format_info_block_height()
>>   	 */
>> -	u8 block_h[4];
>> +	u8 block_h[DRM_FORMAT_MAX_PLANES];
>>  =20
>>   	/** @hsub: Horizontal chroma subsampling factor */
>>   	u8 hsub;
>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuff=
er.h
>> index be658ebbec72..f67c5b7bcb68 100644
>> --- a/include/drm/drm_framebuffer.h
>> +++ b/include/drm/drm_framebuffer.h
>> @@ -27,12 +27,12 @@
>>   #include <linux/list.h>
>>   #include <linux/sched.h>
>>  =20
>> +#include <drm/drm_fourcc.h>
>>   #include <drm/drm_mode_object.h>
>>  =20
>>   struct drm_clip_rect;
>>   struct drm_device;
>>   struct drm_file;
>> -struct drm_format_info;
>>   struct drm_framebuffer;
>>   struct drm_gem_object;
>>  =20
>> @@ -147,7 +147,7 @@ struct drm_framebuffer {
>>   	 * @pitches: Line stride per buffer. For userspace created object t=
his
>>   	 * is copied from drm_mode_fb_cmd2.
>>   	 */
>> -	unsigned int pitches[4];
>> +	unsigned int pitches[DRM_FORMAT_MAX_PLANES];
>>   	/**
>>   	 * @offsets: Offset from buffer start to the actual pixel data in b=
ytes,
>>   	 * per buffer. For userspace created object this is copied from
>> @@ -165,7 +165,7 @@ struct drm_framebuffer {
>>   	 * data (even for linear buffers). Specifying an x/y pixel offset i=
s
>>   	 * instead done through the source rectangle in &struct drm_plane_s=
tate.
>>   	 */
>> -	unsigned int offsets[4];
>> +	unsigned int offsets[DRM_FORMAT_MAX_PLANES];
>>   	/**
>>   	 * @modifier: Data layout modifier. This is used to describe
>>   	 * tiling, or also special layouts (like compression) of auxiliary
>> @@ -210,7 +210,7 @@ struct drm_framebuffer {
>>   	 * This is used by the GEM framebuffer helpers, see e.g.
>>   	 * drm_gem_fb_create().
>>   	 */
>> -	struct drm_gem_object *obj[4];
>> +	struct drm_gem_object *obj[DRM_FORMAT_MAX_PLANES];
>>   };
>>  =20
>>   #define obj_to_fb(x) container_of(x, struct drm_framebuffer, base)
>> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem=
_atomic_helper.h
>> index d82c23622156..f9f8b6f0494a 100644
>> --- a/include/drm/drm_gem_atomic_helper.h
>> +++ b/include/drm/drm_gem_atomic_helper.h
>> @@ -5,6 +5,7 @@
>>  =20
>>   #include <linux/dma-buf-map.h>
>>  =20
>> +#include <drm/drm_fourcc.h>
>>   #include <drm/drm_plane.h>
>>  =20
>>   struct drm_simple_display_pipe;
>> @@ -40,7 +41,7 @@ struct drm_shadow_plane_state {
>>   	 * The memory mappings stored in map should be established in the p=
lane's
>>   	 * prepare_fb callback and removed in the cleanup_fb callback.
>>   	 */
>> -	struct dma_buf_map map[4];
>> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>>   };
>>  =20
>>   /**
>> --=20
>> 2.32.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lWdP0aYZA6hIEE6XPJfSZCjV2sQXsBBMN--

--qxzvD63Ql0wsjcocZqFfNZRneBk2XzcR3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD++OUFAwAAAAAACgkQlh/E3EQov+D8
FRAAtnfNt70xdFv8DQ2SVEkl0C9mkAHJgmubEo12XOf0hFBO+6yMo0zxSFsyuofSNV6kPQ9yJmDk
UYUnwo9NZyYKNWXmmuLS4I1ak+91c1paQdTg1DL8fUfZqUHDwiYq5NXHFLIv1MSQcFg99GTiP60U
bdJtSf8AQMPxIDMwSkuSZpRHQ2fowZWtMzIuA+r0LjMcBJXFykTgCWPzNRCTpUP5uMBuhTHf2MsF
NartW26C6B09V347Ot1XsGYtExBiquEA0qPK/rH7WVIjb6MwvmhuizDflWdevHDQljGFKzpTl9Ro
V33nspAHJfZFOB8dOUjQLkslgL+r8RTJ7ITjVmjTqY+ao7VeZFQpJIT4WcUMU8Rf0Iu0P5SkohFM
HEtP3jWqu1GUUyYBG38U0J5lfk/ad/wdmEzpjiXMBktI6eEgFNgxev8jZLJ3MwO0lbMoVP8R69fM
sGMU8URzHMfWH7+OQhzacUjqHRKbvYXTTuk3r4+XEPEQz7pTnZF0WoQO7tA44EXoOWqoaHrIFe9y
zJo9msSqe0ogq60q4kVeBPGz/KS1+m1MYwXoEE6r2qbYWoeSsOKuRIEC5bP7MWaUGuC1CyTMQcnd
gCKdcaGQwLMgXbK7tRZXNdINXKxxaBhialywzX+tqDDs7BkOBAzOa81srHaAUiMdp+YBg+MWq6Qk
SHM=
=Zjga
-----END PGP SIGNATURE-----

--qxzvD63Ql0wsjcocZqFfNZRneBk2XzcR3--
