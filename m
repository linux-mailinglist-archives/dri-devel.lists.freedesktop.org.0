Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK9zMNDOnGlhKgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:04:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0117DF3A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B412110E44D;
	Mon, 23 Feb 2026 22:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BEjUgVYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B88710E314
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:03:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49869600AE;
 Mon, 23 Feb 2026 22:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6270C19421;
 Mon, 23 Feb 2026 22:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771884234;
 bh=VVU2sUGh8t0gjnf+zZg+WfT/cx0o5bOSQjRE4IJooMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BEjUgVYiAWkmQdHLEBr3X+5uW7PDvbvfiEz/S/w8gyKHvjc5X7EZiWEb1sGoqgIdr
 B1w0zEDzTWHWR/pVK2nX/mtPqEM8IKFoQOrETRRnjSmzwd6nUjXzRRJNhKPmv07GrJ
 i48QKmCiBJrAj/9PxNaoZ/wiAnLTYqP58pn03bnzS2J+i119BgJbMjaz2c6w4G90jm
 rba2mz/FHkh60rRXAN4dBthIMJTstckiOhDVYUtnZG7s3Ya+W+xSPkvywW8BGlqYYL
 WltQqAOWUerhnKlaNuvdNXnNtd7Y1971aC7n+JfbnvhRIGzgkqZ2JXK11ogo02l8ek
 Q6/Vlg/z0LWSg==
Date: Mon, 23 Feb 2026 16:03:49 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
Message-ID: <ysqmm2lfy5zfad2wplxihafwktmhldisddgpjqrqwyynhakmsi@deptrcggcptl>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 10A0117DF3A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:54AM +0530, Ekansh Gupta wrote:
> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
> a modern DRM-based accelerator implementation for Qualcomm Hexagon DSPs.
> The driver provides a standardized interface for offloading computational
> tasks to DSPs found on Qualcomm SoCs, supporting all DSP domains (ADSP,
> CDSP, SDSP, GDSP).
> 
> The QDA driver is designed as an alternative for the FastRPC driver
> in drivers/misc/, offering improved resource management, better integration
> with standard kernel subsystems, and alignment with the Linux kernel's
> Compute Accelerators framework.
> 

If I understand correctly, this is just the same FastRPC protocol but
in the accel framework, and hence with a new userspace ABI?

I don't fancy the name "QDA" as an acronym for "FastRPC Accel".

I would much prefer to see this living in drivers/accel/fastrpc and be
named some variation of "fastrpc" (e.g. fastrpc_accel). (Driver name can
be "fastrpc" as the other one apparently is named "qcom,fastrpc").

> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> Key Features
> ============
> 
> * Standard DRM accelerator interface via /dev/accel/accelN
> * GEM-based buffer management with DMA-BUF import/export support
> * IOMMU-based memory isolation using per-process context banks
> * FastRPC protocol implementation for DSP communication
> * RPMsg transport layer for reliable message passing
> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
> * Comprehensive IOCTL interface for DSP operations
> 
> High-Level Architecture Differences with Existing FastRPC Driver
> =================================================================
> 
> The QDA driver represents a significant architectural departure from the
> existing FastRPC driver (drivers/misc/fastrpc.c), addressing several key
> limitations while maintaining protocol compatibility:
> 
> 1. DRM Accelerator Framework Integration
>   - FastRPC: Custom character device (/dev/fastrpc-*)
>   - QDA: Standard DRM accel device (/dev/accel/accelN)
>   - Benefit: Leverages established DRM infrastructure for device
>     management.
> 
> 2. Memory Management
>   - FastRPC: Custom memory allocator with ION/DMA-BUF integration
>   - QDA: Native GEM objects with full PRIME support
>   - Benefit: Seamless buffer sharing using standard DRM mechanisms
> 
> 3. IOMMU Context Bank Management
>   - FastRPC: Direct IOMMU domain manipulation, limited isolation
>   - QDA: Custom compute bus (qda_cb_bus_type) with proper device model
>   - Benefit: Each CB device is a proper struct device with IOMMU group
>     support, enabling better isolation and resource tracking.
>   - https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
> 
> 4. Memory Manager Architecture
>   - FastRPC: Monolithic allocator
>   - QDA: Pluggable memory manager with backend abstraction
>   - Benefit: Currently uses DMA-coherent backend, easily extensible for
>     future memory types (e.g., carveout, CMA)
> 
> 5. Transport Layer
>   - FastRPC: Direct RPMsg integration in core driver
>   - QDA: Abstracted transport layer (qda_rpmsg.c)
>   - Benefit: Clean separation of concerns, easier to add alternative
>     transports if needed
> 
> 8. Code Organization
>   - FastRPC: ~3000 lines in single file
>   - QDA: Modular design across multiple files (~4600 lines total)

"Now 50% more LOC and you need 6 tabs open in your IDE!"

Might be better, but in itself it provides no immediate value.

>     * qda_drv.c: Core driver and DRM integration
>     * qda_gem.c: GEM object management
>     * qda_memory_manager.c: Memory and IOMMU management
>     * qda_fastrpc.c: FastRPC protocol implementation
>     * qda_rpmsg.c: Transport layer
>     * qda_cb.c: Context bank device management
>   - Benefit: Better maintainability, clearer separation of concerns
> 
> 9. UAPI Design
>   - FastRPC: Custom IOCTL interface
>   - QDA: DRM-style IOCTLs with proper versioning support
>   - Benefit: Follows DRM conventions, easier userspace integration
> 
> 10. Documentation
>   - FastRPC: Minimal in-tree documentation
>   - QDA: Comprehensive documentation in Documentation/accel/qda/
>   - Benefit: Better developer experience, clearer API contracts
> 
> 11. Buffer Reference Mechanism
>   - FastRPC: Uses buffer file descriptors (FDs) for all book-keeping
>     in both kernel and DSP
>   - QDA: Uses GEM handles for kernel-side management, providing better
>     integration with DRM subsystem
>   - Benefit: Leverages DRM GEM infrastructure for reference counting,
>     lifetime management, and integration with other DRM components
> 

This is all good, but what is the plan regarding /dev/fastrpc-*?

The idea here clearly is to provide an alternative implementation, and
they seem to bind to the same toplevel compatible - so you can only
compile one into your kernel at any point in time.

So if I understand correctly, at some point in time we need to say
CONFIG_DRM_ACCEL_QDA=m and CONFIG_QCOM_FASTRPC=n, which will break all
existing user space applications? That's not acceptable.


Would it be possible to have a final driver that is implemented as a
accel, but provides wrappers for the legacy misc and ioctl interface to
the applications?

Regards,
Bjorn

> Key Technical Improvements
> ===========================
> 
> * Proper device model: CB devices are real struct device instances on a
>   custom bus, enabling proper IOMMU group management and power management
>   integration
> 
> * Reference-counted IOMMU devices: Multiple file descriptors from the same
>   process share a single IOMMU device, reducing overhead
> 
> * GEM-based buffer lifecycle: Automatic cleanup via DRM GEM reference
>   counting, eliminating many resource leak scenarios
> 
> * Modular memory backends: The memory manager supports pluggable backends,
>   currently implementing DMA-coherent allocations with SID-prefixed
>   addresses for DSP firmware
> 
> * Context-based invocation tracking: XArray-based context management with
>   proper synchronization and cleanup
> 
> Patch Series Organization
> ==========================
> 
> Patches 1-2:   Driver skeleton and documentation
> Patches 3-6:   RPMsg transport and IOMMU/CB infrastructure
> Patches 7-9:   DRM device registration and basic IOCTL
> Patches 10-12: GEM buffer management and PRIME support
> Patches 13-17: FastRPC protocol implementation (attach, invoke, create,
>                map/unmap)
> Patch 18:      MAINTAINERS entry
> 
> Open Items
> ===========
> 
> The following items are identified as open items:
> 
> 1. Privilege Level Management
>   - Currently, daemon processes and user processes have the same access
>     level as both use the same accel device node. This needs to be
>     addressed as daemons attach to privileged DSP PDs and require
>     higher privilege levels for system-level operations
>   - Seeking guidance on the best approach: separate device nodes,
>     capability-based checks, or DRM master/authentication mechanisms
> 
> 2. UAPI Compatibility Layer
>   - Add UAPI compat layer to facilitate migration of client applications
>     from existing FastRPC UAPI to the new QDA accel driver UAPI,
>     ensuring smooth transition for existing userspace code
>   - Seeking guidance on implementation approach: in-kernel translation
>     layer, userspace wrapper library, or hybrid solution
> 
> 3. Documentation Improvements
>   - Add detailed IOCTL usage examples
>   - Document DSP firmware interface requirements
>   - Create migration guide from existing FastRPC
> 
> 4. Per-Domain Memory Allocation
>   - Develop new userspace API to support memory allocation on a per
>     domain basis, enabling domain-specific memory management and
>     optimization
> 
> 5. Audio and Sensors PD Support
>   - The current patch series does not handle Audio PD and Sensors PD
>     functionalities. These specialized protection domains require
>     additional support for real-time constraints and power management
> 
> Interface Compatibility
> ========================
> 
> The QDA driver maintains compatibility with existing FastRPC infrastructure:
> 
> * Device Tree Bindings: The driver uses the same device tree bindings as
>   the existing FastRPC driver, ensuring no changes are required to device
>   tree sources. The "qcom,fastrpc" compatible string and child node
>   structure remain unchanged.
> 
> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>   the underlying FastRPC protocol and DSP firmware interface remain
>   compatible. This ensures that DSP firmware and libraries continue to
>   work without modification.
> 
> * Migration Path: The modular design allows for gradual migration, where
>   both drivers can coexist during the transition period. Applications can
>   be migrated incrementally to the new UAPI with the help of the planned
>   compatibility layer.
> 
> References
> ==========
> 
> Previous discussions on this migration:
> - https://lkml.org/lkml/2024/6/24/479
> - https://lkml.org/lkml/2024/6/21/1252
> 
> Testing
> =======
> 
> The driver has been tested on Qualcomm platforms with:
> - Basic FastRPC attach/release operations
> - DSP process creation and initialization
> - Memory mapping/unmapping operations
> - Dynamic invocation with various buffer types
> - GEM buffer allocation and mmap
> - PRIME buffer import from other subsystems
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Ekansh Gupta (18):
>       accel/qda: Add Qualcomm QDA DSP accelerator driver docs
>       accel/qda: Add Qualcomm DSP accelerator driver skeleton
>       accel/qda: Add RPMsg transport for Qualcomm DSP accelerator
>       accel/qda: Add built-in compute CB bus for QDA and integrate with IOMMU
>       accel/qda: Create compute CB devices on QDA compute bus
>       accel/qda: Add memory manager for CB devices
>       accel/qda: Add DRM accel device registration for QDA driver
>       accel/qda: Add per-file DRM context and open/close handling
>       accel/qda: Add QUERY IOCTL and basic QDA UAPI header
>       accel/qda: Add DMA-backed GEM objects and memory manager integration
>       accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
>       accel/qda: Add PRIME dma-buf import support
>       accel/qda: Add initial FastRPC attach and release support
>       accel/qda: Add FastRPC dynamic invocation support
>       accel/qda: Add FastRPC DSP process creation support
>       accel/qda: Add FastRPC-based DSP memory mapping support
>       accel/qda: Add FastRPC-based DSP memory unmapping support
>       MAINTAINERS: Add MAINTAINERS entry for QDA driver
> 
>  Documentation/accel/index.rst          |    1 +
>  Documentation/accel/qda/index.rst      |   14 +
>  Documentation/accel/qda/qda.rst        |  129 ++++
>  MAINTAINERS                            |    9 +
>  arch/arm64/configs/defconfig           |    2 +
>  drivers/accel/Kconfig                  |    1 +
>  drivers/accel/Makefile                 |    2 +
>  drivers/accel/qda/Kconfig              |   35 ++
>  drivers/accel/qda/Makefile             |   19 +
>  drivers/accel/qda/qda_cb.c             |  182 ++++++
>  drivers/accel/qda/qda_cb.h             |   26 +
>  drivers/accel/qda/qda_compute_bus.c    |   23 +
>  drivers/accel/qda/qda_drv.c            |  375 ++++++++++++
>  drivers/accel/qda/qda_drv.h            |  171 ++++++
>  drivers/accel/qda/qda_fastrpc.c        | 1002 ++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h        |  433 ++++++++++++++
>  drivers/accel/qda/qda_gem.c            |  211 +++++++
>  drivers/accel/qda/qda_gem.h            |  103 ++++
>  drivers/accel/qda/qda_ioctl.c          |  271 +++++++++
>  drivers/accel/qda/qda_ioctl.h          |  118 ++++
>  drivers/accel/qda/qda_memory_dma.c     |   91 +++
>  drivers/accel/qda/qda_memory_dma.h     |   46 ++
>  drivers/accel/qda/qda_memory_manager.c |  382 ++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  148 +++++
>  drivers/accel/qda/qda_prime.c          |  194 +++++++
>  drivers/accel/qda/qda_prime.h          |   43 ++
>  drivers/accel/qda/qda_rpmsg.c          |  327 +++++++++++
>  drivers/accel/qda/qda_rpmsg.h          |   57 ++
>  drivers/iommu/iommu.c                  |    4 +
>  include/linux/qda_compute_bus.h        |   22 +
>  include/uapi/drm/qda_accel.h           |  224 +++++++
>  31 files changed, 4665 insertions(+)
> ---
> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
> change-id: 20260223-qda-firstpost-4ab05249e2cc
> 
> Best regards,
> -- 
> Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> 
