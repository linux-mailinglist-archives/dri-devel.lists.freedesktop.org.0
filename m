Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712B154877
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 16:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D96FA91;
	Thu,  6 Feb 2020 15:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCD66FA8F;
 Thu,  6 Feb 2020 15:49:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C837FAAC3;
 Thu,  6 Feb 2020 15:49:05 +0000 (UTC)
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
To: James Jones <jajones@nvidia.com>, bskeggs@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
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
Message-ID: <5d0bc649-9d82-295e-fe00-58e9350f6d94@suse.de>
Date: Thu, 6 Feb 2020 16:49:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1448760699=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1448760699==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HeUOTMaE8TN8TT7hYdqpz126qdsCO5Kbg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HeUOTMaE8TN8TT7hYdqpz126qdsCO5Kbg
Content-Type: multipart/mixed; boundary="sNVNvhm46SDi3Qn6bDvkPVTIbN3y9aNAG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: James Jones <jajones@nvidia.com>, bskeggs@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <5d0bc649-9d82-295e-fe00-58e9350f6d94@suse.de>
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
In-Reply-To: <616dead7-030a-b678-3040-9e317549812e@nvidia.com>

--sNVNvhm46SDi3Qn6bDvkPVTIbN3y9aNAG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi James

Am 06.02.20 um 16:17 schrieb James Jones:
> Note I'm adding some fields to nouveau_framebuffer in the series
> "drm/nouveau: Support NVIDIA format modifiers."=C2=A0 I sent out v3 of =
that
> yesterday.=C2=A0 It would probably still be possible to avoid them by
> re-extracting the relevant data from the format modifier on the fly whe=
n
> needed, but it is simpler and likely less error-prone with the wrapper
> struct.

Thanks for the note.

I just took a look at your patchset. I think struct nouveau_framebuffer
should not store tile_mode and kind. AFAICT there are only two trivial
places where these values are used and they can be extracted from the
framebuffer at any time.

I'd suggest to expand nouveau_decode_mod() to take a drm_framebuffer and
return the correct values. Kind of what you do in
nouveau_framebuffer_new() near line 330.

Thoughts?

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/70786/#rev3

>=20
> Thanks,
> -James
>=20
> On 2/6/20 2:19 AM, Thomas Zimmermann wrote:
>> After its cleanup, struct nouveau_framebuffer is only a wrapper around=

>> struct drm_framebuffer. Use the latter directly.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/wndw.c=C2=A0=C2=A0 | 26 ++++++=
+++++------------
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++++++------
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_display.h | 12 +----------
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_fbcon.c=C2=A0=C2=A0 | 14 ++++++=
------
>> =C2=A0 4 files changed, 28 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> index ba1399965a1c..4a67a656e007 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> @@ -40,11 +40,11 @@ nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma *ctxd=
ma)
>> =C2=A0 }
>> =C2=A0 =C2=A0 static struct nv50_wndw_ctxdma *
>> -nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct
>> nouveau_framebuffer *fb)
>> +nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *=
fb)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm(fb->base.d=
ev);
>> +=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm(fb->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw_ctxdma *ctxdma;
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo =3D nouveau_gem_object(fb-=
>base.obj[0]);
>> +=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo =3D nouveau_gem_object(fb-=
>obj[0]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u8=C2=A0=C2=A0=C2=A0 kind =3D nvb=
o->kind;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u32 handle =3D 0xfb000000 | kind;=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>> @@ -236,16 +236,16 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw
>> *wndw, bool modeset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw_atom *a=
syw,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_head_atom *a=
syh)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_framebuffer *fb =3D
>> nouveau_framebuffer(asyw->state.fb);
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb =3D asyw->state.fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm=
(wndw->plane.dev);
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo =3D nouveau_gem_object(fb-=
>base.obj[0]);
>> +=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo =3D nouveau_gem_object(fb-=
>obj[0]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NV_ATOMIC(drm, "%s acquire\n", w=
ndw->plane.name);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (asyw->state.fb !=3D armw->state.fb || !=
armw->visible ||
>> modeset) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.w =3D fb->base=
=2Ewidth;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.h =3D fb->base=
=2Eheight;
>> +=C2=A0=C2=A0=C2=A0 if (fb !=3D armw->state.fb || !armw->visible || mo=
deset) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.w =3D fb->widt=
h;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.h =3D fb->heig=
ht;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.kin=
d =3D nvbo->kind;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D =
nv50_wndw_atomic_check_acquire_rgb(asyw);
>> @@ -261,13 +261,13 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw
>> *wndw, bool modeset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.blockh =3D nvbo->mode >> 4;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asyw->image.blockh =3D nvbo->mode;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
yw->image.blocks[0] =3D fb->base.pitches[0] / 64;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
yw->image.blocks[0] =3D fb->pitches[0] / 64;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 asyw->image.pitch[0] =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 asyw->image.layout =3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 asyw->image.blockh =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 asyw->image.blocks[0] =3D 0;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
yw->image.pitch[0] =3D fb->base.pitches[0];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
yw->image.pitch[0] =3D fb->pitches[0];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!asy=
h->state.async_flip)
>> @@ -486,16 +486,16 @@ nv50_wndw_cleanup_fb(struct drm_plane *plane,
>> struct drm_plane_state *old_state)
>> =C2=A0 static int
>> =C2=A0 nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_=
state
>> *state)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_framebuffer *fb =3D nouveau_framebu=
ffer(state->fb);
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb =3D state->fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm=
(plane->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw *wndw =3D nv50_wndw(pl=
ane);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw_atom *asyw =3D nv50_wn=
dw_atom(state);
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo =3D nouveau_gem_object(sta=
te->fb->obj[0]);
>> +=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo =3D nouveau_gem_object(fb-=
>obj[0]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_head_atom *asyh;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw_ctxdma *ctxdma;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 NV_ATOMIC(drm, "%s prepare: %p\n", plane->n=
ame, state->fb);
>> +=C2=A0=C2=A0=C2=A0 NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!asyw->state.fb)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
>> b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index bbbff55eb5d5..94f7fd48e1cf 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -207,10 +207,10 @@ int
>> =C2=A0 nouveau_framebuffer_new(struct drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 const struct drm_mode_fb_cmd2 *mode_cmd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct drm_gem_object *gem,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct nouveau_framebuffer **pfb)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_framebuffer **pfb)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm=
(dev);
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_framebuffer *fb;
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* YUV o=
verlays have special requirements pre-NV50 */
>> @@ -236,10 +236,10 @@ nouveau_framebuffer_new(struct drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(fb =3D *pfb =3D kzalloc(sizeof(*f=
b), GFP_KERNEL)))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;=

>> =C2=A0 -=C2=A0=C2=A0=C2=A0 drm_helper_mode_fill_fb_struct(dev, &fb->ba=
se, mode_cmd);
>> -=C2=A0=C2=A0=C2=A0 fb->base.obj[0] =3D gem;
>> +=C2=A0=C2=A0=C2=A0 drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);=

>> +=C2=A0=C2=A0=C2=A0 fb->obj[0] =3D gem;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D drm_framebuffer_init(dev, &fb->base=
,
>> &nouveau_framebuffer_funcs);
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_framebuffer_init(dev, fb, &nouveau_fra=
mebuffer_funcs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(fb);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> @@ -250,7 +250,7 @@ nouveau_user_framebuffer_create(struct drm_device
>> *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_mode_fb_cmd2 *mode_cmd)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_framebuffer *fb;
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *gem;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 @@ -260,7 +260,7 @@ nouveau_user_framebuffer_create(struct
>> drm_device *dev,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D nouveau_framebuffer_new(=
dev, mode_cmd, gem, &fb);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return &fb->base;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return fb;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_put_unlocked(gem)=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h
>> b/drivers/gpu/drm/nouveau/nouveau_display.h
>> index 56c1dec8fc28..082bb067d575 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
>> @@ -8,21 +8,11 @@
>> =C2=A0 =C2=A0 #include <drm/drm_framebuffer.h>
>> =C2=A0 -struct nouveau_framebuffer {
>> -=C2=A0=C2=A0=C2=A0 struct drm_framebuffer base;
>> -};
>> -
>> -static inline struct nouveau_framebuffer *
>> -nouveau_framebuffer(struct drm_framebuffer *fb)
>> -{
>> -=C2=A0=C2=A0=C2=A0 return container_of(fb, struct nouveau_framebuffer=
, base);
>> -}
>> -
>> =C2=A0 int
>> =C2=A0 nouveau_framebuffer_new(struct drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 const struct drm_mode_fb_cmd2 *mode_cmd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct drm_gem_object *gem,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct nouveau_framebuffer **pfb);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_framebuffer **pfb);
>> =C2=A0 =C2=A0 struct nouveau_display {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *priv;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> index 02b36b44409c..d78bc03ad3b8 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> @@ -312,7 +312,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm=
(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvif_device *device =3D &drm->cl=
ient.device;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct fb_info *info;
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_framebuffer *fb;
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_channel *chan;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mode_fb_cmd2 mode_cmd;
>> @@ -367,7 +367,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* setup helper */
>> -=C2=A0=C2=A0=C2=A0 fbcon->helper.fb =3D &fb->base;
>> +=C2=A0=C2=A0=C2=A0 fbcon->helper.fb =3D fb;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!chan)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->flags =3D=
 FBINFO_HWACCEL_DISABLED;
>> @@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,=

>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* To allow resizeing without sw=
apping buffers */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NV_INFO(drm, "allocated %dx%d fb: 0x%ll=
x, bo %p\n",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb->base.width, fb->base.h=
eight, nvbo->bo.offset, nvbo);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb->width, fb->height, nvb=
o->bo.offset, nvbo);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vga_switcheroo_client_fb_set(dev=
->pdev, info);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> @@ -413,18 +413,18 @@ nouveau_fbcon_create(struct drm_fb_helper *helpe=
r,
>> =C2=A0 static int
>> =C2=A0 nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fb=
dev
>> *fbcon)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct nouveau_framebuffer *nouveau_fb =3D
>> nouveau_framebuffer(fbcon->helper.fb);
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb =3D fbcon->helper.fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_bo *nvbo;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_fb_helper_unregister_fbi(&fb=
con->helper);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_fb_helper_fini(&fbcon->helper);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (nouveau_fb && nouveau_fb->base.obj[0]) =
{
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo =3D nouveau_gem_objec=
t(nouveau_fb->base.obj[0]);
>> +=C2=A0=C2=A0=C2=A0 if (fb && fb->obj[0]) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo =3D nouveau_gem_objec=
t(fb->obj[0]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouveau_vma_del=
(&fbcon->vma);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouveau_bo_unma=
p(nvbo);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouveau_bo_unpi=
n(nvbo);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_framebuffer_put(&nouve=
au_fb->base);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_framebuffer_put(fb);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--sNVNvhm46SDi3Qn6bDvkPVTIbN3y9aNAG--

--HeUOTMaE8TN8TT7hYdqpz126qdsCO5Kbg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl48NXAACgkQaA3BHVML
eiOiqAf/cByeQ2E9fP0tKxMwfnOeoPTkt7mTUMr6le8zR5e9S4eNnZKY0GZ10cqZ
DBpGY7cO/nWFGbxZxNGKS3kgQjllmvGz3jzVOwMZ/2CvasHe8EKtO/N6cyUwlmHd
Xvf9aNOovQP5WZ4Kfsc+2pIUdgev+qpnhHz3KNYbtt9UhkD7m+l9JrngTmNf1PiV
weAvT6tKRX0iNb/N6gNd8JbHE1K+Cy/3QV6FnkjngJJBRAQlADELRcBb8gVsmQLb
xVbDrZyHcDf2fO89qA91wL8vwlPK41gnxKHbFiRBjrU3BB4olTvvWv3BHD31GJc1
Sl9xRTGA+PbdLMQZ47bBk6qlnu1L9Q==
=lrmz
-----END PGP SIGNATURE-----

--HeUOTMaE8TN8TT7hYdqpz126qdsCO5Kbg--

--===============1448760699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1448760699==--
