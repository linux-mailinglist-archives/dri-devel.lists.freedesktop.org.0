Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE26AB1201
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 13:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1F210EA19;
	Fri,  9 May 2025 11:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ev8ys5Jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034F10EA19
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746789497; x=1778325497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aiPaYDwSGvN0K0HQK9CDqTSbttoNGl/6tY2Cm6xaBBs=;
 b=Ev8ys5JdSXkIXR/sIsM+qRdcJXGuPuAENrgyT5oDS4eliEYGZOQjNRAt
 NhA2KDIb4KOy1/2VznHv6tvvxlW99oxl6Qj0py7BK6QX66KWPcFN+qwTr
 KXm7TmP6JNRgI/F6eT4wspQu443Hr9nAkuAjdt7QbT72CrsjAtf6yLj1N
 niP930dFxfeopCVMPQgOWQufn0yMcBpcu6B/DJvOStEUfg/gw2gVmCjL8
 er8YdWSbV7INRIUrzMCONjH41LdR+KBFa1XJsHjpMKNwGCy0934nT5+AI
 XVQGUIi+EVm0+wWlXHCvcZfPNJ4EQMzIcpEpnQJhc4GRsuAMrtu68oqhE A==;
X-CSE-ConnectionGUID: D6vKFYHGQ1CfcQLc9hXIOA==
X-CSE-MsgGUID: dpcd6s69TJC2GpaJA7tVZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52422856"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="52422856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:18:11 -0700
X-CSE-ConnectionGUID: IO0YruilQeCpWzu6FzjjTw==
X-CSE-MsgGUID: 19XzKC/dT36Fay078oLWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="136294670"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa009.jf.intel.com with ESMTP; 09 May 2025 04:18:06 -0700
Date: Fri, 9 May 2025 19:12:46 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
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

On Fri, May 09, 2025 at 01:04:58PM +1000, Alexey Kardashevskiy wrote:
> Ping?

Sorry for late reply from vacation.

> Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,

As disscussed in the thread, this kAPI is not well considered but IIUC
the concept of "importer mapping" is still valid. We need more
investigation about all the needs - P2P, CC memory, private bus
channel, and work out a formal API.

However in last few months I'm focusing on high level TIO flow - TSM
framework, IOMMUFD based bind/unbind, so no much progress here and is
still using this temporary kAPI. But as long as "importer mapping" is
alive, the dmabuf fd for KVM is still valid and we could enable TIO
based on that.

> 
> 
> On 29/4/25 17:50, Alexey Kardashevskiy wrote:
> > 
> > 
> > On 29/4/25 16:48, Alexey Kardashevskiy wrote:
> > > On 8/1/25 01:27, Xu Yilun wrote:
> > > > This series is based on an earlier kvm-coco-queue version (v6.12-rc2)
> > > 
> > > Has this been pushed somewhere public? The patchset does not apply on top of v6.12-rc2, for example (I fixed locally).

Sorry, not yet. I'm trying to solve this ... same for the QEMU tree.

> > > Also, is there somewhere a QEMU tree using this? I am trying to use this new DMA_BUF feature and this require quite some not so obvious plumbing. Thanks,
> > 
> > 
> > More to the point, to make it work, QEMU needs to register VFIO MMIO BAR with KVM_SET_USER_MEMORY_REGION2 which passes slot->guest_memfd to KVM which essentially comes from VFIORegion->mmaps[0].mem->ram_block->guest_memfd. But since you disabled mmap for private MMIO, there is no MR which QEMU would even try registering as KVM memslot and there are many ways to fix it. I took a shortcut and reenabled mmap() but wonder what exactly you did. Makes sense? Thanks,

Yes, QEMU needs change. 08/12 "vfio/pci: Create host unaccessible dma-buf for private device“
adds a new flag VFIO_REGION_INFO_FLAG_PRIVATE to indicate user could
create dmabuf on this region.

I'm also not very serious about QEMU changes now, just FYI:

I use VFIO_REGION_INFO_FLAG_PRIVATE flag to revive region->mmaps.

int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
	...

+        if (region->flags & VFIO_REGION_INFO_FLAG_PRIVATE) {
+            region->nr_mmaps = 1;
+            region->mmaps = g_new0(VFIOMmap, region->nr_mmaps);
+            region->mmaps[0].offset = 0;
+            region->mmaps[0].size = region->size;
+            region->mmaps[0].dmabuf_fd = -1;
         }

Then in vfio_region_mmap(), use a new memory_region_init_dmabuf() to populate
the MR.

int vfio_region_mmap(VFIORegion *region)

+        if (use_dmabuf) {
+            /* create vfio dmabuf fd */
+            ret = vfio_create_dmabuf(region->vbasedev, region->nr,
+                                     region->mmaps[i].offset,
+                                     region->mmaps[i].size);
+            if (ret < 0) {
+                goto sub_unmap;
+            }
+
+            region->mmaps[i].dmabuf_fd = ret;
+
+            name = g_strdup_printf("%s dmabuf[%d]",
+                                   memory_region_name(region->mem), i);
+            memory_region_init_dmabuf(&region->mmaps[i].mem,
+                                             memory_region_owner(region->mem),
+                                             name, region->mmaps[i].size,
+                                             region->mmaps[i].dmabuf_fd);
+            g_free(name);
+        } else {

Thanks,
Yilun
