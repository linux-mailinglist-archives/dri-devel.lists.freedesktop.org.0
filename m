Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D852004A
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 16:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72CE10E64B;
	Mon,  9 May 2022 14:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4200A10E64B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 14:48:34 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id s14so14071742plk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=le+V6e4GCxoCXT+GItDLZdCPy6a3vglVZSiNOo5j2g0=;
 b=JTCVn6kLaJ2rAN+GAGjxvevoLo2JdAJ0GcYTuUNOhkf8NIpHLVYEAqo+xVwwuyO/lN
 hcvSeq2jELlbw1x0h3fVwGKkm/pdlOJLzHma8whW8o8SYQLcLoSAl+b11ptPkO3dRk4A
 i1dEExRo/E+KDwGLzuAJCNiSEva+xS0hJ/WC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=le+V6e4GCxoCXT+GItDLZdCPy6a3vglVZSiNOo5j2g0=;
 b=0ChdqXBRMRtDZyrhh1WhzVeBkznAS2yDUzXXb24uWlnomn3fWAu/ncnbBMR2Nyt87G
 YdK+5TJQX+OpOxfaUDTmtuJaBafceKvnEQoq5JqEYZFV/m59zWRvMAVz8UeOzQh8ISmL
 OFr4qb0eFy1M/SwfNJ3BUZ4wT1i8N1vNrArBLg6k/AvQhGDg5jACtNtpI1D4s1KTHun5
 xh61efud77e/V9c0vp8Cl3fxxmIC5M8pLMLeiBw/irijwT6T1YxpZbBxpJIT0Xe7NmKu
 727x1S903D1Caq44+5Z5wKTIZX99DDlhSNmJOgZSzjgWtjo+RZLOkwCXhaN3XRBjZ2IF
 B8rA==
X-Gm-Message-State: AOAM5308iBi2xLmhAxkAbCpeZ+VuCfrciEFrYTB4Be3AHyAx6gy7mOif
 zqIr2iy5fCT20n+4u6ooRr/j7OlGxw1o4u6ZJAXegBvzhZd27g==
X-Google-Smtp-Source: ABdhPJwK/8iBFTo0xhd+wzH9sjfNp9i6jaXaApmYpJa6A3MPeYjPirUspWT5Jeyspwfj4xCoomF8bja3efkmRKwZGHs=
X-Received: by 2002:a17:903:230e:b0:15e:d0a1:922f with SMTP id
 d14-20020a170903230e00b0015ed0a1922fmr16652961plh.75.1652107713815; Mon, 09
 May 2022 07:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <Yni0d5Ve2+mJZzDO@kili>
In-Reply-To: <Yni0d5Ve2+mJZzDO@kili>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 9 May 2022 07:48:23 -0700
Message-ID: <CAJs_Fx44WNivGtF1E36Lti5H0J+7VvS-+aKJ25-pTTa4H_-T_g@mail.gmail.com>
Subject: Re: [bug report] drm/msm: devcoredump iommu fault support
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 8, 2022 at 11:28 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Rob Clark,
>
> The patch e25e92e08e32: "drm/msm: devcoredump iommu fault support"
> from Jun 10, 2021, leads to the following Smatch static checker
> warning:
>
> drivers/gpu/drm/msm/msm_gpu.c:418 recover_worker() error: dereferencing freed memory 'gpu'
> drivers/gpu/drm/msm/msm_gpu.c:497 fault_worker() error: dereferencing freed memory 'gpu'
>
> drivers/gpu/drm/msm/msm_gpu.c
>     376 static void recover_worker(struct kthread_work *work)
>     377 {
>     378         struct msm_gpu *gpu = container_of(work, struct msm_gpu, recover_work);
>     379         struct drm_device *dev = gpu->dev;
>     380         struct msm_drm_private *priv = dev->dev_private;
>     381         struct msm_gem_submit *submit;
>     382         struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>     383         char *comm = NULL, *cmd = NULL;
>     384         int i;
>     385
>     386         mutex_lock(&gpu->lock);
>     387
>     388         DRM_DEV_ERROR(dev->dev, "%s: hangcheck recover!\n", gpu->name);
>     389
>     390         submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
>     391         if (submit) {
>     392                 /* Increment the fault counts */
>     393                 submit->queue->faults++;
>     394                 submit->aspace->faults++;
>     395
>     396                 get_comm_cmdline(submit, &comm, &cmd);
>     397
>     398                 if (comm && cmd) {
>     399                         DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
>     400                                 gpu->name, comm, cmd);
>     401
>     402                         msm_rd_dump_submit(priv->hangrd, submit,
>     403                                 "offending task: %s (%s)", comm, cmd);
>     404                 } else {
>     405                         msm_rd_dump_submit(priv->hangrd, submit, NULL);
>     406                 }
>     407         } else {
>     408                 /*
>     409                  * We couldn't attribute this fault to any particular context,
>     410                  * so increment the global fault count instead.
>     411                  */
>     412                 gpu->global_faults++;
>     413         }
>     414
>     415         /* Record the crash state */
>     416         pm_runtime_get_sync(&gpu->pdev->dev);
>     417         msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This function calls:
>
>         dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
>                                                   ^^^
> Which kfrees gpu.

How does the gpu object get kfree'd?  That is the root problem, it
shouldn't be freed until module unload.  I don't think e25e92e08e32:
"drm/msm: devcoredump iommu fault support" is actually related.

Is there a way to reproduce this?

BR,
-R

> --> 418         pm_runtime_put_sync(&gpu->pdev->dev);
>                                      ^^^^^
> The gpu wasn't supposed to be free so a lot of things go wrong from
> this point.
>
>     419
>     420         kfree(cmd);
>     421         kfree(comm);
>     422
>     423         /*
>     424          * Update all the rings with the latest and greatest fence.. this
>     425          * needs to happen after msm_rd_dump_submit() to ensure that the
>     426          * bo's referenced by the offending submit are still around.
>     427          */
>
> regards,
> dan carpenter
