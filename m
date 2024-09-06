Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34CC96F50D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 15:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7A210EA52;
	Fri,  6 Sep 2024 13:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M5JDy2t8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC6E10EA52
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725628227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxL9Lsy7oLQej+zEPekrFUa1QQaAShMcltWcA07hIhw=;
 b=M5JDy2t8LtXZ88u6RDfrFIKXrtx8uzLMJjXw//O294N6xPPewuTApHN4BH7tDOehEkTZZ4
 hc+cXZKWHK4Wx6q0C9N0K+m0M4A3lU5xM28+kM8BlwqoeoGPtLz7vySy26pvFHdC1hcUVf
 KL9n9dlxTynU7uVE00HPglhQJwtH4AM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-iakXJQJcO_u112C4I98GZA-1; Fri, 06 Sep 2024 09:10:25 -0400
X-MC-Unique: iakXJQJcO_u112C4I98GZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bb9fa67d7so20590365e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 06:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725628224; x=1726233024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fxL9Lsy7oLQej+zEPekrFUa1QQaAShMcltWcA07hIhw=;
 b=aLMbMQtzVeQ3hHixnSZXjVxuLAgQqMo+lbagf5wccZyTjTRuPA2GrpjKM3LMbKV8Zv
 o19WO1bqqtxvrpz9w0GGOn5qxf6HZ+pAT0yzRIzKU7mn7MAby1/qAor44wCs43TB3pqJ
 wvoZareNgY+80HxVKVMoMykFMHtzFBmwXyaF038Rf/huAq7bfchGhSaRuYk91TZCyYWU
 qNDQWGeXGKF6sKXxP2WJgDHxyytkRgoVqPzIbWEW5QWoYVP/+B0ZBmhEDDKGoJdndV7E
 fYsSFtAzFRO1x32l8wnbLirL0lnOR16U80lC3ViDZyALvvAgM7uokill2obcYoCPD3/O
 dxPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW3SGgoL/mg6sLjjziXFWXmy1sTVQeFVO7PCqEkg6J2AWUbYIKXdwZ1IuzZsIthZw6f3E/fJeVJCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8rI2zouQru3Kx3tM6G7/+WQHf6bUWFOstp0qITz/sBC230g+x
 CbHhrf8jh8M8EFM3MfRewfJvnNAb07eosz5x9aJaREr0eWt7upjJ7MydyggGhj9aT1ZzfjJR+ZN
 iquKNiH6IxbHk4U7UrrUQYvCwYSeYRBzgOp+bm2fh8TTm3E5+GaVJYTvB1eHrb4ijMg==
X-Received: by 2002:a05:600c:1d19:b0:429:c674:d9de with SMTP id
 5b1f17b1804b1-42c9f97c7e2mr22328715e9.2.1725628224088; 
 Fri, 06 Sep 2024 06:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM1Z/Gp/oo8wQDEdMN6HHd77u7hnIrMR/KHG5glH4GH9NiYAs/JFyNrGbmVCFEwsfa2xDa4Q==
X-Received: by 2002:a05:600c:1d19:b0:429:c674:d9de with SMTP id
 5b1f17b1804b1-42c9f97c7e2mr22328335e9.2.1725628223486; 
 Fri, 06 Sep 2024 06:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b61494bcsm18836777f8f.95.2024.09.06.06.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 06:10:22 -0700 (PDT)
Message-ID: <0b641d80-d8a6-414b-bdfa-3f7ae1fcc187@redhat.com>
Date: Fri, 6 Sep 2024 15:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
 <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 06/09/2024 14:53, Ilia Mirkin wrote:
> On Fri, Sep 6, 2024 at 6:05 AM Jocelyn Falempe <jfalempe@redhat.com 
> <mailto:jfalempe@redhat.com>> wrote:
> 
>     Add drm_panic support, for nv50+ cards.
>     It's enough to get the panic screen while running Gnome/Wayland on a
>     GTX 1650.
>     It doesn't support multi-plane or compressed format.
>     Support for other formats and older cards will come later.
>     Tiling is only tested on GTX1650, and might be wrong for other cards.
> 
> 
> I'm moderately sure that nv50 and nvc0 tile differently (the general 
> algo is the same, but height is different):
> 
> https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=tiling#blocklinear-surfaces <https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=tiling#blocklinear-surfaces>

Thanks, it looks like it needs a small adjustment, as in the Doc, GF100 
uses a default height of 4, and GF100+ default to 8 (and I've hardcoded 
it to NV_TILE_BLK_BASE_HEIGHT 8).
GF100 is still nv50, so it should use this code.

> 
> That said, I don't know that nv50 supports scanout of tiled surfaces 
> (nor was I aware that nvc0+ did, perhaps it's a recent feature, or 
> perhaps I'm just forgetful).

What I know is that when using Gnome/Wayland, the framebuffer is tiled, 
and without this tiling code, the panic screen is unreadable.
When using the VT console, the framebuffer is linear, and it's easier.

> 
> Cheers,
> 
>    -ilia
> 
> 
>     Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com
>     <mailto:jfalempe@redhat.com>>
>     ---
>     v2:
>       * Rebase and drop already merged patches.
>       * Rework the tiling algorithm, using "swizzle" to compute the offset
>         inside the block.
> 
>       drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 +++++++++++++++++++++++-
>       1 file changed, 105 insertions(+), 2 deletions(-)
> 
>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     index 7a2cceaee6e9..50ecf6f12b81 100644
>     --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     @@ -30,11 +30,16 @@
>       #include <nvhw/class/cl507e.h>
>       #include <nvhw/class/clc37e.h>
> 
>     +#include <linux/iosys-map.h>
>     +
>       #include <drm/drm_atomic.h>
>       #include <drm/drm_atomic_helper.h>
>       #include <drm/drm_blend.h>
>     -#include <drm/drm_gem_atomic_helper.h>
>       #include <drm/drm_fourcc.h>
>     +#include <drm/drm_framebuffer.h>
>     +#include <drm/drm_gem_atomic_helper.h>
>     +#include <drm/drm_panic.h>
>     +#include <drm/ttm/ttm_bo.h>
> 
>       #include "nouveau_bo.h"
>       #include "nouveau_gem.h"
>     @@ -577,6 +582,93 @@ nv50_wndw_prepare_fb(struct drm_plane *plane,
>     struct drm_plane_state *state)
>              return 0;
>       }
> 
>     +#define NV_TILE_BLK_BASE_HEIGHT 8      /* In pixel */
>     +#define NV_TILE_GOB_SIZE 64    /* In bytes */
>     +#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits
>     pixel */
>     +
>     +/* get the offset in bytes inside the framebuffer, after taking
>     tiling into account */
>     +static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer
>     *sb, unsigned int blk_h,
>     +                                         unsigned int x, unsigned
>     int y)
>     +{
>     +       u32 blk_x, blk_y, blk_sz, blk_off, pitch;
>     +       u32 swizzle;
>     +
>     +       blk_sz = NV_TILE_GOB_SIZE * blk_h;
>     +       pitch = DIV_ROUND_UP(sb->width, NV_TILE_BLK_WIDTH);
>     +
>     +       /* block coordinate */
>     +       blk_x = x / NV_TILE_BLK_WIDTH;
>     +       blk_y = y / blk_h;
>     +
>     +       blk_off = ((blk_y * pitch) + blk_x) * blk_sz;
>     +
>     +       y = y % blk_h;
>     +
>     +       /* Inside the block, use the fast address swizzle to compute
>     the offset
>     +        * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1
>     y0 x1 x0
>     +        */
>     +       swizzle = (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) << 3;
>     +       swizzle |= (x & 8) << 3 | (y >> 3) << 7;
>     +
>     +       return blk_off + swizzle * 4;
>     +}
>     +
>     +static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned
>     int x, unsigned int y, u32 color)
>     +{
>     +       struct drm_framebuffer *fb = sb->private;
>     +       unsigned int off;
>     +       /* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D
>     documentation,
>     +        * the last 4 bits of the modifier is log2(blk_height /
>     NV_TILE_BLK_BASE_HEIGHT)
>     +        */
>     +       unsigned int blk_h = NV_TILE_BLK_BASE_HEIGHT * (1 <<
>     (fb->modifier & 0xf));
>     +
>     +       off = nv50_get_tiled_offset(sb, blk_h, x, y);
>     +       iosys_map_wr(&sb->map[0], off, u32, color);
>     +}
>     +
>     +static int
>     +nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct
>     drm_scanout_buffer *sb)
>     +{
>     +       struct drm_framebuffer *fb;
>     +       struct nouveau_bo *nvbo;
>     +
>     +       if (!plane->state || !plane->state->fb)
>     +               return -EINVAL;
>     +
>     +       fb = plane->state->fb;
>     +       nvbo = nouveau_gem_object(fb->obj[0]);
>     +
>     +       /* Don't support compressed format, or multiplane yet. */
>     +       if (nvbo->comp || fb->format->num_planes != 1)
>     +               return -EOPNOTSUPP;
>     +
>     +       if (nouveau_bo_map(nvbo)) {
>     +               pr_warn("nouveau bo map failed, panic won't be
>     displayed\n");
>     +               return -ENOMEM;
>     +       }
>     +
>     +       if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
>     +               iosys_map_set_vaddr_iomem(&sb->map[0],
>     nvbo->kmap.virtual);
>     +       else
>     +               iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
>     +
>     +       sb->height = fb->height;
>     +       sb->width = fb->width;
>     +       sb->pitch[0] = fb->pitches[0];
>     +       sb->format = fb->format;
>     +
>     +       /* If tiling is enabled, use the set_pixel() to display
>     correctly.
>     +        * Only handle 32bits format for now.
>     +        */
>     +       if (fb->modifier & 0xf) {
>     +               if (fb->format->cpp[0] != 4)
>     +                       return -EOPNOTSUPP;
>     +               sb->private = (void *) fb;
>     +               sb->set_pixel = nv50_set_pixel;
>     +       }
>     +       return 0;
>     +}
>     +
>       static const struct drm_plane_helper_funcs
>       nv50_wndw_helper = {
>              .prepare_fb = nv50_wndw_prepare_fb,
>     @@ -584,6 +676,14 @@ nv50_wndw_helper = {
>              .atomic_check = nv50_wndw_atomic_check,
>       };
> 
>     +static const struct drm_plane_helper_funcs
>     +nv50_wndw_primary_helper = {
>     +       .prepare_fb = nv50_wndw_prepare_fb,
>     +       .cleanup_fb = nv50_wndw_cleanup_fb,
>     +       .atomic_check = nv50_wndw_atomic_check,
>     +       .get_scanout_buffer = nv50_wndw_get_scanout_buffer,
>     +};
>     +
>       static void
>       nv50_wndw_atomic_destroy_state(struct drm_plane *plane,
>                                     struct drm_plane_state *state)
>     @@ -732,7 +832,10 @@ nv50_wndw_new_(const struct nv50_wndw_func
>     *func, struct drm_device *dev,
>                      return ret;
>              }
> 
>     -       drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
>     +       if (type == DRM_PLANE_TYPE_PRIMARY)
>     +               drm_plane_helper_add(&wndw->plane,
>     &nv50_wndw_primary_helper);
>     +       else
>     +               drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
> 
>              if (wndw->func->ilut) {
>                      ret = nv50_lut_init(disp, mmu, &wndw->ilut);
>     -- 
>     2.46.0
> 

