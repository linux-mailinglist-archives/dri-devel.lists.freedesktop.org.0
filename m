Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5869C8833
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48B10E03A;
	Thu, 14 Nov 2024 10:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70C9610E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:58:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA711480
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 02:59:08 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7AC03F6A8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 02:58:38 -0800 (PST)
Date: Thu, 14 Nov 2024 10:58:30 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix a typo in the FW iface flag definitions
Message-ID: <ZzXX1m4o9OAYiIgD@e110455-lin.cambridge.arm.com>
References: <20241113160257.2002333-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241113160257.2002333-1-boris.brezillon@collabora.com>
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

On Wed, Nov 13, 2024 at 05:02:57PM +0100, Boris Brezillon wrote:
> Drop the _RD_ in the flag names.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
> -- 
> 2.46.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
