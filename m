Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E9820B031
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 13:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B576E456;
	Fri, 26 Jun 2020 11:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C385C6E456
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593169638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDwsYAvxSJZLDEgTlXLRsed5rIPTKot0z6UdCZU9/Iw=;
 b=ADpsL1cNr+NtxOPYMokC18eUEJG3MYiwIpz+HcUMMWO1K/szPnjhyRbIoVYnbeTH65IJXl
 fggLpKQLnUH3up+5tZi66juYCBMkQh7pV/a0w899vTD5qesFMRjkgIsHY9mHcxlefG7vgi
 xD5rey2TfeVUY5BCxpsfh5ScGcZ3m38=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-FB8i2EizOBmUY9-qV3rfqA-1; Fri, 26 Jun 2020 07:07:11 -0400
X-MC-Unique: FB8i2EizOBmUY9-qV3rfqA-1
Received: by mail-qt1-f197.google.com with SMTP id c26so6241977qtq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 04:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDwsYAvxSJZLDEgTlXLRsed5rIPTKot0z6UdCZU9/Iw=;
 b=JE9CGoxhcviFJXelwIbz5OFrDFmfUwTk2bJ0soTUjFewpl4WpXh24bY6ip7WxxodT1
 pKtlPcGxw6xdJLKEHmURKmEXeyYIs8TIohx91LqYRV9KtaQkgJlCAqGnsbr07z1WKm46
 Ypw0ZIGj0vWuYQIlsvXS5fw26y1cngnp6ZBuFM/v1Q6VBH5NwAyti7KZu8fzK8vAk/NX
 /y/czU/ZOa3Cpk5CbI/T9iZlpBuejf+JpIvgirBAwVYKSSubLrQG6SaFNUc5zp7W7PQs
 zixPYmo+KXhAzJqAdJlDXVSFfv+FDM+fpagwwKeAFXgh5xt7TMM5q1KUjbeUxORnJ/cD
 Tttg==
X-Gm-Message-State: AOAM532rY2/ldUcoWpSqR+Cm1yACLvT4x2qD/SkAOkai5tsLJJTnF1MW
 tfLzd1pSwfLGkY1PdY1yuTZSExxO/F707rK1NGu22kQnLOjE/LyKABAsTJzOEJsCg7Qs49j7tsl
 Y54hGYzzmELP7ZqDBp/ySa6KzSB0yGWAXdbAPstzFfsMG
X-Received: by 2002:aed:23c6:: with SMTP id k6mr2208810qtc.378.1593169630518; 
 Fri, 26 Jun 2020 04:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsRZdKwKa0Uc7C5GRxdjUv8abhwjADbZa5fIavU7Z89JyB7dByqsITA7hfm8D/g4Vn+mqvWIzahtrfMix3Vh8=
X-Received: by 2002:aed:23c6:: with SMTP id k6mr2208747qtc.378.1593169629935; 
 Fri, 26 Jun 2020 04:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 26 Jun 2020 13:06:58 +0200
Message-ID: <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, gustavo@padovan.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> # Host1x/TegraDRM UAPI proposal
>
> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> many ways.
>
> I haven't written any implementation yet -- I'll do that once there is
> some agreement on the high-level design.
>
> Current open items:
>
> * The syncpoint UAPI allows userspace to create sync_file FDs with
> arbitrary syncpoint fences. dma_fence code currently seems to assume all
> fences will be signaled, which would not necessarily be the case with
> this interface.
> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> Not sure if they are still needed.
>

Hi, as this wasn't addressed here (and sorry if I missed it): is there
an open source userspace making use of this UAPI? Because this is
something which needs to be seen before it can be included at all.

> ## Introduction to the hardware
>
> Tegra Host1x is a hardware block providing the following capabilities:
>
> * Syncpoints, a unified whole-system synchronization primitive, allowing
> synchronization of work between graphics, compute and multimedia
> engines, CPUs including cross-VM synchronization, and devices on the
> PCIe bus, without incurring CPU overhead.
> * Channels, a command DMA mechanism allowing asynchronous programming of
> various engines, integrating with syncpoints.
> * Hardware virtualization support for syncpoints and channels. (On
> Tegra186 and newer)
>
> This proposal defines APIs for userspace access to syncpoints and
> channels. Kernel drivers can additionally use syncpoints and channels
> internally, providing other userspace interfaces (e.g. V4L2).
>
> Syncpoint and channel interfaces are split into separate parts, as
> syncpoints are useful as a system synchronization primitive even without
> using the engine drivers provided through TegraDRM. For example, a
> computer vision pipeline consisting of video capture, CPU processing and
> GPU processing would not necessarily use the engines provided by
> TegraDRM. See the Example workflows section for more details.
>
> ## Syncpoint interface
>
> Syncpoints are a set of 32-bit values providing the following operations:
>
> * Atomically increment value by one
> * Read current value
> * Wait until value reaches specified threshold. For waiting, the 32-bit
> value space is treated modulo 2^32; e.g. if the current value is
> 0xffffffff, then value 0x0 is considered to be one increment in the future.
>
> Each syncpoint is identified by a system-global ID ranging between [0,
> number of syncpoints supported by hardware). The entire system has
> read-only access to all syncpoints based on their ID.
>
> Syncpoints are managed through the device node /dev/host1x provided by
> the gpu/host1x driver.
>
> ### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)
>
> Allocates a free syncpoint, returning a file descriptor representing it.
> Only the owner of the file descriptor is allowed to mutate the value of
> the syncpoint.
>
> ```
> struct host1x_ctrl_allocate_syncpoint {
>         /**
>          * @fd:
>          *
>          * [out] New file descriptor representing the allocated syncpoint.
>          */
>         __s32 fd;
>
>         __u32 reserved[3];
> };
> ```
>
> ### IOCTL HOST1X_SYNCPOINT_INFO (on syncpoint file descriptor)
>
> Allows retrieval of system-global syncpoint ID corresponding to syncpoint.
>
> Use cases:
>
> * Passing ID to other system components that identify syncpoints by ID
> * Debugging and testing
>
> ```
> struct host1x_syncpoint_info {
>         /**
>          * @id:
>          *
>          * [out] System-global ID of the syncpoint.
>          */
>         __u32 id;
>
>         __u32 reserved[3];
> };
> ```
>
> ### IOCTL HOST1X_SYNCPOINT_INCREMENT (on syncpoint file descriptor)
>
> Allows incrementing of the syncpoint value.
>
> Use cases:
>
> * Signalling work completion when executing a pipeline step on the CPU
> * Debugging and testing
>
> ```
> struct host1x_syncpoint_increment {
>         /**
>          * @count:
>          *
>          * [in] Number of times to increment syncpoint. Value can be
>          *   observed in in-between values, but increments are atomic.
>          */
>         __u32 count;
> };
> ```
>
> ### IOCTL HOST1X_READ_SYNCPOINT (on /dev/host1x)
>
> Read the value of a syncpoint based on its ID.
>
> Use cases:
>
> * Allows more fine-grained tracking of task progression for debugging
> purposes
>
> ```
> struct host1x_ctrl_read_syncpoint {
>         /**
>          * @id:
>          *
>          * [in] ID of syncpoint to read.
>          */
>         __u32 id;
>
>         /**
>          * @value:
>          *
>          * [out] Value of the syncpoint.
>          */
>         __u32 value;
> };
> ```
>
> ### IOCTL HOST1X_CREATE_FENCE (on /dev/host1x)
>
> Creates a new SYNC_FILE fence file descriptor for the specified
> syncpoint ID and threshold.
>
> Use cases:
>
> * Creating a fence when receiving ID/threshold pair from another system
> component
> * Creating a postfence when executing a pipeline step on the CPU
> * Creating a postfence when executing a pipeline step controlled by
> userspace (e.g. GPU userspace submission)
>
> ```
> struct host1x_ctrl_create_fence {
>         /**
>          * @id:
>          *
>          * [in] ID of the syncpoint for which to create a fence.
>          */
>         __u32 id;
>
>         /**
>          * @threshold:
>          *
>          * [in] Threshold value for fence.
>          */
>         __u32 threshold;
>
>         /**
>          * @fence_fd:
>          *
>          * [out] New sync_file FD corresponding to the ID and threshold.
>          */
>         __s32 fence_fd;
>
>         __u32 reserved[1];
> };
> ```
>
> ### IOCTL HOST1X_GET_FENCE_INFO (on /dev/host1x)
>
> Allows retrieval of the ID/threshold pairs corresponding to a SYNC_FILE
> fence or fence array.
>
> Use cases:
>
> * Debugging and testing
> * Transmitting a fence to another system component requiring ID/threshold
> * Getting ID/threshold for prefence when programming a pipeline step
> controlled by userspace (e.g. GPU userspace submission)
>
> ```
> /* If set, corresponding fence is backed by Host1x syncpoints. */
> #define HOST1X_CTRL_FENCE_INFO_SYNCPOINT_FENCE      (1 << 0)
>
> struct host1x_ctrl_fence_info {
>         /**
>          * @flags:
>          *
>          * [out] HOST1X_CTRL_FENCE_INFO flags.
>          */
>         __u32 flags;
>
>         /**
>          * @id:
>          *
>          * [out] ID of the syncpoint corresponding to this fence.
>          * Only set if HOST1X_CTRL_FENCE_INFO_SYNCPOINT_FENCE is set.
>          */
>         __u32 id;
>
>         /**
>          * @threshold:
>          *
>          * [out] Signalling threshold of the fence.
>          * Only set if HOST1X_CTRL_FENCE_INFO_SYNCPOINT_FENCE is set.
>          */
>         __u32 threshold;
>
>         __u32 reserved[1];
> };
>
> struct host1x_ctrl_get_fence_info {
>         /**
>          * @fence_fd:
>          *
>          * [in] Syncpoint-backed sync_file FD for which to retrieve info.
>          */
>         __s32 fence_fd;
>
>         /**
>          * @num_fences:
>          *
>          * [in] Size of `fence_info` array in elements.
>          * [out] Number of fences held by the FD.
>          */
>         __u32 num_fences;
>
>         /**
>          * @fence_info:
>          *
>          * [in] Pointer to array of 'struct host1x_ctrl_fence_info'
> where info will be stored.
>          */
>         __u64 fence_info;
>
>         __u32 reserved[1];
> };
> ```
>
> ## Channel interface
>
> ### DRM_TEGRA_OPEN_CHANNEL
>
> ```
> struct drm_tegra_open_channel {
>          /**
>            * @class:
>            *
>            * [in] Host1x class (engine) the channel will target.
>            */
>          __u32 host1x_class;
>
>          /**
>            * @flags:
>            *
>            * [in] Flags. Currently none are specified.
>            */
>          __u32 flags;
>
>          /**
>            * @channel_id:
>            *
>            * [out] Process-specific identifier corresponding to opened
>            *   channel. Not the hardware channel ID.
>            */
>          __u32 channel_id;
>
>          /**
>           * @hardware_version:
>           *
>           * [out] Hardware version of the engine targeted by the channel.
>           *   Userspace can use this to select appropriate programming
>           *   sequences.
>           */
>          __u32 hardware_version;
>
>          /**
>           * @mode:
>           *
>           * [out] Mode the hardware is executing in. Some engines can be
>           *   configured with different firmware supporting different
>           *   functionality depending on the system configuration. This
>           *   value allows userspace to detect if the engine is configured
>           *   for the intended use case.
>           */
>          __u32 mode;
>
>          __u32 reserved[3];
> };
> ```
>
> ### DRM_TEGRA_CLOSE_CHANNEL
>
> ```
> struct drm_tegra_close_channel {
>          /**
>            * @channel_id:
>            *
>            * [in] ID of channel to close.
>            */
>          __u32 channel_id;
>
>          __u32 reserved[3];
> };
> ```
>
> ### DRM_TEGRA_CHANNEL_MAP
>
> Make memory accessible by the engine while executing work on the channel.
>
> ```
> #define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)
>
> struct drm_tegra_channel_map {
>          /*
>           * [in] ID of the channel for which to map memory to.
>           */
>          __u32 channel_id;
>
>          /*
>           * [in] GEM handle of the memory to map.
>           */
>          __u32 handle;
>
>          /*
>           * [in] Offset in GEM handle of the memory area to map.
>           *
>           * Must be aligned by 4K.
>           */
>          __u64 offset;
>
>          /*
>           * [in] Length of memory area to map in bytes.
>           *
>           * Must be aligned by 4K.
>           */
>          __u64 length;
>
>          /*
>           * [out] IOVA of mapped memory. Userspace can use this IOVA
>           *   directly to refer to the memory to skip using relocations.
>           *   Only available if hardware memory isolation is enabled.
>           *
>           *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
>           */
>          __u64 iova;
>
>          /*
>           * [out] ID corresponding to the mapped memory to be used for
>           *   relocations or unmapping.
>           */
>          __u32 mapping_id;
>
>          /*
>           * [in] Flags.
>           */
>          __u32 flags;
>
>          __u32 reserved[6];
> };
> ```
>
> ### DRM_TEGRA_CHANNEL_UNMAP
>
> Unmap previously mapped memory. Userspace shall do this only after it
> has determined the channel will no longer access the memory.
>
> ```
> struct drm_tegra_channel_unmap {
>          /*
>           * [in] ID of the mapping to remove.
>           */
>          __u32 mapping_id;
>
>          __u32 reserved[3];
> };
> ```
>
> ### DRM_TEGRA_CHANNEL_SUBMIT
>
> Submit a job to the engine/class targeted by the channel.
>
> ```
> struct drm_tegra_submit_syncpt_incr {
>          /*
>           * [in] Syncpoint FD of the syncpoint that the job will
>           *   increment.
>           */
>          __s32 syncpt_fd;
>
>          /*
>           * [in] Number of increments that the job will do.
>           */
>          __u32 num_incrs;
>
>          /*
>           * [out] Value the syncpoint will have once all increments have
>           *   executed.
>           */
>          __u32 fence_value;
>
>          __u32 reserved[1];
> };
>
> /* Sets paddr/IOVA bit 39 on T194 to enable MC swizzling */
> #define DRM_TEGRA_SUBMIT_RELOCATION_BLOCKLINEAR   (1<<0)
>
> struct drm_tegra_submit_relocation {
>          /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>          __u32 gather_command_index;
>
>          /*
>           * [in] Mapping handle (obtained through CHANNEL_MAP) of the memory
>           *   the address of which will be patched in.
>           */
>          __u32 mapping_id;
>
>          /*
>           * [in] Offset in the gather that will be patched.
>           */
>          __u64 gather_offset;
>
>          /*
>           * [in] Offset in target buffer whose paddr/IOVA will be written
>           *   to the gather.
>           */
>          __u64 target_offset;
>
>          /*
>           * [in] Number of bits the resulting address will be logically
>           *   shifted right before writing to gather.
>           */
>          __u32 shift;
>
>          __u32 reserved[1];
> };
>
> /* Command is an opcode gather from a GEM handle */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
> /* Command is an opcode gather from a user pointer */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
> /* Command is a wait for syncpt fence completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCPT        2
> /* Command is a wait for SYNC_FILE FD completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNC_FILE     3
> /* Command is a wait for DRM syncobj completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCOBJ       4
>
> /*
>   * Allow driver to skip command execution if engine
>   * was not accessed by another channel between
>   * submissions.
>   */
> #define DRM_TEGRA_SUBMIT_CONTEXT_SETUP                        (1<<0)
>
> struct drm_tegra_submit_command {
>          __u16 type;
>          __u16 flags;
>
>          union {
>                  struct {
>                      /* GEM handle */
>                      __u32 handle;
>
>                      /*
>                       * Offset into GEM object in bytes.
>                       * Must be aligned by 4.
>                       */
>                      __u64 offset;
>
>                      /*
>                       * Length of gather in bytes.
>                       * Must be aligned by 4.
>                       */
>                      __u64 length;
>                  } gather;
>
>                  struct {
>                          __u32 reserved[1];
>
>                          /*
>                           * Pointer to gather data.
>                           * Must be aligned by 4 bytes.
>                           */
>                          __u64 base;
>
>                          /*
>                           * Length of gather in bytes.
>                           * Must be aligned by 4.
>                           */
>                          __u64 length;
>                  } gather_uptr;
>
>                  struct {
>                      __u32 syncpt_id;
>                      __u32 threshold;
>
>                      __u32 reserved[1];
>                  } wait_syncpt;
>
>                  struct {
>                          __s32 fd;
>                  } wait_sync_file;
>
>                  struct {
>                          __u32 handle;
>                  } wait_syncobj;
>          };
> };
>
>
> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE      (1<<0)
> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ        (1<<1)
>
> struct drm_tegra_channel_submit {
>          __u32 channel_id;
>          __u32 flags;
>
>          /**
>           * [in] Timeout in microseconds after which the kernel may
>           *   consider the job to have hung and may reap it and
>           *   fast-forward its syncpoint increments.
>           *
>           *   The value may be capped by the kernel.
>           */
>          __u32 timeout;
>
>          __u32 num_syncpt_incrs;
>          __u32 num_relocations;
>          __u32 num_commands;
>
>          __u64 syncpt_incrs;
>          __u64 relocations;
>          __u64 commands;
>
>          /**
>           * [out] Invalid, SYNC_FILE FD or syncobj handle, depending on
>           *   if DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE,
>           *   DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ, or neither are passed.
>           *   Passing both is an error.
>           *
>           * The created fence object is signaled when all syncpoint
>           * increments specified in `syncpt_incrs' have executed.
>           */
>          __u32 post_fence;
>
>          __u32 reserved[3];
> };
> ```
>
> ## Example workflows
>
> ### Image processing with TegraDRM/VIC
>
> This example is a simple single-step operation using VIC through
> TegraDRM. For example, assume we have a dma-buf fd with an image we want
> to convert from YUV to RGB. This can occur for example as part of video
> decoding.
>
> Syncpoint initialization
>
> 1. Allocate syncpoint (HOST1X_ALLOCATE_SYNCPOINT)
>     1. This is used to track VIC submission completion.
> 2. Retrieve syncpoint ID (HOST1X_SYNCPOINT_INFO)
>     1. The ID is required to program the increment as part of the
> submission.
>
> Buffer allocation
>
> 3. Allocate memory for configuration buffers (DMA Heaps)
> 4. Import configuration buffer dma-buf as GEM object
> 5. Import input image dma-buf as GEM object
>
> Channel initialization
>
> 6. Open VIC channel (DRM_TEGRA_OPEN_CHANNEL)
> 7. Map buffers for access by VIC (DRM_TEGRA_CHANNEL_MAP)
> 8. Create Host1x opcode buffer as userspace memory
>     1. If buffer mapping returned an IOVA, that IOVA can be placed
> directly into the buffer. Otherwise, a relocation has to be passed as
> part of the submission
>     2. The buffer should contain a syncpoint increment for the syncpoint
> allocated earlier.
> 9. Submit work, passing in the syncpoint file descriptor allocated in
> the beginning. The submit optionally returns a syncfd/syncobj that can
> be used to wait for submission completion.
>     1. If more fine-grained syncpoint waiting is required, the 'fence'
> out-parameter of 'drm_tegra_submit_syncpt_incr' can be used in
> conjunction with HOST1X_CREATE_FENCE to create specific fences.
>
> ### Camera-GPU-CPU pipeline without TegraDRM
>
> This example shows a pipeline with image input from a camera being
> processed using the GPU programmed from userspace, and then finally
> analyzed by CPU. This kind of usecase can occur e.g. as part of a
> computer vision usecase.
>
> Syncpoint initialization
>
> 1. Camera V4L2 driver allocates a syncpoint internally within the kernel.
> 2. For CPU job tracking, allocate a syncpoint as in "Image processing
> with TegraDRM/VIC".
> 3. For GPU job tracking, the GPU kernel driver would allocate a
> syncpoint and assign it such that the GPU channel can access it.
>
> Camera pipeline step
>
> 4. Allocate a dma-buf to store the captured image.
> 5. Trigger camera capture and store the resulting sync_file fd.
>
> GPU pipeline step
>
> 6. Use HOST1X_GET_FENCE_INFO to extract syncpoint ID/threshold pair(s)
> from camera step's post-fence sync_file FD. If the sync_file FD is not
> backed by syncpoints, wait for the sync_file FD to signal otherwise
> (e.g. through polling it).
> 7. Use HOST1X_CREATE_FENCE to create a postfence that is signaled when
> the GPU step is complete.
> 8. Program the GPU to
>     1. Wait for the syncpoint thresholds extracted from the camera
> postfence, if we were able to do so.
>     2. Execute image processing on GPU.
>     3. Increment GPU's job tracking syncpoint, causing the GPU
> post-fence FD to get signaled.
>
> CPU pipeline step
>
> 9. Wait for GPU's post-fence sync_file FD
> 10. Map the dma-buf containing the image and retrieve results.
>
> In place of the GPU pipeline step, a similar workflow would apply for a
> step executed on the CPU.
>
> --
>
> thanks,
> Mikko
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
