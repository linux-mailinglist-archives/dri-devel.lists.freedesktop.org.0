Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5F283C63
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 18:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D692789B7B;
	Mon,  5 Oct 2020 16:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017089B7B;
 Mon,  5 Oct 2020 16:24:34 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id o64so2698218uao.1;
 Mon, 05 Oct 2020 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qBumfCmhAXhY6hDQgspF9hUMTgcwdq6ZvwLFthSZGKg=;
 b=FqgucgTbGuny7Ms/SWPL4HahrbIIvGxOn4Zb1JCVFIdVq4oFzJnG9Lig/ZJD+lJ+s/
 7z5Ew6VOel/j/DPaKaY8Jgffv6XMOZaMxJCjTrMXLNdF2CaHsuCV6nvK9fVzLtPe18k8
 XsJEIS3GSofDUIgLWpDbum1ae6IhdzyjabIq3rnE+7canVicUVSzryoQIQhj5QzGc8/m
 J+al3GNCZWv8cH4ug3+omqfo0SzAMOuN5lczBQb+eteSlN2bQlPdPGD+y9JpdQEkaLDX
 pbE9eKwoz5hm3AFBibyPly+JHhDSawWQRCUH6CC/4UWeVpIl2mI4uoiI3KNB/AlGrQLL
 wzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qBumfCmhAXhY6hDQgspF9hUMTgcwdq6ZvwLFthSZGKg=;
 b=d3PbxSThg3hQS1QGgPzVwWv5iIhcWn2mFDEj3hcCfigTJ4IPkbLNdhlGLfwc1+WF47
 e0VmRGEz4RDelZMF6zptro2ELC83jguOOcX9Z1iIsF9cbTM8kAQwCZ1EMA6brB97wT/9
 PJGGjCmrl5+F1/chuuzZpoxTgLkR6UXZ1lT/5S8UbFDyxGexgjN5l7cro5NTrVSpYN+W
 57ZXu1LS5IqujnWPjnXEDigJkejMhps99IEczltX/INkTtAfjmIYLNfWyToMUkvoL7+c
 ladnCE2ehckQQvma96m0cikhKOy2GxYSAx1ve7Nf3MGA9k+dduTiunmSGEzFs07flr3R
 FT3g==
X-Gm-Message-State: AOAM530cBgDjJCBYIDV6XbAfbFMPdFnAcCme2rEiUzi3aKahz4Yfx6vP
 9V50L2oNGOYsFBxtR1+ASA3pcslFcH3yWJ2HYbQ=
X-Google-Smtp-Source: ABdhPJznyMapjDMGbUJSAUPrB5hWXc5IE1Vq0Zi5rWJZl03TsE1S3clOeekLVUiAwcemyucFJg5Cj3CY5Fd3yEzo76Y=
X-Received: by 2002:a9f:3f46:: with SMTP id i6mr449424uaj.31.1601915072945;
 Mon, 05 Oct 2020 09:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Mon, 5 Oct 2020 18:24:21 +0200
Message-ID: <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 00/14] drm/msm: de-struct_mutex-ification
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Emil Velikov <emil.velikov@collabora.com>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
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

What a great patch set. Daniel has some good points and nothing that
requires big changes, but on the other hand, I'm not sure it's
something that needs to block this set either.

Either way, for the series

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Rob Clark (14):
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
>   drm/msm: remove msm_gem_free_work
>   drm/msm: drop struct_mutex in madvise path
>   drm/msm: Drop struct_mutex in shrinker path
>   drm/msm: Don't implicit-sync if only a single ring
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
>  drivers/gpu/drm/msm/msm_debugfs.c         |  7 ++
>  drivers/gpu/drm/msm/msm_drv.c             | 15 +---
>  drivers/gpu/drm/msm/msm_drv.h             | 19 +++--
>  drivers/gpu/drm/msm/msm_gem.c             | 76 ++++++------------
>  drivers/gpu/drm/msm/msm_gem.h             | 53 +++++++++----
>  drivers/gpu/drm/msm/msm_gem_shrinker.c    | 58 ++------------
>  drivers/gpu/drm/msm/msm_gem_submit.c      | 17 ++--
>  drivers/gpu/drm/msm/msm_gpu.c             | 96 ++++++++++++++---------
>  drivers/gpu/drm/msm/msm_gpu.h             |  5 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c      |  3 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h      | 13 ++-
>  14 files changed, 188 insertions(+), 194 deletions(-)
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
