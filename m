Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CEA3EA6CB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 16:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7482C6E40D;
	Thu, 12 Aug 2021 14:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38856E40D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 14:49:50 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 y14-20020a4acb8e0000b029028595df5518so1859206ooq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVkifOaP3K80Xt6f+SofaTJpFviJzMqV3znDYgObX2Y=;
 b=TGX9ILMfODFhlubNNODiUHZJd4n4pl8tAN3JkQQrms6z331ol/JMVwbOPgyIzThIy4
 T/1ITYVaoLkmiw5517oHrYgVz08dRCX0YVww6NPkdLQ79ctRq5by3ZB67AhLDvCdwxwh
 5y/D6mHg5GYr7kJtLLjoJIVdNFz9hs/5Gdu78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVkifOaP3K80Xt6f+SofaTJpFviJzMqV3znDYgObX2Y=;
 b=Gzr+f+8GzkHrABnaOdKK+C5i2Ms0te2aCKyswzMGDmfycZvPy8rbSs7hLVUZxYPsp0
 xI3yAaeZRDS7H0n3m8TBn1tn+PpA25uwnxoCD8NH1koLEM9bHncyaG3YAB2DTmS1BxvC
 acvK3dB2Wxl2Xhin0oJhNMHYN1+KIRyriPZ4krBrJuFPwJTz5xRWUSr1YhUMfkRRp35W
 qu/AHFxahq/OoBNur8P0nFHxh//rvtJ29PB+aP7J2QI6DYQw8RM8qq3/akb7bXqdX54E
 g6CJ03QVTxCzdn4fTYGYehoa8UcUiftcRKYcpsTYVoGnRtwLNh0JYkztROetf6Pr6rod
 ouhg==
X-Gm-Message-State: AOAM533/kd2oY28h56reALK8q0ujhyVtRru9K+8iLQ0leknLdlZik8mw
 3r095iG53iYmmEvaRVBCE56GFrqka1VP1QOozxSUVw==
X-Google-Smtp-Source: ABdhPJz9COTt8yFv4jZ73owkw+LEgbbFwyAZDbExechLjb9f3jLOKYotwiwXb31RVR6hXYS1gF0oXVpFliAa04k7leg=
X-Received: by 2002:a4a:b006:: with SMTP id f6mr1699214oon.85.1628779789999;
 Thu, 12 Aug 2021 07:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210812124452.622233-1-maarten.lankhorst@linux.intel.com>
 <20210812124452.622233-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210812124452.622233-2-maarten.lankhorst@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 12 Aug 2021 16:49:39 +0200
Message-ID: <CAKMK7uGMqYbiqZqV4gUy1KMbBCX=ZAGf-vT69SP9LbZU3hcSiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: Add pci ids and uapi for DG1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Aug 12, 2021 at 2:44 PM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> DG1 has support for local memory, which requires the usage of the
> lmem placement extension for creating bo's, and memregion queries
> to obtain the size. Because of this, those parts of the uapi are
> no longer guarded behind FAKE_LMEM.
>
> According to the pull request referenced below, mesa should be mostly
> ready for DG1. VK_EXT_memory_budget is not hooked up yet, but we
> should definitely just enable the uapi parts by default.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> References: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11584
> Cc: Jordan Justen jordan.l.justen@intel.com
> Cc: Jason Ekstrand jason@jlekstrand.net

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 3 ---
>  drivers/gpu/drm/i915/i915_pci.c            | 1 +
>  drivers/gpu/drm/i915/i915_query.c          | 3 ---
>  3 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 23fee13a3384..1d341b8c47c0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -347,9 +347,6 @@ static int ext_set_placements(struct i915_user_extension __user *base,
>  {
>         struct drm_i915_gem_create_ext_memory_regions ext;
>
> -       if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
> -               return -ENODEV;
> -
>         if (copy_from_user(&ext, base, sizeof(ext)))
>                 return -EFAULT;
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 1bbd09ad5287..93ccdc6bbd03 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1115,6 +1115,7 @@ static const struct pci_device_id pciidlist[] = {
>         INTEL_RKL_IDS(&rkl_info),
>         INTEL_ADLS_IDS(&adl_s_info),
>         INTEL_ADLP_IDS(&adl_p_info),
> +       INTEL_DG1_IDS(&dg1_info),
>         {0, 0, 0}
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index e49da36c62fb..5e2b909827f4 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -432,9 +432,6 @@ static int query_memregion_info(struct drm_i915_private *i915,
>         u32 total_length;
>         int ret, id, i;
>
> -       if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
> -               return -ENODEV;
> -
>         if (query_item->flags != 0)
>                 return -EINVAL;
>
> --
> 2.32.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
