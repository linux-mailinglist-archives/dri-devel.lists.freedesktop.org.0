Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C8975520
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 16:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202CB10E9A8;
	Wed, 11 Sep 2024 14:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X8SDD+Uq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8210E9A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726064350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kBYOTGYbT4nZk0pFJEmu4i4U5+awrWOjDRx+7UM/Z8=;
 b=X8SDD+UqBaNPsGMo5ZR/FTslyZvtnPVxgFpq+fOxiLtsWN9ocTuQBj4rpzjKA4KU7hhnRL
 8UJTrdZ7hmt813DXP4lKvXb6wQJ6JuBJs2T2rl+N+1kM6tPdfjcrDsQAgUsameoVCXW2cx
 qMelwyXkyrlMUlF9L4re3vTfb+mqvSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-hjqgk3PWObKrYu82w_bqYg-1; Wed, 11 Sep 2024 10:19:09 -0400
X-MC-Unique: hjqgk3PWObKrYu82w_bqYg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb2c9027dso17056675e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 07:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726064348; x=1726669148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0kBYOTGYbT4nZk0pFJEmu4i4U5+awrWOjDRx+7UM/Z8=;
 b=Bk+NdbRZFTXJKfHPOKwtkAIVCfqZbaYwBgzPNAJnF7Usl2XZa8c2pKrNAEHU+JLJ5l
 3AF3iH4mU2zo4gYLnDbbOq5cP8npYRFHDuKE0arXeGvqRrXydDhiW8j4ggd6QAdpXTl2
 5bITrM3sD7ifcwRbpO7h5ZYwptFOEUkgBwj00mp60lInYFRFhXpDEZmoFG4B2rYGKnyg
 sUPEAHPjmIpSX67iyauHIOB+ly6R0evKfQMMMcLiOW9XQVYHuzFb4PFTu/2pBVIyCSBo
 oRiAHSRzvkcszis3hLKZf2gLQOESejZoeusrJLvfYPOiEzQ0u2armdCEQRjn52/tHuDo
 dinw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSKN6XfeMc1f90V/XFq4sk1RbjxHS1KrToiv5eGMwuhRidVg5L0IrOzO2KnO6IPf5u60mrzcmIxj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmeNqxTEFPqZNSSJNu7JS2b0Qzt22Wuch3fcFzfJkt9ZS5rU9D
 pxRHcKhyZilxXhjKD/ct0UFn33Xecmgl56Mn5lQf1GpaSexXgAnotpCv0yO0HVHprsca4EpeOOQ
 6HytYFxNBOSuFY/a3CfBVRqU7QTs7jVY9I0OLey82FcpXOFkaC+liBElRu40rbbZlAg==
X-Received: by 2002:a05:600c:1987:b0:428:10d7:a4b1 with SMTP id
 5b1f17b1804b1-42ccd35b222mr29768305e9.25.1726064347545; 
 Wed, 11 Sep 2024 07:19:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMnkWtyC/MfafsJDm61mmVgGA9rBtEvsfE5aKiE1D1yVv54Nl+uOBqFqTLrT0XlY4lvOkAYA==
X-Received: by 2002:a05:600c:1987:b0:428:10d7:a4b1 with SMTP id
 5b1f17b1804b1-42ccd35b222mr29767825e9.25.1726064346821; 
 Wed, 11 Sep 2024 07:19:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d2ec2sm11746749f8f.75.2024.09.11.07.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:19:06 -0700 (PDT)
Message-ID: <2fb7978b-9d1f-49f1-afe0-f32cc3b6a0c0@redhat.com>
Date: Wed, 11 Sep 2024 16:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: James Jones <jajones@nvidia.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
 <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
 <21e44532-7989-43a9-99dd-04461c346be6@nvidia.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <21e44532-7989-43a9-99dd-04461c346be6@nvidia.com>
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

On 06/09/2024 21:36, James Jones wrote:
> Right, there are 3 iterations of block linear tiling actually. NV50 does 
> support scanout of block linear surfaces. All block-linear-capable GPUs 
> do. The 3 generations are:
> 
> NV5x/G8x/GTXXX line: Original block size.
> GFXXX(nvc0 I believe in nouveau terms)-GV100: double the block height I 
> believe.
> GTXXX+: Same block size, but the layout within a block is subtly 
> different, at least as visible in CPU mappings.
> 

I'm looking at how to check for specific chip in nouveau, and fix the 
tiling for other cards than Turing.
It looks like in most case nouveau uses device->info.chipset, with 
hardcoded hex value. so for nvc0+ I should check device->info.chipset >= 
0xc0 ?

chipset < c0 : block_height 4, "old layout"
chipset >= c0 : block_height 8, "old layout"
chispet >= ?? : block_height 8, "new layout"

For testing, I have at hand a GTX1650 (Turing) and an old Geforce 
8800GTS (Tesla?), so it's a NV92, and still uses this nv50+ code ?

So I should be able to figure out if there is a tiling layout difference 
on my 8800GTS.

> If there isn't enough info on the layouts in the reverse engineered 
> documentation, believe this is somewhat documented in drm_fourcc.h, and 
> it has a link to a technical reference manual describing the details of 
> the 2nd-gen layout (Pre-turing), though I believe it's behind a 
> developer account login wall that's free to sign up for but may require 
> agreeing to a EULA of some sort regarding the content. Once you get the 
> pre-turing layout working, just halve the block height to get it working 
> on NV5x. If that isn't sufficient, reach out and we'll see what we can 
> do to improve documentation or answer specific questions.

I didn't find the link, but I think I have enough information, thanks 
for your support.

Best regards,

-- 

Jocelyn

> 
> Thanks,
> -James
> 
> On 9/6/24 05:53, Ilia Mirkin wrote:
>> On Fri, Sep 6, 2024 at 6:05 AM Jocelyn Falempe <jfalempe@redhat.com 
>> <mailto:jfalempe@redhat.com>> wrote:
>>
>>     Add drm_panic support, for nv50+ cards.
>>     It's enough to get the panic screen while running Gnome/Wayland on a
>>     GTX 1650.
>>     It doesn't support multi-plane or compressed format.
>>     Support for other formats and older cards will come later.
>>     Tiling is only tested on GTX1650, and might be wrong for other cards.
>>
>>
>> I'm moderately sure that nv50 and nvc0 tile differently (the general 
>> algo is the same, but height is different):
>>
>> https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html? 
>> highlight=tiling#blocklinear-surfaces <https:// 
>> envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html? 
>> highlight=tiling#blocklinear-surfaces>
>>
>> That said, I don't know that nv50 supports scanout of tiled surfaces 
>> (nor was I aware that nvc0+ did, perhaps it's a recent feature, or 
>> perhaps I'm just forgetful).
>>
>> Cheers,
>>
>>    -ilia
>>
>>
>>     Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com
>>     <mailto:jfalempe@redhat.com>>
>>     ---
>>     v2:
>>       * Rebase and drop already merged patches.
>>       * Rework the tiling algorithm, using "swizzle" to compute the 
>> offset
>>         inside the block.
>>
>>       drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 ++++++++++++++++++ 
>> +++++-
>>       1 file changed, 105 insertions(+), 2 deletions(-)
>>
>>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>     b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>     index 7a2cceaee6e9..50ecf6f12b81 100644
>>     --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>     @@ -30,11 +30,16 @@
>>       #include <nvhw/class/cl507e.h>
>>       #include <nvhw/class/clc37e.h>
>>
>>     +#include <linux/iosys-map.h>
>>     +
>>       #include <drm/drm_atomic.h>
>>       #include <drm/drm_atomic_helper.h>
>>       #include <drm/drm_blend.h>
>>     -#include <drm/drm_gem_atomic_helper.h>
>>       #include <drm/drm_fourcc.h>
>>     +#include <drm/drm_framebuffer.h>
>>     +#include <drm/drm_gem_atomic_helper.h>
>>     +#include <drm/drm_panic.h>
>>     +#include <drm/ttm/ttm_bo.h>
>>
>>       #include "nouveau_bo.h"
>>       #include "nouveau_gem.h"
>>     @@ -577,6 +582,93 @@ nv50_wndw_prepare_fb(struct drm_plane *plane,
>>     struct drm_plane_state *state)
>>              return 0;
>>       }
>>
>>     +#define NV_TILE_BLK_BASE_HEIGHT 8      /* In pixel */
>>     +#define NV_TILE_GOB_SIZE 64    /* In bytes */
>>     +#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits
>>     pixel */
>>     +
>>     +/* get the offset in bytes inside the framebuffer, after taking
>>     tiling into account */
>>     +static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer
>>     *sb, unsigned int blk_h,
>>     +                                         unsigned int x, unsigned
>>     int y)
>>     +{
>>     +       u32 blk_x, blk_y, blk_sz, blk_off, pitch;
>>     +       u32 swizzle;
>>     +
>>     +       blk_sz = NV_TILE_GOB_SIZE * blk_h;
>>     +       pitch = DIV_ROUND_UP(sb->width, NV_TILE_BLK_WIDTH);
>>     +
>>     +       /* block coordinate */
>>     +       blk_x = x / NV_TILE_BLK_WIDTH;
>>     +       blk_y = y / blk_h;
>>     +
>>     +       blk_off = ((blk_y * pitch) + blk_x) * blk_sz;
>>     +
>>     +       y = y % blk_h;
>>     +
>>     +       /* Inside the block, use the fast address swizzle to compute
>>     the offset
>>     +        * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1
>>     y0 x1 x0
>>     +        */
>>     +       swizzle = (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) 
>> << 3;
>>     +       swizzle |= (x & 8) << 3 | (y >> 3) << 7;
>>     +
>>     +       return blk_off + swizzle * 4;
>>     +}
>>     +
>>     +static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned
>>     int x, unsigned int y, u32 color)
>>     +{
>>     +       struct drm_framebuffer *fb = sb->private;
>>     +       unsigned int off;
>>     +       /* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D
>>     documentation,
>>     +        * the last 4 bits of the modifier is log2(blk_height /
>>     NV_TILE_BLK_BASE_HEIGHT)
>>     +        */
>>     +       unsigned int blk_h = NV_TILE_BLK_BASE_HEIGHT * (1 <<
>>     (fb->modifier & 0xf));
>>     +
>>     +       off = nv50_get_tiled_offset(sb, blk_h, x, y);
>>     +       iosys_map_wr(&sb->map[0], off, u32, color);
>>     +}
>>     +
>>     +static int
>>     +nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct
>>     drm_scanout_buffer *sb)
>>     +{
>>     +       struct drm_framebuffer *fb;
>>     +       struct nouveau_bo *nvbo;
>>     +
>>     +       if (!plane->state || !plane->state->fb)
>>     +               return -EINVAL;
>>     +
>>     +       fb = plane->state->fb;
>>     +       nvbo = nouveau_gem_object(fb->obj[0]);
>>     +
>>     +       /* Don't support compressed format, or multiplane yet. */
>>     +       if (nvbo->comp || fb->format->num_planes != 1)
>>     +               return -EOPNOTSUPP;
>>     +
>>     +       if (nouveau_bo_map(nvbo)) {
>>     +               pr_warn("nouveau bo map failed, panic won't be
>>     displayed\n");
>>     +               return -ENOMEM;
>>     +       }
>>     +
>>     +       if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
>>     +               iosys_map_set_vaddr_iomem(&sb->map[0],
>>     nvbo->kmap.virtual);
>>     +       else
>>     +               iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
>>     +
>>     +       sb->height = fb->height;
>>     +       sb->width = fb->width;
>>     +       sb->pitch[0] = fb->pitches[0];
>>     +       sb->format = fb->format;
>>     +
>>     +       /* If tiling is enabled, use the set_pixel() to display
>>     correctly.
>>     +        * Only handle 32bits format for now.
>>     +        */
>>     +       if (fb->modifier & 0xf) {
>>     +               if (fb->format->cpp[0] != 4)
>>     +                       return -EOPNOTSUPP;
>>     +               sb->private = (void *) fb;
>>     +               sb->set_pixel = nv50_set_pixel;
>>     +       }
>>     +       return 0;
>>     +}
>>     +
>>       static const struct drm_plane_helper_funcs
>>       nv50_wndw_helper = {
>>              .prepare_fb = nv50_wndw_prepare_fb,
>>     @@ -584,6 +676,14 @@ nv50_wndw_helper = {
>>              .atomic_check = nv50_wndw_atomic_check,
>>       };
>>
>>     +static const struct drm_plane_helper_funcs
>>     +nv50_wndw_primary_helper = {
>>     +       .prepare_fb = nv50_wndw_prepare_fb,
>>     +       .cleanup_fb = nv50_wndw_cleanup_fb,
>>     +       .atomic_check = nv50_wndw_atomic_check,
>>     +       .get_scanout_buffer = nv50_wndw_get_scanout_buffer,
>>     +};
>>     +
>>       static void
>>       nv50_wndw_atomic_destroy_state(struct drm_plane *plane,
>>                                     struct drm_plane_state *state)
>>     @@ -732,7 +832,10 @@ nv50_wndw_new_(const struct nv50_wndw_func
>>     *func, struct drm_device *dev,
>>                      return ret;
>>              }
>>
>>     -       drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
>>     +       if (type == DRM_PLANE_TYPE_PRIMARY)
>>     +               drm_plane_helper_add(&wndw->plane,
>>     &nv50_wndw_primary_helper);
>>     +       else
>>     +               drm_plane_helper_add(&wndw->plane, 
>> &nv50_wndw_helper);
>>
>>              if (wndw->func->ilut) {
>>                      ret = nv50_lut_init(disp, mmu, &wndw->ilut);
>>     --     2.46.0
>>

