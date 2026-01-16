Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FDD385C7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 20:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E96E10E117;
	Fri, 16 Jan 2026 19:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MihcfWZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A529C10E117
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 19:27:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so3958384a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1768591630; x=1769196430; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cjMTrYrBrzeKqdwskRII283z1dzc+3pWLLZSVhN1rL0=;
 b=MihcfWZpypk9dsVu6gHi1AGiyyLlxTN3w+fSJKhK90OgjrvQZ/X87XY0Vp0YBC6az5
 2hkC/g01ho5TVbbAr7FD5UDzko+Au9fkqkkGAXgjr31HqX4+y3xWvWcdboO9IBckH0SZ
 7DNcLim09aT4mwYzfqDExDG/UkjYtZcFynJMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768591630; x=1769196430;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjMTrYrBrzeKqdwskRII283z1dzc+3pWLLZSVhN1rL0=;
 b=d4+hfeqHUpk9ISTgjCZP+IJI3t5LY32hlVnZtb/ORz5VMDO6I7D8eDcbAJvysFrifr
 opJOPRqTH4aZJ4MGbgZ7X5CLDk2W5nEh+W0Zi2+XD65yfnxIDJ3FrUVJkOMmtBqYxCEv
 lVq1xSSUdwFjsGCduyRK0lnaT5Ude3UmRhe6q6RDolvEmB/YksI/OOs1/qZd6JPmXM4C
 3WzgeRDt7/v/ZImACfUYXr3UvT3yZnWx8oPvMCG9bvBnQezGau6pBbM4MFsd3sRDvqa3
 Q+acHmdV/Il5ksA9ZNIT/BgqT0bQ+Su0/jOka5xPDw5glpQDyhWcvTCBd0f60Y4lrFv0
 Qu2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFh6SwEOEvHIkm/7qEfHgCctHHXqohXnKO4C0X3PB237dLPLHYlWBdt9U7gDEF0QdTKmtY0nmiDjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDs5DHeFGzBGB1TD7NZop2VBG07rSr0z3kH2cIJ/iOY1J7yQTE
 y4yKjkpXhPM4/nm8c85u0LYMS7x7/g71LlonNRfj+Na9lZIk0a1bZPY1JTHN4OuhknU=
X-Gm-Gg: AY/fxX6Y+uheR6fFCQvBKE8k2hwb9nxwxlcB7IZi5cTYL9DcdttT1QwL4r7yB7u08tF
 2V4csfK32iBwpLJ0wZDdp7fFTbDch9aRbXREyhRId18AWry0fzVqAoJK/6uW/C3JXwZc8NFVL4w
 AqfY9k+k/h+s6yE89oPJRt/2zUcy4laxfailwzxpvyqkGkCw0zdotQOa32jlwUlQsi8OFh2K6gY
 H13aU/3EY0lVlxGxYVMud+MF2J6pNnV5+FLbc0QFOb+VWKPN36U6EpilsXt3eVFl7J3fNjNXdwd
 ynjBlkzx1H5U4eCm7flCjOAZqG+CZN1n5QTIUR9ZL/U10KfcqW4JqYkzy9YaHqwh9OZe5FrIrHE
 t6GLkOwEYLL75h+EpRvkpTfODnNLylT2fNQQKYdUQ0E509byyTqyCrLiocRb5CjGIUr7seOa4yp
 AprvOYTKKeFoYh3fmL3yT7S3Y9WrvWpB3uIQ==
X-Received: by 2002:a05:6402:23c4:b0:655:ad4d:66a2 with SMTP id
 4fb4d7f45d1cf-655ad4d67eemr1941937a12.1.1768591629985; 
 Fri, 16 Jan 2026 11:27:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452cdab55sm3233595a12.10.2026.01.16.11.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 11:27:09 -0800 (PST)
Date: Fri, 16 Jan 2026 20:27:07 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona.vetter@ffwll.ch
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.19
Message-ID: <aWqRC3xvwpeW7I6t@phenom.ffwll.local>
References: <20260115205405.1890089-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115205405.1890089-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.17.10+deb14-amd64 
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

On Thu, Jan 15, 2026 at 03:54:05PM -0500, Alex Deucher wrote:
> Hi Dave, Simona,
> 
> Fixes for 6.19.
> 
> The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:
> 
>   Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2026-01-15
> 
> for you to fetch changes up to d04f73668bebbc5a44a2771ea92b6ec253148050:
> 
>   drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module (2026-01-14 15:07:43 -0500)

Pulled into drm-fixes, thanks!

Cheers, Sima
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.19-2026-01-15:
> 
> amdgpu:
> - GC 9 PTE mtype fix
> - Non-DC display kernel panic helper fix
> - Merge fix
> - GART vram access fix
> - Userq fixes
> - PSR debugging fix
> - HDMI fixes
> - Backlight fix
> - SMU 14 fix
> - TLB flush fixes
> 
> amdkfd:
> - KFD node cleanup for eGPU disconnect
> - Memory leak fix
> - MES evict process fix
> 
> ----------------------------------------------------------------
> Alex Deucher (1):
>       drm/amdgpu: make sure userqs are enabled in userq IOCTLs
> 
> Haoxiang Li (1):
>       drm/amdkfd: fix a memory leak in device_queue_manager_init()
> 
> Harish Kasiviswanathan (1):
>       drm/amdkfd: No need to suspend whole MES to evict process
> 
> Ivan Lipski (1):
>       drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module
> 
> Lu Yao (1):
>       drm/amdgpu: fix drm panic null pointer when driver not support atomic
> 
> Mario Limonciello (1):
>       drm/amd/display: Bump the HDMI clock to 340MHz
> 
> Mario Limonciello (AMD) (2):
>       drm/amd: Clean up kfd node on surprise disconnect
>       drm/amd/display: Show link name in PSR status message
> 
> Peter Colberg (1):
>       Revert duplicate "drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces"
> 
> Philip Yang (1):
>       drm/amdgpu: Fix gfx9 update PTE mtype flag
> 
> Prike Liang (2):
>       drm/amdgpu: validate the flush_gpu_tlb_pasid()
>       Revert "drm/amdgpu: don't attach the tlb fence for SI"
> 
> Srinivasan Shanmugam (1):
>       drm/amdgpu/userq: Fix fence reference leak on queue teardown v2
> 
> Vivek Das Mohapatra (1):
>       drm/amd/display: Initialise backlight level values from hw
> 
> Xiaogang Chen (1):
>       drm/amdgpu: Use correct address to setup gart page table for vram access
> 
> Yang Wang (1):
>       drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  8 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  7 ++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 12 --------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 11 +++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  4 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  4 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 16 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  8 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  4 +--
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  8 ++---
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 31 ++++++++-----------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 36 +++++++++++++++++++---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  5 ++-
>  drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |  2 +-
>  .../gpu/drm/amd/display/dc/link/link_detection.c   |  4 ++-
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  3 +-
>  18 files changed, 116 insertions(+), 50 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
