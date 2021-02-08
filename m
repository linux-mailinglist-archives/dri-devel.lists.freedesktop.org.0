Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091AA3133D0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 14:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFA36E8DB;
	Mon,  8 Feb 2021 13:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46606E8DB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 13:54:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0261DB12E;
 Mon,  8 Feb 2021 13:54:19 +0000 (UTC)
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
 <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
 <YBp+jxbjkdcpN1eo@phenom.ffwll.local>
 <74307294-2220-29d6-9d59-a73c2b8f43c6@suse.de>
 <89578948-c675-9935-b2e2-b9b1a9081d7d@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2353416f-8754-a49f-8271-ee6de7bfa7b4@suse.de>
Date: Mon, 8 Feb 2021 14:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <89578948-c675-9935-b2e2-b9b1a9081d7d@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1964225270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1964225270==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PBlOYYBatD3LLpiolXUeI0JElzvqHuXEG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PBlOYYBatD3LLpiolXUeI0JElzvqHuXEG
Content-Type: multipart/mixed; boundary="t6UeHqzd71cULxVTjrE2Rp6dnIL6la07h";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Message-ID: <2353416f-8754-a49f-8271-ee6de7bfa7b4@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
 <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
 <YBp+jxbjkdcpN1eo@phenom.ffwll.local>
 <74307294-2220-29d6-9d59-a73c2b8f43c6@suse.de>
 <89578948-c675-9935-b2e2-b9b1a9081d7d@redhat.com>
In-Reply-To: <89578948-c675-9935-b2e2-b9b1a9081d7d@redhat.com>

--t6UeHqzd71cULxVTjrE2Rp6dnIL6la07h
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Hans

Am 03.02.21 um 12:50 schrieb Hans de Goede:
> If I understand things correctly, there is some memory corruption
> introduced by this patch, so there will be a v2 fixing this ?
>=20
> The reason why I'm asking is because I always try to test vboxvideo pat=
ches
> inside a vbox vm, but if a v2 is coming, there is not much use in me te=
sting
> this version, correct ?

I just sent out v2 of the patchset. [1] It's now build upon DRM helpers, =

so vboxvideo got slightly smaller. For testing, the latest drm-tip or=20
drm-misc-next is required.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210208135044.27827-1-tzimmermann@suse=
=2Ede/T/#t

>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
>>>>>> ---
>>>>>>  =C2=A0=C2=A0 drivers/gpu/drm/vboxvideo/vbox_mode.c | 102 ++++++++=
+++++++++++++-----
>>>>>>  =C2=A0=C2=A0 1 file changed, 82 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/d=
rm/vboxvideo/vbox_mode.c
>>>>>> index dbc0dd53c69e..b5625a7d6cef 100644
>>>>>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>>>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>>>>> @@ -324,6 +324,19 @@ static void vbox_primary_atomic_disable(struc=
t drm_plane *plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_st=
ate->src_y >> 16);
>>>>>>  =C2=A0=C2=A0 }
>>>>>> +struct vbox_cursor_plane_state {
>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_plane_state base;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 /* Transitional state - do not export or dupli=
cate */
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 struct dma_buf_map map;
>>>>>> +};
>>>>>> +
>>>>>> +static struct vbox_cursor_plane_state *to_vbox_cursor_plane_state=
(struct drm_plane_state *state)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 return container_of(state, struct vbox_cursor_=
plane_state, base);
>>>>>> +}
>>>>>> +
>>>>>>  =C2=A0=C2=A0 static int vbox_cursor_atomic_check(struct drm_plane=
 *plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct=
 drm_plane_state *new_state)
>>>>>>  =C2=A0=C2=A0 {
>>>>>> @@ -381,14 +394,13 @@ static void vbox_cursor_atomic_update(struct=
 drm_plane *plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cont=
ainer_of(plane->dev, struct vbox_private, ddev);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vbox_crtc *vbox_crtc =
=3D to_vbox_crtc(plane->state->crtc);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb =3D=
 plane->state->fb;
>>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_gem_vram_object *gbo =3D drm_gem_vr=
am_of_gem(fb->obj[0]);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 width =3D plane->state->=
crtc_w;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 height =3D plane->state-=
>crtc_h;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct vbox_cursor_plane_state *vbox_state =3D=
 to_vbox_cursor_plane_state(plane->state);
>>>>>> +=C2=A0=C2=A0=C2=A0 struct dma_buf_map map =3D vbox_state->map;
>>>>>> +=C2=A0=C2=A0=C2=A0 u8 *src =3D map.vaddr; /* TODO: Use mapping ab=
straction properly */
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t data_size, mask_size;=

>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags;
>>>>>> -=C2=A0=C2=A0=C2=A0 struct dma_buf_map map;
>>>>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> -=C2=A0=C2=A0=C2=A0 u8 *src;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * VirtualBox uses the =
host windowing system to draw the cursor so
>>>>>> @@ -401,17 +413,6 @@ static void vbox_cursor_atomic_update(struct =
drm_plane *plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbox_crtc->cursor_enabled =3D=
 true;
>>>>>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_vram_vmap(gbo, &map);
>>>>>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * BUG: we should=
 have pinned the BO in prepare_fb().
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&vbox->hw=
_mutex);
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_WARN("Could not ma=
p cursor bo, skipping update\n");
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>> -=C2=A0=C2=A0=C2=A0 }
>>>>>> -=C2=A0=C2=A0=C2=A0 src =3D map.vaddr; /* TODO: Use mapping abstra=
ction properly */
>>>>>> -
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The mask must be cal=
culated based on the alpha
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * channel, one bit per=
 ARGB word, and must be 32-bit
>>>>>> @@ -421,7 +422,6 @@ static void vbox_cursor_atomic_update(struct d=
rm_plane *plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data_size =3D width * height=
 * 4 + mask_size;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 copy_cursor_image(src, vbox-=
>cursor_data, width, height, mask_size);
>>>>>> -=C2=A0=C2=A0=C2=A0 drm_gem_vram_vunmap(gbo, &map);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags =3D VBOX_MOUSE_POINTER=
_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VBOX=
_MOUSE_POINTER_ALPHA;
>>>>>> @@ -458,6 +458,43 @@ static void vbox_cursor_atomic_disable(struct=
 drm_plane *plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&vbox->hw_mutex=
);
>>>>>>  =C2=A0=C2=A0 }
>>>>>> +static int vbox_cursor_prepare_fb(struct drm_plane *plane, struct=
 drm_plane_state *new_state)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct vbox_cursor_plane_state *new_vbox_state=
 =3D to_vbox_cursor_plane_state(new_state);
>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb =3D new_state->fb;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_vram_object *gbo;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct dma_buf_map map;
>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (!fb)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_vram_vmap(gbo, &map);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 new_vbox_state->map =3D map;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void vbox_cursor_cleanup_fb(struct drm_plane *plane, struc=
t drm_plane_state *old_state)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct vbox_cursor_plane_state *old_vbox_state=
 =3D to_vbox_cursor_plane_state(old_state);
>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb =3D old_state->fb;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct dma_buf_map map =3D old_vbox_state->map=
;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_vram_object *gbo;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (!fb)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 drm_gem_vram_vunmap(gbo, &map);
>>>>>> +}
>>>>>> +
>>>>>>  =C2=A0=C2=A0 static const u32 vbox_cursor_plane_formats[] =3D {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FORMAT_ARGB8888,
>>>>>>  =C2=A0=C2=A0 };
>>>>>> @@ -466,17 +503,42 @@ static const struct drm_plane_helper_funcs v=
box_cursor_helper_funcs =3D {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .atomic_check=C2=A0=C2=A0=C2=
=A0 =3D vbox_cursor_atomic_check,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .atomic_update=C2=A0=C2=A0=C2=
=A0 =3D vbox_cursor_atomic_update,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .atomic_disable=C2=A0=C2=A0=C2=
=A0 =3D vbox_cursor_atomic_disable,
>>>>>> -=C2=A0=C2=A0=C2=A0 .prepare_fb=C2=A0=C2=A0=C2=A0 =3D drm_gem_vram=
_plane_helper_prepare_fb,
>>>>>> -=C2=A0=C2=A0=C2=A0 .cleanup_fb=C2=A0=C2=A0=C2=A0 =3D drm_gem_vram=
_plane_helper_cleanup_fb,
>>>>>> +=C2=A0=C2=A0=C2=A0 .prepare_fb=C2=A0=C2=A0=C2=A0 =3D vbox_cursor_=
prepare_fb,
>>>>>> +=C2=A0=C2=A0=C2=A0 .cleanup_fb=C2=A0=C2=A0=C2=A0 =3D vbox_cursor_=
cleanup_fb,
>>>>>>  =C2=A0=C2=A0 };
>>>>>> +static struct drm_plane_state *vbox_cursor_atomic_duplicate_state=
(struct drm_plane *plane)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct vbox_cursor_plane_state *new_vbox_state=
;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D plane->dev;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (drm_WARN_ON(dev, !plane->state))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 new_vbox_state =3D kzalloc(sizeof(*new_vbox_st=
ate), GFP_KERNEL);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (!new_vbox_state)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>>>>>> +=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_plane_duplicate_state(plan=
e, &new_vbox_state->base);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return &new_vbox_state->base;
>>>>>> +}
>>>>>> +
>>>>>> +static void vbox_cursor_atomic_destroy_state(struct drm_plane *pl=
ane,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct drm_plane_state *state)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct vbox_cursor_plane_state *vbox_state =3D=
 to_vbox_cursor_plane_state(state);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_plane_destroy_state(&vbox_=
state->base);
>>>>>> +=C2=A0=C2=A0=C2=A0 kfree(vbox_state);
>>>>>> +}
>>>>>> +
>>>>>>  =C2=A0=C2=A0 static const struct drm_plane_funcs vbox_cursor_plan=
e_funcs =3D {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .update_plane=C2=A0=C2=A0=C2=
=A0 =3D drm_atomic_helper_update_plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .disable_plane=C2=A0=C2=A0=C2=
=A0 =3D drm_atomic_helper_disable_plane,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .destroy=C2=A0=C2=A0=C2=A0 =3D=
 drm_primary_helper_destroy,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .reset=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D drm_atomic_helper_plane_reset,
>>>>>> -=C2=A0=C2=A0=C2=A0 .atomic_duplicate_state =3D drm_atomic_helper_=
plane_duplicate_state,
>>>>>> -=C2=A0=C2=A0=C2=A0 .atomic_destroy_state =3D drm_atomic_helper_pl=
ane_destroy_state,
>>>>>> +=C2=A0=C2=A0=C2=A0 .atomic_duplicate_state =3D vbox_cursor_atomic=
_duplicate_state,
>>>>>> +=C2=A0=C2=A0=C2=A0 .atomic_destroy_state =3D vbox_cursor_atomic_d=
estroy_state,
>>>>>>  =C2=A0=C2=A0 };
>>>>>>  =C2=A0=C2=A0 static const u32 vbox_primary_plane_formats[] =3D {
>>>>>>
>>>>>> base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
>>>>>> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
>>>>>> --=20
>>>>>> 2.30.0
>>>>>>
>>>>>
>>>>
>>>> --=20
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>>
>>>
>>
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


--t6UeHqzd71cULxVTjrE2Rp6dnIL6la07h--

--PBlOYYBatD3LLpiolXUeI0JElzvqHuXEG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAhQoYFAwAAAAAACgkQlh/E3EQov+Bl
Ug//WyP6XrYHxtHwlxabb8JjH72p9Zfo+QjMPrXjOD1vB7rsgA0gRIn/CvKfIeboTSCyGSiyAbc6
LKRlgAvc2xGpAKd3I08rPhgN3Ytj4cQDLaFmp9BVitmhFP8r06Pb0Pnxa939GuuMi05Uq8cf1hTX
l5qGhonGrHwfWwHaPNaRORAWmR/a8isVP6JkM+0AIj6V6VWX9frXLm1ZHJDYDWd9t7oZ7UTFlLQM
9oI0kBD/AtQmyDf8bPRMjcc3gHaeqvNYIy28EsmBUj+QHXNRRcjIDfJkgd7i4op6aT7qSRA89sdg
NwQmBc1fgNjViPNPx7WELLmflAYAb3ZTICyCwD3yCQLN6M0FFFGiwBB8PkLCCnnyh5fuB2tBI8V5
6HRwbWZyk9nStnmJKgObm+xQt9PFQWgCYZ38SKehsXqj6n1LCaN1+/wLm8rU/YS5bO1q/QPglfV8
2Ki2AgauaccXvxwsoBcI4EW0jvBV5T2uZ2OV7CTWreQ1nvHm6JCLmB8hNhTobMkfzVXrfT47FOOD
zXpxlsY5Yf0VYMnU30OhJlLfXLalEcwtOFuLBtqfFG30OsNn/FG9FtNJnOrYQLPfYRTF/IHd/cpP
ZIbcYQ+m2gsruvcrvDhebyRlGWXJvdK8BxQbUddcakKOUqWWCnViaMaKQDAyXdeIyVbp5Wy9IjrX
oYU=
=MOxK
-----END PGP SIGNATURE-----

--PBlOYYBatD3LLpiolXUeI0JElzvqHuXEG--

--===============1964225270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1964225270==--
