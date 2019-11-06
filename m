Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A9F12A1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF026EC8E;
	Wed,  6 Nov 2019 09:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE836EC87
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:46:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5772CB45E;
 Wed,  6 Nov 2019 09:46:54 +0000 (UTC)
Subject: Re: [PATCH 8/9] drm/ast: Add cursor plane
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-9-tzimmermann@suse.de>
 <20191105095551.GB10326@phenom.ffwll.local>
 <0cf6145b-c966-a3a2-f956-5a5ab6cd375f@suse.de>
 <CAKMK7uE6D+kdTg0UZ109QNo2Xhts+EyVz18dDtpjny8x1qUSgA@mail.gmail.com>
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
Message-ID: <94b802d6-3b02-0ab1-f062-f6fa24dc70f2@suse.de>
Date: Wed, 6 Nov 2019 10:46:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE6D+kdTg0UZ109QNo2Xhts+EyVz18dDtpjny8x1qUSgA@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Dave Airlie <airlied@redhat.com>,
 chen@aspeedtech.com, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0356457088=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0356457088==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YhlaT83rZPp2TPwJxZtWc0j2IOf0g3S78"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YhlaT83rZPp2TPwJxZtWc0j2IOf0g3S78
Content-Type: multipart/mixed; boundary="2L4jbID85JcNf9NyMM6NOVGI6y2NtrWch";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: chen@aspeedtech.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <94b802d6-3b02-0ab1-f062-f6fa24dc70f2@suse.de>
Subject: Re: [PATCH 8/9] drm/ast: Add cursor plane
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-9-tzimmermann@suse.de>
 <20191105095551.GB10326@phenom.ffwll.local>
 <0cf6145b-c966-a3a2-f956-5a5ab6cd375f@suse.de>
 <CAKMK7uE6D+kdTg0UZ109QNo2Xhts+EyVz18dDtpjny8x1qUSgA@mail.gmail.com>
In-Reply-To: <CAKMK7uE6D+kdTg0UZ109QNo2Xhts+EyVz18dDtpjny8x1qUSgA@mail.gmail.com>

--2L4jbID85JcNf9NyMM6NOVGI6y2NtrWch
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.11.19 um 10:05 schrieb Daniel Vetter:
> On Wed, Nov 6, 2019 at 9:31 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi
>>
>> Am 05.11.19 um 10:55 schrieb Daniel Vetter:
>>> On Mon, Oct 28, 2019 at 04:49:27PM +0100, Thomas Zimmermann wrote:
>>>> The cursor plane uses an internal format of ARGB4444. To userspace, =
we
>>>> announce ARGB8888 and do the transformation internally.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> Hm, might be fun to also expose the ARGB4444 directly. Not that anyon=
e
>>> will actually use it :-/
>>
>> Is that a serious proposal? I thought about ARGB4444 and quickly
>> dismissed it because no one will ever support it anyway.
>=20
> For cursor maybe not, but in other cases where we added the
> RGB8888->native format hack because userspace, we did make sure that
> the driver exposes the native formats too. Up to you really.

I see. In that case, I'd like to continue with the patchset as-is, but
provide ARGB4444 in a later patch.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>> ---
>>>>  drivers/gpu/drm/ast/ast_drv.h  |   1 +
>>>>  drivers/gpu/drm/ast/ast_mode.c | 161 ++++++++++++++++++++++++++++++=
++-
>>>>  2 files changed, 161 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast=
_drv.h
>>>> index 13560622f22a..49557a73390f 100644
>>>> --- a/drivers/gpu/drm/ast/ast_drv.h
>>>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>>>> @@ -122,6 +122,7 @@ struct ast_private {
>>>>      } cursor;
>>>>
>>>>      struct drm_plane primary_plane;
>>>> +    struct drm_plane cursor_plane;
>>>>
>>>>      bool support_wide_screen;
>>>>      enum {
>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/as=
t_mode.c
>>>> index 7667f4502eb9..f5f73200e8e4 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -54,6 +54,16 @@ static int ast_cursor_move(struct drm_crtc *crtc,=

>>>>                         int x, int y);
>>>>
>>>>
>>>> +static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int heigh=
t);
>>>> +static int ast_cursor_update(void *dst, void *src, unsigned int wid=
th,
>>>> +                         unsigned int height);
>>>> +static void ast_cursor_set_base(struct ast_private *ast, u64 addres=
s);
>>>> +static int ast_show_cursor(struct drm_crtc *crtc, void *src,
>>>> +                       unsigned int width, unsigned int height);
>>>> +static void ast_hide_cursor(struct drm_crtc *crtc);
>>>> +static int ast_cursor_move(struct drm_crtc *crtc,
>>>> +                       int x, int y);
>>>> +
>>>>  static inline void ast_load_palette_index(struct ast_private *ast,
>>>>                                   u8 index, u8 red, u8 green,
>>>>                                   u8 blue)
>>>> @@ -594,6 +604,139 @@ static const struct drm_plane_funcs ast_primar=
y_plane_funcs =3D {
>>>>      .format_mod_supported =3D NULL,
>>>>  };
>>>>
>>>> +/*
>>>> + * Cursor plane
>>>> + */
>>>> +
>>>> +static int
>>>> +ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
>>>> +                               struct drm_plane_state *new_state)
>>>> +{
>>>> +    struct drm_framebuffer *fb =3D new_state->fb;
>>>> +    struct drm_crtc *crtc =3D new_state->crtc;
>>>> +    struct drm_gem_vram_object *gbo;
>>>> +    struct ast_private *ast;
>>>> +    int ret;
>>>> +    void *src, *dst;
>>>> +
>>>> +    if (!crtc || !fb)
>>>> +            return 0;
>>>> +
>>>> +    if (fb->width > AST_MAX_HWC_WIDTH || fb->height > AST_MAX_HWC_H=
EIGHT)
>>>> +            return -EINVAL;
>>>> +
>>>> +    ast =3D crtc->dev->dev_private;
>>>> +
>>>> +    gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>>>> +    src =3D drm_gem_vram_vmap(gbo);
>>>> +    if (IS_ERR(src)) {
>>>> +            ret =3D PTR_ERR(src);
>>>> +            goto err_drm_gem_vram_unpin;
>>>> +    }
>>>> +
>>>> +    dst =3D drm_gem_vram_vmap(ast->cursor.gbo[ast->cursor.next_inde=
x]);
>>>> +    if (IS_ERR(dst)) {
>>>> +            ret =3D PTR_ERR(dst);
>>>> +            goto err_drm_gem_vram_vunmap_src;
>>>> +    }
>>>> +
>>>> +    ret =3D ast_cursor_update(dst, src, fb->width, fb->height);
>>>> +    if (ret)
>>>> +            goto err_drm_gem_vram_vunmap_dst;
>>>> +
>>>> +    /* Always unmap buffers here. Destination buffers are
>>>> +     * perma-pinned while the driver is active. We're only
>>>> +     * changing ref-counters here.
>>>> +     */
>>>> +    drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], ds=
t);
>>>> +    drm_gem_vram_vunmap(gbo, src);
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err_drm_gem_vram_vunmap_dst:
>>>> +    drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], ds=
t);
>>>> +err_drm_gem_vram_vunmap_src:
>>>> +    drm_gem_vram_vunmap(gbo, src);
>>>> +err_drm_gem_vram_unpin:
>>>> +    drm_gem_vram_unpin(gbo);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int ast_cursor_plane_helper_atomic_check(struct drm_plane *p=
lane,
>>>> +                                            struct drm_plane_state =
*state)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void
>>>> +ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>>>> +                                  struct drm_plane_state *old_state=
)
>>>> +{
>>>> +    struct drm_plane_state *state =3D plane->state;
>>>> +    struct drm_crtc *crtc =3D state->crtc;
>>>> +    struct drm_framebuffer *fb =3D state->fb;
>>>> +    struct ast_private *ast =3D plane->dev->dev_private;
>>>> +    struct ast_crtc *ast_crtc =3D to_ast_crtc(crtc);
>>>> +    struct drm_gem_vram_object *gbo;
>>>> +    s64 off;
>>>> +    u8 jreg;
>>>> +
>>>> +    ast_crtc->offset_x =3D AST_MAX_HWC_WIDTH - fb->width;
>>>> +    ast_crtc->offset_y =3D AST_MAX_HWC_WIDTH - fb->height;
>>>> +
>>>> +    if (state->fb !=3D old_state->fb) {
>>>> +            /* A new cursor image was installed. */
>>>> +            gbo =3D ast->cursor.gbo[ast->cursor.next_index];
>>>> +            off =3D drm_gem_vram_offset(gbo);
>>>> +            if (WARN_ON_ONCE(off < 0))
>>>> +                    return; /* Bug: we didn't pin cursor HW BO to V=
RAM. */
>>>> +            ast_cursor_set_base(ast, off);
>>>> +
>>>> +            ++ast->cursor.next_index;
>>>> +            ast->cursor.next_index %=3D ARRAY_SIZE(ast->cursor.gbo)=
;
>>>> +    }
>>>> +
>>>> +    ast_cursor_move(crtc, state->crtc_x, state->crtc_y);
>>>> +
>>>> +    jreg =3D 0x2;
>>>> +    /* enable ARGB cursor */
>>>> +    jreg |=3D 1;
>>>> +    ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg)=
;
>>>> +}
>>>> +
>>>> +static void
>>>> +ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
>>>> +                                   struct drm_plane_state *old_stat=
e)
>>>> +{
>>>> +    struct ast_private *ast =3D plane->dev->dev_private;
>>>> +
>>>> +    ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00)=
;
>>>> +}
>>>> +
>>>> +static const struct drm_plane_helper_funcs ast_cursor_plane_helper_=
funcs =3D {
>>>> +    .prepare_fb =3D ast_cursor_plane_helper_prepare_fb,
>>>> +    .cleanup_fb =3D NULL, /* not required for cursor plane */
>>>> +    .atomic_check =3D ast_cursor_plane_helper_atomic_check,
>>>> +    .atomic_update =3D ast_cursor_plane_helper_atomic_update,
>>>> +    .atomic_disable =3D ast_cursor_plane_helper_atomic_disable,
>>>> +};
>>>> +
>>>> +static const struct drm_plane_funcs ast_cursor_plane_funcs =3D {
>>>> +    .update_plane =3D drm_atomic_helper_update_plane,
>>>> +    .disable_plane =3D drm_atomic_helper_disable_plane,
>>>> +    .destroy =3D drm_plane_cleanup,
>>>> +    .reset =3D drm_atomic_helper_plane_reset,
>>>> +    .set_property =3D NULL,
>>>> +    .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_s=
tate,
>>>> +    .atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state=
,
>>>> +    .atomic_set_property =3D NULL,
>>>> +    .atomic_get_property =3D NULL,
>>>> +    .late_register =3D NULL,
>>>> +    .early_unregister =3D NULL,
>>>> +    .atomic_print_state =3D NULL,
>>>> +    .format_mod_supported =3D NULL,
>>>> +};
>>>> +
>>>>  /*
>>>>   * CRTC
>>>>   */
>>>> @@ -883,7 +1026,8 @@ static int ast_crtc_init(struct drm_device *dev=
)
>>>>              return -ENOMEM;
>>>>
>>>>      ret =3D drm_crtc_init_with_planes(dev, &crtc->base, &ast->prima=
ry_plane,
>>>> -                                    NULL, &ast_crtc_funcs, NULL);
>>>> +                                    &ast->cursor_plane, &ast_crtc_f=
uncs,
>>>> +                                    NULL);
>>>>      if (ret)
>>>>              goto err_kfree;
>>>>
>>>> @@ -1153,6 +1297,9 @@ int ast_mode_init(struct drm_device *dev)
>>>>              DRM_FORMAT_RGB565,
>>>>              DRM_FORMAT_C8,
>>>>      };
>>>> +    static const uint32_t cursor_plane_formats[] =3D {
>>>> +            DRM_FORMAT_ARGB8888,
>>>> +    };
>>>>
>>>>      struct ast_private *ast =3D dev->dev_private;
>>>>      int ret;
>>>> @@ -1170,6 +1317,18 @@ int ast_mode_init(struct drm_device *dev)
>>>>      drm_plane_helper_add(&ast->primary_plane,
>>>>                           &ast_primary_plane_helper_funcs);
>>>>
>>>> +    ret =3D drm_universal_plane_init(dev, &ast->cursor_plane, 0x01,=

>>>> +                                   &ast_cursor_plane_funcs,
>>>> +                                   cursor_plane_formats,
>>>> +                                   ARRAY_SIZE(cursor_plane_formats)=
,
>>>> +                                   NULL, DRM_PLANE_TYPE_CURSOR, NUL=
L);
>>>> +    if (ret) {
>>>> +            DRM_ERROR("drm_universal_plane_failed(): %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +    drm_plane_helper_add(&ast->cursor_plane,
>>>> +                         &ast_cursor_plane_helper_funcs);
>>>> +
>>>>      ast_cursor_init(dev);
>>>>      ast_crtc_init(dev);
>>>>      ast_encoder_init(dev);
>>>> --
>>>> 2.23.0
>>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
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


--2L4jbID85JcNf9NyMM6NOVGI6y2NtrWch--

--YhlaT83rZPp2TPwJxZtWc0j2IOf0g3S78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3ClokACgkQaA3BHVML
eiO+FggApMdx6mj4lnevgF2AU1artOX5lgHwi7EtRDenyHOw8KiJ8fQK4cG5pz8k
OXdkw2NLQkgvVAnXbXqoucQJL4R4og3Za3TBmmy/nvMoZWQKVEsVVeQJH12Rf/kW
AnutfAMmCDLRfgzPVzWCIQ9pio7TcxMPLnnzxAk+3o0V0mKiqMPrNbUebhKQ7P49
adsF/YXx96iPKCTPVx5+91STI4ENyjyINIAH+L71mz4h9/uWxu8uGhx2VMnwoMFZ
ucuUSeaZqG+ySoIZqXUvZWC1k3Q63sV2jmSvFeLLbgRNqDIzuChatxEGkfmd0xe6
rEABFGCORR4w0zs566QQNPkKJ4fjeg==
=mafi
-----END PGP SIGNATURE-----

--YhlaT83rZPp2TPwJxZtWc0j2IOf0g3S78--

--===============0356457088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0356457088==--
