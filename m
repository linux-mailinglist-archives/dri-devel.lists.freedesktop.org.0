Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015B25BB8B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 09:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55D26E193;
	Thu,  3 Sep 2020 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CB76E18E;
 Thu,  3 Sep 2020 07:23:20 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id c25so570826vkm.1;
 Thu, 03 Sep 2020 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYtPH/AGq9Arqr6Pnj4bZq+KucnVkSWBPEySgVn+z48=;
 b=kVliyIbaEUKHfO4xZWqE+52p0FTfiE73C1Dhz7+J11EpmW05Vb4VZ9f4Qt+b2O4RHN
 IR+F8tMYHxguugL1aOXsWLv8yr6I7M8o2IGDxbg8NzVxaLhqOvInhfgdoNU+CO34B04p
 6UbNDtk/pPVbYhltWMeUM5bw5lnIk5Vmyp+HBE56MA6P29Ab2sBk6o8LCbGVlCLgwa9Z
 rDEhVIkbMKT6QqWek8lH2lC6kPXb0KhWvjfEs2AQdOEbpPjmaFtbQLSq20Tag+zYGwPo
 kyNgK7uZboEjdcTmaC9mJ5aNksjusZgvbZxTYbPXPtcqmfnXemtqxdUmkToKhzphuLGf
 FyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYtPH/AGq9Arqr6Pnj4bZq+KucnVkSWBPEySgVn+z48=;
 b=oeH1ACkkiBiVU0ofuFyI0a0OyiFhu8VFzfaxoyE7rx1x+vDugymW70Vnn9mdEOI0CO
 h2Y3t1hTvs714SEqdV5l9jVHFFjuLsDZIDMDH5BwC+0lN5fcGQzMOhcQO/kuEk8pD5CZ
 tmzu+7VYSsef2pAu46UsRV8jIsnYLSM6HMlNNFWYnipwe9sPIhWAjfLcHne0u42qAcTN
 F7P39PMqVN5nydgdbnl3AQG2JnP6AL0Nk+vZDbvLOd9C1XBkl5X3Im3lLDR9Jh4Xbt9A
 eFxOUciwKulIBMTAj9PS9IU1MhqIbx+eLruxAmNYauICdegXfNu27ysjnbz09qKHk8bY
 IU/A==
X-Gm-Message-State: AOAM532Y91hIC7gQ54AMAIrwugI7xXaIJkM5JBPelRjL8eGxvZae277z
 RJw8zemJM8X8w3kUMGpyRxulTIoDDhYre9g6tWc=
X-Google-Smtp-Source: ABdhPJzkeFXIQzqDgqXC99kkdDPH3UnC8CAmw5bH+NsVf2nsqOvneLOy0x2VfmXMLS2U68g+CkWma2gKwfqEGyfNlCs=
X-Received: by 2002:a1f:2a48:: with SMTP id q69mr774030vkq.69.1599117799327;
 Thu, 03 Sep 2020 00:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154200.2451899-1-robdclark@gmail.com>
 <20200901154200.2451899-3-robdclark@gmail.com>
In-Reply-To: <20200901154200.2451899-3-robdclark@gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Thu, 3 Sep 2020 00:23:08 -0700
Message-ID: <CAOeoa-cbQv2pkpxhXMV++NY3MbouPP077UVPnp7fu3zjFxt8Uw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm: Convert shrinker msgs to
 tracepoints
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 8:41 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This reduces the spam in dmesg when we start hitting the shrinker, and
> replaces it with something we can put on a timeline while profiling or
> debugging system issues.

That is a good solution,

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +++--
>  drivers/gpu/drm/msm/msm_gpu_trace.h    | 26 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 722d61668a97..482576d7a39a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -6,6 +6,7 @@
>
>  #include "msm_drv.h"
>  #include "msm_gem.h"
> +#include "msm_gpu_trace.h"
>
>  static bool msm_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
>  {
> @@ -87,7 +88,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>                 mutex_unlock(&dev->struct_mutex);
>
>         if (freed > 0)
> -               pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
> +               trace_msm_gem_purge(freed << PAGE_SHIFT);
>
>         return freed;
>  }
> @@ -123,7 +124,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>         *(unsigned long *)ptr += unmapped;
>
>         if (unmapped > 0)
> -               pr_info_ratelimited("Purging %u vmaps\n", unmapped);
> +               trace_msm_gem_purge_vmaps(unmapped);
>
>         return NOTIFY_DONE;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index 07572ab179fa..1079fe551279 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -114,6 +114,32 @@ TRACE_EVENT(msm_gmu_freq_change,
>                 TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
>  );
>
> +
> +TRACE_EVENT(msm_gem_purge,
> +               TP_PROTO(u32 bytes),
> +               TP_ARGS(bytes),
> +               TP_STRUCT__entry(
> +                       __field(u32, bytes)
> +                       ),
> +               TP_fast_assign(
> +                       __entry->bytes = bytes;
> +                       ),
> +               TP_printk("Purging %u bytes", __entry->bytes)
> +);
> +
> +
> +TRACE_EVENT(msm_gem_purge_vmaps,
> +               TP_PROTO(u32 unmapped),
> +               TP_ARGS(unmapped),
> +               TP_STRUCT__entry(
> +                       __field(u32, unmapped)
> +                       ),
> +               TP_fast_assign(
> +                       __entry->unmapped = unmapped;
> +                       ),
> +               TP_printk("Purging %u vmaps", __entry->unmapped)
> +);
> +
>  #endif
>
>  #undef TRACE_INCLUDE_PATH
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
