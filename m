Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF16CB0998
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 17:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417A010E629;
	Tue,  9 Dec 2025 16:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oPyJe9Jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC08410E629
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765298270;
 bh=NzufaIjgtXwHtuTuBxe+5qie4zROkzrwThHUuDdu8GM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oPyJe9JzNF0mbrHZ0GaODcKtbVtL7pzgAAdpQrNrG7pf1h/6jZ0YIY+esRzCDa5Fe
 ORkG6l0Nxlo2YD4ZH8gEG1DzLSO/m1v4SKlHRASwKr8CcnAOlK6D+xxLplRDSWQEWq
 dFHKs7K8av/WH5TJsc+VSMZ3VZewc2HwKRyh9wbHhB2PL6Tkq0QojbhRsfh/5NGzO8
 vH7U/ra89vWg/t9Xdpd0+vansxjeO/UVc6D7QGW0V+rhL+RRRM3yNxRP5vWXNevY6b
 i9si+wYO8+VxMGya9k24Ed8+VIQYz+EL/vgQvKeojGE2Z08SfvOYY1VpkV/6aJo1gj
 Ka+rpogKBlS3w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1500D17E1292;
 Tue,  9 Dec 2025 17:37:50 +0100 (CET)
Date: Tue, 9 Dec 2025 17:37:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [drm-misc:drm-misc-next 4/11]
 drivers/gpu/drm/drm_gem.c:1261:10: error: call to undeclared function
 'mm_get_unmapped_area'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20251209173746.38931a89@fedora>
In-Reply-To: <202512092338.ylY8zET6-lkp@intel.com>
References: <202512092338.ylY8zET6-lkp@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Tue, 9 Dec 2025 23:58:10 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
> head:   0823bd894278e4c0f1acb8f3a8a3c67745e6d1f6
> commit: 99bda20d6d4cac30ed6d357658d8bc328c3b27d9 [4/11] drm/gem: Introduce drm_gem_get_unmapped_area() fop
> config: arm-randconfig-003-20251209 (https://download.01.org/0day-ci/archive/20251209/202512092338.ylY8zET6-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512092338.ylY8zET6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512092338.ylY8zET6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/drm_gem.c:1261:10: error: call to undeclared function 'mm_get_unmapped_area'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]  
>     1261 |                 return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
>          |                        ^
>    drivers/gpu/drm/drm_gem.c:1261:10: note: did you mean '__get_unmapped_area'?
>    include/linux/mm.h:3441:1: note: '__get_unmapped_area' declared here
>     3441 | __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
>          | ^
>    1 error generated.
> 
> 
> vim +/mm_get_unmapped_area +1261 drivers/gpu/drm/drm_gem.c
> 
>   1229	
>   1230	/**
>   1231	 * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
>   1232	 * @filp: DRM file pointer
>   1233	 * @uaddr: User address hint
>   1234	 * @len: Mapping length
>   1235	 * @pgoff: Offset (in pages)
>   1236	 * @flags: Mapping flags
>   1237	 *
>   1238	 * If a driver supports GEM object mapping, before ending up in drm_gem_mmap(),
>   1239	 * mmap calls on the DRM file descriptor will first try to find a free linear
>   1240	 * address space large enough for a mapping. Since GEM objects are backed by
>   1241	 * shmem buffers, this should preferably be handled by the shmem virtual memory
>   1242	 * filesystem which can appropriately align addresses to huge page sizes when
>   1243	 * needed.
>   1244	 *
>   1245	 * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
>   1246	 * contain the fake offset we created) and call shmem_get_unmapped_area() with
>   1247	 * the right file pointer.
>   1248	 *
>   1249	 * If a GEM object is not available at the given offset or if the caller is not
>   1250	 * granted access to it, fall back to mm_get_unmapped_area().
>   1251	 */
>   1252	unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>   1253						unsigned long len, unsigned long pgoff,
>   1254						unsigned long flags)
>   1255	{
>   1256		struct drm_gem_object *obj;
>   1257		unsigned long ret;
>   1258	
>   1259		obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>   1260		if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> > 1261			return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,  
>   1262						    flags);

Hm, smells like a build without CONFIG_MMU=n. I guess we need some
#ifdef CONFIG_MMU around drm_gem_get_unmapped_area() definitions.

>   1263	
>   1264		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>   1265							 flags);
>   1266	
>   1267		drm_gem_object_put(obj);
>   1268	
>   1269		return ret;
>   1270	}
>   1271	EXPORT_SYMBOL_GPL(drm_gem_get_unmapped_area);
>   1272	
> 

