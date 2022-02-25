Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA354C514D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDB710EAEA;
	Fri, 25 Feb 2022 22:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA4310EAEA;
 Fri, 25 Feb 2022 22:13:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d28so6438297wra.4;
 Fri, 25 Feb 2022 14:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fvub+QyCFz4QEI9ir/NnKPK3FMnGBo7v06Vuk7fQ0Sw=;
 b=BOGNzAA5iflwyhEC3o18l9sUhMnv6KXjashq9J6ClButQKmasUMtt8vkKPGJR0WGDJ
 Eu9RhDK3UUYaFKWIOfdX/ncnF7AByZ+4t0yVfT2czN6DrOtbiKk1VniQe/8M8R1AVeym
 XKK0cfeqJfdaItmMcJ50y90w1qOcIB39h4nmEQpR/yJ46IEHeXVvzdF7cu3CLL+Udf1h
 uxdBczvIDty9nDq3D8k3DAUdmzzLmiGGVIA5zUxbVwJVb3PUBoVfP223wXS6s/m/N0YE
 45h5e77OIdcsvRKk/ton3xUcOej4ScU5HwmdXlSO3u7iGoH2xJQJvwj29nV6uF0xR85m
 fO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fvub+QyCFz4QEI9ir/NnKPK3FMnGBo7v06Vuk7fQ0Sw=;
 b=jMutjSIHxFriUlZb9a0PYHq6O5nEpOqrd8YC9ZXTUy7BBbMnsOHCSpUKtvaTw3ZaNs
 T/bXZZSMCwt6Z7wV6l+rzyuZ70fYBQNdzUSaOojYpBotVPxz0z0hqdCg/ocnOn/f9SZS
 jCgsWCo/a/1DtpIj+x1jc+7YIEBfXUBgYsAUNt0+Z9tb3O6ny5fLrJT1ZOVuzcONzyyf
 6V74TOTwhp0w873qayjqJLwgcdP3Fzg9EIRDDLBBYeuBMVuEIqYsjEW/4KxXxSrbTmTq
 2uppT4rHJzvZxP5zdh78p+0eb/aAidJ+xvxpxuUujPod1diSD36WdtBdlxKVlltBTKCS
 bG2Q==
X-Gm-Message-State: AOAM532LTj1qBXx1SCj0+kkCMqJ6cC/oRYjLTX6/MzVe9wPnsR72NY7c
 m8ENdOBwERmFllGY0Hn93o22M/NC+plVOlX173l8cf6i
X-Google-Smtp-Source: ABdhPJwveIMQqTwSIiBLAjZB63N3cmcKmRAPddbsf0evGtTjPoCLjg/1YixxQ9cdei47NO66Xd4LyHyENIWFA3Zb550=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr7648563wrj.297.1645827221588; Fri, 25
 Feb 2022 14:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20220225202614.225197-1-robdclark@gmail.com>
 <20220225202614.225197-3-robdclark@gmail.com>
In-Reply-To: <20220225202614.225197-3-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Feb 2022 14:14:12 -0800
Message-ID: <CAF6AEGvXs9etrtBUP5fAx7z6pLMV76a-FEXrdk2gY8npDHrFnA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Expose client engine utilization via fdinfo
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 12:25 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Similar to AMD commit
> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> infrastructure added in previous patches, we add basic client info
> and GPU engine utilisation for msm.
>
> Example output:
>
>         # cat /proc/`pgrep glmark2`/fdinfo/6
>         pos:    0
>         flags:  02400002
>         mnt_id: 21
>         ino:    162
>         drm-driver:     msm
>         drm-client-id:  7
>         drm-engine-gpu: 1734371319 ns
>         drm-cycles-gpu: 1153645024

Note that it might be useful to have a standardized way to report # of
cycles and max freq, so userspace tool can derive %utilization in
addition to just %busy

BR,
-R

>
> See also: https://patchwork.freedesktop.org/patch/468505/
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 17 ++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.c | 20 ++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.h | 19 +++++++++++++++++++
>  3 files changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 16f37f3d9061..fdf401e6f09e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -911,7 +911,22 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>  };
>
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +       struct drm_file *file = f->private_data;
> +       struct drm_device *dev = file->minor->dev;
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct drm_printer p = drm_seq_file_printer(m);
> +
> +       if (!priv->gpu)
> +               return;
> +
> +       msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
> +}
> +
> +DEFINE_DRM_GEM_FOPS(fops,
> +       .show_fdinfo = msm_fop_show_fdinfo,
> +);
>
>  static const struct drm_driver msm_driver = {
>         .driver_features    = DRIVER_GEM |
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 173ebd449f2f..6302f3fe564b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -4,6 +4,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include "drm/drm_drv.h"
> +
>  #include "msm_gpu.h"
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
> @@ -146,6 +148,15 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>         return 0;
>  }
>
> +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> +                        struct drm_printer *p)
> +{
> +       drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
> +       drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
> +       drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
> +       drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
> +}
> +
>  int msm_gpu_hw_init(struct msm_gpu *gpu)
>  {
>         int ret;
> @@ -643,7 +654,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  {
>         int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
>         volatile struct msm_gpu_submit_stats *stats;
> -       u64 elapsed, clock = 0;
> +       u64 elapsed, clock = 0, cycles;
>         unsigned long flags;
>
>         stats = &ring->memptrs->stats[index];
> @@ -651,12 +662,17 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>         elapsed = (stats->alwayson_end - stats->alwayson_start) * 10000;
>         do_div(elapsed, 192);
>
> +       cycles = stats->cpcycles_end - stats->cpcycles_start;
> +
>         /* Calculate the clock frequency from the number of CP cycles */
>         if (elapsed) {
> -               clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
> +               clock = cycles * 1000;
>                 do_div(clock, elapsed);
>         }
>
> +       submit->queue->ctx->elapsed_ns += elapsed;
> +       submit->queue->ctx->cycles     += cycles;
> +
>         trace_msm_gpu_submit_retired(submit, elapsed, clock,
>                 stats->alwayson_start, stats->alwayson_end);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 696e2ed8a236..ad4fe05dee03 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -328,6 +328,22 @@ struct msm_file_private {
>         struct kref ref;
>         int seqno;
>
> +       /**
> +        * elapsed:
> +        *
> +        * The total (cumulative) elapsed time GPU was busy with rendering
> +        * from this context in ns.
> +        */
> +       uint64_t elapsed_ns;
> +
> +       /**
> +        * cycles:
> +        *
> +        * The total (cumulative) GPU cycles elapsed attributed to this
> +        * context.
> +        */
> +       uint64_t cycles;
> +
>         /**
>          * entities:
>          *
> @@ -511,6 +527,9 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
>  int msm_gpu_pm_suspend(struct msm_gpu *gpu);
>  int msm_gpu_pm_resume(struct msm_gpu *gpu);
>
> +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> +                        struct drm_printer *p);
> +
>  int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
>  struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
>                 u32 id);
> --
> 2.35.1
>
