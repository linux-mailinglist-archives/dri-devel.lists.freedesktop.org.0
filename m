Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4889F9588
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 16:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E30710EFD4;
	Fri, 20 Dec 2024 15:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iCUkY0x5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B75F10EFD4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 15:35:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so1046650f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734708957; x=1735313757; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfkJCad+A+iVjZcecP+k/K3UeIifLkoyzVseZ2/1Qhk=;
 b=iCUkY0x5XPKKDT8AieApAOneLDgS2pVieIN6Lbh7ONwhH9du67ylRTwoSln6CI/snB
 jg6n1/PNKTdcdT1WS6tMntF+H+IOWsKYp5zUbOB+1PgIp/5ak3Duz8wYrz1tMzasMU1Y
 BPLEaUrqEb7I1h+KyU+Ji5UGLuSzxSiXwwSos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734708957; x=1735313757;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfkJCad+A+iVjZcecP+k/K3UeIifLkoyzVseZ2/1Qhk=;
 b=YpbcTcYVsjK597r5cDAvFzPexTWFJ4oozzOagubJWPsv8LMDE4TF2iwlYCcQ3J5W7F
 zs26hg0gTnNnl0eIoPsOg/jG20Co/lwQSzbJ/ePhQ7oBfJu7pIWbjgYyZLU0jlTZk+r7
 9U7dU0O8syjH/mNQqgr/dJyJ+iSPsVJrstvUbAAqovmMz82ZbDGB8STxBvjj+QpiPhP3
 UG/+p5ZjNy9Qrjm8hb5OAk0nn5lywbck0B6Nb1rwTNejO5W14APxXKdHrO61R5vZnz35
 D++sGwyW64vwdj/ZfXOv9CREahW58Lx0SYbLNPrARbbn0CoiDcpscdfr42N3e6PGgG6s
 E2Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuX7yWOes1tx/UH12WPRdZ7XX0Ys2p0XMHcyVXhPGy3LHZQ2R/iRzmC6UTwTwczUVDvB+89or75jQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT7mRmiv+DDUIa2XGNFMf+Ks0n+T+z9ZIRKpkdP94OeNYKhj2d
 HPkpLPTnr/O6xs1xh1bDv4aAMQ7uEsfbAml7kK7Ka1cXUIvZOTA2+E3OhtdjeNM=
X-Gm-Gg: ASbGncucYCDAiqPSCefgerLkYd2J2McxanEtRZA8haYZ50S/EC8uU0ebJDK+WtDKaY5
 /MtfbEV3skiCIm2O0DEbeBXxH9R4TTwuDqpT0IoaNb7vRhRfoq9rSpz4I16mzoKoWv8tHPXnUkY
 CIQxpjAxrviga9+d+nYhvdOFIVFooAkDq5NaxJNG9TfAZvnRo0JbbujRmcAy7iuR3C+rCiV1xEv
 OIrSKl29D/9VZQBD+IEhtfpT5k1gP0fLwUXzE8HB9aNT2gairdHGWPUA1bY3nYg++QA
X-Google-Smtp-Source: AGHT+IF6AOc1GaG6a3dvqJs7sJDQ8BZnCGV0gCjAMjfEw98XQBEJL1Oew4vJC85y+GRbp9a4YfZbxQ==
X-Received: by 2002:a5d:5f8a:0:b0:385:e3d3:be1b with SMTP id
 ffacd0b85a97d-38a2220044emr3502186f8f.28.1734708956840; 
 Fri, 20 Dec 2024 07:35:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832a90sm4271006f8f.28.2024.12.20.07.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 07:35:56 -0800 (PST)
Date: Fri, 20 Dec 2024 16:35:54 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Honglei Huang <honglei1.huang@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
Mail-Followup-To: Honglei Huang <honglei1.huang@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220100409.4007346-3-honglei1.huang@amd.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
> From: Honglei Huang <Honglei1.Huang@amd.com>
> 
> A virtio-gpu userptr is based on HMM notifier.
> Used for let host access guest userspace memory and
> notice the change of userspace memory.
> This series patches are in very beginning state,
> User space are pinned currently to ensure the host
> device memory operations are correct.
> The free and unmap operations for userspace can be
> handled by MMU notifier this is a simple and basice
> SVM feature for this series patches.
> The physical PFNS update operations is splited into
> two OPs in here. The evicted memories won't be used
> anymore but remap into host again to achieve same
> effect with hmm_rang_fault.

So in my opinion there are two ways to implement userptr that make sense:

- pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
  notifier

- unpinnned userptr where you entirely rely on userptr and do not hold any
  page references or page pins at all, for full SVM integration. This
  should use hmm_range_fault ideally, since that's the version that
  doesn't ever grab any page reference pins.

All the in-between variants are imo really bad hacks, whether they hold a
page reference or a temporary page pin (which seems to be what you're
doing here). In much older kernels there was some justification for them,
because strange stuff happened over fork(), but with FOLL_LONGTERM this is
now all sorted out. So there's really only fully pinned, or true svm left
as clean design choices imo.

With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
you?

The other part is that I think we really should extract these into
helpers. Definitely for the pinned variant, that should be really simple.

Cheers, Sima

> 
> Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
> ---
>  drivers/gpu/drm/virtio/Makefile          |   3 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  72 +++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  25 +-
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |   2 +
>  drivers/gpu/drm/virtio/virtgpu_object.c  |   5 +
>  drivers/gpu/drm/virtio/virtgpu_userptr.c | 738 +++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_vq.c      |  29 +
>  7 files changed, 871 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c
> 
> diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
> index d2e1788a8227..351c45e1e7d1 100644
> --- a/drivers/gpu/drm/virtio/Makefile
> +++ b/drivers/gpu/drm/virtio/Makefile
> @@ -2,8 +2,9 @@
>  #
>  # Makefile for the drm device driver.  This driver provides support for the
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> +# virtgpu_userptr.o
>  
> -virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
> +virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o virtgpu_userptr.o \
>  	virtgpu_display.o virtgpu_vq.o \
>  	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
>  	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o virtgpu_submit.o
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index e1ee17466f6b..5d15c018201d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -31,6 +31,8 @@
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_gpu.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/rbtree_types.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_drv.h>
> @@ -85,6 +87,7 @@ struct virtio_gpu_object_params {
>  	uint32_t blob_mem;
>  	uint32_t blob_flags;
>  	uint64_t blob_id;
> +	uint64_t blob_userptr;
>  };
>  
>  struct virtio_gpu_object {
> @@ -112,12 +115,50 @@ struct virtio_gpu_object_vram {
>  	struct drm_mm_node vram_node;
>  };
>  
> +enum userptr_work_list_ops {
> +	USERPTR_OP_NULL,
> +	USERPTR_OP_UNMAP,
> +	USERPTR_OP_UPDATE,
> +	USERPTR_OP_EVICT,
> +};
> +
> +struct virtio_gpu_object_userptr {
> +	struct virtio_gpu_object base;
> +
> +	struct page **pages;
> +	uint64_t userptr_inital_start;
> +	uint64_t userptr_start;
> +	uint64_t userptr_last;
> +	uint32_t npages;
> +	uint32_t bo_handle;
> +	struct list_head work_list;
> +	struct virtio_gpu_device *vgdev;
> +	struct mmu_interval_notifier notifier;
> +	struct drm_file *file;
> +
> +	/* for list work */
> +	struct mm_struct *mm;
> +	enum userptr_work_list_ops op;
> +	uint64_t notifier_start;
> +	uint64_t notifier_last;
> +
> +	/* userptr interval tree node */
> +	struct interval_tree_node it_node;
> +
> +	/* in release list work queue */
> +	atomic_t in_release;
> +	struct mutex lock;
> +};
> +
>  #define to_virtio_gpu_shmem(virtio_gpu_object) \
>  	container_of((virtio_gpu_object), struct virtio_gpu_object_shmem, base)
>  
>  #define to_virtio_gpu_vram(virtio_gpu_object) \
>  	container_of((virtio_gpu_object), struct virtio_gpu_object_vram, base)
>  
> +#define to_virtio_gpu_userptr(virtio_gpu_object) \
> +	container_of((virtio_gpu_object), struct virtio_gpu_object_userptr, base)
> +
>  struct virtio_gpu_object_array {
>  	struct ww_acquire_ctx ticket;
>  	struct list_head next;
> @@ -279,6 +320,16 @@ struct virtio_gpu_fpriv {
>  	uint64_t base_fence_ctx;
>  	uint64_t ring_idx_mask;
>  	struct mutex context_lock;
> +
> +	/* for userptr mmu notifier invalidate */
> +	struct work_struct userptr_invalidate_work;
> +	struct list_head userptr_invalidate_list;
> +	spinlock_t userptr_invalidate_list_lock;
> +
> +	/* userptr interval tree */
> +	struct rb_root_cached userptrs_tree;
> +	struct mutex userptrs_tree_lock;
> +
>  	char debug_name[DEBUG_NAME_MAX_LEN];
>  	bool explicit_debug_name;
>  	bool fence_passing_enabled;
> @@ -422,6 +473,14 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
>  				    struct virtio_gpu_object_params *params,
>  				    struct virtio_gpu_mem_entry *ents,
>  				    uint32_t nents);
> +
> +void
> +virtio_gpu_cmd_resource_create_userptr(struct virtio_gpu_device *vgdev,
> +				    struct virtio_gpu_object *bo,
> +				    struct virtio_gpu_object_params *params,
> +				    unsigned long *pfns,
> +				    uint32_t npfns);
> +
>  void
>  virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
>  				uint32_t scanout_id,
> @@ -497,4 +556,17 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
>  int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file);
>  
> +/* virtgpu_userptr.c */
> +void virtio_gpu_userptr_set_handle(struct virtio_gpu_object *qobj,
> +				   uint32_t handle);
> +uint32_t virtio_gpu_userptr_get_handle(struct virtio_gpu_object *qobj);
> +void virtio_gpu_userptr_list_work_init(struct virtio_gpu_fpriv *vfpriv);
> +void virtio_gpu_userptr_interval_tree_init(struct virtio_gpu_fpriv *vfpriv);
> +uint64_t virtio_gpu_userptr_get_offset(struct virtio_gpu_object *qobj,
> +				       uint64_t addr);
> +bool virtio_gpu_is_userptr(struct virtio_gpu_object *bo);
> +int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
> +			      struct drm_file *file,
> +			      struct virtio_gpu_object_params *params,
> +			      struct virtio_gpu_object **bo_ptr);
>  #endif
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index d40c7402720d..519278443c66 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -36,7 +36,8 @@
>  
>  #define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
>  				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
> -				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
> +				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE | \
> +				    VIRTGPU_BLOB_FLAG_USE_USERPTR)
>  
>  /* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
>  static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
> @@ -489,6 +490,7 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
>  	params->size = rc_blob->size;
>  	params->blob = true;
>  	params->blob_flags = rc_blob->blob_flags;
> +	params->blob_userptr = rc_blob->blob_userptr;
>  	return 0;
>  }
>  
> @@ -528,8 +530,20 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
>  				      rc_blob->cmd_size, 0);
>  	}
>  
> -	if (guest_blob)
> +	if (guest_blob && !params.blob_userptr)
>  		ret = virtio_gpu_object_create(vgdev, &params, &bo, NULL);
> +	else if (guest_blob && params.blob_userptr) {
> +		ret = virtio_gpu_userptr_create(vgdev, file, &params, &bo);
> +		if (unlikely(ret < 0))
> +			return ret;
> +		if (ret > 0) {
> +			/* userptr already exist */
> +			rc_blob->res_handle = bo->hw_res_handle;
> +			rc_blob->bo_handle = virtio_gpu_userptr_get_handle(bo);
> +			rc_blob->offset = virtio_gpu_userptr_get_offset(bo, rc_blob->blob_userptr);
> +			return ret;
> +		}
> +	}
>  	else if (!guest_blob && host3d_blob)
>  		ret = virtio_gpu_vram_create(vgdev, &params, &bo);
>  	else
> @@ -560,6 +574,9 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
>  
>  	rc_blob->res_handle = bo->hw_res_handle;
>  	rc_blob->bo_handle = handle;
> +	/* for mmu notifier auto release */
> +	if (guest_blob && params.blob_userptr)
> +		virtio_gpu_userptr_set_handle(bo, handle);
>  
>  	/*
>  	 * The handle owns the reference now.  But we must drop our
> @@ -691,6 +708,10 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>  			goto out_unlock;
>  		}
>  	}
> +	if (vfpriv->context_init & VIRTIO_GPU_CAPSET_HSAKMT) {
> +		virtio_gpu_userptr_list_work_init(vfpriv);
> +		virtio_gpu_userptr_interval_tree_init(vfpriv);
> +	}
>  
>  	virtio_gpu_create_context_locked(vgdev, vfpriv);
>  	virtio_gpu_notify(vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 9f4617a75edd..3af40ed8936a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -346,6 +346,8 @@ void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file)
>  		return;
>  
>  	if (vfpriv->context_created) {
> +		if (vfpriv->context_init & VIRTIO_GPU_CAPSET_HSAKMT)
> +			flush_work(&vfpriv->userptr_invalidate_work);
>  		virtio_gpu_cmd_context_destroy(vgdev, vfpriv->ctx_id);
>  		virtio_gpu_notify(vgdev);
>  	}
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index c7e74cf13022..31659b0a028d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -80,6 +80,11 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>  		drm_gem_free_mmap_offset(&vram->base.base.base);
>  		drm_gem_object_release(&vram->base.base.base);
>  		kfree(vram);
> +	} else if (virtio_gpu_is_userptr(bo)) {
> +		struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
> +
> +		drm_gem_object_release(&userptr->base.base.base);
> +		kfree(userptr);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_userptr.c b/drivers/gpu/drm/virtio/virtgpu_userptr.c
> new file mode 100644
> index 000000000000..646088f7f72b
> --- /dev/null
> +++ b/drivers/gpu/drm/virtio/virtgpu_userptr.c
> @@ -0,0 +1,738 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +#include "virtgpu_drv.h"
> +
> +#include <linux/dma-mapping.h>
> +
> +#include <linux/mm.h>
> +#include <linux/pid.h>
> +
> +#include "drm/drm_gem.h"
> +
> +#include <linux/mmu_notifier.h>
> +
> +#define USERPTR_PFNS_NO_CHANGE 0
> +#define USERPTR_PFNS_CHANGED 1
> +#define USERPTR_PFNS_NONE 2
> +
> +#define USERPTR_EXISTS 1
> +
> +static bool
> +virtio_gpu_userptr_invalidate(struct mmu_interval_notifier *mn,
> +			      const struct mmu_notifier_range *range,
> +			      unsigned long cur_seq);
> +
> +static const struct mmu_interval_notifier_ops virtio_gpu_userptr_mn_ops = {
> +	.invalidate = virtio_gpu_userptr_invalidate,
> +};
> +
> +static void virtio_gpu_userptr_unlink(struct virtio_gpu_fpriv *vfpriv,
> +				      struct virtio_gpu_object_userptr *userptr)
> +{
> +	if (userptr->it_node.start != 0 && userptr->it_node.last != 0)
> +		interval_tree_remove(&userptr->it_node, &vfpriv->userptrs_tree);
> +}
> +
> +static void virtio_gpu_userptr_free(struct drm_gem_object *obj)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
> +
> +	if (bo->created) {
> +		unpin_user_pages_dirty_lock(userptr->pages, userptr->npages,
> +					    false);
> +		vfree(userptr->pages);
> +		userptr->pages = NULL;
> +
> +		virtio_gpu_cmd_unref_resource(vgdev, bo);
> +		virtio_gpu_notify(vgdev);
> +
> +		return;
> +	}
> +}
> +
> +static void virtio_gpu_userptr_object_close(struct drm_gem_object *obj,
> +					    struct drm_file *file)
> +{
> +	virtio_gpu_gem_object_close(obj, file);
> +}
> +
> +static const struct drm_gem_object_funcs virtio_gpu_userptr_funcs = {
> +	.open = virtio_gpu_gem_object_open,
> +	.close = virtio_gpu_userptr_object_close,
> +	.free = virtio_gpu_userptr_free,
> +};
> +
> +bool virtio_gpu_is_userptr(struct virtio_gpu_object *bo)
> +{
> +	return bo->base.base.funcs == &virtio_gpu_userptr_funcs;
> +}
> +
> +static int
> +virtio_gpu_userptr_add_notifier(struct virtio_gpu_object_userptr *userptr,
> +				unsigned long start, unsigned long length)
> +{
> +	int ret = mmu_interval_notifier_insert_locked(
> +		&userptr->notifier, current->mm, start, length,
> +		&virtio_gpu_userptr_mn_ops);
> +
> +	if (ret)
> +		pr_err("mmu_interval_notifier_insert_locked failed ret: %d\n",
> +		       ret);
> +	return ret;
> +}
> +
> +uint32_t virtio_gpu_userptr_get_handle(struct virtio_gpu_object *qobj)
> +{
> +	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(qobj);
> +
> +	return userptr->bo_handle;
> +}
> +
> +uint64_t virtio_gpu_userptr_get_offset(struct virtio_gpu_object *qobj,
> +				       uint64_t addr)
> +{
> +	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(qobj);
> +	uint64_t userptr_align_down = ALIGN_DOWN(addr, PAGE_SIZE);
> +	uint64_t offset = userptr_align_down - userptr->userptr_inital_start;
> +	return offset;
> +}
> +
> +void virtio_gpu_userptr_interval_tree_init(struct virtio_gpu_fpriv *vfpriv)
> +{
> +	vfpriv->userptrs_tree = RB_ROOT_CACHED;
> +	mutex_init(&vfpriv->userptrs_tree_lock);
> +}
> +
> +static struct virtio_gpu_object_userptr *
> +virtio_gpu_userptr_from_addr_range(struct virtio_gpu_fpriv *vfpriv,
> +				   u_int64_t start, u_int64_t last)
> +{
> +	struct interval_tree_node *node;
> +	struct virtio_gpu_object_userptr *userptr = NULL;
> +	struct virtio_gpu_object_userptr *ret = NULL;
> +	uint64_t userptr_size;
> +
> +	node = interval_tree_iter_first(&vfpriv->userptrs_tree, start, last);
> +
> +	while (node) {
> +		struct interval_tree_node *next;
> +
> +		userptr = container_of(node, struct virtio_gpu_object_userptr,
> +				       it_node);
> +
> +		if (start >= userptr->userptr_start &&
> +		    last <= userptr->userptr_last &&
> +		    !atomic_read(&userptr->in_release) && !userptr->op) {
> +			ret = userptr;
> +			userptr_size = userptr->userptr_last -
> +				       userptr->userptr_start + 1UL;
> +			return ret;
> +		}
> +
> +		next = interval_tree_iter_next(node, start, last);
> +		node = next;
> +	}
> +
> +	return ret;
> +}
> +
> +static void
> +virtio_gpu_userptr_add_interval_tree(struct virtio_gpu_fpriv *vfpriv,
> +				     struct virtio_gpu_object_userptr *userptr)
> +{
> +	userptr->it_node.start = userptr->userptr_start;
> +	userptr->it_node.last = userptr->userptr_last;
> +	interval_tree_insert(&userptr->it_node, &vfpriv->userptrs_tree);
> +}
> +
> +static void virtio_gpu_userptr_unmap(struct virtio_gpu_object_userptr *userptr)
> +{
> +	pr_debug(
> +		"list work remove userptr: [%llx-%llx], resid: %d bo_handle: %d size: %x\n",
> +		userptr->userptr_start, userptr->userptr_last,
> +		userptr->base.hw_res_handle, userptr->bo_handle,
> +		userptr->npages);
> +
> +	virtio_gpu_userptr_unlink(userptr->file->driver_priv, userptr);
> +	mmu_interval_notifier_remove(&userptr->notifier);
> +
> +	drm_gem_handle_delete(userptr->file, userptr->bo_handle);
> +}
> +
> +static void virtio_gpu_userptr_update_notifier_and_interval_tree(
> +	struct virtio_gpu_object_userptr *userptr)
> +{
> +	unsigned long start = userptr->notifier.interval_tree.start;
> +	unsigned long last = userptr->notifier.interval_tree.last;
> +
> +	if (userptr->userptr_start == start && userptr->userptr_last == last)
> +		return;
> +
> +	if (start != 0 && last != 0) {
> +		virtio_gpu_userptr_unlink(userptr->file->driver_priv, userptr);
> +		mmu_interval_notifier_remove(&userptr->notifier);
> +	}
> +
> +	pr_debug(
> +		"update userptr: [%lx-%lx]-%lx -> [%llx-%llx]-%llx resid: %d\n",
> +		start, last, last - start + 1UL, userptr->userptr_start,
> +		userptr->userptr_last,
> +		userptr->userptr_last - userptr->userptr_start + 1UL,
> +		userptr->base.hw_res_handle);
> +
> +	virtio_gpu_userptr_add_interval_tree(userptr->file->driver_priv,
> +					     userptr);
> +	mmu_interval_notifier_insert_locked(
> +		&userptr->notifier, userptr->mm, userptr->userptr_start,
> +		userptr->userptr_last - userptr->userptr_start + 1UL,
> +		&virtio_gpu_userptr_mn_ops);
> +
> +	userptr->op = 0;
> +}
> +
> +static int virtio_gpu_userptr_split(struct virtio_gpu_object_userptr *userptr,
> +				    unsigned long valid_start,
> +				    unsigned long valid_last,
> +				    struct virtio_gpu_object_userptr **new)
> +{
> +	uint64_t old_start = userptr->userptr_start;
> +	uint64_t old_last = userptr->userptr_last;
> +
> +	if (old_start != valid_start && old_last != valid_last)
> +		return -EINVAL;
> +	if (valid_start < old_start || valid_last > old_last)
> +		return -EINVAL;
> +
> +	/* split new userptr is not needed currently, but keep the API parameters here
> +	 * for future expansion.
> +	 */
> +	*new = NULL;
> +
> +	/* update range */
> +	userptr->userptr_start = valid_start;
> +	userptr->userptr_last = valid_last;
> +
> +	return 0;
> +}
> +
> +static void
> +virtio_gpu_userptr_update_split(struct virtio_gpu_object_userptr *userptr,
> +				unsigned long mn_start, unsigned long mn_last)
> +{
> +	struct virtio_gpu_object_userptr *head;
> +	struct virtio_gpu_object_userptr *tail;
> +
> +	if (userptr->op == USERPTR_OP_UNMAP)
> +		return;
> +
> +	if (mn_start > userptr->userptr_last ||
> +	    mn_last < userptr->userptr_start)
> +		return;
> +
> +	head = tail = userptr;
> +	if (mn_start > userptr->userptr_start)
> +		virtio_gpu_userptr_split(userptr, userptr->userptr_start,
> +					 mn_start - 1UL, &tail);
> +	else if (mn_last < userptr->userptr_last)
> +		virtio_gpu_userptr_split(userptr, mn_last + 1UL,
> +					 userptr->userptr_last, &head);
> +
> +	/* split tail maybe not needed in virtgpu */
> +	/* if (mn_last < userptr->userptr_last) */
> +	/* add child userptr maybe not needed in virtgpu */
> +}
> +
> +static void
> +virtio_gpu_userptr_add_list_work(struct virtio_gpu_object_userptr *userptr,
> +				 int op)
> +{
> +	struct virtio_gpu_fpriv *vfpriv = userptr->file->driver_priv;
> +
> +	spin_lock(&vfpriv->userptr_invalidate_list_lock);
> +
> +	if (!list_empty(&userptr->work_list)) {
> +		pr_debug(
> +			"update exist userptr userptr: [%llx-%llx] work op to %d\n",
> +			userptr->userptr_start, userptr->userptr_last, op);
> +		if (op != USERPTR_OP_NULL && userptr->op != USERPTR_OP_UNMAP)
> +			userptr->op = op;
> +	} else {
> +		userptr->op = op;
> +		list_add_tail(&userptr->work_list,
> +			      &vfpriv->userptr_invalidate_list);
> +	}
> +
> +	spin_unlock(&vfpriv->userptr_invalidate_list_lock);
> +}
> +
> +static int
> +virtio_gpu_userptr_check_pfns(struct virtio_gpu_object_userptr *userptr,
> +			      struct vm_area_struct *vma, uint64_t start,
> +			      uint64_t end)
> +{
> +	uint64_t addr;
> +	int ret;
> +	unsigned long pfn;
> +	spinlock_t *ptl;
> +	pte_t *ptep;
> +
> +	for (addr = start; addr < end; addr += PAGE_SIZE) {
> +		ret = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> +		if (ret) {
> +			pr_debug("follow_pfn in userptr failed, addr: %llx\n",
> +				 addr);
> +			return USERPTR_PFNS_NONE;
> +		}
> +		pfn = pte_pfn(ptep_get(ptep));
> +		pte_unmap_unlock(ptep, ptl);
> +		if (page_to_pfn(
> +			    userptr->pages[(addr - userptr->userptr_start) >>
> +					   PAGE_SHIFT]) != pfn) {
> +			pr_debug("userptr pages not match, addr: %llx\n", addr);
> +			return USERPTR_PFNS_CHANGED;
> +		}
> +	}
> +
> +	return USERPTR_PFNS_NO_CHANGE;
> +}
> +
> +static int
> +virtio_gpu_userptr_check_range(struct virtio_gpu_object_userptr *userptr,
> +			       uint64_t notifier_start, uint64_t notifier_last)
> +{
> +	uint64_t start, end, addr;
> +	int r = 0;
> +
> +	start = notifier_start;
> +	end = notifier_last + (1UL << PAGE_SHIFT);
> +
> +	for (addr = start; !r && addr < end;) {
> +		struct vm_area_struct *vma;
> +		uint64_t next = 0;
> +		uint32_t npages;
> +
> +		vma = vma_lookup(userptr->mm, addr);
> +
> +		if (vma) {
> +			next = min(vma->vm_end, end);
> +			npages = (next - addr) >> PAGE_SHIFT;
> +			r = virtio_gpu_userptr_check_pfns(userptr, vma, start,
> +							  next);
> +			if (r)
> +				break;
> +		} else {
> +			pr_debug("vma not found for addr: %llx\n", addr);
> +			r = -EFAULT;
> +			break;
> +		}
> +
> +		addr = next;
> +	}
> +
> +	return r;
> +}
> +
> +static void
> +virtio_gpu_update_or_remove_userptr(struct virtio_gpu_object_userptr *userptr,
> +				    unsigned long start, unsigned long last)
> +{
> +	if ((userptr->userptr_start) >= start &&
> +	    (userptr->userptr_last) <= last) {
> +		if (atomic_xchg(&userptr->in_release, 1) == 0) {
> +			virtio_gpu_userptr_add_list_work(userptr,
> +							 USERPTR_OP_UNMAP);
> +		}
> +	} else {
> +		pr_debug(
> +			"mmu notifier: [%lx-%lx]-%lx userptr: [%llx-%llx]-%llx not match need update.\n",
> +			start, last, last - start + 1UL, userptr->userptr_start,
> +			userptr->userptr_last,
> +			userptr->userptr_last - userptr->userptr_start + 1UL);
> +		virtio_gpu_userptr_update_split(userptr, start, last);
> +		virtio_gpu_userptr_add_list_work(userptr, USERPTR_OP_UPDATE);
> +	}
> +}
> +
> +static void virtio_gpu_userptr_evict(struct virtio_gpu_object_userptr *userptr)
> +{
> +	if (!userptr->notifier_start || !userptr->notifier_last) {
> +		pr_err("userptr: [%llx-%llx] not have notifier range\n",
> +		       userptr->userptr_start, userptr->userptr_last);
> +		return;
> +	}
> +
> +	if (userptr->notifier_start < userptr->userptr_start ||
> +	    userptr->notifier_last > userptr->userptr_last) {
> +		pr_err("invalid evict param, userptr: [%llx-%llx] notifier: [%llx-%llx] out of range\n",
> +		       userptr->userptr_start, userptr->userptr_last,
> +		       userptr->notifier_start, userptr->notifier_last);
> +		return;
> +	}
> +
> +	if (virtio_gpu_userptr_check_range(userptr, userptr->notifier_start,
> +					   userptr->notifier_last)) {
> +		pr_debug("userptr: [%llx-%llx], resid: %d check range failed\n",
> +			 userptr->userptr_start, userptr->userptr_last,
> +			 userptr->base.hw_res_handle);
> +		/* add to work list or process here directly, add to work list here */
> +		virtio_gpu_update_or_remove_userptr(
> +			userptr, userptr->notifier_start,
> +			userptr->notifier_last + (1UL << PAGE_SHIFT) - 1UL);
> +	}
> +
> +	userptr->notifier_start = 0;
> +	userptr->notifier_last = 0;
> +}
> +
> +static void
> +virtio_gpu_userptr_handle_list_work(struct virtio_gpu_object_userptr *userptr)
> +{
> +	switch (userptr->op) {
> +	case USERPTR_OP_NULL:
> +		break;
> +	case USERPTR_OP_UNMAP:
> +		virtio_gpu_userptr_unmap(userptr);
> +		break;
> +	case USERPTR_OP_UPDATE:
> +		virtio_gpu_userptr_update_notifier_and_interval_tree(userptr);
> +		break;
> +	case USERPTR_OP_EVICT:
> +		virtio_gpu_userptr_evict(userptr);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void virtio_gpu_userptr_invalidate_work(struct work_struct *work)
> +{
> +	struct virtio_gpu_fpriv *vfpriv;
> +	struct virtio_gpu_object_userptr *userptr;
> +	struct mm_struct *mm;
> +
> +	vfpriv = container_of(work, struct virtio_gpu_fpriv,
> +			      userptr_invalidate_work);
> +
> +	spin_lock(&vfpriv->userptr_invalidate_list_lock);
> +	while (!list_empty(&vfpriv->userptr_invalidate_list)) {
> +		userptr = list_first_entry(&vfpriv->userptr_invalidate_list,
> +					   struct virtio_gpu_object_userptr,
> +					   work_list);
> +		spin_unlock(&vfpriv->userptr_invalidate_list_lock);
> +
> +		mm = userptr->mm;
> +
> +		mmap_write_lock(mm);
> +
> +		/* Remove from userptr_invalidate_list_lock must inside mmap write lock, cause:
> +		 * after remove from list, the work_item.op may be changed by other thread
> +		 * like MMU notifier invalidate callback, and maybe add the userptr to work
> +		 * list again.
> +		 * What will cause use after free or double free bug.
> +		 * So need use mmap_write_lock to prevent the invalidate callback triggering then
> +		 * remove the from work list to snsure one work item only be handled once.
> +		 */
> +		spin_lock(&vfpriv->userptr_invalidate_list_lock);
> +		list_del_init(&userptr->work_list);
> +		spin_unlock(&vfpriv->userptr_invalidate_list_lock);
> +
> +		mutex_lock(&vfpriv->userptrs_tree_lock);
> +
> +		virtio_gpu_userptr_handle_list_work(userptr);
> +
> +		mutex_unlock(&vfpriv->userptrs_tree_lock);
> +		mmap_write_unlock(mm);
> +
> +		spin_lock(&vfpriv->userptr_invalidate_list_lock);
> +	}
> +	spin_unlock(&vfpriv->userptr_invalidate_list_lock);
> +}
> +
> +void virtio_gpu_userptr_list_work_init(struct virtio_gpu_fpriv *vfpriv)
> +{
> +	INIT_WORK(&vfpriv->userptr_invalidate_work,
> +		  virtio_gpu_userptr_invalidate_work);
> +	INIT_LIST_HEAD(&vfpriv->userptr_invalidate_list);
> +	spin_lock_init(&vfpriv->userptr_invalidate_list_lock);
> +}
> +
> +static void
> +virtio_gpu_userptr_schedule_list_work(struct virtio_gpu_fpriv *vfpriv)
> +{
> +	spin_lock(&vfpriv->userptr_invalidate_list_lock);
> +	if (!list_empty(&vfpriv->userptr_invalidate_list))
> +		schedule_work(&vfpriv->userptr_invalidate_work);
> +	spin_unlock(&vfpriv->userptr_invalidate_list_lock);
> +}
> +
> +static void virtio_gpu_object_userptr_remove_within_range(
> +	struct virtio_gpu_fpriv *vfpriv, u_int64_t start, u_int64_t last,
> +	bool check_start, const char *from)
> +{
> +	struct interval_tree_node *node;
> +	struct virtio_gpu_object_userptr *userptr = NULL;
> +	uint64_t remove_userptr_size = last - start + 1UL;
> +	uint64_t userptr_size;
> +
> +	mutex_lock(&vfpriv->userptrs_tree_lock);
> +
> +	node = interval_tree_iter_first(&vfpriv->userptrs_tree, start, last);
> +
> +	while (node) {
> +		struct interval_tree_node *next;
> +
> +		userptr = container_of(node, struct virtio_gpu_object_userptr,
> +				       it_node);
> +
> +		userptr_size =
> +			userptr->userptr_last - userptr->userptr_start + 1UL;
> +		if (userptr->userptr_start >= start &&
> +		    userptr->userptr_last < last) {
> +			if ((!check_start) ||
> +			    (check_start && userptr->userptr_start == start)) {
> +				if (atomic_xchg(&userptr->in_release, 1) == 0 &&
> +				    !userptr->op) {
> +					userptr->mm = current->mm;
> +					virtio_gpu_userptr_add_list_work(
> +						userptr, USERPTR_OP_UNMAP);
> +				}
> +			}
> +		}
> +
> +		next = interval_tree_iter_next(node, start, last);
> +		node = next;
> +	}
> +	mutex_unlock(&vfpriv->userptrs_tree_lock);
> +
> +	virtio_gpu_userptr_schedule_list_work(userptr->file->driver_priv);
> +}
> +
> +static bool
> +virtio_gpu_userptr_invalidate(struct mmu_interval_notifier *mn,
> +			      const struct mmu_notifier_range *range,
> +			      unsigned long cur_seq)
> +{
> +	struct virtio_gpu_object_userptr *userptr;
> +	struct virtio_gpu_fpriv *vfpriv;
> +	unsigned long start;
> +	unsigned long last;
> +
> +	if (range->event == MMU_NOTIFY_RELEASE)
> +		return true;
> +	if (!mmget_not_zero(mn->mm))
> +		return true;
> +
> +	start = mn->interval_tree.start;
> +	last = mn->interval_tree.last;
> +	start = (max(start, range->start) >> PAGE_SHIFT) << PAGE_SHIFT;
> +	last = (min(last, range->end - 1UL) >> PAGE_SHIFT) << PAGE_SHIFT;
> +
> +	userptr = container_of(mn, struct virtio_gpu_object_userptr, notifier);
> +	userptr->mm = mn->mm;
> +	vfpriv = userptr->file->driver_priv;
> +
> +	mutex_lock(&userptr->lock);
> +	mmu_interval_set_seq(mn, cur_seq);
> +
> +	pr_debug(
> +		"userptr: [%llx-%llx]-%llx notifier: [%lx-%lx]-%lx check: [%lx-%lx]-%lx resid: %d event: %d\n",
> +		userptr->userptr_start, userptr->userptr_last,
> +		userptr->userptr_last - userptr->userptr_start + 1UL,
> +		range->start, range->end - 1UL, range->end - range->start,
> +		start, last, last - start + (1UL << PAGE_SHIFT),
> +		userptr->base.hw_res_handle, range->event);
> +
> +	if (userptr->op == USERPTR_OP_UNMAP) {
> +		pr_debug(
> +			"userptr: [%llx-%llx] resid: %d already in unmap op: %d\n",
> +			userptr->userptr_start, userptr->userptr_last,
> +			userptr->base.hw_res_handle, userptr->op);
> +	} else {
> +		switch (range->event) {
> +		case MMU_NOTIFY_UNMAP:
> +			virtio_gpu_update_or_remove_userptr(
> +				userptr, start,
> +				last + (1UL << PAGE_SHIFT) - 1UL);
> +			break;
> +		default:
> +			userptr->notifier_start = start;
> +			userptr->notifier_last = last;
> +			virtio_gpu_userptr_add_list_work(userptr,
> +							 USERPTR_OP_EVICT);
> +			break;
> +		}
> +	}
> +
> +	virtio_gpu_userptr_schedule_list_work(userptr->file->driver_priv);
> +
> +	mutex_unlock(&userptr->lock);
> +	mmput(mn->mm);
> +	return true;
> +}
> +
> +static void
> +virtio_gpu_userptr_lock_and_flush_work(struct virtio_gpu_fpriv *vfpriv,
> +				       struct mm_struct *mm)
> +{
> +retry_flush_work:
> +	flush_work(&vfpriv->userptr_invalidate_work);
> +
> +	if (list_empty(&vfpriv->userptr_invalidate_list))
> +		return;
> +
> +	goto retry_flush_work;
> +}
> +
> +void virtio_gpu_userptr_set_handle(struct virtio_gpu_object *qobj,
> +				   uint32_t handle)
> +{
> +	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(qobj);
> +
> +	userptr->bo_handle = handle;
> +	virtio_gpu_object_userptr_remove_within_range(
> +		userptr->file->driver_priv, userptr->userptr_start,
> +		userptr->userptr_last, false, __func__);
> +	virtio_gpu_userptr_add_notifier(userptr, userptr->userptr_start,
> +					userptr->npages << PAGE_SHIFT);
> +}
> +
> +static int virtio_gpu_userptr_init(struct drm_device *dev,
> +				   struct drm_file *file,
> +				   struct drm_gem_object *obj,
> +				   struct virtio_gpu_object_params *params,
> +				   unsigned long **p_pfns, uint32_t *p_npfns)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
> +	unsigned long page_offset;
> +	unsigned long aligned_size;
> +	struct page **pages;
> +	unsigned int pinned = 0;
> +	uint64_t aligned_addr;
> +	int ret;
> +
> +	page_offset = (uint64_t)params->blob_userptr & (PAGE_SIZE - 1UL);
> +	aligned_addr = params->blob_userptr - page_offset;
> +	aligned_size = roundup(page_offset + params->size, PAGE_SIZE);
> +
> +	pr_debug(
> +		"create userptr addr: %llx size: %lx, aligned: [%llx-%llx]-%lx\n",
> +		params->blob_userptr, params->size, aligned_addr,
> +		aligned_addr + aligned_size - 1UL, aligned_size);
> +
> +	params->size = aligned_size;
> +
> +	drm_gem_private_object_init(dev, obj, aligned_size);
> +
> +	*p_npfns = aligned_size / PAGE_SIZE;
> +	*p_pfns = vmalloc(*p_npfns * sizeof(unsigned long));
> +	if (!(*p_pfns)) {
> +		pr_err("failed to allocate userptr pfns\n");
> +		return -ENOMEM;
> +	}
> +
> +	pages = vmalloc(*p_npfns * sizeof(struct page *));
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	userptr->userptr_inital_start = aligned_addr;
> +	userptr->userptr_start = aligned_addr;
> +	userptr->userptr_last = userptr->userptr_start + aligned_size - 1UL;
> +
> +	do {
> +		unsigned int num_pages = *p_npfns - pinned;
> +		uint64_t ptr = userptr->userptr_start + pinned * PAGE_SIZE;
> +		struct page **pinned_pages = pages + pinned;
> +
> +		ret = pin_user_pages_fast(
> +			ptr, num_pages, FOLL_WRITE | FOLL_FORCE, pinned_pages);
> +
> +		if (ret < 0) {
> +			pr_err("pin memory failed, addr: 0x%llx\n",
> +			       userptr->userptr_start);
> +			if (pinned && pages)
> +				unpin_user_pages(pages, pinned);
> +			userptr->userptr_start = 0;
> +			vfree(pages);
> +			vfree(*p_pfns);
> +			return -ENOMEM;
> +		}
> +
> +		pinned += ret;
> +
> +	} while (pinned < *p_npfns);
> +
> +	userptr->pages = pages;
> +	userptr->npages = *p_npfns;
> +	bo->base.base.size = aligned_size;
> +
> +	for (int i = 0; i < (*p_npfns); i++)
> +		(*p_pfns)[i] = page_to_pfn(pages[i]);
> +
> +	atomic_set(&userptr->in_release, 0);
> +	INIT_LIST_HEAD(&userptr->work_list);
> +	mutex_init(&userptr->lock);
> +	userptr->vgdev = dev->dev_private;
> +	userptr->file = file;
> +
> +	return 0;
> +}
> +
> +int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
> +			      struct drm_file *file,
> +			      struct virtio_gpu_object_params *params,
> +			      struct virtio_gpu_object **bo_ptr)
> +{
> +	struct mm_struct *mm = current->mm;
> +	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> +	struct drm_gem_object *obj;
> +	struct virtio_gpu_object_userptr *userptr;
> +	int ret;
> +	unsigned long *pfns;
> +	uint32_t npfns;
> +
> +	virtio_gpu_userptr_lock_and_flush_work(vfpriv, mm);
> +
> +	mutex_lock(&vfpriv->userptrs_tree_lock);
> +	userptr = virtio_gpu_userptr_from_addr_range(
> +		vfpriv, params->blob_userptr,
> +		params->blob_userptr + params->size - 1UL);
> +	if (userptr) {
> +		*bo_ptr = &userptr->base;
> +		mutex_unlock(&vfpriv->userptrs_tree_lock);
> +		return USERPTR_EXISTS;
> +	}
> +
> +	userptr = kzalloc(sizeof(*userptr), GFP_KERNEL);
> +	if (!userptr)
> +		return -ENOMEM;
> +
> +	obj = &userptr->base.base.base;
> +	obj->funcs = &virtio_gpu_userptr_funcs;
> +
> +	ret = virtio_gpu_userptr_init(vgdev->ddev, file, obj, params, &pfns,
> +				      &npfns);
> +	if (ret)
> +		goto failed_free;
> +
> +	ret = virtio_gpu_resource_id_get(vgdev, &userptr->base.hw_res_handle);
> +	if (ret)
> +		goto failed_free;
> +
> +	virtio_gpu_userptr_add_interval_tree(vfpriv, userptr);
> +	/* virtio_gpu_userptr_dump(vfpriv); */
> +
> +	mutex_unlock(&vfpriv->userptrs_tree_lock);
> +
> +	virtio_gpu_cmd_resource_create_userptr(vgdev, &userptr->base, params,
> +					       pfns, npfns);
> +
> +	*bo_ptr = &userptr->base;
> +	return 0;
> +
> +failed_free:
> +	mutex_unlock(&vfpriv->userptrs_tree_lock);
> +	kfree(userptr);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 29d462b69bad..2699b85829f4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1270,6 +1270,35 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
>  	bo->created = true;
>  }
>  
> +void
> +virtio_gpu_cmd_resource_create_userptr(struct virtio_gpu_device *vgdev,
> +				    struct virtio_gpu_object *bo,
> +				    struct virtio_gpu_object_params *params,
> +				    unsigned long *pfns,
> +				    uint32_t npfns)
> +{
> +	struct virtio_gpu_resource_create_blob *cmd_p;
> +	struct virtio_gpu_vbuffer *vbuf;
> +
> +	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> +	memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB);
> +	cmd_p->hdr.ctx_id = cpu_to_le32(params->ctx_id);
> +	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +	cmd_p->blob_mem = cpu_to_le32(params->blob_mem);
> +	cmd_p->blob_flags = cpu_to_le32(params->blob_flags);
> +	cmd_p->blob_id = cpu_to_le64(params->blob_id);
> +	cmd_p->size = cpu_to_le64(params->size);
> +	cmd_p->nr_entries = cpu_to_le32(npfns);
> +
> +	vbuf->data_buf = pfns;
> +	vbuf->data_size = sizeof(*pfns) * npfns;
> +
> +	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +	bo->created = true;
> +}
> +
>  void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
>  				     uint32_t scanout_id,
>  				     struct virtio_gpu_object *bo,
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
