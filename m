Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8957CD652
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 10:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94910E3BD;
	Wed, 18 Oct 2023 08:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D353D10E3BF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 08:24:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4053e6e8ca7so20342275e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697617471; x=1698222271; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YI2n2/kdV9gZtnXpvHYirQtkHxP4ZQY6jpEljQ4a4q4=;
 b=ksP7hT1RQeR+QA4oTo0YdysHp3xfezUdrqEfdcXo2KWwtA5go2z0uhBDqPN2mcBCGN
 SdkLx3cqA8KLNQ7ilO71s5LmFUeRN1Kw8XnI56j7vu2iTIr2s5C0I8hErGEwruxKvxhe
 3IYMJyq3rl7czvt4QfDHT8WOn+bbFUJO0OI54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697617471; x=1698222271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YI2n2/kdV9gZtnXpvHYirQtkHxP4ZQY6jpEljQ4a4q4=;
 b=PwRw5KPdk4BeUTH50LL0P48cg3K5teXz0FPsh14Ej7Un0Slm1WoM3Ptv9+RLtZZ/AE
 lF6J0Hu2fEB258IVoPWOj47ajv7OhJ5/+UIpz5SuekBBsLaShfjH2VkaUW2BslraR2yi
 kOmmdk6+Eg//3kjPkbFKq00ATS0jOAOwQjjPiDEsHqsQzl6GS0i7SFScueLzvtYp+w4k
 2y7W0LAAppyM2oy1Vofz5c6PCB8QAHRMBaCi80by3R/SdgHR45H21GkSvP8/SQcGXVyC
 uFf7TIbpEGWMFAOJSFcFNNLcvleMhm3eKLvQb5oreTEIfFxTaobairwqCNjeis+MGqON
 si2g==
X-Gm-Message-State: AOJu0YwXOZYbywVJe3QRAh3TZx8KsnTDUjjxKnacOZP44c9tiNAdRsUF
 uIAqJcLkavlo0nxZhQ5omvJWGg==
X-Google-Smtp-Source: AGHT+IHTXvx3gn++LC22QzXLjrbpxz35c0lViOcFQz/ItbvQke/glv9xI+MZ239tskIcePKCWsV7vw==
X-Received: by 2002:a05:6000:1284:b0:32d:c312:49af with SMTP id
 f4-20020a056000128400b0032dc31249afmr3464276wrx.6.1697617471183; 
 Wed, 18 Oct 2023 01:24:31 -0700 (PDT)
Received: from dvetter-linux.ger.corp.intel.com
 (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4712000000b0031984b370f2sm1544779wrq.47.2023.10.18.01.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 01:24:30 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:24:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v6 0/7] DRM scheduler changes for Xe
Message-ID: <ZS+WPAxgPlwj/Hug@dvetter-linux.ger.corp.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017150958.838613-1-matthew.brost@intel.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 6.3.8-200.fc38.x86_64 
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 lina@asahilina.net, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 08:09:51AM -0700, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver. Based on drm-tip branch.
> 
> A follow up series will be posted to address some of dakr requets for
> kernel doc changes.

I think it'd be really good to include the doc improved in this series.
drm/sched is one of the least documented parts of drm, and has some of the
trickiest sharp corners. We really should be documenting these as
consensus around how things work and as features get added.

I think it would also be really awesome if someone goes through all the
interfaces and adds docs for what we already have. That's probably for
later, but I think really needed to make sure the docs are somewhat
consistent (things like the api includ scaffolding, or having the code
related pieces all pushed to the .c files as DOC: comments and all these
things otherwise tend to end up a bit more chaotic than needed).

Cheers, Sima

> 
> v2:
>  - Break run job, free job, and process message in own work items
>  - This might break other drivers as run job and free job now can run in
>    parallel, can fix up if needed
> 
> v3:
>  - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>  - Fix issue with setting timestamp to early
>  - Don't dequeue jobs for single entity after calling entity fini
>  - Flush pending jobs on entity fini
>  - Add documentation for entity teardown
>  - Add Matthew Brost to maintainers of DRM scheduler
> 
> v4:
>  - Drop message interface
>  - Drop 'Flush pending jobs on entity fini'
>  - Drop 'Add documentation for entity teardown'
>  - Address all feedback
> 
> v5:
>  - Address Luben's feedback
>  - Drop starting TDR after calling run_job()
>  - Drop adding Matthew Brost to maintainers of DRM scheduler
> 
> v6:
>  - Address Luben's feedback
>  - Include base commit
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/116055/
> 
> 
> Matthew Brost (7):
>   drm/sched: Add drm_sched_wqueue_* helpers
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Move schedule policy to scheduler
>   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>   drm/sched: Split free_job into own work item
>   drm/sched: Add drm_sched_start_timeout_unlocked helper
>   drm/sched: Add a helper to queue TDR immediately
> 
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |  85 ++-
>  drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 507 ++++++++++++------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>  include/drm/gpu_scheduler.h                   |  48 +-
>  14 files changed, 498 insertions(+), 234 deletions(-)
> 
> 
> base-commit: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
