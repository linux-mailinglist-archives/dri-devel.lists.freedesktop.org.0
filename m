Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D8144CD2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9893F6E49D;
	Wed, 22 Jan 2020 08:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199096E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:04:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g17so6205478wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ypO6EP1BEiwzU3+zuRSIKx2BGsSusvZjwJbDURDd2Z0=;
 b=gFmGuGFEKIpIUCgJVQwEGGMot6+7DudkOCdj3HDamCYLGLwHqPcBCVkDmfU0KSeCpP
 TmInGOsL7zNz3DWz9Sdt+SLYYWNsREHpgbW7HkQPtrMtPWOV0kbmisvfv18pjVv6ezAA
 k7sT1s3KsOE5IKugTpbSX9PQiqGQav+oyiKrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ypO6EP1BEiwzU3+zuRSIKx2BGsSusvZjwJbDURDd2Z0=;
 b=DbeO6NnTbUWNHO9sDdhnlbNuyqWeihyiPsni/0Dug/PZ5PAPwNDXpgU5OPII5P26MT
 a8RD/4EzYffkBZSPvvFs+AGZt4/nVCcWfLuuk375qj4/AB3NrmatBlFR1h2rtdqNSoJ3
 9qL5JyG4DfeoqXIN2Aep+wHt2kPbK8zYlYk19P3SrCZ5dXjc7orH6QhmvKQWQUmstbds
 qnIuMsNXnGEsGoQImjI0XWiVR4FQReFwKN8o8b8pHt7tsEU2J3sU5/jXwiz+Ig7+Sh/D
 eZJSsY3OcLaU42zcQhngw+dRLQfJlBZufpegdOeBBKS24pWLdN+DhqBH7lziXOQ9k79R
 C3yQ==
X-Gm-Message-State: APjAAAXD7aHFNB8oDr/cDZjP8XaGSFrI+HoDKfWJNPWR70tRivN8kKkX
 jGUPMYbECFdibPbOyl6oFoMmmw==
X-Google-Smtp-Source: APXvYqxVC11i4HAsWHOzZGfuVk+/6X1v8bE0qkDktJFlfCot5kXsBu6GPZYAkg8p8XfcjKtSqVnyfA==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr9453750wrq.129.1579680256625; 
 Wed, 22 Jan 2020 00:04:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t125sm2910264wmf.17.2020.01.22.00.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:04:15 -0800 (PST)
Date: Wed, 22 Jan 2020 09:04:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] drm: shrinker: Add a prefix on purging logs
Message-ID: <20200122080413.GL43062@phenom.ffwll.local>
References: <20191214162049.10997-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191214162049.10997-1-ezequiel@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 01:20:49PM -0300, Ezequiel Garcia wrote:
> It's not entirely obvious why these messages have
> "info" severity. In any case, add a proper driver prefix
> to give the user a bit of context of where they are coming from.

So the i915 one makes some sense, it's for oom. Which shouldn't happen
often. Then panfrost/msm ones are imo dubious and should be changed to one
of the drm debug ones. Looks like copypasta fail, we might want to change
all of them to drm debugging ones (well maybe keep the i915 one as a drm
info output).
-Daniel

> =

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c     | 2 ++
>  drivers/gpu/drm/msm/msm_gem_shrinker.c           | 2 ++
>  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 2 ++
>  3 files changed, 6 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_shrinker.c
> index 3a926a8755c6..cd0372a1d936 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -4,6 +4,8 @@
>   * Copyright =A9 2008-2015 Intel Corporation
>   */
>  =

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/oom.h>
>  #include <linux/sched/mm.h>
>  #include <linux/shmem_fs.h>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm=
/msm_gem_shrinker.c
> index 722d61668a97..0620d441a2cc 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -4,6 +4,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  =

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>  =

> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/g=
pu/drm/panfrost/panfrost_gem_shrinker.c
> index 458f0fa68111..b9d0e821c3f6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -6,6 +6,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  =

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/list.h>
>  =

>  #include <drm/drm_device.h>
> -- =

> 2.22.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
