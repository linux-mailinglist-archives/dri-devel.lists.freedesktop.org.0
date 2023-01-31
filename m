Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15729683AB3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 00:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C831410E07C;
	Tue, 31 Jan 2023 23:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7110E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 23:47:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E430832004ED;
 Tue, 31 Jan 2023 18:47:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 31 Jan 2023 18:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1675208872; x=
 1675295272; bh=YXCSxEPbtiK70DCQdljFAnxJiGq1kVvAx/GYW09biZo=; b=o
 Jd/J5Tw31ZYtKd2AVGYPpvB6atzQj4FBLGkeCQ2K+6BNHF3vsE+PYJmggF+Iyqgu
 F33fKzyB+5YPyTUCfXGVrsE9AE76GqfjRtcvTIRG8jSmogX6h8fpL7uxrCuobq1e
 PBywxa9j4egiCdzRwevaQZTJFVoY14hZJfT7az+kNoLnrf9gw4hcanGA1q2jUwL+
 SPj6sgr/1HvcNxuPaxRV/2IbEuUv1j4TuetHycD23nWY9AgxfW8Dt0iMoJD/XZ9U
 1O9sQs1rvPB32KpKyxKuMaRj99KHSU164p+W3Psfn24CAokKxKcV2gInub29FbHI
 mUKHfE5Fox9kqa/Fbc2xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675208872; x=
 1675295272; bh=YXCSxEPbtiK70DCQdljFAnxJiGq1kVvAx/GYW09biZo=; b=B
 V7QQB1Q0krvtILshgbVbgSzMjBghbLzLQyD3YuOUfnGOTp0WSYFUD1GCb95KoZhJ
 Noc5Ex1UaIcCMCIvWd3vcYScL2ldnGenSMU0OtUGXCrhcgRPnvqciHfDWxsB81vp
 nVV+hVGLyfPrfs8IM29ImhlT3TRVPqdfzzrRY40SnJ5SPWUSEEcQXNnTpLUxBBBp
 8f/CJLZMsv6pmT4WC9CAJJgq3oxK6f0E4YquP9QGpNNW2CS/GufUgpLmcbcr9CaQ
 AZLOOi8ZjwjExeTX1I9L5vL4VcKlIXxMSFwlUB8KZifMgHSCaNsZk62Ckpx4jtsF
 o/EEcEMEiij2S42MoibBQ==
X-ME-Sender: <xms:p6jZYzYHWXwK_RSzRsjTVWJ_IVJodaxGvqNVV5dhCZepPSUapI5Tmg>
 <xme:p6jZYyayILBphuSt7z2cmvei_Niq_6hjT7-3mrscIEP4VTRtjCbkVkf2Jo0QbjRKA
 _uBi4mtyueDFQn798g>
X-ME-Received: <xmr:p6jZY19WYoRQzpiiu3FoNPIDQmiwLMpCPPmcJhw14fW9WXqMQ-N4e99YQTYGFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpedfmgdf
 ofgrrgiiucfoohhmsggrshgrfigrlhgrucdlggfofigrrhgvmddfuceomhgrrgiimhesfh
 grshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhgedvvdfguedtteeh
 ffejlefhgfdufeduueejvdevheevuefhtefhtdejffenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrggriihmsehfrghsthhmrghilhdrtgho
 mh
X-ME-Proxy: <xmx:p6jZY5qM7_361ikFk8xBPye0PEkZq4Fa6UAJJTpnG8U5x8SQynEWYQ>
 <xmx:p6jZY-r9jL1L-G6Z5OZ-SuyOlFpdLF4_MjTODdK0rlIPubsVFQ_0Cg>
 <xmx:p6jZY_T0xuFS3ewErRBB21dWe15eNBhPK3y2Pnbod-uFFQV73Qe6Mw>
 <xmx:qKjZY3knysFH_x0iIZbAP-UCRLh_Jc6WfFlIcjY3btRna8227q465g>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 18:47:51 -0500 (EST)
Message-ID: <d605dc64-37a0-71ab-acdc-e4d5519f5e23@fastmail.com>
Date: Tue, 31 Jan 2023 15:47:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/8] drm/vmwgfx: Use the common gem mmap instead of the
 custom code
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-2-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230131033542.953249-2-zack@kde.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 19:35, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Before vmwgfx supported gem it needed to implement the entire mmap logic
> explicitly. With GEM support that's not needed and the generic code
> can be used by simply setting the vm_ops to vmwgfx specific ones on the
> gem object itself.
> 
> Removes a lot of code from vmwgfx without any functional difference.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/Makefile          |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c      |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |   6 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      |   8 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 110 -----------------------
>  5 files changed, 10 insertions(+), 118 deletions(-)
>  delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> 
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
> index 2a644f035597..e94479d9cd5b 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
>  	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
> -	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
> +	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o \
>  	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>  	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
>  	    vmwgfx_surface.o vmwgfx_prime.o vmwgfx_mob.o vmwgfx_shader.o \
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index bd02cb0e6837..e0c2e3748015 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1566,7 +1566,7 @@ static const struct file_operations vmwgfx_driver_fops = {
>  	.open = drm_open,
>  	.release = drm_release,
>  	.unlocked_ioctl = vmw_unlocked_ioctl,
> -	.mmap = vmw_mmap,
> +	.mmap = drm_gem_mmap,
>  	.poll = drm_poll,
>  	.read = drm_read,
>  #if defined(CONFIG_COMPAT)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 5acbf5849b27..4dfa5044a9e7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1053,12 +1053,6 @@ vmw_is_cursor_bypass3_enabled(const struct vmw_private *dev_priv)
>  	return (vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_CURSOR_BYPASS_3) != 0;
>  }
>  
> -/**
> - * TTM glue - vmwgfx_ttm_glue.c
> - */
> -
> -extern int vmw_mmap(struct file *filp, struct vm_area_struct *vma);
> -
>  /**
>   * TTM buffer object driver - vmwgfx_ttm_buffer.c
>   */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index ce609e7d758f..ba4ddd9f7a7e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -103,6 +103,13 @@ static struct sg_table *vmw_gem_object_get_sg_table(struct drm_gem_object *obj)
>  	return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages, vmw_tt->dma_ttm.num_pages);
>  }
>  
> +static const struct vm_operations_struct vmw_vm_ops = {
> +	.pfn_mkwrite = vmw_bo_vm_mkwrite,
> +	.page_mkwrite = vmw_bo_vm_mkwrite,
> +	.fault = vmw_bo_vm_fault,
> +	.open = ttm_bo_vm_open,
> +	.close = ttm_bo_vm_close,
> +};
>  
>  static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>  	.free = vmw_gem_object_free,
> @@ -115,6 +122,7 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>  	.vmap = drm_gem_ttm_vmap,
>  	.vunmap = drm_gem_ttm_vunmap,
>  	.mmap = drm_gem_ttm_mmap,
> +	.vm_ops = &vmw_vm_ops,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> deleted file mode 100644
> index 265f7c48d856..000000000000
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR MIT
> -/**************************************************************************
> - *
> - * Copyright 2009-2011 VMware, Inc., Palo Alto, CA., USA
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the
> - * "Software"), to deal in the Software without restriction, including
> - * without limitation the rights to use, copy, modify, merge, publish,
> - * distribute, sub license, and/or sell copies of the Software, and to
> - * permit persons to whom the Software is furnished to do so, subject to
> - * the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the
> - * next paragraph) shall be included in all copies or substantial portions
> - * of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> - * USE OR OTHER DEALINGS IN THE SOFTWARE.
> - *
> - **************************************************************************/
> -
> -#include "vmwgfx_drv.h"
> -
> -static int vmw_bo_vm_lookup(struct ttm_device *bdev,
> -				   struct drm_file *filp,
> -				   unsigned long offset,
> -				   unsigned long pages,
> -				   struct ttm_buffer_object **p_bo)
> -{
> -	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
> -	struct drm_device *drm = &dev_priv->drm;
> -	struct drm_vma_offset_node *node;
> -	int ret;
> -
> -	*p_bo = NULL;
> -
> -	drm_vma_offset_lock_lookup(bdev->vma_manager);
> -
> -	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
> -	if (likely(node)) {
> -		*p_bo = container_of(node, struct ttm_buffer_object,
> -				  base.vma_node);
> -		*p_bo = ttm_bo_get_unless_zero(*p_bo);
> -	}
> -
> -	drm_vma_offset_unlock_lookup(bdev->vma_manager);
> -
> -	if (!*p_bo) {
> -		drm_err(drm, "Could not find buffer object to map\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!drm_vma_node_is_allowed(node, filp)) {
> -		ret = -EACCES;
> -		goto out_no_access;
> -	}
> -
> -	return 0;
> -out_no_access:
> -	ttm_bo_put(*p_bo);
> -	return ret;
> -}
> -
> -int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	static const struct vm_operations_struct vmw_vm_ops = {
> -		.pfn_mkwrite = vmw_bo_vm_mkwrite,
> -		.page_mkwrite = vmw_bo_vm_mkwrite,
> -		.fault = vmw_bo_vm_fault,
> -		.open = ttm_bo_vm_open,
> -		.close = ttm_bo_vm_close,
> -	};
> -	struct drm_file *file_priv = filp->private_data;
> -	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
> -	struct ttm_device *bdev = &dev_priv->bdev;
> -	struct ttm_buffer_object *bo;
> -	int ret;
> -
> -	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
> -		return -EINVAL;
> -
> -	ret = vmw_bo_vm_lookup(bdev, file_priv, vma->vm_pgoff, vma_pages(vma), &bo);
> -	if (unlikely(ret != 0))
> -		return ret;
> -
> -	ret = ttm_bo_mmap_obj(vma, bo);
> -	if (unlikely(ret != 0))
> -		goto out_unref;
> -
> -	vma->vm_ops = &vmw_vm_ops;
> -
> -	/* Use VM_PFNMAP rather than VM_MIXEDMAP if not a COW mapping */
> -	if (!is_cow_mapping(vma->vm_flags))
> -		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
> -
> -	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
> -
> -	return 0;
> -
> -out_unref:
> -	ttm_bo_put(bo);
> -	return ret;
> -}
> -

LGTM!

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>

-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

