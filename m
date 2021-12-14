Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD86B474B75
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE4410E12D;
	Tue, 14 Dec 2021 19:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C878903B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 19:03:34 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id p19so19340678qtw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 11:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPut++DE9oSDA7Chd0SjdQdqRXfrEo4dk9mIHr0IEwI=;
 b=kmpqKRnXneoYfsEoIjy2oU4gKiI3YIyrYivpL88Ce7gsi6vwsJWmiAM6ovLZgU14QL
 AWE8I3rlIbmWVDIt2WAsh6rnlRbqJ8yNvF+9CpYvVbjnFg9DFimIJ/CR6spR9kYPcEts
 k/RJYsmNVVlkYMBmLW2w5dJ7/2QY3zdO0Od6+mtG9mo4Ycl6Zz7QvNugwNLkcyib8nQD
 kdhm9AhH4HZ8EpHMYoy9Y9IQE3584FpiwovBTlmGIUNB9s/It8xRpfLRkH0R7ZhNP4VO
 krwitEO0V0hVyz/znayeGuu6H3HBfpwxRZIYLKn71ovidZ/HECUkZPJMz7zbyav9HkxJ
 jp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPut++DE9oSDA7Chd0SjdQdqRXfrEo4dk9mIHr0IEwI=;
 b=Yw9N0GxggUdKST2F6o+pklS1hRGeSuCiZ+XHjUN/CeRfxUBxlxcbncIMjU5hm0QRaX
 9gx5UoUV6Wsw0fLOXdxbh8OcECFxhQZ2O+/51Oax3dklseBDjSWvifiaeKLZTvbCfEHg
 yxt2qgC1yjxboHIjGS65PgjRMwomtwI5UjBlFnvxpF21e6RouGqGaeGRP1eYh1XJh0F9
 jl1/u3aEIyVERaRLg2HUHT8qegGyiarlXDU+6+2PTkKjXhgNLyhNXzrxyGlFdg8cgsth
 18V8/MXd07p2ug9LNtcZQtncg1b0KozoG2eq7NetR2W9FJPt5udiqy5TI1U5OUOLDEhc
 mjdQ==
X-Gm-Message-State: AOAM531ZTmVTJ3rpYuxzHGD5xuivm9fDqnLaYTlAh3WKu1XuDlK1Z0+W
 ODSygheks94m3i+UAQerSGmbeqguu5WSvWh1vLnLMQ==
X-Google-Smtp-Source: ABdhPJzyRs/SkZa7rM8wtTsEOtQ+XLrgBbLZgqv/9SuBSu3jfTTmtv87+/mDKeEDQ/0sgKqI7jAue3Wsf24yk+u2F5w=
X-Received: by 2002:a05:622a:40d:: with SMTP id
 n13mr8112713qtx.511.1639508612966; 
 Tue, 14 Dec 2021 11:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20211214173917.1496290-1-robdclark@gmail.com>
 <20211214173917.1496290-4-robdclark@gmail.com>
In-Reply-To: <20211214173917.1496290-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Dec 2021 22:03:22 +0300
Message-ID: <CAA8EJpo2ng0mVk0Hsqmg5yTi3Wm0nUp8Lx8+CGF=RBeuYPmviQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/debugfs: Add display/kms state snapshot
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Dec 2021 at 20:34, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c | 90 +++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 956b1efc3721..088f1160c892 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -15,6 +15,11 @@
>  #include "msm_gpu.h"
>  #include "msm_kms.h"
>  #include "msm_debugfs.h"
> +#include "disp/msm_disp_snapshot.h"
> +
> +/*
> + * GPU Snapshot:
> + */
>
>  struct msm_gpu_show_priv {
>         struct msm_gpu_state *state;
> @@ -109,6 +114,88 @@ static const struct file_operations msm_gpu_fops = {
>         .release = msm_gpu_release,
>  };
>
> +/*
> + * Display Snapshot:
> + */
> +
> +struct msm_kms_show_priv {
> +       struct msm_disp_state *state;
> +       struct drm_device *dev;

I don't see ->dev being used outside of _open() callback. So, I'd
suggest removing it and using struct msm_disp_state instead of struct
msm_kms_show_priv.

> +};
> +
> +static int msm_kms_show(struct seq_file *m, void *arg)
> +{
> +       struct drm_printer p = drm_seq_file_printer(m);
> +       struct msm_kms_show_priv *show_priv = m->private;
> +
> +       msm_disp_state_print(show_priv->state, &p);
> +
> +       return 0;
> +}
> +
> +static int msm_kms_release(struct inode *inode, struct file *file)
> +{
> +       struct seq_file *m = file->private_data;
> +       struct msm_kms_show_priv *show_priv = m->private;
> +
> +       msm_disp_state_free(show_priv->state);
> +       kfree(show_priv);
> +
> +       return single_release(inode, file);
> +}
> +
> +static int msm_kms_open(struct inode *inode, struct file *file)
> +{
> +       struct drm_device *dev = inode->i_private;
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_kms_show_priv *show_priv;
> +       int ret;
> +
> +       if (!priv->kms)
> +               return -ENODEV;
> +
> +       show_priv = kmalloc(sizeof(*show_priv), GFP_KERNEL);
> +       if (!show_priv)
> +               return -ENOMEM;
> +
> +       ret = mutex_lock_interruptible(&priv->kms->dump_mutex);
> +       if (ret)
> +               goto free_priv;
> +
> +       show_priv->state = msm_disp_snapshot_state_sync(priv->kms);
> +
> +       mutex_unlock(&priv->kms->dump_mutex);
> +
> +       if (IS_ERR(show_priv->state)) {
> +               ret = PTR_ERR(show_priv->state);
> +               goto free_priv;
> +       }
> +
> +       show_priv->dev = dev;
> +
> +       ret = single_open(file, msm_kms_show, show_priv);
> +       if (ret)
> +               goto free_priv;
> +
> +       return 0;
> +
> +free_priv:
> +       kfree(show_priv);
> +       return ret;
> +}
> +
> +static const struct file_operations msm_kms_fops = {
> +       .owner = THIS_MODULE,
> +       .open = msm_kms_open,
> +       .read = seq_read,
> +       .llseek = seq_lseek,
> +       .release = msm_kms_release,
> +};
> +
> +/*
> + * Other debugfs:
> + */
> +
>  static unsigned long last_shrink_freed;
>
>  static int
> @@ -239,6 +326,9 @@ void msm_debugfs_init(struct drm_minor *minor)
>         debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
>                 dev, &msm_gpu_fops);
>
> +       debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
> +               dev, &msm_kms_fops);
> +
>         debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
>                 &priv->hangcheck_period);
>
> --
> 2.33.1
>


-- 
With best wishes
Dmitry
