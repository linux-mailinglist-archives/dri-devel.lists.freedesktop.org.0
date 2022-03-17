Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BD4DC980
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D88910E197;
	Thu, 17 Mar 2022 15:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F1A10E16C;
 Thu, 17 Mar 2022 15:03:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id h16so2717888wmd.0;
 Thu, 17 Mar 2022 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6D/2aZGnY6875EFh+ETsZseL6iAzu/82ojLJG78YCws=;
 b=FTTHOCemfWozPSr8gX8l5dWg1G/wnR7w2M6aOlxOwFgx6ps3obsAt8FtZSZ/YEKj4D
 6sOYVo5l9+eEdsUYJWPMLtD1U86OlzUjqd9voYmMfMoy8cpXTqH/Hdbd97r/buY4+Pqg
 nqsFWh0EVXsKhl61ux49MECgqplDEskANCCtOz9vC2NuUO8l6aDJ8sPfk1k4qBrasi9M
 Fct7+mU8Fwa6wkPWn8of8GzWRHf9oJQ5sYizPBtiUVKLuL7WC+DLCn4yXv71Jk/xAQBC
 MpMNcy9A5q0CWDufuBZvstp/HV/xY9VapxU+kP+7OpVLMrgzN2Q5YlVeMhQKnLUD1oM1
 nnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6D/2aZGnY6875EFh+ETsZseL6iAzu/82ojLJG78YCws=;
 b=UsnS5gkCKdCpBTTQyZEsagcZvhAX7eZXwixZR74p3TxtGgK14f0fBFJcxL+CQJTPwU
 STvSj1v88ZQ+4qohOXUgHry9DnIZeGSsahBhECw+M1a38k7UbexPo9bC3GBlYlx/5Gb9
 ELclIF4mGInfB5yytAh90wAHTBrpWvnkdDl7QiwjU1m29jT1GnfztyloUuDdoasBB5Hg
 OE+2hEdk8WWK2lbbgo62gmUzZfuKi46G9yQE5cftRRWXH/hcrVLrtaMs7RffIvic/7jf
 u/DtNn+UQ4V9nlzkh9eM3m3+wTwEts376a2gA1Vdn1ahwPOK34RHF7GxBlMgIE65Ko73
 ZBGA==
X-Gm-Message-State: AOAM532PN4JrObpkq/eYaMee6nIQ1jq++Gkh/XnFhe/qLL8TrAHSwLmx
 9bqGrbOLX1sxa5BYyEz4zxukUtLcLe8lvmBndW0=
X-Google-Smtp-Source: ABdhPJydCT/vtakfbrKWR+jM9qGo9W4JZv3KtibLEtGonA920Vs0jF6DIVS1wTmv1X1WByZ46++UqLd5CDENDqqK+cA=
X-Received: by 2002:a05:600c:22c4:b0:38c:70f5:25a9 with SMTP id
 4-20020a05600c22c400b0038c70f525a9mr4309084wmg.119.1647529398246; Thu, 17 Mar
 2022 08:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220317002950.193449-1-robdclark@gmail.com>
 <20220317002950.193449-4-robdclark@gmail.com>
 <20220317082121.GH1841@kadam>
In-Reply-To: <20220317082121.GH1841@kadam>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 08:03:59 -0700
Message-ID: <CAF6AEGsnXz05fCnYAvFk+Hp-2z7N1kdVS0kYKn7+ejohLp8H7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Add a way to override processes comm/cmdline
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 1:21 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Mar 16, 2022 at 05:29:45PM -0700, Rob Clark wrote:
> >       switch (param) {
> > +     case MSM_PARAM_COMM:
> > +     case MSM_PARAM_CMDLINE: {
> > +             char *str, **paramp;
> > +
> > +             str = kmalloc(len + 1, GFP_KERNEL);
>
> if (!str)
>         return -ENOMEM;
>
> > +             if (copy_from_user(str, u64_to_user_ptr(value), len)) {
> > +                     kfree(str);
> > +                     return -EFAULT;
> > +             }
> > +
> > +             /* Ensure string is null terminated: */
> > +             str[len] = '\0';
> > +
> > +             if (param == MSM_PARAM_COMM) {
> > +                     paramp = &ctx->comm;
> > +             } else {
> > +                     paramp = &ctx->cmdline;
> > +             }
> > +
> > +             kfree(*paramp);
> > +             *paramp = str;
> > +
> > +             return 0;
> > +     }
> >       case MSM_PARAM_SYSPROF:
> >               if (!capable(CAP_SYS_ADMIN))
> >                       return -EPERM;
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 4ec62b601adc..68f3f8ade76d 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -364,14 +364,21 @@ static void retire_submits(struct msm_gpu *gpu);
> >
> >  static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
> >  {
> > +     struct msm_file_private *ctx = submit->queue->ctx;
> >       struct task_struct *task;
> >
> > +     *comm = kstrdup(ctx->comm, GFP_KERNEL);
> > +     *cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
> > +
> >       task = get_pid_task(submit->pid, PIDTYPE_PID);
> >       if (!task)
> >               return;
> >
> > -     *comm = kstrdup(task->comm, GFP_KERNEL);
> > -     *cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> > +     if (!*comm)
> > +             *comm = kstrdup(task->comm, GFP_KERNEL);
>
> What?
>
> If the first allocation failed, then this one is going to fail as well.
> Just return -ENOMEM.  Or maybe this is meant to be checking for an empty
> string?

fwiw, if ctx->comm is NULL, the kstrdup() will return NULL, so this
isn't intended to deal with OoM, but the case that comm and/or cmdline
is not overridden.

BR,
-R

>
> > +
> > +     if (!*cmd)
> > +             *cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
>
> Same.
>
> >
> >       put_task_struct(task);
> >  }
>
> regards,
> dan carpenter
>
