Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70677C9C5F2
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C2A10E68D;
	Tue,  2 Dec 2025 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oCby9haV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B227810E696;
 Tue,  2 Dec 2025 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UyCbUcL1nm1MZzDeCwaTG3zHrny4GdzBK6n/2gvUbXQ=; b=oCby9haVuYdOrAIteZZoLwWkPu
 sVdsFQ//4adybW7oMm9kFJboF2Ed5gLUvpgNJeyfT6dBuHGoWMHO1Mhf2DFoaJTMSuH/A2LVghfoL
 HZzgX9yQPT4Weo65SlpJIWdO8XsR3Tfqq/NMlQofpliTvfwCD7kh9HYuaVROCYhk2q1PVXeHE30Vz
 t96mk3OxHne0/rWxVJ/174Yr/P9JJZOczGShKJYOSgSxAnW9vJKMH0Y+pUH2RvHsWc3Xnosbbcc9P
 W881kVQnLSY6Exd/GHsd2LeUq6HmZ8iFF6GwfbXBuWhkPT9NGD/+/YZIZfVeSr9uEXrbW0Hlz81w2
 sp0agC2Q==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.21.125])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQU20-007tsJ-AQ; Tue, 02 Dec 2025 18:19:16 +0100
Message-ID: <489a6590-7d1a-46f9-a980-5c30b2b44c4c@igalia.com>
Date: Tue, 2 Dec 2025 14:19:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/10] Documentation/gpu/drm-mm: Add THP paragraph to
 GEM mapping section
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251202101720.3129-1-loic.molinari@collabora.com>
 <20251202101720.3129-11-loic.molinari@collabora.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20251202101720.3129-11-loic.molinari@collabora.com>
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

Hi Loïc,

On 12/2/25 07:17, Loïc Molinari wrote:
> Add a paragraph to the GEM Objects Creation section about the
> drm_gem_huge_mnt_create() helper and to the GEM objects mapping
> section explaining how transparent huge pages are handled by GEM.
> 
> v4:
> - fix wording after huge_pages handler removal
> 
> v6:
> - fix wording after map_pages handler removal
> 
> v11:
> - mention drm_gem_huge_mnt_create() helper
> - add Boris and Maíra R-bs
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>

Just confirming my R-b:

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   Documentation/gpu/drm-mm.rst | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..f22433470c76 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -155,7 +155,12 @@ drm_gem_object_init() will create an shmfs file of the
>   requested size and store it into the struct :c:type:`struct
>   drm_gem_object <drm_gem_object>` filp field. The memory is
>   used as either main storage for the object when the graphics hardware
> -uses system memory directly or as a backing store otherwise.
> +uses system memory directly or as a backing store otherwise. Drivers
> +can call drm_gem_huge_mnt_create() to create, mount and use a huge
> +shmem mountpoint instead of the default one ('shm_mnt'). For builds
> +with CONFIG_TRANSPARENT_HUGEPAGE enabled, further calls to
> +drm_gem_object_init() will let shmem allocate huge pages when
> +possible.
>   
>   Drivers are responsible for the actual physical pages allocation by
>   calling shmem_read_mapping_page_gfp() for each page.
> @@ -290,15 +295,27 @@ The open and close operations must update the GEM object reference
>   count. Drivers can use the drm_gem_vm_open() and drm_gem_vm_close() helper
>   functions directly as open and close handlers.
>   
> -The fault operation handler is responsible for mapping individual pages
> -to userspace when a page fault occurs. Depending on the memory
> -allocation scheme, drivers can allocate pages at fault time, or can
> -decide to allocate memory for the GEM object at the time the object is
> -created.
> +The fault operation handler is responsible for mapping pages to
> +userspace when a page fault occurs. Depending on the memory allocation
> +scheme, drivers can allocate pages at fault time, or can decide to
> +allocate memory for the GEM object at the time the object is created.
>   
>   Drivers that want to map the GEM object upfront instead of handling page
>   faults can implement their own mmap file operation handler.
>   
> +In order to reduce page table overhead, if the internal shmem mountpoint
> +"shm_mnt" is configured to use transparent huge pages (for builds with
> +CONFIG_TRANSPARENT_HUGEPAGE enabled) and if the shmem backing store
> +managed to allocate a huge page for a faulty address, the fault handler
> +will first attempt to insert that huge page into the VMA before falling
> +back to individual page insertion. mmap() user address alignment for GEM
> +objects is handled by providing a custom get_unmapped_area file
> +operation which forwards to the shmem backing store. For most drivers,
> +which don't create a huge mountpoint by default or through a module
> +parameter, transparent huge pages can be enabled by either setting the
> +"transparent_hugepage_shmem" kernel parameter or the
> +"/sys/kernel/mm/transparent_hugepage/shmem_enabled" sysfs knob.
> +
>   For platforms without MMU the GEM core provides a helper method
>   drm_gem_dma_get_unmapped_area(). The mmap() routines will call this to get a
>   proposed address for the mapping.

