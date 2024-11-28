Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53679DB539
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D60910E327;
	Thu, 28 Nov 2024 10:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ecbnR19e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9449310E327
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732788384;
 bh=tfj52IaUJI0RaNandDDl6XOlcpKzFwDgyKd8Oc5kZKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ecbnR19eEtzz2rPEnDkRPCix2h4qcG1dq5k9SoG7snaWoQ6eUsohd+t0DAXUg41Bm
 JcrYl7gDqCvpqwF71C11jVrm+3Chgh8mPZYdZ26e53HBnmpnmQzSueI5idJOUPPffk
 QP0nJuVzHFYS2TErEbVm1YTkzx2Xvy42tbGzjaQIGnAc+wyZTWg6NLanIXpa6lIgOg
 EUoHlNUYSAVNgmCeifO4SJTxpu6hrBfcesgz3sQtqDC53tzUduXi1dT8ZaqdSVP3Md
 9TluqwbJj6sceSg86PNDUtV770F0pgIZkfRvqY0vH5KJDE6bcNvm2Cp5v4kgWUOmgA
 Y3LJIdPv829hw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C5DE817E35DC;
 Thu, 28 Nov 2024 11:06:23 +0100 (CET)
Date: Thu, 28 Nov 2024 11:06:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix a typo in the FW iface flag definitions
Message-ID: <20241128110618.760dfc0f@collabora.com>
In-Reply-To: <20241113160257.2002333-1-boris.brezillon@collabora.com>
References: <20241113160257.2002333-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Nov 2024 17:02:57 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Drop the _RD_ in the flag names.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 62 ++++++++++++++--------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 2060085cc9f3..42052d23dd6a 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -91,26 +91,26 @@ enum panthor_fw_binary_entry_type {
>  #define CSF_FW_BINARY_ENTRY_UPDATE					BIT(30)
>  #define CSF_FW_BINARY_ENTRY_OPTIONAL					BIT(31)
>  
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_RD					BIT(0)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_WR					BIT(1)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_EX					BIT(2)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_NONE			(0 << 3)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED			(1 << 3)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_UNCACHED_COHERENT	(2 << 3)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED_COHERENT		(3 << 3)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK			GENMASK(4, 3)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_PROT				BIT(5)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED				BIT(30)
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO				BIT(31)
> +#define CSF_FW_BINARY_IFACE_ENTRY_RD					BIT(0)
> +#define CSF_FW_BINARY_IFACE_ENTRY_WR					BIT(1)
> +#define CSF_FW_BINARY_IFACE_ENTRY_EX					BIT(2)
> +#define CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_NONE			(0 << 3)
> +#define CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED			(1 << 3)
> +#define CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_UNCACHED_COHERENT		(2 << 3)
> +#define CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED_COHERENT		(3 << 3)
> +#define CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK			GENMASK(4, 3)
> +#define CSF_FW_BINARY_IFACE_ENTRY_PROT					BIT(5)
> +#define CSF_FW_BINARY_IFACE_ENTRY_SHARED				BIT(30)
> +#define CSF_FW_BINARY_IFACE_ENTRY_ZERO					BIT(31)
>  
> -#define CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS			\
> -	(CSF_FW_BINARY_IFACE_ENTRY_RD_RD |				\
> -	 CSF_FW_BINARY_IFACE_ENTRY_RD_WR |				\
> -	 CSF_FW_BINARY_IFACE_ENTRY_RD_EX |				\
> -	 CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK |			\
> -	 CSF_FW_BINARY_IFACE_ENTRY_RD_PROT |				\
> -	 CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED  |				\
> -	 CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO)
> +#define CSF_FW_BINARY_IFACE_ENTRY_SUPPORTED_FLAGS			\
> +	(CSF_FW_BINARY_IFACE_ENTRY_RD |					\
> +	 CSF_FW_BINARY_IFACE_ENTRY_WR |					\
> +	 CSF_FW_BINARY_IFACE_ENTRY_EX |					\
> +	 CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK |			\
> +	 CSF_FW_BINARY_IFACE_ENTRY_PROT |				\
> +	 CSF_FW_BINARY_IFACE_ENTRY_SHARED  |				\
> +	 CSF_FW_BINARY_IFACE_ENTRY_ZERO)
>  
>  /**
>   * struct panthor_fw_binary_section_entry_hdr - Describes a section of FW binary
> @@ -413,7 +413,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
>  	int ret;
>  
>  	if (!section->data.size &&
> -	    !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO))
> +	    !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_ZERO))
>  		return;
>  
>  	ret = panthor_kernel_bo_vmap(section->mem);
> @@ -421,7 +421,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
>  		return;
>  
>  	memcpy(section->mem->kmap, section->data.buf, section->data.size);
> -	if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO) {
> +	if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_ZERO) {
>  		memset(section->mem->kmap + section->data.size, 0,
>  		       panthor_kernel_bo_size(section->mem) - section->data.size);
>  	}
> @@ -535,20 +535,20 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		return -EINVAL;
>  	}
>  
> -	if (hdr.flags & ~CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS) {
> +	if (hdr.flags & ~CSF_FW_BINARY_IFACE_ENTRY_SUPPORTED_FLAGS) {
>  		drm_err(&ptdev->base, "Firmware contains interface with unsupported flags (0x%x)\n",
>  			hdr.flags);
>  		return -EINVAL;
>  	}
>  
> -	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_PROT) {
> +	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) {
>  		drm_warn(&ptdev->base,
>  			 "Firmware protected mode entry not be supported, ignoring");
>  		return 0;
>  	}
>  
>  	if (hdr.va.start == CSF_MCU_SHARED_REGION_START &&
> -	    !(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED)) {
> +	    !(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_SHARED)) {
>  		drm_err(&ptdev->base,
>  			"Interface at 0x%llx must be shared", CSF_MCU_SHARED_REGION_START);
>  		return -EINVAL;
> @@ -587,26 +587,26 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  
>  	section_size = hdr.va.end - hdr.va.start;
>  	if (section_size) {
> -		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK;
> +		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
>  		struct panthor_gem_object *bo;
>  		u32 vm_map_flags = 0;
>  		struct sg_table *sgt;
>  		u64 va = hdr.va.start;
>  
> -		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
> +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
>  			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
>  
> -		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_EX))
> +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_EX))
>  			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
>  
> -		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_*_COHERENT are mapped to
> +		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_*_COHERENT are mapped to
>  		 * non-cacheable for now. We might want to introduce a new
>  		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
>  		 * memory and is currently not used by our driver) for
>  		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
>  		 * of IO-coherent systems.
>  		 */
> -		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
> +		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED)
>  			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
>  
>  		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> @@ -619,7 +619,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		if (drm_WARN_ON(&ptdev->base, section->mem->va_node.start != hdr.va.start))
>  			return -EINVAL;
>  
> -		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED) {
> +		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_SHARED) {
>  			ret = panthor_kernel_bo_vmap(section->mem);
>  			if (ret)
>  				return ret;
> @@ -689,7 +689,7 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>  	list_for_each_entry(section, &ptdev->fw->sections, node) {
>  		struct sg_table *sgt;
>  
> -		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
> +		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
>  			continue;
>  
>  		panthor_fw_init_section_mem(ptdev, section);

