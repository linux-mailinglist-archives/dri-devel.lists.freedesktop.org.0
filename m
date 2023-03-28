Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73626CC905
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7330A10E964;
	Tue, 28 Mar 2023 17:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFF110E976
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:19:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m2so13004276wrh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680023945; x=1682615945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8CEFb/6ljqv0Fv1r/OeZskoxzQlU5xekSpKw1g2pQE4=;
 b=hMYpA7w+6Zs+wLLU/q7pMiuwTJ3o+27naY51JYKI9ZJo7gHyIB0eqvMhvk3P+za3L3
 FJMKmHdn/N7NUnODCooPub17CNS+DBz2qnUtkLrHjVCcMOCEJgH0Yb4/E6t2kp3p1+wi
 ury8U5BriCcBD0h0qDtjKP1REeKT/SzUnJ+EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680023945; x=1682615945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CEFb/6ljqv0Fv1r/OeZskoxzQlU5xekSpKw1g2pQE4=;
 b=nNfCYoOsFvCx4nI2hiOaJiugna0yyqBDGq0bHc0aNwisoN0h0U6WgJbZRnjZaROXDw
 OBBx8AsqQi2m1Gu7uuMg9Ad2MIwSrgUvbusOmLeKcQRKlHQY10IArNqY/qtBnkWDjknR
 ImwZsNOAGRkvoUI78rPav3w8zfzcbgTcSkQhvhc/6yS3PimR72Z6QcUNJjdEc6Wh+HIq
 Z9x1zeAIOfEBEoZ/x8dVGjzZ0eAFF1nTF1DftGbJEKBjNdTh1rqIY8mt4j4yNrlpz036
 eWebh+SGcIquCERFAkoVGL1x/0RHfo9leVNvUyUHZFiltbJ1DY0cdcaKv5hhhcu3NhHH
 8kdQ==
X-Gm-Message-State: AAQBX9epMCAgOwOFfXwgys7b8TkbBIrqdeJzJQf9+2UvGXbtGjBbldk8
 A9wohwakUvabdjnEKJb0SHPK9w==
X-Google-Smtp-Source: AKy350avfF+UZiH6DqiVcBZXg7CuA3X4T+9mTl5fIVL5TjkJ/DjswYmLF+gVmMU06n3hnyTd7gCrHw==
X-Received: by 2002:a5d:464b:0:b0:2cf:e2cc:275a with SMTP id
 j11-20020a5d464b000000b002cfe2cc275amr9065668wrs.5.1680023945211; 
 Tue, 28 Mar 2023 10:19:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d4dcb000000b002cfe3f842c8sm27851410wru.56.2023.03.28.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:19:03 -0700 (PDT)
Date: Tue, 28 Mar 2023 19:19:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [pull] drm: dma-fence-deadline-core for v6.4
Message-ID: <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
References: <CAF6AEGvoP9_FERdL6U8S2O-BVt-oAUgAytbE6RvygsoAOwOHvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvoP9_FERdL6U8S2O-BVt-oAUgAytbE6RvygsoAOwOHvw@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 25, 2023 at 11:24:56AM -0700, Rob Clark wrote:
> Hi Dave and Daniel,
> 
> Here is the series for dma-fence deadline hint, without driver
> specific patches, with the intent that it can be merged into drm-next
> as well as -driver next trees to enable landing driver specific
> support through their corresponding -next trees.
> 
> The following changes since commit eeac8ede17557680855031c6f305ece2378af326:
> 
>   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline-core
> 
> for you to fetch changes up to 0bcc8f52a8d9d1f9cd5af7f88c6599a89e64284a:
> 
>   drm/atomic-helper: Set fence deadline for vblank (2023-03-25 10:55:08 -0700)

Ok apparently there's only igts for the sync_file uabi and the only only
userspace for syncobj is the mesa mr that is still under discussion :-/

Yes I know there's a clearly established need for something like this, but
also in drm we don't merge conjectured uabi. Especially with tricky stuff
that's meant to improve best effort performance/tuning problems, where you
really have to benchmark the entire thing and make sure you didn't screw
up some interaction.

To make sure this isn't stuck another full cycle, is there a way to wittle
this just down to the kms atomic flip boosting parts? That way we could at
least start landing the core&driver bits ...
-Daniel

> 
> ----------------------------------------------------------------
> Immutable branch with dma-fence deadline hint support between drm-next
> and driver -next trees.
> 
> ----------------------------------------------------------------
> Rob Clark (11):
>       dma-buf/dma-fence: Add deadline awareness
>       dma-buf/fence-array: Add fence deadline support
>       dma-buf/fence-chain: Add fence deadline support
>       dma-buf/dma-resv: Add a way to set fence deadline
>       dma-buf/sync_file: Surface sync-file uABI
>       dma-buf/sync_file: Add SET_DEADLINE ioctl
>       dma-buf/sw_sync: Add fence deadline support
>       drm/scheduler: Add fence deadline support
>       drm/syncobj: Add deadline support for syncobj waits
>       drm/vblank: Add helper to get next vblank time
>       drm/atomic-helper: Set fence deadline for vblank
> 
>  Documentation/driver-api/dma-buf.rst    | 16 ++++++-
>  drivers/dma-buf/dma-fence-array.c       | 11 +++++
>  drivers/dma-buf/dma-fence-chain.c       | 12 +++++
>  drivers/dma-buf/dma-fence.c             | 60 ++++++++++++++++++++++++
>  drivers/dma-buf/dma-resv.c              | 22 +++++++++
>  drivers/dma-buf/sw_sync.c               | 81 +++++++++++++++++++++++++++++++++
>  drivers/dma-buf/sync_debug.h            |  2 +
>  drivers/dma-buf/sync_file.c             | 19 ++++++++
>  drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++
>  drivers/gpu/drm/drm_syncobj.c           | 64 ++++++++++++++++++++------
>  drivers/gpu/drm/drm_vblank.c            | 53 +++++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>  include/drm/drm_vblank.h                |  1 +
>  include/drm/gpu_scheduler.h             | 17 +++++++
>  include/linux/dma-fence.h               | 22 +++++++++
>  include/linux/dma-resv.h                |  2 +
>  include/uapi/drm/drm.h                  | 17 +++++++
>  include/uapi/linux/sync_file.h          | 59 +++++++++++++++---------
>  19 files changed, 496 insertions(+), 47 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
