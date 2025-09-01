Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D8DB3DC4A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF8410E07E;
	Mon,  1 Sep 2025 08:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IBUiRqAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31F10E07E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756715095; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Zg2c0obA1UnwfOqyHGRxSYCgX+d6Xva8Nc7ImycqM6qrN+AOTHYmKVimduvCkA16QN80vNVvujOKmEGHHDK6Z45gNMOSZPt9x8vKYutdNApaJ/9oKVm2oW/TODBftMs6c404Wnxnt1GY+qK4kFNZF+GIuaJ+SVM4gbr5k9cs754=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756715095;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ENxmtp4/0M35AV+LAqoPB243G7NajpAOcJ3hJQ1hxMY=; 
 b=IpcVyTsC6YVEEw/qJoE0p/4N53yWIJG+WlcGldl4NL2i52HISqvS6/tkCrbcnTj4OYxg6N/scO7yMGicvgkWRpwaP7/PqGZ648nyoS4JBZ5A/QecjcKCboNUDuBo5tDcpPL/A6lsJRlYVuVpsBn65q95P21w3b+9L322yeoVaSQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756715095; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=ENxmtp4/0M35AV+LAqoPB243G7NajpAOcJ3hJQ1hxMY=;
 b=IBUiRqADqRSOMp3Ez2L+Z47co+Jemfp5u1Ccog3OTKs1bKRAgfGm8AiOwoPrniLT
 uMpKn+FJ1WGQA+6Mwg59IOI91ktAyvNTFS9wqFHffoKbgKRAxcNbJZWxD27dW+wNqQm
 D7rDk7yFMAnkMbFevSiw9n8JQFncoM2vDQWt0Sok=
Received: by mx.zohomail.com with SMTPS id 1756715093436620.0647613268478;
 Mon, 1 Sep 2025 01:24:53 -0700 (PDT)
Date: Mon, 1 Sep 2025 09:24:50 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 5/7] drm/panfrost: Add flag to map GEM object Write-Back
 Cacheable
Message-ID: <w65vhrxgqbstnv5zbal2djxz6f5hkter26nqfngr7evonbwqcj@tmgvbdjho3f5>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-6-faith.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822142954.902402-6-faith.ekstrand@collabora.com>
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

On 22.08.2025 10:29, Faith Ekstrand wrote:
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 7 +++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 3 +++
>  include/uapi/drm/panfrost_drm.h         | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ea6c509a5d5..ac2a3939f0c1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -116,6 +116,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  	return 0;
>  }
>
> +#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
> +				 PANFROST_BO_HEAP | \
> +				 PANFROST_BO_WB_MMAP)
> +
>  static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  		struct drm_file *file)
>  {
> @@ -125,8 +129,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  	struct panfrost_gem_mapping *mapping;
>  	int ret;
>
> -	if (!args->size || args->pad ||
> -	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
> +	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
>  		return -EINVAL;
>
>  	/* Heaps should never be executable */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index bb73f2a68a12..9a707055d946 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -320,6 +320,9 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
>  	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
>  	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
>
> +	if (flags & PANFROST_BO_WB_MMAP)
> +		bo->base.map_wc = true;
> +

How come in the case of Panthor,

         if (flags & DRM_PANTHOR_BO_WB_MMAP)
              shmem->map_wc = false;

but here, it means we would map the BO WC instead?

>  	return bo;
>  }
>
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index ed67510395bd..e09b6f25acb2 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -90,6 +90,7 @@ struct drm_panfrost_wait_bo {
>  /* Valid flags to pass to drm_panfrost_create_bo */
>  #define PANFROST_BO_NOEXEC	1
>  #define PANFROST_BO_HEAP	2
> +#define PANFROST_BO_WB_MMAP	4
>
>  /**
>   * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
> --
> 2.50.1

Adrian Larumbe
