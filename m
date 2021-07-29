Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DE3DAD62
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413186EE50;
	Thu, 29 Jul 2021 20:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CB26EE4E;
 Thu, 29 Jul 2021 20:20:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u15so4505485wmj.1;
 Thu, 29 Jul 2021 13:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4mYJxtg2BzV1dCKk+R2O33QKQKgHpoQrEfnqJMGvoOU=;
 b=s47z2Leq1dyPdLAOq5E3e7JmSQJqfawmN1oDTLcJkmlivlUVGpPThl6ZwINEh8ShrG
 cmfcPeV+5UtuG/sD7hA6uD/WYcnFkiye8UMwMQDzWmwugU5X1iuaongLKNibULZe/Ggu
 NNt0ZD/9Q6Ky9nTB+1+vnoKwjmBldVnWZbnLiHjYiCDmVdvZMEOHFkCXPg5l9LV/Syzo
 kFkQu/p6XPBSKkrvUipooKYnDIlDeR7NkevGvKqNQoVoXa9Bhn2BYfZ24kiAM2tmxg7H
 PtK9eHAMNZx04wDhwaPyk2lCic78i+2kqn90epzPILHDQZXe4sJJjg1bUGtKyKpF0YDL
 8DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mYJxtg2BzV1dCKk+R2O33QKQKgHpoQrEfnqJMGvoOU=;
 b=MklVIJgiuy88Z6fKsRCyF48sa2Bj95pxm32I3qGYwZtLOqEOr+wzaXNDtwp1ZuWpB4
 YyWguiJfpbaAgogreM2Lw4Gx/69MfCagUM8a7FO/hA+kwn4tcz4XA1onYpSICY6PHtK6
 m2DQD7/k8G+25tNHGcixmInTkr1UMFm/A1wWw0s6+rfc8X6D+U1lETUEk8Ixnm+mjhrz
 ZF2hvwO3MGhVoygvj6udWIkuUzqJXZbxEAfZwb3aPWZ8eXp+u8NVEjcb9MpafBA4qvai
 6x6oJu6gsA87aPNt7jxZ5Lg9yv1m7L9xL425H9UWSong7pdwrCER/f01okW4KiV9+neR
 9XYA==
X-Gm-Message-State: AOAM530zcrWJqYWzSiWFCOXTnOkQZQ3odFGazFynWEFzsTS2VQqqnuW/
 BBqJFYlsFMxRT2jk2Q3UVBP7YMYQjYps8k5Jczo=
X-Google-Smtp-Source: ABdhPJyH11WK0huXceMHfYyDe2v1deyA1P4BwAJFHZNK9evo7CLvUqRxBUAorguOtL5HcEoQ0/ZfCR5Ek9eNrooZjx0=
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr6492155wmq.175.1627590016161; 
 Thu, 29 Jul 2021 13:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
In-Reply-To: <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 13:24:25 -0700
Message-ID: <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Caleb Connolly <caleb.connolly@linaro.org>
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
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi Rob,
>
> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.

*ohh*, yeah, ok, that would explain it

> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> at the higher frequencies.
>
> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> glxgear.
>
> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> at the voltage the hardware needs to be stable.
>
> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
>

tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
on CC and I added sboyd, maybe one of them knows better.

In the short term, removing the higher problematic OPPs from dts might
be a better option than this patch (which I'm dropping), since there
is nothing stopping other workloads from hitting higher OPPs.

I'm slightly curious why I didn't have problems at higher OPPs on my
c630 laptop (sdm850)

BR,
-R

>
> On 29/07/2021 19:39, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The more frequent frequency transitions resulting from clamping freq to
> > minimum when the GPU is idle seems to be causing some issue with the bus
> > getting voted off when it should be on.  (An enable racing with an async
> > disable?)  This might be a problem outside of the GPU, as I can't
> > reproduce this on a618 which uses the same GMU fw and same mechanism to
> > communicate with GMU to set opp.  For now, just revert to previous
> > devfreq behavior on a630 until the issue is understood.
> >
> > Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> > Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
> >   drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 12 ++++++++++++
> >   3 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 748665232d29..9fd08b413010 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >       pm_runtime_use_autosuspend(dev);
> >       pm_runtime_enable(dev);
> >
> > +     if (adreno_is_a630(adreno_gpu))
> > +             gpu->devfreq.disable_freq_clamping = true;
> > +
> >       return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
> >                       adreno_gpu->info->name, &adreno_gpu_config);
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 0e4b45bff2e6..7e11b667f939 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -112,6 +112,8 @@ struct msm_gpu_devfreq {
> >        * it is inactive.
> >        */
> >       unsigned long idle_freq;
> > +
> > +     bool disable_freq_clamping;
> >   };
> >
> >   struct msm_gpu {
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index 0a1ee20296a2..a832af436251 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -94,6 +94,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
> >       if (!gpu->funcs->gpu_busy)
> >               return;
> >
> > +     /* Revert to previous polling interval if we aren't using freq clamping
> > +      * to preserve previous behavior
> > +      */
> > +     if (gpu->devfreq.disable_freq_clamping)
> > +             msm_devfreq_profile.polling_ms = 10;
> > +
> >       msm_devfreq_profile.initial_freq = gpu->fast_rate;
> >
> >       /*
> > @@ -151,6 +157,9 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >       unsigned int idle_time;
> >       unsigned long target_freq = df->idle_freq;
> >
> > +     if (gpu->devfreq.disable_freq_clamping)
> > +             return;
> > +
> >       /*
> >        * Hold devfreq lock to synchronize with get_dev_status()/
> >        * target() callbacks
> > @@ -186,6 +195,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >       unsigned long idle_freq, target_freq = 0;
> >
> > +     if (gpu->devfreq.disable_freq_clamping)
> > +             return;
> > +
> >       /*
> >        * Hold devfreq lock to synchronize with get_dev_status()/
> >        * target() callbacks
> >
>
> --
> Kind Regards,
> Caleb (they/them)
