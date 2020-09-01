Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F80259581
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 17:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3A16E87C;
	Tue,  1 Sep 2020 15:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC296E87C;
 Tue,  1 Sep 2020 15:53:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o5so2082456wrn.13;
 Tue, 01 Sep 2020 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BY4bXKc0xSgKW8hDeDD9u95KOuc3RBx/gc2Fu/W48eQ=;
 b=TBqWWrSB1mvUqsytHINsQUCpaD6PqLh3UsHJMRUkGwH/66biENmlSfUhshtvyFx1Jl
 Xm0W8v8iKkFOcdwlTL6nLnBqWo29CyX2TENRlw+7jc3NGK86XiruLidBhNmVttRUPs36
 LfzPsLKO8sOVbxnG5K3VaHG3CgZEMEConRc7AIKSnvCz2lQI2jXmSmo47D3DH2EVKIe7
 +716NNemet7lsA6Cel/JHnqqvzqRw7d6Q0bdmZn91FGsOYklnoY9Pd5xUlgENa1Qnr3l
 Vr9BpGca6oaWmy2J9JHDdL7RKAd04P1S/x/kgTGyfh+1EOOPBVSqethI5oTYr8bLFwhE
 x5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BY4bXKc0xSgKW8hDeDD9u95KOuc3RBx/gc2Fu/W48eQ=;
 b=QWQGStMmckON0679kxr4WdpFL9mB5ApsTOSPb6w9aLDXeQhB87AcUG8U+bNDViHRmj
 6ShOOM7vxYCaMJjsW9aLN5xJ+C7Qb/gUbdKaPZauqUQ40DoqsmlAnSyaETMYCnxjAQkO
 gb3ovV31Mi/QPRejS8qUEJs6mkszy3aSFkmyRuAjgRkyWFE/ZO7y/lK4TgRm3VtqAoG5
 r7UIk6y4gAgue17vFm9TUtyUDjuolDIqPrdAALYAOgEZvbPtxZ+ydVQkDLQnCV60eBTG
 XYGwQ6L5UQyfglXLqfaoNnAKbTTdpbS+TwU5dK8je+ftXJjOvJd+zQMnif0CxEDAQyF5
 kDjw==
X-Gm-Message-State: AOAM531PoHf72niVRAWEr9iN9A9Hlu7aao+wXS/cjBmlIGHaleKsbEF1
 4yVtwSHJfcxf2Zr1j/vpzciWLua7NLrlEhdJo/g=
X-Google-Smtp-Source: ABdhPJzDoeC0Pb4kh7G7ViZBofzjFA7/roqtprdLHZ43CwlP1yJxepquJBwNWHIMnMPZtjY/Vti5ADETxrYodXZvEfo=
X-Received: by 2002:adf:f382:: with SMTP id m2mr2458894wro.327.1598975584169; 
 Tue, 01 Sep 2020 08:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-7-robdclark@gmail.com> <20200901043211.GN3715@yoga>
In-Reply-To: <20200901043211.GN3715@yoga>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Sep 2020 08:53:50 -0700
Message-ID: <CAF6AEGthzRwUZby6XsToNpSbx0ad3hZWN2QM+qipR2zDDi-ySw@mail.gmail.com>
Subject: Re: [PATCH 06/19] drm/msm/gpu: add dev_to_gpu() helper
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 9:32 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In a later patch, the drvdata will not directly be 'struct msm_gpu *',
> > so add a helper to reduce the churn.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
> >  drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
> >  drivers/gpu/drm/msm/msm_gpu.h              |  5 +++++
> >  3 files changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 9eeb46bf2a5d..26664e1b30c0 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -282,7 +282,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
> >       int ret;
> >
> >       if (pdev)
> > -             gpu = platform_get_drvdata(pdev);
> > +             gpu = dev_to_gpu(&pdev->dev);
> >
> >       if (!gpu) {
> >               dev_err_once(dev->dev, "no GPU device was found\n");
> > @@ -425,7 +425,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >  static void adreno_unbind(struct device *dev, struct device *master,
> >               void *data)
> >  {
> > -     struct msm_gpu *gpu = dev_get_drvdata(dev);
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       pm_runtime_force_suspend(dev);
> >       gpu->funcs->destroy(gpu);
> > @@ -490,16 +490,14 @@ static const struct of_device_id dt_match[] = {
> >  #ifdef CONFIG_PM
> >  static int adreno_resume(struct device *dev)
> >  {
> > -     struct platform_device *pdev = to_platform_device(dev);
> > -     struct msm_gpu *gpu = platform_get_drvdata(pdev);
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       return gpu->funcs->pm_resume(gpu);
> >  }
> >
> >  static int adreno_suspend(struct device *dev)
> >  {
> > -     struct platform_device *pdev = to_platform_device(dev);
> > -     struct msm_gpu *gpu = platform_get_drvdata(pdev);
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       return gpu->funcs->pm_suspend(gpu);
> >  }
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index d5645472b25d..6aa9e04e52e7 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -24,7 +24,7 @@
> >  static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >               u32 flags)
> >  {
> > -     struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >       struct dev_pm_opp *opp;
> >
> >       opp = devfreq_recommended_opp(dev, freq, flags);
> > @@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >  static int msm_devfreq_get_dev_status(struct device *dev,
> >               struct devfreq_dev_status *status)
> >  {
> > -     struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >       ktime_t time;
> >
> >       if (gpu->funcs->gpu_get_freq)
> > @@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
> >
> >  static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> >  {
> > -     struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       if (gpu->funcs->gpu_get_freq)
> >               *freq = gpu->funcs->gpu_get_freq(gpu);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 0db117a7339b..8bda7beaed4b 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -141,6 +141,11 @@ struct msm_gpu {
> >       struct msm_gpu_state *crashstate;
> >  };
> >
> > +static inline struct msm_gpu *dev_to_gpu(struct device *dev)
>
> That's a fairly generic name for a driver-global helper :)

tbf, it is only global to the gpu part of the driver..

thanks for the review

BR,
-R

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
>
> > +{
> > +     return dev_get_drvdata(dev);
> > +}
> > +
> >  /* It turns out that all targets use the same ringbuffer size */
> >  #define MSM_GPU_RINGBUFFER_SZ SZ_32K
> >  #define MSM_GPU_RINGBUFFER_BLKSIZE 32
> > --
> > 2.26.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
