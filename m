Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB6382FE3
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB286E988;
	Mon, 17 May 2021 14:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E886E98F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:20:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so2108643wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qatGReyEGvb3id3L6Fo5pFkW8h6Idre0J15T6NNKCNg=;
 b=WdVJlqxNsy4yFridaoe9XHyI//s6JmNUS4dy2oQVDnN0dBvylaZvjMD4Z+3V+AG4jA
 iEJTlAjifYpRj102tk2KE9Vi7B8Gs3I299TNUQEJL84ndji9q/wtj+uZX7f1472GAJVZ
 ugOAfH1FVlIqVKFarsbGzmCmdFNvEUPnr/XKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qatGReyEGvb3id3L6Fo5pFkW8h6Idre0J15T6NNKCNg=;
 b=lTSaE1xBsk3JKt0ltQaUy6I2jxNas21d+ua6yBLqH2b5ig/qzgKeXkmGRCiVE+u1RC
 +qAeWIXVlEQZUBCHuaReaL0FMUj//XQ9PfjX5LPdOMijdd5vkbea6PToBKNHEruMW5CT
 XeZQMsolAi5rZ4ky3VJMNEfj745zYaovRfgraTEM/jAwD8ifNP5JOcg/vA6LYpfy49qB
 IqDAyG0EBR8wj6pDXzuIuKoUWUfAgoHB9DJaPmyMKXU/xqyISzIPyunUzpTg8nq3vc1H
 969G19TM2FRBQxP+JNIZlih+1qcbPmcyFJJg3ZVaDCPhbrlmgIZxZ4WUA9fUa6slF8T5
 +HVQ==
X-Gm-Message-State: AOAM530cQs8GP1D+AREAuF+Ch3/VmmUcggqYp5CX/Ueis5ceGiPT3iQp
 8dpCC8/T7ogO2VCmDTy6ofbaTQ==
X-Google-Smtp-Source: ABdhPJx0ORpazumalVHws4W655cliAYLvGV+NgXnzj5XCHaLy+foLRsNijtegEYI5VN/pyr48JyOSA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr181944wmh.69.1621261237370;
 Mon, 17 May 2021 07:20:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f4sm18076863wrz.33.2021.05.17.07.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:20:36 -0700 (PDT)
Date: Mon, 17 May 2021 16:20:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
Message-ID: <YKJ7spuNLzsv5SG3@phenom.ffwll.local>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 11:48:08AM -0400, Alex Deucher wrote:
> On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > Resurrect of the previosuly merged per client engine busyness patches. In a
> > nutshell it enables intel_gpu_top to be more top(1) like useful and show not
> > only physical GPU engine usage but per process view as well.
> >
> > Example screen capture:
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > intel-gpu-top -  906/ 955 MHz;    0% RC6;  5.30 Watts;      933 irqs/s
> >
> >       IMC reads:     4414 MiB/s
> >      IMC writes:     3805 MiB/s
> >
> >           ENGINE      BUSY                                      MI_SEMA MI_WAIT
> >      Render/3D/0   93.46% |████████████████████████████████▋  |      0%      0%
> >        Blitter/0    0.00% |                                   |      0%      0%
> >          Video/0    0.00% |                                   |      0%      0%
> >   VideoEnhance/0    0.00% |                                   |      0%      0%
> >
> >   PID            NAME  Render/3D      Blitter        Video      VideoEnhance
> >  2733       neverball |██████▌     ||            ||            ||            |
> >  2047            Xorg |███▊        ||            ||            ||            |
> >  2737        glxgears |█▍          ||            ||            ||            |
> >  2128           xfwm4 |            ||            ||            ||            |
> >  2047            Xorg |            ||            ||            ||            |
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Internally we track time spent on engines for each struct intel_context, both
> > for current and past contexts belonging to each open DRM file.
> >
> > This can serve as a building block for several features from the wanted list:
> > smarter scheduler decisions, getrusage(2)-like per-GEM-context functionality
> > wanted by some customers, setrlimit(2) like controls, cgroups controller,
> > dynamic SSEU tuning, ...
> >
> > To enable userspace access to the tracked data, we expose time spent on GPU per
> > client and per engine class in sysfs with a hierarchy like the below:
> >
> >         # cd /sys/class/drm/card0/clients/
> >         # tree
> >         .
> >         ├── 7
> >         │   ├── busy
> >         │   │   ├── 0
> >         │   │   ├── 1
> >         │   │   ├── 2
> >         │   │   └── 3
> >         │   ├── name
> >         │   └── pid
> >         ├── 8
> >         │   ├── busy
> >         │   │   ├── 0
> >         │   │   ├── 1
> >         │   │   ├── 2
> >         │   │   └── 3
> >         │   ├── name
> >         │   └── pid
> >         └── 9
> >             ├── busy
> >             │   ├── 0
> >             │   ├── 1
> >             │   ├── 2
> >             │   └── 3
> >             ├── name
> >             └── pid
> >
> > Files in 'busy' directories are numbered using the engine class ABI values and
> > they contain accumulated nanoseconds each client spent on engines of a
> > respective class.
> 
> We did something similar in amdgpu using the gpu scheduler.  We then
> expose the data via fdinfo.  See
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1774baa64f9395fa884ea9ed494bcb043f3b83f5
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=874442541133f78c78b6880b8cc495bab5c61704

Yeah the reason I've dropped these patches was because they looked like
prime material for at least a bit of standardization across drivers.

Also fdinfo sounds like very good interface for these, I didn't even know
that's doable. Might also be interesting to even standardize the fdinfo
stuff across drivers.

Also since drm/i915 will adopt drm/scheduler, we could build that on top
of that code too. So no restrictions there from i915 side.

Anyway discussion kicked off, I'll let yout figure out what we'll do here.
-Daniel

> 
> Alex
> 
> 
> >
> > Tvrtko Ursulin (7):
> >   drm/i915: Expose list of clients in sysfs
> >   drm/i915: Update client name on context create
> >   drm/i915: Make GEM contexts track DRM clients
> >   drm/i915: Track runtime spent in closed and unreachable GEM contexts
> >   drm/i915: Track all user contexts per client
> >   drm/i915: Track context current active time
> >   drm/i915: Expose per-engine client busyness
> >
> >  drivers/gpu/drm/i915/Makefile                 |   5 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++-
> >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
> >  drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
> >  drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
> >  drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
> >  .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
> >  .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
> >  drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
> >  drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
> >  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
> >  drivers/gpu/drm/i915/i915_drm_client.c        | 365 ++++++++++++++++++
> >  drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
> >  drivers/gpu/drm/i915/i915_drv.c               |   6 +
> >  drivers/gpu/drm/i915/i915_drv.h               |   5 +
> >  drivers/gpu/drm/i915/i915_gem.c               |  21 +-
> >  drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +-
> >  drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
> >  drivers/gpu/drm/i915/i915_sysfs.c             |   8 +
> >  19 files changed, 716 insertions(+), 81 deletions(-)
> >  create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
> >  create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
> >
> > --
> > 2.30.2
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
