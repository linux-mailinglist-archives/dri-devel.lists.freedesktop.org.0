Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB71A4D7CB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A5C10E30B;
	Tue,  4 Mar 2025 09:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cJPJQ+tC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE9010E30B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:19:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A9ADF5C5794
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134AAC4CEE8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741079960;
 bh=rbbn+a0FJwBYGfbv2s+mQMkVihW878SNPLh00htbPuU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cJPJQ+tCggRXab91Ywk6+ARn4qwB62WWyjXq7PhRl4sGZPFFhILZ1akhi5uiG0Jjm
 ysKwnZDmCvkTjxw+YOxW5jY2hvYWcS1FSgu6KPZdKURICa3372Tsb8QloQnXYmdqn+
 0d2lFfzyjLYo0Sw61s1J96eRRPd40UIPGQqIAAeAMgoxIPMwDk/0inxCbzKo2RnHII
 hbUWLEkC9PXhn6C6vxU4mAHRRwbkZ/hg/w/mtvI1DgiWpcyA6oWcUND7aVikFgGu6P
 TwydT28Jw7rvs3TifQeGKbEPX0+VEEDPxYnHkAAPAj5t9u8eDQvUDk3oDOYWUx1dB2
 LothL0Ceu+fEA==
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-abf628d653eso395450866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 01:19:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6OCWA46HG/2FJtAMO6eepHKOGce/TquIrgzAlg3D3u3VPcgnmCXs20Nq5Rx3jFnEJTXOA28fzt5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWQhCX64hFZ7Z66+T2AP/Weo2M2LAdlgX11jLtqHbpW5Ndfv1v
 xrLJt9hqr9fyRjEzhMXhx8EcLRFSNVEiZZlUgFmb6MtPOXOtDtnHGuvRXK+7wXSSltk39hdGXss
 FBhvNLDEoFIg9P4Y07I7SKQd2Zo8=
X-Google-Smtp-Source: AGHT+IESK96BQKBPbJlzMBUCDtvyV4K66Kwq1JR9TMerfOLl6lqg5MZu1cCOIlYa5bPwgcEFxoSo1dCdmpl5w+mjaXE=
X-Received: by 2002:a17:907:7242:b0:ac1:df63:41d with SMTP id
 a640c23a62f3a-ac1df6305aemr531452866b.40.1741079958549; Tue, 04 Mar 2025
 01:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20250304063351.3975323-1-chenhuacai@loongson.cn>
 <5314b1bb-5208-4342-a7a4-5c985ea0ce52@suse.de>
In-Reply-To: <5314b1bb-5208-4342-a7a4-5c985ea0ce52@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Mar 2025 17:19:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4kBZ52E_4iju-mH=NgYOQb-TiiwBbmeTytcy0_wVkUiQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpLhg30mb0idzJC4cmnF3e0fwESpM8rGiZagFg6TIhsMRv6MivzNSvoIxY
Message-ID: <CAAhV-H4kBZ52E_4iju-mH=NgYOQb-TiiwBbmeTytcy0_wVkUiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Support both SHMEM helper and VRAM helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 4, 2025 at 4:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 04.03.25 um 07:33 schrieb Huacai Chen:
> > Commit f2fa5a99ca81ce105653 ("drm/ast: Convert ast to SHMEM") converts
> > ast from VRAM helper to SHMEM helper. The convertion makesast support
> > higher display resolutions, but the performance decreases significantly
> > on platforms which don't support writecombine (fallback to uncached).
> >
> > This patch implements both SHMEM helper and VRAM helper for ast driver
> > at the same time. A module parameter ast.shmem is added, 1 means SHMEM
> > hepler, 0 means VRAM helper, and the default (-1) means auto selection
> > according to drm_arch_can_wc_memory().
>
> Sorry won't happen. There's one memory manager and that's it.
>
> The question is why there is a difference between the two. Because
> conceptually, it's both software rendering that copies the final image
> into video ram. Why is that much faster with VRAM helpers?
Correct me if I'm wrong.

SHMEM helper means "copy damage data to a fixed VRAM buffer", VRAM
helper means "double buffers and swapping the two". So if WC is not
supported, SHMEM helper is slower from visible effect.


Huacai

>
> Best regards
> Thomas
>
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/gpu/drm/ast/Kconfig    |   3 +
> >   drivers/gpu/drm/ast/ast_drv.c  |  31 ++++++++--
> >   drivers/gpu/drm/ast/ast_drv.h  |   6 +-
> >   drivers/gpu/drm/ast/ast_mm.c   |  11 +++-
> >   drivers/gpu/drm/ast/ast_mode.c | 105 +++++++++++++++++++++++++-------=
-
> >   5 files changed, 124 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
> > index da0663542e8a..ed07ef70072f 100644
> > --- a/drivers/gpu/drm/ast/Kconfig
> > +++ b/drivers/gpu/drm/ast/Kconfig
> > @@ -5,6 +5,9 @@ config DRM_AST
> >       select DRM_CLIENT_SELECTION
> >       select DRM_GEM_SHMEM_HELPER
> >       select DRM_KMS_HELPER
> > +     select DRM_TTM
> > +     select DRM_TTM_HELPER
> > +     select DRM_VRAM_HELPER
> >       select I2C
> >       select I2C_ALGOBIT
> >       help
> > diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_dr=
v.c
> > index ff3bcdd1cff2..a0c693844f1e 100644
> > --- a/drivers/gpu/drm/ast/ast_drv.c
> > +++ b/drivers/gpu/drm/ast/ast_drv.c
> > @@ -33,9 +33,12 @@
> >
> >   #include <drm/clients/drm_client_setup.h>
> >   #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_cache.h>
> >   #include <drm/drm_drv.h>
> >   #include <drm/drm_fbdev_shmem.h>
> > +#include <drm/drm_fbdev_ttm.h>
> >   #include <drm/drm_gem_shmem_helper.h>
> > +#include <drm/drm_gem_vram_helper.h>
> >   #include <drm/drm_module.h>
> >   #include <drm/drm_probe_helper.h>
> >
> > @@ -46,13 +49,18 @@ static int ast_modeset =3D -1;
> >   MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
> >   module_param_named(modeset, ast_modeset, int, 0400);
> >
> > +int ast_shmem =3D -1;
> > +
> > +MODULE_PARM_DESC(shmem, "1 =3D SHMEM helper, 0 =3D VRAM helper, -1 =3D=
 Auto");
> > +module_param_named(shmem, ast_shmem, int, 0400);
> > +
> >   /*
> >    * DRM driver
> >    */
> >
> >   DEFINE_DRM_GEM_FOPS(ast_fops);
> >
> > -static const struct drm_driver ast_driver =3D {
> > +static struct drm_driver ast_driver =3D {
> >       .driver_features =3D DRIVER_ATOMIC |
> >                          DRIVER_GEM |
> >                          DRIVER_MODESET,
> > @@ -63,9 +71,6 @@ static const struct drm_driver ast_driver =3D {
> >       .major =3D DRIVER_MAJOR,
> >       .minor =3D DRIVER_MINOR,
> >       .patchlevel =3D DRIVER_PATCHLEVEL,
> > -
> > -     DRM_GEM_SHMEM_DRIVER_OPS,
> > -     DRM_FBDEV_SHMEM_DRIVER_OPS,
> >   };
> >
> >   /*
> > @@ -280,6 +285,24 @@ static int ast_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
> >       struct drm_device *drm;
> >       bool need_post =3D false;
> >
> > +     if (ast_shmem =3D=3D -1)
> > +             ast_shmem =3D drm_arch_can_wc_memory() ? 1 : 0;
> > +
> > +     if (ast_shmem) {
> > +             ast_driver.dumb_create =3D drm_gem_shmem_dumb_create;
> > +             ast_driver.gem_prime_import_sg_table =3D drm_gem_shmem_pr=
ime_import_sg_table;
> > +#ifdef CONFIG_DRM_FBDEV_EMULATION
> > +             ast_driver.fbdev_probe =3D drm_fbdev_shmem_driver_fbdev_p=
robe;
> > +#endif
> > +     } else {
> > +             ast_driver.dumb_create =3D drm_gem_vram_driver_dumb_creat=
e;
> > +             ast_driver.dumb_map_offset =3D drm_gem_ttm_dumb_map_offse=
t;
> > +             ast_driver.debugfs_init =3D drm_vram_mm_debugfs_init;
> > +#ifdef CONFIG_DRM_FBDEV_EMULATION
> > +             ast_driver.fbdev_probe =3D drm_fbdev_ttm_driver_fbdev_pro=
be;
> > +#endif
> > +     }
> > +
> >       ret =3D aperture_remove_conflicting_pci_devices(pdev, ast_driver.=
name);
> >       if (ret)
> >               return ret;
> > diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> > index 6b4305ac07d4..3fcf6717ad8a 100644
> > --- a/drivers/gpu/drm/ast/ast_drv.h
> > +++ b/drivers/gpu/drm/ast/ast_drv.h
> > @@ -29,6 +29,7 @@
> >   #define __AST_DRV_H__
> >
> >   #include <linux/io.h>
> > +#include <linux/iosys-map.h>
> >   #include <linux/types.h>
> >
> >   #include <drm/drm_connector.h>
> > @@ -53,6 +54,8 @@
> >
> >   #define __AST_CHIP(__gen, __index)  ((__gen) << 16 | (__index))
> >
> > +extern int ast_shmem;
> > +
> >   enum ast_chip {
> >       /* 1st gen */
> >       AST1000 =3D __AST_CHIP(1, 0), // unused
> > @@ -130,7 +133,8 @@ enum ast_config_mode {
> >   struct ast_plane {
> >       struct drm_plane base;
> >
> > -     void __iomem *vaddr;
> > +     struct drm_gem_vram_object *gbo;
> > +     struct iosys_map map;
> >       u64 offset;
> >       unsigned long size;
> >   };
> > diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.=
c
> > index 6dfe6d9777d4..588326b7d53e 100644
> > --- a/drivers/gpu/drm/ast/ast_mm.c
> > +++ b/drivers/gpu/drm/ast/ast_mm.c
> > @@ -28,6 +28,7 @@
> >
> >   #include <linux/pci.h>
> >
> > +#include <drm/drm_gem_vram_helper.h>
> >   #include <drm/drm_managed.h>
> >   #include <drm/drm_print.h>
> >
> > @@ -87,9 +88,13 @@ int ast_mm_init(struct ast_device *ast)
> >
> >       vram_size =3D ast_get_vram_size(ast);
> >
> > -     ast->vram =3D devm_ioremap_wc(dev->dev, base, vram_size);
> > -     if (!ast->vram)
> > -             return -ENOMEM;
> > +     if (!ast_shmem)
> > +             drmm_vram_helper_init(dev, base, vram_size);
> > +     else {
> > +             ast->vram =3D devm_ioremap_wc(dev->dev, base, vram_size);
> > +             if (!ast->vram)
> > +                     return -ENOMEM;
> > +     }
> >
> >       ast->vram_base =3D base;
> >       ast->vram_size =3D vram_size;
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index 9d5321c81e68..0744d1ac5dfb 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -41,6 +41,7 @@
> >   #include <drm/drm_gem_atomic_helper.h>
> >   #include <drm/drm_gem_framebuffer_helper.h>
> >   #include <drm/drm_gem_shmem_helper.h>
> > +#include <drm/drm_gem_vram_helper.h>
> >   #include <drm/drm_managed.h>
> >   #include <drm/drm_panic.h>
> >   #include <drm/drm_probe_helper.h>
> > @@ -566,8 +567,7 @@ static void ast_wait_for_vretrace(struct ast_device=
 *ast)
> >    */
> >
> >   static int ast_plane_init(struct drm_device *dev, struct ast_plane *a=
st_plane,
> > -                       void __iomem *vaddr, u64 offset, unsigned long =
size,
> > -                       uint32_t possible_crtcs,
> > +                       u64 offset, unsigned long size, uint32_t possib=
le_crtcs,
> >                         const struct drm_plane_funcs *funcs,
> >                         const uint32_t *formats, unsigned int format_co=
unt,
> >                         const uint64_t *format_modifiers,
> > @@ -575,7 +575,6 @@ static int ast_plane_init(struct drm_device *dev, s=
truct ast_plane *ast_plane,
> >   {
> >       struct drm_plane *plane =3D &ast_plane->base;
> >
> > -     ast_plane->vaddr =3D vaddr;
> >       ast_plane->offset =3D offset;
> >       ast_plane->size =3D size;
> >
> > @@ -630,7 +629,7 @@ static void ast_handle_damage(struct ast_plane *ast=
_plane, struct iosys_map *src
> >                             struct drm_framebuffer *fb,
> >                             const struct drm_rect *clip)
> >   {
> > -     struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->va=
ddr);
> > +     struct iosys_map dst =3D ast_plane->map;
> >
> >       iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->forma=
t, clip));
> >       drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> > @@ -650,6 +649,7 @@ static void ast_primary_plane_helper_atomic_update(=
struct drm_plane *plane,
> >       struct drm_crtc *crtc =3D plane_state->crtc;
> >       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state, crtc);
> >       struct drm_rect damage;
> > +     struct drm_gem_vram_object *gbo;
> >       struct drm_atomic_helper_damage_iter iter;
> >
> >       if (!old_fb || (fb->format !=3D old_fb->format) || crtc_state->mo=
de_changed) {
> > @@ -660,9 +660,15 @@ static void ast_primary_plane_helper_atomic_update=
(struct drm_plane *plane,
> >               ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info)=
;
> >       }
> >
> > -     drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_=
state);
> > -     drm_atomic_for_each_plane_damage(&iter, &damage) {
> > -             ast_handle_damage(ast_plane, shadow_plane_state->data, fb=
, &damage);
> > +     if (!ast_shmem) {
> > +             gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> > +             ast_plane->offset =3D drm_gem_vram_offset(gbo);
> > +             ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
> > +     } else {
> > +             drm_atomic_helper_damage_iter_init(&iter, old_plane_state=
, plane_state);
> > +             drm_atomic_for_each_plane_damage(&iter, &damage) {
> > +                     ast_handle_damage(ast_plane, shadow_plane_state->=
data, fb, &damage);
> > +             }
> >       }
> >
> >       /*
> > @@ -704,19 +710,18 @@ static int ast_primary_plane_helper_get_scanout_b=
uffer(struct drm_plane *plane,
> >   {
> >       struct ast_plane *ast_plane =3D to_ast_plane(plane);
> >
> > -     if (plane->state && plane->state->fb && ast_plane->vaddr) {
> > +     if (plane->state && plane->state->fb && ast_plane->map.vaddr_iome=
m) {
> >               sb->format =3D plane->state->fb->format;
> >               sb->width =3D plane->state->fb->width;
> >               sb->height =3D plane->state->fb->height;
> >               sb->pitch[0] =3D plane->state->fb->pitches[0];
> > -             iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->vaddr);
> > +             iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->map.vad=
dr_iomem);
> >               return 0;
> >       }
> >       return -ENODEV;
> >   }
> >
> > -static const struct drm_plane_helper_funcs ast_primary_plane_helper_fu=
ncs =3D {
> > -     DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > +static struct drm_plane_helper_funcs ast_primary_plane_helper_funcs =
=3D {
> >       .atomic_check =3D ast_primary_plane_helper_atomic_check,
> >       .atomic_update =3D ast_primary_plane_helper_atomic_update,
> >       .atomic_enable =3D ast_primary_plane_helper_atomic_enable,
> > @@ -724,11 +729,10 @@ static const struct drm_plane_helper_funcs ast_pr=
imary_plane_helper_funcs =3D {
> >       .get_scanout_buffer =3D ast_primary_plane_helper_get_scanout_buff=
er,
> >   };
> >
> > -static const struct drm_plane_funcs ast_primary_plane_funcs =3D {
> > +static struct drm_plane_funcs ast_primary_plane_funcs =3D {
> >       .update_plane =3D drm_atomic_helper_update_plane,
> >       .disable_plane =3D drm_atomic_helper_disable_plane,
> >       .destroy =3D drm_plane_cleanup,
> > -     DRM_GEM_SHADOW_PLANE_FUNCS,
> >   };
> >
> >   static int ast_primary_plane_init(struct ast_device *ast)
> > @@ -737,12 +741,28 @@ static int ast_primary_plane_init(struct ast_devi=
ce *ast)
> >       struct ast_plane *ast_primary_plane =3D &ast->primary_plane;
> >       struct drm_plane *primary_plane =3D &ast_primary_plane->base;
> >       void __iomem *vaddr =3D ast->vram;
> > -     u64 offset =3D 0; /* with shmem, the primary plane is always at o=
ffset 0 */
> > +     u64 offset =3D 0; /* the primary plane is initially at offset 0 *=
/
> >       unsigned long cursor_size =3D roundup(AST_HWC_SIZE + AST_HWC_SIGN=
ATURE_SIZE, PAGE_SIZE);
> >       unsigned long size =3D ast->vram_fb_available - cursor_size;
> >       int ret;
> >
> > -     ret =3D ast_plane_init(dev, ast_primary_plane, vaddr, offset, siz=
e,
> > +     if (ast_shmem) {
> > +             ast_primary_plane_funcs.reset =3D drm_gem_reset_shadow_pl=
ane;
> > +             ast_primary_plane_funcs.atomic_duplicate_state =3D drm_ge=
m_duplicate_shadow_plane_state;
> > +             ast_primary_plane_funcs.atomic_destroy_state =3D drm_gem_=
destroy_shadow_plane_state;
> > +             ast_primary_plane_helper_funcs.begin_fb_access =3D drm_ge=
m_begin_shadow_fb_access;
> > +             ast_primary_plane_helper_funcs.end_fb_access =3D drm_gem_=
end_shadow_fb_access;
> > +     } else {
> > +             ast_primary_plane_funcs.reset =3D drm_atomic_helper_plane=
_reset;
> > +             ast_primary_plane_funcs.atomic_duplicate_state =3D drm_at=
omic_helper_plane_duplicate_state;
> > +             ast_primary_plane_funcs.atomic_destroy_state =3D drm_atom=
ic_helper_plane_destroy_state;
> > +             ast_primary_plane_helper_funcs.prepare_fb =3D drm_gem_vra=
m_plane_helper_prepare_fb;
> > +             ast_primary_plane_helper_funcs.cleanup_fb =3D drm_gem_vra=
m_plane_helper_cleanup_fb;
> > +     }
> > +
> > +     iosys_map_set_vaddr_iomem(&ast_primary_plane->map, vaddr);
> > +
> > +     ret =3D ast_plane_init(dev, ast_primary_plane, offset, size,
> >                            0x01, &ast_primary_plane_funcs,
> >                            ast_primary_plane_formats, ARRAY_SIZE(ast_pr=
imary_plane_formats),
> >                            NULL, DRM_PLANE_TYPE_PRIMARY);
> > @@ -902,10 +922,11 @@ static void ast_cursor_plane_helper_atomic_update=
(struct drm_plane *plane,
> >       struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_pl=
ane_state(state, plane);
> >       struct ast_device *ast =3D to_ast_device(plane->dev);
> >       struct iosys_map src_map =3D shadow_plane_state->data[0];
> > +     struct iosys_map dst_map =3D ast_plane->map;
> >       struct drm_rect damage;
> >       const u8 *src =3D src_map.vaddr; /* TODO: Use mapping abstraction=
 properly */
> >       u64 dst_off =3D ast_plane->offset;
> > -     u8 __iomem *dst =3D ast_plane->vaddr; /* TODO: Use mapping abstra=
ction properly */
> > +     u8 __iomem *dst =3D dst_map.vaddr_iomem; /* TODO: Use mapping abs=
traction properly */
> >       u8 __iomem *sig =3D dst + AST_HWC_SIZE; /* TODO: Use mapping abst=
raction properly */
> >       unsigned int offset_x, offset_y;
> >       u16 x, y;
> > @@ -967,10 +988,22 @@ static const struct drm_plane_helper_funcs ast_cu=
rsor_plane_helper_funcs =3D {
> >       .atomic_disable =3D ast_cursor_plane_helper_atomic_disable,
> >   };
> >
> > -static const struct drm_plane_funcs ast_cursor_plane_funcs =3D {
> > +static void ast_cursor_plane_destroy(struct drm_plane *plane)
> > +{
> > +     struct ast_plane *ast_plane =3D to_ast_plane(plane);
> > +     struct drm_gem_vram_object *gbo =3D ast_plane->gbo;
> > +     struct iosys_map map =3D ast_plane->map;
> > +
> > +     drm_gem_vram_vunmap(gbo, &map);
> > +     drm_gem_vram_unpin(gbo);
> > +     drm_gem_vram_put(gbo);
> > +
> > +     drm_plane_cleanup(plane);
> > +}
> > +
> > +static struct drm_plane_funcs ast_cursor_plane_funcs =3D {
> >       .update_plane =3D drm_atomic_helper_update_plane,
> >       .disable_plane =3D drm_atomic_helper_disable_plane,
> > -     .destroy =3D drm_plane_cleanup,
> >       DRM_GEM_SHADOW_PLANE_FUNCS,
> >   };
> >
> > @@ -979,6 +1012,8 @@ static int ast_cursor_plane_init(struct ast_device=
 *ast)
> >       struct drm_device *dev =3D &ast->base;
> >       struct ast_plane *ast_cursor_plane =3D &ast->cursor_plane;
> >       struct drm_plane *cursor_plane =3D &ast_cursor_plane->base;
> > +     struct drm_gem_vram_object *gbo;
> > +     struct iosys_map map;
> >       size_t size;
> >       void __iomem *vaddr;
> >       u64 offset;
> > @@ -994,10 +1029,25 @@ static int ast_cursor_plane_init(struct ast_devi=
ce *ast)
> >       if (ast->vram_fb_available < size)
> >               return -ENOMEM;
> >
> > -     vaddr =3D ast->vram + ast->vram_fb_available - size;
> > -     offset =3D ast->vram_fb_available - size;
> > +     if (ast_shmem) {
> > +             vaddr =3D ast->vram + ast->vram_fb_available - size;
> > +             offset =3D ast->vram_fb_available - size;
> > +             iosys_map_set_vaddr_iomem(&ast_cursor_plane->map, vaddr);
> > +             ast_cursor_plane_funcs.destroy =3D drm_plane_cleanup;
> > +     } else {
> > +             gbo =3D drm_gem_vram_create(dev, size, 0);
> > +             if (IS_ERR(gbo))
> > +                     return PTR_ERR(gbo);
> > +
> > +             drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM | DRM_GEM=
_VRAM_PL_FLAG_TOPDOWN);
> > +             drm_gem_vram_vmap(gbo, &map);
> > +             offset =3D drm_gem_vram_offset(gbo);
> > +             ast_cursor_plane->gbo =3D gbo;
> > +             ast_cursor_plane->map =3D map;
> > +             ast_cursor_plane_funcs.destroy =3D ast_cursor_plane_destr=
oy;
> > +     }
> >
> > -     ret =3D ast_plane_init(dev, ast_cursor_plane, vaddr, offset, size=
,
> > +     ret =3D ast_plane_init(dev, ast_cursor_plane, offset, size,
> >                            0x01, &ast_cursor_plane_funcs,
> >                            ast_cursor_plane_formats, ARRAY_SIZE(ast_cur=
sor_plane_formats),
> >                            NULL, DRM_PLANE_TYPE_CURSOR);
> > @@ -1348,9 +1398,7 @@ static enum drm_mode_status ast_mode_config_mode_=
valid(struct drm_device *dev,
> >       return MODE_OK;
> >   }
> >
> > -static const struct drm_mode_config_funcs ast_mode_config_funcs =3D {
> > -     .fb_create =3D drm_gem_fb_create_with_dirty,
> > -     .mode_valid =3D ast_mode_config_mode_valid,
> > +static struct drm_mode_config_funcs ast_mode_config_funcs =3D {
> >       .atomic_check =3D drm_atomic_helper_check,
> >       .atomic_commit =3D drm_atomic_helper_commit,
> >   };
> > @@ -1372,6 +1420,15 @@ int ast_mode_config_init(struct ast_device *ast)
> >       dev->mode_config.min_width =3D 0;
> >       dev->mode_config.min_height =3D 0;
> >       dev->mode_config.preferred_depth =3D 24;
> > +     dev->mode_config.prefer_shadow =3D !ast_shmem;
> > +
> > +     if (!ast_shmem) {
> > +             ast_mode_config_funcs.fb_create =3D drm_gem_fb_create;
> > +             ast_mode_config_funcs.mode_valid =3D drm_vram_helper_mode=
_valid;
> > +     } else {
> > +             ast_mode_config_funcs.fb_create =3D drm_gem_fb_create_wit=
h_dirty;
> > +             ast_mode_config_funcs.mode_valid =3D ast_mode_config_mode=
_valid;
> > +     }
> >
> >       if (ast->chip =3D=3D AST2100 || // GEN2, but not AST1100 (?)
> >           ast->chip =3D=3D AST2200 || // GEN3, but not AST2150 (?)
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
