Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E126DBAE6
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 14:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4889710E15F;
	Sat,  8 Apr 2023 12:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFD38876A;
 Sat,  8 Apr 2023 12:28:17 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id m16so30759094ybk.0;
 Sat, 08 Apr 2023 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680956896; x=1683548896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xesmN7ACvFsONZVtIWgg/NPtUmXwqhWd4yT+IAnjfP4=;
 b=qZAg5MBr717O6bx0hgvhFUHBeDocPLLbIuA4KYCL38V8KmSODY3s29neoV0F+KxB+t
 uVdJRLOkJJ/TFr4CqqAFxKHHyIZiAQYiFHOvIpDwZ7RfFS8lTjrA68zg68wyKX3/XOeS
 ils7qUiFHh3I1dzvFQqWhiIgcc3Qk59aHiQA5gqJjP/i1RnyH1bYLu2SiINjgmHZ8l+N
 9cItVocN4nwDjALaZDuOIKRIScblnBOByJbDfHd0sTg3KyBmDPhNTvfGe+2gRsF/ouUn
 XdzsbLap+ojWLYG2FRj8jeLCQ/WaGGKCb7db7/oUCAfwxs8oAJjm3599KC6+fNxRUVkp
 usug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680956896; x=1683548896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xesmN7ACvFsONZVtIWgg/NPtUmXwqhWd4yT+IAnjfP4=;
 b=AOJFF4zrPk9y/Hrk3iLRECPLbnXD6jBU3Jx0Afz/Nr4jTISsgkUpteI56PvEAkqayU
 BRhAWqNNOOQlJ9P3W+AeAtP1zRdHSdBw6LTKTTCt2YblaKQaV2vV0mi+VIwdmnxr6y+J
 FoHhUOsBulEWuMmjk5pgAtOLY6yVy2saWeI8AKAlPdUw2znC7VfNDqnGcD/B9emVu2n6
 q/JmlFjqEniuTPHx/7rBf1EEBLX0RrrIeJrMermtitDtacl6WpqLkUS7t0ac3raeJmYe
 8LniU3T1l73dS95IXPh8ZxbbgZcNTwMWFnbskn2W5s+AfDCzGYN0AxXKMgqO8v989gpW
 PG6g==
X-Gm-Message-State: AAQBX9ekkzpP8SWeZDv6OLmTlIeI0P7k8Cyry6VsfI+K1/GcN20Xvamd
 pp/Pdy7fxYVti6vWObZo0vEiHsABZkA1vsxUCSI=
X-Google-Smtp-Source: AKy350aY3jUZf5q2Y/64Ci72Ay5Sn65XYDDQWcwgFPC3PiVDm2NdvEfKa52juQSG5IL+Fu7hfyN+4JOB9Rn/BlI+5m4=
X-Received: by 2002:a25:d657:0:b0:b76:ae61:b68b with SMTP id
 n84-20020a25d657000000b00b76ae61b68bmr2784453ybg.5.1680956896058; Sat, 08 Apr
 2023 05:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230406215917.1475704-1-robdclark@gmail.com>
 <20230406215917.1475704-3-robdclark@gmail.com>
In-Reply-To: <20230406215917.1475704-3-robdclark@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sat, 8 Apr 2023 13:28:04 +0100
Message-ID: <CACvgo50FEYhdpp3nqX-AyAvLK8hJnK2xynTtLnCb9A+GSeHCvg@mail.gmail.com>
Subject: Re: [RFC 2/2] drm/msm: Add memory stats to fdinfo
To: Rob Clark <robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 at 22:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Use the new helper to export stats about memory usage.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.c |  2 --
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9b6f17b1261f..385776f6a531 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1043,17 +1043,40 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>  };
>
> +enum drm_gem_object_status gem_status(struct drm_gem_object *obj)
> +{
> +       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +       enum drm_gem_object_status status = 0;
> +
> +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
> +               status |= DRM_GEM_OBJECT_ACTIVE;
> +
> +       if (msm_obj->pages)
> +               status |= DRM_GEM_OBJECT_RESIDENT;
> +
> +       if (msm_obj->madv == MSM_MADV_DONTNEED)
> +               status |= DRM_GEM_OBJECT_PURGEABLE;
> +
> +       return status;
> +}
> +
>  static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  {
>         struct drm_file *file = f->private_data;
>         struct drm_device *dev = file->minor->dev;
>         struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_file_private *ctx = file->driver_priv;
>         struct drm_printer p = drm_seq_file_printer(m);
>
>         if (!priv->gpu)
>                 return;
>
> -       msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
> +       drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
> +       drm_printf(&p, "drm-client-id:\t%u\n", ctx->seqno);
> +
> +       msm_gpu_show_fdinfo(priv->gpu, ctx, &p);
> +
> +       drm_print_memory_stats(file, &p, gem_status);
>  }
>
>  static const struct file_operations fops = {
> @@ -1067,6 +1090,7 @@ static const struct drm_driver msm_driver = {
>                                 DRIVER_RENDER |
>                                 DRIVER_ATOMIC |
>                                 DRIVER_MODESET |
> +                               DRIVER_SYNCOBJ_TIMELINE |

This line should probably be its own patch. AFAICT it was supported
since ab723b7a992a19b843f798b183f53f7472f598c8, although explicitly
kept disabled until there's userspace/turnip support.

With the above line removed, the patch is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

HTH
Emil
