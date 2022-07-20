Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D457BD63
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 20:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F8C10F6E6;
	Wed, 20 Jul 2022 18:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519BD112EA3;
 Wed, 20 Jul 2022 18:06:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bu1so27229460wrb.9;
 Wed, 20 Jul 2022 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0XGKnzbMlHj8GUec+IENgeIL+e8Iozm5CYX6A25Jtb4=;
 b=PrnMQ8vHhngi5J7j1BVnxFKb/74czR3F267cpgzjf2pGO01ccscPJKZpsuemgRg4hU
 pwDFIuAaoXfu1Tdzl2yHqgVe3j6kt329wRISAkepEa/JFWEUmtURCyLULIB/tej25wR0
 Eho9ym6aP5W8rc4DluksS5/iy0SnNdXMWxRXGOR3/7e7vd+cOWgMo4uAYetQqGAN90Wz
 ICdZ9YqX7fH2AapH+RQpbffvOWJMQxkjknb0Aa9pNUoVuxrznuiQX1iaW9yd8rMUgxsy
 v1NSzr85Ua55QoNfQaFS/FEpMTx7vPZtxyeAveL37xKUP/+25dMgcuuYoIJAEeDLNJfI
 raqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0XGKnzbMlHj8GUec+IENgeIL+e8Iozm5CYX6A25Jtb4=;
 b=Q63Pz3OyETy1A79XvpxHY/lN2NF9AV5ZZ6Azgi3lRs497f3ILH59Idc1d0yPB+x9gM
 t8786Ix0wsbe3AyQJmOQx8bf3d4/J7RX6UZ6tRP9jYhx0+gz4T7NGPOXSDXdIzhLhwd0
 VmZTVU8w9YGbKP5ufgbUBw9DSu2yxZcQXMagHIYnHIgkX+stRbBtDuiySsUUwNzZ0yn/
 f/a3UcSOcyRwuBJeD6xayLGxlq/Vdgoy4SVit1QBkeTrsJF5DQ/Mr4swkK26VbHi8d7H
 YuDa6VJ9mst+fXl8syGFIzK+urZZGY0G4ZMsZkDOsBzyw+1ZV8uNF3n2jGd59SyP6cD9
 Qtfg==
X-Gm-Message-State: AJIora90vHV4OQIaLB4v4gZqNnrfJpuz5Ey7bTQ8cbwJwLKs1iFGJc8u
 7Sad9+fobqku77sFYUETpykwRjw9hMhbay+qr0k=
X-Google-Smtp-Source: AGRyM1uV3du6LMb0MF9Xsx7pwJt117rZWWe6Qxgvs8U23ehNnT/6d9KIkiaDDj5Pq81JRm5DrR/zwX1CLQj32uOhIVo=
X-Received: by 2002:adf:e187:0:b0:21d:64c6:74f0 with SMTP id
 az7-20020adfe187000000b0021d64c674f0mr30710994wrb.221.1658340383459; Wed, 20
 Jul 2022 11:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
 <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
 <1299312f-e614-e4e2-72cb-fd7fb99922ce@quicinc.com>
 <CAF6AEGvjD3LRm40mPr4n+jzx71WmwYpVWizUDLct9cgafjFRyw@mail.gmail.com>
 <3c150bc9-68a0-7a35-6511-f80a42e8945b@quicinc.com>
In-Reply-To: <3c150bc9-68a0-7a35-6511-f80a42e8945b@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Jul 2022 11:06:45 -0700
Message-ID: <CAF6AEGsQqE+5iE-=ja96wS6EMN1K1PzCa2fRA6DvQWwyqBq3NA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm: Fix cx collapse issue during
 recovery
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse <jordan@cosmicpenguin.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 12:15 PM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 7/12/2022 10:14 PM, Rob Clark wrote:
> > On Mon, Jul 11, 2022 at 10:05 PM Akhil P Oommen
> > <quic_akhilpo@quicinc.com> wrote:
> >> On 7/12/2022 4:52 AM, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>> There are some hardware logic under CX domain. For a successful
> >>>> recovery, we should ensure cx headswitch collapses to ensure all the
> >>>> stale states are cleard out. This is especially true to for a6xx family
> >>>> where we can GMU co-processor.
> >>>>
> >>>> Currently, cx doesn't collapse due to a devlink between gpu and its
> >>>> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
> >>>> that the iommu driver removes its vote on cx gdsc.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>> ---
> >>>>
> >>>> (no changes since v1)
> >>>>
> >>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
> >>>>    drivers/gpu/drm/msm/msm_gpu.c         |  2 --
> >>>>    2 files changed, 14 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> index 4d50110..7ed347c 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
> >>>>            */
> >>>>           gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> >>>>
> >>>> -       gpu->funcs->pm_suspend(gpu);
> >>>> -       gpu->funcs->pm_resume(gpu);
> >>>> +       /*
> >>>> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
> >>>> +        * First drop the usage count from all active submits
> >>>> +        */
> >>>> +       for (i = gpu->active_submits; i > 0; i--)
> >>>> +               pm_runtime_put(&gpu->pdev->dev);
> >>>> +
> >>>> +       /* And the final one from recover worker */
> >>>> +       pm_runtime_put_sync(&gpu->pdev->dev);
> >>>> +
> >>>> +       for (i = gpu->active_submits; i > 0; i--)
> >>>> +               pm_runtime_get(&gpu->pdev->dev);
> >>>> +
> >>>> +       pm_runtime_get_sync(&gpu->pdev->dev);
> >>> In response to v1, Rob suggested pm_runtime_force_suspend/resume().
> >>> Those seem like they would work to me, too. Why not use them?
> >> Quoting my previous response which I seem to have sent only to Freedreno
> >> list:
> >>
> >> "I believe it is supposed to be used only during system sleep state
> >> transitions. Btw, we don't want pm_runtime_get() calls from elsewhere to
> >> fail by disabling RPM here."
> > The comment about not wanting other runpm calls to fail is valid.. but
> > that is also solveable, ie. by holding a lock around runpm calls.
> > Which I think we need to do anyways, otherwise looping over
> > gpu->active_submits is racey..
> >
> > I think pm_runtime_force_suspend/resume() is the least-bad option.. or
> > at least I'm not seeing any obvious alternative that is better
> >
> > BR,
> > -R
> We are holding gpu->lock here which will block further submissions from
> scheduler. Will active_submits still race?
>
> It is possible that there is another thread which successfully completed
> pm_runtime_get() and while it access the hardware, we pulled the plug on
> regulator/clock here. That will result in obvious device crash. So I can
> think of 2 solutions:
>
> 1. wrap *every* pm_runtime_get/put with a mutex. Something like:
>              mutex_lock();
>              pm_runtime_get();
>              < ... access hardware here >>
>              pm_runtime_put();
>              mutex_unlock();
>
> 2. Drop runtime votes from every submit in recover worker and wait/poll
> for regulator to collapse in case there are transient votes on
> regulator  from other threads/subsystems.
>
> Option (2) seems simpler to me.  What do you think?
>

But I think without #1 you could still be racing w/ some other path
that touches the hw, like devfreq, right.  They could be holding a
runpm ref, so even if you loop over active_submits decrementing the
runpm ref, it still doesn't drop to zero

BR,
-R
