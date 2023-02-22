Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9FB69FA5C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0C610E2EA;
	Wed, 22 Feb 2023 17:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B3110E2EA;
 Wed, 22 Feb 2023 17:47:17 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bi17so8722191oib.3;
 Wed, 22 Feb 2023 09:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oXuZiVkdxXl94pWmoBOSfddctzecfqzqWUepbQog4+M=;
 b=d+XcrYZdGh9ImNucjkTcaP9Levht/SReyRHCSmQPYGN/mGIoju7vfneKS+9KQOdKXx
 oaPGlW7+z6SSca87Tr8fhNnCoCU07En/4o5zDrMill+HL20fc4JQOVZJCY7pbyFjVq8D
 hxnqNRZ6WBXzSUKZOyigcl7nQazxfn2NksxLeNVL8FfUW7R5MYfzPmTpmBXJtfOOAb24
 BoFjHOvyRQJNYysRp4sSY9KRaw2Rm5ujegKYNcpWyP5Vb+wfzUZp4tVzknvL5NNjxmTK
 CUTKy44x57pD6dFBHgFqVg6qvA5BFmYEMqvChMILPXdoOvWCz6ouLFIsP7yiA/dv+RAj
 JonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXuZiVkdxXl94pWmoBOSfddctzecfqzqWUepbQog4+M=;
 b=c+61FuZM6+pD3VPfKqq+qTGUzLdT7ABC8OOWOrfwVjEIg9St/FnLW3TehweXlcCaca
 FOdOGUc/pT6D/j2vYm8b2tkcI1ksnqZqivm/pVGt8ZYFlSpKIm4VS0MxNU344wz0Rfjz
 wIaDyB+uLDMTtrIyz9VHG4LBd4OZsS5d6I6hNExMWJ43HzGhBid0y/7HdYg1YTtgMh/Y
 U++9HoafnJZnYGeK5ikOJd9xpqsLPhFtWgIEjhFYG/a/dOV9Bh5FX0waISA6DEWW73Mq
 ZZUYFNknesAUIQ92PotjzlkRLdp8IH2uc7mx/f1XfCz8ltiOKVW8grlmPauMXojJpspW
 l7UA==
X-Gm-Message-State: AO0yUKXBMa1ShMjEy+D3xbh5fxM+YBXQhP4K/6O3m35Hu2ZmEVMD0M8q
 i5PfODzjySC0UIsPKvSGwa6IU7rA1B0g2hcjLEQ=
X-Google-Smtp-Source: AK7set9zfy4HxzzpDn0lFFE16Ew1ffKzEzp9s80BgsQ4DxHCqImlxUG3qI9dx3bOf7wNVB8bfJWMfs8rbYCThAo9jJQ=
X-Received: by 2002:a05:6808:16ab:b0:37d:81a9:5103 with SMTP id
 bb43-20020a05680816ab00b0037d81a95103mr1441359oib.38.1677088036803; Wed, 22
 Feb 2023 09:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
 <20230218012546.3655999-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230218012546.3655999-2-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 09:47:05 -0800
Message-ID: <CAF6AEGsRA+sV9PpdDxpZ_eFVoV6+GJpB1tHf8190F3YNR5CMQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: drop unused ring variable in
 msm_ioctl_gem_submit()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 5:25 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The variable ring is not used by msm_parse_deps() and
> msm_ioctl_gem_submit() and thus can be dropped.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
>  drivers/gpu/drm/msm/msm_gpu_trace.h  | 10 ++++------
>  2 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index ac8ed731f76d..a539eb31042f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
>                                             struct drm_file *file,
>                                             uint64_t in_syncobjs_addr,
>                                             uint32_t nr_in_syncobjs,
> -                                           size_t syncobj_stride,
> -                                           struct msm_ringbuffer *ring)
> +                                           size_t syncobj_stride)
>  {
>         struct drm_syncobj **syncobjs = NULL;
>         struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
> @@ -722,7 +721,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         struct msm_gem_submit *submit;
>         struct msm_gpu *gpu = priv->gpu;
>         struct msm_gpu_submitqueue *queue;
> -       struct msm_ringbuffer *ring;
>         struct msm_submit_post_dep *post_deps = NULL;
>         struct drm_syncobj **syncobjs_to_reset = NULL;
>         int out_fence_fd = -1;
> @@ -760,8 +758,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (!queue)
>                 return -ENOENT;
>
> -       ring = gpu->rb[queue->ring_nr];
> -
>         if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>                 out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
>                 if (out_fence_fd < 0) {
> @@ -774,7 +770,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (IS_ERR(submit))
>                 return PTR_ERR(submit);
>
> -       trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
> +       trace_msm_gpu_submit(pid_nr(submit->pid), submit->ident,
>                 args->nr_bos, args->nr_cmds);

Please don't remove things from the tracepoint, we have userspace
tools that use the tracepoints..

Other parts look ok.

BR,
-R

>
>         ret = mutex_lock_interruptible(&queue->lock);
> @@ -803,7 +799,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 syncobjs_to_reset = msm_parse_deps(submit, file,
>                                                    args->in_syncobjs,
>                                                    args->nr_in_syncobjs,
> -                                                  args->syncobj_stride, ring);
> +                                                  args->syncobj_stride);
>                 if (IS_ERR(syncobjs_to_reset)) {
>                         ret = PTR_ERR(syncobjs_to_reset);
>                         goto out_unlock;
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index ac40d857bc45..12ef10f1de4c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -9,24 +9,22 @@
>  #define TRACE_INCLUDE_FILE msm_gpu_trace
>
>  TRACE_EVENT(msm_gpu_submit,
> -           TP_PROTO(pid_t pid, u32 ringid, u32 id, u32 nr_bos, u32 nr_cmds),
> -           TP_ARGS(pid, ringid, id, nr_bos, nr_cmds),
> +           TP_PROTO(pid_t pid, u32 id, u32 nr_bos, u32 nr_cmds),
> +           TP_ARGS(pid, id, nr_bos, nr_cmds),
>             TP_STRUCT__entry(
>                     __field(pid_t, pid)
>                     __field(u32, id)
> -                   __field(u32, ringid)
>                     __field(u32, nr_cmds)
>                     __field(u32, nr_bos)
>                     ),
>             TP_fast_assign(
>                     __entry->pid = pid;
>                     __entry->id = id;
> -                   __entry->ringid = ringid;
>                     __entry->nr_bos = nr_bos;
>                     __entry->nr_cmds = nr_cmds
>                     ),
> -           TP_printk("id=%d pid=%d ring=%d bos=%d cmds=%d",
> -                   __entry->id, __entry->pid, __entry->ringid,
> +           TP_printk("id=%d pid=%d bos=%d cmds=%d",
> +                   __entry->id, __entry->pid,
>                     __entry->nr_bos, __entry->nr_cmds)
>  );
>
> --
> 2.39.1
>
