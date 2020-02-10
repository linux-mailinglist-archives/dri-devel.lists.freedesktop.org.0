Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B421B1570C8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE216E92C;
	Mon, 10 Feb 2020 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DA76E92A;
 Mon, 10 Feb 2020 08:25:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93106B1EF;
 Mon, 10 Feb 2020 08:25:27 +0000 (UTC)
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
To: Ben Skeggs <skeggsb@gmail.com>, James Jones <jajones@nvidia.com>
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
 <5d0bc649-9d82-295e-fe00-58e9350f6d94@suse.de>
 <5d18f259-9d1c-2b83-428d-6e21b6cf779c@nvidia.com>
 <9695f3cf-076a-de49-53c9-75944bb4fb8b@nvidia.com>
 <CACAvsv6tVhmHFR=T=L5SyjO3u6-U6_x2pEdHzR+03LZY8NNEkw@mail.gmail.com>
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
Message-ID: <9a310fff-4b01-b215-5553-acebd8d2d8e8@suse.de>
Date: Mon, 10 Feb 2020 09:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACAvsv6tVhmHFR=T=L5SyjO3u6-U6_x2pEdHzR+03LZY8NNEkw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1506448243=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1506448243==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NPRbMYQbfd3TM2ChtCnbBLAhZhxFLs7JG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NPRbMYQbfd3TM2ChtCnbBLAhZhxFLs7JG
Content-Type: multipart/mixed; boundary="4nGCpGyzJ5h89HIiGfJVQA8DFXV2j5iJj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ben Skeggs <skeggsb@gmail.com>, James Jones <jajones@nvidia.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <9a310fff-4b01-b215-5553-acebd8d2d8e8@suse.de>
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
 <5d0bc649-9d82-295e-fe00-58e9350f6d94@suse.de>
 <5d18f259-9d1c-2b83-428d-6e21b6cf779c@nvidia.com>
 <9695f3cf-076a-de49-53c9-75944bb4fb8b@nvidia.com>
 <CACAvsv6tVhmHFR=T=L5SyjO3u6-U6_x2pEdHzR+03LZY8NNEkw@mail.gmail.com>
In-Reply-To: <CACAvsv6tVhmHFR=T=L5SyjO3u6-U6_x2pEdHzR+03LZY8NNEkw@mail.gmail.com>

--4nGCpGyzJ5h89HIiGfJVQA8DFXV2j5iJj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.02.20 um 09:20 schrieb Ben Skeggs:
> On Sat, 8 Feb 2020 at 07:10, James Jones <jajones@nvidia.com> wrote:
>>
>> I've sent out a v4 version of the format modifier patches which avoid
>> caching values in the nouveau_framebuffer struct.  It will have a few
>> trivial conflicts with your series, but should make them structurally
>> compatible.
>>
>> I'm fine with either v3 or v4 of my series personally, but if these
>> cleanup patches are taken, only v4 will work.
> I've taken Tomas' cleanup patches in my tree, and will take James'
> also once they've been fixed up to work on top of the cleanup.

Thanks!

>=20
> James, are you happy for me to take the drm_fourcc.h patch that's on
> dri-devel through my tree for the next merge window too?
>=20
> Ben.
>=20
>>
>> Thanks,
>> -James
>>
>> On 2/6/20 8:45 AM, James Jones wrote:
>>> Yes, that's certainly viable.  If that's the general preference in
>>> direction, I'll rework that patches to do so.
>>>
>>> Thanks,
>>> -James
>>>
>>> On 2/6/20 7:49 AM, Thomas Zimmermann wrote:
>>>> Hi James
>>>>
>>>> Am 06.02.20 um 16:17 schrieb James Jones:
>>>>> Note I'm adding some fields to nouveau_framebuffer in the series
>>>>> "drm/nouveau: Support NVIDIA format modifiers."  I sent out v3 of t=
hat
>>>>> yesterday.  It would probably still be possible to avoid them by
>>>>> re-extracting the relevant data from the format modifier on the fly=
 when
>>>>> needed, but it is simpler and likely less error-prone with the wrap=
per
>>>>> struct.
>>>>
>>>> Thanks for the note.
>>>>
>>>> I just took a look at your patchset. I think struct nouveau_framebuf=
fer
>>>> should not store tile_mode and kind. AFAICT there are only two trivi=
al
>>>> places where these values are used and they can be extracted from th=
e
>>>> framebuffer at any time.
>>>>
>>>> I'd suggest to expand nouveau_decode_mod() to take a drm_framebuffer=
 and
>>>> return the correct values. Kind of what you do in
>>>> nouveau_framebuffer_new() near line 330.
>>>>
>>>> Thoughts?
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1] https://patchwork.freedesktop.org/series/70786/#rev3
>>>>
>>>>>
>>>>> Thanks,
>>>>> -James
>>>>>
>>>>> On 2/6/20 2:19 AM, Thomas Zimmermann wrote:
>>>>>> After its cleanup, struct nouveau_framebuffer is only a wrapper ar=
ound
>>>>>> struct drm_framebuffer. Use the latter directly.
>>>>>>
>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> ---
>>>>>>    drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 26
>>>>>> +++++++++++------------
>>>>>>    drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++++++------
>>>>>>    drivers/gpu/drm/nouveau/nouveau_display.h | 12 +----------
>>>>>>    drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 14 ++++++------
>>>>>>    4 files changed, 28 insertions(+), 38 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>> index ba1399965a1c..4a67a656e007 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>> @@ -40,11 +40,11 @@ nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma
>>>>>> *ctxdma)
>>>>>>    }
>>>>>>      static struct nv50_wndw_ctxdma *
>>>>>> -nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct
>>>>>> nouveau_framebuffer *fb)
>>>>>> +nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuff=
er
>>>>>> *fb)
>>>>>>    {
>>>>>> -    struct nouveau_drm *drm =3D nouveau_drm(fb->base.dev);
>>>>>> +    struct nouveau_drm *drm =3D nouveau_drm(fb->dev);
>>>>>>        struct nv50_wndw_ctxdma *ctxdma;
>>>>>> -    struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->base.obj[0=
]);
>>>>>> +    struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->obj[0]);
>>>>>>        const u8    kind =3D nvbo->kind;
>>>>>>        const u32 handle =3D 0xfb000000 | kind;
>>>>>>        struct {
>>>>>> @@ -236,16 +236,16 @@ nv50_wndw_atomic_check_acquire(struct nv50_w=
ndw
>>>>>> *wndw, bool modeset,
>>>>>>                       struct nv50_wndw_atom *asyw,
>>>>>>                       struct nv50_head_atom *asyh)
>>>>>>    {
>>>>>> -    struct nouveau_framebuffer *fb =3D
>>>>>> nouveau_framebuffer(asyw->state.fb);
>>>>>> +    struct drm_framebuffer *fb =3D asyw->state.fb;
>>>>>>        struct nouveau_drm *drm =3D nouveau_drm(wndw->plane.dev);
>>>>>> -    struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->base.obj[0=
]);
>>>>>> +    struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->obj[0]);
>>>>>>        int ret;
>>>>>>          NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
>>>>>>    -    if (asyw->state.fb !=3D armw->state.fb || !armw->visible |=
|
>>>>>> modeset) {
>>>>>> -        asyw->image.w =3D fb->base.width;
>>>>>> -        asyw->image.h =3D fb->base.height;
>>>>>> +    if (fb !=3D armw->state.fb || !armw->visible || modeset) {
>>>>>> +        asyw->image.w =3D fb->width;
>>>>>> +        asyw->image.h =3D fb->height;
>>>>>>            asyw->image.kind =3D nvbo->kind;
>>>>>>              ret =3D nv50_wndw_atomic_check_acquire_rgb(asyw);
>>>>>> @@ -261,13 +261,13 @@ nv50_wndw_atomic_check_acquire(struct nv50_w=
ndw
>>>>>> *wndw, bool modeset,
>>>>>>                    asyw->image.blockh =3D nvbo->mode >> 4;
>>>>>>                else
>>>>>>                    asyw->image.blockh =3D nvbo->mode;
>>>>>> -            asyw->image.blocks[0] =3D fb->base.pitches[0] / 64;
>>>>>> +            asyw->image.blocks[0] =3D fb->pitches[0] / 64;
>>>>>>                asyw->image.pitch[0] =3D 0;
>>>>>>            } else {
>>>>>>                asyw->image.layout =3D 1;
>>>>>>                asyw->image.blockh =3D 0;
>>>>>>                asyw->image.blocks[0] =3D 0;
>>>>>> -            asyw->image.pitch[0] =3D fb->base.pitches[0];
>>>>>> +            asyw->image.pitch[0] =3D fb->pitches[0];
>>>>>>            }
>>>>>>              if (!asyh->state.async_flip)
>>>>>> @@ -486,16 +486,16 @@ nv50_wndw_cleanup_fb(struct drm_plane *plane=
,
>>>>>> struct drm_plane_state *old_state)
>>>>>>    static int
>>>>>>    nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_=
state
>>>>>> *state)
>>>>>>    {
>>>>>> -    struct nouveau_framebuffer *fb =3D nouveau_framebuffer(state-=
>fb);
>>>>>> +    struct drm_framebuffer *fb =3D state->fb;
>>>>>>        struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
>>>>>>        struct nv50_wndw *wndw =3D nv50_wndw(plane);
>>>>>>        struct nv50_wndw_atom *asyw =3D nv50_wndw_atom(state);
>>>>>> -    struct nouveau_bo *nvbo =3D nouveau_gem_object(state->fb->obj=
[0]);
>>>>>> +    struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->obj[0]);
>>>>>>        struct nv50_head_atom *asyh;
>>>>>>        struct nv50_wndw_ctxdma *ctxdma;
>>>>>>        int ret;
>>>>>>    -    NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, state->fb)=
;
>>>>>> +    NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
>>>>>>        if (!asyw->state.fb)
>>>>>>            return 0;
>>>>>>    diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> b/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> index bbbff55eb5d5..94f7fd48e1cf 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> @@ -207,10 +207,10 @@ int
>>>>>>    nouveau_framebuffer_new(struct drm_device *dev,
>>>>>>                const struct drm_mode_fb_cmd2 *mode_cmd,
>>>>>>                struct drm_gem_object *gem,
>>>>>> -            struct nouveau_framebuffer **pfb)
>>>>>> +            struct drm_framebuffer **pfb)
>>>>>>    {
>>>>>>        struct nouveau_drm *drm =3D nouveau_drm(dev);
>>>>>> -    struct nouveau_framebuffer *fb;
>>>>>> +    struct drm_framebuffer *fb;
>>>>>>        int ret;
>>>>>>              /* YUV overlays have special requirements pre-NV50 */=

>>>>>> @@ -236,10 +236,10 @@ nouveau_framebuffer_new(struct drm_device *d=
ev,
>>>>>>        if (!(fb =3D *pfb =3D kzalloc(sizeof(*fb), GFP_KERNEL)))
>>>>>>            return -ENOMEM;
>>>>>>    -    drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
>>>>>> -    fb->base.obj[0] =3D gem;
>>>>>> +    drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>>>>>> +    fb->obj[0] =3D gem;
>>>>>>    -    ret =3D drm_framebuffer_init(dev, &fb->base,
>>>>>> &nouveau_framebuffer_funcs);
>>>>>> +    ret =3D drm_framebuffer_init(dev, fb, &nouveau_framebuffer_fu=
ncs);
>>>>>>        if (ret)
>>>>>>            kfree(fb);
>>>>>>        return ret;
>>>>>> @@ -250,7 +250,7 @@ nouveau_user_framebuffer_create(struct drm_dev=
ice
>>>>>> *dev,
>>>>>>                    struct drm_file *file_priv,
>>>>>>                    const struct drm_mode_fb_cmd2 *mode_cmd)
>>>>>>    {
>>>>>> -    struct nouveau_framebuffer *fb;
>>>>>> +    struct drm_framebuffer *fb;
>>>>>>        struct drm_gem_object *gem;
>>>>>>        int ret;
>>>>>>    @@ -260,7 +260,7 @@ nouveau_user_framebuffer_create(struct
>>>>>> drm_device *dev,
>>>>>>          ret =3D nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);=

>>>>>>        if (ret =3D=3D 0)
>>>>>> -        return &fb->base;
>>>>>> +        return fb;
>>>>>>          drm_gem_object_put_unlocked(gem);
>>>>>>        return ERR_PTR(ret);
>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>> b/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>> index 56c1dec8fc28..082bb067d575 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>> @@ -8,21 +8,11 @@
>>>>>>      #include <drm/drm_framebuffer.h>
>>>>>>    -struct nouveau_framebuffer {
>>>>>> -    struct drm_framebuffer base;
>>>>>> -};
>>>>>> -
>>>>>> -static inline struct nouveau_framebuffer *
>>>>>> -nouveau_framebuffer(struct drm_framebuffer *fb)
>>>>>> -{
>>>>>> -    return container_of(fb, struct nouveau_framebuffer, base);
>>>>>> -}
>>>>>> -
>>>>>>    int
>>>>>>    nouveau_framebuffer_new(struct drm_device *dev,
>>>>>>                const struct drm_mode_fb_cmd2 *mode_cmd,
>>>>>>                struct drm_gem_object *gem,
>>>>>> -            struct nouveau_framebuffer **pfb);
>>>>>> +            struct drm_framebuffer **pfb);
>>>>>>      struct nouveau_display {
>>>>>>        void *priv;
>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>> index 02b36b44409c..d78bc03ad3b8 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>> @@ -312,7 +312,7 @@ nouveau_fbcon_create(struct drm_fb_helper *hel=
per,
>>>>>>        struct nouveau_drm *drm =3D nouveau_drm(dev);
>>>>>>        struct nvif_device *device =3D &drm->client.device;
>>>>>>        struct fb_info *info;
>>>>>> -    struct nouveau_framebuffer *fb;
>>>>>> +    struct drm_framebuffer *fb;
>>>>>>        struct nouveau_channel *chan;
>>>>>>        struct nouveau_bo *nvbo;
>>>>>>        struct drm_mode_fb_cmd2 mode_cmd;
>>>>>> @@ -367,7 +367,7 @@ nouveau_fbcon_create(struct drm_fb_helper *hel=
per,
>>>>>>        }
>>>>>>          /* setup helper */
>>>>>> -    fbcon->helper.fb =3D &fb->base;
>>>>>> +    fbcon->helper.fb =3D fb;
>>>>>>          if (!chan)
>>>>>>            info->flags =3D FBINFO_HWACCEL_DISABLED;
>>>>>> @@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *hel=
per,
>>>>>>          /* To allow resizeing without swapping buffers */
>>>>>>        NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
>>>>>> -        fb->base.width, fb->base.height, nvbo->bo.offset, nvbo);
>>>>>> +        fb->width, fb->height, nvbo->bo.offset, nvbo);
>>>>>>          vga_switcheroo_client_fb_set(dev->pdev, info);
>>>>>>        return 0;
>>>>>> @@ -413,18 +413,18 @@ nouveau_fbcon_create(struct drm_fb_helper
>>>>>> *helper,
>>>>>>    static int
>>>>>>    nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fb=
dev
>>>>>> *fbcon)
>>>>>>    {
>>>>>> -    struct nouveau_framebuffer *nouveau_fb =3D
>>>>>> nouveau_framebuffer(fbcon->helper.fb);
>>>>>> +    struct drm_framebuffer *fb =3D fbcon->helper.fb;
>>>>>>        struct nouveau_bo *nvbo;
>>>>>>          drm_fb_helper_unregister_fbi(&fbcon->helper);
>>>>>>        drm_fb_helper_fini(&fbcon->helper);
>>>>>>    -    if (nouveau_fb && nouveau_fb->base.obj[0]) {
>>>>>> -        nvbo =3D nouveau_gem_object(nouveau_fb->base.obj[0]);
>>>>>> +    if (fb && fb->obj[0]) {
>>>>>> +        nvbo =3D nouveau_gem_object(fb->obj[0]);
>>>>>>            nouveau_vma_del(&fbcon->vma);
>>>>>>            nouveau_bo_unmap(nvbo);
>>>>>>            nouveau_bo_unpin(nvbo);
>>>>>> -        drm_framebuffer_put(&nouveau_fb->base);
>>>>>> +        drm_framebuffer_put(fb);
>>>>>>        }
>>>>>>          return 0;
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4nGCpGyzJ5h89HIiGfJVQA8DFXV2j5iJj--

--NPRbMYQbfd3TM2ChtCnbBLAhZhxFLs7JG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5BE3MACgkQaA3BHVML
eiOOIggAhjGL1HEKNdpH1LemDGqgX68dvy4lczQl/Puk1izpUi/X2lGEudOmLyX9
sJP98RZ8QiH9RRho2LUzdoUEZnch4+wFna8bbqPVVVvqn2Dow+7MXA+2c/lJJMHU
Uy7DqmTz9v0OUD4HVSRBG1e254aipDzaznC1kV7RwjF2j7V2xqOIoJuTeurCpdtu
/nAdU1bI08XRoHNkIlO1CGZbM9z7hLda7bn/rfdJ6C4PpNXAH15Ia7h9TAiFDjZC
Nc34MDC6bwefHLMLDBz0MPyFuT12aPg4HQ57ggL4l0BMdoxKVYmFWddZp3qaHq7C
CdPB4r1GKoY+kX99KC5QpiqRXQ3fGA==
=oZeT
-----END PGP SIGNATURE-----

--NPRbMYQbfd3TM2ChtCnbBLAhZhxFLs7JG--

--===============1506448243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1506448243==--
