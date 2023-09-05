Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24047920A5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E8E10E43D;
	Tue,  5 Sep 2023 07:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FF310E43D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:05:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 77E506607186;
 Tue,  5 Sep 2023 08:05:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693897558;
 bh=2YUztyW9M6rQr9J4K6U63vwBbNxhutlD8ptQ+5eMLlQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V5J7YfuPCThDJuLa2mb6hTgCWXrqfG+L7WBbCL/8i2ybdlN+XyLyjshQSBCA3rPZN
 IyhtydrRaVCdeab35bVCibtDXhuRKzndmDcbBQuykmVXjbgVE6GCtyAfYb5Lg5yF4h
 UE1u+/Cz+CrSr2cOlxOLneGDt6Mu3WlQDRDI+Od/yYPGDBhJAQMfm5QzF5PHG3hr0u
 i+94vNARASrLHnAuONZFSts0VtwoZKZQu4xmkATYkNy3tquFwOAbeLN5rYUfB1kecK
 lw1ExnQmWMY92MR8ModEMJvX9fTaDhpCD+VxYw799HHLezEHFgO439d3K3bpJoynme
 T3wqTvMh1Qvxg==
Date: Tue, 5 Sep 2023 09:05:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 07/20] drm/shmem-helper: Make all exported symbols GPL
Message-ID: <20230905090555.117da7f5@collabora.com>
In-Reply-To: <20230903170736.513347-8-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-8-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  3 Sep 2023 20:07:23 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Make all drm-shmem exported symbols GPL to make them consistent with
> the rest of drm-shmem symbols.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 848435e08eb2..5c777adf1bcb 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -228,7 +228,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>  			  shmem->pages_mark_accessed_on_put);
>  	shmem->pages = NULL;
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_put_pages);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
>  
>  static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
> @@ -273,7 +273,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_pin);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_pin);
>  
>  /**
>   * drm_gem_shmem_unpin - Unpin backing pages for a shmem GEM object
> @@ -292,7 +292,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>  	drm_gem_shmem_unpin_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_unpin);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>  
>  /*
>   * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
> @@ -362,7 +362,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_vmap);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap);
>  
>  /*
>   * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
> @@ -398,7 +398,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>  
>  	shmem->vaddr = NULL;
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_vunmap);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap);
>  
>  static int
>  drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
> @@ -437,7 +437,7 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
>  
>  	return (madv >= 0);
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_madvise);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
>  
>  void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
>  {
> @@ -469,7 +469,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
>  
>  	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_purge);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
>  
>  /**
>   * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
> @@ -644,7 +644,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
>  	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_print_info);
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
>  
>  /**
>   * drm_gem_shmem_get_sg_table - Provide a scatter/gather table of pinned

