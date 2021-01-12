Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B945B2F2BCD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D986E185;
	Tue, 12 Jan 2021 09:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D856E185
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 09:53:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40D28AC8F;
 Tue, 12 Jan 2021 09:53:15 +0000 (UTC)
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
 <X/yFj9zIdW52UKk4@phenom.ffwll.local>
 <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
 <X/1pFaa9I7WFjtJW@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b92c3b2c-9993-5050-7d0b-2beb41098787@suse.de>
Date: Tue, 12 Jan 2021 10:53:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/1pFaa9I7WFjtJW@phenom.ffwll.local>
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0040854725=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0040854725==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VfIOqAoYLyjeSozmZQvGtQP8PcMB5gALG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VfIOqAoYLyjeSozmZQvGtQP8PcMB5gALG
Content-Type: multipart/mixed; boundary="6YcwXAACbQbZD7Ebd4YXPTSwPsT7mQnRv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, kraxel@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-media@vger.kernel.org
Message-ID: <b92c3b2c-9993-5050-7d0b-2beb41098787@suse.de>
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
 <X/yFj9zIdW52UKk4@phenom.ffwll.local>
 <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
 <X/1pFaa9I7WFjtJW@phenom.ffwll.local>
In-Reply-To: <X/1pFaa9I7WFjtJW@phenom.ffwll.local>

--6YcwXAACbQbZD7Ebd4YXPTSwPsT7mQnRv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.01.21 um 10:17 schrieb Daniel Vetter:
> On Tue, Jan 12, 2021 at 08:54:02AM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 11.01.21 um 18:06 schrieb Daniel Vetter:
>>> On Fri, Jan 08, 2021 at 10:43:38AM +0100, Thomas Zimmermann wrote:
>>>> Cursor updates in vboxvideo require a short-term mapping of the
>>>> source BO. Use drm_gem_vram_vmap_local() and avoid the pinning
>>>> operations.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> All these drivers patches break the dma_resv_lock vs
>>> dma_fence_begin/end_signalling nesting rules, so this doesn't work.
>>>
>>> Generally this is what the prepare/cleanup_fb hooks are for, that's w=
here
>>> mappings (including vmaps) are meant to be set up, permanently.
>>>
>>> I'm kinda not clear on why we need all these changes, I thought the
>>> locking problem is just in the fb helper paths, because it's outside =
of
>>> the atomic path and could conflict with an atomic update at the same =
time?
>>> So only that one should get the vmap_local treatment, everything else=

>>> should keep the normal vmap treatment.
>>
>> Kind of responding to all your comment on the driver changes:
>>
>> These drivers only require short-term mappings, so using vmap_local wo=
uld be
>> the natural choice. For SHMEM helpers, it's mostly a cosmetic thing. F=
or
>> VRAM helpers, I was hoping to remove the vmap/vunmap helpers entirely.=
 One
>> cannot really map the BOs for the long-term, so not having the helpers=
 at
>> all would make sense.
>>
>> But reading all your comments on the driver patches, I'd rather not up=
date
>> the drivers here but later convert them to use prepare_fb/cleanup_fb i=
n the
>> correct way.
>=20
> Ack from me on this plan. I think I got all the other patches with an r=
-b
> or ack?

The shmem patch needs an update from my side.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>> ---
>>>>    drivers/gpu/drm/vboxvideo/vbox_mode.c | 15 +++++++++------
>>>>    1 file changed, 9 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm=
/vboxvideo/vbox_mode.c
>>>> index dbc0dd53c69e..215b37c78c10 100644
>>>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>>> @@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm=
_plane *plane,
>>>>    		container_of(plane->dev, struct vbox_private, ddev);
>>>>    	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(plane->state->crtc)=
;
>>>>    	struct drm_framebuffer *fb =3D plane->state->fb;
>>>> -	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]=
);
>>>> +	struct drm_gem_object *obj =3D fb->obj[0];
>>>> +	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(obj);
>>>>    	u32 width =3D plane->state->crtc_w;
>>>>    	u32 height =3D plane->state->crtc_h;
>>>>    	size_t data_size, mask_size;
>>>> @@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct d=
rm_plane *plane,
>>>>    	vbox_crtc->cursor_enabled =3D true;
>>>> -	ret =3D drm_gem_vram_vmap(gbo, &map);
>>>> +	ret =3D dma_resv_lock(obj->resv, NULL);
>>>> +	if (ret)
>>>> +		return;
>>>> +	ret =3D drm_gem_vram_vmap_local(gbo, &map);
>>>>    	if (ret) {
>>>> -		/*
>>>> -		 * BUG: we should have pinned the BO in prepare_fb().
>>>> -		 */
>>>> +		dma_resv_unlock(obj->resv);
>>>>    		mutex_unlock(&vbox->hw_mutex);
>>>>    		DRM_WARN("Could not map cursor bo, skipping update\n");
>>>>    		return;
>>>> @@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm=
_plane *plane,
>>>>    	data_size =3D width * height * 4 + mask_size;
>>>>    	copy_cursor_image(src, vbox->cursor_data, width, height, mask_si=
ze);
>>>> -	drm_gem_vram_vunmap(gbo, &map);
>>>> +	drm_gem_vram_vunmap_local(gbo, &map);
>>>> +	dma_resv_unlock(obj->resv);
>>>>    	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE =
|
>>>>    		VBOX_MOUSE_POINTER_ALPHA;
>>>> --=20
>>>> 2.29.2
>>>>
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6YcwXAACbQbZD7Ebd4YXPTSwPsT7mQnRv--

--VfIOqAoYLyjeSozmZQvGtQP8PcMB5gALG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/9cYkFAwAAAAAACgkQlh/E3EQov+Bp
1w//cf4oCOD3SQzwZxnBmyRMrDwj3/hsNqEq1i9vX4NnDjAO56/tMRS3IqWvXOHO/gyWT/bd84Sa
YVxRrEbD0jNlEvcxOhJb90+LqjXG1h2bQ76vfMKkgARzg3oKtVjzrsWj1H8BEW9d2HBizgVSDiD2
TGh6OEP3SozxfRoVnmGetdnZAzSVRQNNKmOGNGjxyHjLLmzveCA/vwyQehuQfdeF+fKlUJpzdtP3
e0re0dW7TNHlW9FRM8Alv1vhlE1FxGbkGZpC3qDX8hApAOLn+29m4ZEcAtvPFu6HmBKsDf6/Sx1E
OfYyi6c2Yt7/u5Bx6dxIBlvGdzlifldI9BxY2mauFCh2TXtsWJVhTphaTJBjBDvjID3znpvlAwoE
ejHwHyTByRa3Mx0g2Jey1wWUxknRfaRECTsFx3Dl/PCP2sb7LSMHxzbrhXRrj5GpvXB5knm5LlKf
fKQhhALZInj9AZ0eHTx8kj7byiN7pdlcpmnuTmH6jizfdIvIjPjJGZxELiBVzWnC2nrgYCTxCKto
yIdQm84ILER57yHOK95vqpeMD6PoS0N1MbkX8RFMTO8gGYsUFUqxqevzLaDfR/U+yjmqPqXO+wtB
X3c3PQHAo0091FFszaaDFAj6lFFYqZTI+47FpULuvC0u+n8YYI0FOr+xRQLqrBsOQFuWOU9tBwR2
nYM=
=jSnm
-----END PGP SIGNATURE-----

--VfIOqAoYLyjeSozmZQvGtQP8PcMB5gALG--

--===============0040854725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0040854725==--
