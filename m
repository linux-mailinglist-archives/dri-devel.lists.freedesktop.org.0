Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324C96080E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B2E10E2F7;
	Tue, 27 Aug 2024 10:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OVo44ipP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7584B10E2F2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:59:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3718acbc87fso2975501f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724756381; x=1725361181; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YtTu6HehYNttdvmPGYfqql7wv98msGlzuALk1nY0pN0=;
 b=OVo44ipPDXkxxNP+TrCjlZpKYrAR4ZAhyvG1tyiFOBSsk77D3+Otg2uyZCom8UpFIH
 fNKQspGdsqu/1bd69UBRGshHerynrsnaVrXA93sv0TAEbyN6TM40ch5QkfRM/9PSn+hm
 PaMBdYquTC/4sC1bbCtAS6SqpLPD9v9oulalU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724756381; x=1725361181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtTu6HehYNttdvmPGYfqql7wv98msGlzuALk1nY0pN0=;
 b=uyZeWeHpXsywVCpDTZ5W9JbygimHOEcaNmVP5GESh63cb0R56dPwpASosU7Qa4kPJk
 LCW2Hmt6oxaTZjxOfs4XWd2hp8iOiunzmjWzcJuoVGnKCoy8rcQC11AK0csbha01l4FL
 Aw6MjPS4j3PzNeTJQIDT9ROxPCtVHiSPU3/ZV1+SeTJV5IPlk4YGpJzGxdbd6twljkEP
 nL5WvWDVkjsQAgpPK8BFIbS6EoA1mzsoP1SwCWm4+v32LV7FtIsN50ScXwvk55vxRsm9
 wr+VZPiEcGxwxD1xMHTZeOs7iCaj5pHcOU83kTvzoGn/nLoZyb/CEr5t3tO1u7/8Oa2k
 yu3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMNHAqlOL1Ri5qn+6Opii2VTncZACtMfqen2fxBWPf860HgYIeVqLCttFciGXchiZkVvzkjLAgF+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygM99S/VDv6DbM3RYl+rz6jlMCPHYo/ahBLXLIWM9coJE+0w1D
 t0yRMF0K9VtJAbF5feLRekukygTL0jwBl3c8ktwqXUp25GvcTFL6aU38GfZaHvA=
X-Google-Smtp-Source: AGHT+IFvxMRX4HrtjoHJLYoLwjVL7JDGTv2tUAFtl41JUxWEWfTcmjptbYrHwKHiJhC6n1EyVoAMSw==
X-Received: by 2002:adf:f24d:0:b0:371:941f:48f2 with SMTP id
 ffacd0b85a97d-37311865284mr7830240f8f.32.1724756380636; 
 Tue, 27 Aug 2024 03:59:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac517f9basm181032045e9.39.2024.08.27.03.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 03:59:40 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:59:38 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-gt-next
Message-ID: <Zs2xmjmZiiXzwrWY@phenom.ffwll.local>
References: <ZshcfSqgfnl8Mh4P@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZshcfSqgfnl8Mh4P@jlahtine-mobl.ger.corp.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Fri, Aug 23, 2024 at 12:55:09PM +0300, Joonas Lahtinen wrote:
> Hi Dave & Sima,
> 
> Mostly fixes in this drm-intel-gt-next PR at this time.
> 
> One thing to pay attention is the limitation of number of relocations to
> INT_MAX which might impact synthetic tests, but no real workloads.
> 
> Regards, Joonas
> 
> ***
> 
> drm-intel-gt-next-2024-08-23:
> 
> UAPI Changes:
> 
> - drm/i915: 2 GiB of relocations ought to be enough for anybody*
> 
>   Limit the number of relocations to INT_MAX.
> 
>   Only impact should be onsynthetic tests.
> 
> Driver Changes:
> 
> - Fix for #11396: GPU Hang and rcs0 reset on Cherrytrail platform
> - Fix Virtual Memory mapping boundaries calculation (Andi)
> - Fix for #11255: Long hangs in buddy allocator with DG2/A380 without
>   Resizable BAR since 6.9 (David)
> - Mark the GT as dead when mmio is unreliable (Chris, Andi)
> - Workaround additions / fixes for MTL, ARL and DG2 (John H, Nitin)
> - Enable partial memory mapping of GPU virtual memory (Andi, Chris)
> 
> - Prevent NULL deref on intel_memory_regions_hw_probe (Jonathan, Dan)
> - Avoid UAF on intel_engines_release (Krzysztof)
> 
> - Don't update PWR_CLK_STATE starting Gen12 (Umesh)
> - Code and dmesg cleanups (Andi, Jesus, Luca)
> 
> The following changes since commit 3b85152cb167bd24fe84ceb91b719b5904ca354f:
> 
>   drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace (2024-06-28 00:11:01 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-08-23

Pulled, thanks.
-Sima

> 
> for you to fetch changes up to 255fc1703e42321b5afdedc8259ad03c7cc533ec:
> 
>   drm/i915/gem: Calculate object page offset for partial memory mapping (2024-08-21 15:28:33 +0200)
> 
> ----------------------------------------------------------------
> UAPI Changes:
> 
> - Limit the number of relocations to INT_MAX (Tvrtko)
> 
>   Only impact should be synthetic tests.
> 
> Driver Changes:
> 
> - Fix for #11396: GPU Hang and rcs0 reset on Cherrytrail platform
> - Fix Virtual Memory mapping boundaries calculation (Andi)
> - Fix for #11255: Long hangs in buddy allocator with DG2/A380 without
>   Resizable BAR since 6.9 (David)
> - Mark the GT as dead when mmio is unreliable (Chris, Andi)
> - Workaround additions / fixes for MTL, ARL and DG2 (John H, Nitin)
> - Enable partial memory mapping of GPU virtual memory (Andi, Chris)
> 
> - Prevent NULL deref on intel_memory_regions_hw_probe (Jonathan, Dan)
> - Avoid UAF on intel_engines_release (Krzysztof)
> 
> - Don't update PWR_CLK_STATE starting Gen12 (Umesh)
> - Code and dmesg cleanups (Andi, Jesus, Luca)
> 
> ----------------------------------------------------------------
> Andi Shyti (6):
>       drm/i915/gem: Adjust vma offset for framebuffer mmap offset
>       drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
>       drm/i915/gem: Improve pfn calculation readability in vm_fault_gtt()
>       drm/i915: Replace double blank with single blank after comma in gem/ and gt/
>       drm/i915/gem: Do not look for the exact address in node
>       drm/i915/gem: Calculate object page offset for partial memory mapping
> 
> Chris Wilson (1):
>       drm/i915/gt: Mark the GT as dead when mmio is unreliable
> 
> David Gow (2):
>       drm/i915: Allow evicting to use the requested placement
>       drm/i915: Attempt to get pages without eviction first
> 
> Jesus Narvaez (1):
>       drm/i915/guc: Change GEM_WARN_ON to guc_err to prevent taints in CI
> 
> John Harrison (2):
>       drm/i915/arl: Enable Wa_14019159160 for ARL
>       drm/i915/guc: Extend w/a 14019159160
> 
> Jonathan Cavitt (1):
>       drm/i915: Allow NULL memory region
> 
> Krzysztof Niemiec (1):
>       drm/i915/gt: Empty uabi engines list during intel_engines_release()
> 
> Luca Coelho (1):
>       drm/i915/gt: remove stray declaration of intel_gt_release_all()
> 
> Nitin Gote (2):
>       drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
>       drm/i915/gt: Add Wa_14019789679
> 
> Tvrtko Ursulin (1):
>       drm/i915: 2 GiB of relocations ought to be enough for anybody*
> 
> Umesh Nerlige Ramappa (1):
>       i915/perf: Remove code to update PWR_CLK_STATE for gen12
> 
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c           | 73 +++++++++++++++++++---
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 13 ++--
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  2 +
>  .../gpu/drm/i915/gt/intel_execlists_submission.c   |  6 +-
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt.h                 |  7 ++-
>  drivers/gpu/drm/i915/gt/intel_gt_types.h           |  2 +
>  drivers/gpu/drm/i915/gt/intel_reset.c              | 12 +++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c        | 16 ++++-
>  drivers/gpu/drm/i915/gt/selftest_migrate.c         |  2 +-
>  drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |  1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         | 18 +++---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  5 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  2 +-
>  drivers/gpu/drm/i915/i915_mm.c                     | 12 +++-
>  drivers/gpu/drm/i915/i915_mm.h                     |  3 +-
>  drivers/gpu/drm/i915/i915_perf.c                   | 33 ----------
>  drivers/gpu/drm/i915/intel_memory_region.c         |  6 +-
>  drivers/gpu/drm/i915/intel_uncore.c                |  7 ++-
>  .../gpu/drm/i915/selftests/intel_memory_region.c   |  2 +-
>  23 files changed, 150 insertions(+), 81 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
