Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D791A2319E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E297210E9AC;
	Thu, 30 Jan 2025 16:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iWwVrEEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693DA10E9AC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 16:15:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so499299f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 08:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738253729; x=1738858529; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egOGJAXdzlspJHrqV9BICD/kSifyMaJ0VQH1AZZmLmM=;
 b=iWwVrEEuYW9n80lGjiCjvqUFhsv0h8J3cUcil/TaiFLoTEIIkgzA2sKNdCOV2bc/3y
 4Ay/0MiEUdma9PKRLYNRPu+7+T8pLHfQzHA2yFaeRiaYY85SAmupiBPGFvd71g62qwyf
 J1vkEGPgr9nQJXwL0NmgBYy4RWgfGWqg/6Ek0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738253729; x=1738858529;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=egOGJAXdzlspJHrqV9BICD/kSifyMaJ0VQH1AZZmLmM=;
 b=qKKPwPd4z0tfia42+dJtGxxjJhkJHzydwdxJZhLgOWN4kcS0Dh8Xd3nNwi9S8MCZVS
 RSQDxcLJVwYca+/92f/qTz3ZKStnciozx052huwDzwVg0sY32eo7kIF2bQxayZTnrgiT
 UFLGMVotprOBObUxCqQAwb5Na/3EgebkpY0nHrIq7suygDx/1nvzQvULmFQil8646MIs
 lXFG7FpXQ1p49/7ekYlXNh5yQ2LoeH8th4gdzT825idLHQxQd+oIWSU/kIeXQm/Yl1a3
 lMfW1j2dR2Ilr7cLuawe8AIwOZ2ottG/U40Zv3ju/dB2NTo5YsOTGmcPD4UJpxiCamMU
 C3rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3h+8vbq+4Z2o0dimXj7wCWIhA+2L+l//XCMvLL3NOyWrCT7CyfpUXQ99zvERtBN7UgSJq0dwuHfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwffkQihKMWL1jdYNOuW+5SB83k5QctWXVtvuyEqyXNkP8TjF5D
 9Sx4PSW0schZPp/7yvKuTr+mHwBQbla9H2FYhiZw5wQ2CzJo5LnqTA7LukbRqrA=
X-Gm-Gg: ASbGnctfUWu1CxxC09jPp7aLBIVbFjXgi3u30EIbGVt50/4MJgFjmytZ/hMNbhQ/yuM
 PxY1tZwh2a+ZgaNhSQDPv6aYxKIg2r9HzQllxU7+TxCfAIE+hWGyJ40jrMrx4gnQPdnK5O+GrFs
 yLFeYo63+YxUQxhIrXqZ3cVJXYYOMomnGE1OzOLN25Sx4c/c0ROxnxSZFqpXhhp6CU4fyJt4FLe
 /a+4A1CALQEL20hKtMF6DW19YbB2cjztlmc7+T96KKDfLKq+2fkuSTgM56OZyKUYmBQ0ue5DNvK
 o79N62vD4KyxVTvYU9z0h2UNQtk=
X-Google-Smtp-Source: AGHT+IFrK9TYn7kQQFdMHsFiVHo3J2E8mwQ+Y3KTlIT27Ql0a3K5so/x8gXOhuMpz8Mjv2POiya4DQ==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-38c5194a53dmr7160268f8f.14.1738253727206; 
 Thu, 30 Jan 2025 08:15:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57b6sm2393207f8f.72.2025.01.30.08.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 08:15:26 -0800 (PST)
Date: Thu, 30 Jan 2025 17:15:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
Message-ID: <Z5ulnIuzapOVBQgb@phenom.ffwll.local>
Mail-Followup-To: Florent Tomasin <florent.tomasin@arm.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> Hi,
> 
> This is a patch series covering the support for protected mode execution in
> Mali Panthor CSF kernel driver.
> 
> The Mali CSF GPUs come with the support for protected mode execution at the
> HW level. This feature requires two main changes in the kernel driver:
> 
> 1) Configure the GPU with a protected buffer. The system must provide a DMA
>    heap from which the driver can allocate a protected buffer.
>    It can be a carved-out memory or dynamically allocated protected memory region.
>    Some system includes a trusted FW which is in charge of the protected memory.
>    Since this problem is integration specific, the Mali Panthor CSF kernel
>    driver must import the protected memory from a device specific exporter.
> 
> 2) Handle enter and exit of the GPU HW from normal to protected mode of execution.
>    FW sends a request for protected mode entry to the kernel driver.
>    The acknowledgment of that request is a scheduling decision. Effectively,
>    protected mode execution should not overrule normal mode of execution.
>    A fair distribution of execution time will guaranty the overall performance
>    of the device, including the UI (usually executing in normal mode),
>    will not regress when a protected mode job is submitted by an application.
> 
> 
> Background
> ----------
> 
> Current Mali Panthor CSF driver does not allow a user space application to
> execute protected jobs on the GPU. This use case is quite common on end-user-device.
> A user may want to watch a video or render content that is under a "Digital Right
> Management" protection, or launch an application with user private data.
> 
> 1) User-space:
> 
>    In order for an application to execute protected jobs on a Mali CSF GPU the
>    user space application must submit jobs to the GPU within a "protected regions"
>    (range of commands to execute in protected mode).
> 
>    Find here an example of a command buffer that contains protected commands:
> 
> ```
>           <--- Normal mode ---><--- Protected mode ---><--- Normal mode --->
>    +-------------------------------------------------------------------------+
>    | ... | CMD_0 | ... | CMD_N | PROT_REGION | CMD_N+1 | ... | CMD_N+M | ... |
>    +-------------------------------------------------------------------------+
> ```
> 
>    The PROT_REGION command acts as a barrier to notify the HW of upcoming
>    protected jobs. It also defines the number of commands to execute in protected
>    mode.
> 
>    The Mesa definition of the opcode can be found here:
> 
>      https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/lib/genxml/v10.xml?ref_type=heads#L763

Is there also something around that implements egl_ext_protected_context
or similar in mesa? I think that's the minimal bar all the protected gpu
workload kernel support patches cleared thus far, since usually getting
the actual video code stuff published seems to be impossible.
-Sima

> 
> 2) Kernel-space:
> 
>    When loading the FW image, the Kernel driver must also load the data section of
>    CSF FW that comes from the protected memory, in order to allow FW to execute in
>    protected mode.
> 
>    Important: this memory is not owned by any process. It is a GPU device level
>               protected memory.
> 
>    In addition, when a CSG (group) is created, it must have a protected suspend buffer.
>    This memory is allocated within the kernel but bound to a specific CSG that belongs
>    to a process. The kernel owns this allocation and does not allow user space mapping.
>    The format of the data in this buffer is only known by the FW and does not need to
>    be shared with other entities. The purpose of this buffer is the same as the normal
>    suspend buffer but for protected mode. FW will use it to suspend the execution of
>    PROT_REGION before returning to normal mode of execution.
> 
> 
> Design decisions
> ----------------
> 
> The Mali Panthor CSF kernel driver will allocate protected DMA buffers
> using a global protected DMA heap. The name of the heap can vary on
> the system and is integration specific. Therefore, the kernel driver
> will retrieve it using the DTB entry: "protected-heap-name".
> 
> The Mali Panthor CSF kernel driver will handle enter/exit of protected
> mode with a fair consideration of the job scheduling.
> 
> If the system integrator does not provide a protected DMA heap, the driver
> will not allow any protected mode execution.
> 
> 
> Patch series
> ------------
> 
> The series is based on:
> 
>   https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t
> 
> [PATCHES 1-2]:
>   These patches were used for the development of the feature and are not
>   initially thought to land in the Linux kernel. They are mostly relevant
>   if someone wants to reproduce the environment of testing.
> 
>   Note: Please, raise interest if you think those patches have value in
>         the Linux kernel.
> 
>   * dt-bindings: dma: Add CMA Heap bindings
>   * cma-heap: Allow registration of custom cma heaps
> 
> [PATCHES 3-4]:
>   These patches introduce the Mali Panthor CSF driver DTB binding to pass
>   the protected DMA Heap name and the handling of the protected DMA memory
>   allocations in the driver.
> 
>   Note: The registration of the protected DMA buffers is done via GEM prime.
>   The direct call to the registration function, may seems controversial and
>   I would appreciate feedback on that matter.
> 
>   * dt-bindings: gpu: Add protected heap name to Mali Valhall CSF binding
>   * drm/panthor: Add support for protected memory allocation in panthor
> 
> [PATCH 5]:
>   This patch implements the logic to handle enter/exit of the GPU protected
>   mode in Panthor CSF driver.
> 
>   Note: to prevent scheduler priority inversion, only a single CSG is allowed
>         to execute while in protected mode. It must be the top priority one.
> 
>   * drm/panthor: Add support for entering and exiting protected mode
> 
> Testing
> -------
> 
> 1) Platform and development environment
> 
>    Any platform containing a Mali CSF type of GPU and a protected memory allocator
>    that is based on DMA Heap can be used. For example, it can be a physical platform
>    or a simulator such as Arm Total Compute FVPs platforms. Reference to the latter:
> 
>      https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Total%20Compute%20FVPs
> 
>    To ease the development of the feature, a carved-out protected memory heap was
>    defined and managed using a modified version of the CMA heap driver.
> 
> 2) Protected job submission:
> 
>    A protected mode job can be created in Mesa following this approach:
> 
> ```
> diff --git a/src/gallium/drivers/panfrost/pan_csf.c b/src/gallium/drivers/panfrost/pan_csf.c
> index da6ce875f86..13d54abf5a1 100644
> --- a/src/gallium/drivers/panfrost/pan_csf.c
> +++ b/src/gallium/drivers/panfrost/pan_csf.c
> @@ -803,8 +803,25 @@ GENX(csf_emit_fragment_job)(struct panfrost_batch *batch,
>        }
>     }
> 
> +   if (protected_cmd) {
> +      /* Number of commands to execute in protected mode in bytes.
> +       * The run fragment and wait commands. */
> +      unsigned const size = 2 * sizeof(u64);
> +
> +      /* Wait for all previous commands to complete before evaluating
> +       * the protected commands. */
> +      cs_wait_slots(b, SB_ALL_MASK, false);
> +      cs_prot_region(b, size);
> +   }
> +
>     /* Run the fragment job and wait */
>     cs_run_fragment(b, false, MALI_TILE_RENDER_ORDER_Z_ORDER, false);
> +
> +   /* Wait for all protected commands to complete before evaluating
> +    * the normal mode commands. */
> +   if (protected_cmd)
> +      cs_wait_slots(b, SB_ALL_MASK, false);
> +
>     cs_wait_slot(b, 2, false);
> 
>     /* Gather freed heap chunks and add them to the heap context free list
> ```
> 
> 
> Constraints
> -----------
> 
> At the time of developing the feature, Linux kernel does not have a generic
> way of implementing protected DMA heaps. The patch series relies on previous
> work to expose the DMA heap API to the kernel drivers.
> 
> The Mali CSF GPU requires device level allocated protected memory, which do
> not belong to a process. The current Linux implementation of DMA heap only
> allows a user space program to allocate from such heap. Having the ability
> to allocate this memory at the kernel level via the DMA heap API would allow
> support for protected mode on Mali CSF GPUs.
> 
> 
> Conclusion
> ----------
> 
> This patch series aims to initiate the discussion around handling of protected
> mode in Mali CSG GPU and highlights constraints found during the development
> of the feature.
> 
> Some Mesa changes are required to construct a protected mode job in user space,
> which can be submitted to the GPU.
> 
> Some of the changes may seems controversial and we would appreciate getting
> opinion from the community.
> 
> 
> Regards,
> 
> Florent Tomasin (5):
>   dt-bindings: dma: Add CMA Heap bindings
>   cma-heap: Allow registration of custom cma heaps
>   dt-bindings: gpu: Add protected heap name to Mali Valhall CSF binding
>   drm/panthor: Add support for protected memory allocation in panthor
>   drm/panthor: Add support for entering and exiting protected mode
> 
>  .../devicetree/bindings/dma/linux,cma.yml     |  43 ++++++
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |   6 +
>  drivers/dma-buf/heaps/cma_heap.c              | 120 +++++++++++------
>  drivers/gpu/drm/panthor/Kconfig               |   1 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  22 +++-
>  drivers/gpu/drm/panthor/panthor_device.h      |  10 ++
>  drivers/gpu/drm/panthor/panthor_fw.c          |  46 ++++++-
>  drivers/gpu/drm/panthor/panthor_fw.h          |   2 +
>  drivers/gpu/drm/panthor/panthor_gem.c         |  49 ++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h         |  16 ++-
>  drivers/gpu/drm/panthor/panthor_heap.c        |   2 +
>  drivers/gpu/drm/panthor/panthor_sched.c       | 124 ++++++++++++++++--
>  12 files changed, 382 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.yml
> 
> --
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
