Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793137A1925
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C1D10E5CE;
	Fri, 15 Sep 2023 08:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FF410E5CE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:47:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D9E7766072F9;
 Fri, 15 Sep 2023 09:47:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694767639;
 bh=Ho9gbyvb2anjmcZLO7p6Vqemv1cpPRcy7ht0972OVtA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IWbq5TXJmWuOTi8qvC4iPxtEdcu43CjCRRLVGisiTzFs65wZeoNOchLMRoSU9mFkn
 vJqHVdHkupLLtP/d/tnlXJf7CbZfKTxxsMBHcrYbPZOgoQoCKA1qxgoruBfpmRef/S
 3gUWRT+bcby2T3gaWBk5SBd0CsECWS5ZNbuEny1HwMD9Yjr1dolWs+PNov4eerhDWs
 bk9Ktek0uZcqTz9DCSbKxUYBnGYkJ6YcjnJKLfMSo8g6W24ETGUa5/+WDz1fOz/6TY
 gvwAkAxkA++9eDomajZ1VCZqDF08WZAcff6JxIks6FKzBoGfJ/WeBQPJ8FtAfVJHJG
 RheoKPt06Ar9w==
Date: Fri, 15 Sep 2023 10:47:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 14/18] drm/shmem-helper: Export
 drm_gem_shmem_get_pages_sgt_locked()
Message-ID: <20230915104716.312d41ad@collabora.com>
In-Reply-To: <20230914232721.408581-15-dmitry.osipenko@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-15-dmitry.osipenko@collabora.com>
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

On Fri, 15 Sep 2023 02:27:17 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Export drm_gem_shmem_get_pages_sgt_locked() that will be used by virtio-gpu
> shrinker during GEM swap-in operation done under the held reservation lock.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
>  include/drm/drm_gem_shmem_helper.h     | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index b1cd56e12f66..1ebdf6b53ce4 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -865,7 +865,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>  
> -static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
> +struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	int ret;
> @@ -903,6 +903,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  	drm_gem_shmem_put_pages_locked(shmem);
>  	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt_locked);
>  
>  /**
>   * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 0bc6e8797162..44c6e14d8e3d 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -147,6 +147,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
>  
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
> +struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem);
>  
>  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);

