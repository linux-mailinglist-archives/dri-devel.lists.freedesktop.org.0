Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF4294655
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 03:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F486E846;
	Wed, 21 Oct 2020 01:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91D56E846
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:41:39 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8f91750001>; Tue, 20 Oct 2020 18:40:05 -0700
Received: from [10.2.55.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 01:41:31 +0000
Subject: Re: [PATCH v5 0/5] RDMA: Add dma-buf support
To: Jianxin Xiong <jianxin.xiong@intel.com>, <linux-rdma@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <1602799340-138152-1-git-send-email-jianxin.xiong@intel.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <6233a35f-7035-dc96-5680-c3b5bf0b5962@nvidia.com>
Date: Tue, 20 Oct 2020 18:41:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602799340-138152-1-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603244405; bh=xJeKfWUVfSc7cmlepBvkQ3sWdkqBPukGJgP/nLwW7SI=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=mVr+NEirRj+RHKaSYGgLEx+dbvUxoIjPsEwS8o9uZlUckirZ0nfN5YREwP1cuXxnn
 xV08xurGhYSGR/DGZ+Tx7ziaXEPIwimUjy/JnRFznLCilBYWi+nNKja+Lo5r0wDFyn
 9PP9dujyAIifcvYLru0n+1AOyFhhK7u4WoBNaRKZV8QY4ZGUiaN6kqBmZrprsTdZ2i
 TsYMeU9QFtoLjJxye65MVstIH2tzONey2Dc5Hq+IqixYSBqvWQlKmPyZa9RD+HhkCH
 O+4uuUc4UOhkq0F+q2SeTukZ9rf+Zu4m0TeI9aTlKzHnafy4O5kix5Tcttj83ESSg9
 owjzqtI01Q10A==
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
Cc: Leon
 Romanovsky <leon@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/15/20 3:02 PM, Jianxin Xiong wrote:
> This is the fifth version of the patch set. Changelog:
> 

Hi,

A minor point, but if you can tweak your email sending setup, it would be nice.
Specifically, make follow-up patches a reply to the first item. That's a list
convention, and git format-patch + git send-email *.patch is normally sufficient to
make that happen, unless you override it by doing something like sending each
patch separately...which is my first suspicion as to how this happened.

These patches are difficult to link to, because they don't follow the convention
of patches 1-5 being in-reply-to patch 0. So if we want to ask people outside
of this list to take a peek (I was about to), we have to go collect 5 or 6
different lore.kernel.org URLs, one for each patch...

Take a look on lore and you can see the problem. Here's patch 0, and there is
no way from there to find the remaining patches:

    https://lore.kernel.org/dri-devel/1602799340-138152-1-git-send-email-jianxin.xiong@intel.com/


thanks,
-- 
John Hubbard
NVIDIA

> v5:
> * Fix a few warnings reported by kernel test robot:
>      - no previous prototype for function 'ib_umem_dmabuf_release'
>      - no previous prototype for function 'ib_umem_dmabuf_map_pages'
>      - comparison of distinct pointer types in 'check_add_overflow'
> * Add comment for the wait between getting the dma-buf sg tagle and
>    updating the NIC page table
> 
> v4: https://www.spinics.net/lists/linux-rdma/msg96767.html
> * Add a new ib_device method reg_user_mr_dmabuf() instead of expanding
>    the existing method reg_user_mr()
> * Use a separate code flow for dma-buf instead of adding special cases
>    to the ODP memory region code path
> * In invalidation callback, new mapping is updated as whole using work
>    queue instead of being updated in page granularity in the page fault
>    handler
> * Use dma_resv_get_excl() and dma_fence_wait() to ensure the content of
>    the pages have been moved to the new location before the new mapping
>    is programmed into the NIC
> * Add code to the ODP page fault handler to check the mapping status
> * The new access flag added in v3 is removed.
> * The checking for on-demand paging support in the new uverbs command
>    is removed because it is implied by implementing the new ib_device
>    method
> * Clarify that dma-buf sg lists are page aligned
> 
> v3: https://www.spinics.net/lists/linux-rdma/msg96330.html
> * Use dma_buf_dynamic_attach() instead of dma_buf_attach()
> * Use on-demand paging mechanism to avoid pinning the GPU memory
> * Instead of adding a new parameter to the device method for memory
>    registration, pass all the attributes including the file descriptor
>    as a structure
> * Define a new access flag for dma-buf based memory region
> * Check for on-demand paging support in the new uverbs command
> 
> v2: https://www.spinics.net/lists/linux-rdma/msg93643.html
> * The Kconfig option is removed. There is no dependence issue since
>    dma-buf driver is always enabled.
> * The declaration of new data structure and functions is reorganized to
>    minimize the visibility of the changes.
> * The new uverbs command now goes through ioctl() instead of write().
> * The rereg functionality is removed.
> * Instead of adding new device method for dma-buf specific registration,
>    existing method is extended to accept an extra parameter.
> * The correct function is now used for address range checking.
> 
> v1: https://www.spinics.net/lists/linux-rdma/msg90720.html
> * The initial patch set
> * Implement core functions for importing and mapping dma-buf
> * Use dma-buf static attach interface
> * Add two ib_device methods reg_user_mr_fd() and rereg_user_mr_fd()
> * Add two uverbs commands via the write() interface
> * Add Kconfig option
> * Add dma-buf support to mlx5 device
> 
> When enabled, an RDMA capable NIC can perform peer-to-peer transactions
> over PCIe to access the local memory located on another device. This can
> often lead to better performance than using a system memory buffer for
> RDMA and copying data between the buffer and device memory.
> 
> Current kernel RDMA stack uses get_user_pages() to pin the physical
> pages backing the user buffer and uses dma_map_sg_attrs() to get the
> dma addresses for memory access. This usually doesn't work for peer
> device memory due to the lack of associated page structures.
> 
> Several mechanisms exist today to facilitate device memory access.
> 
> ZONE_DEVICE is a new zone for device memory in the memory management
> subsystem. It allows pages from device memory being described with
> specialized page structures, but what can be done with these page
> structures may be different from system memory. ZONE_DEVICE is further
> specialized into multiple memory types, such as one type for PCI
> p2pmem/p2pdma and one type for HMM.
> 
> PCI p2pmem/p2pdma uses ZONE_DEVICE to represent device memory residing
> in a PCI BAR and provides a set of calls to publish, discover, allocate,
> and map such memory for peer-to-peer transactions. One feature of the
> API is that the buffer is allocated by the side that does the DMA
> transfer. This works well with the storage usage case, but is awkward
> with GPU-NIC communication, where typically the buffer is allocated by
> the GPU driver rather than the NIC driver.
> 
> Heterogeneous Memory Management (HMM) utilizes mmu_interval_notifier
> and ZONE_DEVICE to support shared virtual address space and page
> migration between system memory and device memory. HMM doesn't support
> pinning device memory because pages located on device must be able to
> migrate to system memory when accessed by CPU. Peer-to-peer access
> is currently not supported by HMM.
> 
> Dma-buf is a standard mechanism for sharing buffers among different
> device drivers. The buffer to be shared is exported by the owning
> driver and imported by the driver that wants to use it. The exporter
> provides a set of ops that the importer can call to pin and map the
> buffer. In addition, a file descriptor can be associated with a dma-
> buf object as the handle that can be passed to user space.
> 
> This patch series adds dma-buf importer role to the RDMA driver in
> attempt to support RDMA using device memory such as GPU VRAM. Dma-buf is
> chosen for a few reasons: first, the API is relatively simple and allows
> a lot of flexibility in implementing the buffer manipulation ops.
> Second, it doesn't require page structure. Third, dma-buf is already
> supported in many GPU drivers. However, we are aware that existing GPU
> drivers don't allow pinning device memory via the dma-buf interface.
> Pinning would simply cause the backing storage to migrate to system RAM.
> True peer-to-peer access is only possible using dynamic attach, which
> requires on-demand paging support from the NIC to work. For this reason,
> this series only works with ODP capable NICs.
> 
> This series consists of five patches. The first patch adds the common
> code for importing dma-buf from a file descriptor and mapping the
> dma-buf pages. Patch 2 add the new driver method reg_user_mr_dmabuf().
> Patch 3 adds a new uverbs command for registering dma-buf based memory
> region. Patch 4 adds dma-buf support to the mlx5 driver. Patch 5 adds
> clarification to the dma-buf API documentation that dma-buf sg lists
> are page aligned.
> 
> Related user space RDMA library changes will be provided as a separate
> patch series.
> 
> Jianxin Xiong (5):
>    RDMA/umem: Support importing dma-buf as user memory region
>    RDMA/core: Add device method for registering dma-buf base memory
>      region
>    RDMA/uverbs: Add uverbs command for dma-buf based MR registration
>    RDMA/mlx5: Support dma-buf based userspace memory region
>    dma-buf: Clarify that dma-buf sg lists are page aligned
> 
>   drivers/dma-buf/dma-buf.c                     |  21 +++
>   drivers/infiniband/core/Makefile              |   2 +-
>   drivers/infiniband/core/device.c              |   1 +
>   drivers/infiniband/core/umem.c                |   4 +
>   drivers/infiniband/core/umem_dmabuf.c         | 206 ++++++++++++++++++++++++++
>   drivers/infiniband/core/umem_dmabuf.h         |  11 ++
>   drivers/infiniband/core/uverbs_std_types_mr.c | 112 ++++++++++++++
>   drivers/infiniband/hw/mlx5/main.c             |   2 +
>   drivers/infiniband/hw/mlx5/mlx5_ib.h          |   5 +
>   drivers/infiniband/hw/mlx5/mr.c               | 119 +++++++++++++++
>   drivers/infiniband/hw/mlx5/odp.c              |  42 ++++++
>   include/linux/dma-buf.h                       |   3 +-
>   include/rdma/ib_umem.h                        |  32 +++-
>   include/rdma/ib_verbs.h                       |   6 +-
>   include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++
>   15 files changed, 576 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/infiniband/core/umem_dmabuf.c
>   create mode 100644 drivers/infiniband/core/umem_dmabuf.h
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
