Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D28096F4B0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 14:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37010E04B;
	Fri,  6 Sep 2024 12:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6152410EA32;
 Fri,  6 Sep 2024 12:53:34 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-49bc7387371so636759137.2; 
 Fri, 06 Sep 2024 05:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725627213; x=1726232013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SMidQE8lYeobHm4UctDmxFhGuOODKewWY/YBeXJMD8c=;
 b=ku5dNKHXxFYYcZpxDIuB7o/zJIEeAjiIy0QxpeSyXWK4S687N0yT0aFtTTxA7zUFEK
 41VDg943NgtzML4ATNZpmpxVxF3QaNJwAalG0XaBk9tGSk1EzsLpgl9jeD5DbMYOnOQV
 /88mLyQG2rZzgMPnr/SENDgSD1vqndHtyGCJr+6PiKcqS830V4XslzypgXO4Ov5a2QQp
 D2sKYVITvNZhEWGCgXNa5h5AVzcTsYurvlIBnk9sFgoeW0A28LPAtBdBONDZP3xGKzAb
 1hdsZ73vyEd4lBpF80w+1YrWsOC3lbmyoUszpK/YORjFO3qaiRZhpj0HNhCgicVB5Wf7
 g+Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUckg87WksZYG7BZdbgR/uXFMb/pN4Ub6Je3hl2yfFh33SPqn+QtMoubUnvTgcYwF9JG+zu1unVeg==@lists.freedesktop.org,
 AJvYcCUedzmlNDdxl2aDTuJaniydT63395/CulQzGmpCblM6wUtIVIbh4XmWPqKs7L9FclVwcBMnaUv03Wg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+3hyRyp6AL8q8B6+SeSe9Sp3kqmfM0Z09MV6JxccfvH7w8UI0
 0TUtIiVb2rUL77IG02ltVyYjmag6oeWjLnmRpOtQprqiO5KF5p5gZQRqpdAgPzcEqQw6aqbanAk
 CBUjKemQYSE9u5y8w8k/DGtGxsw0=
X-Google-Smtp-Source: AGHT+IH5Nx8q5oODwJ8TBfm9E7TQT78MBsGQWawhFdVaPLSwPMPrdP6Tcnjt39F4elj0XvELbcKW9dNozbo5oY6jqpQ=
X-Received: by 2002:a05:6102:2aca:b0:493:b9ae:3208 with SMTP id
 ada2fe7eead31-49a5af48ac5mr32088497137.24.1725627213111; Fri, 06 Sep 2024
 05:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
In-Reply-To: <20240906100434.1171093-4-jfalempe@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 6 Sep 2024 08:53:22 -0400
Message-ID: <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000000d6ae5062172e527"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000d6ae5062172e527
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 6:05=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:

> Add drm_panic support, for nv50+ cards.
> It's enough to get the panic screen while running Gnome/Wayland on a
> GTX 1650.
> It doesn't support multi-plane or compressed format.
> Support for other formats and older cards will come later.
> Tiling is only tested on GTX1650, and might be wrong for other cards.
>

I'm moderately sure that nv50 and nvc0 tile differently (the general algo
is the same, but height is different):

https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highl=
ight=3Dtiling#blocklinear-surfaces

That said, I don't know that nv50 supports scanout of tiled surfaces (nor
was I aware that nvc0+ did, perhaps it's a recent feature, or perhaps I'm
just forgetful).

Cheers,

  -ilia


>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
> v2:
>  * Rebase and drop already merged patches.
>  * Rework the tiling algorithm, using "swizzle" to compute the offset
>    inside the block.
>
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 +++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 7a2cceaee6e9..50ecf6f12b81 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -30,11 +30,16 @@
>  #include <nvhw/class/cl507e.h>
>  #include <nvhw/class/clc37e.h>
>
> +#include <linux/iosys-map.h>
> +
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> -#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_panic.h>
> +#include <drm/ttm/ttm_bo.h>
>
>  #include "nouveau_bo.h"
>  #include "nouveau_gem.h"
> @@ -577,6 +582,93 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct
> drm_plane_state *state)
>         return 0;
>  }
>
> +#define NV_TILE_BLK_BASE_HEIGHT 8      /* In pixel */
> +#define NV_TILE_GOB_SIZE 64    /* In bytes */
> +#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits pixel */
> +
> +/* get the offset in bytes inside the framebuffer, after taking tiling
> into account */
> +static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer *sb,
> unsigned int blk_h,
> +                                         unsigned int x, unsigned int y)
> +{
> +       u32 blk_x, blk_y, blk_sz, blk_off, pitch;
> +       u32 swizzle;
> +
> +       blk_sz =3D NV_TILE_GOB_SIZE * blk_h;
> +       pitch =3D DIV_ROUND_UP(sb->width, NV_TILE_BLK_WIDTH);
> +
> +       /* block coordinate */
> +       blk_x =3D x / NV_TILE_BLK_WIDTH;
> +       blk_y =3D y / blk_h;
> +
> +       blk_off =3D ((blk_y * pitch) + blk_x) * blk_sz;
> +
> +       y =3D y % blk_h;
> +
> +       /* Inside the block, use the fast address swizzle to compute the
> offset
> +        * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1 y0 x1 =
x0
> +        */
> +       swizzle =3D (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) << 3;
> +       swizzle |=3D (x & 8) << 3 | (y >> 3) << 7;
> +
> +       return blk_off + swizzle * 4;
> +}
> +
> +static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned int x=
,
> unsigned int y, u32 color)
> +{
> +       struct drm_framebuffer *fb =3D sb->private;
> +       unsigned int off;
> +       /* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D
> documentation,
> +        * the last 4 bits of the modifier is log2(blk_height /
> NV_TILE_BLK_BASE_HEIGHT)
> +        */
> +       unsigned int blk_h =3D NV_TILE_BLK_BASE_HEIGHT * (1 << (fb->modif=
ier
> & 0xf));
> +
> +       off =3D nv50_get_tiled_offset(sb, blk_h, x, y);
> +       iosys_map_wr(&sb->map[0], off, u32, color);
> +}
> +
> +static int
> +nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct
> drm_scanout_buffer *sb)
> +{
> +       struct drm_framebuffer *fb;
> +       struct nouveau_bo *nvbo;
> +
> +       if (!plane->state || !plane->state->fb)
> +               return -EINVAL;
> +
> +       fb =3D plane->state->fb;
> +       nvbo =3D nouveau_gem_object(fb->obj[0]);
> +
> +       /* Don't support compressed format, or multiplane yet. */
> +       if (nvbo->comp || fb->format->num_planes !=3D 1)
> +               return -EOPNOTSUPP;
> +
> +       if (nouveau_bo_map(nvbo)) {
> +               pr_warn("nouveau bo map failed, panic won't be
> displayed\n");
> +               return -ENOMEM;
> +       }
> +
> +       if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
> +               iosys_map_set_vaddr_iomem(&sb->map[0], nvbo->kmap.virtual=
);
> +       else
> +               iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
> +
> +       sb->height =3D fb->height;
> +       sb->width =3D fb->width;
> +       sb->pitch[0] =3D fb->pitches[0];
> +       sb->format =3D fb->format;
> +
> +       /* If tiling is enabled, use the set_pixel() to display correctly=
.
> +        * Only handle 32bits format for now.
> +        */
> +       if (fb->modifier & 0xf) {
> +               if (fb->format->cpp[0] !=3D 4)
> +                       return -EOPNOTSUPP;
> +               sb->private =3D (void *) fb;
> +               sb->set_pixel =3D nv50_set_pixel;
> +       }
> +       return 0;
> +}
> +
>  static const struct drm_plane_helper_funcs
>  nv50_wndw_helper =3D {
>         .prepare_fb =3D nv50_wndw_prepare_fb,
> @@ -584,6 +676,14 @@ nv50_wndw_helper =3D {
>         .atomic_check =3D nv50_wndw_atomic_check,
>  };
>
> +static const struct drm_plane_helper_funcs
> +nv50_wndw_primary_helper =3D {
> +       .prepare_fb =3D nv50_wndw_prepare_fb,
> +       .cleanup_fb =3D nv50_wndw_cleanup_fb,
> +       .atomic_check =3D nv50_wndw_atomic_check,
> +       .get_scanout_buffer =3D nv50_wndw_get_scanout_buffer,
> +};
> +
>  static void
>  nv50_wndw_atomic_destroy_state(struct drm_plane *plane,
>                                struct drm_plane_state *state)
> @@ -732,7 +832,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func,
> struct drm_device *dev,
>                 return ret;
>         }
>
> -       drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
> +       if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +               drm_plane_helper_add(&wndw->plane,
> &nv50_wndw_primary_helper);
> +       else
> +               drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
>
>         if (wndw->func->ilut) {
>                 ret =3D nv50_lut_init(disp, mmu, &wndw->ilut);
> --
> 2.46.0
>
>

--0000000000000d6ae5062172e527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 6, 2024 at 6:05=E2=80=AFAM Jo=
celyn Falempe &lt;<a href=3D"mailto:jfalempe@redhat.com">jfalempe@redhat.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Add drm_panic support, for nv50+ cards.<br>
It&#39;s enough to get the panic screen while running Gnome/Wayland on a<br=
>
GTX 1650.<br>
It doesn&#39;t support multi-plane or compressed format.<br>
Support for other formats and older cards will come later.<br>
Tiling is only tested on GTX1650, and might be wrong for other cards.<br></=
blockquote><div><br></div><div>I&#39;m moderately sure that nv50 and nvc0 t=
ile differently (the general algo is the same, but height is different):</d=
iv><div><br></div><div><a href=3D"https://envytools.readthedocs.io/en/lates=
t/hw/memory/g80-surface.html?highlight=3Dtiling#blocklinear-surfaces">https=
://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=
=3Dtiling#blocklinear-surfaces</a><br></div><div><br></div><div>That said, =
I don&#39;t know that nv50 supports scanout of tiled surfaces (nor was I aw=
are that nvc0+ did, perhaps it&#39;s a recent feature, or perhaps I&#39;m j=
ust forgetful).</div><div><br></div><div>Cheers,</div><div><br></div><div>=
=C2=A0 -ilia</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Signed-off-by: Jocelyn Falempe &lt;<a href=3D"mailto:jfalempe@redhat.com" t=
arget=3D"_blank">jfalempe@redhat.com</a>&gt;<br>
---<br>
v2:<br>
=C2=A0* Rebase and drop already merged patches.<br>
=C2=A0* Rework the tiling algorithm, using &quot;swizzle&quot; to compute t=
he offset<br>
=C2=A0 =C2=A0inside the block.<br>
<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 +++++++++++++++++++++++=
-<br>
=C2=A01 file changed, 105 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouv=
eau/dispnv50/wndw.c<br>
index 7a2cceaee6e9..50ecf6f12b81 100644<br>
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c<br>
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c<br>
@@ -30,11 +30,16 @@<br>
=C2=A0#include &lt;nvhw/class/cl507e.h&gt;<br>
=C2=A0#include &lt;nvhw/class/clc37e.h&gt;<br>
<br>
+#include &lt;linux/iosys-map.h&gt;<br>
+<br>
=C2=A0#include &lt;drm/drm_atomic.h&gt;<br>
=C2=A0#include &lt;drm/drm_atomic_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_blend.h&gt;<br>
-#include &lt;drm/drm_gem_atomic_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_fourcc.h&gt;<br>
+#include &lt;drm/drm_framebuffer.h&gt;<br>
+#include &lt;drm/drm_gem_atomic_helper.h&gt;<br>
+#include &lt;drm/drm_panic.h&gt;<br>
+#include &lt;drm/ttm/ttm_bo.h&gt;<br>
<br>
=C2=A0#include &quot;nouveau_bo.h&quot;<br>
=C2=A0#include &quot;nouveau_gem.h&quot;<br>
@@ -577,6 +582,93 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct d=
rm_plane_state *state)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+#define NV_TILE_BLK_BASE_HEIGHT 8=C2=A0 =C2=A0 =C2=A0 /* In pixel */<br>
+#define NV_TILE_GOB_SIZE 64=C2=A0 =C2=A0 /* In bytes */<br>
+#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits pixel */<b=
r>
+<br>
+/* get the offset in bytes inside the framebuffer, after taking tiling int=
o account */<br>
+static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer *sb, u=
nsigned int blk_h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0un=
signed int x, unsigned int y)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 blk_x, blk_y, blk_sz, blk_off, pitch;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 swizzle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blk_sz =3D NV_TILE_GOB_SIZE * blk_h;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pitch =3D DIV_ROUND_UP(sb-&gt;width, NV_TILE_BL=
K_WIDTH);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* block coordinate */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blk_x =3D x / NV_TILE_BLK_WIDTH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blk_y =3D y / blk_h;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blk_off =3D ((blk_y * pitch) + blk_x) * blk_sz;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0y =3D y % blk_h;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Inside the block, use the fast address swizz=
le to compute the offset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For nvidia blocklinear, bit order is yn..y3 =
x3 y2 x2 y1 y0 x1 x0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0swizzle =3D (x &amp; 3) | (y &amp; 3) &lt;&lt; =
2 | (x &amp; 4) &lt;&lt; 2 | (y &amp; 4) &lt;&lt; 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0swizzle |=3D (x &amp; 8) &lt;&lt; 3 | (y &gt;&g=
t; 3) &lt;&lt; 7;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return blk_off + swizzle * 4;<br>
+}<br>
+<br>
+static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, =
unsigned int y, u32 color)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb =3D sb-&gt;private;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LIN=
EAR_2D documentation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the last 4 bits of the modifier is log2(blk_=
height / NV_TILE_BLK_BASE_HEIGHT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int blk_h =3D NV_TILE_BLK_BASE_HEIGHT =
* (1 &lt;&lt; (fb-&gt;modifier &amp; 0xf));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D nv50_get_tiled_offset(sb, blk_h, x, y);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iosys_map_wr(&amp;sb-&gt;map[0], off, u32, colo=
r);<br>
+}<br>
+<br>
+static int<br>
+nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_b=
uffer *sb)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo *nvbo;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!plane-&gt;state || !plane-&gt;state-&gt;fb=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fb =3D plane-&gt;state-&gt;fb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo =3D nouveau_gem_object(fb-&gt;obj[0]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t support compressed format, or mult=
iplane yet. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvbo-&gt;comp || fb-&gt;format-&gt;num_plan=
es !=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nouveau_bo_map(nvbo)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;nouve=
au bo map failed, panic won&#39;t be displayed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvbo-&gt;kmap.bo_kmap_type &amp; TTM_BO_MAP=
_IOMEM_MASK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iosys_map_set_vaddr=
_iomem(&amp;sb-&gt;map[0], nvbo-&gt;kmap.virtual);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iosys_map_set_vaddr=
(&amp;sb-&gt;map[0], nvbo-&gt;kmap.virtual);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sb-&gt;height =3D fb-&gt;height;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sb-&gt;width =3D fb-&gt;width;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sb-&gt;pitch[0] =3D fb-&gt;pitches[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sb-&gt;format =3D fb-&gt;format;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If tiling is enabled, use the set_pixel() to=
 display correctly.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Only handle 32bits format for now.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fb-&gt;modifier &amp; 0xf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fb-&gt;format-&=
gt;cpp[0] !=3D 4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EOPNOTSUPP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sb-&gt;private =3D =
(void *) fb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sb-&gt;set_pixel =
=3D nv50_set_pixel;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static const struct drm_plane_helper_funcs<br>
=C2=A0nv50_wndw_helper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .prepare_fb =3D nv50_wndw_prepare_fb,<br>
@@ -584,6 +676,14 @@ nv50_wndw_helper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .atomic_check =3D nv50_wndw_atomic_check,<br>
=C2=A0};<br>
<br>
+static const struct drm_plane_helper_funcs<br>
+nv50_wndw_primary_helper =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.prepare_fb =3D nv50_wndw_prepare_fb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup_fb =3D nv50_wndw_cleanup_fb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check =3D nv50_wndw_atomic_check,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_scanout_buffer =3D nv50_wndw_get_scanout_b=
uffer,<br>
+};<br>
+<br>
=C2=A0static void<br>
=C2=A0nv50_wndw_atomic_destroy_state(struct drm_plane *plane,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *state)<br>
@@ -732,7 +832,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, stru=
ct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_helper_add(&amp;wndw-&gt;plane, &amp;=
nv50_wndw_helper);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_helper_ad=
d(&amp;wndw-&gt;plane, &amp;nv50_wndw_primary_helper);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_helper_ad=
d(&amp;wndw-&gt;plane, &amp;nv50_wndw_helper);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wndw-&gt;func-&gt;ilut) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nv50_lut_in=
it(disp, mmu, &amp;wndw-&gt;ilut);<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div></div>

--0000000000000d6ae5062172e527--
