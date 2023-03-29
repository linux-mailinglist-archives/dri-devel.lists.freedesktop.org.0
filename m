Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B190F6CDB58
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 16:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABF210E0EF;
	Wed, 29 Mar 2023 14:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379D110E0EF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 14:00:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3edc2294fb4so8053165e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680098409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zd6sUodV0GA/3NENsHm4OOkO0mkso8KCS3GNceu747I=;
 b=Y6wpceqLkNsDNwtWS5z68og7E+ZAFLYZFGyfMvGE7IBFEIGnjIjPkTkDoxRkGxxZju
 VJMEVTfbK4LYrtcu9H0fvZ+Yw29mrZzi0tFAGaKkuvtt85c9K1RQToij2I5jdo6eT2ZG
 yonGcRW7r5laet9BWR5qr1wAmUmmSOfr888lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680098409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zd6sUodV0GA/3NENsHm4OOkO0mkso8KCS3GNceu747I=;
 b=pFUPm0YTceMtg5/o9yv/tX5N527b6ULQr1CcgcMcMYc5q5eOOBiZIi/OzGqVSAhear
 hQVBM0BfijrU/QSQO7dECnjThRZkJr1EF5e2nfhW2w3wFRUM3DRM25BZHxLa7FOuBrkZ
 NQctDDtsOYiQXbwKM7nb8C/uPS6lfneaeW3IYGTsWzkoxS33kZSpAYVj+xqrXeJo/zR8
 1P2BF45WGGwzEqlvnthYc2L7hzLIP7gVEuu2owhu9+lnMHG2rqSA4DJ5OCYGEVJy3BpV
 ck9HmnPsWQXZIzkD72qQGPqpRTGJwNy+hhFtDWbnRjd+jmYGZ6hkXEtXBxIzgyJI2MiL
 ZsIw==
X-Gm-Message-State: AAQBX9ewFFOqIcaW6GzD8J9RInrbPqg3Ku+OWWZnPdNSUANQQyWJ8UC5
 6siTKyw+nJncWk3u2JJQ5AOBzeszEbznturQpCY=
X-Google-Smtp-Source: AKy350ZZycnuuBsIqoaINeRm6by9vR1tDhnN+yZuWLthGeghQiHBzwEpxJshNql6r4CxCdshgvzL4w==
X-Received: by 2002:a05:600c:3ca8:b0:3ef:7bc5:4e14 with SMTP id
 bg40-20020a05600c3ca800b003ef7bc54e14mr3426569wmb.4.1680098409631; 
 Wed, 29 Mar 2023 07:00:09 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 j10-20020a5d464a000000b002cea8f07813sm30507609wrs.81.2023.03.29.07.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:00:09 -0700 (PDT)
Date: Wed, 29 Mar 2023 16:00:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [pull] drm: dma-fence-deadline for v6.4
Message-ID: <ZCREZz6gjQ56uImo@phenom.ffwll.local>
References: <CAF6AEGt5nDQpa6J86V1oFKPA30YcJzPhAVpmF7N1K1g2N3c=Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGt5nDQpa6J86V1oFKPA30YcJzPhAVpmF7N1K1g2N3c=Zg@mail.gmail.com>
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

On Tue, Mar 28, 2023 at 03:34:02PM -0700, Rob Clark wrote:
> Hi Dave and Daniel,
> 
> Here is the series for dma-fence deadline hint, without driver
> specific patches, or UAPI, with the intent that it can be merged into
> drm-next as well as -driver next trees to enable landing driver
> specific support through their corresponding -next trees.
> 
> The following changes since commit eeac8ede17557680855031c6f305ece2378af326:
> 
>   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline

Thanks for respinnning to unblock this, merged to drm-next. I'll also do
an -rc4 backmerge, so please hold for that if you backmerge yourself.

> 
> for you to fetch changes up to d39e48ca80c0960b039cb38633957f0040f63e1a:
> 
>   drm/atomic-helper: Set fence deadline for vblank (2023-03-28 14:52:59 -0700)
> 
> ----------------------------------------------------------------
> This series adds a deadline hint to fences, so realtime deadlines
> such as vblank can be communicated to the fence signaller for power/
> frequency management decisions.
> 
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
> 
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
> 
> See https://patchwork.freedesktop.org/series/93035/
> 
> This does not yet add any UAPI, although this will be needed in
> a number of cases:
> 
> 1) Workloads "ping-ponging" between CPU and GPU, where we don't
>    want the GPU freq governor to interpret time stalled waiting
>    for GPU as "idle" time
> 2) Cases where the compositor is waiting for fences to be signaled
>    before issuing the atomic ioctl, for example to maintain 60fps
>    cursor updates even when the GPU is not able to maintain that
>    framerate.
> 
> ----------------------------------------------------------------
> Rob Clark (8):
>       dma-buf/dma-fence: Add deadline awareness
>       dma-buf/fence-array: Add fence deadline support
>       dma-buf/fence-chain: Add fence deadline support
>       dma-buf/dma-resv: Add a way to set fence deadline
>       dma-buf/sync_file: Surface sync-file uABI
>       drm/scheduler: Add fence deadline support
>       drm/vblank: Add helper to get next vblank time
>       drm/atomic-helper: Set fence deadline for vblank
> 
>  Documentation/driver-api/dma-buf.rst    | 16 +++++++--
>  drivers/dma-buf/dma-fence-array.c       | 11 ++++++
>  drivers/dma-buf/dma-fence-chain.c       | 12 +++++++
>  drivers/dma-buf/dma-fence.c             | 59 +++++++++++++++++++++++++++++++++
>  drivers/dma-buf/dma-resv.c              | 22 ++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank.c            | 53 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>  include/drm/drm_vblank.h                |  1 +
>  include/drm/gpu_scheduler.h             | 17 ++++++++++
>  include/linux/dma-fence.h               | 22 ++++++++++++
>  include/linux/dma-resv.h                |  2 ++
>  include/uapi/linux/sync_file.h          | 37 +++++++++------------
>  14 files changed, 303 insertions(+), 34 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
