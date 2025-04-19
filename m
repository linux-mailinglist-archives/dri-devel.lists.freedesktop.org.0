Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A2A94099
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 02:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF4510E42C;
	Sat, 19 Apr 2025 00:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="SaoEBfSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DBA10E42C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 00:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745022474; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oJAhbTXoACYteGjHBZB2vy9K4+51sSPUmAX/+wawcppt1A6SU5CfR/S4ss9Iz6Oz8kczyh3ZaHsNSaAFjeu+tGYUR/WEhSk+HFpg2IcjRLGnFMaKfjvJxzG5uPASz+PLeXyJ+/AsJ7aOpD8lChBwjt+c35kMLvq/HQJi/AxPe+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745022474;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RCEg+tiniA1L+1xM0EYi+ZzP+1I/NSumCNkA/KFSiwE=; 
 b=Xsf64jDRDS6NgDciMvyAXfzFQK4phn/d+pl8UUBS+1N8a1ofk9Yq/4D6Bfjzanan57ArQeKA37n9DGYajcfLGY5qySh4sSc9g+Ln9IxafHEdnPWu3v9dffhPnuQGhqvlZ50UgTN3QzC59Wjx3A8QJhUu89IGHpHBJclUTbZ0dG8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745022474; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=RCEg+tiniA1L+1xM0EYi+ZzP+1I/NSumCNkA/KFSiwE=;
 b=SaoEBfSdyW5FGFXamT+bV+O2QlHG8xVr8XPeHPBBGrbXgnNhlze6TkzZ7XZi1va6
 xnda9TNUp4prnmmHCTSldBhcHir6FW+7hHTw5x7c3vbtqCx6UZmfdUlkTugAmFcodD0
 878gj5pc8BOVHUeubS3w6cZFdNtq9pncSkYOBz/c=
Received: by mx.zohomail.com with SMTPS id 1745022472630866.7297232600243;
 Fri, 18 Apr 2025 17:27:52 -0700 (PDT)
Date: Sat, 19 Apr 2025 01:27:49 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3] drm/panthor: Don't create a file offset for NO_MMAP BOs
Message-ID: <fjcougtr3w6yeajbgbxwi4g6ejktqt2ozpg4c72zivtzylomqj@7ep7bnskfue2>
References: <20250417121942.3574111-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417121942.3574111-1-boris.brezillon@collabora.com>
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

On 17.04.2025 14:19, Boris Brezillon wrote:
> Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> have a file offset but can't be mapped anyway, because
> panthor_gem_mmap() will filter them out.
>
> If we error out at mmap_offset creation time, we can get rid of
> panthor_gem_mmap() and call drm_gem_shmem_object_mmap directly, and
> we get rid of this inconsistency of having an mmap offset for a
> BO that can never be mmap-ed.
>
> Changes in v2:
> - Get rid of panthor_gem_mmap()
> - Get rid of the Fixes tag and adjust the commit message accordingly
> - Return ENOPERM instead of EINVAL
>
> Changes in v3:
> - Don't leak the BO ref
> - Add R-bs
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c |  7 +++++++
>  drivers/gpu/drm/panthor/panthor_gem.c | 13 +------------
>  2 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e32073..4d4a52a033f6 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -940,6 +940,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  					struct drm_file *file)
>  {
>  	struct drm_panthor_bo_mmap_offset *args = data;
> +	struct panthor_gem_object *bo;
>  	struct drm_gem_object *obj;
>  	int ret;
>
> @@ -950,6 +951,12 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  	if (!obj)
>  		return -ENOENT;
>
> +	bo = to_panthor_bo(obj);
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP) {
> +		ret = -EPERM;
> +		goto out;
> +	}
> +
>  	ret = drm_gem_create_mmap_offset(obj);
>  	if (ret)
>  		goto out;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index fd014ccc3bfc..22d78cef9c66 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -129,17 +129,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	return ERR_PTR(ret);
>  }
>
> -static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> -{
> -	struct panthor_gem_object *bo = to_panthor_bo(obj);
> -
> -	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
> -	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> -		return -EINVAL;
> -
> -	return drm_gem_shmem_object_mmap(obj, vma);
> -}
> -
>  static struct dma_buf *
>  panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
>  {
> @@ -169,7 +158,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
>  	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
> -	.mmap = panthor_gem_mmap,
> +	.mmap = drm_gem_shmem_object_mmap,
>  	.status = panthor_gem_status,
>  	.export = panthor_gem_prime_export,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
> --
> 2.49.0


Adrian Larumbe
