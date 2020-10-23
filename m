Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBC296D34
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 12:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31F96E4F9;
	Fri, 23 Oct 2020 10:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDD06E4F9;
 Fri, 23 Oct 2020 10:58:22 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u7so602690vsq.11;
 Fri, 23 Oct 2020 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItpYQ9GC5N7T8BIaRPk6eDBkbaLNrhafp2hlkR07Zf8=;
 b=UWCMKvB22GNLPgs/wI1WMvtJJWWyCwl5uYR5/+GlTMTjEXFJELvwTkGow1zPIG31qj
 5owmCXqTsL5+giHkxsK0gu7nxaD9rL6MAxrU9aoPPHSUErOmQ1byFpAdhPywSz46Rf1R
 il793oELbdCqICbPhyEHegwwP7QeNl4SysPX035uiWDlK/w5X4MGYvYYjwrMKHQ+QL0w
 CYTHoxTDcFsTmnKYHb3jJ0uwYRFi1tkB5Y2lhIFNN2dHLD1uPIbzV3sp0H2IUXDx/V9t
 CgZ5R4ScrCUewwPHap8Vj6iRKJjkvjkwFncidFOZUGR/Do5bHy8oSM3ikMqlkpwVkLLc
 FQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItpYQ9GC5N7T8BIaRPk6eDBkbaLNrhafp2hlkR07Zf8=;
 b=f3RNkmOOI/MFA8QA7xaxETcPYDY1024W6UX3Ez8NN3cYQBTxP/p8E0SBY50ZlbfpEF
 oiFTvzhtPLPFPRkZXau+i+eE3468vkM7yRUCGWoRkn4Jue9NAFAPP5ywrYxbtsr9eKI1
 TpN1EaBjmBeq1572sMP4S2+y5My64lmVdkhVPqQfd7nuVieo62267+yxW5NxjfasURP+
 9LN0SNHNpX1/GjJDFraW7FcBad7jpPhGcdHYQ59FPfIRhA1fOxpTSUh0IjT218BElPQd
 bK0kvuvxkLHhTpI4zjFrmCpTN1WY9N2iiI3LA+EM9Z1xzQQ8wOuFFfZSSwboprZR9JAq
 DM6w==
X-Gm-Message-State: AOAM530xwoWemENots9WjfhRtC3ubayxoHa8vzWSY7pSS4rwgTTA/U4u
 EnZiXfJAM7oPHA6nK3KLyCyo4hoiEP8GZWpLOq1JJ2o4ZRuwGxEa
X-Google-Smtp-Source: ABdhPJzRCu5YBLYYbZrfyB1lNhHvs2A3xuz04HFQccRe3INHBEU4kBKApK9853f5c1kF9RhQUXPegvd1h6khtJJrJuU=
X-Received: by 2002:a05:6102:31b5:: with SMTP id
 d21mr796747vsh.19.1603450701006; 
 Fri, 23 Oct 2020 03:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201019204636.139997-1-robdclark@gmail.com>
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Fri, 23 Oct 2020 12:58:09 +0200
Message-ID: <CAOeoa-fAkNGfCbmZ-nBaYyupFV4Eo8fc7pKimaWtPhczmK4h3Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 00/23] drm/msm: de-struct_mutex-ification
To: Rob Clark <robdclark@gmail.com>
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Matthias Kaehlcke <mka@chromium.org>, Thierry Reding <treding@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Brian Masney <masneyb@onstation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 10:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This doesn't remove *all* the struct_mutex, but it covers the worst
> of it, ie. shrinker/madvise/free/retire.  The submit path still uses
> struct_mutex, but it still needs *something* serialize a portion of
> the submit path, and lock_stat mostly just shows the lock contention
> there being with other submits.  And there are a few other bits of
> struct_mutex usage in less critical paths (debugfs, etc).  But this
> seems like a reasonable step in the right direction.
>
> v2: teach lockdep about shrinker locking patters (danvet) and
>     convert to obj->resv locking (danvet)
> v3: fix get_vaddr locking for legacy userspace (relocs), devcoredump,
>     and rd/hangrd

For the series:

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Rob Clark (23):
>   drm/msm: Fix a couple incorrect usages of get_vaddr_active()
>   drm/msm/gem: Add obj->lock wrappers
>   drm/msm/gem: Rename internal get_iova_locked helper
>   drm/msm/gem: Move prototypes to msm_gem.h
>   drm/msm/gem: Add some _locked() helpers
>   drm/msm/gem: Move locking in shrinker path
>   drm/msm/submit: Move copy_from_user ahead of locking bos
>   drm/msm: Do rpm get sooner in the submit path
>   drm/msm/gem: Switch over to obj->resv for locking
>   drm/msm: Use correct drm_gem_object_put() in fail case
>   drm/msm: Drop chatty trace
>   drm/msm: Move update_fences()
>   drm/msm: Add priv->mm_lock to protect active/inactive lists
>   drm/msm: Document and rename preempt_lock
>   drm/msm: Protect ring->submits with it's own lock
>   drm/msm: Refcount submits
>   drm/msm: Remove obj->gpu
>   drm/msm: Drop struct_mutex from the retire path
>   drm/msm: Drop struct_mutex in free_object() path
>   drm/msm: Remove msm_gem_free_work
>   drm/msm: Drop struct_mutex in madvise path
>   drm/msm: Drop struct_mutex in shrinker path
>   drm/msm: Don't implicit-sync if only a single ring
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |   6 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  12 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   1 +
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c        |   1 +
>  drivers/gpu/drm/msm/msm_debugfs.c         |   7 +
>  drivers/gpu/drm/msm/msm_drv.c             |  21 +-
>  drivers/gpu/drm/msm/msm_drv.h             |  73 +-----
>  drivers/gpu/drm/msm/msm_fbdev.c           |   1 +
>  drivers/gpu/drm/msm/msm_gem.c             | 266 +++++++++++-----------
>  drivers/gpu/drm/msm/msm_gem.h             | 133 +++++++++--
>  drivers/gpu/drm/msm/msm_gem_shrinker.c    |  81 ++-----
>  drivers/gpu/drm/msm/msm_gem_submit.c      | 158 ++++++++-----
>  drivers/gpu/drm/msm/msm_gpu.c             | 110 +++++----
>  drivers/gpu/drm/msm/msm_gpu.h             |   5 +-
>  drivers/gpu/drm/msm/msm_rd.c              |   2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c      |   3 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |  13 +-
>  19 files changed, 495 insertions(+), 405 deletions(-)
>
> --
> 2.26.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
