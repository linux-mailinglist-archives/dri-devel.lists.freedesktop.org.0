Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C5780B69
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 13:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD2810E4FE;
	Fri, 18 Aug 2023 11:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8EB10E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 11:53:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso737406f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692359625; x=1692964425;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtOGTiKrr6SCez5gSfiLFPaFYp7dcEGMYmuqL6K1NTc=;
 b=MfICI6y8r6tAKkQs8o+OSydSy4ydUMHa0QY7Vqk1kOE97krnwR/cKmdoksf0NRB7Ii
 rTXAoZ1rI6u1LpDUX0F9rHkTsmsxcSP+UitnjxK5hbsHcfNw101ia9zN+glFaH4K/cg1
 5nJLxQN/XnWTd/Fe1qVcO4m8DfUtYc5VeELurtuTQyT/a60cPuf8SwDa/pEigXPUnOHl
 leCvKDpz1g9/RWm/2lwnOi23kkzZ6cx0qP0slyVR0wrxr+1sohiEeWg5jHThYsLb5Mu7
 CU52dvRlH7l+wBs86PoEp7MFIWLn08+B6Yi7FATcHk52QSmq/OyoUBI4oghgB9F+2Ibn
 2gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692359625; x=1692964425;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wtOGTiKrr6SCez5gSfiLFPaFYp7dcEGMYmuqL6K1NTc=;
 b=kBex8kN1uRJkErpMgg6PQvz1OgD+jO8q1Elkmj30mt9I5M4LLd52Wu0LljAc9gKPM/
 3fGrrWX+cSPqq1YzkPt1z6tD9b88Gz/NXttm2vLmiQOrsibU4/ea/Hl1gD7Sy1QVDyWZ
 Fx7f5iNv5vEXEjeVYuiwRkRo08gOXLhCzCddP4bBqoQG/BDe6fplezOGg0i3vWxm1lzG
 iAjoqFnZQE9GOPd3kA7QLHESHdTlbwkZ/siU5Y+OG+gsV9ABJ0F6hiKmzJJ5maTQJZlq
 T2AixUPHj9DHs/EuKvNUy+iJo+8apBN6LCV5uccOkN93lgnpjzVOF6QNDwmIYKfLSrcz
 1OPA==
X-Gm-Message-State: AOJu0YxvdN3FMG2MayUGwEXQ+SpEMvQvGIvWdyqSUorcKSr7oy0l9gb/
 VZQaTjKKUvqWkCNct/dmi78=
X-Google-Smtp-Source: AGHT+IG9M1eFCERR3lrAqw/Xb44KOSBVou1XiO2Bt2BAItAHaQEMFWV5NpAnHcaCXY/EbK1Fapzv7Q==
X-Received: by 2002:a5d:69cc:0:b0:317:e766:d5e9 with SMTP id
 s12-20020a5d69cc000000b00317e766d5e9mr2026905wrw.3.1692359625375; 
 Fri, 18 Aug 2023 04:53:45 -0700 (PDT)
Received: from [192.168.2.181] (62-73-122-112.ip.btc-net.bg. [62.73.122.112])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b0031989784d96sm2560311wrm.76.2023.08.18.04.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 04:53:45 -0700 (PDT)
Message-ID: <098d9ce4-965b-9376-e0ea-bb987c38f82c@gmail.com>
Date: Fri, 18 Aug 2023 14:53:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix possible invalid drm gem put calls
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

From: Martin Krastev <krastevm@vmware.com>


LGTM!

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 18 Aug 2023 04:13:14, Zack Rusin wrote:

 >From: Zack Rusin <zackr@vmware.com>
 >
 >vmw_bo_unreference sets the input buffer to null on exit, resulting in
 >null ptr deref's on the subsequent drm gem put calls.
 >
 >This went unnoticed because only very old userspace would be exercising
 >those paths but it wouldn't be hard to hit on old distros with brand
 >new kernels.
 >
 >Introduce a new function that abstracts unrefing of user bo's to make
 >the code cleaner and more explicit.
 >
 >Signed-off-by: Zack Rusin <zackr@vmware.com>
 >Reported-by: Ian Forbes <iforbes@vmware.com>
 >Fixes: 9ef8d83e8e25 ("drm/vmwgfx: Do not drop the reference to the 
handle too soon")
 >Cc: <stable@vger.kernel.org> # v6.4+
 >---
 > drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 6 ++----
 > drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      | 8 ++++++++
 > drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 6 ++----
 > drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 6 ++----
 > drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 3 +--
 > drivers/gpu/drm/vmwgfx/vmwgfx_shader.c  | 3 +--
 > 6 files changed, 16 insertions(+), 16 deletions(-)
 >
 >diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
 >index 82094c137855..c43853597776 100644
 >--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
 >+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
 >@@ -497,10 +497,9 @@ static int vmw_user_bo_synccpu_release(struct 
drm_file *filp,
 >                 if (!(flags & drm_vmw_synccpu_allow_cs)) {
 > atomic_dec(&vmw_bo->cpu_writers);
 >                 }
 >-               ttm_bo_put(&vmw_bo->tbo);
 >+               vmw_user_bo_unref(vmw_bo);
 >         }
 >
 >-       drm_gem_object_put(&vmw_bo->tbo.base);
 >         return ret;
 > }
 >
 >@@ -540,8 +539,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device 
*dev, void *data,
 >                         return ret;
 >
 >                 ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
 >-               vmw_bo_unreference(&vbo);
 >-               drm_gem_object_put(&vbo->tbo.base);
 >+               vmw_user_bo_unref(vbo);
 >                 if (unlikely(ret != 0)) {
 >                         if (ret == -ERESTARTSYS || ret == -EBUSY)
 >                                 return -EBUSY;
 >diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h 
b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 >index 50a836e70994..1d433fceed3d 100644
 >--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 >+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 >@@ -195,6 +195,14 @@ static inline struct vmw_bo 
*vmw_bo_reference(struct vmw_bo *buf)
 >         return buf;
 > }
 >
 >+static inline void vmw_user_bo_unref(struct vmw_bo *vbo)
 >+{
 >+       if (vbo) {
 >+               ttm_bo_put(&vbo->tbo);
 >+               drm_gem_object_put(&vbo->tbo.base);
 >+       }
 >+}
 >+
 > static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
 > {
 >         return container_of((gobj), struct vmw_bo, tbo.base);
 >diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
 >index 6b9aa2b4ef54..25b96821df0f 100644
 >--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
 >+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
 >@@ -1164,8 +1164,7 @@ static int vmw_translate_mob_ptr(struct 
vmw_private *dev_priv,
 >         }
 >         vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, 
VMW_BO_DOMAIN_MOB);
 >         ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
 >-       ttm_bo_put(&vmw_bo->tbo);
 >-       drm_gem_object_put(&vmw_bo->tbo.base);
 >+       vmw_user_bo_unref(vmw_bo);
 >         if (unlikely(ret != 0))
 >                 return ret;
 >
 >@@ -1221,8 +1220,7 @@ static int vmw_translate_guest_ptr(struct 
vmw_private *dev_priv,
 >         vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_GMR | 
VMW_BO_DOMAIN_VRAM,
 >                              VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
 >         ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
 >-       ttm_bo_put(&vmw_bo->tbo);
 >-       drm_gem_object_put(&vmw_bo->tbo.base);
 >+       vmw_user_bo_unref(vmw_bo);
 >         if (unlikely(ret != 0))
 >                 return ret;
 >
 >diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
 >index b62207be3363..1489ad73c103 100644
 >--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
 >+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
 >@@ -1665,10 +1665,8 @@ static struct drm_framebuffer 
*vmw_kms_fb_create(struct drm_device *dev,
 >
 > err_out:
 >         /* vmw_user_lookup_handle takes one ref so does new_fb */
 >-       if (bo) {
 >-               vmw_bo_unreference(&bo);
 >-               drm_gem_object_put(&bo->tbo.base);
 >-       }
 >+       if (bo)
 >+               vmw_user_bo_unref(bo);
 >         if (surface)
 >                 vmw_surface_unreference(&surface);
 >
 >diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
 >index 7e112319a23c..fb85f244c3d0 100644
 >--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
 >+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
 >@@ -451,8 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void 
*data,
 >
 >         ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
 >
 >-       vmw_bo_unreference(&buf);
 >-       drm_gem_object_put(&buf->tbo.base);
 >+       vmw_user_bo_unref(buf);
 >
 > out_unlock:
 >         mutex_unlock(&overlay->mutex);
 >diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
 >index e7226db8b242..1e81ff2422cf 100644
 >--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
 >+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
 >@@ -809,8 +809,7 @@ static int vmw_shader_define(struct drm_device 
*dev, struct drm_file *file_priv,
 >                                     shader_type, num_input_sig,
 >                                     num_output_sig, tfile, 
shader_handle);
 > out_bad_arg:
 >-       vmw_bo_unreference(&buffer);
 >-       drm_gem_object_put(&buffer->tbo.base);
 >+       vmw_user_bo_unref(buffer);
 >         return ret;
 > }
 >
 >--
 >2.39.2

